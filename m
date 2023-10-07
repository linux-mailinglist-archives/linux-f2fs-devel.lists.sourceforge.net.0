Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6FF7BC5A9
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Oct 2023 09:41:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qp1vk-0000zY-1f;
	Sat, 07 Oct 2023 07:40:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qp1vi-0000zR-Ka
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Oct 2023 07:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sBenpsV+sBSDlZFeO1XdnFRWCHx5t1Ml7axEpMKUykk=; b=SrcqP50gtNakZFrf1mrottJ6T1
 Ux99JpsSfyNIPnp2SuJtD0MPuuDcWNf/EaxbooEmDO0r0+bTGT3dEZcUS+GcHBsPIJFUMEz9JIV2O
 4V44Y8Ory7/3NjxoU2oGrOPcWoEOqLwef8lo2zCBvC1rRSLDvlC9KfcQWrYdV8hs0Yo0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sBenpsV+sBSDlZFeO1XdnFRWCHx5t1Ml7axEpMKUykk=; b=cOrU4TsevjDMjWHvgC5JfCt9As
 12ChqZNTXnuyJ3/+eNITZANRsWti2jYFa5WKRW2grQlYqEIkSBa+OPgWih3oi3I60o38iDvHoW+6m
 3i1wtibC+/K6lQOG3pqE6KVwC9lQQU6CfBBaRDbcnCk87+64++5voVLZ9tLP8xf4gBDI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qp1ve-0001Mw-Fe for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Oct 2023 07:40:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A097460ACD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  7 Oct 2023 07:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65BF4C433C7;
 Sat,  7 Oct 2023 07:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696664439;
 bh=QNdP6CzhDYNi4kZoC6kQSoWNk4vaR0KoYKoMwwnfCk0=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=ZD6BHLVLeAO36MPjUMFZlQ3Ecnh8qiTLRZdfejreYwLcgJmWLK9rR7NhpFwqBrau8
 4oFjd8xleln0VttlWWN0zcesnyf1iDRE59q82+INdEIFVpY2ZpxCBQDubDevB/sCpE
 J+45YDh/Bg8prgEqziRTMus8rCDdN2/KsipcCnJNfSk33of/M6NsoOdE1V8yiVBkrr
 SfG1CMPMpG0/Wbovjo1oy5iKFxY5sj5nJ8WfcjbbNJ4m50CTQN1rMOpj/UllFVvAs2
 ExA8ZJPV6VqYdzEetODqywayAPc1DJEV5uZEjw0bPTz2CBiE/hR2nBbg46URxq1ig9
 xQVMrZL075N0A==
Message-ID: <c70b330a-b5f5-72d9-1190-fe1a6872919d@kernel.org>
Date: Sat, 7 Oct 2023 15:40:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20231003225208.1936359-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231003225208.1936359-1-jaegeuk@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/10/4 6:52,
 Jaegeuk Kim wrote: > Let's avoid unnecessary
 f2fs_map_block calls to load extents. > > # f2fs_io fadvise willneed 0 4096
 /data/local/tmp/test > > f2fs_map_blocks: dev = (254,51), in [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.6 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qp1ve-0001Mw-Fe
Subject: Re: [f2fs-dev] [PATCH] f2fs: stop iterating f2fs_map_block if hole
 exists
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/10/4 6:52, Jaegeuk Kim wrote:
> Let's avoid unnecessary f2fs_map_block calls to load extents.
> 
>   # f2fs_io fadvise willneed 0 4096 /data/local/tmp/test
> 
>    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 386, start blkaddr = 0x34ac00, len = 0x1400, flags = 2,
>    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 5506, start blkaddr = 0x34c200, len = 0x1000, flags = 2,
>    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 9602, start blkaddr = 0x34d600, len = 0x1200, flags = 2,
>    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 14210, start blkaddr = 0x34ec00, len = 0x400, flags = 2,
>    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 15235, start blkaddr = 0x34f401, len = 0xbff, flags = 2,
>    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 18306, start blkaddr = 0x350200, len = 0x1200, flags = 2
>    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 22915, start blkaddr = 0x351601, len = 0xa7d, flags = 2
>    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 25600, start blkaddr = 0x351601, len = 0x0, flags = 0
>    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 25601, start blkaddr = 0x351601, len = 0x0, flags = 0
>    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 25602, start blkaddr = 0x351601, len = 0x0, flags = 0
>    ...
>    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 1037188, start blkaddr = 0x351601, len = 0x0, flags = 0
>    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 1038206, start blkaddr = 0x351601, len = 0x0, flags = 0
>    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 1039224, start blkaddr = 0x351601, len = 0x0, flags = 0
>    f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 2075548, start blkaddr = 0x351601, len = 0x0, flags = 0

Jaegeuk,

Not sure, but it looks it's due to f2fs_precache_extents() will traverse file
w/ range [0, max_file_blocks), since data which exceeds EOF will always be zero,
so it's not necessary to precache its mapping info, so we'd better adjust upper
boundary to i_size rather than max_file_blocks().

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/file.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 161826c6e200..2403fd1de5a0 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3270,7 +3270,7 @@ int f2fs_precache_extents(struct inode *inode)
>   		f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
>   		err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_PRECACHE);
>   		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> -		if (err)
> +		if (err || !map.m_len)
Well, if there is a hole in the head of file, it may break here rather
than precaching following valid map info.

What about passing parameter offset|len from f2fs_file_fadvise() to
f2fs_precache_extents(), and then precaching mapping info on demand.

Thanks,

>   			return err;
>   
>   		map.m_lblk = m_next_extent;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
