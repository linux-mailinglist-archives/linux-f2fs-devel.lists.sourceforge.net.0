Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E77F21028E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jul 2020 05:36:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqTXY-0003I9-8r; Wed, 01 Jul 2020 03:36:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jqTXV-0003Hw-WD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 03:36:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FyxIqerkIqV2e//pGAeN/rjFGLz2BdFj9xKhu8UCZNM=; b=TTfhGchJUFbp79dVhgpAdjxjE1
 N+WWwMzfsYuN+d9BVNXRjoXfpWZW9+4qzEWdPTdaq8IUmgvx3rz1CN221BWSRGMtTw/FU4sT6hUer
 mdE0z1EmTighU/q2Z1sh2vYtLFZdr6jyxf6oO0jAc+XKsas9AvSwS3HITs1DlTJPMSMc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FyxIqerkIqV2e//pGAeN/rjFGLz2BdFj9xKhu8UCZNM=; b=V+48a/zPLLhoN+m5cAycEHX/9V
 zBJEUDkDSXk1RvGTWyrhhhaA25ktThOED+ANuze84n9/kWTm196JOMqTYhVH3ekxjw8hOX9oEyDBM
 6PRfdYRd8LMxsizFJVduHbMJG/aR7DYCGiTdsL0+zEATD4053GyUBy03SFkfc+MukTic=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqTXT-003hhi-SZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 03:36:01 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4DC499D97A5B2F500D19;
 Wed,  1 Jul 2020 11:35:51 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 1 Jul 2020
 11:35:45 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20200630005422.2389686-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <a10baad2-350a-ea1b-c338-63b2bc58a26a@huawei.com>
