Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D93B7877B75
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Mar 2024 08:50:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rjaQk-00039D-Cb;
	Mon, 11 Mar 2024 07:50:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rjaQh-000395-JO
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Mar 2024 07:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8NFuTQKQYyB+NirVi6vjAdecTKq+z9aQS2U7/D37PEI=; b=cdaim3QJFhpNe6yv8uJpymonhn
 1jJq0TF/ZynMWxJ4NEjn5x99t9/xf+23B/38MoRbx7uJBy40HJtY8iDO46S8d5kljsKaXIm/rEYHH
 0TFtJgi1x/zCombDs2wHR5OhVwhZj09eMWCTbhdbiJhGMd8GIMTXSJ6r6gIElykJ23pU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8NFuTQKQYyB+NirVi6vjAdecTKq+z9aQS2U7/D37PEI=; b=I
 Kg9m9FmwzMPfxI3aFl6IbCV60pUEDbsF27mhUZeNtNTq9aFSOSB85OoDgc96ug4fpsI5r/a0NShAw
 Ar6GscGFDNpOP8S5PcRhxt1TR9DlVJyEmb5Xh7af3oNxSiEpZboAhmqXMjV2lfxTMLygLWOp0MvXm
 qfPc8rHzkACHsq04=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rjaQU-0005Wt-Gf for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Mar 2024 07:50:39 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 42B7nnFG087657;
 Mon, 11 Mar 2024 15:49:49 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4TtTRV08q2z2KKg7X;
 Mon, 11 Mar 2024 15:48:37 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 11 Mar 2024 15:49:47 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 11 Mar 2024 15:48:54 +0800
Message-ID: <1710143334-27653-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 42B7nnFG087657
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  {new, change}_curseg() may return error in some special cases,
 error handling should be did in their callers, and this will also facilitate
 subsequent error path expansion in {new,change}_curseg(). Signed-off-by:
 Zhiguo Niu <zhiguo.niu@unisoc.com> Signed-off-by: Chao Yu <chao@kernel.org>
 --- v2: remove the part that are irrelevant to this patch --- ---
 fs/f2fs/f2fs.h | 4 ++-- fs/f2fs/gc.c | 7 ++ [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rjaQU-0005Wt-Gf
Subject: [f2fs-dev] [PATCH V2 2/2] f2fs: fix to handle error paths of {new,
 change}_curseg()
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 zhiguo.niu@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

{new,change}_curseg() may return error in some special cases,
error handling should be did in their callers, and this will also
facilitate subsequent error path expansion in {new,change}_curseg().

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2: remove the part that are irrelevant to this patch
---
---
 fs/f2fs/f2fs.h    |  4 ++--
 fs/f2fs/gc.c      |  7 +++++--
 fs/f2fs/segment.c | 57 ++++++++++++++++++++++++++++++++++---------------------
 fs/f2fs/super.c   |  4 +++-
 4 files changed, 45 insertions(+), 27 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4836e7c..7beb074 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3700,10 +3700,10 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 void f2fs_release_discard_addrs(struct f2fs_sb_info *sbi);
 int f2fs_npages_for_summary_flush(struct f2fs_sb_info *sbi, bool for_ra);
 bool f2fs_segment_has_free_slot(struct f2fs_sb_info *sbi, int segno);
-void f2fs_init_inmem_curseg(struct f2fs_sb_info *sbi);
+int f2fs_init_inmem_curseg(struct f2fs_sb_info *sbi);
 void f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi);
 void f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi);
