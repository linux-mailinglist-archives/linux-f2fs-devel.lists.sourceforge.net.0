Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAA3848B1F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  4 Feb 2024 05:59:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rWUar-00053S-3S;
	Sun, 04 Feb 2024 04:59:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinbaoliu365@gmail.com>) id 1rWUaq-00053K-8p
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 04:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mo/Nvkvck63sS/B8DyIx8YcYLkXno8x34rYe0N1lpLU=; b=XNIDLz54KOxDs86CMdCzje0Te6
 fowsiZY5UH4rbPhq4g7bH4EnRAcu6dTJYE8TJAdHJyek4f/qmou5IYgyUl7FkZi24C7zfenWKqDSo
 GsBOaBgWMzoDF5FCuOIeC8zrck0FMzwOzq7BFVESNg4al8UAIGyZRBR3L2nED589YGS0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mo/Nvkvck63sS/B8DyIx8YcYLkXno8x34rYe0N1lpLU=; b=F
 6gia2QsWDhdIH3c17Q7pLLttld7+L/dPcw3ZAid8FOGSjeixOSXjudMFJ0oZ65UY33jaOfTRIufwn
 pwWaH0E2DK3uIw+41jvb1x2dCQe+GGCN0NqWXb/fEeQukS66ouKst8uG/ozPf+HGmZ7+26Ki/WICK
 JVy2aAwctniFD4AQ=;