Date: Wed, 1 Jul 2020 11:35:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200630005422.2389686-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqTXT-003hhi-SZ
Subject: Re: [f2fs-dev] [PATCH] f2fs: add GC_URGENT_LOW mode in gc_urgent
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/6/30 8:54, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added a new gc_urgent mode, GC_URGENT_LOW, in which mode
> F2FS will lower the bar of checking idle in order to
> process outstanding discard commands and GC a little bit
> aggressively.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs |  4 +++-
>  fs/f2fs/f2fs.h                          | 10 ++++++++--
>  fs/f2fs/gc.c                            |  6 +++---
>  fs/f2fs/segment.c                       |  4 ++--
>  fs/f2fs/sysfs.c                         |  6 ++++--
>  5 files changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 4bb93a06d8ab..7f730c4c8df2 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -229,7 +229,9 @@ Date:		August 2017
>  Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
>  Description:	Do background GC agressively when set. When gc_urgent = 1,
>  		background thread starts to do GC by given gc_urgent_sleep_time
> -		interval. It is set to 0 by default.
> +		interval. When gc_urgent = 2, F2FS will lower the bar of
> +		checking idle in order to process outstanding discard commands
> +		and GC a little bit aggressively. It is set to 0 by default.
>  
>  What:		/sys/fs/f2fs/<disk>/gc_urgent_sleep_time
>  Date:		August 2017
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e6e47618a357..4b28fd42fdbc 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1283,7 +1283,8 @@ enum {
>  	GC_NORMAL,
>  	GC_IDLE_CB,
>  	GC_IDLE_GREEDY,
> -	GC_URGENT,
> +	GC_URGENT_HIGH,
> +	GC_URGENT_LOW,
>  };
>  
>  enum {
> @@ -1540,6 +1541,7 @@ struct f2fs_sb_info {
>  	unsigned int cur_victim_sec;		/* current victim section num */
>  	unsigned int gc_mode;			/* current GC state */
>  	unsigned int next_victim_seg[2];	/* next segment in victim section */
> +
>  	/* for skip statistic */
>  	unsigned int atomic_files;              /* # of opened atomic file */
>  	unsigned long long skipped_atomic_files[2];	/* FG_GC and BG_GC */
> @@ -2480,7 +2482,7 @@ static inline void *f2fs_kmem_cache_alloc(struct kmem_cache *cachep,
>  
>  static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
>  {
> -	if (sbi->gc_mode == GC_URGENT)
> +	if (sbi->gc_mode == GC_URGENT_HIGH)
>  		return true;
>  
>  	if (get_pages(sbi, F2FS_RD_DATA) || get_pages(sbi, F2FS_RD_NODE) ||
> @@ -2498,6 +2500,10 @@ static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
>  			atomic_read(&SM_I(sbi)->fcc_info->queued_flush))
>  		return false;
>  
> +	if (sbi->gc_mode == GC_URGENT_LOW &&
> +			(type == DISCARD_TIME || type == GC_TIME))
> +		return true;
> +
>  	return f2fs_time_over(sbi, type);
>  }
>  
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 6eec3b2d606d..3b718da69910 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -82,7 +82,7 @@ static int gc_thread_func(void *data)
>  		 * invalidated soon after by user update or deletion.
>  		 * So, I'd like to wait some time to collect dirty segments.
>  		 */
> -		if (sbi->gc_mode == GC_URGENT) {
> +		if (sbi->gc_mode == GC_URGENT_HIGH) {
>  			wait_ms = gc_th->urgent_sleep_time;
>  			down_write(&sbi->gc_lock);
>  			goto do_gc;
> @@ -176,7 +176,7 @@ static int select_gc_type(struct f2fs_sb_info *sbi, int gc_type)
>  		gc_mode = GC_CB;
>  		break;
>  	case GC_IDLE_GREEDY:
> -	case GC_URGENT:
> +	case GC_URGENT_HIGH:
>  		gc_mode = GC_GREEDY;
>  		break;
>  	}
> @@ -211,7 +211,7 @@ static void select_policy(struct f2fs_sb_info *sbi, int gc_type,
>  	 * foreground GC and urgent GC cases.
>  	 */
>  	if (gc_type != FG_GC &&
> -			(sbi->gc_mode != GC_URGENT) &&
> +			(sbi->gc_mode != GC_URGENT_HIGH) &&
>  			p->max_search > sbi->max_victim_search)
>  		p->max_search = sbi->max_victim_search;
>  
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index b45e473508a9..5924b3965ae4 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -174,7 +174,7 @@ bool f2fs_need_SSR(struct f2fs_sb_info *sbi)
>  
>  	if (f2fs_lfs_mode(sbi))
>  		return false;
> -	if (sbi->gc_mode == GC_URGENT)
> +	if (sbi->gc_mode == GC_URGENT_HIGH)
>  		return true;
>  	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
>  		return true;
> @@ -1759,7 +1759,7 @@ static int issue_discard_thread(void *data)
>  			continue;
>  		}
>  
> -		if (sbi->gc_mode == GC_URGENT)
> +		if (sbi->gc_mode == GC_URGENT_HIGH)
>  			__init_discard_policy(sbi, &dpolicy, DPOLICY_FORCE, 1);
>  
>  		sb_start_intwrite(sbi->sb);
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index e877c59b9fdb..ab40e1f89f23 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -350,14 +350,16 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  		return -EINVAL;
>  
>  	if (!strcmp(a->attr.name, "gc_urgent")) {
> -		if (t >= 1) {
> -			sbi->gc_mode = GC_URGENT;
> +		if (t == 1) {
> +			sbi->gc_mode = GC_URGENT_HIGH;
>  			if (sbi->gc_thread) {
>  				sbi->gc_thread->gc_wake = 1;
>  				wake_up_interruptible_all(
>  					&sbi->gc_thread->gc_wait_queue_head);
>  				wake_up_discard_thread(sbi, true);
>  			}
> +		} else if (t == 2) {
> +			sbi->gc_mode = GC_URGENT_LOW;
>  		} else {
>  			sbi->gc_mode = GC_NORMAL;

As functionality description in sysfs doc, shouldn't it be:

if (t == 0) {
	sbi->gc_mode = GC_NORMAL;
} else if (t == 1) {
	sbi->gc_mode = GC_URGENT_HIGH;
	...
} else if (t == 2) {
	sbi->gc_mode = GC_URGENT_LOW;
} else {
	return -EINVAL;
}
return count;

>  		}
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
