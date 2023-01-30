Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F218D681DFB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Jan 2023 23:23:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMcYw-0007DW-0T;
	Mon, 30 Jan 2023 22:23:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pMcYu-0007DQ-UJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 22:23:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k6zpasSTgNsXehHxoBi/klpbhywp6jj/X2fPONBA+oU=; b=IPOoYgF5KViayPSHBV6Hf0uyBN
 TRVYGNw3If5B0RVJZBELA3LusT/roTSlRDNv5KFqQVZfNgTRJmIRBW8O2gL8Vb91mWjZja+vNfacE
 iObILVPucd8o1ic9NtfbS5ts0q2wQfdSKnN9bcSjF6OZ7+mDI5MkdTTQSo1gEPFT1ISk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k6zpasSTgNsXehHxoBi/klpbhywp6jj/X2fPONBA+oU=; b=lsaK3cP4TbPuzCnYcBEONj/ErA
 7B0ue8VB2tc6SXXZ4l5eDmzR/AoniBOJxoUZdu5Qa8l/VNIMuNYLCz2F7TqFjZ9NYn0sLMBZymBHI
 2lnaGx6pODt9s7ipfa1IcrR07h0XQbuAkkcLgzlArvLBOYcFWLXcq8ZJTXJGfqLgVI7Y=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMcYp-0001Vc-1q for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jan 2023 22:23:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 162DD612A4;
 Mon, 30 Jan 2023 22:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6D1C433D2;
 Mon, 30 Jan 2023 22:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675117409;
 bh=jHdhK1KdZGBnb+/BMLssbsRoAAdL82xixqVpwZqRdvM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lkdi3togxdRWUBBxS5UBqw8heFB3P8riMv52XMk7RU31YOz4U9HTurz42vlFaz7ol
 mpIeq1SyWq7YtN9BzHG7xS8OE3/p0qgNytV1lcf7FPKaJ3nXnhM45tpBwZ4ASM10iL
 syfOS65x0DhDyk1EssqPsAJrVaOUSFFeTcHm6rjqoYTpL14rVqmWh/wrU0EzFPNWe/
 QdmIOXo2MKWC8TAdCxIvZfoxpXlaFgTeuFcSSQSHWfObEUdj3/jbsipokv5zURXYKx
 MlqjprdwY87PT+fGhL2QyrkA7CML45JN2lSr3+DCoiofpxQ2YDJle4R5PL5Pz8yS4a
 1ixF5PuYnT7Xg==
