Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 013761008ED
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Nov 2019 17:12:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iWjdH-0003kN-DI; Mon, 18 Nov 2019 16:12:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iWjdG-0003kB-DP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Nov 2019 16:12:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3m8trqIitZC43fOmb+GIHRVFcRYg80MmYunKt936Yqs=; b=aEWKC2p7YQUn4nZ/sPqRvttPZZ
 ENINxPyb3SM4zBKeS/3hbJ73pCwlV8CYwUPbe4Td/teN/uj1bV3y8lTFbDuM2zju5QcMQ+rGwhBas
 e1PwQUEFLmQ6+O6mogZ5x6zCUoH5wMX4hhJEjrnye0YT0c3tfVgFQ0a+fKoiGlmqpuhM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3m8trqIitZC43fOmb+GIHRVFcRYg80MmYunKt936Yqs=; b=JP7EkBT/gbjgwTHJiErzOOZfJK
 EgWNnK/by6cWVVDYdWR8UZcWTo8EpICL69yqoGu+9FMUd+PYEdFLgeTyi3dJNBdRtLWgdewBzyAbL
 zQWJVBGOq/jNP+UxSDxisB2qLysU0LFWNNNZK9qnDXHRH4eFJDL2DWHIpqHRlgxw0UhA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iWjd7-004nHi-OW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Nov 2019 16:12:05 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4BE50206DA;
 Mon, 18 Nov 2019 16:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574093507;
 bh=OYInCHKS0xP1rv1ivstUiuqvcHVdGENRsN5G898Ykso=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zg0ZSOT6pjPN8tMdkwFwfy7iY76RwQfc1VmjMp1g8yambClQSetgEVToSul1ivLiJ
 1ZUGn8856hAEwmQLBoZFK0PndNp/cg+2Dkl/elESZCaq/ieIkgZE2T/jbenoLNep/N
 SfFx3Qvn3qIIxrMQM6jB5yGBciDBqgBpGsQ0FfXE=
Date: Mon, 18 Nov 2019 08:11:46 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20191118161146.GB41670@jaegeuk-macbookpro.roam.corp.google.com>
References: <20191022171602.93637-1-jaegeuk@kernel.org>
 <20191022171602.93637-2-jaegeuk@kernel.org>
 <20191027225006.GA321938@sol.localdomain>
 <da214cdc-0074-b7bf-7761-d4c4ad3d4f6a@huawei.com>
 <20191030025512.GA4791@sol.localdomain>
 <97c33fa1-15af-b319-29a1-22f254a26c0a@huawei.com>
 <20191030170246.GB693@sol.localdomain>
 <899f99e9-fdc7-a84b-14ec-623fa3a5e164@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <899f99e9-fdc7-a84b-14ec-623fa3a5e164@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iWjd7-004nHi-OW
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: support data compression
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/13, Chao Yu wrote:
> Hi Jaegeuk,
> 
> I've split workqueue for fsverity, please test compression based on last patch.
> 
> I shutdown F2FS_FS_COMPRESSION config, it looks all verity testcases can pass, will
> do more test for compress/encrypt/fsverity combination later.

Thanks, I applied and start some tests.

