Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDE5972537
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Sep 2024 00:20:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1snmk1-0004s5-Th;
	Mon, 09 Sep 2024 22:20:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1snmjy-0004rq-DA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 22:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cla/Hu+x6KHpSAchLiy/oR8hbHuRD9DRfoz1PxleRLw=; b=l6Gx0gZrAcj0i8U54R3a+VRMMu
 0nIo7gewC0lmR71P/XKJZZO9R2uu/Lbyp0NyqBrps0exI5LDI9nvvWCTarLw4eu0IoJNdirZ0kVJf
 7WVgordOmxlrNnwquYZ1GaHfopkPtrECj+ZFuAwNZMOff/ZvqZj5ELMD+V6A8Ki7yPis=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cla/Hu+x6KHpSAchLiy/oR8hbHuRD9DRfoz1PxleRLw=; b=P1Ue6z283wROSEqXx74SX3ed9k
 thmbJ94Djo400jI1oMnmBJv3aq49paFFsJfKC2xvYF6M3Ikgms3Uj7hRCTLwmAaOPIAmVfguE9Xd4
 WlKQ7zxVXp52pXInbO93MttDUJIFyJqQHtueYXhwwWIp7vmQFTrdMX2Is1ySY9zD2Nro=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1snmjv-0006gp-Ds for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 22:20:08 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2d88c0f8e79so3807203a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 09 Sep 2024 15:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725920397; x=1726525197; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cla/Hu+x6KHpSAchLiy/oR8hbHuRD9DRfoz1PxleRLw=;
 b=FKuRfkmpTSF/cHzdhmjs7nulSsaGvSnc7zoyKs/6YGfdMd7IWrPvrN3exzPBYsn5Q3
 Xl/P7dmAoL8G6MLzj2rKfU8bVxDIqeY988TRcP7SoPUr/SBJZoRpcnR82KSiBpByQZ9H
 /PjpsHCLBc9ez8edoNSCT+lc2gQgpL5j0esluTez/Ma25QA25N37oXtKBz5YioCuc4Dm
 X+BAKHLQlHGNw4qT0jwUbII0GfaBcUZlIP9yT6Tq7BDBKDe5mFXtFsevoXcVZzdZQ27V
 YWVNMBjUlPtCjNIpLIjLlAt2H6nrbpd99N45k15udDixydWg3z1Om44Br3vEocULSRJW
 fFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725920397; x=1726525197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cla/Hu+x6KHpSAchLiy/oR8hbHuRD9DRfoz1PxleRLw=;
 b=l3B49OvYDXbWjW8toxJ3TatyZZJ+zXSPwatLYazcx6cGtWR0W0DEKGA7aczC9++u30
 rfxDUaUnYkS0oZxfV348Y8qCt5vCu2Wx6BXA3VWuPx4Q0K+V9LW6nBxBa/jLxP1LyejZ
 +IactX53jDNaawcy2wUihPkuWr2RkcPliRblkYYrg8OETqNY9JF5pzx+rPVSlbT6uCJB
 6F6/uzd4geQtpJTNXobG8rnpjAFQ7VJMzA4lhiqCJLEHyTBTRpS+0VJxLz9TAMiLOIvB
 wqrqlmJoawdKk6AmqUoaG2UdMlBIMijL8bGNA1uHxRsURapKLno/GewYeeX9ZzQQHpN1
 c1Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ3a4ctE8TNyAqkua4d6ClW+RbN/T4vwcOnwDmVTMogsFfd3XStzjH2AhpUrEUn+39KoSKct3By4xsPzG3et5j@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwfZGwiR7dhVU0FBHdNW19QXKBIIgcawxHtM5WDS0Z9+EpkDjUo
 BrB2o+caIWOpkkb/l9RYCUUDOLIORr40bLuebTqITdvEvemAnIUjBw75Rg==
X-Google-Smtp-Source: AGHT+IGfEphEYe8iguFpalf0M6+gnZinIeoQ6xP0sK1afOnwfJgv0XG/DI5+vE4JW3HwyJDIpFiDKw==
X-Received: by 2002:a17:90b:3c43:b0:2da:5156:1253 with SMTP id
 98e67ed59e1d1-2dad50141cbmr2814276a91.21.1725920396721; 
 Mon, 09 Sep 2024 15:19:56 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:ed56:14c3:db02:6c66])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2db04988470sm5016840a91.54.2024.09.09.15.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 15:19:56 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon,  9 Sep 2024 15:19:45 -0700
