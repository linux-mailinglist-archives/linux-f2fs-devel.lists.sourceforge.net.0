Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D37EC916D6
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 18 Aug 2019 15:46:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzLVO-0004n9-LP; Sun, 18 Aug 2019 13:45:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hzLVL-0004mP-Lo
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 18 Aug 2019 13:45:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uYkzXvYsO3ZJgsxbcl7apIJHV1co+zdg/mUw4XF2G54=; b=HBwX83MBOQqJuGj+y4O4i1R+dD
 zG9mvCtJEJY8NelHuV01HuW/PnlJCwEx/7/3BUv5S1CJvk03N+lmkHrIzOEBrDrxxPWOka4icuuDN
 Ak8x0MErXKAO1WsH4j17Sh3wDYyW+k7KwBj9h/zOQnoVr1i1bmZic25qWHJf7df/aoJk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uYkzXvYsO3ZJgsxbcl7apIJHV1co+zdg/mUw4XF2G54=; b=K6Tw5mRl++LfHrvtB7AQtL1rPd
 1ce8oz0URHN3cVVUyW6qVgVynUSL3jYZD3e5lSzAJT8I/EuOBGrBHU3nVl8s2uORTkmZ5KM2HraHf
 3D2MtNr4f+LQf8INup/nAvJqWBa07/zpY73inFvqfpfneQvo6G/hC8k4zdjzNk1GtnKs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hzLVK-00Agsu-7N
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 18 Aug 2019 13:45:55 +0000
Received: from [192.168.0.101] (unknown [180.111.132.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B66CD20851;
 Sun, 18 Aug 2019 13:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566135946;
 bh=Nr7rrKHcvy1z+eNsxwIvCzsl0uUvAgpFJWH0E+a5SFk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jmWiQRoHUcze1MQzEu6Er2b9AogczNjGV/+GFvIGM2/Kwn2GPjU5sB2beckOjfN8z
 5207OnQ2zs9mxQv2NE0Oi9stDt6oflWt++DhBc+IhfGqqi/Gq5bbEvsxKxnIQpaCuI
 mTGlbJnDi6kdukR2p+x6rVqwS/9l0yN/JHS4mCy0=
To: Chandan Rajendra <chandan@linux.ibm.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org
References: <20190816061804.14840-1-chandan@linux.ibm.com>
 <20190816061804.14840-6-chandan@linux.ibm.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <bb3dc624-1249-2418-f9da-93da8c11e7f5@kernel.org>
Date: Sun, 18 Aug 2019 21:45:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190816061804.14840-6-chandan@linux.ibm.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1hzLVK-00Agsu-7N
Subject: Re: [f2fs-dev] [PATCH V4 5/8] f2fs: Use read_callbacks for
 decrypting file data
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
Cc: ebiggers@kernel.org, tytso@mit.edu, hch@infradead.org,
 adilger.kernel@dilger.ca, chandanrmail@gmail.com, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chandan,

On 2019-8-16 14:18, Chandan Rajendra wrote:
> F2FS has a copy of "post read processing" code using which encrypted
> file data is decrypted. This commit replaces it to make use of the
> generic read_callbacks facility.

I remember that previously Jaegeuk had mentioned f2fs will support compression
later, and it needs to reuse 'post read processing' fwk.

There is very initial version of compression feature in below link:

https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/log/?h=compression

So my concern is how can we uplift the most common parts of this fwk into vfs,
and meanwhile keeping the ability and flexibility when introducing private
feature/step in specified filesytem(now f2fs)?

According to current f2fs compression's requirement, maybe we can expand to

- support callback to let filesystem set the function for the flow in
decompression/verity/decryption step.
- support to use individual/common workqueue according the parameter.

Any thoughts?

Thanks,

> 
> Signed-off-by: Chandan Rajendra <chandan@linux.ibm.com>
> ---
>  fs/f2fs/data.c  | 109 ++++--------------------------------------------
>  fs/f2fs/f2fs.h  |   2 -
>  fs/f2fs/super.c |   9 +---
>  3 files changed, 11 insertions(+), 109 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 757f050c650a..3cf1eca2ece9 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -18,6 +18,7 @@
>  #include <linux/uio.h>
>  #include <linux/cleancache.h>
>  #include <linux/sched/signal.h>
> +#include <linux/read_callbacks.h>
>  
>  #include "f2fs.h"
>  #include "node.h"
> @@ -25,11 +26,6 @@
>  #include "trace.h"
>  #include <trace/events/f2fs.h>
>  
> -#define NUM_PREALLOC_POST_READ_CTXS	128
> -
> -static struct kmem_cache *bio_post_read_ctx_cache;
> -static mempool_t *bio_post_read_ctx_pool;
> -
>  static bool __is_cp_guaranteed(struct page *page)
>  {
>  	struct address_space *mapping = page->mapping;
> @@ -69,19 +65,6 @@ static enum count_type __read_io_type(struct page *page)
>  	return F2FS_RD_DATA;
>  }
>  
> -/* postprocessing steps for read bios */
> -enum bio_post_read_step {
> -	STEP_INITIAL = 0,
> -	STEP_DECRYPT,
> -};
> -
> -struct bio_post_read_ctx {
> -	struct bio *bio;
> -	struct work_struct work;
> -	unsigned int cur_step;
> -	unsigned int enabled_steps;
> -};
> -
>  static void __read_end_io(struct bio *bio)
>  {
>  	struct page *page;
> @@ -93,7 +76,7 @@ static void __read_end_io(struct bio *bio)
>  		page = bv->bv_page;
>  
>  		/* PG_error was set if any post_read step failed */
> -		if (bio->bi_status || PageError(page)) {
> +		if (bio->bi_status || read_callbacks_failed(page)) {
>  			ClearPageUptodate(page);
>  			/* will re-read again later */
>  			ClearPageError(page);
> @@ -103,42 +86,8 @@ static void __read_end_io(struct bio *bio)
>  		dec_page_count(F2FS_P_SB(page), __read_io_type(page));
>  		unlock_page(page);
>  	}
> -	if (bio->bi_private)
> -		mempool_free(bio->bi_private, bio_post_read_ctx_pool);
> -	bio_put(bio);
> -}
>  
> -static void bio_post_read_processing(struct bio_post_read_ctx *ctx);
> -
> -static void decrypt_work(struct work_struct *work)
> -{
> -	struct bio_post_read_ctx *ctx =
> -		container_of(work, struct bio_post_read_ctx, work);
> -
> -	fscrypt_decrypt_bio(ctx->bio);
> -
> -	bio_post_read_processing(ctx);
> -}
> -
> -static void bio_post_read_processing(struct bio_post_read_ctx *ctx)
> -{
> -	switch (++ctx->cur_step) {
> -	case STEP_DECRYPT:
> -		if (ctx->enabled_steps & (1 << STEP_DECRYPT)) {
> -			INIT_WORK(&ctx->work, decrypt_work);
> -			fscrypt_enqueue_decrypt_work(&ctx->work);
> -			return;
> -		}
> -		ctx->cur_step++;
> -		/* fall-through */
> -	default:
> -		__read_end_io(ctx->bio);
> -	}
> -}
> -
> -static bool f2fs_bio_post_read_required(struct bio *bio)
> -{
> -	return bio->bi_private && !bio->bi_status;
> +	bio_put(bio);
>  }
>  
>  static void f2fs_read_end_io(struct bio *bio)
> @@ -149,15 +98,7 @@ static void f2fs_read_end_io(struct bio *bio)
>  		bio->bi_status = BLK_STS_IOERR;
>  	}
>  
> -	if (f2fs_bio_post_read_required(bio)) {
> -		struct bio_post_read_ctx *ctx = bio->bi_private;
> -
> -		ctx->cur_step = STEP_INITIAL;
> -		bio_post_read_processing(ctx);
> -		return;
> -	}
> -
> -	__read_end_io(bio);
> +	read_callbacks_endio_bio(bio, __read_end_io);
>  }
>  
>  static void f2fs_write_end_io(struct bio *bio)
> @@ -556,8 +497,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	struct bio *bio;
> -	struct bio_post_read_ctx *ctx;
> -	unsigned int post_read_steps = 0;
> +	int err;
>  
>  	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC))
>  		return ERR_PTR(-EFAULT);
> @@ -569,17 +509,10 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
>  	bio->bi_end_io = f2fs_read_end_io;
>  	bio_set_op_attrs(bio, REQ_OP_READ, op_flag);
>  
> -	if (f2fs_encrypted_file(inode))
> -		post_read_steps |= 1 << STEP_DECRYPT;
> -	if (post_read_steps) {
> -		ctx = mempool_alloc(bio_post_read_ctx_pool, GFP_NOFS);
> -		if (!ctx) {
> -			bio_put(bio);
> -			return ERR_PTR(-ENOMEM);
> -		}
> -		ctx->bio = bio;
> -		ctx->enabled_steps = post_read_steps;
> -		bio->bi_private = ctx;
> +	err = read_callbacks_setup_bio(inode, bio);
> +	if (err) {
> +		bio_put(bio);
> +		return ERR_PTR(err);
>  	}
>  
>  	return bio;
> @@ -2860,27 +2793,3 @@ void f2fs_clear_page_cache_dirty_tag(struct page *page)
>  						PAGECACHE_TAG_DIRTY);
>  	xa_unlock_irqrestore(&mapping->i_pages, flags);
>  }
> -
> -int __init f2fs_init_post_read_processing(void)
> -{
> -	bio_post_read_ctx_cache = KMEM_CACHE(bio_post_read_ctx, 0);
> -	if (!bio_post_read_ctx_cache)
> -		goto fail;
> -	bio_post_read_ctx_pool =
> -		mempool_create_slab_pool(NUM_PREALLOC_POST_READ_CTXS,
> -					 bio_post_read_ctx_cache);
> -	if (!bio_post_read_ctx_pool)
> -		goto fail_free_cache;
> -	return 0;
> -
> -fail_free_cache:
> -	kmem_cache_destroy(bio_post_read_ctx_cache);
> -fail:
> -	return -ENOMEM;
> -}
> -
> -void __exit f2fs_destroy_post_read_processing(void)
> -{
> -	mempool_destroy(bio_post_read_ctx_pool);
> -	kmem_cache_destroy(bio_post_read_ctx_cache);
> -}
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 87f75ebd2fd6..cea79321b794 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3125,8 +3125,6 @@ void f2fs_destroy_checkpoint_caches(void);
>  /*
>   * data.c
>   */
> -int f2fs_init_post_read_processing(void);
> -void f2fs_destroy_post_read_processing(void);
>  void f2fs_submit_merged_write(struct f2fs_sb_info *sbi, enum page_type type);
>  void f2fs_submit_merged_write_cond(struct f2fs_sb_info *sbi,
>  				struct inode *inode, struct page *page,
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 11b3a039a188..d7bbb4f1fdb3 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3597,15 +3597,11 @@ static int __init init_f2fs_fs(void)
>  	err = register_filesystem(&f2fs_fs_type);
>  	if (err)
>  		goto free_shrinker;
> +
>  	f2fs_create_root_stats();
> -	err = f2fs_init_post_read_processing();
> -	if (err)
> -		goto free_root_stats;
> +
>  	return 0;
>  
> -free_root_stats:
> -	f2fs_destroy_root_stats();
> -	unregister_filesystem(&f2fs_fs_type);
>  free_shrinker:
>  	unregister_shrinker(&f2fs_shrinker_info);
>  free_sysfs:
> @@ -3626,7 +3622,6 @@ static int __init init_f2fs_fs(void)
>  
>  static void __exit exit_f2fs_fs(void)
>  {
> -	f2fs_destroy_post_read_processing();
>  	f2fs_destroy_root_stats();
>  	unregister_filesystem(&f2fs_fs_type);
>  	unregister_shrinker(&f2fs_shrinker_info);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