> 
> The diff is as below, code base is last g-dev-test branch:
> 
> >From 5b51682bc3013b8de6dee4906865181c3ded435f Mon Sep 17 00:00:00 2001
> From: Chao Yu <yuchao0@huawei.com>
> Date: Tue, 12 Nov 2019 10:03:21 +0800
> Subject: [PATCH INCREMENT] f2fs: compress: split workqueue for fsverity
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/compress.c | 16 +++++---
>  fs/f2fs/data.c     | 94 +++++++++++++++++++++++++++++++++++-----------
>  fs/f2fs/f2fs.h     |  2 +-
>  3 files changed, 84 insertions(+), 28 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index f4ce825f12b4..254275325890 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -377,7 +377,7 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
> 
>  	dec_page_count(sbi, F2FS_RD_DATA);
> 
> -	if (bio->bi_status)
> +	if (bio->bi_status || PageError(page))
>  		dic->failed = true;
> 
>  	if (refcount_dec_not_one(&dic->ref))
> @@ -419,10 +419,14 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
>  out_vunmap_rbuf:
>  	vunmap(dic->rbuf);
>  out_free_dic:
> -	f2fs_set_cluster_uptodate(dic->rpages, dic->cluster_size, ret, verity);
> +	if (!verity)
> +		f2fs_decompress_end_io(dic->rpages, dic->cluster_size,
> +								ret, false);
> +
>  	trace_f2fs_decompress_pages_end(dic->inode, dic->cluster_idx,
> -								dic->clen, ret);
> -	f2fs_free_dic(dic);
> +							dic->clen, ret);
> +	if (!verity)
> +		f2fs_free_dic(dic);
>  }
> 
>  static bool is_page_in_cluster(struct compress_ctx *cc, pgoff_t index)
> @@ -1086,7 +1090,7 @@ void f2fs_free_dic(struct decompress_io_ctx *dic)
>  	kfree(dic);
>  }
> 
> -void f2fs_set_cluster_uptodate(struct page **rpages,
> +void f2fs_decompress_end_io(struct page **rpages,
>  			unsigned int cluster_size, bool err, bool verity)
>  {
>  	int i;
> @@ -1108,4 +1112,4 @@ void f2fs_set_cluster_uptodate(struct page **rpages,
>  		}
>  		unlock_page(rpage);
>  	}
> -}
> +}
> \ No newline at end of file
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index c9362a53f8a1..2d64c6ffee84 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -98,7 +98,7 @@ static void __read_end_io(struct bio *bio, bool compr, bool verity)
>  		page = bv->bv_page;
> 
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> -		if (compr && PagePrivate(page)) {
> +		if (compr && f2fs_is_compressed_page(page)) {
>  			f2fs_decompress_pages(bio, page, verity);
>  			continue;
>  		}
> @@ -115,9 +115,14 @@ static void __read_end_io(struct bio *bio, bool compr, bool verity)
>  		dec_page_count(F2FS_P_SB(page), __read_io_type(page));
>  		unlock_page(page);
>  	}
> -	if (bio->bi_private)
> -		mempool_free(bio->bi_private, bio_post_read_ctx_pool);
> -	bio_put(bio);
> +}
> +
> +static void f2fs_release_read_bio(struct bio *bio);
> +static void __f2fs_read_end_io(struct bio *bio, bool compr, bool verity)
> +{
> +	if (!compr)
> +		__read_end_io(bio, false, verity);
> +	f2fs_release_read_bio(bio);
>  }
> 
>  static void f2fs_decompress_bio(struct bio *bio, bool verity)
> @@ -127,19 +132,50 @@ static void f2fs_decompress_bio(struct bio *bio, bool verity)
> 
>  static void bio_post_read_processing(struct bio_post_read_ctx *ctx);
> 
> -static void decrypt_work(struct bio_post_read_ctx *ctx)
> +static void f2fs_decrypt_work(struct bio_post_read_ctx *ctx)
>  {
>  	fscrypt_decrypt_bio(ctx->bio);
>  }
> 
> -static void decompress_work(struct bio_post_read_ctx *ctx, bool verity)
> +static void f2fs_decompress_work(struct bio_post_read_ctx *ctx)
> +{
> +	f2fs_decompress_bio(ctx->bio, ctx->enabled_steps & (1 << STEP_VERITY));
> +}
> +
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +void f2fs_verify_pages(struct page **rpages, unsigned int cluster_size)
>  {
> -	f2fs_decompress_bio(ctx->bio, verity);
> +	f2fs_decompress_end_io(rpages, cluster_size, false, true);
>  }
> 
> -static void verity_work(struct bio_post_read_ctx *ctx)
> +static void f2fs_verify_bio(struct bio *bio)
>  {
> +	struct page *page = bio_first_page_all(bio);
> +	struct decompress_io_ctx *dic =
> +			(struct decompress_io_ctx *)page_private(page);
> +
> +	f2fs_verify_pages(dic->rpages, dic->cluster_size);
> +	f2fs_free_dic(dic);
> +}
> +#endif
> +
> +static void f2fs_verity_work(struct work_struct *work)
> +{
> +	struct bio_post_read_ctx *ctx =
> +		container_of(work, struct bio_post_read_ctx, work);
> +
> +#ifdef CONFIG_F2FS_FS_COMPRESSION
> +	/* previous step is decompression */
> +	if (ctx->enabled_steps & (1 << STEP_DECOMPRESS)) {
> +
> +		f2fs_verify_bio(ctx->bio);
> +		f2fs_release_read_bio(ctx->bio);
> +		return;
> +	}
> +#endif
> +
>  	fsverity_verify_bio(ctx->bio);
> +	__f2fs_read_end_io(ctx->bio, false, false);
>  }
> 
>  static void f2fs_post_read_work(struct work_struct *work)
> @@ -148,18 +184,19 @@ static void f2fs_post_read_work(struct work_struct *work)
>  		container_of(work, struct bio_post_read_ctx, work);
> 
>  	if (ctx->enabled_steps & (1 << STEP_DECRYPT))
> -		decrypt_work(ctx);
> +		f2fs_decrypt_work(ctx);
> 
> -	if (ctx->enabled_steps & (1 << STEP_DECOMPRESS)) {
> -		decompress_work(ctx,
> -			ctx->enabled_steps & (1 << STEP_VERITY));
> +	if (ctx->enabled_steps & (1 << STEP_DECOMPRESS))
> +		f2fs_decompress_work(ctx);
> +
> +	if (ctx->enabled_steps & (1 << STEP_VERITY)) {
> +		INIT_WORK(&ctx->work, f2fs_verity_work);
> +		fsverity_enqueue_verify_work(&ctx->work);
>  		return;
>  	}
> 
> -	if (ctx->enabled_steps & (1 << STEP_VERITY))
> -		verity_work(ctx);
> -
> -	__read_end_io(ctx->bio, false, false);
> +	__f2fs_read_end_io(ctx->bio,
> +		ctx->enabled_steps & (1 << STEP_DECOMPRESS), false);
>  }
> 
>  static void f2fs_enqueue_post_read_work(struct f2fs_sb_info *sbi,
> @@ -176,12 +213,20 @@ static void bio_post_read_processing(struct bio_post_read_ctx *ctx)
>  	 * we shouldn't recurse to the same workqueue.
>  	 */
> 
> -	if (ctx->enabled_steps) {
> +	if (ctx->enabled_steps & (1 << STEP_DECRYPT) ||
> +		ctx->enabled_steps & (1 << STEP_DECOMPRESS)) {
>  		INIT_WORK(&ctx->work, f2fs_post_read_work);
>  		f2fs_enqueue_post_read_work(ctx->sbi, &ctx->work);
>  		return;
>  	}
> -	__read_end_io(ctx->bio, false, false);
> +
> +	if (ctx->enabled_steps & (1 << STEP_VERITY)) {
> +		INIT_WORK(&ctx->work, f2fs_verity_work);
> +		fsverity_enqueue_verify_work(&ctx->work);
> +		return;
> +	}
> +
> +	__f2fs_read_end_io(ctx->bio, false, false);
>  }
> 
>  static bool f2fs_bio_post_read_required(struct bio *bio)
> @@ -205,7 +250,7 @@ static void f2fs_read_end_io(struct bio *bio)
>  		return;
>  	}
> 
> -	__read_end_io(bio, false, false);
> +	__f2fs_read_end_io(bio, false, false);
>  }
> 
>  static void f2fs_write_end_io(struct bio *bio)
> @@ -864,6 +909,13 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
>  	return bio;
>  }
> 
> +static void f2fs_release_read_bio(struct bio *bio)
> +{
> +	if (bio->bi_private)
> +		mempool_free(bio->bi_private, bio_post_read_ctx_pool);
> +	bio_put(bio);
> +}
> +
>  /* This can handle encryption stuffs */
>  static int f2fs_submit_page_read(struct inode *inode, struct page *page,
>  							block_t blkaddr)
> @@ -2023,7 +2075,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  				dic->failed = true;
>  				if (refcount_sub_and_test(dic->nr_cpages - i,
>  							&dic->ref))
> -					f2fs_set_cluster_uptodate(dic->rpages,
> +					f2fs_decompress_end_io(dic->rpages,
>  							cc->cluster_size, true,
>  							false);
>  				f2fs_free_dic(dic);
> @@ -2053,7 +2105,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  out_put_dnode:
>  	f2fs_put_dnode(&dn);
>  out:
> -	f2fs_set_cluster_uptodate(cc->rpages, cc->cluster_size, true, false);
> +	f2fs_decompress_end_io(cc->rpages, cc->cluster_size, true, false);
>  	f2fs_destroy_compress_ctx(cc);
>  	*bio_ret = bio;
>  	return ret;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 8a3a35b42a37..20067fa3b035 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3795,7 +3795,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  				bool is_readahead);
>  struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc);
>  void f2fs_free_dic(struct decompress_io_ctx *dic);
> -void f2fs_set_cluster_uptodate(struct page **rpages,
> +void f2fs_decompress_end_io(struct page **rpages,
>  			unsigned int cluster_size, bool err, bool verity);
>  int f2fs_init_compress_ctx(struct compress_ctx *cc);
>  void f2fs_destroy_compress_ctx(struct compress_ctx *cc);
> -- 
> 2.18.0.rc1
> 
> 
> 
> On 2019/10/31 1:02, Eric Biggers wrote:
> > On Wed, Oct 30, 2019 at 04:43:52PM +0800, Chao Yu wrote:
> >>>>>>  static void bio_post_read_processing(struct bio_post_read_ctx *ctx)
> >>>>>>  {
> >>>>>> -	/*
> >>>>>> -	 * We use different work queues for decryption and for verity because
> >>>>>> -	 * verity may require reading metadata pages that need decryption, and
> >>>>>> -	 * we shouldn't recurse to the same workqueue.
> >>>>>> -	 */
> >>>>>
> >>>>> Why is it okay (i.e., no deadlocks) to no longer use different work queues for
> >>>>> decryption and for verity?  See the comment above which is being deleted.
> >>>>
> >>>> Could you explain more about how deadlock happen? or share me a link address if
> >>>> you have described that case somewhere?
> >>>>
> >>>
> >>> The verity work can read pages from the file which require decryption.  I'm
> >>> concerned that it could deadlock if the work is scheduled on the same workqueue.
> >>
> >> I assume you've tried one workqueue, and suffered deadlock..
> >>
> >>> Granted, I'm not an expert in Linux workqueues, so if you've investigated this
> >>> and determined that it's safe, can you explain why?
> >>
> >> I'm not familiar with workqueue...  I guess it may not safe that if the work is
> >> scheduled to the same cpu in where verity was waiting for data? if the work is
> >> scheduled to other cpu, it may be safe.
> >>
> >> I can check that before splitting the workqueue for verity and decrypt/decompress.
> >>
> > 
> > Yes this is a real problem, try 'kvm-xfstests -c f2fs/encrypt generic/579'.
> > The worker thread gets deadlocked in f2fs_read_merkle_tree_page() waiting for
> > the Merkle tree page to be decrypted.  This is with the v2 compression patch;
> > it works fine on current mainline.
> > 
> > INFO: task kworker/u5:0:61 blocked for more than 30 seconds.
> >       Not tainted 5.4.0-rc1-00119-g464e31ba60d0 #13
> > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > kworker/u5:0    D    0    61      2 0x80004000
> > Workqueue: f2fs_post_read_wq f2fs_post_read_work
> > Call Trace:
> >  context_switch kernel/sched/core.c:3384 [inline]
> >  __schedule+0x299/0x6c0 kernel/sched/core.c:4069
> >  schedule+0x44/0xd0 kernel/sched/core.c:4136
> >  io_schedule+0x11/0x40 kernel/sched/core.c:5780
> >  wait_on_page_bit_common mm/filemap.c:1174 [inline]
> >  wait_on_page_bit mm/filemap.c:1223 [inline]
> >  wait_on_page_locked include/linux/pagemap.h:527 [inline]
> >  wait_on_page_locked include/linux/pagemap.h:524 [inline]
> >  wait_on_page_read mm/filemap.c:2767 [inline]
> >  do_read_cache_page+0x407/0x660 mm/filemap.c:2810
> >  read_cache_page+0xd/0x10 mm/filemap.c:2894
> >  f2fs_read_merkle_tree_page+0x2e/0x30 include/linux/pagemap.h:396
> >  verify_page+0x110/0x560 fs/verity/verify.c:120
> >  fsverity_verify_bio+0xe6/0x1a0 fs/verity/verify.c:239
> >  verity_work fs/f2fs/data.c:142 [inline]
> >  f2fs_post_read_work+0x36/0x50 fs/f2fs/data.c:160
> >  process_one_work+0x225/0x550 kernel/workqueue.c:2269
> >  worker_thread+0x4b/0x3c0 kernel/workqueue.c:2415
> >  kthread+0x125/0x140 kernel/kthread.c:255
> >  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> > INFO: task kworker/u5:1:1140 blocked for more than 30 seconds.
> >       Not tainted 5.4.0-rc1-00119-g464e31ba60d0 #13
> > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > kworker/u5:1    D    0  1140      2 0x80004000
> > Workqueue: f2fs_post_read_wq f2fs_post_read_work
> > Call Trace:
> >  context_switch kernel/sched/core.c:3384 [inline]
> >  __schedule+0x299/0x6c0 kernel/sched/core.c:4069
> >  schedule+0x44/0xd0 kernel/sched/core.c:4136
> >  io_schedule+0x11/0x40 kernel/sched/core.c:5780
> >  wait_on_page_bit_common mm/filemap.c:1174 [inline]
> >  wait_on_page_bit mm/filemap.c:1223 [inline]
> >  wait_on_page_locked include/linux/pagemap.h:527 [inline]
> >  wait_on_page_locked include/linux/pagemap.h:524 [inline]
> >  wait_on_page_read mm/filemap.c:2767 [inline]
> >  do_read_cache_page+0x407/0x660 mm/filemap.c:2810
> >  read_cache_page+0xd/0x10 mm/filemap.c:2894
> >  f2fs_read_merkle_tree_page+0x2e/0x30 include/linux/pagemap.h:396
> >  verify_page+0x110/0x560 fs/verity/verify.c:120
> >  fsverity_verify_bio+0xe6/0x1a0 fs/verity/verify.c:239
> >  verity_work fs/f2fs/data.c:142 [inline]
> >  f2fs_post_read_work+0x36/0x50 fs/f2fs/data.c:160
> >  process_one_work+0x225/0x550 kernel/workqueue.c:2269
> >  worker_thread+0x4b/0x3c0 kernel/workqueue.c:2415
> >  kthread+0x125/0x140 kernel/kthread.c:255
> >  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> > 
> > Showing all locks held in the system:
> > 1 lock held by khungtaskd/21:
> >  #0: ffffffff82250520 (rcu_read_lock){....}, at: rcu_lock_acquire.constprop.0+0x0/0x30 include/trace/events/lock.h:13
> > 2 locks held by kworker/u5:0/61:
> >  #0: ffff88807b78eb28 ((wq_completion)f2fs_post_read_wq){+.+.}, at: set_work_data kernel/workqueue.c:619 [inline]
> >  #0: ffff88807b78eb28 ((wq_completion)f2fs_post_read_wq){+.+.}, at: set_work_pool_and_clear_pending kernel/workqueue.c:647 [inline]
> >  #0: ffff88807b78eb28 ((wq_completion)f2fs_post_read_wq){+.+.}, at: process_one_work+0x1ad/0x550 kernel/workqueue.c:2240
> >  #1: ffffc90000253e50 ((work_completion)(&ctx->work)){+.+.}, at: set_work_data kernel/workqueue.c:619 [inline]
> >  #1: ffffc90000253e50 ((work_completion)(&ctx->work)){+.+.}, at: set_work_pool_and_clear_pending kernel/workqueue.c:647 [inline]
> >  #1: ffffc90000253e50 ((work_completion)(&ctx->work)){+.+.}, at: process_one_work+0x1ad/0x550 kernel/workqueue.c:2240
> > 2 locks held by kworker/u5:1/1140:
> >  #0: ffff88807b78eb28 ((wq_completion)f2fs_post_read_wq){+.+.}, at: set_work_data kernel/workqueue.c:619 [inline]
> >  #0: ffff88807b78eb28 ((wq_completion)f2fs_post_read_wq){+.+.}, at: set_work_pool_and_clear_pending kernel/workqueue.c:647 [inline]
> >  #0: ffff88807b78eb28 ((wq_completion)f2fs_post_read_wq){+.+.}, at: process_one_work+0x1ad/0x550 kernel/workqueue.c:2240
> >  #1: ffffc9000174be50 ((work_completion)(&ctx->work)){+.+.}, at: set_work_data kernel/workqueue.c:619 [inline]
> >  #1: ffffc9000174be50 ((work_completion)(&ctx->work)){+.+.}, at: set_work_pool_and_clear_pending kernel/workqueue.c:647 [inline]
> >  #1: ffffc9000174be50 ((work_completion)(&ctx->work)){+.+.}, at: process_one_work+0x1ad/0x550 kernel/workqueue.c:2240
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
