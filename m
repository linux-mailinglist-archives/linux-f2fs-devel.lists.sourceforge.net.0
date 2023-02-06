Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C4D68B492
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Feb 2023 04:41:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pOsNe-0006np-Br;
	Mon, 06 Feb 2023 03:41:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pOsNd-0006nb-7b
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Feb 2023 03:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6zjxwwv9NaPotRZck6IRXhayEsfTwt/vRZ7rAKkGvcc=; b=KedW5QTp4SQOmu+G0fXbcyv20s
 vqK2kCqu2TF3pSWTl+r+UkhMhSmbFsPR56KBbn+ElGFPSK8a8Vlr+xzwjOkMJ8uG/ny0DrTi5kKRT
 tdkXZz1oJB/p4k5jnM6Sx8TGSh3kq6n327neVcz0+93Y0zxmmLRJAvpOX8dx4jXf2RQU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6zjxwwv9NaPotRZck6IRXhayEsfTwt/vRZ7rAKkGvcc=; b=aHNGAfU6VSUEg7y2BZb7Wq2eb8
 wKF/TQzyGyiWauFyH0Ex2vwsr8Rq72phzQAImxp0bFn/Wn/LBzEE3xAumQHyLsM2K02bPORcpy3yz
 rre6w/QKisPTn80Ms4NNI+0XKAa/4IuWxUMxXsxTuZgkM4+m28XbLXyN+Tjg2b3i5+G8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pOsNZ-0005ez-1W for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Feb 2023 03:41:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8BD34B80CD9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Feb 2023 03:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B97C433EF;
 Mon,  6 Feb 2023 03:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675654870;
 bh=0e5Vf/+wq9RFfzBH3ksPS6To75J3Rc8u/Il3bhGTie0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sdpLCcMr6Ug8oCrOURoCovSbDtScoGcswvN+oKO7fkXeQ9l6t4FE8EDKxzLPqinbH
 Q6MLfnhGj7ds7XoGY2XuyJMxJG17bKVlsewPsyGA4l5A+sIk/CMqgb4a7pezgKIha+
 VKzCOFdERR46lNQi9XCDF4KA2lnEC9oGteuEZL3y9xIQmNy04bG0rF099I51T7eU31
 2QLWFl2DyhhmgVvhldUqrJTPJArnG+RyuyYpnQ3fo9g4aZ9E/wZKBp8UgrnAibAZ88
 vEPsXFjuViVM66sj26TxUxq7NoCEjm39iGGfgEKbwP+5xPULox/OC4Y6l3swHC0THo
 ahHGA6do+S5vw==
