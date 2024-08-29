Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C1E96525E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Aug 2024 23:53:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sjn4a-0002nG-Q1;
	Thu, 29 Aug 2024 21:52:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1sjn4Z-0002n4-0e
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Aug 2024 21:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Edfu7fbFGAzqD2XrSR1tHmTZAuikCACk3QwSTIyslvw=; b=lqcA0IJwIb5OBzcyEO/2CvQRej
 9HopMyijA65HBPiR6ILV0dP3yu2ZVBVRk703oiKuvbazq0PViLiT6a2WHh5opDP4hLVOv5gbm0LAz
 XGiZmnTWkBy+QSiSR9BsU2GLdR2gG0ox8TxN79MLNK2OCLGdMzAEA/zqkGvI6xmWOBz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Edfu7fbFGAzqD2XrSR1tHmTZAuikCACk3QwSTIyslvw=; b=T
 v/DmDs9rHOe9OPfNAtY6XfK/dFAAknUM1BEyT7koMwc96gcD3/HFJ8kaqwbCJGM59L8PGu/NxVXUK
 YDXOFaTjWHOmMaG65uUHolNYcV/2cTACP3gDJilPLjUn/M/mQCDZLna2pT0TkCcM6ZQrsVjnGTbYd
 tnuXbTKJFldt1bBs=;
Received: from mail-io1-f41.google.com ([209.85.166.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sjn4Y-0007bF-4Z for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Aug 2024 21:52:54 +0000
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-829f5e9d8e9so49129339f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Aug 2024 14:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724968368; x=1725573168; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Edfu7fbFGAzqD2XrSR1tHmTZAuikCACk3QwSTIyslvw=;
 b=POR8JFRIkDm0sUTPonmnkE3LtdCUlxRCZAcC6SWQfNoQ75KwiGO5HIkrI9ClYGx0js
 OlvCpq5+s91GM9wxiqejgFfWf75/pXDJ9e9moRujS5yPr9crWyeMhXtVGlcdD9T6Zm8c
 oFH8BGc58HYN9wD1ptwHqQEaZzGJJdnPZB/qvSy/E2hVscZ20djOKf38IycyRwnfwEsA
 2V8fhcT0lXJL74VvbANeJPd/rgfzqQrL9c+CNXay93bg9DqslyWLgxr4TZ38vGDlgjmF
 eVA0fHdZJMsJeJox21ydKngLPVgoE2QKbgB2EPgDBgvT5FS5bJLdihWOdNdy1pn8l3go
 JepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724968368; x=1725573168;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Edfu7fbFGAzqD2XrSR1tHmTZAuikCACk3QwSTIyslvw=;
 b=k8dDr9MjiSeeHZdXcoVrG98mbxCpUGuIUwl538m66oJL/eJofJ4fuSgcBn9lrOuKBL
 gqt+BXUIs6xqpUUV1sCoinyB9U0ANXOC2nGyHWRhrNQ79wJo9BV1zdTqx5sHJWKCcRdg
 1TOt8HV8m85P5M2oyaCCktF8Khdvv3XaDE+1auQijYZX04dsOHRnSixuV8FRbPEwJKTe
 Lyb/ZwVuaUlOslCCV6FD5RLNHVd+WvFVBmXkAPOWf6c1qdb40m2JVILW/f2RlnsBVFmJ
 DNeLA8XJ4XlHuipKNWhIJoBhNLmnoFmZzIP146zi6xJfOg47Ifo3zwpJFmMEbSHOkxR1
 WG+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH1ZseguIobE1sU0oa0XucMK4ITrBXB8xHhZVdj1ydCG2HX92oWDcsW1+gJG3IYeMVua1VcZEvakQzcLGwfi8R@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzDYGYpbkmD17qO7I9DRLhIb08uo0jiHDX66++bqpaXxBxDg9aW
 Lzx0m2OExzNHe65y7dK9nVQtfiXr4OZ463CzSLniK1z72o9gUzEN
X-Google-Smtp-Source: AGHT+IGTeTrFmeuCfOKUgfFM1WfBAV57WVShkDHfKq+CbbCKAShvP/Vh5nyJgX1QFkU9XX2U3VIuWw==
X-Received: by 2002:a05:6e02:1547:b0:39d:637f:97bc with SMTP id
 e9e14a558f8ab-39f377138c6mr49358335ab.0.1724968368209; 
 Thu, 29 Aug 2024 14:52:48 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:a1e7:73eb:e77e:3e2b])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d512asm1705653a12.78.2024.08.29.14.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 14:52:47 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 29 Aug 2024 14:52:36 -0700
