Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C7C51BE20
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 May 2022 13:35:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nmZlh-0000A0-Ik; Thu, 05 May 2022 11:35:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nmZlh-00009m-6I
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 May 2022 11:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3I+2EThZB2x95vqGxnzQkyxRgM8Jlne65JuGwAe5SzI=; b=XbruzdvmIkGreDk3P171NKCORy
 wXBw43R1BVtylfQKkh5g8BjRpT2sKFxJ8BEreJCM4waKoSRcCP9M6kR2sVjDoLWe5lVr9IkQVxs47
 UP2Es5pwf40Y2rmuLoQZh8raOIUj6qhY1iKbbtJ+CPM5xbdLT2drIFqAmkBRgjaudVrU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3I+2EThZB2x95vqGxnzQkyxRgM8Jlne65JuGwAe5SzI=; b=SFbrrtT99LfnsUzXJ0WRkenHuW
 EV2vyHTswzLkfmaVcnZPPwcxNRdstfwfN0TEjTi6Vj+W1SEv9eSvZMkYyCKptj8B7MR9w30UK8Pbd
 PCv2O1F1e31vGocV7FKD6FN1KEZqVhQMlMeepoNKMSM2uiYGCXbdB6ZEgfobe/9JlBsE=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nmZle-0025Cw-FS
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 May 2022 11:35:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A0362CE2CD8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  5 May 2022 11:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 525FCC385A8;
 Thu,  5 May 2022 11:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651750520;
 bh=IwCWf3GJBdo99UeZ55sROy91SUTr3iRNx0svAIAvgzk=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=PrQVzq4ybXbjpT5PAqq9XszP47Lk99oBP+sg39XIaxW5IrYRkhE75nLJ+C3Lf8zt6
 fP3hnnGBl1U3DpE2W8g8yFWooqaoVTnM/h2FWbBRQ+9DP3sZdbWrOmKIO1thJzfH4w
 zTQerpKdkH3SBgEVrMUUfAwLkIqxR1NUqJLmdpmXloJtXY+ydJT4WE03y2AJtwzSzA
 JBsLGUhEn1KqKaMPvmlcsqU4+XdurBka9/OYpVjcKuOazdQzKCaRy12toSpwI7J+7X
 CVa8HHiHwxeALRWzeOzOM2RXRDySQyQ+KMrKCdvSza86rdRSPh/9tdrhj75MU0qENC
 JBuSFujtVKG3A==
Message-ID: <eb440861-1de1-ebe8-1115-1004677f8306@kernel.org>
Date: Thu, 5 May 2022 19:35:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220503203040.365028-1-jaegeuk@kernel.org>
 <20220503203040.365028-2-jaegeuk@kernel.org> <YnLgnhiJtrutv8nw@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YnLgnhiJtrutv8nw@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/5 4:22, Jaegeuk Kim wrote: > The f2fs_gc uses a
 bitmap to indicate pinned sections, but when disabling > chckpoint, we call
 f2fs_gc() with NULL_SEGNO which selects the same dirty > segment a [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nmZle-0025Cw-FS
Subject: Re: [f2fs-dev] [PATCH 2/2 v2] f2fs: avoid to select pinned section
 during checkpoint=disable
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/5/5 4:22, Jaegeuk Kim wrote:
> The f2fs_gc uses a bitmap to indicate pinned sections, but when disabling
> chckpoint, we call f2fs_gc() with NULL_SEGNO which selects the same dirty
> segment as a victim all the time, resulting in checkpoint=disable failure.
> Let's pick another one, if we fail to collect it.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> 
>   Change log from v1:
>    - keep sync condition to stop GC
> 
>   fs/f2fs/gc.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 4d47723523c3..441190ab8593 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1838,10 +1838,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
>   	if (gc_type == FG_GC)
>   		sbi->cur_victim_sec = NULL_SEGNO;
>   
> -	if (sync)
> -		goto stop;
> -
> -	if (!has_not_enough_free_secs(sbi, sec_freed, 0))
> +	if ((!has_not_enough_free_secs(sbi, sec_freed, 0) || sync) && seg_freed)

Wait, it doesn't make sense that it needs to migrate one section successfully
when there is enough free sections, e.g. for background GC case.

I doubt above implementation may force bggc to migrate all dirty sections?
due to seg_freed will always be zero, because it increases only if gc_type
is FG_GC?

		if (gc_type == FG_GC &&
				get_valid_blocks(sbi, segno, false) == 0)
			seg_freed++;

And I didn't see there is one or combinations of parameters can indicate
meaning: "it needs to migrate one section at least before exit", so how
about introducing another parameter for this requirement?

From: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Sat, 30 Apr 2022 03:27:20 -0700
Subject: [PATCH] f2fs: avoid to select pinned section during
  checkpoint=disable

The f2fs_gc uses a bitmap to indicate pinned sections, but when disabling
chckpoint, we call f2fs_gc() with NULL_SEGNO which selects the same dirty
segment as a victim all the time, resulting in checkpoint=disable failure.
Let's pick another one, if we fail to collect it.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
  fs/f2fs/f2fs.h    |  2 +-
  fs/f2fs/file.c    |  8 ++++----
  fs/f2fs/gc.c      | 17 ++++++++++++-----
  fs/f2fs/segment.c |  2 +-
  fs/f2fs/super.c   |  2 +-
  5 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 56adc3b68e14..0f8c426aed50 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3787,7 +3787,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi);
  void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi);
  block_t f2fs_start_bidx_of_node(unsigned int node_ofs, struct inode *inode);
  int f2fs_gc(struct f2fs_sb_info *sbi, bool sync, bool background, bool force,
-			unsigned int segno);
+			unsigned int segno, unsigned int nr_section);
  void f2fs_build_gc_manager(struct f2fs_sb_info *sbi);
  int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count);
  int __init f2fs_create_garbage_collection_cache(void);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e4cf8b7b23aa..07d2fa6c774b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1684,7 +1684,7 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
  		if (has_not_enough_free_secs(sbi, 0,
  			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
  			f2fs_down_write(&sbi->gc_lock);
-			err = f2fs_gc(sbi, true, false, false, NULL_SEGNO);
+			err = f2fs_gc(sbi, true, false, false, NULL_SEGNO, 0);
  			if (err && err != -ENODATA && err != -EAGAIN)
  				goto out_err;
  		}
@@ -2472,7 +2472,7 @@ static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
  		f2fs_down_write(&sbi->gc_lock);
  	}

