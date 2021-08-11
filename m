Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C787F3E8756
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 02:44:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDcLd-0003Su-33; Wed, 11 Aug 2021 00:43:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mDcLc-0003Si-9O
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 00:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:Subject:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dS5FIdxpEfiTLuFzirnY0V60Jsf4CPh3kp3GT7iE4xA=; b=UOaxez/JFWaur2SjtohpCa5L8R
 easuaz0+Pk5XodYMCQI5W1GnXZuOokKrKg0Uq07R2xsUof6IjsYy42kiAz97bqjV/f1p8vz63fnDg
 E1Hvm/jhMb7dqBmoqadXjuNNF9MGJuV9gRWmFiJI+7pt2aPO8vCjyZVA9FtEatlXUI2E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:Cc:To:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dS5FIdxpEfiTLuFzirnY0V60Jsf4CPh3kp3GT7iE4xA=; b=J9ZA1ru2dSNAbXl81PEAsttyX0
 9ZWGPiFu4WIMN5z7Og7WQxzIDlt6a1g7RU1lNAyR2OO8tC0s7xjRzwym0epGnWZ0dxa2I8aCZ+QU4
 29iIjNpgbYpl6xfIPy7klM3BKEF2RvDZj3MsYrrj6B+dxXFYvt9Rsa8S0ooJ8NeDTggE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDcLZ-0004WT-69
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 00:43:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7428360EB5;
 Wed, 11 Aug 2021 00:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628642627;
 bh=Ua3FMze6RTyDSdYj5awb/DhNsE207l+c6bRHDviwHX8=;
 h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
 b=rf41asp1ARfbXZxU5fa26uQgBq5glgcAJsCejaa/chktkUONhszAi/cTIeuM8QYLe
 mhedyHeDPE89S1ATX3EdTx0N4HDi0+Y+9N4Yc8UFLKOrYPPo783zGDlDcbL/ez/sKr
 ZyAwuMkdZu0j+RKwNbPJ+aFL2I1IMes9TofVLhrhiJBvUSWDIoSURAo5A0pFYYY+hn
 07VCC7/Aw/fc7Xes7GGvTkyAW2X9jFIVVWxuVm741+4qn05MFvhxQWBXgWhLVuBl0a
 DFDef8863d1i+jI0JoOmNwN+pRPnmsH3S//Bzv5LqCizqujyzRcWXcK1w+5CSxTKLY
 40n/pWAxk2MQQ==
From: Chao Yu <chao@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20210803225542.3487172-1-daeho43@gmail.com>
Message-ID: <2a79c1c5-366b-92d9-4025-dbda660b1178@kernel.org>
Date: Wed, 11 Aug 2021 08:43:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210803225542.3487172-1-daeho43@gmail.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mDcLZ-0004WT-69
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce periodic iostat io
 latency traces
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Daeho,

On 2021/8/4 6:55, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Whenever we notice some sluggish issues on our machines, we are always
> curious about how well all types of I/O in the f2fs filesystem are
> handled. But, it's hard to get this kind of real data. First of all,
> we need to reproduce the issue while turning on the profiling tool like
> blktrace, but the issue doesn't happen again easily. Second, with the
> intervention of any tools, the overall timing of the issue will be
> slightly changed and it sometimes makes us hard to figure it out.
> 
> So, I added F2FS_IOSTAT_IO_LATENCY config option to support printing out
> IO latency statistics tracepoint events which are minimal things to
> understand filesystem's I/O related behaviors. With "iostat_enable" sysfs
> node on, we can get this statistics info in a periodic way and it
> would cause the least overhead.
> 
> [samples]
>   f2fs_ckpt-254:1-507     [003] ....  2842.439683: f2fs_iostat_latency:
> dev = (254,11), iotype [peak lat.(ms)/avg lat.(ms)/count],
> rd_data [136/1/801], rd_node [136/1/1704], rd_meta [4/2/4],
> wr_sync_data [164/16/3331], wr_sync_node [152/3/648],
> wr_sync_meta [160/2/4243], wr_async_data [24/13/15],
> wr_async_node [0/0/0], wr_async_meta [0/0/0]
> 
>   f2fs_ckpt-254:1-507     [002] ....  2845.450514: f2fs_iostat_latency:
> dev = (254,11), iotype [peak lat.(ms)/avg lat.(ms)/count],
> rd_data [60/3/456], rd_node [60/3/1258], rd_meta [0/0/1],
> wr_sync_data [120/12/2285], wr_sync_node [88/5/428],
> wr_sync_meta [52/6/2990], wr_async_data [4/1/3],
> wr_async_node [0/0/0], wr_async_meta [0/0/0]
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> 
> ---
> v2: clean up with wrappers and fix a build breakage reported by
>      kernel test robot <lkp@intel.com>
> ---
>   fs/f2fs/Kconfig             |   9 +++