-void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
+int f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 					unsigned int start, unsigned int end);
 int f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type, bool force);
 int f2fs_allocate_pinning_section(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index ca1bf41..8852814 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2035,8 +2035,11 @@ static int free_segment_range(struct f2fs_sb_info *sbi,
 	mutex_unlock(&DIRTY_I(sbi)->seglist_lock);
 
 	/* Move out cursegs from the target range */
-	for (type = CURSEG_HOT_DATA; type < NR_CURSEG_PERSIST_TYPE; type++)
-		f2fs_allocate_segment_for_resize(sbi, type, start, end);
+	for (type = CURSEG_HOT_DATA; type < NR_CURSEG_PERSIST_TYPE; type++) {
+		err = f2fs_allocate_segment_for_resize(sbi, type, start, end);
+		if (err)
+			goto out;
+	}
 
 	/* do GC to move out valid blocks in the range */
 	err = f2fs_gc_range(sbi, start, end, dry_run, 0);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 4e4a51a..c1c1308 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2863,7 +2863,7 @@ bool f2fs_segment_has_free_slot(struct f2fs_sb_info *sbi, int segno)
  * This function always allocates a used segment(from dirty seglist) by SSR
  * manner, so it should recover the existing segment information of valid blocks
  */
-static void change_curseg(struct f2fs_sb_info *sbi, int type)
+static int change_curseg(struct f2fs_sb_info *sbi, int type)
 {
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
@@ -2888,21 +2888,23 @@ static void change_curseg(struct f2fs_sb_info *sbi, int type)
 	if (IS_ERR(sum_page)) {
 		/* GC won't be able to use stale summary pages by cp_error */
 		memset(curseg->sum_blk, 0, SUM_ENTRY_SIZE);
-		return;
+		return PTR_ERR(sum_page);
 	}
 	sum_node = (struct f2fs_summary_block *)page_address(sum_page);
 	memcpy(curseg->sum_blk, sum_node, SUM_ENTRY_SIZE);
 	f2fs_put_page(sum_page, 1);
+	return 0;
 }
 
 static int get_ssr_segment(struct f2fs_sb_info *sbi, int type,
 				int alloc_mode, unsigned long long age);
 
-static void get_atssr_segment(struct f2fs_sb_info *sbi, int type,
+static int get_atssr_segment(struct f2fs_sb_info *sbi, int type,
 					int target_type, int alloc_mode,
 					unsigned long long age)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
+	int ret = 0;
 
 	curseg->seg_type = target_type;
 
@@ -2910,38 +2912,41 @@ static void get_atssr_segment(struct f2fs_sb_info *sbi, int type,
 		struct seg_entry *se = get_seg_entry(sbi, curseg->next_segno);
 
 		curseg->seg_type = se->type;
-		change_curseg(sbi, type);
+		ret = change_curseg(sbi, type);
 	} else {
 		/* allocate cold segment by default */
 		curseg->seg_type = CURSEG_COLD_DATA;
-		new_curseg(sbi, type, true);
+		ret = new_curseg(sbi, type, true);
 	}
 	stat_inc_seg_type(sbi, curseg);
+	return ret;
 }
 
-static void __f2fs_init_atgc_curseg(struct f2fs_sb_info *sbi)
+static int __f2fs_init_atgc_curseg(struct f2fs_sb_info *sbi)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_ALL_DATA_ATGC);
+	int ret = 0;
 
 	if (!sbi->am.atgc_enabled)
-		return;
+		return 0;
 
 	f2fs_down_read(&SM_I(sbi)->curseg_lock);
 
 	mutex_lock(&curseg->curseg_mutex);
 	down_write(&SIT_I(sbi)->sentry_lock);
 
-	get_atssr_segment(sbi, CURSEG_ALL_DATA_ATGC, CURSEG_COLD_DATA, SSR, 0);
+	ret = get_atssr_segment(sbi, CURSEG_ALL_DATA_ATGC,
+					CURSEG_COLD_DATA, SSR, 0);
 
 	up_write(&SIT_I(sbi)->sentry_lock);
 	mutex_unlock(&curseg->curseg_mutex);
 
 	f2fs_up_read(&SM_I(sbi)->curseg_lock);
-
+	return ret;
 }
-void f2fs_init_inmem_curseg(struct f2fs_sb_info *sbi)
+int f2fs_init_inmem_curseg(struct f2fs_sb_info *sbi)
 {
-	__f2fs_init_atgc_curseg(sbi);
+	return __f2fs_init_atgc_curseg(sbi);
 }
 
 static void __f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi, int type)
@@ -3069,11 +3074,12 @@ static bool need_new_seg(struct f2fs_sb_info *sbi, int type)
 	return false;
 }
 
