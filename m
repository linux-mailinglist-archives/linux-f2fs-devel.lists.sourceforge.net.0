Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F276E82C0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Apr 2023 22:32:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ppETO-0001Uv-Ja;
	Wed, 19 Apr 2023 20:32:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ppETN-0001Up-0g
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Apr 2023 20:32:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IQ0zBIrNk8hv5KSb3fcZMCMR7bXIUCEkYq4zWjBCyUk=; b=jkEBJyYY7t7otUjF5XDopb4F5W
 KSrMwrO4VEWb7+CZB0t1NRSnFCTBxsp/+k70qndvYLUL15AZyEaQUZmwvd/OocPX/9kOZxYvrPMel
 wb3zQzgYrKsF2E6i1hcN2fWGhJAgA4+L6yFIt0hOpOG+pYodhDqaU9v8a/U7SyWf6+AI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IQ0zBIrNk8hv5KSb3fcZMCMR7bXIUCEkYq4zWjBCyUk=; b=FhM61rL57G3ZUexkn+mELLnUfV
 VVBdBl38Pcwb8A77oQA/SCLIzBawaByJ1EsHYiciRCCTDhwMUxlFYjOuZOAFLmq8uK/d2957yrkLH
 bvFdXb+5dBEG8UFWn1XdcEQd1WRQeYZvb5T7TX0bKWNvTa2fo/TuLq3hJvgUThJTjB0E=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ppETL-0005sv-3I for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Apr 2023 20:32:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4D7F638AA;
 Wed, 19 Apr 2023 20:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB7BC433EF;
 Wed, 19 Apr 2023 20:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681936325;
 bh=1MUVPNOqDmEmgYS55br1aD1rbtdRNm6Y8eqO2wGJ12o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ksFquHrAkzmVfOUbIDCzT7zd039sPCdMf6cIXGHQ8ArsqfJW+s9EnqZ8hs1+nflH4
 UT9oftVNdPzTqhhALfhHAj5q/SWWFDZALQhGgeIsFWAHEnQrnbZDxPdxbJHQp2hkZO
 OhCWLkgF+DehIljd7+4ZckE+z7dEE1aYeLnA7o5wF3J2uedf/ZKeEr2ndtlnWWKIhs
 3mHzzopuPfA1a9lIgu0vDUyGgRiNatyjvKYIXpwyrjdYb3CqPrpkUCpRfhiaKsgf5G
 CX1vbdgtKfOrjuAGvAvUGmkzCujDH32b2jf3ZafjbjVPq5YehdLq1gy6nkCypxbWZm
 v3uBm4v13q+Kw==
