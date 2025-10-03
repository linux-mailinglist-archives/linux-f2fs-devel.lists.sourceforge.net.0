Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 047B5BB8566
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 04 Oct 2025 00:43:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O4fcOleyZ6/UYRMSSPq2ERbZRu7CENX+QVoHgXga11U=; b=AVWsZhtFceeugtI6+gNrJw+eIh
	c3W+sCJgAGveRDdEuoLP8p09lxI6NAiZ5bbclDVviD07N10GZUMGvuup0bt2HjEfXgdIglXYYOSu+
	OlCLdl2skhskt84BqmGBUnGG66msCQfJyfJtNCm/s+e0eGV0L2TL24IzCmtNHUpw0pho=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v4oUp-0003NB-0y;
	Fri, 03 Oct 2025 22:43:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1v4oUn-0003N4-SG
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 22:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=73KKTecuERpRf7wkrg2QBvVP1Lpgw3hCqJ3lLXULH/M=; b=LuTkoXc2tfIpjAREzKhipJax7O
 q27nP4H24JmlPOrVWRGtwBz3myc3+zyV9198neaP6D/lzSTJQ37durkVztAiliQiLJ2tQB9mkxN4D
 RY+6uffnObX0OIxNce5sJRoRv7BNy1lbLgZKrtbV6NpjRTwSZKp7lxLxjxRqv+E2qfqg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=73KKTecuERpRf7wkrg2QBvVP1Lpgw3hCqJ3lLXULH/M=; b=P
 02Tvv08+n7WYhuSIJ23p0TSQq3FMjzlLGxLAp8llfApA0npHg+dQJmokMV/dmV5dLnAYMxyIDi67K
 gbGgIHrhPvwWWx/ID5MRHkaQq5+LFcSp3E2RO3BgZ7Pptu9gBHfvhGUjC6POpWCKVzBRRSqOA7YeC
 Bm9AMidi4KD2L2Mk=;
Received: from mail-pf1-f176.google.com ([209.85.210.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v4oUn-00031K-Fi for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Oct 2025 22:43:25 +0000
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-782bfd0a977so2653018b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 03 Oct 2025 15:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759531395; x=1760136195; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=73KKTecuERpRf7wkrg2QBvVP1Lpgw3hCqJ3lLXULH/M=;
 b=VuHrxTJGRrzObaYS2LJMVblHDqiDUaeZv2khXLnICcgYahbDknYIlgQC/0YFlmjeYH
 cZFuXFxuhDbBXJJ8T2VyJHa5ZI0D26daNoIsvRBLgIa/7ziuyelBtCo5ZYK5F25UrzuC
 nQEyT90ndIZodHuYouB7TFmEp2faJ9o7tfB8M3jHzz8ccplZfcVQlX/jr5olenBmqSUc
 Kc5c0JtBSQltQtK9+iSd2jmPASxVkMbJ7pGwfj/WHE/21x4y2eaJ6v8iWcOZ1hDb3Ndm
 yWlwBtOaQ0w0wh6GwCRW8eY0J5+ZlUIzyyebv/w0xmfsxywFolO8CdGGzwUw27Ctoayq
 CCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759531395; x=1760136195;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=73KKTecuERpRf7wkrg2QBvVP1Lpgw3hCqJ3lLXULH/M=;
 b=JVwxPbBGJPTg7qtVhOQPw1ssaxDEJJzXUSW0qC0vAg/1scFp6yxFqRsuA10M31ickk
 abfddOdBt0+04C/9YwK/FHkDnanqVRuoNSgrW+ayP8lWk6qegO/RPPwhi6s2DhXz+OHL
 9DiqzasXbJqSKXNm62LOVpTbLrc4JAMvsIFEoT8JaLLaI2H5wnwmxzYW+0lMylqFARBw
 EripzHHEtWdJB+2qgkj3ExIZizMldRbbarNitOGSIOc3DQ51ve8QohWzzGNv+DGSEPgq
 SPQA5VapDcqUePUcdIIB5qAl7J4ESFmdow7o8rFnJH5Paewc0PaoSjxpXG52//loXjEK
 SsAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrqi5Pc+V5aoWAaYorG9i5wJ6N9mvZcKcBiH36DFUBDuO66xeJYvgSq8GTgqurYp5UyQKrUpoiqfRy9m1M1YSW@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzO7utPfnGUi0gc/eqmNtKhUs7HWm6DM2Pxz2PeSYUwnblm2P6U
 NiS9Mowena0wfK3M39oo8EdPom/mQfiGxVtfTYaKy31X1yqAt/eKy2j6
X-Gm-Gg: ASbGncsobna1u/Of6Y6aYKZDfsIanr4BY6SH0iJT2u++X8iw1Opo4hJ0plRBk9VgzSF
 6vBC77IVDiqVdTz8Gg6+qkkF84mk62plIOELkcfcBduSMmtfplbo7fhrVmMegCn8LC/xOvqoj6W
 sUmYZ0o5iJr/ZVt/Rd3UgsYuyw97KU3vXSwf39YKS9JsUyyfZAaK/yQGsK7XN3zjC9ASd6LmLBb
 iJtPAkom9zH87JQDAmG8BhALcGXpkj6JcDYyGenEr54pHvMh/wbxjLebUwcyn1Ys0lmz6D/Bmh9
 nbeMsbup9C5GmjTk1MeDVjOy6571XYcvO8Qd+KY7yfRaVW9xpYgP48hjmWBDpY9UlzKgDaDfyiU
 w5HTSb/gBP2R9OlrHFIcgPu5sLorGwIau9GtA3AbqCEM0Re+C8aPmlj1sOmQ7nYzdpua50DzlBJ
 8NX4mkh6wf2N7qxoPsmQP8JQNw4bLq0ULd0xw9mA==
X-Google-Smtp-Source: AGHT+IFmF2n3ezMcatiaTUf9JdwILebZU5INC9IlerHtVCGrAHjw4LULFQFl5t+XHfNHPX1/3SYHtQ==
X-Received: by 2002:a05:6a21:e083:b0:303:8207:eb5d with SMTP id
 adf61e73a8af0-32b61fb1607mr5806361637.27.1759531394647; 
 Fri, 03 Oct 2025 15:43:14 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e7c:8:5098:8942:78be:db30])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b0206e6ccsm5861307b3a.63.2025.10.03.15.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:43:14 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  3 Oct 2025 15:43:08 -0700
