Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DAD6835D3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Jan 2023 19:57:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMvoZ-0002sl-OX;
	Tue, 31 Jan 2023 18:57:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pMvoY-0002se-Aa
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 18:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0YQM8uT228DD5xu8r7Ycm/qBtPd900F/pRgj7yRFOEM=; b=PwegoVrZs6LGT/l4xSrDuu4TlK
 bYAkj2r6TaY6ryC55SipIwRO6imeGb6lZpvg7kJKGk2zRVEzkOuAG+bWrNHnRUQENhtLNsqCkxtEO
 aUlB8D89yrtBnYulnSXnOeZ4Fa8jjYVgFKEI/uVHQ5UI/DDC+CTBu9/tPrsYvP2zIc+4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0YQM8uT228DD5xu8r7Ycm/qBtPd900F/pRgj7yRFOEM=; b=A8ZrdoIgK0flztskz6jnyG5BW8
 ZhRpiRLsf2kQmL4W14hGjHCXJVkADCocSybbzIXGvLwfV/aE17t798YFJ9mRkhcaukCs1gyUeNFGb
 /cUcAYTHf6ooO4nKFp5UkKB4V6EmQhMlzZfKukBdzT0F9/LpZSiyqzliO+BHm44gJIvU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMvoW-00069v-1o for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 18:57:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7067B6163B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 31 Jan 2023 18:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE23AC433EF;
 Tue, 31 Jan 2023 18:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675191418;
 bh=qvFUa7E1gUFD3AT6Y+KBidqT85WZjsogoG0PROP8ouI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yifc5Aql8hTSL7Kv4P9QPYW39QSa0ktn9qisjN64h7RBXyWCcZ+bNDjHPX1IQZG7w
 n95JtcZKEp1bCbTFwP2axXj5tpfC3yDAGtKd+iziDR8MmWVTAkvBDs/4WxbKQnyhPe
 xjYNeSiVOTb7Hc9Cmdkw+Rh0WwLDX0nSwrwM/St+RMWvXVpw7Y9gi9erZfLuBfns8L
 FR6BSPgm/pRip8mwgHfH3Pxoq1IIcMLCl2Lf2cKwr4CgO13T6SbRB+kV8kXlEC+IYP
 h2rKtU8lLXMSObBsh0m6ET+euf/LEOy6rOl6z4d5jcNhvLkx+XD6GV7ZjQzsz80VbG
 ESVxk0634N+eg==
Date: Tue, 31 Jan 2023 10:56:57 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y9lkeVCMRA9goN2E@google.com>
References: <20230131144701.34418-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230131144701.34418-1-chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/31, Chao Yu wrote: > No logic change, just avoid goto
 statement. I wanted to avoid a deep if/else statement. > > Signed-off-by:
 Chao Yu <chao@kernel.org> > --- > fs/f2fs/extent_cache.c | 66
 ++++++++++++++++++++
 > 1 file changed, 31 insertions(+), 35 deletions(-) > > diff --git a/fs/f2fs
 [...] Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMvoW-00069v-1o
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

On 01/31, Chao Yu wrote:
> No logic change, just avoid goto statement.

I wanted to avoid a deep if/else statement.

> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/extent_cache.c | 66 ++++++++++++++++++++----------------------
>  1 file changed, 31 insertions(+), 35 deletions(-)
> 
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index d70ad6a44cbf..cf65a188d112 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -782,47 +782,43 @@ static void __update_extent_tree_range(struct inode *inode,
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
> +	if (type == EX_READ) {
> +		if (tei->blk) {
> +			__set_extent_info(&ei, fofs, len, tei->blk, false,
> +					  0, 0, EX_READ);
> +			if (!__try_merge_extent_node(sbi, et, &ei,
> +							prev_en, next_en))
> +				__insert_extent_tree(sbi, et, &ei,
>  					insert_p, insert_parent, leftmost);
>  
> -		/* give up extent_cache, if split and small updates happen */
> -		if (dei.len >= 1 &&
> -				prev.len < F2FS_MIN_EXTENT_LEN &&
> -				et->largest.len < F2FS_MIN_EXTENT_LEN) {
> -			et->largest.len = 0;
> -			et->largest_updated = true;
> -			set_inode_flag(inode, FI_NO_EXTENT);
> +			/* give up read extent cache, if split and small updates happen */
> +			if (dei.len >= 1 &&
> +					prev.len < F2FS_MIN_EXTENT_LEN &&
> +					et->largest.len < F2FS_MIN_EXTENT_LEN) {
> +				et->largest.len = 0;
> +				et->largest_updated = true;
> +				set_inode_flag(inode, FI_NO_EXTENT);
> +			}
>  		}
> -	}
> -
> -	if (is_inode_flag_set(inode, FI_NO_EXTENT))
> -		__free_extent_tree(sbi, et);
>  
> -	if (et->largest_updated) {
> -		et->largest_updated = false;
> -		updated = true;
> -	}
> -	goto out_read_extent_cache;
> -update_age_extent_cache:
> -	if (!tei->last_blocks)
> -		goto out_read_extent_cache;
> +		if (is_inode_flag_set(inode, FI_NO_EXTENT))
> +			__free_extent_tree(sbi, et);
>  
> -	__set_extent_info(&ei, fofs, len, 0, false,
> -			tei->age, tei->last_blocks, EX_BLOCK_AGE);
> -	if (!__try_merge_extent_node(sbi, et, &ei, prev_en, next_en))
> -		__insert_extent_tree(sbi, et, &ei,
> +		if (et->largest_updated) {
> +			et->largest_updated = false;
> +			updated = true;
> +		}
> +	} else if (type == EX_BLOCK_AGE) {
> +		if (tei->last_blocks) {
> +			__set_extent_info(&ei, fofs, len, 0, false,
> +				tei->age, tei->last_blocks, EX_BLOCK_AGE);
> +			if (!__try_merge_extent_node(sbi, et, &ei,
> +							prev_en, next_en))
> +				__insert_extent_tree(sbi, et, &ei,
>  					insert_p, insert_parent, leftmost);
> -out_read_extent_cache:
> +		}
> +	}
>  	write_unlock(&et->lock);
>  
>  	if (updated)
> -- 
> 2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
