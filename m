Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE07BBC7326
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Oct 2025 04:25:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NwYyTyafwWDWrGeLxa+xRojqr/N6Gl0cSBwRmS0/YPs=; b=CrIq25qgAZMhdJdjXPwSFJT0/I
	Zs+qsWnte+zDx5oKEljmcFNARTG8NznUIk6is9CZzutsLD8WelzmzlLW7WpyZtGte2sTxQ68S3sF6
	8tVjQoiadfhUnn9AGaTuGMImMqWaIlFZDPedJyeHxxqT+GOZhy9r7ntmQMgb6UespTUQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v6gLa-0000rI-Sr;
	Thu, 09 Oct 2025 02:25:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v6gLZ-0000r2-Dk
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 02:25:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2YzXUDoVv4IVAWqVpcRvdLzDjB49JEso9+2HfFDZ9Vw=; b=au/LSgPuRuquYyrKxlvPl8azPu
 LBi38cZDKXQR3jJQm09RzCVsflbWwfSUYSCW9lxmK7bHwqH0UJVQ2zihCtt0IP38OIJ4GVHT4NER0
 xfN7ifidip+GJmgeNNS00d9U6D+FYq4AlpfElKWNv7yvqUeW0sr55Wv7O6UtCVQTlUJ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2YzXUDoVv4IVAWqVpcRvdLzDjB49JEso9+2HfFDZ9Vw=; b=Frfk7gIXim7N0yl7Vsa5Ed3gLt
 R15aXp+7ZE0D1KN8BjP9PNPgfVtioeKhF2XqtBNWPQ/nn/Cyj7WkE6MKY5HGZvqOGzFeiXXK/tdRL
 12VrvxbIfTOp/8OeZMcGDNPOrcX8NvOnHAxdfMLgY4XNslt0ib4vQIen/ZpgTC7In/Ls=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v6gLZ-0003ZO-Gs for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 02:25:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 332DC40B9B;
 Thu,  9 Oct 2025 02:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F00C4CEE7;
 Thu,  9 Oct 2025 02:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759976727;
 bh=vTHUzqFcW/mNj3h30ZYRTuoryqWPNMypz+oxpm5+J2Q=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=kUoRsDNyMTjv+cj67esksGIfpPFtp8srOdqrWxjZ5l6L7YaZXT+id9VcnpoLtemfD
 FApDJAT7tfoGXMhZV0A3zqqorfAOwR00zWkWOhpZ6n9DMRH8eCmmivOQbhu/cjAMpi
 5rE2Q5d03+rBQe2uieLD6OvzINzZuLxArJlIn1xYosiWHXSLp5qpBdG5NHd06lSADr
 yGYeAn53AGJYq/EEs+FUMCU48OuINKPnthnBzhiVNC5DTsiKgi8SjWq0MDbAOgKux3
 XULbTH8cMV/s6F37Gfp6FvpUABdTR0gNY5EU3AeZT7iSVaCpxb46uXPZKNvNmfifd4
 bpBRWYdyEc/XA==
Message-ID: <849959ea-b86e-400c-a33f-d1d6b1745267@kernel.org>
Date: Thu, 9 Oct 2025 10:25:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiucheng Xu <jiucheng.xu@amlogic.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250918-origin-dev-v1-1-8d9877df9e77@amlogic.com>
 <d6609f12-78c2-4a42-b4fd-689b310ec615@kernel.org>
 <f64a9a4c-a90f-4d30-bca2-9d9bc7724121@amlogic.com>
