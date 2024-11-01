Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FD89B888A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Nov 2024 02:33:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t6gX8-0000SC-QE;
	Fri, 01 Nov 2024 01:33:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t6gX6-0000Rl-U1
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Nov 2024 01:33:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KvzPfkb1wjTSQFRK/5Yf3wuMarF2zjoHcU9D1vzUHbE=; b=iVfkG8HPBFjh5w0J8MEj/fGMzt
 L+TD/tGvOjCfUgHpit/k+eyBL3VOQQ3wF7Bw0USln06RBX0vN7X/WIva3wO9cyEfVSJEVX9XDI7s6
 nSnAi8x1v0DT5uZLAUE7x8+22mRayIhImbmIH3NqbQSvcdeh5gwzH91yACrFipxdoUQ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KvzPfkb1wjTSQFRK/5Yf3wuMarF2zjoHcU9D1vzUHbE=; b=fs+daKiLbvpJcLGJVXo8zxSXfd
 UaUdlOPgzMlwNzg1LYmYnYZ6z4/N8SaYUdZwMfds4M8ufH+WV4WX04rdP9QFICcqJ45OARFctRJZa
 rG6TC8Ej7lsB4M1kBq/SMU8kazJCiJWLti6aosMIwfP6wFO/z0Kut9QN0lmp9zopJ6DQ=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t6gX3-0006og-8m for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Nov 2024 01:33:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DB0C2A42C49;
 Fri,  1 Nov 2024 01:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE83BC4CED0;
 Fri,  1 Nov 2024 01:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730424766;
 bh=SBC0caSq81doMxaPvuniaANq63JDI6nXuvCDka/o8gE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=i/cFd9w0U3d+b3wCiVfriTqudh10cBtwQ6SzBVuQKD/jAHacgrVPaFMk/zKAb8XHL
 Gy9dJxH9XXNlQ8ELRnG3LRxrl4TepjYOAgX62T+vwzLHruweMDHbjXJf1xGaMk7Vms
 lOwJL54I3iXkrcZmiog7YgAe0/FVdFKLBbHPE9CnvoFH86hlHBQCSmXwKhroLqSU7D
 7GtNyAniFWQLgngCn4tmu6ygRh9hUSI1znWxseQaoouwJDfZAi9skGUpnGPvNb3lK/
 5BeVmc21hWlw3Ce4+zye+Hk+rY9vbi+yjo3hiPcVhLFo2Jy7NLkY5UvwXtpMfg88ZF
 WRm6ybIp816xA==
Message-ID: <fede8a9b-8532-4d63-a4db-b52ed088d6f8@kernel.org>
Date: Fri, 1 Nov 2024 09:32:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20241031102200.440407-1-chao@kernel.org>
 <ZyQtcbtzpixFd6Zs@google.com>
Content-Language: en-US
In-Reply-To: <ZyQtcbtzpixFd6Zs@google.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/11/1 9:22, Jaegeuk Kim wrote: > On 10/31, Chao Yu
 wrote: >> f2fs_map_blocks() supports to map continuous holes or preallocated
 >> address, we should avoid setting F2FS_MAP_MAPPED for these cas [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t6gX3-0006og-8m
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to map blocks correctly for direct
 read
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: kernel test robot <oliver.sang@intel.com>, linux-kernel@vger.kernel.org,
 Cyril Hrubis <chrubis@suse.cz>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/11/1 9:22, Jaegeuk Kim wrote:
> On 10/31, Chao Yu wrote:
>> f2fs_map_blocks() supports to map continuous holes or preallocated
>> address, we should avoid setting F2FS_MAP_MAPPED for these cases
>> only, otherwise, it may fail f2fs_iomap_begin(), and make direct
>> write fallbacking to use buffered IO and flush, result in performance
>> regression.
> 
> Is this fixing direct write or read?

Direct write.

> 
>>
>> Fixes: 9f0f6bf42714 ("f2fs: support to map continuous holes or preallocated address")
>> Reported-by: kernel test robot <oliver.sang@intel.com>
>> Closes: https://lore.kernel.org/oe-lkp/202409122103.e45aa13b-oliver.sang@intel.com
>> Cc: Cyril Hrubis <chrubis@suse.cz>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/data.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index 306b86b0595d..38b85160c6bd 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -1676,7 +1676,12 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
>>   		/* reserved delalloc block should be mapped for fiemap. */
>>   		if (blkaddr == NEW_ADDR)
>>   			map->m_flags |= F2FS_MAP_DELALLOC;
>> -		if (flag != F2FS_GET_BLOCK_DIO || !is_hole)
>> +		/*
>> +		 * f2fs_map_blocks() supports to map continuous holes or
>> +		 * preallocated address, don't set F2FS_MAP_MAPPED for these
>> +		 * cases only.
>> +		 */
>> +		if (flag != F2FS_GET_BLOCK_DIO || map->m_may_create || !is_hole)
> 
> So, this is adding map->m_may_create, which is for writes?

map->m_may_create is added for write path, w/o this condition, f2fs_map_blocks()
may missed to tag F2FS_MAP_MAPPED, result in that f2fs_iomap_begin() will return
-ENOTBLK.

Am I missing someting?

Thanks,

> 
>>   			map->m_flags |= F2FS_MAP_MAPPED;
>>   
>>   		map->m_pblk = blkaddr;
>> -- 
>> 2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