I try to apply this patch in my local dev branch, but it failed due to
conflicting with below commit, it needs to rebase this patch to last dev
branch.

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=6b3ba1e77d8913ee6ffb3972e889bc35550ed95c

>   fs/f2fs/data.c              | 108 ++++++++++++++++++++++++++++++++++--
>   fs/f2fs/f2fs.h              |  86 ++++++++++++++++++++++++++++
>   fs/f2fs/super.c             |  11 +++-
>   fs/f2fs/sysfs.c             |  44 +++++++++++++++
>   include/trace/events/f2fs.h |  88 +++++++++++++++++++++++++++++
>   6 files changed, 341 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
> index 7669de7b49ce..28dc5463bc87 100644
> --- a/fs/f2fs/Kconfig
> +++ b/fs/f2fs/Kconfig
> @@ -135,3 +135,12 @@ config F2FS_FS_LZORLE
>   	default y
>   	help
>   	  Support LZO-RLE compress algorithm, if unsure, say Y.
> +
> +config F2FS_IOSTAT_IO_LATENCY
> +	bool "F2FS IO statistics IO latency information"
> +	depends on F2FS_FS
> +	default n
> +	help
> +	  Support printing out periodic IO latency statistics tracepoint
> +	  events. With this, you have to turn on "iostat_enable" sysfs
> +	  node to print this out.

This functionality looks independent, how about introuducing iostat.h
and iostat.c (not sure, maybe trace.[hc])to include newly added structure
and functions for dispersive codes cleanup.

> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 948083c88d17..a2690f995b47 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -34,6 +34,12 @@ static struct kmem_cache *bio_entry_slab;
>   static mempool_t *bio_post_read_ctx_pool;
>   static struct bio_set f2fs_bioset;
>   
> +#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
> +#define NUM_PREALLOC_IOSTAT_CTXS	128
> +static struct kmem_cache *bio_iostat_ctx_cache;
> +static mempool_t *bio_iostat_ctx_pool;
> +#endif
> +
>   #define	F2FS_BIO_POOL_SIZE	NR_CURSEG_TYPE
>   
>   int __init f2fs_init_bioset(void)
> @@ -267,10 +273,67 @@ static void f2fs_post_read_work(struct work_struct *work)
>   	f2fs_verify_and_finish_bio(ctx->bio);
>   }
>   
> +#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
> +static inline void __update_and_unbind_iostat_ctx(struct bio *bio, int rw)
> +{
> +	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
> +	int sync = bio->bi_opf & REQ_SYNC ? 0 : 1;

int sync = bio->bi_opf & REQ_SYNC ? 1 : 0;

> +
> +	if (rw == 0)
> +		bio->bi_private = iostat_ctx->post_read_ctx;
> +	else
> +		bio->bi_private = iostat_ctx->sbi;
> +	__update_iostat_latency(iostat_ctx, rw, sync);
> +	mempool_free(iostat_ctx, bio_iostat_ctx_pool);
> +}
> +
> +static inline void __alloc_and_bind_iostat_ctx(struct f2fs_sb_info *sbi,
> +		struct bio *bio, struct bio_post_read_ctx *ctx)
> +{
> +	struct bio_iostat_ctx *iostat_ctx;
> +	/* Due to the mempool, this never fails. */
> +	iostat_ctx = mempool_alloc(bio_iostat_ctx_pool, GFP_NOFS);
> +	iostat_ctx->sbi = sbi;
> +	iostat_ctx->submit_ts = 0;
> +	iostat_ctx->type = 0;
> +	iostat_ctx->post_read_ctx = ctx;
> +	bio->bi_private = iostat_ctx;
> +}
> +
> +static inline void __update_submit_iostat_ctx(struct bio *bio,
> +		enum page_type type)
> +{
> +	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
> +
> +	iostat_ctx->submit_ts = jiffies;
> +	iostat_ctx->type = type;
> +}
> +
> +static inline struct bio_post_read_ctx *__get_post_read_ctx(struct bio *bio)
> +{
> +	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
> +
> +	return iostat_ctx->post_read_ctx;
> +}
> +#else
> +static inline void __update_and_unbind_iostat_ctx(struct bio *bio, int rw) {}
> +static inline void __alloc_and_bind_iostat_ctx(struct f2fs_sb_info *sbi,
> +		struct bio *bio, struct bio_post_read_ctx *ctx) {}
> +static inline void __update_submit_iostat_ctx(struct bio *bio,
> +		enum page_type type) {}
> +static inline struct bio_post_read_ctx *__get_post_read_ctx(struct bio *bio)
> +{
> +	return bio->bi_private;
> +}
> +#endif
> +
>   static void f2fs_read_end_io(struct bio *bio)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_P_SB(bio_first_page_all(bio));
> -	struct bio_post_read_ctx *ctx = bio->bi_private;
> +	struct bio_post_read_ctx *ctx;
> +
> +	__update_and_unbind_iostat_ctx(bio, 0);
> +	ctx = bio->bi_private;
>   
>   	if (time_to_inject(sbi, FAULT_READ_IO)) {
>   		f2fs_show_injection_info(sbi, FAULT_READ_IO);
> @@ -292,10 +355,13 @@ static void f2fs_read_end_io(struct bio *bio)
>   
>   static void f2fs_write_end_io(struct bio *bio)
>   {
> -	struct f2fs_sb_info *sbi = bio->bi_private;
> +	struct f2fs_sb_info *sbi;
>   	struct bio_vec *bvec;
>   	struct bvec_iter_all iter_all;
>   
> +	__update_and_unbind_iostat_ctx(bio, 1);
> +	sbi = bio->bi_private;
> +
>   	if (time_to_inject(sbi, FAULT_WRITE_IO)) {
>   		f2fs_show_injection_info(sbi, FAULT_WRITE_IO);
>   		bio->bi_status = BLK_STS_IOERR;
> @@ -399,6 +465,8 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
>   		bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi,
>   						fio->type, fio->temp);
>   	}
> +	__alloc_and_bind_iostat_ctx(sbi, bio, NULL);
> +
>   	if (fio->io_wbc)
>   		wbc_init_bio(fio->io_wbc, bio);
>   
> @@ -480,6 +548,9 @@ static inline void __submit_bio(struct f2fs_sb_info *sbi,
>   		trace_f2fs_submit_read_bio(sbi->sb, type, bio);
>   	else
>   		trace_f2fs_submit_write_bio(sbi->sb, type, bio);
> +
> +	__update_submit_iostat_ctx(bio, type);
> +
>   	submit_bio(bio);
>   }
>   
> @@ -971,7 +1042,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
>   {
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	struct bio *bio;
> -	struct bio_post_read_ctx *ctx;
> +	struct bio_post_read_ctx *ctx = NULL;
>   	unsigned int post_read_steps = 0;
>   
>   	bio = bio_alloc_bioset(for_write ? GFP_NOIO : GFP_KERNEL,
> @@ -1007,6 +1078,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
>   		ctx->fs_blkaddr = blkaddr;
>   		bio->bi_private = ctx;
>   	}
> +	__alloc_and_bind_iostat_ctx(sbi, bio, ctx);
>   
>   	return bio;
>   }
> @@ -2231,7 +2303,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>   		if (bio_add_page(bio, page, blocksize, 0) < blocksize)
>   			goto submit_and_realloc;
>   
> -		ctx = bio->bi_private;
> +		ctx = __get_post_read_ctx(bio);
>   		ctx->enabled_steps |= STEP_DECOMPRESS;
>   		refcount_inc(&dic->refcnt);
>   
> @@ -4132,6 +4204,34 @@ void f2fs_destroy_post_read_processing(void)
>   	kmem_cache_destroy(bio_post_read_ctx_cache);
>   }
>   
> +#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
> +int __init f2fs_init_iostat_processing(void)
> +{
> +	bio_iostat_ctx_cache =
> +		kmem_cache_create("f2fs_bio_iostat_ctx",
> +				  sizeof(struct bio_iostat_ctx), 0, 0, NULL);
> +	if (!bio_iostat_ctx_cache)
> +		goto fail;
> +	bio_iostat_ctx_pool =
> +		mempool_create_slab_pool(NUM_PREALLOC_IOSTAT_CTXS,
> +					 bio_iostat_ctx_cache);
> +	if (!bio_iostat_ctx_pool)
> +		goto fail_free_cache;
> +	return 0;
> +
> +fail_free_cache:
> +	kmem_cache_destroy(bio_iostat_ctx_cache);
> +fail:
> +	return -ENOMEM;
> +}
> +
> +void f2fs_destroy_iostat_processing(void)
> +{
> +	mempool_destroy(bio_iostat_ctx_pool);
> +	kmem_cache_destroy(bio_iostat_ctx_cache);
> +}
> +#endif
> +
>   int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi)
>   {
>   	if (!f2fs_sb_has_encrypt(sbi) &&
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 10a94ed839b1..fccee18ab776 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1755,6 +1755,17 @@ struct f2fs_sb_info {
>   	unsigned int compress_watermark;	/* cache page watermark */
>   	atomic_t compress_page_hit;		/* cache hit count */
>   #endif
> +
> +#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
> +	/* for io latency related statistics info in one iostat period */
> +	spinlock_t iostat_lat_lock;
> +	unsigned long rd_sum_lat[NR_PAGE_TYPE];		/* sum of read io latencies */
> +	unsigned long rd_peak_lat[NR_PAGE_TYPE];	/* peak read io latency */
> +	unsigned int rd_bio_cnt[NR_PAGE_TYPE];		/* read bio count */
> +	unsigned long wr_sum_lat[2][NR_PAGE_TYPE];	/* sum of write io latencies (sync/async) */
> +	unsigned long wr_peak_lat[2][NR_PAGE_TYPE];	/* peak write io latency (sync/async) */
> +	unsigned int wr_bio_cnt[2][NR_PAGE_TYPE];	/* write bio count (sync/async) */

How about wrapping them in a structure? and we can move this into iostat.h?

> +#endif
>   };
>   
>   struct f2fs_private_dio {
> @@ -3233,6 +3244,26 @@ static inline void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
>   		sbi->prev_rw_iostat[i] = 0;
>   	}
>   	spin_unlock(&sbi->iostat_lock);
> +
> +#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
> +	spin_lock_irq(&sbi->iostat_lat_lock);
> +	for (i = 0; i < NR_PAGE_TYPE; i++) {
> +		sbi->rd_sum_lat[i] = 0;
> +		sbi->rd_peak_lat[i] = 0;
> +		sbi->rd_bio_cnt[i] = 0;
> +	}
> +
> +	for (i = 0; i < 2; i++) {
> +		int iotype;
> +
> +		for (iotype = 0; iotype < NR_PAGE_TYPE; iotype++) {
> +			sbi->wr_sum_lat[i][iotype] = 0;
> +			sbi->wr_peak_lat[i][iotype] = 0;
> +			sbi->wr_bio_cnt[i][iotype] = 0;
> +		}
> +	}
> +	spin_unlock_irq(&sbi->iostat_lat_lock);
> +#endif
>   }
>   
>   extern void f2fs_record_iostat(struct f2fs_sb_info *sbi);
> @@ -3259,6 +3290,54 @@ static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi,
>   	f2fs_record_iostat(sbi);
>   }
>   
> +#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
> +
> +struct bio_post_read_ctx;
> +
> +struct bio_iostat_ctx {
> +	struct f2fs_sb_info *sbi;
> +	unsigned long submit_ts;
> +	enum page_type type;
> +	struct bio_post_read_ctx *post_read_ctx;
> +};
> +
> +struct f2fs_iostat_latency {
> +	unsigned int peak_lat;
> +	unsigned int avg_lat;
> +	unsigned int cnt;
> +};
> +
> +static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
> +				int rw, int sync)
> +{
> +	unsigned long ts_diff;
> +	unsigned int iotype = iostat_ctx->type;
> +	unsigned long flags;
> +	struct f2fs_sb_info *sbi = iostat_ctx->sbi;
> +
> +	if (!sbi->iostat_enable)
> +		return;
> +
> +	ts_diff = jiffies - iostat_ctx->submit_ts;
> +	if (iotype >= META_FLUSH)
> +		iotype = META;
> +
> +	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
> +	if (rw == 0) {
> +		sbi->rd_sum_lat[iotype] += ts_diff;
> +		sbi->rd_bio_cnt[iotype]++;
> +		if (ts_diff > sbi->rd_peak_lat[iotype])
> +			sbi->rd_peak_lat[iotype] = ts_diff;
> +	} else {
> +		sbi->wr_sum_lat[sync][iotype] += ts_diff;
> +		sbi->wr_bio_cnt[sync][iotype]++;
> +		if (ts_diff > sbi->wr_peak_lat[sync][iotype])
> +			sbi->wr_peak_lat[sync][iotype] = ts_diff;
> +	}
> +	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
> +}
> +#endif
> +
>   #define __is_large_section(sbi)		((sbi)->segs_per_sec > 1)
>   
>   #define __is_meta_io(fio) (PAGE_TYPE_OF_BIO((fio)->type) == META)
> @@ -3645,6 +3724,13 @@ bool f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len);
>   void f2fs_clear_page_cache_dirty_tag(struct page *page);
>   int f2fs_init_post_read_processing(void);
>   void f2fs_destroy_post_read_processing(void);
> +#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
> +int f2fs_init_iostat_processing(void);
> +void f2fs_destroy_iostat_processing(void);
> +#else
> +static inline int f2fs_init_iostat_processing(void) { return 0; }
> +static inline void f2fs_destroy_iostat_processing(void) {}
> +#endif
>   int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi);
>   void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi);
>   
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 04aeb7c0df7d..9ead6d2e703b 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3905,6 +3905,9 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>   
>   	/* init iostat info */
>   	spin_lock_init(&sbi->iostat_lock);
> +#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
> +	spin_lock_init(&sbi->iostat_lat_lock);
> +#endif
>   	sbi->iostat_enable = false;
>   	sbi->iostat_period_ms = DEFAULT_IOSTAT_PERIOD_MS;
>   
> @@ -4415,9 +4418,12 @@ static int __init init_f2fs_fs(void)
>   	err = f2fs_init_post_read_processing();
>   	if (err)
>   		goto free_root_stats;
> -	err = f2fs_init_bio_entry_cache();
> +	err = f2fs_init_iostat_processing();
>   	if (err)
>   		goto free_post_read;
> +	err = f2fs_init_bio_entry_cache();
> +	if (err)
> +		goto free_iostat;
>   	err = f2fs_init_bioset();
>   	if (err)
>   		goto free_bio_enrty_cache;
> @@ -4439,6 +4445,8 @@ static int __init init_f2fs_fs(void)
>   	f2fs_destroy_bioset();
>   free_bio_enrty_cache:
>   	f2fs_destroy_bio_entry_cache();
> +free_iostat:
> +	f2fs_destroy_iostat_processing();
>   free_post_read:
>   	f2fs_destroy_post_read_processing();
>   free_root_stats:
> @@ -4473,6 +4481,7 @@ static void __exit exit_f2fs_fs(void)
>   	f2fs_destroy_compress_mempool();
>   	f2fs_destroy_bioset();
>   	f2fs_destroy_bio_entry_cache();
> +	f2fs_destroy_iostat_processing();
>   	f2fs_destroy_post_read_processing();
>   	f2fs_destroy_root_stats();
>   	unregister_filesystem(&f2fs_fs_type);
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index f3a3aecbe111..4cb0561ec89d 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -1074,6 +1074,48 @@ static int __maybe_unused segment_bits_seq_show(struct seq_file *seq,
>   	return 0;
>   }
>   
> +#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
> +static inline void __record_iostat_latency(struct f2fs_sb_info *sbi)
> +{
> +	int io, sync, idx = 0;
> +	unsigned int cnt;
> +	struct f2fs_iostat_latency iostat_lat[3][NR_PAGE_TYPE];
> +
> +	spin_lock_irq(&sbi->iostat_lat_lock);
> +	for (io = 0; io < NR_PAGE_TYPE; io++) {
> +		cnt = sbi->rd_bio_cnt[io];
> +		iostat_lat[idx][io].peak_lat =
> +			jiffies_to_msecs(sbi->rd_peak_lat[io]);
> +		iostat_lat[idx][io].cnt = cnt;
> +		iostat_lat[idx][io].avg_lat = cnt ?
> +			jiffies_to_msecs(sbi->rd_sum_lat[io]) / cnt : 0;
> +		sbi->rd_sum_lat[io] = 0;
> +		sbi->rd_peak_lat[io] = 0;
> +		sbi->rd_bio_cnt[io] = 0;
> +	}
> +
> +	for (sync = 0; sync < 2; sync++) {
> +		idx++;
> +		for (io = 0; io < NR_PAGE_TYPE; io++) {
> +			cnt = sbi->wr_bio_cnt[sync][io];
> +			iostat_lat[idx][io].peak_lat =
> +			  jiffies_to_msecs(sbi->wr_peak_lat[sync][io]);
> +			iostat_lat[idx][io].cnt = cnt;
> +			iostat_lat[idx][io].avg_lat = cnt ?
> +			  jiffies_to_msecs(sbi->wr_sum_lat[sync][io]) / cnt : 0;
> +			sbi->wr_sum_lat[sync][io] = 0;
> +			sbi->wr_peak_lat[sync][io] = 0;
> +			sbi->wr_bio_cnt[sync][io] = 0;
> +		}
> +	}
> +	spin_unlock_irq(&sbi->iostat_lat_lock);

What not defining read/write stat variables into the same array? so codes in
__record_iostat_latency() and f2fs_reset_iostat() could be simplified.

enum {
	READ_IO,
	WRITE_ASYNC_IO,
	WRITE_SYNC_IO,
	MAX_IO_TYPE,
};

	unsigned long sum_lat[MAX_IO_TYPE][NR_PAGE_TYPE];	/* sum of io latencies */
	unsigned long peak_lat[MAX_IO_TYPE][NR_PAGE_TYPE];	/* peak io latency */
	unsigned int bio_cnt[MAX_IO_TYPE][NR_PAGE_TYPE];	/* bio count */

Thanks,

> +
> +	trace_f2fs_iostat_latency(sbi, iostat_lat);
> +}
> +#else
> +static inline void __record_iostat_latency(struct f2fs_sb_info *sbi) {}
> +#endif
> +
>   void f2fs_record_iostat(struct f2fs_sb_info *sbi)
>   {
>   	unsigned long long iostat_diff[NR_IO_TYPE];
> @@ -1099,6 +1141,8 @@ void f2fs_record_iostat(struct f2fs_sb_info *sbi)
>   	spin_unlock(&sbi->iostat_lock);
>   
>   	trace_f2fs_iostat(sbi, iostat_diff);
> +
> +	__record_iostat_latency(sbi);
>   }
>   
>   static int __maybe_unused iostat_info_seq_show(struct seq_file *seq,
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index 56b113e3cd6a..b9ede1b9207d 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -1894,6 +1894,94 @@ TRACE_EVENT(f2fs_iostat,
>   		__entry->fs_cdrio, __entry->fs_nrio, __entry->fs_mrio)
>   );
>   
> +#ifdef CONFIG_F2FS_IOSTAT_IO_LATENCY
> +TRACE_EVENT(f2fs_iostat_latency,
> +
> +	TP_PROTO(struct f2fs_sb_info *sbi, struct f2fs_iostat_latency (*iostat_lat)[NR_PAGE_TYPE]),
> +
> +	TP_ARGS(sbi, iostat_lat),
> +
> +	TP_STRUCT__entry(
> +		__field(dev_t,	dev)
> +		__field(unsigned int,	d_rd_peak)
> +		__field(unsigned int,	d_rd_avg)
> +		__field(unsigned int,	d_rd_cnt)
> +		__field(unsigned int,	n_rd_peak)
> +		__field(unsigned int,	n_rd_avg)
> +		__field(unsigned int,	n_rd_cnt)
> +		__field(unsigned int,	m_rd_peak)
> +		__field(unsigned int,	m_rd_avg)
> +		__field(unsigned int,	m_rd_cnt)
> +		__field(unsigned int,	d_wr_s_peak)
> +		__field(unsigned int,	d_wr_s_avg)
> +		__field(unsigned int,	d_wr_s_cnt)
> +		__field(unsigned int,	n_wr_s_peak)
> +		__field(unsigned int,	n_wr_s_avg)
> +		__field(unsigned int,	n_wr_s_cnt)
> +		__field(unsigned int,	m_wr_s_peak)
> +		__field(unsigned int,	m_wr_s_avg)
> +		__field(unsigned int,	m_wr_s_cnt)
> +		__field(unsigned int,	d_wr_as_peak)
> +		__field(unsigned int,	d_wr_as_avg)
> +		__field(unsigned int,	d_wr_as_cnt)
> +		__field(unsigned int,	n_wr_as_peak)
> +		__field(unsigned int,	n_wr_as_avg)
> +		__field(unsigned int,	n_wr_as_cnt)
> +		__field(unsigned int,	m_wr_as_peak)
> +		__field(unsigned int,	m_wr_as_avg)
> +		__field(unsigned int,	m_wr_as_cnt)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->dev		= sbi->sb->s_dev;
> +		__entry->d_rd_peak	= iostat_lat[0][DATA].peak_lat;
> +		__entry->d_rd_avg	= iostat_lat[0][DATA].avg_lat;
> +		__entry->d_rd_cnt	= iostat_lat[0][DATA].cnt;
> +		__entry->n_rd_peak	= iostat_lat[0][NODE].peak_lat;
> +		__entry->n_rd_avg	= iostat_lat[0][NODE].avg_lat;
> +		__entry->n_rd_cnt	= iostat_lat[0][NODE].cnt;
> +		__entry->m_rd_peak	= iostat_lat[0][META].peak_lat;
> +		__entry->m_rd_avg	= iostat_lat[0][META].avg_lat;
> +		__entry->m_rd_cnt	= iostat_lat[0][META].cnt;
> +		__entry->d_wr_s_peak	= iostat_lat[1][DATA].peak_lat;
> +		__entry->d_wr_s_avg	= iostat_lat[1][DATA].avg_lat;
> +		__entry->d_wr_s_cnt	= iostat_lat[1][DATA].cnt;
> +		__entry->n_wr_s_peak	= iostat_lat[1][NODE].peak_lat;
> +		__entry->n_wr_s_avg	= iostat_lat[1][NODE].avg_lat;
> +		__entry->n_wr_s_cnt	= iostat_lat[1][NODE].cnt;
> +		__entry->m_wr_s_peak	= iostat_lat[1][META].peak_lat;
> +		__entry->m_wr_s_avg	= iostat_lat[1][META].avg_lat;
> +		__entry->m_wr_s_cnt	= iostat_lat[1][META].cnt;
> +		__entry->d_wr_as_peak	= iostat_lat[2][DATA].peak_lat;
> +		__entry->d_wr_as_avg	= iostat_lat[2][DATA].avg_lat;
> +		__entry->d_wr_as_cnt	= iostat_lat[2][DATA].cnt;
> +		__entry->n_wr_as_peak	= iostat_lat[2][NODE].peak_lat;
> +		__entry->n_wr_as_avg	= iostat_lat[2][NODE].avg_lat;
> +		__entry->n_wr_as_cnt	= iostat_lat[2][NODE].cnt;
> +		__entry->m_wr_as_peak	= iostat_lat[2][META].peak_lat;
> +		__entry->m_wr_as_avg	= iostat_lat[2][META].avg_lat;
> +		__entry->m_wr_as_cnt	= iostat_lat[2][META].cnt;
> +	),
> +
> +	TP_printk("dev = (%d,%d), "
> +		"iotype [peak lat.(ms)/avg lat.(ms)/count], "
> +		"rd_data [%u/%u/%u], rd_node [%u/%u/%u], rd_meta [%u/%u/%u], "
> +		"wr_sync_data [%u/%u/%u], wr_sync_node [%u/%u/%u], "
> +		"wr_sync_meta [%u/%u/%u], wr_async_data [%u/%u/%u], "
> +		"wr_async_node [%u/%u/%u], wr_async_meta [%u/%u/%u]",
> +		show_dev(__entry->dev),
> +		__entry->d_rd_peak, __entry->d_rd_avg, __entry->d_rd_cnt,
> +		__entry->n_rd_peak, __entry->n_rd_avg, __entry->n_rd_cnt,
> +		__entry->m_rd_peak, __entry->m_rd_avg, __entry->m_rd_cnt,
> +		__entry->d_wr_s_peak, __entry->d_wr_s_avg, __entry->d_wr_s_cnt,
> +		__entry->n_wr_s_peak, __entry->n_wr_s_avg, __entry->n_wr_s_cnt,
> +		__entry->m_wr_s_peak, __entry->m_wr_s_avg, __entry->m_wr_s_cnt,
> +		__entry->d_wr_as_peak, __entry->d_wr_as_avg, __entry->d_wr_as_cnt,
> +		__entry->n_wr_as_peak, __entry->n_wr_as_avg, __entry->n_wr_as_cnt,
> +		__entry->m_wr_as_peak, __entry->m_wr_as_avg, __entry->m_wr_as_cnt)
> +);
> +#endif
> +
>   TRACE_EVENT(f2fs_bmap,
>   
>   	TP_PROTO(struct inode *inode, sector_t lblock, sector_t pblock),
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