Content-Language: en-US
In-Reply-To: <f64a9a4c-a90f-4d30-bca2-9d9bc7724121@amlogic.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/30/2025 11:17 AM, Jiucheng Xu wrote: > > > On 9/24/2025
 10:25 AM, Chao Yu wrote: >> [ EXTERNAL EMAIL ] >> >> On 9/18/25 11:32, Jiucheng
 Xu via B4 Relay wrote: >>> From: Jiucheng Xu <jiucheng.xu@a [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v6gLZ-0003ZO-Gs
Subject: Re: [f2fs-dev] [PATCH] f2fs: Use mapping->gfp_mask to get file
 cache for writing
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
Cc: tuan.zhang@amlogic.com, linux-kernel@vger.kernel.org,
 jianxin.pan@amlogic.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/30/2025 11:17 AM, Jiucheng Xu wrote:
> 
> 
> On 9/24/2025 10:25 AM, Chao Yu wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On 9/18/25 11:32, Jiucheng Xu via B4 Relay wrote:
>>> From: Jiucheng Xu <jiucheng.xu@amlogic.com>
>>>
>>> On 32-bit architectures, when GFP_NOFS is used, the file cache for write
>>> operations cannot be allocated from the highmem and CMA.
>>
>> Hi,
>>
>> Have you suffered any problem w/o this patch? Can you please describe more
>> details about it?
>>
> Hi Chao,
> 
> Thanks for your comments.
> 
> Our a platform uses a 1.5G DRAM, and the kernel is aarch32.
> We have a critical scenario where system need to record multimedia data
> while replaying the previously recorded multimedia files. However,
> stuttering often occurs during playback. The problem does not arise on
> aarch64 platforms with the same memory size.
> 
> We have analyzed the root cause as follows:
> Data written using GFP_NOFS is only allocated from normal memory. Since
> the normal memory is only 768MB, it easily triggers the kswapd to
> reclaim memory, which in turn reclaims and clears the file cache of the
> recorded data. As a result, during playback, the system fails to hit the
> file cache and thus has to re-read data directly from the storage. Given
> that our storage has relatively poor performance, concurrent read
> (playback) and write (recording) operations lead to significant IO
> latency. High read latency then causes stuttering during playback.

Hi Jiucheng,

Thanks for the explanation.

>>>
>>> Since mapping->gfp_mask is set to GFP_HIGHUSER_MOVABLE during inode
>>
>> GFP_HIGHUSER_MOVABLE includes __GFP_FS, we should avoid using __GFP_FS here.
>> f2fs_write_begin() uses GFP_NOFS like the most of other filesystem to avoid
>> potential deadlock, as __filemap_get_folio(, .. |__GFP_FS | ..) may run into
>> memory reclaim to call ->writeback in where we may suffer deadlock potentially.
>>
> Since our platform only support 5.15 kernel, I have checked
> EXT4/FAT/ntfs3 and find they all use mapping_gfp_mask(mapping)) as GFP

Yes, but also we can see iomap gets rid of using __GFP_FS by default:

struct folio *iomap_get_folio(struct iomap_iter *iter, loff_t pos, size_t len)
{
	fgf_t fgp = FGP_WRITEBEGIN | FGP_NOFS;

	if (iter->flags & IOMAP_NOWAIT)
		fgp |= FGP_NOWAIT;
	if (iter->flags & IOMAP_DONTCACHE)
		fgp |= FGP_DONTCACHE;
	fgp |= fgf_set_order(len);

	return __filemap_get_folio(iter->inode->i_mapping, pos >> PAGE_SHIFT,
			fgp, mapping_gfp_mask(iter->inode->i_mapping));
}

> flag to get page cache on kernel 5.15:
> 
> 6100cca:
> ___GFP_HIGHMEM |___GFP_MOVABLE | ___GFP_IO | ___GFP_FS
> |___GFP_DIRECT_RECLAIM |___GFP_KSWAPD_RECLAIM |___GFP_HARDWALL
> |___GFP_SKIP_KASAN_UNPOISON | ___GFP_SKIP_KASAN_POISON
> 
> therefor that's why I recommend this flag.
> 
> I'm not sure if the above flags has some problems on f2fs, so I submit
> it and would be very eager to learn about the views of your experts.

IIRC, f2fs uses GFP_NOFS in ->write_begin for long time w/o any problem, in order
to avoid any potential issue by using ___GFP_FS, and also to consider allowing
memory allocation w/ ___GFP_HIGHMEM & ___GFP_MOVABLE, what about changing as below:

folio = __filemap_get_folio(mapping, index,
			FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_NOFS,
			mapping_gfp_mask(mapping));

Thanks,

> 
> Thanks and Best Regards,
> Jiucheng
> 
>> Thanks,
>>
>>> allocation, using mapping_gfp_mask(mapping) as the GFP flag of getting file
>>> cache for writing is more efficient for 32-bit architectures.
>>>> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
>>> ---
>>>    fs/f2fs/data.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>> index 7961e0ddfca3aaa332b7dbd4985ae7766551834f..9fbc41f9accb2626da22754f1a424da4805ca823 100644
>>> --- a/fs/f2fs/data.c
>>> +++ b/fs/f2fs/data.c
>>> @@ -3587,7 +3587,8 @@ static int f2fs_write_begin(const struct kiocb *iocb,
>>>          * Will wait that below with our IO control.
>>>          */
>>>         folio = __filemap_get_folio(mapping, index,
>>> -                             FGP_LOCK | FGP_WRITE | FGP_CREAT, GFP_NOFS);
>>> +                             FGP_LOCK | FGP_WRITE | FGP_CREAT,
>>> +                             mapping_gfp_mask(mapping));
>>>         if (IS_ERR(folio)) {
>>>                 err = PTR_ERR(folio);
>>>                 goto fail;
>>>
>>> ---
>>> base-commit: c872b6279cd26762339ff02513e2a3f16149a6f1
>>> change-id: 20250910-origin-dev-8a5ff6bee1f2
>>>
>>> Best regards,
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