Date: Wed, 19 Apr 2023 13:32:03 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <ZEBPwz4fJATKs22g@google.com>
References: <20230407174609.4939-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230407174609.4939-1-frank.li@vivo.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/08, Yangtao Li wrote: > The current code uses a mixture
 of MAX_IO_TYPE and NR_PAGE_TYPE > to form lat_type, and uses a two-dimensional
 array to store data. > NR_PAGE_TYPE is 3, which is unreason [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ppETL-0005sv-3I
Subject: Re: [f2fs-dev] [PATCH v4 1/2] f2fs: refactor struct iostat_lat_info
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
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-f2fs-devel@lists.sourceforge.net, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/08, Yangtao Li wrote:
> The current code uses a mixture of MAX_IO_TYPE and NR_PAGE_TYPE
> to form lat_type, and uses a two-dimensional array to store data.
> NR_PAGE_TYPE is 3, which is unreasonable for a discard with a
> PAGE_TYPE of 1. So this patch changes the array to a 1D array and
> does some cleanup.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/data.c              |  2 +-
>  fs/f2fs/iostat.c            | 79 +++++++++++++++++++++----------------
>  fs/f2fs/iostat.h            | 49 +++++++++++------------
>  include/trace/events/f2fs.h | 56 +++++++++++++-------------
>  4 files changed, 97 insertions(+), 89 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index e975f9c702ab..38cab984496f 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2311,7 +2311,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>  		if (bio_add_page(bio, page, blocksize, 0) < blocksize)
>  			goto submit_and_realloc;
>  
> -		ctx = get_post_read_ctx(bio);
> +		ctx = iostat_get_bio_private(bio);

This ctx is not used for iostat.

>  		ctx->enabled_steps |= STEP_DECOMPRESS;
>  		refcount_inc(&dic->refcnt);
>  
> diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
> index 3d5bfb1ad585..5d496d5b70d3 100644
> --- a/fs/f2fs/iostat.c
> +++ b/fs/f2fs/iostat.c
> @@ -86,23 +86,21 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
>  
>  static inline void __record_iostat_latency(struct f2fs_sb_info *sbi)
>  {
> -	int io, idx;
> -	struct f2fs_iostat_latency iostat_lat[MAX_IO_TYPE][NR_PAGE_TYPE];
> +	struct f2fs_iostat_latency iostat_lat[MAX_LAT_TYPE];
>  	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
> +	unsigned int lat_type;
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
> -	for (idx = 0; idx < MAX_IO_TYPE; idx++) {
> -		for (io = 0; io < NR_PAGE_TYPE; io++) {
> -			iostat_lat[idx][io].peak_lat =
> -			   jiffies_to_msecs(io_lat->peak_lat[idx][io]);
> -			iostat_lat[idx][io].cnt = io_lat->bio_cnt[idx][io];
> -			iostat_lat[idx][io].avg_lat = iostat_lat[idx][io].cnt ?
> -			   jiffies_to_msecs(io_lat->sum_lat[idx][io]) / iostat_lat[idx][io].cnt : 0;
> -			io_lat->sum_lat[idx][io] = 0;
> -			io_lat->peak_lat[idx][io] = 0;
> -			io_lat->bio_cnt[idx][io] = 0;
> -		}
> +	for (lat_type = 0; lat_type < MAX_LAT_TYPE; lat_type++) {
> +		iostat_lat[lat_type].peak_lat =
> +		   jiffies_to_msecs(io_lat->peak_lat[lat_type]);
> +		iostat_lat[lat_type].cnt = io_lat->bio_cnt[lat_type];
> +		iostat_lat[lat_type].avg_lat = iostat_lat[lat_type].cnt ?
> +		   jiffies_to_msecs(io_lat->sum_lat[lat_type]) / iostat_lat[lat_type].cnt : 0;
> +		io_lat->sum_lat[lat_type] = 0;
> +		io_lat->peak_lat[lat_type] = 0;
> +		io_lat->bio_cnt[lat_type] = 0;
>  	}
>  	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
>  
> @@ -208,62 +206,73 @@ void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
>  	f2fs_record_iostat(sbi);
>  }
>  
> -static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
> -				enum iostat_lat_type lat_type)
> +static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx)
>  {
> -	unsigned long ts_diff;
> -	unsigned int page_type = iostat_ctx->type;
>  	struct f2fs_sb_info *sbi = iostat_ctx->sbi;
>  	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
> +	unsigned int lat_type = iostat_ctx->lat_type;
> +	unsigned long ts_diff;
>  	unsigned long flags;
>  
>  	if (!sbi->iostat_enable)
>  		return;
>  
> -	ts_diff = jiffies - iostat_ctx->submit_ts;
> -	if (page_type == META_FLUSH) {
> -		page_type = META;
> -	} else if (page_type >= NR_PAGE_TYPE) {
> -		f2fs_warn(sbi, "%s: %d over NR_PAGE_TYPE", __func__, page_type);
> +	if (lat_type >= MAX_LAT_TYPE) {
> +		f2fs_warn(sbi, "%s: %d over MAX_LAT_TYPE", __func__, lat_type);
>  		return;
>  	}
> +	ts_diff = jiffies - iostat_ctx->submit_ts;
>  
>  	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
> -	io_lat->sum_lat[lat_type][page_type] += ts_diff;
> -	io_lat->bio_cnt[lat_type][page_type]++;
> -	if (ts_diff > io_lat->peak_lat[lat_type][page_type])
> -		io_lat->peak_lat[lat_type][page_type] = ts_diff;
> +	io_lat->sum_lat[lat_type] += ts_diff;
> +	io_lat->bio_cnt[lat_type]++;
> +	if (ts_diff > io_lat->peak_lat[lat_type])
> +		io_lat->peak_lat[lat_type] = ts_diff;
>  	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
>  }
>  
>  void iostat_update_and_unbind_ctx(struct bio *bio)
> +{
> +	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
> +
> +	if (op_is_write(bio_op(bio)))
> +		bio->bi_private = iostat_ctx->sbi;
> +	else
> +		bio->bi_private = iostat_ctx->iostat_private;
> +
> +	__update_iostat_latency(iostat_ctx);
> +	mempool_free(iostat_ctx, bio_iostat_ctx_pool);
> +}
> +
> +void iostat_update_submit_ctx(struct bio *bio, enum page_type type)
>  {
>  	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
>  	enum iostat_lat_type lat_type;
>  
> +	iostat_ctx->submit_ts = jiffies;
> +
>  	if (op_is_write(bio_op(bio))) {
>  		lat_type = bio->bi_opf & REQ_SYNC ?
> -				WRITE_SYNC_IO : WRITE_ASYNC_IO;
> -		bio->bi_private = iostat_ctx->sbi;
> +				WRITE_SYNC_DATA_LAT : WRITE_ASYNC_DATA_LAT;
> +		lat_type = (enum iostat_lat_type)(lat_type + type);
>  	} else {
> -		lat_type = READ_IO;
> -		bio->bi_private = iostat_ctx->post_read_ctx;
> +		lat_type = READ_DATA_LAT;
> +		lat_type = (enum iostat_lat_type)(lat_type + type);
>  	}
>  
> -	__update_iostat_latency(iostat_ctx, lat_type);
> -	mempool_free(iostat_ctx, bio_iostat_ctx_pool);
> +	iostat_ctx->lat_type = lat_type;
>  }
>  
>  void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
> -		struct bio *bio, struct bio_post_read_ctx *ctx)
> +		struct bio *bio, void *private)
>  {
>  	struct bio_iostat_ctx *iostat_ctx;
>  	/* Due to the mempool, this never fails. */
>  	iostat_ctx = mempool_alloc(bio_iostat_ctx_pool, GFP_NOFS);
>  	iostat_ctx->sbi = sbi;
>  	iostat_ctx->submit_ts = 0;
> -	iostat_ctx->type = 0;
> -	iostat_ctx->post_read_ctx = ctx;
> +	iostat_ctx->lat_type = 0;
> +	iostat_ctx->iostat_private = private;
>  	bio->bi_private = iostat_ctx;
>  }
>  
> diff --git a/fs/f2fs/iostat.h b/fs/f2fs/iostat.h
> index eb99d05cf272..67b468691498 100644
> --- a/fs/f2fs/iostat.h
> +++ b/fs/f2fs/iostat.h
> @@ -6,17 +6,24 @@
>  #ifndef __F2FS_IOSTAT_H__
>  #define __F2FS_IOSTAT_H__
>  
> +#ifdef CONFIG_F2FS_IOSTAT
> +
>  struct bio_post_read_ctx;
>  
>  enum iostat_lat_type {
> -	READ_IO = 0,
> -	WRITE_SYNC_IO,
> -	WRITE_ASYNC_IO,
> -	MAX_IO_TYPE,
> +	READ_DATA_LAT = 0,
> +	READ_NODE_LAT,
> +	READ_META_LAT,
> +	WRITE_SYNC_DATA_LAT,
> +	WRITE_SYNC_NODE_LAT,
> +	WRITE_SYNC_META_LAT,
> +	WRITE_ASYNC_DATA_LAT,
> +	WRITE_ASYNC_NODE_LAT,
> +	WRITE_ASYNC_META_LAT,
> +	DISCARD_LAT,
> +	MAX_LAT_TYPE,
>  };
>  
> -#ifdef CONFIG_F2FS_IOSTAT
> -
>  #define NUM_PREALLOC_IOSTAT_CTXS	128
>  #define DEFAULT_IOSTAT_PERIOD_MS	3000
>  #define MIN_IOSTAT_PERIOD_MS		100
> @@ -24,9 +31,9 @@ enum iostat_lat_type {
>  #define MAX_IOSTAT_PERIOD_MS		8640000
>  
>  struct iostat_lat_info {
> -	unsigned long sum_lat[MAX_IO_TYPE][NR_PAGE_TYPE];	/* sum of io latencies */
> -	unsigned long peak_lat[MAX_IO_TYPE][NR_PAGE_TYPE];	/* peak io latency */
> -	unsigned int bio_cnt[MAX_IO_TYPE][NR_PAGE_TYPE];	/* bio count */
> +	unsigned long sum_lat[MAX_LAT_TYPE];	/* sum of io latencies */
> +	unsigned long peak_lat[MAX_LAT_TYPE];	/* peak io latency */
> +	unsigned int bio_cnt[MAX_LAT_TYPE];	/* bio count */
>  };
>  
>  extern int __maybe_unused iostat_info_seq_show(struct seq_file *seq,
> @@ -38,29 +45,21 @@ extern void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
>  struct bio_iostat_ctx {
>  	struct f2fs_sb_info *sbi;
>  	unsigned long submit_ts;
> -	enum page_type type;
> -	struct bio_post_read_ctx *post_read_ctx;
> +	enum iostat_lat_type lat_type;
> +	void *iostat_private;
>  };
>  
> -static inline void iostat_update_submit_ctx(struct bio *bio,
> -			enum page_type type)
> -{
> -	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
> -
> -	iostat_ctx->submit_ts = jiffies;
> -	iostat_ctx->type = type;
> -}
> -
> -static inline struct bio_post_read_ctx *get_post_read_ctx(struct bio *bio)
> +static inline struct bio_post_read_ctx *iostat_get_bio_private(struct bio *bio)
>  {
>  	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
>  
> -	return iostat_ctx->post_read_ctx;
> +	return iostat_ctx->iostat_private;
>  }
>  
> +extern void iostat_update_submit_ctx(struct bio *bio, enum page_type type);
>  extern void iostat_update_and_unbind_ctx(struct bio *bio);
>  extern void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
> -		struct bio *bio, struct bio_post_read_ctx *ctx);
> +		struct bio *bio, void *private);
>  extern int f2fs_init_iostat_processing(void);
>  extern void f2fs_destroy_iostat_processing(void);
>  extern int f2fs_init_iostat(struct f2fs_sb_info *sbi);
> @@ -70,10 +69,10 @@ static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *in
>  		enum iostat_type type, unsigned long long io_bytes) {}
>  static inline void iostat_update_and_unbind_ctx(struct bio *bio) {}
>  static inline void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
> -		struct bio *bio, struct bio_post_read_ctx *ctx) {}
> +		struct bio *bio, void *private) {}
>  static inline void iostat_update_submit_ctx(struct bio *bio,
>  		enum page_type type) {}
> -static inline struct bio_post_read_ctx *get_post_read_ctx(struct bio *bio)
> +static inline struct bio_post_read_ctx *iostat_get_bio_private(struct bio *bio)
>  {
>  	return bio->bi_private;
>  }
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index 99cbc5949e3c..040a430e1199 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -2045,7 +2045,7 @@ struct f2fs_iostat_latency {
>  
>  TRACE_EVENT(f2fs_iostat_latency,
>  
> -	TP_PROTO(struct f2fs_sb_info *sbi, struct f2fs_iostat_latency (*iostat_lat)[NR_PAGE_TYPE]),
> +	TP_PROTO(struct f2fs_sb_info *sbi, struct f2fs_iostat_latency *iostat_lat),
>  
>  	TP_ARGS(sbi, iostat_lat),
>  
> @@ -2082,33 +2082,33 @@ TRACE_EVENT(f2fs_iostat_latency,
>  
>  	TP_fast_assign(
>  		__entry->dev		= sbi->sb->s_dev;
> -		__entry->d_rd_peak	= iostat_lat[READ_IO][DATA].peak_lat;
> -		__entry->d_rd_avg	= iostat_lat[READ_IO][DATA].avg_lat;
> -		__entry->d_rd_cnt	= iostat_lat[READ_IO][DATA].cnt;
> -		__entry->n_rd_peak	= iostat_lat[READ_IO][NODE].peak_lat;
> -		__entry->n_rd_avg	= iostat_lat[READ_IO][NODE].avg_lat;
> -		__entry->n_rd_cnt	= iostat_lat[READ_IO][NODE].cnt;
> -		__entry->m_rd_peak	= iostat_lat[READ_IO][META].peak_lat;
> -		__entry->m_rd_avg	= iostat_lat[READ_IO][META].avg_lat;
> -		__entry->m_rd_cnt	= iostat_lat[READ_IO][META].cnt;
> -		__entry->d_wr_s_peak	= iostat_lat[WRITE_SYNC_IO][DATA].peak_lat;
> -		__entry->d_wr_s_avg	= iostat_lat[WRITE_SYNC_IO][DATA].avg_lat;
> -		__entry->d_wr_s_cnt	= iostat_lat[WRITE_SYNC_IO][DATA].cnt;
> -		__entry->n_wr_s_peak	= iostat_lat[WRITE_SYNC_IO][NODE].peak_lat;
> -		__entry->n_wr_s_avg	= iostat_lat[WRITE_SYNC_IO][NODE].avg_lat;
> -		__entry->n_wr_s_cnt	= iostat_lat[WRITE_SYNC_IO][NODE].cnt;
> -		__entry->m_wr_s_peak	= iostat_lat[WRITE_SYNC_IO][META].peak_lat;
> -		__entry->m_wr_s_avg	= iostat_lat[WRITE_SYNC_IO][META].avg_lat;
> -		__entry->m_wr_s_cnt	= iostat_lat[WRITE_SYNC_IO][META].cnt;
> -		__entry->d_wr_as_peak	= iostat_lat[WRITE_ASYNC_IO][DATA].peak_lat;
> -		__entry->d_wr_as_avg	= iostat_lat[WRITE_ASYNC_IO][DATA].avg_lat;
> -		__entry->d_wr_as_cnt	= iostat_lat[WRITE_ASYNC_IO][DATA].cnt;
> -		__entry->n_wr_as_peak	= iostat_lat[WRITE_ASYNC_IO][NODE].peak_lat;
> -		__entry->n_wr_as_avg	= iostat_lat[WRITE_ASYNC_IO][NODE].avg_lat;
> -		__entry->n_wr_as_cnt	= iostat_lat[WRITE_ASYNC_IO][NODE].cnt;
> -		__entry->m_wr_as_peak	= iostat_lat[WRITE_ASYNC_IO][META].peak_lat;
> -		__entry->m_wr_as_avg	= iostat_lat[WRITE_ASYNC_IO][META].avg_lat;
> -		__entry->m_wr_as_cnt	= iostat_lat[WRITE_ASYNC_IO][META].cnt;
> +		__entry->d_rd_peak	= iostat_lat[READ_DATA_LAT].peak_lat;
> +		__entry->d_rd_avg	= iostat_lat[READ_DATA_LAT].avg_lat;
> +		__entry->d_rd_cnt	= iostat_lat[READ_DATA_LAT].cnt;
> +		__entry->n_rd_peak	= iostat_lat[READ_NODE_LAT].peak_lat;
> +		__entry->n_rd_avg	= iostat_lat[READ_NODE_LAT].avg_lat;
> +		__entry->n_rd_cnt	= iostat_lat[READ_NODE_LAT].cnt;
> +		__entry->m_rd_peak	= iostat_lat[READ_META_LAT].peak_lat;
> +		__entry->m_rd_avg	= iostat_lat[READ_META_LAT].avg_lat;
> +		__entry->m_rd_cnt	= iostat_lat[READ_META_LAT].cnt;
> +		__entry->d_wr_s_peak	= iostat_lat[WRITE_SYNC_DATA_LAT].peak_lat;
> +		__entry->d_wr_s_avg	= iostat_lat[WRITE_SYNC_DATA_LAT].avg_lat;
> +		__entry->d_wr_s_cnt	= iostat_lat[WRITE_SYNC_DATA_LAT].cnt;
> +		__entry->n_wr_s_peak	= iostat_lat[WRITE_SYNC_NODE_LAT].peak_lat;
> +		__entry->n_wr_s_avg	= iostat_lat[WRITE_SYNC_NODE_LAT].avg_lat;
> +		__entry->n_wr_s_cnt	= iostat_lat[WRITE_SYNC_NODE_LAT].cnt;
> +		__entry->m_wr_s_peak	= iostat_lat[WRITE_SYNC_META_LAT].peak_lat;
> +		__entry->m_wr_s_avg	= iostat_lat[WRITE_SYNC_META_LAT].avg_lat;
> +		__entry->m_wr_s_cnt	= iostat_lat[WRITE_SYNC_META_LAT].cnt;
> +		__entry->d_wr_as_peak	= iostat_lat[WRITE_ASYNC_DATA_LAT].peak_lat;
> +		__entry->d_wr_as_avg	= iostat_lat[WRITE_ASYNC_DATA_LAT].avg_lat;
> +		__entry->d_wr_as_cnt	= iostat_lat[WRITE_ASYNC_DATA_LAT].cnt;
> +		__entry->n_wr_as_peak	= iostat_lat[WRITE_ASYNC_NODE_LAT].peak_lat;
> +		__entry->n_wr_as_avg	= iostat_lat[WRITE_ASYNC_NODE_LAT].avg_lat;
> +		__entry->n_wr_as_cnt	= iostat_lat[WRITE_ASYNC_NODE_LAT].cnt;
> +		__entry->m_wr_as_peak	= iostat_lat[WRITE_ASYNC_META_LAT].peak_lat;
> +		__entry->m_wr_as_avg	= iostat_lat[WRITE_ASYNC_META_LAT].avg_lat;
> +		__entry->m_wr_as_cnt	= iostat_lat[WRITE_ASYNC_META_LAT].cnt;
>  	),
>  
>  	TP_printk("dev = (%d,%d), "
> -- 
> 2.35.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