-	ret = f2fs_gc(sbi, sync, true, false, NULL_SEGNO);
+	ret = f2fs_gc(sbi, sync, true, false, NULL_SEGNO, 0);
  out:
  	mnt_drop_write_file(filp);
  	return ret;
@@ -2509,7 +2509,7 @@ static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
  	}

  	ret = f2fs_gc(sbi, range->sync, true, false,
-				GET_SEGNO(sbi, range->start));
+				GET_SEGNO(sbi, range->start), 0);
  	if (ret) {
  		if (ret == -EBUSY)
  			ret = -EAGAIN;
@@ -2966,7 +2966,7 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
  		sm->last_victim[GC_CB] = end_segno + 1;
  		sm->last_victim[GC_GREEDY] = end_segno + 1;
  		sm->last_victim[ALLOC_NEXT] = end_segno + 1;
-		ret = f2fs_gc(sbi, true, true, true, start_segno);
+		ret = f2fs_gc(sbi, true, true, true, start_segno, 0);
  		if (ret == -EAGAIN)
  			ret = 0;
  		else if (ret < 0)
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 4d47723523c3..2364ffe6bbbf 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -142,7 +142,7 @@ static int gc_thread_func(void *data)
  			sync_mode = false;

  		/* if return value is not zero, no victim was selected */
-		if (f2fs_gc(sbi, sync_mode, !foreground, false, NULL_SEGNO))
+		if (f2fs_gc(sbi, sync_mode, !foreground, false, NULL_SEGNO, 0))
  			wait_ms = gc_th->no_gc_sleep_time;

  		if (foreground)
@@ -1751,7 +1751,8 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
  }

  int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
-			bool background, bool force, unsigned int segno)
+			bool background, bool force, unsigned int segno,
+			unsigned int nr_section)
  {
  	int gc_type = sync ? FG_GC : BG_GC;
  	int sec_freed = 0, seg_freed = 0, total_freed = 0;
@@ -1838,11 +1839,17 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
  	if (gc_type == FG_GC)
  		sbi->cur_victim_sec = NULL_SEGNO;

-	if (sync)
-		goto stop;
+	

-	if (!has_not_enough_free_secs(sbi, sec_freed, 0))
+	if (sync || !has_not_enough_free_secs(sbi, sec_freed, 0)) {
+		/*
+		 * f2fs_disable_checkpoint() needs to migrate enough section
+		 * before f2fs_gc() exits.
+		 */
+		if (total_freed < nr_section)
+			goto gc_more;
  		goto stop;
+	}

  	if (skipped_round <= MAX_SKIP_GC_COUNT || skipped_round * 2 < round) {

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8c17fed8987e..3a3e2cec2ac4 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -524,7 +524,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
  			finish_wait(&sbi->gc_thread->fggc_wq, &wait);
  		} else {
  			f2fs_down_write(&sbi->gc_lock);
-			f2fs_gc(sbi, false, false, false, NULL_SEGNO);
+			f2fs_gc(sbi, false, false, false, NULL_SEGNO, 0);
  		}
  	}
  }
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d06a577a1208..2f0ad9ffbf17 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2076,7 +2076,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)

  	while (!f2fs_time_over(sbi, DISABLE_TIME)) {
  		f2fs_down_write(&sbi->gc_lock);
-		err = f2fs_gc(sbi, true, false, false, NULL_SEGNO);
+		err = f2fs_gc(sbi, true, false, false, NULL_SEGNO, 1);
  		if (err == -ENODATA) {
  			err = 0;
  			break;
-- 
2.32.0

>   		goto stop;
>   
>   	if (skipped_round <= MAX_SKIP_GC_COUNT || skipped_round * 2 < round) {


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
