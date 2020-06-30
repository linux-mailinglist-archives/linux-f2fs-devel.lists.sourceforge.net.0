Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BCF20EA83
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2020 02:54:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jq4Xn-0007a6-Me; Tue, 30 Jun 2020 00:54:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jq4Xm-0007Zz-GD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 00:54:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qn+JYw7MzIW7p30jGOxBn9FjAhsmd8T2y4IWlCIJmKI=; b=cgOrPrnzB2Yulxf15OFMD04lRT
 zrINRaEz/LlKC3f9vHnKi6oZwlmJDwPxFT9iNOYpFLR3Z2ZgCzEcMTwv9IUEq5S0e2G5j5bmgYueG
 FjqB+o0lPZI5habltE9UK3NU+Of37zL7cILdsz+vZwSaLiToygsskUXTzjbAXgwmljcU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qn+JYw7MzIW7p30jGOxBn9FjAhsmd8T2y4IWlCIJmKI=; b=Z
 xRyzmNtBxMQr7tKorGGaOYsZ4GehG4j51omIH12zol9mp+Ybbz/0wMWwP7cJycxqgtZya3FSHhQy5
 S2L90nvR1uKmW9t9WQ4dPOOrDIUlyzgHHIWlt1wAL1HrS9dNoGsYJ1FEu2zaZQo87ItlzZoSiOdoZ
 S/qvZZP4m1E51aRQ=;
Received: from mail-pj1-f68.google.com ([209.85.216.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jq4Xk-006k55-9y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 00:54:38 +0000
Received: by mail-pj1-f68.google.com with SMTP id f6so4692144pjq.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Jun 2020 17:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qn+JYw7MzIW7p30jGOxBn9FjAhsmd8T2y4IWlCIJmKI=;
 b=OrIiFLvIOki/nBjcmaYD1K7/Y+hLTrMtf/0txXfs8nKOnSDbkrosUSsD3JMqKvftS5
 06cqYGs1LMGyycDS8k9pEr1KFVkyvYRnZS8c3w4CyiAs5SHWc87lVR8b+Gzt4g+/E48H
 rxLAEhKmloIsW89TLcluxoibK6QPWZR4Z0YHdd+aAwj3QGzeGDKO0Vs9uvu2aFyD6vEn
 cgYvqEPEGMgQLPxJUyrwxV6/LnfVoamjW1nWAv+7RjJpdJzYrQXIp5WeKCDwY341hSHL
 2OVJHmZmHO3sYaTb10kIKXGh0xCduyHR0UUd+1IAgGMFvrXV4Ln7jrbIJOeTZ+umk/N4
 ov0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qn+JYw7MzIW7p30jGOxBn9FjAhsmd8T2y4IWlCIJmKI=;
 b=bPf+VP739VVT3c9aFnyc8t8I65wqXAI4rBlaEHD8mtueGqaTnhLkTANY1Pu5AxDRog
 B3Xvalu/2z1LqgV7k2962lXR4xq4/T26K1ll7dKy9qn8tWfb4p/9OMgwW2VQV4S+j5Hf
 FQMyrX+WaTDTeDs18hGlJ3YkgQJSRvokbqsUyL5z1WUUe69/Q4/d+1Kzzh3s5XnHkjk3
 HAonsmf7p2LdTjb+1MrwBhdESkdHSiv4L/Bv4zZaVgbpkIzJhEXhIMAJEsTh2K4OYVkH
 jokoeSNT397EiVnLM4agbMN5N7PvC5IYASzC4uBRTJuMHGz9OCpRjbumKew8t+yjnBgE
 BnUg==
X-Gm-Message-State: AOAM533BjhoSLYLpy2tOlsZQ20K+7JRvEFS3WW+gkjgs6nNcxtAB6Qrk
 l5FDb+soCrJWJHqeiQu/Frg=
X-Google-Smtp-Source: ABdhPJxSgTx4yiCTsx6/ywRF40riPgxOaU2YGxZlYSUa1qLxPELnaGPLDYGXMJBBED/lxEmqUXgobQ==
X-Received: by 2002:a17:902:7088:: with SMTP id
 z8mr15831497plk.320.1593478470617; 
 Mon, 29 Jun 2020 17:54:30 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:b8f4:bbde:37ba:20bd])
 by smtp.gmail.com with ESMTPSA id r7sm809565pgu.51.2020.06.29.17.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 17:54:29 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 30 Jun 2020 09:54:22 +0900
Message-Id: <20200630005422.2389686-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.68 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.68 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jq4Xk-006k55-9y
Subject: [f2fs-dev] [PATCH] f2fs: add GC_URGENT_LOW mode in gc_urgent
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

Added a new gc_urgent mode, GC_URGENT_LOW, in which mode
F2FS will lower the bar of checking idle in order to
process outstanding discard commands and GC a little bit
aggressively.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  4 +++-
 fs/f2fs/f2fs.h                          | 10 ++++++++--
 fs/f2fs/gc.c                            |  6 +++---
 fs/f2fs/segment.c                       |  4 ++--
 fs/f2fs/sysfs.c                         |  6 ++++--
 5 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 4bb93a06d8ab..7f730c4c8df2 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -229,7 +229,9 @@ Date:		August 2017
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
 Description:	Do background GC agressively when set. When gc_urgent = 1,
 		background thread starts to do GC by given gc_urgent_sleep_time
