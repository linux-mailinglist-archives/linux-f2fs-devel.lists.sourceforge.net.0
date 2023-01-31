Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 707946835B6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Jan 2023 19:54:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pMvlb-0003w4-WF;
	Tue, 31 Jan 2023 18:54:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pMvla-0003vi-PA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 18:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wjgrIs2DjNq+cmujDVCF9p4LIdxBtYRjIngkBGQDhAM=; b=XKV/wxqirsVJyl3Nkw+jUfz81P
 vDFtkp0fvk2n7CAa9wbq7Qeu0L3WWmBms9uK9R+KWIN2SxoTHisd/5xQ0tlGi1KgO/277ELsFmgPp
 YOShua65l8RMN66v9fJ3FIRLwLOVdHhTuGN5gNw0RsW1UDS+vHQuqbcbf0cOHIF00hhU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wjgrIs2DjNq+cmujDVCF9p4LIdxBtYRjIngkBGQDhAM=; b=PF8/It72dE3StlBNf8wsaqzZNU
 iievoTPjY5ZsFEJXKjmEgBYfj48CMhgjM0JjU2KP+OPZYiTZwvggMgJ9Bwz4RTo22MpNx3L9Vij2T
 jUQH0VkNeDVCxEiP74bqUuFGLazf0LpPSN4IyuEOeo1cLS/1j/io66uHldcxK1Yd4Rxk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pMvlY-000627-61 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Jan 2023 18:54:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 46DA4B81E69;
 Tue, 31 Jan 2023 18:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0819C433D2;
 Tue, 31 Jan 2023 18:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675191230;
 bh=eCIb/J2UH5mMwlFcpyhn3g1R9B4aXfIAjIhAOpoUULc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fO245kcBS+ICDYS5Lqld7ybNovw8GUnlrycA/YOl+y/YnWqQf951FNEbqfjhcV0sT
 MQroEBXVtHtzcTC17ol4a/NMyxCXMLgJwcse64wKjIUog5HlY6xdCB2sRtUEfHpMyP
 b9b2WeT6k3cUwulhrImtfG0LmBorDT+K8gESWL5BYKj1LMbApFcrZLaipQ6wPM/Ow9
 0dx2Y3KIowlAEiTa/l3JKbeBp5zvaEyvlb9SW7bofikls5/2vUiySrp7mehrh9oxzx
 qI7e8iHaO6N6HWLhTrBeF8/Ukrn5qAbxwtc7HOTruGxweyP5ZUpI5JPvwFzj31JGIh
 5IKDDWYc6/MPQ==
