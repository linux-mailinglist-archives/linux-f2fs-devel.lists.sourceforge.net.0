Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D44BF9B9B90
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 Nov 2024 01:25:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t71xN-0001no-7Q;
	Sat, 02 Nov 2024 00:25:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t71xL-0001nh-BT
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Nov 2024 00:25:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZlM4+N10kw6nMH1yiqQEGwSTn0RtfgiXoedMyVvBi1U=; b=c13bQmHE3fDnFyF/xdbbr3H6RL
 HJw803t02HssUYQM0XDNfcPXulKw7yplj9xoDLClXVctgOAYRHH5kl/ZJLqV5LEuJLN/Rm9ojvree
 WyhEDGpYDmIZlanKzs+S81NkLNR1h+mmd73zu/2sff/TRv08La5LFA9v3kkYmfYuwnFo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZlM4+N10kw6nMH1yiqQEGwSTn0RtfgiXoedMyVvBi1U=; b=baXyM8E6A/mrUQDFisazx65xhw
 yq7FKl4Q9pLrUB85nTCXaOqxvaRIwEqRT6Xn/ClLLfoD8GUGVwy3BIo8dsPohPAoGEKhb9E2C6voZ
 CjVroHkddhwhRO8p/ktXGqoCbuQzIUoLRBuBfzFkpeOjXZPPCpZwCGOXYHn1VBiL7smc=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t71xJ-0004yU-Rn for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Nov 2024 00:25:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AD7A2A44F0E;
 Sat,  2 Nov 2024 00:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DB2C4CECD;
 Sat,  2 Nov 2024 00:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730507123;
 bh=PoBluuWksqSKIY8x+1s63UbYr0Aia1sRZxqjFKv/dW8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=USHVKQuC7sGpL0OYwqRt1DfspdDNcqIPA6QozwMZMHvEbwmWXqulvRBDW4pwFgf6e
 h1xsVceuGJEmH1KPy4oVsUjd8Ra5mh5CZUN0nVs51KDer0yL7yr/zC5RJ9hAiMIpe3
 Zgh9HOsdeqtaLKKLB2U2/7ORacZDjJqJoh6A+C3xtTxPU741CXBfuM4ufq62qxL5Zv
 /tiokc5FPBKx1DGGOScxr+cmtxyKwDWQCXvqafeFMQ0rrZVK2G0Tp6j90ro6i7H9rP
 xa6BgasKX8tut8jQD9NCAFPE1KJg294bvZJGnwnfEWl4xpssAR9QYNyNyVTKVdt+JP
 7i0d763sRbJMQ==
Message-ID: <bdc6ecca-d527-4ca8-a476-1c00fcd1ad11@kernel.org>
Date: Sat, 2 Nov 2024 08:25:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20241031102200.440407-1-chao@kernel.org>
 <ZyQtcbtzpixFd6Zs@google.com>
 <fede8a9b-8532-4d63-a4db-b52ed088d6f8@kernel.org>
 <ZyVC0R8JYwMZXM9u@google.com>
Content-Language: en-US
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <ZyVC0R8JYwMZXM9u@google.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/11/2 5:06, Jaegeuk Kim wrote: > On 11/01, Chao Yu
 wrote: >> On 2024/11/1 9:22, Jaegeuk Kim wrote: >>> On 10/31, Chao Yu wrote:
 >>>> f2fs_map_blocks() supports to map continuous holes or preall [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t71xJ-0004yU-Rn
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

On 2024/11/2 5:06, Jaegeuk Kim wrote:
> On 11/01, Chao Yu wrote:
>> On 2024/11/1 9:22, Jaegeuk Kim wrote:
>>> On 10/31, Chao Yu wrote:
>>>> f2fs_map_blocks() supports to map continuous holes or preallocated
>>>> address, we should avoid setting F2FS_MAP_MAPPED for these cases
>>>> only, otherwise, it may fail f2fs_iomap_begin(), and make direct
>>>> write fallbacking to use buffered IO and flush, result in performance
>>>> regression.
>>>
>>> Is this fixing direct write or read?
>>
>> Direct write.
> 
> I was confising the patch subject is saying direct read.

Oops, sorry.

> 
>>
>>>
>>>>
>>>> Fixes: 9f0f6bf42714 ("f2fs: support to map continuous holes or preallocated address")
>>>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>>> Closes: https://lore.kernel.org/oe-lkp/202409122103.e45aa13b-oliver.sang@intel.com
>>>> Cc: Cyril Hrubis <chrubis@suse.cz>
>>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>>> ---
>>>>    fs/f2fs/data.c | 7 ++++++-
>>>>    1 file changed, 6 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>>> index 306b86b0595d..38b85160c6bd 100644
>>>> --- a/fs/f2fs/data.c
>>>> +++ b/fs/f2fs/data.c
>>>> @@ -1676,7 +1676,12 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
>>>>    		/* reserved delalloc block should be mapped for fiemap. */
>>>>    		if (blkaddr == NEW_ADDR)
>>>>    			map->m_flags |= F2FS_MAP_DELALLOC;
>>>> -		if (flag != F2FS_GET_BLOCK_DIO || !is_hole)
>>>> +		/*
>>>> +		 * f2fs_map_blocks() supports to map continuous holes or
>>>> +		 * preallocated address, don't set F2FS_MAP_MAPPED for these
>>>> +		 * cases only.
>>>> +		 */
>>>> +		if (flag != F2FS_GET_BLOCK_DIO || map->m_may_create || !is_hole)
>>>
>>> So, this is adding map->m_may_create, which is for writes?
>>
>> map->m_may_create is added for write path, w/o this condition, f2fs_map_blocks()
>> may missed to tag F2FS_MAP_MAPPED, result in that f2fs_iomap_begin() will return
>> -ENOTBLK.
> 
> Is that something like this?
> 
> /* DIO READ and hole case, should not map the blocks. */
> if (!(flag == F2FS_GET_BLOCK_DIO && is_hole && !map->m_may_create))

More clear, will update w/ this.

Thanks,

> 
>>
>> Am I missing someting?
>>
>> Thanks,
>>
>>>
>>>>    			map->m_flags |= F2FS_MAP_MAPPED;
>>>>    		map->m_pblk = blkaddr;
>>>> -- 
>>>> 2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