Date: Sun, 5 Feb 2023 19:41:08 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y+B21EAHfuw2vyJ6@google.com>
References: <20230131144701.34418-1-chao@kernel.org>
 <Y9lkeVCMRA9goN2E@google.com>
 <a27b1135-757f-9609-1511-7c6738887472@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a27b1135-757f-9609-1511-7c6738887472@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/01, Chao Yu wrote: > On 2023/2/1 2:56,
 Jaegeuk Kim wrote:
 > > I wanted to avoid a deep if/else statement. > > So how about this: Nothing
 impressive. > > From 418b408420367ac5491c97a7c4d26e3d0e68ea57 Mon Sep 17
 00:00:00 2001 > From: Chao Yu <chao@kernel.org> > Date: Tue,
 31 Jan 2023 22:46:59
 +0800 > Subject: [PATCH v2] f2fs: clean up __update_exten [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pOsNZ-0005ez-1W
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: clean up
 __update_extent_tree_range()
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

On 02/01, Chao Yu wrote:
> On 2023/2/1 2:56, Jaegeuk Kim wrote:
> > I wanted to avoid a deep if/else statement.
> 
> So how about this:

Nothing impressive.

> 
> From 418b408420367ac5491c97a7c4d26e3d0e68ea57 Mon Sep 17 00:00:00 2001
> From: Chao Yu <chao@kernel.org>
> Date: Tue, 31 Jan 2023 22:46:59 +0800
> Subject: [PATCH v2] f2fs: clean up __update_extent_tree_range()
> 
> Introduce __update_read_extent_cache() and __update_age_extent_cache()
> to clean up __update_extent_tree_range(), no logic change.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2
> - introduce __update_read_extent_cache() and __update_age_extent_cache()
> to avoid a deep if/else statement in __update_extent_tree_range().
>  fs/f2fs/extent_cache.c | 116 +++++++++++++++++++++++++++--------------
>  1 file changed, 77 insertions(+), 39 deletions(-)
> 
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index d70ad6a44cbf..887b0b2898b9 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -666,6 +666,75 @@ static struct extent_node *__insert_extent_tree(struct f2fs_sb_info *sbi,
>  	return en;
>  }
> 
> +static inline bool __update_read_extent_cache(struct inode *inode,
> +					struct extent_info *tei,
> +					struct extent_info *ei,
> +					struct extent_info *dei,
> +					struct extent_info *prev,
> +					unsigned int fofs, unsigned int len,
> +					struct extent_node *prev_en,
> +					struct extent_node *next_en,
> +					struct rb_node **insert_p,
> +					struct rb_node *insert_parent,
> +					bool leftmost)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct extent_tree *et = F2FS_I(inode)->extent_tree[EX_READ];
> +
> +	if (!tei->blk)
> +		return false;
> +
> +	__set_extent_info(ei, fofs, len, tei->blk, false,
> +			  0, 0, EX_READ);
> +	if (!__try_merge_extent_node(sbi, et, ei,
> +					prev_en, next_en))
> +		__insert_extent_tree(sbi, et, ei,
> +			insert_p, insert_parent, leftmost);
> +
> +	/* give up read extent cache, if split and small updates happen */
> +	if (dei->len >= 1 &&
> +			prev->len < F2FS_MIN_EXTENT_LEN &&
> +			et->largest.len < F2FS_MIN_EXTENT_LEN) {
> +		et->largest.len = 0;
> +		et->largest_updated = true;
> +		set_inode_flag(inode, FI_NO_EXTENT);
> +	}
> +
> +	if (is_inode_flag_set(inode, FI_NO_EXTENT))
> +		__free_extent_tree(sbi, et);
> +
> +	if (et->largest_updated) {
> +		et->largest_updated = false;
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static inline void __update_age_extent_cache(struct inode *inode,
> +					struct extent_info *tei,
> +					struct extent_info *ei,
> +					unsigned int fofs, unsigned int len,
> +					struct extent_node *prev_en,
> +					struct extent_node *next_en,
> +					struct rb_node **insert_p,
> +					struct rb_node *insert_parent,
> +					bool leftmost)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct extent_tree *et = F2FS_I(inode)->extent_tree[EX_BLOCK_AGE];
> +
> +	if (!tei->last_blocks)
> +		return;
> +
> +	__set_extent_info(ei, fofs, len, 0, false,
> +		tei->age, tei->last_blocks, EX_BLOCK_AGE);
> +	if (!__try_merge_extent_node(sbi, et, ei,
> +					prev_en, next_en))
> +		__insert_extent_tree(sbi, et, ei,
> +			insert_p, insert_parent, leftmost);
> +}
> +
>  static void __update_extent_tree_range(struct inode *inode,
>  			struct extent_info *tei, enum extent_type type)
>  {
> @@ -782,47 +851,16 @@ static void __update_extent_tree_range(struct inode *inode,
>  		en = next_en;
>  	}
> 
> -	if (type == EX_BLOCK_AGE)
> -		goto update_age_extent_cache;
> -
> -	/* 3. update extent in read extent cache */
> -	BUG_ON(type != EX_READ);
> -
> -	if (tei->blk) {
> -		__set_extent_info(&ei, fofs, len, tei->blk, false,
> -				  0, 0, EX_READ);
> -		if (!__try_merge_extent_node(sbi, et, &ei, prev_en, next_en))
> -			__insert_extent_tree(sbi, et, &ei,
> +	/* 3. update extent in extent cache */
> +	if (type == EX_READ)
> +		updated = __update_read_extent_cache(inode, tei, &ei, &dei,
> +					&prev, fofs, len, prev_en, next_en,
>  					insert_p, insert_parent, leftmost);
> -
> -		/* give up extent_cache, if split and small updates happen */
> -		if (dei.len >= 1 &&
> -				prev.len < F2FS_MIN_EXTENT_LEN &&
> -				et->largest.len < F2FS_MIN_EXTENT_LEN) {
> -			et->largest.len = 0;
> -			et->largest_updated = true;
> -			set_inode_flag(inode, FI_NO_EXTENT);
> -		}
> -	}
> -
> -	if (is_inode_flag_set(inode, FI_NO_EXTENT))
> -		__free_extent_tree(sbi, et);
> -
> -	if (et->largest_updated) {
> -		et->largest_updated = false;
> -		updated = true;
> -	}
> -	goto out_read_extent_cache;
> -update_age_extent_cache:
> -	if (!tei->last_blocks)
> -		goto out_read_extent_cache;
> -
> -	__set_extent_info(&ei, fofs, len, 0, false,
> -			tei->age, tei->last_blocks, EX_BLOCK_AGE);
> -	if (!__try_merge_extent_node(sbi, et, &ei, prev_en, next_en))
> -		__insert_extent_tree(sbi, et, &ei,
> +	else if (type == EX_BLOCK_AGE)
> +		__update_age_extent_cache(inode, tei, &ei,
> +					fofs, len, prev_en, next_en,
>  					insert_p, insert_parent, leftmost);
> -out_read_extent_cache:
> +
>  	write_unlock(&et->lock);
> 
>  	if (updated)
> -- 
> 2.25.1
> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
