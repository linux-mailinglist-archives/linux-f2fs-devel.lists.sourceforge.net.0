Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D32FA1F8D31
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2020 07:00:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jkhEh-0007N3-9Y; Mon, 15 Jun 2020 05:00:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jkhEe-0007Mn-Mu
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 05:00:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JeBseYSLxlDSsJUkriYbXB0ZdWbK1dnXJhY+Vgsw+mE=; b=URWsgOc9rE+snnJUxO3qZ1omGH
 4XoG5KX/twUpDJZxZbSZtMm0lXKGd7YwkBY4yToFz4Cd1sa/umZV6YL0TMZHO+pa1icMMtG7cyoYS
 VGuNS+cSwtTGsqQrv18vAPHhO2risWxdGALKqb0zD7mn+Rau/3oge/fJVcGHRRfUoLas=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JeBseYSLxlDSsJUkriYbXB0ZdWbK1dnXJhY+Vgsw+mE=; b=lYwDUwil5Kpynd0RArgjRGY56U
 1PxxuMyeFbHPXgZC2g7I16PUYEEP3aPoUGQE4trCxiCm56iv4Kz2HLLI6IazmwRSwIfbJGqX1pSHl
 2ljuoVfUnAmWDFE4MvDtOxRxuvQ+P10dyaP4TEAWXIvLRJyVtx7eqe55Uw2rgzMHDQ1Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jkhEc-0062TH-Gw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 05:00:40 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D550420679;
 Mon, 15 Jun 2020 05:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592197221;
 bh=dlRSD7KUddKDHdGp8MMwoC0K8/oR6aMNFG3417RecFg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0d/igJr7Zl9t8AMvUgeVQqag7FjglJsBPk6Q/gUbtjxvmdkpjZ9arRZIwPf0xensf
 ACQkVUCroO+mnQHpW+62JlUaNxksZSjcYZn628T3tly92WUnLTAgS0F2gVGeMbcajv
 yhtkZJENHX23Uf/kf241NaSsS1DXDX2gzNuhjZpE=
Date: Sun, 14 Jun 2020 22:00:19 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Sahitya Tummala <stummala@codeaurora.org>
Message-ID: <20200615050019.GA3100@sol.localdomain>
References: <1592193588-21701-1-git-send-email-stummala@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592193588-21701-1-git-send-email-stummala@codeaurora.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jkhEc-0062TH-Gw
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix use-after-free when accessing
 bio->bi_crypt_context
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.or,
 linux-f2fs-devel@lists.sourceforge.net, Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 15, 2020 at 09:29:48AM +0530, Sahitya Tummala wrote:
> There could be a potential race between these two paths below,
> leading to use-after-free when accessing bio->bi_crypt_context.
> 
> f2fs_write_cache_pages
> ->f2fs_do_write_data_page on page#1
>   ->f2fs_inplace_write_data
>     ->f2fs_merge_page_bio
>       ->add_bio_entry
> ->f2fs_do_write_data_page on page#2
>   ->f2fs_inplace_write_data
>     ->f2fs_merge_page_bio
>       ->f2fs_crypt_mergeable_bio
>         ->fscrypt_mergeable_bio
>   				       f2fs_write_begin on page#1
> 				       ->f2fs_wait_on_page_writeback
> 				         ->f2fs_submit_merged_ipu_write
> 					   ->__submit_bio
> 					The bio gets completed, calling
> 					bio_endio
> 					->bio_uninit
> 					  ->bio_crypt_free_ctx
> 	  ->use-after-free issue
> 
> Fix this by moving f2fs_crypt_mergeable_bio() check within
> add_ipu_page() so that it's done under bio_list_lock to prevent
> the above race.
> 
> Fixes: 15e76ad23e72 ("f2fs: add inline encryption support")
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> ---
> This fix is rebased to the tip of fscrypt git -
> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
> branch - inline-encryption
> 
>  fs/f2fs/data.c | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 0dfa8d3..3b53554 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -762,9 +762,10 @@ static void del_bio_entry(struct bio_entry *be)
>  	kmem_cache_free(bio_entry_slab, be);
>  }
>  
> -static int add_ipu_page(struct f2fs_sb_info *sbi, struct bio **bio,
> -							struct page *page)
> +static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
> +				struct page *page, int *bio_needs_submit)
>  {
> +	struct f2fs_sb_info *sbi = fio->sbi;
>  	enum temp_type temp;
>  	bool found = false;
>  	int ret = -EAGAIN;
> @@ -780,6 +781,15 @@ static int add_ipu_page(struct f2fs_sb_info *sbi, struct bio **bio,
>  				continue;
>  
>  			found = true;
> +			if (*bio && (!page_is_mergeable(sbi, *bio,
> +					*fio->last_block, fio->new_blkaddr) ||
> +				    !f2fs_crypt_mergeable_bio(*bio,
> +					  fio->page->mapping->host,
> +					  fio->page->index, fio))) {
> +				ret = 0;
> +				*bio_needs_submit = 1;
> +				break;
> +			}
>  
>  			if (bio_add_page(*bio, page, PAGE_SIZE, 0) ==
>  							PAGE_SIZE) {
> @@ -864,6 +874,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>  	struct bio *bio = *fio->bio;
>  	struct page *page = fio->encrypted_page ?
>  			fio->encrypted_page : fio->page;
> +	int bio_needs_submit = 0;
>  
>  	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
>  			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC))
> @@ -872,11 +883,6 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>  	trace_f2fs_submit_page_bio(page, fio);
>  	f2fs_trace_ios(fio, 0);
>  
> -	if (bio && (!page_is_mergeable(fio->sbi, bio, *fio->last_block,
> -				       fio->new_blkaddr) ||
> -		    !f2fs_crypt_mergeable_bio(bio, fio->page->mapping->host,
> -					      fio->page->index, fio)))
> -		f2fs_submit_merged_ipu_write(fio->sbi, &bio, NULL);
>  alloc_new:
>  	if (!bio) {
>  		bio = __bio_alloc(fio, BIO_MAX_PAGES);
> @@ -886,8 +892,12 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>  
>  		add_bio_entry(fio->sbi, bio, page, fio->temp);
>  	} else {
> -		if (add_ipu_page(fio->sbi, &bio, page))
> +		if (add_ipu_page(fio, &bio, page, &bio_needs_submit))
> +			goto alloc_new;
> +		if (bio_needs_submit) {
> +			f2fs_submit_merged_ipu_write(fio->sbi, &bio, NULL);
>  			goto alloc_new;
> +		}
>  	}
>  
>  	if (fio->io_wbc)

Thanks, I'm still trying to understand this part of the code, but it's looking
like this is a real bug.  Do you also have a reproducer that produces a KASAN
report, or did you find this another way?

One comment: add_ipu_page() already submits the bio if it's full.  Wouldn't it
be better to use that instead of f2fs_submit_merged_ipu_write()?  I.e.:

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index e9dcda80e599..d7a51dbe208b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -762,9 +762,10 @@ static void del_bio_entry(struct bio_entry *be)
 	kmem_cache_free(bio_entry_slab, be);
 }
 
-static int add_ipu_page(struct f2fs_sb_info *sbi, struct bio **bio,
+static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
 							struct page *page)
 {
+	struct f2fs_sb_info *sbi = fio->sbi;
 	enum temp_type temp;
 	bool found = false;
 	int ret = -EAGAIN;
@@ -780,14 +781,18 @@ static int add_ipu_page(struct f2fs_sb_info *sbi, struct bio **bio,
 				continue;
 
 			found = true;
-
-			if (bio_add_page(*bio, page, PAGE_SIZE, 0) ==
-							PAGE_SIZE) {
+			if (page_is_mergeable(sbi, *bio, *fio->last_block,
+					      fio->new_blkaddr) &&
+			    f2fs_crypt_mergeable_bio(*bio,
+						      fio->page->mapping->host,
+						      fio->page->index, fio) &&
+			    bio_add_page(*bio, page,
+					 PAGE_SIZE, 0) == PAGE_SIZE) {
 				ret = 0;
 				break;
 			}
 
-			/* bio is full */
+			/* page can't be merged into bio; submit the bio */
 			del_bio_entry(be);
 			__submit_bio(sbi, *bio, DATA);
 			break;
@@ -872,11 +877,6 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 	trace_f2fs_submit_page_bio(page, fio);
 	f2fs_trace_ios(fio, 0);
 
-	if (bio && (!page_is_mergeable(fio->sbi, bio, *fio->last_block,
-				       fio->new_blkaddr) ||
-		    !f2fs_crypt_mergeable_bio(bio, fio->page->mapping->host,
-					      fio->page->index, fio)))
-		f2fs_submit_merged_ipu_write(fio->sbi, &bio, NULL);
 alloc_new:
 	if (!bio) {
 		bio = __bio_alloc(fio, BIO_MAX_PAGES);
@@ -886,7 +886,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 
 		add_bio_entry(fio->sbi, bio, page, fio->temp);
 	} else {
-		if (add_ipu_page(fio->sbi, &bio, page))
+		if (add_ipu_page(fio, &bio, page))
 			goto alloc_new;
 	}
 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