Received: from mail-yw1-f178.google.com ([209.85.128.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rWUao-0002tq-3p for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 04:59:00 +0000
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-60442a4132fso3785297b3.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 03 Feb 2024 20:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707022733; x=1707627533; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mo/Nvkvck63sS/B8DyIx8YcYLkXno8x34rYe0N1lpLU=;
 b=MMIlFKNZxEMUiu5/gRgskQg0aRBPdRqKCFzyw/X3sBgzS6OLrmPxQJGqKZDso36HIS
 kLkhIqzPPiVTtKQ41zPpXTZ1PkDnnJBibeaDTedjbYxXy9UkoKkvM6tRoQ5cePWQSZde
 avZTtdRhVyBKmCGR1WcuZF5P7clf/IDnF9tifKck8b4zqN2mQbIMleQIsmA5v8ymL0wc
 k9Cb0iLqNKyhzo0DLaj46avGbtX1WViw6C+xkGEJMPMIiPq5IcF0jJ7AOInuH3Us+67m
 7whUJrLePk1Kzc951Fofl5fcoswCR5DZkv36D2bcrxwl106njVECwGc2GVDuqie3y/EF
 Uuuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707022733; x=1707627533;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mo/Nvkvck63sS/B8DyIx8YcYLkXno8x34rYe0N1lpLU=;
 b=djdDt/cFrdhg0eLFME5hq/nnHAL57CihJEU/6LznRwiUryzt9inQHAXcranBcyGLKr
 5APuwam5WSzJKA1erls4Bq3GCui+MlXU6VSGhyEROFHq1N/3wxisqRwo8SzrxkNIzFhT
 UOyB0oegpdD2yQNVEM5ZT8PnH0IAZGQU2givN1CAWdY+E8u8zluy1eBLNtMK8an+WVnt
 uBlqdHQ1SelcHCWv9NM6EDtQLfU+Lh9MNtX8wuysbVpkERnV4dxxeoW7KF7O49y5VAfS
 +EaH30ogcN1Bbz9LEtPwn8rC87KY/qbhh0Lys61PjP45GAoxdaNd1MqyspFtRe//B9rk
 zplQ==
X-Gm-Message-State: AOJu0YwSlr4jiVjOzL1Iywvid5UoH5khOY3zwKfcCuTAxWRzMHIANV2+
 q8f3JF14kaPJEeQyXeb0dQyaSTp8V/FXG++ofQ+q/sfEOnuzFPb6
X-Google-Smtp-Source: AGHT+IFuetYBGJyMd3YNFLcBo+suzwrrIJOPdNk/k9KEhWeAmX0KXY9j7kSgb93k/x7toWrQBQdLuQ==
X-Received: by 2002:a81:91c6:0:b0:604:559:7a12 with SMTP id
 i189-20020a8191c6000000b0060405597a12mr1746184ywg.26.1707022732701; 
 Sat, 03 Feb 2024 20:58:52 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXGgjuZhVgsbToD4KtT9zQh+84oUNmAIpNXk04oHKKPDuMG+uwkyc/GgXKXrLqJ35QbH+Xw1Egj1Fm39v7YjWfBk6E7Sq2yvPq9FuRoiGoay6P8xR6AYDljvdVrnRQ4j8cigA1R3pISB6YRCTI4DMODNrBAQw==
Received: from mi.mioffice.cn ([2408:8607:1b00:8:8eec:4bff:fe94:a95d])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a0ddb04000000b006041ca620f4sm1296112ywe.81.2024.02.03.20.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 20:58:52 -0800 (PST)
From: liujinbao1 <jinbaoliu365@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun,  4 Feb 2024 12:58:43 +0800
Message-ID: <3b2852b3d404ecbb53d9affa781d12d0e9ea3951.1707022643.git.liujinbao1@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: liujinbao1 Currently,
 IO can only be ignored when GC_URGENT_HIGH
 is set, and the default algorithm used for GC_URGENT_HIGH is greedy. It gives
 a way to enable/disable IO aware feature for background gc, so that [...]
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jinbaoliu365[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [jinbaoliu365[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.178 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.178 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rWUao-0002tq-3p
Subject: [f2fs-dev] [PATCH v3] f2fs: sysfs: support gc_io_aware
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
Cc: liujinbao1 <liujinbao1@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: liujinbao1 <liujinbao1@xiaomi.com>

Currently, IO can only be ignored when GC_URGENT_HIGH is set,
and the default algorithm used for GC_URGENT_HIGH is greedy.
It gives a way to enable/disable IO aware feature for background
gc, so that we can tune background gc more precisely. e.g.
force to disable IO aware and choose more suitable algorithm
if there are large number of dirty segments.

Signed-off-by: liujinbao1 <liujinbao1@xiaomi.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++
 fs/f2fs/gc.c                            | 3 ++-
 fs/f2fs/gc.h                            | 1 +
 fs/f2fs/sysfs.c                         | 9 +++++++++
 4 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 36c3cb547901..47f02fa471fe 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -16,6 +16,12 @@ Contact:	"Namjae Jeon" <namjae.jeon@samsung.com>
 Description:	Controls the default sleep time for gc_thread. Time
 		is in milliseconds.
 
+What:		/sys/fs/f2fs/<disk>/gc_io_aware
+Date:		January 2024
+Contact:	"Jinbao Liu" <liujinbao1@xiaomi.com>
+Description:	It controls to enable/disable IO aware feature for background gc.
++		By default, the value is 1 which indicates IO aware is on.
+
 What:		/sys/fs/f2fs/<disk>/gc_idle
 Date:		July 2013
 Contact:	"Namjae Jeon" <namjae.jeon@samsung.com>
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 309da3d0faff..0b75d37acc63 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -109,7 +109,7 @@ static int gc_thread_func(void *data)
 			goto next;
 		}
 
-		if (!is_idle(sbi, GC_TIME)) {
+		if (gc_th->io_aware && !is_idle(sbi, GC_TIME)) {
 			increase_sleep_time(gc_th, &wait_ms);
 			f2fs_up_write(&sbi->gc_lock);
 			stat_io_skip_bggc_count(sbi);
@@ -182,6 +182,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 	gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME;
 	gc_th->max_sleep_time = DEF_GC_THREAD_MAX_SLEEP_TIME;
 	gc_th->no_gc_sleep_time = DEF_GC_THREAD_NOGC_SLEEP_TIME;
+	gc_th->io_aware = true;
 
 	gc_th->gc_wake = false;
 
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 28a00942802c..51d6ad26b76a 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -41,6 +41,7 @@ struct f2fs_gc_kthread {
 	unsigned int min_sleep_time;
 	unsigned int max_sleep_time;
 	unsigned int no_gc_sleep_time;
+	bool io_aware;
 
 	/* for changing gc mode */
 	bool gc_wake;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 417fae96890f..e8d5667cfddd 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -516,6 +516,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "gc_io_aware")) {
+		if (t > 1)
+			return -EINVAL;
+		*ui = t ? true : false;
+		return count;
+	}
+
 	if (!strcmp(a->attr.name, "migration_granularity")) {
 		if (t == 0 || t > sbi->segs_per_sec)
 			return -EINVAL;
@@ -906,6 +913,7 @@ GC_THREAD_RW_ATTR(gc_urgent_sleep_time, urgent_sleep_time);
 GC_THREAD_RW_ATTR(gc_min_sleep_time, min_sleep_time);
 GC_THREAD_RW_ATTR(gc_max_sleep_time, max_sleep_time);
 GC_THREAD_RW_ATTR(gc_no_gc_sleep_time, no_gc_sleep_time);
+GC_THREAD_RW_ATTR(gc_io_aware, io_aware);
 
 /* SM_INFO ATTR */
 SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
@@ -1061,6 +1069,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_min_sleep_time),
 	ATTR_LIST(gc_max_sleep_time),
 	ATTR_LIST(gc_no_gc_sleep_time),
+	ATTR_LIST(gc_io_aware),
 	ATTR_LIST(gc_idle),
 	ATTR_LIST(gc_urgent),
 	ATTR_LIST(reclaim_segments),
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
