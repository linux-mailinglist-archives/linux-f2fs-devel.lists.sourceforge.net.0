Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D171F972539
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Sep 2024 00:20:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1snmk3-0000kP-Kz;
	Mon, 09 Sep 2024 22:20:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1snmjx-0000k1-QN
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 22:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vQJ/nGsQ4DEh1vdP8K9rNtdn0Y5Ouc5JbFoWYWKuiIg=; b=OA3eeDf8XGsTNNEYLpAfRW0x5V
 L+mJgOuVETG6/ux7k3bssbFMsK+GHJ/lvmDDaZwQlYM8GKgdupgly6bSge8RLpSCR9/GOicf30axs
 lHjoz/34WUzh+mO3Tv9w55oOzNVPbq+Zs45ph05OnJhdE4gE1uGSP3f7pOBl0RYHTAv8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vQJ/nGsQ4DEh1vdP8K9rNtdn0Y5Ouc5JbFoWYWKuiIg=; b=C4ud15BX0crNKAtpYBXffqgtKo
 ZE4j9ho8ZRrpHi9xq12zdnQV1g43RoUFmQWfF9KS1BUz71BZgqjM9/87ASiEYqWYaX+hMhWJW5WB3
 jFSfh/3pLZL366YdksyWWkoBb49LXv/iH9ZQOQPWxt/oQel8K2fIaMaKW1HBcxOXDtU4=;
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1snmjr-0006gQ-L2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 22:20:04 +0000
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2d87196ec9fso3144816a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 09 Sep 2024 15:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725920398; x=1726525198; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vQJ/nGsQ4DEh1vdP8K9rNtdn0Y5Ouc5JbFoWYWKuiIg=;
 b=g1wJqfZsUexypoXlOPEndYxH144hki3IXvnaLImj4FTmmbgdLG8JqaKm2oc2GwhYk7
 bnaEd90abxXPK7zYXoc4cedwUyIS5vzcVARaxnxAjTy95JoomYV1131rQ4rQ4IgqUlO2
 JuEyX5YofcI2+pZZBjyfp3QwPsRLdMpfZK1vNLvSRP5FZ2Mz9rLpdrxaDotXjKzBaUrR
 9zKSbwF2MeqX9h+yvi6nxIRFhwUaro4j1ZKQjxE7QVd0gnn8/nKxuctp09lBs979fXGg
 lusYk8+hlGlwZpBu/v1yqUIOnjT389/Qi0FhwAtYPTd58LRJL1s8xEDWxm95+KU16CPq
 R+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725920398; x=1726525198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vQJ/nGsQ4DEh1vdP8K9rNtdn0Y5Ouc5JbFoWYWKuiIg=;
 b=wS8ID7dK99k4snyimjbpncKUIQEqCYxfIzI+q8OBfZlsEcKd9XHukH8l23zHKrWAqp
 JMN9AuLfxaHtkV5rY8naHYXhiQCVqMl5PAsxNvDrJ0gc1pmoxSZ8Ya5IAqN/j8z4bQKZ
 OS9uP7WmMz2qRrPEHLYYVDG4nrESM/YvWPQBAEugPi/rurwZ7JNvZsr7owEcVy5AAkeD
 9aXyCzwsj+dw9oEOx4KTzt3jME6NFUbnKe87InsJGCBdPjR5YlR8/2x0D+zovq7FKcaG
 LEA0cVrPSLzKFaWbyDJU07GRYOrEfaK4rBYVot7WGo7xbDHeQAWgVCqou2k1g9DzulMd
 zxDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjE2HkDZd3HaXSfhr2TEpG68ojl0lBNg2UnlaocGYRlho/n6RZn0hpOag2SyKR2GowjL/u7HNHNPaJEYcKNPl0@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwX0qtQN9IaMIVwtMR/eBMmkoYn1GSQmLFYl9Z/TwuzvZt00Yd4
 TnVcFVucjGMgwZndPs4llX8VYYmXFrQNpJrJPIejFmHBNPGRn4Lt
X-Google-Smtp-Source: AGHT+IHVPTHzH7+XMEkQw48bj2F5rk5bRhOLsm40meb4RM6lVxu1iirHvVJM165fPzUtiQ5uQiQbUw==
X-Received: by 2002:a17:90b:4a88:b0:2d3:c05c:c51 with SMTP id
 98e67ed59e1d1-2dad4b9af79mr12449301a91.0.1725920397740; 
 Mon, 09 Sep 2024 15:19:57 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:ed56:14c3:db02:6c66])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2db04988470sm5016840a91.54.2024.09.09.15.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 15:19:57 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon,  9 Sep 2024 15:19:46 -0700
