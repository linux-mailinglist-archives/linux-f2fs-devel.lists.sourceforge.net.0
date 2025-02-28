Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FF6A4924F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Feb 2025 08:37:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tnuw4-0000GO-G3;
	Fri, 28 Feb 2025 07:37:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tnuw2-0000GI-IY
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Feb 2025 07:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NgnhkWCFFOVq/FrwkMTC/Ku5PTc0DaYRtm8ya9WHwgE=; b=SiOw+Ea3U2JGJPsvpKwv9jQ/cU
 TSw49yi3BpjEA7KZsCaabwen6j3283LOz3yVc0bj0QVu2bv3T1OUSdw4ifu8vlOvXRd+VF1NbPgIW
 QGry8WMvreaRTJCQYJxJtaUCX7ZNfpxvCZJ1nhcCrXtoFW90dBSSWVdRy9wE8MTY9UWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NgnhkWCFFOVq/FrwkMTC/Ku5PTc0DaYRtm8ya9WHwgE=; b=cpEc17gDrbjFOdWkuViDqL/hH3
 EXiqvDBmxUawcmUREvmR0de5+OJG/PNxhO8zQKFXlc34S4w9bND7274go0vHvJtlPEahVEHOjZBDE
 TJVA7i+/L+gCnIjAK5ubPTUX/eweZhEfpNYAXDtXjYmRchwPBbvXfM5RGcQZ3HPpQshI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tnuw1-0000RI-Pw for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Feb 2025 07:37:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8E3195C547D;
 Fri, 28 Feb 2025 07:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C22DC4CED6;
 Fri, 28 Feb 2025 07:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740728235;
 bh=cDtlqKcwOFTEnTBTdNOJ0/fAqkcZEXUrqyrdJoyMgog=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=iSfhQlOjM1ViibQZykeckXFKezCn3C+wm+eXl1cknvmHFBbPNG9Bs+aYvMV9u3qrb
 vnke4UX9T8jrLN6XBmaqBp4u/XuA1aqyqLxscKJmKhoGZXIfOOFN4QGRwhablh0pG0
 v7vPyGB6mjDprkGyo9ZuoOlVLa0LNZ7NAjaMg59wjbUfTtYPCzMEr9iLEuTlzp+SDW
 nP/6hL85P4zM6Aq3pBjjL32UWcBVT7yMYr+Ci+uvTyrDgo5m+qk+ZPU0fSt97ASgTV
 PZr3HB8NRSDaersfdlw+9lkQ6vhd7teJXG3/n/yFGOKqCuzc/t28Rf+CvZieZUMLUB
 7rpzdm0BYfbDw==
Message-ID: <4948a522-1302-462e-9256-1bb31d0ce7aa@kernel.org>
Date: Fri, 28 Feb 2025 15:37:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250218055203.591403-1-willy@infradead.org>
 <20250218055203.591403-22-willy@infradead.org>
Content-Language: en-US
In-Reply-To: <20250218055203.591403-22-willy@infradead.org>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/2/18 13:51, Matthew Wilcox (Oracle) wrote: > Convert
 f2fs_get_read_data_page() into f2fs_get_read_data_folio() and > add a
 compatibility
 wrapper. Saves seven hidden calls to compound_head(). > [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tnuw1-0000RI-Pw
Subject: Re: [f2fs-dev] [PATCH 21/27] f2fs: Add f2fs_get_read_data_folio()
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
Cc: linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/2/18 13:51, Matthew Wilcox (Oracle) wrote:
> Convert f2fs_get_read_data_page() into f2fs_get_read_data_folio() and
> add a compatibility wrapper.  Saves seven hidden calls to compound_head().
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>   fs/f2fs/data.c | 35 +++++++++++++++++------------------
>   fs/f2fs/f2fs.h | 14 ++++++++++++--
>   2 files changed, 29 insertions(+), 20 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index fe7fa08b20c7..f0747c7f669d 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1203,18 +1203,17 @@ int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index)
>   	return err;
>   }
>   
> -struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
> -				     blk_opf_t op_flags, bool for_write,
> -				     pgoff_t *next_pgofs)
> +struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
> +		blk_opf_t op_flags, bool for_write, pgoff_t *next_pgofs)
>   {
>   	struct address_space *mapping = inode->i_mapping;
>   	struct dnode_of_data dn;
> -	struct page *page;
> +	struct folio *folio;
>   	int err;
>   
> -	page = f2fs_grab_cache_page(mapping, index, for_write);
> -	if (!page)
> -		return ERR_PTR(-ENOMEM);
> +	folio = f2fs_grab_cache_folio(mapping, index, for_write);
> +	if (IS_ERR(folio))
> +		return folio;
>   
>   	if (f2fs_lookup_read_extent_cache_block(inode, index,
>   						&dn.data_blkaddr)) {
> @@ -1249,9 +1248,9 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
>   		goto put_err;
>   	}
>   got_it:
> -	if (PageUptodate(page)) {
> -		unlock_page(page);
> -		return page;
> +	if (folio_test_uptodate(folio)) {
> +		folio_unlock(folio);
> +		return folio;
>   	}
>   
>   	/*
> @@ -1262,21 +1261,21 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
>   	 * f2fs_init_inode_metadata.
>   	 */
>   	if (dn.data_blkaddr == NEW_ADDR) {
> -		zero_user_segment(page, 0, PAGE_SIZE);
> -		if (!PageUptodate(page))
> -			SetPageUptodate(page);
> -		unlock_page(page);
> -		return page;
> +		folio_zero_segment(folio, 0, folio_size(folio));
> +		if (!folio_test_uptodate(folio))
> +			folio_mark_uptodate(folio);
> +		folio_unlock(folio);
> +		return folio;
>   	}
>   
> -	err = f2fs_submit_page_read(inode, page_folio(page), dn.data_blkaddr,
> +	err = f2fs_submit_page_read(inode, folio, dn.data_blkaddr,
>   						op_flags, for_write);
>   	if (err)
>   		goto put_err;
> -	return page;
> +	return folio;
>   
>   put_err:
> -	f2fs_put_page(page, 1);
> +	f2fs_folio_put(folio, true);
>   	return ERR_PTR(err);
>   }
>   
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 8f23bb082c6f..3e02df63499e 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3895,8 +3895,8 @@ int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count);
>   int f2fs_reserve_new_block(struct dnode_of_data *dn);
>   int f2fs_get_block_locked(struct dnode_of_data *dn, pgoff_t index);
>   int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index);
> -struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
> -			blk_opf_t op_flags, bool for_write, pgoff_t *next_pgofs);
> +struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
> +		blk_opf_t op_flags, bool for_write, pgoff_t *next_pgofs);
>   struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index,
>   							pgoff_t *next_pgofs);
>   struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
> @@ -3926,6 +3926,16 @@ int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi);
>   void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi);
>   extern const struct iomap_ops f2fs_iomap_ops;
>   
> +static inline struct page *f2fs_get_read_data_page(struct inode *inode,
> +		pgoff_t index, blk_opf_t op_flags, bool for_write,
> +		pgoff_t *next_pgofs)
> +{
> +	struct folio *folio = f2fs_get_read_data_folio(inode, index, op_flags,
> +			for_write, next_pgofs);
> +
	if (IS_ERR(folio))
		return ERR_CAST(folio));

> +	return &folio->page;
> +}
> +
>   /*
>    * gc.c
>    */



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