-		interval. It is set to 0 by default.
+		interval. When gc_urgent = 2, F2FS will lower the bar of
+		checking idle in order to process outstanding discard commands
+		and GC a little bit aggressively. It is set to 0 by default.
 
 What:		/sys/fs/f2fs/<disk>/gc_urgent_sleep_time
 Date:		August 2017
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e6e47618a357..4b28fd42fdbc 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1283,7 +1283,8 @@ enum {
 	GC_NORMAL,
 	GC_IDLE_CB,
 	GC_IDLE_GREEDY,
-	GC_URGENT,
+	GC_URGENT_HIGH,
+	GC_URGENT_LOW,
 };
 
 enum {
@@ -1540,6 +1541,7 @@ struct f2fs_sb_info {
 	unsigned int cur_victim_sec;		/* current victim section num */
 	unsigned int gc_mode;			/* current GC state */
 	unsigned int next_victim_seg[2];	/* next segment in victim section */
+
 	/* for skip statistic */
 	unsigned int atomic_files;              /* # of opened atomic file */
 	unsigned long long skipped_atomic_files[2];	/* FG_GC and BG_GC */
@@ -2480,7 +2482,7 @@ static inline void *f2fs_kmem_cache_alloc(struct kmem_cache *cachep,
 
 static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
 {
-	if (sbi->gc_mode == GC_URGENT)
+	if (sbi->gc_mode == GC_URGENT_HIGH)
 		return true;
 
 	if (get_pages(sbi, F2FS_RD_DATA) || get_pages(sbi, F2FS_RD_NODE) ||
@@ -2498,6 +2500,10 @@ static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
 			atomic_read(&SM_I(sbi)->fcc_info->queued_flush))
 		return false;
 
+	if (sbi->gc_mode == GC_URGENT_LOW &&
+			(type == DISCARD_TIME || type == GC_TIME))
+		return true;
+
 	return f2fs_time_over(sbi, type);
 }
 
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6eec3b2d606d..3b718da69910 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -82,7 +82,7 @@ static int gc_thread_func(void *data)
 		 * invalidated soon after by user update or deletion.
 		 * So, I'd like to wait some time to collect dirty segments.
 		 */
-		if (sbi->gc_mode == GC_URGENT) {
+		if (sbi->gc_mode == GC_URGENT_HIGH) {
 			wait_ms = gc_th->urgent_sleep_time;
 			down_write(&sbi->gc_lock);
 			goto do_gc;
@@ -176,7 +176,7 @@ static int select_gc_type(struct f2fs_sb_info *sbi, int gc_type)
 		gc_mode = GC_CB;
 		break;
 	case GC_IDLE_GREEDY:
-	case GC_URGENT:
+	case GC_URGENT_HIGH:
 		gc_mode = GC_GREEDY;
 		break;
 	}
@@ -211,7 +211,7 @@ static void select_policy(struct f2fs_sb_info *sbi, int gc_type,
 	 * foreground GC and urgent GC cases.
 	 */
 	if (gc_type != FG_GC &&
-			(sbi->gc_mode != GC_URGENT) &&
+			(sbi->gc_mode != GC_URGENT_HIGH) &&
 			p->max_search > sbi->max_victim_search)
 		p->max_search = sbi->max_victim_search;
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b45e473508a9..5924b3965ae4 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -174,7 +174,7 @@ bool f2fs_need_SSR(struct f2fs_sb_info *sbi)
 
 	if (f2fs_lfs_mode(sbi))
 		return false;
-	if (sbi->gc_mode == GC_URGENT)
+	if (sbi->gc_mode == GC_URGENT_HIGH)
 		return true;
 	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
 		return true;
@@ -1759,7 +1759,7 @@ static int issue_discard_thread(void *data)
 			continue;
 		}
 
-		if (sbi->gc_mode == GC_URGENT)
+		if (sbi->gc_mode == GC_URGENT_HIGH)
 			__init_discard_policy(sbi, &dpolicy, DPOLICY_FORCE, 1);
 
 		sb_start_intwrite(sbi->sb);
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index e877c59b9fdb..ab40e1f89f23 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -350,14 +350,16 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return -EINVAL;
 
 	if (!strcmp(a->attr.name, "gc_urgent")) {
-		if (t >= 1) {
-			sbi->gc_mode = GC_URGENT;
+		if (t == 1) {
+			sbi->gc_mode = GC_URGENT_HIGH;
 			if (sbi->gc_thread) {
 				sbi->gc_thread->gc_wake = 1;
 				wake_up_interruptible_all(
 					&sbi->gc_thread->gc_wait_queue_head);
 				wake_up_discard_thread(sbi, true);
 			}
+		} else if (t == 2) {
+			sbi->gc_mode = GC_URGENT_LOW;
 		} else {
 			sbi->gc_mode = GC_NORMAL;
 		}
-- 
2.27.0.212.ge8ba1cc988-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
