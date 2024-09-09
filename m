Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E14B997134E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Sep 2024 11:22:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1snabK-0008Ka-7g;
	Mon, 09 Sep 2024 09:22:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1snabJ-0008KT-9m
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 09:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gbqpCQEgvSsxkx9zqTt4uYUzw22SJ1t2toG5UoZ/A5k=; b=K0P2ifJQ/jQ0A4C7ZUs+8eFH7c
 SaBSSwKYfPGc5paRzlvX8s/Jp0kzkYnNOD8PElRxPDftF3otAL7S9/W40DgYL4f3AW8ss8ezdCA3i
 0oh4P2T+7AnbrNhEW0WgP+sF+qaVqJvTWGovYQ2QL35hVxJJM3PDmi5IKEC+6AUNAplg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gbqpCQEgvSsxkx9zqTt4uYUzw22SJ1t2toG5UoZ/A5k=; b=nA/ID0gm0V6kgmaUTskmcF2Qnw
 2v6+u/CqNdU9hfknO6a83x0unwhMSK4DOpAI9XTQFUcgdp/NLFoJPcwtMOoki9n0Nd9ST9p5Xn38R
 Rcft6tDp2sAksoauoZ7CdBT1tto5tSFvmwkdZq7plHxiuBs4f3H6ABQeb/cfJtcLc87U=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1snabI-00040g-0P for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 09:22:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C6B17A4318A;
 Mon,  9 Sep 2024 09:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7F0C4CEC5;
 Mon,  9 Sep 2024 09:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725873733;
 bh=MIHD1i+w8l4dnpeJK7WM/h5dIiaALEFNCbIgYLUkoRY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=VUBUQ/YJef8NEzdN3CGxsadq0eRP5TrqgJCGoGlmIJhz5d4+he0L4JHeADdOMhxHG
 0d2Ow4Wd23Y+sGgo47PaLDksC/HOnpXWB7I0HOM6U7DmFcfVla1uoAnAJxmzAsJDfr
 c1Dl+/41fm4BMUyhMxsFOFSboR3xJJkWczUInD+pwFYjzOD0elaL40ikfNFABIBSbO
 sK0ii8prDafFSsuRaZXi05rvgUSzDqGtx/mpHSwLcpafb65obmkvqHSbzBTGC4xDtQ
 UVtHTE5zXqizRSzeLG5ieDTn9wlVF27fclHq0pk8WGcxJUQLn9yeAgKWi8n8a0rttt
 HJbqIbwUy88MA==
