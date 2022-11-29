Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B99E563B9F5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Nov 2022 07:49:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozuQL-00007W-3r;
	Tue, 29 Nov 2022 06:48:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ozuQK-00007N-4D
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Nov 2022 06:48:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5DtxtfEDZ3JwfrP+Cvf/62x126HhfvTjlt1ywv5OPHU=; b=TGpy7suz3W+tizPNZj6W85qE7P
 Z79MolomEnRIts4W10NI3njtY0clIl0eOYubd5KqiMgWbtwiJuSHaK4KY+AEVbTgLZIMvVYEh0hAD
 ktD6HTsNBDx+1NvTA/HiMZfp7wSilvzjS+vzsKDFO2oikxtlU6gSsysA3ByE/WmKOV7s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5DtxtfEDZ3JwfrP+Cvf/62x126HhfvTjlt1ywv5OPHU=; b=Bvs6+/7CEuHJn4y++qaFDbDMkC
 8kUJ2a5Ohxy88OpINhLbA1Itli2yMuTmkWdSIsQJslwPFHuqPIbQG3hMYGZKohKdyf9KCFooT6Hj3
 vwYO7xDVzXDwZu4UOWvKxG3kFe+WxLMvRDW0rU60x9bqVYRCWfNDKW0x3mvhMw/5f+Pc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozuQF-0000Rx-KF for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Nov 2022 06:48:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3218DB81028;
 Tue, 29 Nov 2022 06:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EDCAC433C1;
 Tue, 29 Nov 2022 06:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669704523;
 bh=vGB1xVmyHl45cx3CdfCj9TiDfQQKceMDFQaERyFXiNk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NfZtgkFnLTvN/XsXCQAWmjs6esq4PWudemw+gbRJSSheC/fKG43br4bHT7aWv6gzy
 0AloVWrbduP+ZRaNJWr1ODZwf0CSlrImfry5KAjAFARyKt2HPpT54RUP5OWmdtYuAn
 dKFPaI3l7j7abULfgiHhGculQgcqFWvqQwAPIEeZD1VOWP3CmBDYWEbmoHEbZaGtGy
 eOK9EOhGxKtwcCpmoBDAJ9MOvbI/rCL0l0cWpu74ulBvqQtFa9Xn9zgnVz4kZLBeX6
 U6oYMSbFDVts5DrtGGcW/soxM3gkVNNaX8zuNwtr8xYTwWuPj7qCqaEp1btWNCALI3
 vZWEnyEJKf67A==