Message-ID: <20240909221946.2004046-7-daeho43@gmail.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240909221946.2004046-1-daeho43@gmail.com>
References: <20240909221946.2004046-1-daeho43@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong We need to introduce a valid block ratio
 threshold not to trigger excessive GC for zoned deivces. The initial value
 of it is 95%. So, F2FS will stop the thread from intiating GC for sections
 having va [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.43 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.43 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1snmjr-0006gQ-L2
Subject: [f2fs-dev] [PATCH v2 7/7] f2fs: add valid block ratio not to do
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

We need to introduce a valid block ratio threshold not to trigger
excessive GC for zoned deivces. The initial value of it is 95%. So, F2FS
will stop the thread from intiating GC for sections having valid blocks
exceeding the ratio.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: use CAP_BLKS_PER_SEC instead of BLKS_PER_SEC
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  8 ++++++++
 fs/f2fs/f2fs.h                          |  2 +-
 fs/f2fs/gc.c                            | 16 ++++++++++++----
 fs/f2fs/gc.h                            |  2 ++
 fs/f2fs/segment.c                       |  6 ++++--
 fs/f2fs/segment.h                       |  1 +
 fs/f2fs/sysfs.c                         |  2 ++
 7 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index f3c533b523cd..2fcb16ca10d3 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -791,3 +791,11 @@ Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	If the percentage of free sections over total sections is under this
 		number, F2FS boosts garbage collection for zoned devices through the
 		background GC thread. the default number is "25".
+
+What:		/sys/fs/f2fs/<disk>/gc_valid_thresh_ratio
+Date:		September 2024
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	It controls the valid block ratio threshold not to trigger excessive GC
+		for zoned deivces. The initial value of it is 95(%). F2FS will stop the
+		background GC thread from intiating GC for sections having valid blocks
+		exceeding the ratio.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 62880fbb9e20..2bfad046dc74 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3920,7 +3920,7 @@ void f2fs_destroy_garbage_collection_cache(void);
 /* victim selection function for cleaning and SSR */
 int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 			int gc_type, int type, char alloc_mode,
-			unsigned long long age);
+			unsigned long long age, bool one_time);
 
 /*
  * recovery.c
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 319b4b80ba72..d3e3104c4492 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -196,6 +196,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 		return -ENOMEM;
 
 	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
+	gc_th->valid_thresh_ratio = DEF_GC_THREAD_VALID_THRESH_RATIO;
 
 	if (f2fs_sb_has_blkzoned(sbi)) {
 		gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME_ZONED;
@@ -396,6 +397,11 @@ static inline unsigned int get_gc_cost(struct f2fs_sb_info *sbi,
 	if (p->alloc_mode == SSR)
 		return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
 
+	if (p->one_time_gc && (get_valid_blocks(sbi, segno, true) >=
+		CAP_BLKS_PER_SEC(sbi) * sbi->gc_thread->valid_thresh_ratio /
+		100))
+		return UINT_MAX;
+
 	/* alloc_mode == LFS */
 	if (p->gc_mode == GC_GREEDY)
 		return get_valid_blocks(sbi, segno, true);
@@ -770,7 +776,7 @@ static int f2fs_gc_pinned_control(struct inode *inode, int gc_type,
  */
 int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 			int gc_type, int type, char alloc_mode,
-			unsigned long long age)
+			unsigned long long age, bool one_time)
 {
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
 	struct sit_info *sm = SIT_I(sbi);
@@ -787,6 +793,7 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 	p.alloc_mode = alloc_mode;
 	p.age = age;
 	p.age_threshold = sbi->am.age_threshold;
+	p.one_time_gc = one_time;
 
 retry:
 	select_policy(sbi, gc_type, type, &p);
@@ -1698,13 +1705,14 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 }
 
 static int __get_victim(struct f2fs_sb_info *sbi, unsigned int *victim,
-			int gc_type)
+			int gc_type, bool one_time)
 {
 	struct sit_info *sit_i = SIT_I(sbi);
 	int ret;
 
 	down_write(&sit_i->sentry_lock);
-	ret = f2fs_get_victim(sbi, victim, gc_type, NO_CHECK_TYPE, LFS, 0);
+	ret = f2fs_get_victim(sbi, victim, gc_type, NO_CHECK_TYPE,
+			LFS, 0, one_time);
 	up_write(&sit_i->sentry_lock);
 	return ret;
 }
