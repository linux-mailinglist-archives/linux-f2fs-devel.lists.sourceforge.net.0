Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 879594DA938
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Mar 2022 05:14:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nUL3f-0000TA-Ii; Wed, 16 Mar 2022 04:14:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daeho43@gmail.com>) id 1nUL3R-0000Sy-KM
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Mar 2022 04:14:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dzuWL6o0DF3V9st4MUXpcR2KC82QXxZwMyLTf+Y/vP8=; b=mTzY2i2LUsyE56ybWkF92xUqjs
 UtETnah0hP2czx1NGxfd3ds3HWkjMM8NrMGSbqCQ7ShCHPW/busuATiqdgpjl5Ube/Haqa46NtzCR
 cJ0P/3FjE9iaaqSHGVxYPFwcBhhVkYeAbR1S0xZ8zXjQ7gXUtKnNvyvpZ/kbbAsQlOOY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dzuWL6o0DF3V9st4MUXpcR2KC82QXxZwMyLTf+Y/vP8=; b=f
 ECvTA9qG3UxVDBm/CWRoP68wNeNJOVR82ieTO2gYsztk3nXETIE/2cG6mFWbKKHH5KK7qaj2urRdh
 REjed9f5WK5+NPBvmgRAqAsnTEKmX3ODc48zPG50+o0tMgKKUn7CbO8oXWgClOPC75QdGjEHH2+l0
 VK8fTQx9DH7c9NUo=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nUL3K-000WeV-VE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Mar 2022 04:14:32 +0000
Received: by mail-pf1-f179.google.com with SMTP id p8so2212406pfh.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Mar 2022 21:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dzuWL6o0DF3V9st4MUXpcR2KC82QXxZwMyLTf+Y/vP8=;
 b=TtT4yaa2JYA+5X6SVpMCnKL7vaOub1+iFmV4t4Xm6gWENvYixJauFiUtgEsN1EHwDZ
 8m5wHzLfUWpicyo6jHx9Dz8jzEEj8dmVZVe4tBnvgwLeBCZJFmVWw8wroY4CopW+fPM7
 qziSdRnESmjamEWIo3EcDgE2pmO+UfFARduxG5ifA/KgEe9KaJYbeeNhUaUnKYhzk2wf
 E8zsp2sSbHc9xh0NAgwUneqH6brR39/833Xn+QlmgqQ+r39oI6Amc7+dXdqRHApaWk7j
 DeX0i5T+pcBF9wv1Iv2UDT5xaAmW0yvecVQFakAU9bGOCZze0ygEwmlbP/7+i/9CS3D7
 Qg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dzuWL6o0DF3V9st4MUXpcR2KC82QXxZwMyLTf+Y/vP8=;
 b=gKFi+Bfu9/sIlICCuBNtw6zT+fAMNSDIM2W1p7RqBSGY7Jg+vXtCI1mdhXtVGTr81y
 arW9TZxQoGEgyAD+j6GEUMdOUC3wCTuD1axHKHyfAM67UIh+hwBML4saUt7N66FT04xd
 GWfMU33cr1S+xF/yv/0UcK2YysHWKnbaExF8h6wKqIipkT7T3BFDAoezmfVNLTyTo8Bq
 tSjtBr54aybwl2yMhUPoXD7iYl4qp0dT9a8rnHDbKpIcoZMC3Tk7e57FruM32wryET+i
 tm+vWdR6OQ2vKU2IN9fLElTCv9JFxEfftbbLhEnEZJ3pLHLGoTdlWQ4PGFixP4UomXGm
 pfGg==
X-Gm-Message-State: AOAM530C1aCGeX7DiHR6bJatecRj6O/ItTu7N6+HMiZw/rBa7iRhqhs7
 ozhUHQ7LToIUx7qKSZVBCQg=
X-Google-Smtp-Source: ABdhPJySC//1oZybPrimb/CkkLprQEOaM4wYq3HIKqZow2rXa2QJbyEn2RZjEZPGaH/HKCYKNM1ERQ==
X-Received: by 2002:a63:c50:0:b0:381:5118:62d6 with SMTP id
 16-20020a630c50000000b00381511862d6mr7572791pgm.420.1647404061376; 
 Tue, 15 Mar 2022 21:14:21 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:39e:7334:dc1e:1a0a])
 by smtp.gmail.com with ESMTPSA id
 f31-20020a631f1f000000b003742e45f7d7sm784668pgf.32.2022.03.15.21.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 21:14:21 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 15 Mar 2022 21:14:14 -0700