Message-ID: <20240909221946.2004046-6-daeho43@gmail.com>
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
 Content preview: From: Daeho Jeong Added control knobs for
 gc_no_zoned_gc_percent
 and gc_boost_zoned_gc_percent. Signed-off-by: Daeho Jeong ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 14 ++++++++++++++ fs/f2fs/gc.c | 12 +++++++++--- fs/f2fs/gc.h | 4 ++++
 fs/f2fs/sysfs.c | 4 ++++ 4 files changed, 31 insertion [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.45 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1snmjv-0006gp-Ds
Subject: [f2fs-dev] [PATCH v2 6/7] f2fs: create gc_no_zoned_gc_percent and
 gc_boost_zoned_gc_percent
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

Added control knobs for gc_no_zoned_gc_percent and
gc_boost_zoned_gc_percent.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 14 ++++++++++++++
 fs/f2fs/gc.c                            | 12 +++++++++---
 fs/f2fs/gc.h                            |  4 ++++
 fs/f2fs/sysfs.c                         |  4 ++++
 4 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index deff703035e1..f3c533b523cd 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -777,3 +777,17 @@ Date:		September 2024
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	In order to fine tune GC behavior, we can control the number of
 		reserved segments.
+
+What:		/sys/fs/f2fs/<disk>/gc_no_zoned_gc_percent
+Date:		September 2024
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	If the percentage of free sections over total sections is above this
+		number, F2FS do not garbage collection for zoned devices through the
+		background GC thread. the default number is "60".
+
+What:		/sys/fs/f2fs/<disk>/gc_boost_zoned_gc_percent
+Date:		September 2024
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	If the percentage of free sections over total sections is under this
+		number, F2FS boosts garbage collection for zoned devices through the
+		background GC thread. the default number is "25".
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index a59fec64eccf..319b4b80ba72 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -119,7 +119,8 @@ static int gc_thread_func(void *data)
 		}
 
 		if (f2fs_sb_has_blkzoned(sbi)) {
-			if (has_enough_free_blocks(sbi, LIMIT_NO_ZONED_GC)) {
+			if (has_enough_free_blocks(sbi,
+				gc_th->no_zoned_gc_percent)) {
 				wait_ms = gc_th->no_gc_sleep_time;
 				f2fs_up_write(&sbi->gc_lock);
 				goto next;
@@ -200,10 +201,14 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 		gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME_ZONED;
 		gc_th->max_sleep_time = DEF_GC_THREAD_MAX_SLEEP_TIME_ZONED;
 		gc_th->no_gc_sleep_time = DEF_GC_THREAD_NOGC_SLEEP_TIME_ZONED;
+		gc_th->no_zoned_gc_percent = LIMIT_NO_ZONED_GC;
+		gc_th->boost_zoned_gc_percent = LIMIT_BOOST_ZONED_GC;
 	} else {
 		gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME;
 		gc_th->max_sleep_time = DEF_GC_THREAD_MAX_SLEEP_TIME;
 		gc_th->no_gc_sleep_time = DEF_GC_THREAD_NOGC_SLEEP_TIME;
+		gc_th->no_zoned_gc_percent = 0;
+		gc_th->boost_zoned_gc_percent = 0;
 	}
 
 	gc_th->gc_wake = false;
@@ -1740,8 +1745,9 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 
 			if (f2fs_sb_has_blkzoned(sbi) &&
 					!has_enough_free_blocks(sbi,
-					LIMIT_BOOST_ZONED_GC))
-				window_granularity *= BOOST_GC_MULTIPLE;
+					sbi->gc_thread->boost_zoned_gc_percent))
+				window_granularity *=
+					BOOST_GC_MULTIPLE;
 
 			end_segno = start_segno + window_granularity;
 		}
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 78abeebd68b5..c063310c8dde 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -61,6 +61,10 @@ struct f2fs_gc_kthread {
 						 * caller of f2fs_balance_fs()
 						 * will wait on this wait queue.
 						 */
+
+	/* for gc control for zoned devices */
+	unsigned int no_zoned_gc_percent;
+	unsigned int boost_zoned_gc_percent;
 };
 
 struct gc_inode_list {
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 761d1abd46a8..60693ec39a03 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -965,6 +965,8 @@ GC_THREAD_RW_ATTR(gc_urgent_sleep_time, urgent_sleep_time);
 GC_THREAD_RW_ATTR(gc_min_sleep_time, min_sleep_time);
 GC_THREAD_RW_ATTR(gc_max_sleep_time, max_sleep_time);
 GC_THREAD_RW_ATTR(gc_no_gc_sleep_time, no_gc_sleep_time);
+GC_THREAD_RW_ATTR(gc_no_zoned_gc_percent, no_zoned_gc_percent);
+GC_THREAD_RW_ATTR(gc_boost_zoned_gc_percent, boost_zoned_gc_percent);
 
 /* SM_INFO ATTR */
 SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
@@ -1123,6 +1125,8 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_min_sleep_time),
 	ATTR_LIST(gc_max_sleep_time),
 	ATTR_LIST(gc_no_gc_sleep_time),
+	ATTR_LIST(gc_no_zoned_gc_percent),
+	ATTR_LIST(gc_boost_zoned_gc_percent),
 	ATTR_LIST(gc_idle),
 	ATTR_LIST(gc_urgent),
 	ATTR_LIST(reclaim_segments),
-- 
2.46.0.598.g6f2099f65c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
