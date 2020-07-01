Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF1D211076
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jul 2020 18:19:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqfSR-0004nV-Qr; Wed, 01 Jul 2020 16:19:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jqfSQ-0004nO-Gn
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 16:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hN+bWmvhLyYMQqJwoiEqRT71K8opl4HQO++ciXq3Rt4=; b=QUX5F4io+PWYdjjpxJYLzMyX0K
 mIXvFjbYA6gx4bQ1R8+B1zQlpt2ImYDdnfFz9e3i7EHL9J9PtFlqEqHTWiWRCaAsuOWVnXz1bqT89
 Ad1eGQRUNrR04/Pr1oNn3a843sjHd2meQiDT6Eywxkp8ev09M8tej45LRAgtEU5U6ytw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hN+bWmvhLyYMQqJwoiEqRT71K8opl4HQO++ciXq3Rt4=; b=KKuFjrNUt9MKKc9fIys0J7FBri
 l5ifXJJ4I3kzTV/wS9rytJpi8+PqfG6ot7A9Tv/+CnvfUEQI1Ys/xV4jYcIgKXNz67TIXaYQxOmUQ
 DCnyTotS+H1/wF+aC4ZR2EZ66BKTynRxX5SzlmPMwIPKCyOtZPKFLmT/08CxMZqqw57s=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqfSP-004Bf7-BJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 16:19:34 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DDAC7207BB;
 Wed,  1 Jul 2020 16:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593620368;
 bh=2zNupGrsJWVvIy1EGdDug2tvMr8j7918+kyHDf++ejA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KHDPOc0FLDP3WLnhF3VbexIDJ4vOZBhmmYCWfOGkeAvEzeZAlnQFI9ozskQG1IBio
 c0UByb07z0wVjS5DmK3dTO14yPvWnf5hFOz7qdeQMQcOBfWfPFvNEXweF6F3J5pImm
 /jMBf9Kpd7HLKQKcvg4J3TLlnnZg7dOBAbWdCRVo=
Date: Wed, 1 Jul 2020 09:19:27 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200701161927.GD1724572@google.com>
References: <20200630100428.19105-1-yuchao0@huawei.com>
 <20200630100428.19105-2-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630100428.19105-2-yuchao0@huawei.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqfSP-004Bf7-BJ
Subject: Re: [f2fs-dev] [PATCH RFC 2/5] f2fs: record average update time of
 segment
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/30, Chao Yu wrote:
> Previously, once we update one block in segment, we will update mtime of
> segment to last time, making aged segment becoming freshest, result in
> that GC with cost benefit algorithm missing such segment, So this patch
> changes to record mtime as average block updating time instead of last
> updating time.
> 
> It's not needed to reset mtime for prefree segment, as se->valid_blocks
> is zero, then old se->mtime won't take any weight with below calculation:
> 
> 	se->mtime = (se->mtime * se->valid_blocks + mtime) /
> 				(se->valid_blocks + 1);
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/segment.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 863ec6f1fb87..906c313835ad 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2150,6 +2150,22 @@ static void __set_sit_entry_type(struct f2fs_sb_info *sbi, int type,
>  		__mark_sit_entry_dirty(sbi, segno);
>  }
>  
> +static void update_segment_mtime(struct f2fs_sb_info *sbi, block_t blkaddr)
> +{
> +	unsigned int segno = GET_SEGNO(sbi, blkaddr);
> +	struct seg_entry *se = get_seg_entry(sbi, segno);
> +	unsigned long long mtime = get_mtime(sbi, false);
> +
> +	if (!se->mtime) {

Don't need {}.

> +		se->mtime = mtime;
> +	} else {
> +		se->mtime = (se->mtime * se->valid_blocks + mtime) /
> +						(se->valid_blocks + 1);
> +	}
> +	if (mtime > SIT_I(sbi)->max_mtime)
> +		SIT_I(sbi)->max_mtime = mtime;
> +}
> +
>  static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
>  {
>  	struct seg_entry *se;
> @@ -2169,10 +2185,9 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
>  	f2fs_bug_on(sbi, (new_vblocks >> (sizeof(unsigned short) << 3) ||
>  				(new_vblocks > sbi->blocks_per_seg)));
>  
> +	update_segment_mtime(sbi, blkaddr);
> +
>  	se->valid_blocks = new_vblocks;
> -	se->mtime = get_mtime(sbi, false);
> -	if (se->mtime > SIT_I(sbi)->max_mtime)
> -		SIT_I(sbi)->max_mtime = se->mtime;
>  
>  	/* Update valid block bitmap */
>  	if (del > 0) {
> -- 
> 2.26.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
