Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 562C15AEF29
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Sep 2022 17:44:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oVakA-0007dd-Mb;
	Tue, 06 Sep 2022 15:44:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oVak9-0007dW-Hl
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Sep 2022 15:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5+P69VIs8H9aCKa4nMvgqxxwi4j9KyNJAkJtwfoOxHE=; b=fjyj7IAvgGvTbt1pxHhQmRfgU+
 Nf4RGi/FbnNtUzrV8cKawTuDNJgV1U1ELvjFWWctAln2qEXp3Aex/589gEPu0yjL140GvinnGlBAW
 hVz4BgJbf+TFbB6XhsptJ2LEFP9+F3vvc2fD94AxgMFU5S0EAP5cl2dkTA6cBdFpb5l8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5+P69VIs8H9aCKa4nMvgqxxwi4j9KyNJAkJtwfoOxHE=; b=LFYNPO5tX6d0lzuWAYuiBbRrFd
 Fa02v75W/mKo5/wZ8Ni51qNyV/Tx1pqEapbyRH3V/SZrOzXIrQJssvg0BN4TaBIX6zUFE+gv78kb1
 +BI6De3oa9ipeCk5F1WGWxM+0RWIhv2M2XE1964YuvWSU1cq+yMuD1OPEeradzpg9o+s=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oVak8-0005xu-5D for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Sep 2022 15:44:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B7395B8190F;
 Tue,  6 Sep 2022 15:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4025DC433D6;
 Tue,  6 Sep 2022 15:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662479032;
 bh=QSmG++p/09QybC7ELM/h7cbufKIxRZCTacsyXuZKpRg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CaPHHFmzcnb25wT2OQrJepf2WrntVFZslP12RYLCAvNg+RSrL9nmHtbzEMqTnqKAc
 G5OZ0B/YUQUFv++BY9qYzR2KuDnf343TfKWKiBwzLLAHUGzAR4AfW9B9pHfeNHJYIK
 qiFQWTnj8g/3XQEx3DiUSpTthmcP6PeXl5k6GlAqA7xtahw2IMB1vJoPpzzn6g68q/
 wnHi60DwBS4zBN9WxH51xahY/ZOYYr7auX10ytVpNy0Nitrkcs91wChHxu4FlXopAE
 GyvxaJSvyeEIU+GGT2EX5ul2KOQHKUIYRzsPrvOkHC+vWp1b80CXay7LQv99VUcCZV
 Pbl3ilhABe+mQ==
