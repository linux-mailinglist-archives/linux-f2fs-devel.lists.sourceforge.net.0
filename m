Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17874965263
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Aug 2024 23:53:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sjn4r-0006PY-E2;
	Thu, 29 Aug 2024 21:53:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1sjn4p-0006PP-56
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Aug 2024 21:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Lbaah111wuAwM01PbzQxCw0HL6ZCiCPf+qhy2mwy+w=; b=S0RbeorqKZv5BiPRS3Do+F2m2n
 Z8nNCvC68j2lwvYRcPxZFAHRL5/sx9bidcOLOqJp86CHTJMISlPV0MoC9LRvph/rQQNAmP0Js5jS3
 EJRJNaVqnZAWftHTFwFc/PGMhlPtOLyuAu7APcY97Mu9eJxHvaG+92Dgg4LafMQBcnUc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7Lbaah111wuAwM01PbzQxCw0HL6ZCiCPf+qhy2mwy+w=; b=f/JkA5WXqz/dU8ina/yK3YRgOQ
 ulXVDqU5Y5u8+olEhZcwMvEG1YtIKPSGOxXWcR22jnxhs/nr6+3eT+/JgWJjBn7U7hbE0EGkwAtnX
 dFBmDZTgxx0i/f36EpVpO844tETnShZmxwD3+oRvPdftUx9+Dxp4hsEpRafXEnDl7tDo=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sjn4n-0007bz-Kv for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Aug 2024 21:53:10 +0000
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-71423704ef3so862654b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Aug 2024 14:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724968379; x=1725573179; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Lbaah111wuAwM01PbzQxCw0HL6ZCiCPf+qhy2mwy+w=;
 b=lQ3Mc2WsAKGlMlR7J5rWbmGWgbvqoIhB1XQ5J4EXVSaMiL/E7LBge1aKc93fSohk3K
 fggFxXQLVyW5UJOTtxMoYeoO/1M1t2/rWLJgdiugn9bJ80iQPzNwAF4h/gTTMrP21tGd
 GDaP9RpJOViPLu0tX+M/OHF43Kq+7HON1ujMaaP08f+s3WdIZ9z3DlbrXWSf4FhOvL52
 03uAD16ic0LIA7hDvNbCyFk1t3DkLmIsuI7UjtwxQFWiEepCC4RoBOnxCJV9OcS1yKSk
 cLzLocw4V7srmNoU2B5eqEfsECFo/ePCxvCSaOemDnbbWCicf/lDaCIk4xXVezhhTIAr
 N4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724968379; x=1725573179;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Lbaah111wuAwM01PbzQxCw0HL6ZCiCPf+qhy2mwy+w=;
 b=rmBuWyDjT/MiCkhjNGw2z2HSOLOKWgAytekwZRa7hRwiQ2Lq/ndZmGM4o+7cDABolb
 Y0Pk2Rb5tcCcfzdB/bATeX3sBqlsiTjdqv/TxeG4Xp+a+LyjMLqUVpNLRvl06xtdfnZ+
 Ka6mRsR/ghgTlnsY8MB1gPKBRyzAXxvgZLbyo7CdpgJeCcgLz9W7MYT3RL+MXcxeEZeS
 3+N3cxEpXp/C+d4t85ruCfZBHDbdONxfwST24BFBJik47FOXnN28yf5TTb7cDVU+XyEv
 ufXcfAmmuuRFf8WWRAbHVruNzoSMGB18L2qWwF5xtww6xAXK0+0pjjwIUJM3pNgZVpO5
 HCGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEBHNwaAD58FOK5KcJka9Ayx0D1dZHeNfcNKskJNe06KbbqWKuozB0T96X09Foe7TYF+E5Z2UaLohoeEZ3xnJy@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxrvUySGMKk0l1S0LDnSfXCriYBF0dNCbCGtjJ7VVqJgFBJI7wR
 40dj1l8KrcRnB3Xpov1XHoENvN6tHkeC9dD0hBjuZtVUzjW7C2jB
X-Google-Smtp-Source: AGHT+IFLRqSB1/22xDRiHykjWNu41egh2fpOLOTNqn8YYnKw+U7sZvls915pHWBgE73Lrr84BhSk2Q==
X-Received: by 2002:a05:6a21:1698:b0:1cc:e9bc:2567 with SMTP id
 adf61e73a8af0-1cce9bc27d9mr2088942637.24.1724968378824; 
 Thu, 29 Aug 2024 14:52:58 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:a1e7:73eb:e77e:3e2b])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d512asm1705653a12.78.2024.08.29.14.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 14:52:58 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 29 Aug 2024 14:52:42 -0700