Message-ID: <20240829215242.3641502-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
MIME-Version: 1.0
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Since we don't have any GC on device side
 for zoned devices, need more aggressive BG GC. So, tune the parameters for
 that. Signed-off-by: Daeho Jeong --- fs/f2fs/f2fs.h | 20 ++++++++++++++++++--
 fs/f2fs/gc.c | 25 +++++++++++++++++++++---- fs/f2fs/gc.h | 22
 ++++++++++++++++++++++
 fs/f2fs/super.c | 8 +++++++- 4 files chan [...] 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.166.41 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.41 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.41 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.41 listed in wl.mailspike.net]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sjn4Y-0007bF-4Z
Subject: [f2fs-dev] [PATCH 1/7] f2fs: make BG GC more aggressive for zoned
 devices
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

Since we don't have any GC on device side for zoned devices, need more
aggressive BG GC. So, tune the parameters for that.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/f2fs.h  | 20 ++++++++++++++++++--
 fs/f2fs/gc.c    | 25 +++++++++++++++++++++----
 fs/f2fs/gc.h    | 22 ++++++++++++++++++++++
 fs/f2fs/super.c |  8 +++++++-
 4 files changed, 68 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ac19c61f0c3e..5e4db3ba534a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2854,13 +2854,26 @@ static inline bool is_inflight_io(struct f2fs_sb_info *sbi, int type)
 	return false;
 }
 
+static inline bool is_inflight_read_io(struct f2fs_sb_info *sbi)
+{
+	return get_pages(sbi, F2FS_RD_DATA) || get_pages(sbi, F2FS_DIO_READ);
+}
+
 static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
 {
+	bool zoned_gc = (type == GC_TIME &&
+			F2FS_HAS_FEATURE(sbi, F2FS_FEATURE_BLKZONED));
+
 	if (sbi->gc_mode == GC_URGENT_HIGH)
 		return true;
 
-	if (is_inflight_io(sbi, type))
-		return false;
+	if (zoned_gc) {
+		if (is_inflight_read_io(sbi))
+			return false;
+	} else {
+		if (is_inflight_io(sbi, type))
+			return false;
+	}
 
 	if (sbi->gc_mode == GC_URGENT_MID)
 		return true;
@@ -2869,6 +2882,9 @@ static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
 			(type == DISCARD_TIME || type == GC_TIME))
 		return true;
 
+	if (zoned_gc)
+		return true;
+
 	return f2fs_time_over(sbi, type);
 }
 
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 724bbcb447d3..46e3bc26b78a 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -116,7 +116,17 @@ static int gc_thread_func(void *data)
 			goto next;
 		}
 
-		if (has_enough_invalid_blocks(sbi))
+		if (f2fs_sb_has_blkzoned(sbi)) {
+			if (has_enough_free_blocks(sbi, LIMIT_NO_ZONED_GC)) {
+				wait_ms = gc_th->no_gc_sleep_time;
+				f2fs_up_write(&sbi->gc_lock);
+				goto next;
+			}
+			if (wait_ms == gc_th->no_gc_sleep_time)
+				wait_ms = gc_th->max_sleep_time;
+		}
+
+		if (need_to_boost_gc(sbi))
 			decrease_sleep_time(gc_th, &wait_ms);
 		else
 			increase_sleep_time(gc_th, &wait_ms);
@@ -179,9 +189,16 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 		return -ENOMEM;
 
 	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