Date: Mon, 28 Nov 2022 22:48:41 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <Y4WrSeIf+E6+tL1y@google.com>
References: <20221125190642.12787-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221125190642.12787-1-ebiggers@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/25,
 Eric Biggers wrote: > From: Eric Biggers <ebiggers@google.com>
 > > As a step towards freeing the PG_error flag for other uses, change ext4
 > and f2fs to stop using PG_error to track verity e [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ozuQF-0000Rx-KF
Subject: Re: [f2fs-dev] [PATCH v4] fsverity: stop using PG_error to track
 error status
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
Cc: Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/25, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> As a step towards freeing the PG_error flag for other uses, change ext4
> and f2fs to stop using PG_error to track verity errors.  Instead, if a
> verity error occurs, just mark the whole bio as failed.  The coarser
> granularity isn't really a problem since it isn't any worse than what
> the block layer provides, and errors from a multi-page readahead aren't
> reported to applications unless a single-page read fails too.
> 
> f2fs supports compression, which makes the f2fs changes a bit more
> complicated than desired, but the basic premise still works.
> 
> Note: there are still a few uses of PageError in f2fs, but they are on
> the write path, so they are unrelated and this patch doesn't touch them.
> 
> Reviewed-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> 
> v4: Added a comment for decompression_attempted, added a paragraph to
>     the commit message, and added Chao's Reviewed-by.
> 
> v3: made a small simplification to the f2fs changes.  Also dropped the
>     fscrypt patch since it is upstream now.
> 
>  fs/ext4/readpage.c |  8 ++----
>  fs/f2fs/compress.c | 64 ++++++++++++++++++++++------------------------
>  fs/f2fs/data.c     | 53 +++++++++++++++++++++++---------------
>  fs/verity/verify.c | 12 ++++-----
>  4 files changed, 72 insertions(+), 65 deletions(-)
> 
> diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
> index 3d21eae267fca..e604ea4e102b7 100644
> --- a/fs/ext4/readpage.c
> +++ b/fs/ext4/readpage.c
> @@ -75,14 +75,10 @@ static void __read_end_io(struct bio *bio)
>  	bio_for_each_segment_all(bv, bio, iter_all) {
>  		page = bv->bv_page;
>  
> -		/* PG_error was set if verity failed. */
> -		if (bio->bi_status || PageError(page)) {
> +		if (bio->bi_status)
>  			ClearPageUptodate(page);
> -			/* will re-read again later */
> -			ClearPageError(page);
> -		} else {
> +		else
>  			SetPageUptodate(page);
> -		}
>  		unlock_page(page);
>  	}
>  	if (bio->bi_private)
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index d315c2de136f2..2b7a5cc4ed662 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1711,50 +1711,27 @@ static void f2fs_put_dic(struct decompress_io_ctx *dic, bool in_task)
>  	}
>  }
>  
> -/*
> - * Update and unlock the cluster's pagecache pages, and release the reference to
> - * the decompress_io_ctx that was being held for I/O completion.
> - */
> -static void __f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
> -				bool in_task)
> +static void f2fs_verify_cluster(struct work_struct *work)
>  {
> +	struct decompress_io_ctx *dic =
> +		container_of(work, struct decompress_io_ctx, verity_work);
>  	int i;
>  
> +	/* Verify, update, and unlock the decompressed pages. */
>  	for (i = 0; i < dic->cluster_size; i++) {
>  		struct page *rpage = dic->rpages[i];
>  
>  		if (!rpage)
>  			continue;
>  
> -		/* PG_error was set if verity failed. */
> -		if (failed || PageError(rpage)) {
> -			ClearPageUptodate(rpage);
> -			/* will re-read again later */
> -			ClearPageError(rpage);
> -		} else {
> +		if (fsverity_verify_page(rpage))
>  			SetPageUptodate(rpage);
> -		}
> +		else
> +			ClearPageUptodate(rpage);
>  		unlock_page(rpage);
>  	}
>  
> -	f2fs_put_dic(dic, in_task);
> -}
> -
> -static void f2fs_verify_cluster(struct work_struct *work)
> -{
> -	struct decompress_io_ctx *dic =
> -		container_of(work, struct decompress_io_ctx, verity_work);
> -	int i;
> -
> -	/* Verify the cluster's decompressed pages with fs-verity. */
> -	for (i = 0; i < dic->cluster_size; i++) {
> -		struct page *rpage = dic->rpages[i];
> -
> -		if (rpage && !fsverity_verify_page(rpage))
> -			SetPageError(rpage);
> -	}
> -
> -	__f2fs_decompress_end_io(dic, false, true);
> +	f2fs_put_dic(dic, true);
>  }
>  
>  /*
> @@ -1764,6 +1741,8 @@ static void f2fs_verify_cluster(struct work_struct *work)
>  void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
>  				bool in_task)
>  {
> +	int i;
> +
>  	if (!failed && dic->need_verity) {
>  		/*
>  		 * Note that to avoid deadlocks, the verity work can't be done
> @@ -1773,9 +1752,28 @@ void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
>  		 */
>  		INIT_WORK(&dic->verity_work, f2fs_verify_cluster);
>  		fsverity_enqueue_verify_work(&dic->verity_work);
> -	} else {
> -		__f2fs_decompress_end_io(dic, failed, in_task);
> +		return;
> +	}
> +
> +	/* Update and unlock the cluster's pagecache pages. */
> +	for (i = 0; i < dic->cluster_size; i++) {
> +		struct page *rpage = dic->rpages[i];
> +
> +		if (!rpage)
> +			continue;
> +
> +		if (failed)
> +			ClearPageUptodate(rpage);
> +		else
> +			SetPageUptodate(rpage);
> +		unlock_page(rpage);
>  	}
> +
> +	/*
> +	 * Release the reference to the decompress_io_ctx that was being held
> +	 * for I/O completion.
> +	 */
> +	f2fs_put_dic(dic, in_task);
>  }
>  
>  /*
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index a71e818cd67b4..1ae8da259d6c5 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -116,43 +116,56 @@ struct bio_post_read_ctx {
>  	struct f2fs_sb_info *sbi;
>  	struct work_struct work;
>  	unsigned int enabled_steps;
> +	/*
> +	 * decompression_attempted keeps track of whether
> +	 * f2fs_end_read_compressed_page() has been called on the pages in the
> +	 * bio that belong to a compressed cluster yet.
> +	 */
> +	bool decompression_attempted;
>  	block_t fs_blkaddr;
>  };
>  
> +/*
> + * Update and unlock a bio's pages, and free the bio.
> + *
> + * This marks pages up-to-date only if there was no error in the bio (I/O error,
> + * decryption error, or verity error), as indicated by bio->bi_status.
> + *
> + * "Compressed pages" (pagecache pages backed by a compressed cluster on-disk)
> + * aren't marked up-to-date here, as decompression is done on a per-compression-
> + * cluster basis rather than a per-bio basis.  Instead, we only must do two
> + * things for each compressed page here: call f2fs_end_read_compressed_page()
> + * with failed=true if an error occurred before it would have normally gotten
> + * called (i.e., I/O error or decryption error, but *not* verity error), and
> + * release the bio's reference to the decompress_io_ctx of the page's cluster.
> + */
>  static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
>  {
>  	struct bio_vec *bv;
>  	struct bvec_iter_all iter_all;
> +	struct bio_post_read_ctx *ctx = bio->bi_private;
>  
> -	/*
> -	 * Update and unlock the bio's pagecache pages, and put the
> -	 * decompression context for any compressed pages.
> -	 */
>  	bio_for_each_segment_all(bv, bio, iter_all) {
>  		struct page *page = bv->bv_page;
>  
>  		if (f2fs_is_compressed_page(page)) {
> -			if (bio->bi_status)
> +			if (!ctx->decompression_attempted)

If seems this causes a panic due to the ctx nullified by f2fs_verify_bio.

>  				f2fs_end_read_compressed_page(page, true, 0,
>  							in_task);
>  			f2fs_put_page_dic(page, in_task);
>  			continue;
>  		}
>  
> -		/* PG_error was set if verity failed. */
> -		if (bio->bi_status || PageError(page)) {
> +		if (bio->bi_status)
>  			ClearPageUptodate(page);
> -			/* will re-read again later */
> -			ClearPageError(page);
> -		} else {
> +		else
>  			SetPageUptodate(page);
> -		}
>  		dec_page_count(F2FS_P_SB(page), __read_io_type(page));
>  		unlock_page(page);
>  	}
>  
> -	if (bio->bi_private)
> -		mempool_free(bio->bi_private, bio_post_read_ctx_pool);
> +	if (ctx)
> +		mempool_free(ctx, bio_post_read_ctx_pool);
>  	bio_put(bio);
>  }
>  
> @@ -185,8 +198,10 @@ static void f2fs_verify_bio(struct work_struct *work)
>  			struct page *page = bv->bv_page;
>  
>  			if (!f2fs_is_compressed_page(page) &&
> -			    !fsverity_verify_page(page))
> -				SetPageError(page);
> +			    !fsverity_verify_page(page)) {
> +				bio->bi_status = BLK_STS_IOERR;
> +				break;
> +			}
>  		}
>  	} else {
>  		fsverity_verify_bio(bio);
> @@ -245,6 +260,8 @@ static void f2fs_handle_step_decompress(struct bio_post_read_ctx *ctx,
>  		blkaddr++;
>  	}
>  
> +	ctx->decompression_attempted = true;
> +
>  	/*
>  	 * Optimization: if all the bio's pages are compressed, then scheduling
>  	 * the per-bio verity work is unnecessary, as verity will be fully
> @@ -1062,6 +1079,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
>  		ctx->sbi = sbi;
>  		ctx->enabled_steps = post_read_steps;
>  		ctx->fs_blkaddr = blkaddr;
> +		ctx->decompression_attempted = false;
>  		bio->bi_private = ctx;
>  	}
>  	iostat_alloc_and_bind_ctx(sbi, bio, ctx);
> @@ -1089,7 +1107,6 @@ static int f2fs_submit_page_read(struct inode *inode, struct page *page,
>  		bio_put(bio);
>  		return -EFAULT;
>  	}
> -	ClearPageError(page);
>  	inc_page_count(sbi, F2FS_RD_DATA);
>  	f2fs_update_iostat(sbi, NULL, FS_DATA_READ_IO, F2FS_BLKSIZE);
>  	__submit_bio(sbi, bio, DATA);
> @@ -2141,7 +2158,6 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
>  	inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
>  	f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
>  							F2FS_BLKSIZE);
> -	ClearPageError(page);
>  	*last_block_in_bio = block_nr;
>  	goto out;
>  out:
> @@ -2289,7 +2305,6 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  
>  		inc_page_count(sbi, F2FS_RD_DATA);
>  		f2fs_update_iostat(sbi, inode, FS_DATA_READ_IO, F2FS_BLKSIZE);
> -		ClearPageError(page);
>  		*last_block_in_bio = blkaddr;
>  	}
>  
> @@ -2306,7 +2321,6 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  	for (i = 0; i < cc->cluster_size; i++) {
>  		if (cc->rpages[i]) {
>  			ClearPageUptodate(cc->rpages[i]);
> -			ClearPageError(cc->rpages[i]);
>  			unlock_page(cc->rpages[i]);
>  		}
>  	}
> @@ -2403,7 +2417,6 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  set_error_page:
>  #endif
> -			SetPageError(page);
>  			zero_user_segment(page, 0, PAGE_SIZE);
>  			unlock_page(page);
>  		}
> diff --git a/fs/verity/verify.c b/fs/verity/verify.c
> index bde8c9b7d25f6..961ba248021f9 100644
> --- a/fs/verity/verify.c
> +++ b/fs/verity/verify.c
> @@ -200,9 +200,8 @@ EXPORT_SYMBOL_GPL(fsverity_verify_page);
>   * @bio: the bio to verify
>   *
>   * Verify a set of pages that have just been read from a verity file.  The pages
> - * must be pagecache pages that are still locked and not yet uptodate.  Pages
> - * that fail verification are set to the Error state.  Verification is skipped
> - * for pages already in the Error state, e.g. due to fscrypt decryption failure.
> + * must be pagecache pages that are still locked and not yet uptodate.  If a
> + * page fails verification, then bio->bi_status is set to an error status.
>   *
>   * This is a helper function for use by the ->readahead() method of filesystems
>   * that issue bios to read data directly into the page cache.  Filesystems that
> @@ -244,9 +243,10 @@ void fsverity_verify_bio(struct bio *bio)
>  		unsigned long level0_ra_pages =
>  			min(max_ra_pages, params->level0_blocks - level0_index);
>  
> -		if (!PageError(page) &&
> -		    !verify_page(inode, vi, req, page, level0_ra_pages))
> -			SetPageError(page);
> +		if (!verify_page(inode, vi, req, page, level0_ra_pages)) {
> +			bio->bi_status = BLK_STS_IOERR;
> +			break;
> +		}
>  	}
>  
>  	fsverity_free_hash_request(params->hash_alg, req);
> 
> base-commit: f0c4d9fc9cc9462659728d168387191387e903cc
> -- 
> 2.38.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