Date: Tue, 31 Jan 2023 10:53:48 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y9ljvM5aLxgpK3ZF@google.com>
References: <20230120161656.70308-1-frank.li@vivo.com>
 <20230120161656.70308-2-frank.li@vivo.com>
 <855c7c54-57f6-dcf8-9218-0dba6e216fd4@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <855c7c54-57f6-dcf8-9218-0dba6e216fd4@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/31, Chao Yu wrote: > On 2023/1/21 0:16,
 Yangtao Li wrote:
 > > Convert to use iostat_lat_type as parameter instead of raw number. >
 > BTW, move NUM_PREALLOC_IOSTAT_CTXS to the header file, and re [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pMvlY-000627-61
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs: use iostat_lat_type directly as
 a parameter in the iostat_update_and_unbind_ctx()
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
Cc: kernel test robot <lkp@intel.com>, linux-f2fs-devel@lists.sourceforge.net,
 Dan Carpenter <error27@gmail.com>, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/31, Chao Yu wrote:
> On 2023/1/21 0:16, Yangtao Li wrote:
> > Convert to use iostat_lat_type as parameter instead of raw number.
> > BTW, move NUM_PREALLOC_IOSTAT_CTXS to the header file, and rename
> > iotype to page_type to match the definition.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <error27@gmail.com>
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > ---
> > v3:
> > -convert to f2fs_warn()
> >   fs/f2fs/data.c   |  4 ++--
> >   fs/f2fs/iostat.c | 39 ++++++++++++++++-----------------------
> >   fs/f2fs/iostat.h | 19 ++++++++++---------
> >   3 files changed, 28 insertions(+), 34 deletions(-)
> > 
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 1645b8a1b904..710d4acde187 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -292,7 +292,7 @@ static void f2fs_read_end_io(struct bio *bio)
> >   	struct bio_post_read_ctx *ctx;
> >   	bool intask = in_task();
> > -	iostat_update_and_unbind_ctx(bio, 0);
> > +	iostat_update_and_unbind_ctx(bio, READ_IO);
> >   	ctx = bio->bi_private;
> >   	if (time_to_inject(sbi, FAULT_READ_IO))
> > @@ -330,7 +330,7 @@ static void f2fs_write_end_io(struct bio *bio)
> >   	struct bio_vec *bvec;
> >   	struct bvec_iter_all iter_all;
> > -	iostat_update_and_unbind_ctx(bio, 1);
> > +	iostat_update_and_unbind_ctx(bio, bio->bi_opf & REQ_SYNC ? WRITE_SYNC_IO : WRITE_ASYNC_IO);
> >   	sbi = bio->bi_private;
> >   	if (time_to_inject(sbi, FAULT_WRITE_IO))
> > diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
> > index 96637756eae8..c767a2e7d5a9 100644
> > --- a/fs/f2fs/iostat.c
> > +++ b/fs/f2fs/iostat.c
> > @@ -14,7 +14,6 @@
> >   #include "iostat.h"
> >   #include <trace/events/f2fs.h>
> > -#define NUM_PREALLOC_IOSTAT_CTXS	128
> >   static struct kmem_cache *bio_iostat_ctx_cache;
> >   static mempool_t *bio_iostat_ctx_pool;
> > @@ -210,53 +209,47 @@ void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
> >   }
> >   static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
> > -				int rw, bool is_sync)
> > +				enum iostat_lat_type lat_type)
> >   {
> >   	unsigned long ts_diff;
> > -	unsigned int iotype = iostat_ctx->type;
> > +	unsigned int page_type = iostat_ctx->type;
> >   	struct f2fs_sb_info *sbi = iostat_ctx->sbi;
> >   	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
> > -	int idx;
> >   	unsigned long flags;
> >   	if (!sbi->iostat_enable)
> >   		return;
> >   	ts_diff = jiffies - iostat_ctx->submit_ts;
> > -	if (iotype == META_FLUSH) {
> > -		iotype = META;
> > -	} else if (iotype >= NR_PAGE_TYPE) {
> > -		f2fs_warn(sbi, "%s: %d over NR_PAGE_TYPE", __func__, iotype);
> > +	if (page_type == META_FLUSH) {
> > +		page_type = META;
> > +	} else if (page_type >= NR_PAGE_TYPE) {
> > +		f2fs_warn(sbi, "%s: %d over NR_PAGE_TYPE", __func__, page_type);
> >   		return;
> >   	}
> > -	if (rw == 0) {
> > -		idx = READ_IO;
> > -	} else {
> > -		if (is_sync)
> > -			idx = WRITE_SYNC_IO;
> > -		else
> > -			idx = WRITE_ASYNC_IO;
> > +	if (lat_type >= MAX_IO_TYPE) {
> > +		f2fs_warn(sbi, "%s: %d over MAX_IO_TYPE", __func__, lat_type);
> > +		return;
> >   	}
> >   	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
> > -	io_lat->sum_lat[idx][iotype] += ts_diff;
> > -	io_lat->bio_cnt[idx][iotype]++;
> > -	if (ts_diff > io_lat->peak_lat[idx][iotype])
> > -		io_lat->peak_lat[idx][iotype] = ts_diff;
> > +	io_lat->sum_lat[lat_type][page_type] += ts_diff;
> > +	io_lat->bio_cnt[lat_type][page_type]++;
> > +	if (ts_diff > io_lat->peak_lat[lat_type][page_type])
> > +		io_lat->peak_lat[lat_type][page_type] = ts_diff;
> >   	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
> >   }
> > -void iostat_update_and_unbind_ctx(struct bio *bio, int rw)
> > +void iostat_update_and_unbind_ctx(struct bio *bio, enum iostat_lat_type lat_type)
> >   {
> >   	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
> > -	bool is_sync = bio->bi_opf & REQ_SYNC;
> > -	if (rw == 0)
> > +	if (lat_type == READ_IO)
> >   		bio->bi_private = iostat_ctx->post_read_ctx;
> >   	else
> >   		bio->bi_private = iostat_ctx->sbi;
> > -	__update_iostat_latency(iostat_ctx, rw, is_sync);
> > +	__update_iostat_latency(iostat_ctx, lat_type);
> >   	mempool_free(iostat_ctx, bio_iostat_ctx_pool);
> >   }
> > diff --git a/fs/f2fs/iostat.h b/fs/f2fs/iostat.h
> > index 2c048307b6e0..1f827a2fe6b2 100644
> > --- a/fs/f2fs/iostat.h
> > +++ b/fs/f2fs/iostat.h
> > @@ -8,20 +8,21 @@
> >   struct bio_post_read_ctx;
> > +enum iostat_lat_type {
> > +	READ_IO = 0,
> > +	WRITE_SYNC_IO,
> > +	WRITE_ASYNC_IO,
> > +	MAX_IO_TYPE,
> > +};
> 
> How about adjusting iostat_lat[{0,1,2}] to iostat_lat[{READ_IO,WRITE_SYNC_IO,WRITE_ASYNC_IO}]
> in tracepoint function.
> 
> 	TP_fast_assign(
> 		__entry->dev		= sbi->sb->s_dev;
> 		__entry->d_rd_peak	= iostat_lat[0][DATA].peak_lat;
> 		__entry->d_rd_avg	= iostat_lat[0][DATA].avg_lat;
> 		__entry->d_rd_cnt	= iostat_lat[0][DATA].cnt;
> 		__entry->n_rd_peak	= iostat_lat[0][NODE].peak_lat;
> 		__entry->n_rd_avg	= iostat_lat[0][NODE].avg_lat;
> 		__entry->n_rd_cnt	= iostat_lat[0][NODE].cnt;
> 		__entry->m_rd_peak	= iostat_lat[0][META].peak_lat;
> 		__entry->m_rd_avg	= iostat_lat[0][META].avg_lat;
> 		__entry->m_rd_cnt	= iostat_lat[0][META].cnt;
> 		__entry->d_wr_s_peak	= iostat_lat[1][DATA].peak_lat;
> 		__entry->d_wr_s_avg	= iostat_lat[1][DATA].avg_lat;
> 		__entry->d_wr_s_cnt	= iostat_lat[1][DATA].cnt;
> 		__entry->n_wr_s_peak	= iostat_lat[1][NODE].peak_lat;
> 		__entry->n_wr_s_avg	= iostat_lat[1][NODE].avg_lat;
> 		__entry->n_wr_s_cnt	= iostat_lat[1][NODE].cnt;
> 		__entry->m_wr_s_peak	= iostat_lat[1][META].peak_lat;
> 		__entry->m_wr_s_avg	= iostat_lat[1][META].avg_lat;
> 		__entry->m_wr_s_cnt	= iostat_lat[1][META].cnt;
> 		__entry->d_wr_as_peak	= iostat_lat[2][DATA].peak_lat;
> 		__entry->d_wr_as_avg	= iostat_lat[2][DATA].avg_lat;
> 		__entry->d_wr_as_cnt	= iostat_lat[2][DATA].cnt;
> 		__entry->n_wr_as_peak	= iostat_lat[2][NODE].peak_lat;
> 		__entry->n_wr_as_avg	= iostat_lat[2][NODE].avg_lat;
> 		__entry->n_wr_as_cnt	= iostat_lat[2][NODE].cnt;
> 		__entry->m_wr_as_peak	= iostat_lat[2][META].peak_lat;
> 		__entry->m_wr_as_avg	= iostat_lat[2][META].avg_lat;
> 		__entry->m_wr_as_cnt	= iostat_lat[2][META].cnt;
> 	),

Yangtao,

Could you please send another patch to address the Choa's suggestion?

Thanks,

> 
> Thanks,
> 
> > +
> >   #ifdef CONFIG_F2FS_IOSTAT
> > +#define NUM_PREALLOC_IOSTAT_CTXS	128
> >   #define DEFAULT_IOSTAT_PERIOD_MS	3000
> >   #define MIN_IOSTAT_PERIOD_MS		100
> >   /* maximum period of iostat tracing is 1 day */
> >   #define MAX_IOSTAT_PERIOD_MS		8640000
> > -enum {
> > -	READ_IO,
> > -	WRITE_SYNC_IO,
> > -	WRITE_ASYNC_IO,
> > -	MAX_IO_TYPE,
> > -};
> > -
> >   struct iostat_lat_info {
> >   	unsigned long sum_lat[MAX_IO_TYPE][NR_PAGE_TYPE];	/* sum of io latencies */
> >   	unsigned long peak_lat[MAX_IO_TYPE][NR_PAGE_TYPE];	/* peak io latency */
> > @@ -57,7 +58,7 @@ static inline struct bio_post_read_ctx *get_post_read_ctx(struct bio *bio)
> >   	return iostat_ctx->post_read_ctx;
> >   }
> > -extern void iostat_update_and_unbind_ctx(struct bio *bio, int rw);
> > +extern void iostat_update_and_unbind_ctx(struct bio *bio, enum iostat_lat_type type);
> >   extern void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
> >   		struct bio *bio, struct bio_post_read_ctx *ctx);
> >   extern int f2fs_init_iostat_processing(void);
> > @@ -67,7 +68,7 @@ extern void f2fs_destroy_iostat(struct f2fs_sb_info *sbi);
> >   #else
> >   static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
> >   		enum iostat_type type, unsigned long long io_bytes) {}
> > -static inline void iostat_update_and_unbind_ctx(struct bio *bio, int rw) {}
> > +static inline void iostat_update_and_unbind_ctx(struct bio *bio, enum iostat_lat_type type) {}
> >   static inline void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
> >   		struct bio *bio, struct bio_post_read_ctx *ctx) {}
> >   static inline void iostat_update_submit_ctx(struct bio *bio,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