@@ -1911,7 +1919,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 		goto stop;
 	}
 retry:
-	ret = __get_victim(sbi, &segno, gc_type);
+	ret = __get_victim(sbi, &segno, gc_type, gc_control->one_time);
 	if (ret) {
 		/* allow to search victim from sections has pinned data */
 		if (ret == -ENODATA && gc_type == FG_GC &&
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index c063310c8dde..2914b678bf8f 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -25,6 +25,7 @@
 #define DEF_GC_THREAD_CANDIDATE_RATIO		20	/* select 20% oldest sections as candidates */
 #define DEF_GC_THREAD_MAX_CANDIDATE_COUNT	10	/* select at most 10 sections as candidates */
 #define DEF_GC_THREAD_AGE_WEIGHT		60	/* age weight */
+#define DEF_GC_THREAD_VALID_THRESH_RATIO	95	/* do not GC over 95% valid block ratio for one time GC */
 #define DEFAULT_ACCURACY_CLASS			10000	/* accuracy class */
 
 #define LIMIT_INVALID_BLOCK	40 /* percentage over total user space */
@@ -65,6 +66,7 @@ struct f2fs_gc_kthread {
 	/* for gc control for zoned devices */
 	unsigned int no_zoned_gc_percent;
 	unsigned int boost_zoned_gc_percent;
+	unsigned int valid_thresh_ratio;
 };
 
 struct gc_inode_list {
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 78c3198a6308..26f5abc62461 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3052,7 +3052,8 @@ static int get_ssr_segment(struct f2fs_sb_info *sbi, int type,
 	sanity_check_seg_type(sbi, seg_type);
 
 	/* f2fs_need_SSR() already forces to do this */
-	if (!f2fs_get_victim(sbi, &segno, BG_GC, seg_type, alloc_mode, age)) {
+	if (!f2fs_get_victim(sbi, &segno, BG_GC, seg_type,
+				alloc_mode, age, false)) {
 		curseg->next_segno = segno;
 		return 1;
 	}
@@ -3079,7 +3080,8 @@ static int get_ssr_segment(struct f2fs_sb_info *sbi, int type,
 	for (; cnt-- > 0; reversed ? i-- : i++) {
 		if (i == seg_type)
 			continue;
-		if (!f2fs_get_victim(sbi, &segno, BG_GC, i, alloc_mode, age)) {
+		if (!f2fs_get_victim(sbi, &segno, BG_GC, i,
+					alloc_mode, age, false)) {
 			curseg->next_segno = segno;
 			return 1;
 		}
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index bfc01a521cb9..43db2d3e8c85 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -188,6 +188,7 @@ struct victim_sel_policy {
 	unsigned int min_segno;		/* segment # having min. cost */
 	unsigned long long age;		/* mtime of GCed section*/
 	unsigned long long age_threshold;/* age threshold */
+	bool one_time_gc;		/* one time GC */
 };
 
 struct seg_entry {
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 60693ec39a03..83e52f6061d0 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -967,6 +967,7 @@ GC_THREAD_RW_ATTR(gc_max_sleep_time, max_sleep_time);
 GC_THREAD_RW_ATTR(gc_no_gc_sleep_time, no_gc_sleep_time);
 GC_THREAD_RW_ATTR(gc_no_zoned_gc_percent, no_zoned_gc_percent);
 GC_THREAD_RW_ATTR(gc_boost_zoned_gc_percent, boost_zoned_gc_percent);
+GC_THREAD_RW_ATTR(gc_valid_thresh_ratio, valid_thresh_ratio);
 
 /* SM_INFO ATTR */
 SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
@@ -1127,6 +1128,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_no_gc_sleep_time),
 	ATTR_LIST(gc_no_zoned_gc_percent),
 	ATTR_LIST(gc_boost_zoned_gc_percent),
+	ATTR_LIST(gc_valid_thresh_ratio),
 	ATTR_LIST(gc_idle),
 	ATTR_LIST(gc_urgent),
 	ATTR_LIST(reclaim_segments),
-- 
2.46.0.598.g6f2099f65c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