Message-ID: <47a86f09-3e9b-f841-4191-d750feda6642@kernel.org>
Date: Tue, 6 Sep 2022 23:43:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org
References: <20220815235052.86545-1-ebiggers@kernel.org>
 <20220815235052.86545-3-ebiggers@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220815235052.86545-3-ebiggers@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/8/16 7:50, Eric Biggers wrote: > From: Eric Biggers
 <ebiggers@google.com> > > As a step towards freeing the PG_error flag for
 other uses, change ext4 > and f2fs to stop using PG_error to track [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oVak8-0005xu-5D
Subject: Re: [f2fs-dev] [PATCH v2 2/2] fsverity: stop using PG_error to
 track error status
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/8/16 7:50, Eric Biggers wrote:
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
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>   fs/ext4/readpage.c |  8 ++----
>   fs/f2fs/compress.c | 64 ++++++++++++++++++++++------------------------
>   fs/f2fs/data.c     | 52 ++++++++++++++++++++-----------------
>   fs/verity/verify.c | 12 ++++-----
>   4 files changed, 68 insertions(+), 68 deletions(-)
> 
> diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
> index 5ce4706f68a7c6..e604ea4e102b71 100644
> --- a/fs/ext4/readpage.c
> +++ b/fs/ext4/readpage.c
> @@ -75,14 +75,10 @@ static void __read_end_io(struct bio *bio)
>   	bio_for_each_segment_all(bv, bio, iter_all) {
>   		page = bv->bv_page;
>   
> -		/* PG_error was set if any post_read step failed */
> -		if (bio->bi_status || PageError(page)) {
> +		if (bio->bi_status)
>   			ClearPageUptodate(page);
> -			/* will re-read again later */
> -			ClearPageError(page);
> -		} else {
> +		else
>   			SetPageUptodate(page);
> -		}
>   		unlock_page(page);
>   	}
>   	if (bio->bi_private)
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 70e97075e535e5..f54fb3bb74197a 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1715,50 +1715,27 @@ static void f2fs_put_dic(struct decompress_io_ctx *dic, bool in_task)
>   	}
>   }
>   
> -/*
> - * Update and unlock the cluster's pagecache pages, and release the reference to
> - * the decompress_io_ctx that was being held for I/O completion.
> - */
> -static void __f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
> -				bool in_task)
> +static void f2fs_verify_cluster(struct work_struct *work)
>   {
> +	struct decompress_io_ctx *dic =
> +		container_of(work, struct decompress_io_ctx, verity_work);
>   	int i;
>   
> +	/* Verify, update, and unlock the decompressed pages. */
>   	for (i = 0; i < dic->cluster_size; i++) {
>   		struct page *rpage = dic->rpages[i];
>   
>   		if (!rpage)
>   			continue;
>   
> -		/* PG_error was set if verity failed. */
> -		if (failed || PageError(rpage)) {
> -			ClearPageUptodate(rpage);
> -			/* will re-read again later */
> -			ClearPageError(rpage);
> -		} else {
> +		if (fsverity_verify_page(rpage))
>   			SetPageUptodate(rpage);
> -		}
> +		else
> +			ClearPageUptodate(rpage);
>   		unlock_page(rpage);
>   	}
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
>   }
>   
>   /*
> @@ -1768,6 +1745,8 @@ static void f2fs_verify_cluster(struct work_struct *work)
>   void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
>   				bool in_task)
>   {
> +	int i;
> +
>   	if (!failed && dic->need_verity) {
>   		/*
>   		 * Note that to avoid deadlocks, the verity work can't be done
> @@ -1777,9 +1756,28 @@ void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
>   		 */
>   		INIT_WORK(&dic->verity_work, f2fs_verify_cluster);
>   		fsverity_enqueue_verify_work(&dic->verity_work);
> -	} else {
> -		__f2fs_decompress_end_io(dic, failed, in_task);

Will it be possible to clean up __f2fs_decompress_end_io() and
f2fs_verify_cluster(), they looks almost similar...

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
>   	}
> +
> +	/*
> +	 * Release the reference to the decompress_io_ctx that was being held
> +	 * for I/O completion.
> +	 */
> +	f2fs_put_dic(dic, in_task);
>   }
>   
>   /*
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 93cc2ec51c2aeb..34af260975a2e6 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -119,34 +119,41 @@ struct bio_post_read_ctx {
>   	block_t fs_blkaddr;
>   };
>   
> -static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
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
> +static void f2fs_finish_read_bio(struct bio *bio, bool in_task,
> +				 bool fail_compressed)

Not sure, fail_decompress or fail_decompression may looks more readable?

Thanks,

>   {
>   	struct bio_vec *bv;
>   	struct bvec_iter_all iter_all;
>   
> -	/*
> -	 * Update and unlock the bio's pagecache pages, and put the
> -	 * decompression context for any compressed pages.
> -	 */
>   	bio_for_each_segment_all(bv, bio, iter_all) {
>   		struct page *page = bv->bv_page;
>   
>   		if (f2fs_is_compressed_page(page)) {
> -			if (bio->bi_status)
> +			if (fail_compressed)
>   				f2fs_end_read_compressed_page(page, true, 0,
>   							in_task);
>   			f2fs_put_page_dic(page, in_task);
>   			continue;
>   		}
>   
> -		/* PG_error was set if verity failed. */
> -		if (bio->bi_status || PageError(page)) {
> +		if (bio->bi_status)
>   			ClearPageUptodate(page);
> -			/* will re-read again later */
> -			ClearPageError(page);
> -		} else {
> +		else
>   			SetPageUptodate(page);
> -		}
>   		dec_page_count(F2FS_P_SB(page), __read_io_type(page));
>   		unlock_page(page);
>   	}
> @@ -185,14 +192,17 @@ static void f2fs_verify_bio(struct work_struct *work)
>   			struct page *page = bv->bv_page;
>   
>   			if (!f2fs_is_compressed_page(page) &&
> -			    !fsverity_verify_page(page))
> -				SetPageError(page);
> +			    !fsverity_verify_page(page)) {
> +				bio->bi_status = BLK_STS_IOERR;
> +				break;
> +			}
>   		}
>   	} else {
>   		fsverity_verify_bio(bio);
>   	}
>   
> -	f2fs_finish_read_bio(bio, true);
> +	f2fs_finish_read_bio(bio, true /* in_task */,
> +			     false /* fail_compressed */);
>   }
>   
>   /*
> @@ -212,7 +222,7 @@ static void f2fs_verify_and_finish_bio(struct bio *bio, bool in_task)
>   		INIT_WORK(&ctx->work, f2fs_verify_bio);
>   		fsverity_enqueue_verify_work(&ctx->work);
>   	} else {
> -		f2fs_finish_read_bio(bio, in_task);
> +		f2fs_finish_read_bio(bio, in_task, false /* fail_compressed */);
>   	}
>   }
>   
> @@ -261,7 +271,8 @@ static void f2fs_post_read_work(struct work_struct *work)
>   	struct bio *bio = ctx->bio;
>   
>   	if ((ctx->enabled_steps & STEP_DECRYPT) && !fscrypt_decrypt_bio(bio)) {
> -		f2fs_finish_read_bio(bio, true);
> +		f2fs_finish_read_bio(bio, true /* in_task */,
> +				     true /* fail_compressed */);
>   		return;
>   	}
>   
> @@ -286,7 +297,7 @@ static void f2fs_read_end_io(struct bio *bio)
>   	}
>   
>   	if (bio->bi_status) {
> -		f2fs_finish_read_bio(bio, intask);
> +		f2fs_finish_read_bio(bio, intask, true /* fail_compressed */);
>   		return;
>   	}
>   
> @@ -1083,7 +1094,6 @@ static int f2fs_submit_page_read(struct inode *inode, struct page *page,
>   		bio_put(bio);
>   		return -EFAULT;
>   	}
> -	ClearPageError(page);
>   	inc_page_count(sbi, F2FS_RD_DATA);
>   	f2fs_update_iostat(sbi, FS_DATA_READ_IO, F2FS_BLKSIZE);
>   	__submit_bio(sbi, bio, DATA);
> @@ -2125,7 +2135,6 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
>   
>   	inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
>   	f2fs_update_iostat(F2FS_I_SB(inode), FS_DATA_READ_IO, F2FS_BLKSIZE);
> -	ClearPageError(page);
>   	*last_block_in_bio = block_nr;
>   	goto out;
>   out:
> @@ -2274,7 +2283,6 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>   		inc_page_count(sbi, F2FS_RD_DATA);
>   		f2fs_update_iostat(sbi, FS_DATA_READ_IO, F2FS_BLKSIZE);
>   		f2fs_update_iostat(sbi, FS_CDATA_READ_IO, F2FS_BLKSIZE);
> -		ClearPageError(page);
>   		*last_block_in_bio = blkaddr;
>   	}
>   
> @@ -2291,7 +2299,6 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>   	for (i = 0; i < cc->cluster_size; i++) {
>   		if (cc->rpages[i]) {
>   			ClearPageUptodate(cc->rpages[i]);
> -			ClearPageError(cc->rpages[i]);
>   			unlock_page(cc->rpages[i]);
>   		}
>   	}
> @@ -2388,7 +2395,6 @@ static int f2fs_mpage_readpages(struct inode *inode,
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   set_error_page:
>   #endif
> -			SetPageError(page);
>   			zero_user_segment(page, 0, PAGE_SIZE);
>   			unlock_page(page);
>   		}
> diff --git a/fs/verity/verify.c b/fs/verity/verify.c
> index 14e2fb49cff561..556dfbd4698dea 100644
> --- a/fs/verity/verify.c
> +++ b/fs/verity/verify.c
> @@ -210,9 +210,8 @@ EXPORT_SYMBOL_GPL(fsverity_verify_page);
>    * @bio: the bio to verify
>    *
>    * Verify a set of pages that have just been read from a verity file.  The pages
> - * must be pagecache pages that are still locked and not yet uptodate.  Pages
> - * that fail verification are set to the Error state.  Verification is skipped
> - * for pages already in the Error state, e.g. due to fscrypt decryption failure.
> + * must be pagecache pages that are still locked and not yet uptodate.  If a
> + * page fails verification, then bio->bi_status is set to an error status.
>    *
>    * This is a helper function for use by the ->readahead() method of filesystems
>    * that issue bios to read data directly into the page cache.  Filesystems that
> @@ -254,9 +253,10 @@ void fsverity_verify_bio(struct bio *bio)
>   		unsigned long level0_ra_pages =
>   			min(max_ra_pages, params->level0_blocks - level0_index);
>   
> -		if (!PageError(page) &&
> -		    !verify_page(inode, vi, req, page, level0_ra_pages))
> -			SetPageError(page);
> +		if (!verify_page(inode, vi, req, page, level0_ra_pages)) {
> +			bio->bi_status = BLK_STS_IOERR;
> +			break;
> +		}
>   	}
>   
>   	fsverity_free_hash_request(params->hash_alg, req);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