Message-ID: <20251003224308.1948874-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong The current version missed setting one time
 GC for normal zoned GC cycle. So, valid threshold control is not working.
 Need to fix it to prevent excessive GC for zoned devices. Fixes: e791d00bd06c
 ("f2fs: add valid block ratio not to do excessive GC for one time GC")
 Signed-off-by:
 Daeho Jeong --- fs/f2fs/gc.c | 17 ++++++++++------- 1 file changed,
 10 insertions(+), 7 dele [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.176 listed in wl.mailspike.net]
X-Headers-End: 1v4oUn-00031K-Fi
Subject: [f2fs-dev] [PATCH] f2fs: maintain one time GC mode is enabled
 during whole zoned GC cycle
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

The current version missed setting one time GC for normal zoned GC
cycle. So, valid threshold control is not working. Need to fix it to
prevent excessive GC for zoned devices.

Fixes: e791d00bd06c ("f2fs: add valid block ratio not to do excessive GC for one time GC")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/gc.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 098e9f71421e..88bbcf291034 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -38,13 +38,14 @@ static int gc_thread_func(void *data)
 	struct f2fs_gc_control gc_control = {
 		.victim_segno = NULL_SEGNO,
 		.should_migrate_blocks = false,
-		.err_gc_skipped = false };
+		.err_gc_skipped = false,
+		.one_time = false };
 
 	wait_ms = gc_th->min_sleep_time;
 
 	set_freezable();
 	do {
-		bool sync_mode, foreground = false;
+		bool sync_mode, foreground = false, gc_boost = false;
 
 		wait_event_freezable_timeout(*wq,
 				kthread_should_stop() ||
@@ -52,8 +53,12 @@ static int gc_thread_func(void *data)
 				gc_th->gc_wake,
 				msecs_to_jiffies(wait_ms));
 
-		if (test_opt(sbi, GC_MERGE) && waitqueue_active(fggc_wq))
+		if (test_opt(sbi, GC_MERGE) && waitqueue_active(fggc_wq)) {
 			foreground = true;
+			gc_control.one_time = false;
+		} else if (f2fs_sb_has_blkzoned(sbi)) {
+			gc_control.one_time = true;
+		}
 
 		/* give it a try one time */
 		if (gc_th->gc_wake)
@@ -81,8 +86,6 @@ static int gc_thread_func(void *data)
 			continue;
 		}
 
-		gc_control.one_time = false;
-
 		/*
 		 * [GC triggering condition]
 		 * 0. GC is not conducted currently.
@@ -132,7 +135,7 @@ static int gc_thread_func(void *data)
 		if (need_to_boost_gc(sbi)) {
 			decrease_sleep_time(gc_th, &wait_ms);
 			if (f2fs_sb_has_blkzoned(sbi))
-				gc_control.one_time = true;
+				gc_boost = true;
 		} else {
 			increase_sleep_time(gc_th, &wait_ms);
 		}
@@ -141,7 +144,7 @@ static int gc_thread_func(void *data)
 					FOREGROUND : BACKGROUND);
 
 		sync_mode = (F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC) ||
-			(gc_control.one_time && gc_th->boost_gc_greedy);
+			(gc_boost && gc_th->boost_gc_greedy);
 
 		/* foreground GC was been triggered via f2fs_balance_fs() */
 		if (foreground && !f2fs_sb_has_blkzoned(sbi))
-- 
2.51.0.618.g983fd99d29-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