-	gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME;
-	gc_th->max_sleep_time = DEF_GC_THREAD_MAX_SLEEP_TIME;
-	gc_th->no_gc_sleep_time = DEF_GC_THREAD_NOGC_SLEEP_TIME;
+
+	if (f2fs_sb_has_blkzoned(sbi)) {
+		gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME_ZONED;
+		gc_th->max_sleep_time = DEF_GC_THREAD_MAX_SLEEP_TIME_ZONED;
+		gc_th->no_gc_sleep_time = DEF_GC_THREAD_NOGC_SLEEP_TIME_ZONED;
+	} else {
+		gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME;
+		gc_th->max_sleep_time = DEF_GC_THREAD_MAX_SLEEP_TIME;
+		gc_th->no_gc_sleep_time = DEF_GC_THREAD_NOGC_SLEEP_TIME;
+	}
 
 	gc_th->gc_wake = false;
 
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index a8ea3301b815..14ae85f33235 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -15,6 +15,11 @@
 #define DEF_GC_THREAD_MAX_SLEEP_TIME	60000
 #define DEF_GC_THREAD_NOGC_SLEEP_TIME	300000	/* wait 5 min */
 
+/* GC sleep parameters for zoned deivces */
+#define DEF_GC_THREAD_MIN_SLEEP_TIME_ZONED	10
+#define DEF_GC_THREAD_MAX_SLEEP_TIME_ZONED	20
+#define DEF_GC_THREAD_NOGC_SLEEP_TIME_ZONED	60000
+
 /* choose candidates from sections which has age of more than 7 days */
 #define DEF_GC_THREAD_AGE_THRESHOLD		(60 * 60 * 24 * 7)
 #define DEF_GC_THREAD_CANDIDATE_RATIO		20	/* select 20% oldest sections as candidates */
@@ -25,6 +30,10 @@
 #define LIMIT_INVALID_BLOCK	40 /* percentage over total user space */
 #define LIMIT_FREE_BLOCK	40 /* percentage over invalid + free space */
 
+#define LIMIT_NO_ZONED_GC	60 /* percentage over total user space of no gc for zoned devices */
+#define LIMIT_BOOST_ZONED_GC	25 /* percentage over total user space of boosted gc for zoned devices */
+#define DEF_MIGRATION_GRANULARITY_ZONED	3
+
 #define DEF_GC_FAILED_PINNED_FILES	2048
 #define MAX_GC_FAILED_PINNED_FILES	USHRT_MAX
 
@@ -152,6 +161,12 @@ static inline void decrease_sleep_time(struct f2fs_gc_kthread *gc_th,
 		*wait -= min_time;
 }
 
+static inline bool has_enough_free_blocks(struct f2fs_sb_info *sbi,
+						unsigned int limit_perc)
+{
+	return free_sections(sbi) > ((sbi->total_sections * limit_perc) / 100);
+}
+
 static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
 {
 	block_t user_block_count = sbi->user_block_count;
@@ -167,3 +182,10 @@ static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
 		free_user_blocks(sbi) <
 			limit_free_user_blocks(invalid_user_blocks));
 }
+
+static inline bool need_to_boost_gc(struct f2fs_sb_info *sbi)
+{
+	if (f2fs_sb_has_blkzoned(sbi))
+		return !has_enough_free_blocks(sbi, LIMIT_BOOST_ZONED_GC);
+	return has_enough_invalid_blocks(sbi);
+}
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3959fd137cc9..790ec9d030c9 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -707,6 +707,11 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			if (!strcmp(name, "on")) {
 				F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_ON;
 			} else if (!strcmp(name, "off")) {
+				if (f2fs_sb_has_blkzoned(sbi)) {
+					f2fs_warn(sbi, "zoned devices need bggc");
+					kfree(name);
+					return -EINVAL;
+				}
 				F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_OFF;
 			} else if (!strcmp(name, "sync")) {
 				F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_SYNC;
@@ -3785,7 +3790,8 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
 	sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
 	sbi->max_victim_search = DEF_MAX_VICTIM_SEARCH;
-	sbi->migration_granularity = SEGS_PER_SEC(sbi);
+	sbi->migration_granularity = f2fs_sb_has_blkzoned(sbi) ?
+		DEF_MIGRATION_GRANULARITY_ZONED : SEGS_PER_SEC(sbi);
 	sbi->seq_file_ra_mul = MIN_RA_MUL;
 	sbi->max_fragment_chunk = DEF_FRAGMENT_SIZE;
 	sbi->max_fragment_hole = DEF_FRAGMENT_SIZE;
-- 
2.46.0.469.g59c65b2a67-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