Date: Mon, 30 Jan 2023 14:23:27 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y9hDXzXnyFA9ejc3@google.com>
References: <20230105042240.24738-1-frank.li@vivo.com>
 <8ab26acd-4df6-8330-8e82-1d258d9f0d6d@kernel.org>
 <Y9g4PcQvsCOj1d0r@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9g4PcQvsCOj1d0r@google.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/30, Jaegeuk Kim wrote: > On 01/28, Chao Yu wrote: >
 > On 2023/1/5 12:22, Yangtao Li wrote: > > > Convert to use iostat_lat_type
 as parameter instead of raw number. > > > BTW, move NUM_PREALLOC_I [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMcYp-0001Vc-1q
Subject: Re: [f2fs-dev] [PATCH] f2fs: use iostat_lat_type directly as a
 parameter in the iostat_update_and_unbind_ctx()
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/30, Jaegeuk Kim wrote:
> On 01/28, Chao Yu wrote:
> > On 2023/1/5 12:22, Yangtao Li wrote:
> > > Convert to use iostat_lat_type as parameter instead of raw number.
> > > BTW, move NUM_PREALLOC_IOSTAT_CTXS to the header file, and rename
> > > iotype to page_type to match the definition.
> > > 
> > > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > > ---
> > >   fs/f2fs/data.c   |  5 +++--
> > >   fs/f2fs/iostat.c | 34 +++++++++++-----------------------
> > >   fs/f2fs/iostat.h | 19 ++++++++++---------
> > >   3 files changed, 24 insertions(+), 34 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > > index c940da1c540f..4e8fd5697c42 100644
> > > --- a/fs/f2fs/data.c
> > > +++ b/fs/f2fs/data.c
> > > @@ -292,7 +292,7 @@ static void f2fs_read_end_io(struct bio *bio)
> > >   	struct bio_post_read_ctx *ctx;
> > >   	bool intask = in_task();
> > > -	iostat_update_and_unbind_ctx(bio, 0);
> > > +	iostat_update_and_unbind_ctx(bio, READ_IO);
> > >   	ctx = bio->bi_private;
> > >   	if (time_to_inject(sbi, FAULT_READ_IO))
> > > @@ -330,7 +330,8 @@ static void f2fs_write_end_io(struct bio *bio)
> > >   	struct bio_vec *bvec;
> > >   	struct bvec_iter_all iter_all;
> > > -	iostat_update_and_unbind_ctx(bio, 1);
> > > +	iostat_update_and_unbind_ctx(bio, bio->bi_opf & REQ_SYNC ? WRITE_SYNC_IO :
> > > +										WRITE_ASYNC_IO);
> > 
> > We can use op_is_write(bio_op(bio)) to check IO's rw type, why not just
> > passing bio arguement, and parse rw/sync types from bio inside
> > iostat_update_and_unbind_ctx(), it can avoid passing unneeded arguements.
> 
> Chao, let's write another patch to clean up, if you're interested in.

Ok, it seems you need to add this comment in v3 that Yangtao sent.

> 
> > 
> > Thanks,
> > 
> > >   	sbi = bio->bi_private;
> > >   	if (time_to_inject(sbi, FAULT_WRITE_IO))
> > > diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
> > > index 59c72f92191a..20944c4a683a 100644
> > > --- a/fs/f2fs/iostat.c
> > > +++ b/fs/f2fs/iostat.c
> > > @@ -14,7 +14,6 @@
> > >   #include "iostat.h"
> > >   #include <trace/events/f2fs.h>
> > > -#define NUM_PREALLOC_IOSTAT_CTXS	128
> > >   static struct kmem_cache *bio_iostat_ctx_cache;
> > >   static mempool_t *bio_iostat_ctx_pool;
> > > @@ -210,49 +209,38 @@ void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
> > >   }
> > >   static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
> > > -				int rw, bool is_sync)
> > > +				enum iostat_lat_type type)
> > >   {
> > >   	unsigned long ts_diff;
> > > -	unsigned int iotype = iostat_ctx->type;
> > > +	unsigned int page_type = iostat_ctx->type;
> > >   	struct f2fs_sb_info *sbi = iostat_ctx->sbi;
> > >   	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
> > > -	int idx;
> > >   	unsigned long flags;
> > >   	if (!sbi->iostat_enable)
> > >   		return;
> > >   	ts_diff = jiffies - iostat_ctx->submit_ts;
> > > -	if (iotype >= META_FLUSH)
> > > -		iotype = META;
> > > -
> > > -	if (rw == 0) {
> > > -		idx = READ_IO;
> > > -	} else {
> > > -		if (is_sync)
> > > -			idx = WRITE_SYNC_IO;
> > > -		else
> > > -			idx = WRITE_ASYNC_IO;
> > > -	}
> > > +	if (page_type >= META_FLUSH)
> > > +		page_type = META;
> > >   	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
> > > -	io_lat->sum_lat[idx][iotype] += ts_diff;
> > > -	io_lat->bio_cnt[idx][iotype]++;
> > > -	if (ts_diff > io_lat->peak_lat[idx][iotype])
> > > -		io_lat->peak_lat[idx][iotype] = ts_diff;
> > > +	io_lat->sum_lat[type][page_type] += ts_diff;
> > > +	io_lat->bio_cnt[type][page_type]++;
> > > +	if (ts_diff > io_lat->peak_lat[type][page_type])
> > > +		io_lat->peak_lat[type][page_type] = ts_diff;
> > >   	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
> > >   }
> > > -void iostat_update_and_unbind_ctx(struct bio *bio, int rw)
> > > +void iostat_update_and_unbind_ctx(struct bio *bio, enum iostat_lat_type type)
> > >   {
> > >   	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
> > > -	bool is_sync = bio->bi_opf & REQ_SYNC;
> > > -	if (rw == 0)
> > > +	if (type == READ_IO)
> > >   		bio->bi_private = iostat_ctx->post_read_ctx;
> > >   	else
> > >   		bio->bi_private = iostat_ctx->sbi;
> > > -	__update_iostat_latency(iostat_ctx, rw, is_sync);
> > > +	__update_iostat_latency(iostat_ctx, type);
> > >   	mempool_free(iostat_ctx, bio_iostat_ctx_pool);
> > >   }
> > > diff --git a/fs/f2fs/iostat.h b/fs/f2fs/iostat.h
> > > index 2c048307b6e0..1f827a2fe6b2 100644
> > > --- a/fs/f2fs/iostat.h
> > > +++ b/fs/f2fs/iostat.h
> > > @@ -8,20 +8,21 @@
> > >   struct bio_post_read_ctx;
> > > +enum iostat_lat_type {
> > > +	READ_IO = 0,
> > > +	WRITE_SYNC_IO,
> > > +	WRITE_ASYNC_IO,
> > > +	MAX_IO_TYPE,
> > > +};
> > > +
> > >   #ifdef CONFIG_F2FS_IOSTAT
> > > +#define NUM_PREALLOC_IOSTAT_CTXS	128
> > >   #define DEFAULT_IOSTAT_PERIOD_MS	3000
> > >   #define MIN_IOSTAT_PERIOD_MS		100
> > >   /* maximum period of iostat tracing is 1 day */
> > >   #define MAX_IOSTAT_PERIOD_MS		8640000
> > > -enum {
> > > -	READ_IO,
> > > -	WRITE_SYNC_IO,
> > > -	WRITE_ASYNC_IO,
> > > -	MAX_IO_TYPE,
> > > -};
> > > -
> > >   struct iostat_lat_info {
> > >   	unsigned long sum_lat[MAX_IO_TYPE][NR_PAGE_TYPE];	/* sum of io latencies */
> > >   	unsigned long peak_lat[MAX_IO_TYPE][NR_PAGE_TYPE];	/* peak io latency */
> > > @@ -57,7 +58,7 @@ static inline struct bio_post_read_ctx *get_post_read_ctx(struct bio *bio)
> > >   	return iostat_ctx->post_read_ctx;
> > >   }
> > > -extern void iostat_update_and_unbind_ctx(struct bio *bio, int rw);
> > > +extern void iostat_update_and_unbind_ctx(struct bio *bio, enum iostat_lat_type type);
> > >   extern void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
> > >   		struct bio *bio, struct bio_post_read_ctx *ctx);
> > >   extern int f2fs_init_iostat_processing(void);
> > > @@ -67,7 +68,7 @@ extern void f2fs_destroy_iostat(struct f2fs_sb_info *sbi);
> > >   #else
> > >   static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
> > >   		enum iostat_type type, unsigned long long io_bytes) {}
> > > -static inline void iostat_update_and_unbind_ctx(struct bio *bio, int rw) {}
> > > +static inline void iostat_update_and_unbind_ctx(struct bio *bio, enum iostat_lat_type type) {}
> > >   static inline void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
> > >   		struct bio *bio, struct bio_post_read_ctx *ctx) {}
> > >   static inline void iostat_update_submit_ctx(struct bio *bio,
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