-void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
+int f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 					unsigned int start, unsigned int end)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
 	unsigned int segno;
+	int ret = 0;
 
 	f2fs_down_read(&SM_I(sbi)->curseg_lock);
 	mutex_lock(&curseg->curseg_mutex);
@@ -3084,9 +3090,9 @@ void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 		goto unlock;
 
 	if (f2fs_need_SSR(sbi) && get_ssr_segment(sbi, type, SSR, 0))
-		change_curseg(sbi, type);
+		ret = change_curseg(sbi, type);
 	else
-		new_curseg(sbi, type, true);
+		ret = new_curseg(sbi, type, true);
 
 	stat_inc_seg_type(sbi, curseg);
 
@@ -3100,6 +3106,7 @@ void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 
 	mutex_unlock(&curseg->curseg_mutex);
 	f2fs_up_read(&SM_I(sbi)->curseg_lock);
+	return ret;
 }
 
 static int __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
@@ -3486,14 +3493,17 @@ int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 	bool from_gc = (type == CURSEG_ALL_DATA_ATGC);
 	struct seg_entry *se = NULL;
 	bool segment_full = false;
+	int ret = 0;
 
 	f2fs_down_read(&SM_I(sbi)->curseg_lock);
 
 	mutex_lock(&curseg->curseg_mutex);
 	down_write(&sit_i->sentry_lock);
 
-	if (curseg->segno == NULL_SEGNO)
+	if (curseg->segno == NULL_SEGNO) {
+		ret = -ENOSPC;
 		goto out_err;
+	}
 
 	if (from_gc) {
 		f2fs_bug_on(sbi, GET_SEGNO(sbi, old_blkaddr) == NULL_SEGNO);
@@ -3546,17 +3556,17 @@ int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 		}
 
 		if (from_gc) {
-			get_atssr_segment(sbi, type, se->type,
+			ret = get_atssr_segment(sbi, type, se->type,
 						AT_SSR, se->mtime);
 		} else {
 			if (need_new_seg(sbi, type))
-				new_curseg(sbi, type, false);
+				ret = new_curseg(sbi, type, false);
 			else
-				change_curseg(sbi, type);
+				ret = change_curseg(sbi, type);
 			stat_inc_seg_type(sbi, curseg);
 		}
 
-		if (curseg->segno == NULL_SEGNO)
+		if (ret)
 			goto out_err;
 	}
 
@@ -3599,7 +3609,7 @@ int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 	up_write(&sit_i->sentry_lock);
 	mutex_unlock(&curseg->curseg_mutex);
 	f2fs_up_read(&SM_I(sbi)->curseg_lock);
-	return -ENOSPC;
+	return ret;
 
 }
 
@@ -3829,7 +3839,8 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	/* change the current segment */
 	if (segno != curseg->segno) {
 		curseg->next_segno = segno;
-		change_curseg(sbi, type);
+		if (change_curseg(sbi, type))
+			goto out_unlock;
 	}
 
 	curseg->next_blkoff = GET_BLKOFF_FROM_SEG0(sbi, new_blkaddr);
@@ -3855,12 +3866,14 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	if (recover_curseg) {
 		if (old_cursegno != curseg->segno) {
 			curseg->next_segno = old_cursegno;
-			change_curseg(sbi, type);
+			if (change_curseg(sbi, type))
+				goto out_unlock;
 		}
 		curseg->next_blkoff = old_blkoff;
 		curseg->alloc_type = old_alloc_type;
 	}
 
+out_unlock:
 	up_write(&sit_i->sentry_lock);
 	mutex_unlock(&curseg->curseg_mutex);
 	f2fs_up_write(&SM_I(sbi)->curseg_lock);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 78a7658..f2b6d3f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4685,7 +4685,9 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	if (err)
 		goto free_meta;
 
-	f2fs_init_inmem_curseg(sbi);
+	err = f2fs_init_inmem_curseg(sbi);
+	if (err)
+		goto sync_free_meta;
 
 	/* f2fs_recover_fsync_data() cleared this already */
 	clear_sbi_flag(sbi, SBI_POR_DOING);
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