Message-Id: <20220316041414.1738616-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.35.1.723.g4982287a31-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong We need a mid level of gc urgent mode to
 do GC forcibly in a period of given gc_urgent_sleep_time, but not like using
 greedy GC approach and switching to SSR mode such as gc urgent high mode.
 This can [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.179 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.179 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nUL3K-000WeV-VE
Subject: [f2fs-dev] [PATCH] f2fs: introduce gc_urgent_mid mode
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

We need a mid level of gc urgent mode to do GC forcibly in a period
of given gc_urgent_sleep_time, but not like using greedy GC approach
and switching to SSR mode such as gc urgent high mode. This can be
used for more aggressive periodic storage clean up.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 17 +++++++++++------
 fs/f2fs/debug.c                         |  4 +++-
 fs/f2fs/f2fs.h                          |  4 ++++
 fs/f2fs/gc.c                            |  3 +++
 fs/f2fs/sysfs.c                         |  7 +++++++
 5 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 5a5f3c5445f6..9b583dd0298b 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -297,11 +297,16 @@ Description:	Shows current reserved blocks in system, it may be temporarily
 What:		/sys/fs/f2fs/<disk>/gc_urgent
 Date:		August 2017
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
-Description:	Do background GC aggressively when set. When gc_urgent = 1,
-		background thread starts to do GC by given gc_urgent_sleep_time
-		interval. When gc_urgent = 2, F2FS will lower the bar of
-		checking idle in order to process outstanding discard commands
-		and GC a little bit aggressively. It is set to 0 by default.
+Description:	Do background GC aggressively when set. Set to 0 by default.
+		gc urgent high(1): does GC forcibly in a period of given
+		gc_urgent_sleep_time and ignores I/O idling check. uses greedy
+		GC approach and turns SSR mode on.
+		gc urgent low(2): lowers the bar of checking I/O idling in
+		order to process outstanding discard commands and GC a
+		little bit aggressively. uses cost benefit GC approach.
+		gc urgent mid(3): does GC forcibly in a period of given
+		gc_urgent_sleep_time and executes a mid level of I/O idling check.
+		uses cost benefit GC approach.
 
 What:		/sys/fs/f2fs/<disk>/gc_urgent_sleep_time
 Date:		August 2017
@@ -532,7 +537,7 @@ Date:		July 2021
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	Show how many segments have been reclaimed by GC during a specific
 		GC mode (0: GC normal, 1: GC idle CB, 2: GC idle greedy,
-		3: GC idle AT, 4: GC urgent high, 5: GC urgent low)
+		3: GC idle AT, 4: GC urgent high, 5: GC urgent low 6: GC urgent mid)
 		You can re-initialize this value to "0".
 
 What:		/sys/fs/f2fs/<disk>/gc_segment_mode
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 6d26872c7364..fcdf253cd211 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -476,12 +476,14 @@ static int stat_show(struct seq_file *s, void *v)
 				si->node_segs, si->bg_node_segs);
 		seq_printf(s, "  - Reclaimed segs : Normal (%d), Idle CB (%d), "
 				"Idle Greedy (%d), Idle AT (%d), "
-				"Urgent High (%d), Urgent Low (%d)\n",
+				"Urgent High (%d), Urgent Mid (%d), "
+				"Urgent Low (%d)\n",
 				si->sbi->gc_reclaimed_segs[GC_NORMAL],
 				si->sbi->gc_reclaimed_segs[GC_IDLE_CB],
 				si->sbi->gc_reclaimed_segs[GC_IDLE_GREEDY],
 				si->sbi->gc_reclaimed_segs[GC_IDLE_AT],
 				si->sbi->gc_reclaimed_segs[GC_URGENT_HIGH],
+				si->sbi->gc_reclaimed_segs[GC_URGENT_MID],
 				si->sbi->gc_reclaimed_segs[GC_URGENT_LOW]);
 		seq_printf(s, "Try to move %d blocks (BG: %d)\n", si->tot_blks,
 				si->bg_data_blks + si->bg_node_blks);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index da729f53daa8..3016b6354a68 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1313,6 +1313,7 @@ enum {
 	GC_IDLE_AT,
 	GC_URGENT_HIGH,
 	GC_URGENT_LOW,
+	GC_URGENT_MID,
 	MAX_GC_MODE,
 };
 
@@ -2784,6 +2785,9 @@ static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
 	if (is_inflight_io(sbi, type))
 		return false;
 
+	if (sbi->gc_mode == GC_URGENT_MID)
+		return true;
+
 	if (sbi->gc_mode == GC_URGENT_LOW &&
 			(type == DISCARD_TIME || type == GC_TIME))
 		return true;
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 2d53ef121e76..ea5b93b689cd 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -103,7 +103,10 @@ static int gc_thread_func(void *data)
 				sbi->gc_urgent_high_remaining--;
 			}
 			spin_unlock(&sbi->gc_urgent_high_lock);
+		}
 
+		if (sbi->gc_mode == GC_URGENT_HIGH ||
+				sbi->gc_mode == GC_URGENT_MID) {
 			wait_ms = gc_th->urgent_sleep_time;
 			f2fs_down_write(&sbi->gc_lock);
 			goto do_gc;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 47efcf233afd..fe29bcb70f46 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -468,6 +468,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 			}
 		} else if (t == 2) {
 			sbi->gc_mode = GC_URGENT_LOW;
+		} else if (t == 3) {
+			sbi->gc_mode = GC_URGENT_MID;
+			if (sbi->gc_thread) {
+				sbi->gc_thread->gc_wake = 1;
+				wake_up_interruptible_all(
+					&sbi->gc_thread->gc_wait_queue_head);
+			}
 		} else {
 			return -EINVAL;
 		}
-- 
2.35.1.723.g4982287a31-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