Message-ID: <29601313-186e-4476-ab26-a3188a8fa3cd@kernel.org>
Date: Mon, 9 Sep 2024 17:22:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240829215242.3641502-1-daeho43@gmail.com>
 <20240829215242.3641502-7-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20240829215242.3641502-7-daeho43@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/30 5:52, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > We need to introduce a valid block ratio threshold
 not to trigger > excessive GC for zoned deivces. The initial va [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1snabI-00040g-0P
Subject: Re: [f2fs-dev] [PATCH 7/7] f2fs: add valid block ratio not to do
 excessive GC for one time GC
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/8/30 5:52, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> We need to introduce a valid block ratio threshold not to trigger
> excessive GC for zoned deivces. The initial value of it is 95%. So, F2FS
> will stop the thread from intiating GC for sections having valid blocks
> exceeding the ratio.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs |  8 ++++++++
>   fs/f2fs/f2fs.h                          |  2 +-
>   fs/f2fs/gc.c                            | 15 +++++++++++----
>   fs/f2fs/gc.h                            |  2 ++
>   fs/f2fs/segment.c                       |  6 ++++--
>   fs/f2fs/segment.h                       |  1 +
>   fs/f2fs/sysfs.c                         |  2 ++
>   7 files changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 265baec879fd..2d3e42af0e63 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -783,3 +783,11 @@ Contact:	"Daeho Jeong" <daehojeong@google.com>
>   Description:	If the percentage of free sections over total sections is under this
>   		number, F2FS boosts garbage collection for zoned devices through the
>   		background GC thread. the default number is "25".
> +
> +What:		/sys/fs/f2fs/<disk>/gc_valid_thresh_ratio
> +Date:		August 2024
> +Contact:	"Daeho Jeong" <daehojeong@google.com>
> +Description:	It controls the valid block ratio threshold not to trigger excessive GC
> +		for zoned deivces. The initial value of it is 95(%). F2FS will stop the
> +		background GC thread from intiating GC for sections having valid blocks
> +		exceeding the ratio.
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index ee1fafc65e95..8220b3189780 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3918,7 +3918,7 @@ void f2fs_destroy_garbage_collection_cache(void);
>   /* victim selection function for cleaning and SSR */
>   int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
>   			int gc_type, int type, char alloc_mode,
> -			unsigned long long age);
> +			unsigned long long age, bool one_time);
>   
>   /*
>    * recovery.c
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 6b79c43a57e3..feb80345aca3 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -196,6 +196,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
>   		return -ENOMEM;
>   
>   	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
> +	gc_th->valid_thresh_ratio = DEF_GC_THREAD_VALID_THRESH_RATIO;
>   
>   	if (f2fs_sb_has_blkzoned(sbi)) {
>   		gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME_ZONED;
> @@ -396,6 +397,10 @@ static inline unsigned int get_gc_cost(struct f2fs_sb_info *sbi,
>   	if (p->alloc_mode == SSR)
>   		return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
>   
> +	if (p->one_time_gc && (get_valid_blocks(sbi, segno, true) >=
> +		BLKS_PER_SEC(sbi) * sbi->gc_thread->valid_thresh_ratio / 100))

Use CAP_BLKS_PER_SEC() instead of BLKS_PER_SEC() ?

Thanks,

> +		return UINT_MAX;
> +
>   	/* alloc_mode == LFS */
>   	if (p->gc_mode == GC_GREEDY)
>   		return get_valid_blocks(sbi, segno, true);
> @@ -770,7 +775,7 @@ static int f2fs_gc_pinned_control(struct inode *inode, int gc_type,
>    */
>   int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
>   			int gc_type, int type, char alloc_mode,
> -			unsigned long long age)
> +			unsigned long long age, bool one_time)
>   {
>   	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
>   	struct sit_info *sm = SIT_I(sbi);
> @@ -787,6 +792,7 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
>   	p.alloc_mode = alloc_mode;
>   	p.age = age;
>   	p.age_threshold = sbi->am.age_threshold;
> +	p.one_time_gc = one_time;
>   
>   retry:
>   	select_policy(sbi, gc_type, type, &p);
> @@ -1698,13 +1704,14 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>   }
>   
>   static int __get_victim(struct f2fs_sb_info *sbi, unsigned int *victim,
> -			int gc_type)
> +			int gc_type, bool one_time)
>   {
>   	struct sit_info *sit_i = SIT_I(sbi);
>   	int ret;
>   
>   	down_write(&sit_i->sentry_lock);
> -	ret = f2fs_get_victim(sbi, victim, gc_type, NO_CHECK_TYPE, LFS, 0);
> +	ret = f2fs_get_victim(sbi, victim, gc_type, NO_CHECK_TYPE,
> +			LFS, 0, one_time);
>   	up_write(&sit_i->sentry_lock);
>   	return ret;
>   }
> @@ -1908,7 +1915,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   		goto stop;
>   	}
>   retry:
> -	ret = __get_victim(sbi, &segno, gc_type);
> +	ret = __get_victim(sbi, &segno, gc_type, gc_control->one_time);
>   	if (ret) {
>   		/* allow to search victim from sections has pinned data */
>   		if (ret == -ENODATA && gc_type == FG_GC &&
> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> index e8195eb4ca6d..59872daf88ee 100644
> --- a/fs/f2fs/gc.h
> +++ b/fs/f2fs/gc.h
> @@ -25,6 +25,7 @@
>   #define DEF_GC_THREAD_CANDIDATE_RATIO		20	/* select 20% oldest sections as candidates */
>   #define DEF_GC_THREAD_MAX_CANDIDATE_COUNT	10	/* select at most 10 sections as candidates */
>   #define DEF_GC_THREAD_AGE_WEIGHT		60	/* age weight */
> +#define DEF_GC_THREAD_VALID_THRESH_RATIO	95	/* do not GC over 95% valid block ratio for one time GC */
>   #define DEFAULT_ACCURACY_CLASS			10000	/* accuracy class */
>   
>   #define LIMIT_INVALID_BLOCK	40 /* percentage over total user space */
> @@ -65,6 +66,7 @@ struct f2fs_gc_kthread {
>   	/* for gc control for zoned devices */
>   	unsigned int no_zoned_gc_percent;
>   	unsigned int boost_zoned_gc_percent;
> +	unsigned int valid_thresh_ratio;
>   };
>   
>   struct gc_inode_list {
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 78c3198a6308..26f5abc62461 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3052,7 +3052,8 @@ static int get_ssr_segment(struct f2fs_sb_info *sbi, int type,
>   	sanity_check_seg_type(sbi, seg_type);
>   
>   	/* f2fs_need_SSR() already forces to do this */
> -	if (!f2fs_get_victim(sbi, &segno, BG_GC, seg_type, alloc_mode, age)) {
> +	if (!f2fs_get_victim(sbi, &segno, BG_GC, seg_type,
> +				alloc_mode, age, false)) {
>   		curseg->next_segno = segno;
>   		return 1;
>   	}
> @@ -3079,7 +3080,8 @@ static int get_ssr_segment(struct f2fs_sb_info *sbi, int type,
>   	for (; cnt-- > 0; reversed ? i-- : i++) {
>   		if (i == seg_type)
>   			continue;
> -		if (!f2fs_get_victim(sbi, &segno, BG_GC, i, alloc_mode, age)) {
> +		if (!f2fs_get_victim(sbi, &segno, BG_GC, i,
> +					alloc_mode, age, false)) {
>   			curseg->next_segno = segno;
>   			return 1;
>   		}
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index bfc01a521cb9..43db2d3e8c85 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -188,6 +188,7 @@ struct victim_sel_policy {
>   	unsigned int min_segno;		/* segment # having min. cost */
>   	unsigned long long age;		/* mtime of GCed section*/
>   	unsigned long long age_threshold;/* age threshold */
> +	bool one_time_gc;		/* one time GC */
>   };
>   
>   struct seg_entry {
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 647f6660f4df..d9d47c0698d1 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -962,6 +962,7 @@ GC_THREAD_RW_ATTR(gc_max_sleep_time, max_sleep_time);
>   GC_THREAD_RW_ATTR(gc_no_gc_sleep_time, no_gc_sleep_time);
>   GC_THREAD_RW_ATTR(gc_no_zoned_gc_percent, no_zoned_gc_percent);
>   GC_THREAD_RW_ATTR(gc_boost_zoned_gc_percent, boost_zoned_gc_percent);
> +GC_THREAD_RW_ATTR(gc_valid_thresh_ratio, valid_thresh_ratio);
>   
>   /* SM_INFO ATTR */
>   SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
> @@ -1121,6 +1122,7 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(gc_no_gc_sleep_time),
>   	ATTR_LIST(gc_no_zoned_gc_percent),
>   	ATTR_LIST(gc_boost_zoned_gc_percent),
> +	ATTR_LIST(gc_valid_thresh_ratio),
>   	ATTR_LIST(gc_idle),
>   	ATTR_LIST(gc_urgent),
>   	ATTR_LIST(reclaim_segments),



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