Message-ID: <20240829215242.3641502-7-daeho43@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240829215242.3641502-1-daeho43@gmail.com>
References: <20240829215242.3641502-1-daeho43@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -5.0 (-----)
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
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.171 listed in sa-trusted.bondedsender.org]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.171 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.210.171 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sjn4n-0007bz-Kv
Subject: [f2fs-dev] [PATCH 7/7] f2fs: add valid block ratio not to do
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
 Documentation/ABI/testing/sysfs-fs-f2fs |  8 ++++++++
 fs/f2fs/f2fs.h                          |  2 +-
 fs/f2fs/gc.c                            | 15 +++++++++++----
 fs/f2fs/gc.h                            |  2 ++
 fs/f2fs/segment.c                       |  6 ++++--
 fs/f2fs/segment.h                       |  1 +
 fs/f2fs/sysfs.c                         |  2 ++
 7 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 265baec879fd..2d3e42af0e63 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -783,3 +783,11 @@ Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	If the percentage of free sections over total sections is under this
 		number, F2FS boosts garbage collection for zoned devices through the
 		background GC thread. the default number is "25".
+
+What:		/sys/fs/f2fs/<disk>/gc_valid_thresh_ratio
+Date:		August 2024
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	It controls the valid block ratio threshold not to trigger excessive GC
+		for zoned deivces. The initial value of it is 95(%). F2FS will stop the
+		background GC thread from intiating GC for sections having valid blocks
+		exceeding the ratio.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ee1fafc65e95..8220b3189780 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3918,7 +3918,7 @@ void f2fs_destroy_garbage_collection_cache(void);
 /* victim selection function for cleaning and SSR */
 int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 			int gc_type, int type, char alloc_mode,
-			unsigned long long age);
+			unsigned long long age, bool one_time);
 
 /*
  * recovery.c
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6b79c43a57e3..feb80345aca3 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -196,6 +196,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 		return -ENOMEM;
 
 	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
+	gc_th->valid_thresh_ratio = DEF_GC_THREAD_VALID_THRESH_RATIO;
 
 	if (f2fs_sb_has_blkzoned(sbi)) {
 		gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME_ZONED;
@@ -396,6 +397,10 @@ static inline unsigned int get_gc_cost(struct f2fs_sb_info *sbi,
 	if (p->alloc_mode == SSR)
 		return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
 
+	if (p->one_time_gc && (get_valid_blocks(sbi, segno, true) >=
+		BLKS_PER_SEC(sbi) * sbi->gc_thread->valid_thresh_ratio / 100))
+		return UINT_MAX;
+
 	/* alloc_mode == LFS */
 	if (p->gc_mode == GC_GREEDY)
 		return get_valid_blocks(sbi, segno, true);
@@ -770,7 +775,7 @@ static int f2fs_gc_pinned_control(struct inode *inode, int gc_type,
  */
 int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 			int gc_type, int type, char alloc_mode,
-			unsigned long long age)
+			unsigned long long age, bool one_time)
 {
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
 	struct sit_info *sm = SIT_I(sbi);
@@ -787,6 +792,7 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 	p.alloc_mode = alloc_mode;
 	p.age = age;
 	p.age_threshold = sbi->am.age_threshold;
+	p.one_time_gc = one_time;
 
 retry:
 	select_policy(sbi, gc_type, type, &p);
@@ -1698,13 +1704,14 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
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
@@ -1908,7 +1915,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 		goto stop;
 	}
 retry:
-	ret = __get_victim(sbi, &segno, gc_type);
+	ret = __get_victim(sbi, &segno, gc_type, gc_control->one_time);
 	if (ret) {
 		/* allow to search victim from sections has pinned data */
 		if (ret == -ENODATA && gc_type == FG_GC &&
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index e8195eb4ca6d..59872daf88ee 100644
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
index 647f6660f4df..d9d47c0698d1 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -962,6 +962,7 @@ GC_THREAD_RW_ATTR(gc_max_sleep_time, max_sleep_time);
 GC_THREAD_RW_ATTR(gc_no_gc_sleep_time, no_gc_sleep_time);
 GC_THREAD_RW_ATTR(gc_no_zoned_gc_percent, no_zoned_gc_percent);
 GC_THREAD_RW_ATTR(gc_boost_zoned_gc_percent, boost_zoned_gc_percent);
+GC_THREAD_RW_ATTR(gc_valid_thresh_ratio, valid_thresh_ratio);
 
 /* SM_INFO ATTR */
 SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
@@ -1121,6 +1122,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_no_gc_sleep_time),
 	ATTR_LIST(gc_no_zoned_gc_percent),
 	ATTR_LIST(gc_boost_zoned_gc_percent),
+	ATTR_LIST(gc_valid_thresh_ratio),
 	ATTR_LIST(gc_idle),
 	ATTR_LIST(gc_urgent),
 	ATTR_LIST(reclaim_segments),
-- 
2.46.0.469.g59c65b2a67-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
