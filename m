Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 010BD842562
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jan 2024 13:51:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUnaP-0005aR-OS;
	Tue, 30 Jan 2024 12:51:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinbaoliu365@gmail.com>) id 1rUnaO-0005aL-QX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jan 2024 12:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wgKJFJ/3GGLxSM/jtfTq8LlETbTPciEFuAYV4rAipow=; b=C0e7EArj49eFm2vKRRwrM1Stz+
 FbtncgxNO71x4vIipmDV+WKe/uHUi0xauVOmLcIfyOTuLx3jViYqRrNnE7+R0PJudmzCkt7vf086N
 g838F1d6kGfKj1XWUH+XIeqGO1ynUBODkoomeRS5sB3ZEO4xvJgyiHS2PwKmTWAlaYZ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wgKJFJ/3GGLxSM/jtfTq8LlETbTPciEFuAYV4rAipow=; b=C
 AADMbib2FqynNsWB1DSxgQrD/Xw6SzioXYYKVahqsDNRI8jPGEMjndrg7po5RgIg4EOt/HyS3cDTj
 rn+izmA1vBQGqPU8zuGcdOebin8gcyxfpikJhvSd4XfyEf8U3rK8VHJBif+a/lDJh9IHxqCvRDd5X
 A7xTt8VoU0zY+fI8=;
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rUnaK-0005Af-VF for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jan 2024 12:51:32 +0000
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-3beab443a63so6613b6e.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Jan 2024 04:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706619084; x=1707223884; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wgKJFJ/3GGLxSM/jtfTq8LlETbTPciEFuAYV4rAipow=;
 b=R3NJk9eUbwr/TqIe7+MlwLXUVc0ENe64Iee4X4XROtQ4QUrHlVY5J54tkSkR5VuQBl
 p2GVYJnVRUwlgai/Rc13zKspMq7U86ScSQpA/x6WO7MlEGeFwKFPrnFvQcVPhU91T3/B
 TMfdee/0XOYkMHmAuUXieTlTNe7dSBj3xOqLArvNUWPn+Xgshce9l7m4Q5NTldLnu9fu
 kk8/muOFxUw/qvDxYNhuP9FWVEhbtVtqPhEDnZYGhX5Sfwh3LLyCY0yM6cJ8TjNs5rRr
 lrZ6fsjERltrNoP0KXICy3LY8bMWY1G8tqbqUjZXHddeHnyllWWLyaOUDSENgcjxb0Wu
 fMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706619084; x=1707223884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wgKJFJ/3GGLxSM/jtfTq8LlETbTPciEFuAYV4rAipow=;
 b=vXSqQAmUIeGsAta0c0vifLXYLknH0pxEKK2hkxMOaCjPSZ6w1ks/JL7XW/lDiig5TH
 TEFUbyCw9jZdHRZtpBzNSjZbRVVE34g2Y6oar5RZFech2q9WYFOTYIYwqaIq3ex+VA+R
 Cco5SnLxYIJZGg6SnEwn7jcpE7JyJ915Jr6lb+bPUFSe3SvDpB15oBvYUgpHxma4lRMO
 bRxIOeolKRUFwLFI3AbElaqw3nGirCWptfOf8mkQW7cawgQwCoRvSS94Bn5j0qzWfXh6
 3ICm/t8PM+XjUxhUBUoAbzy3UjzgnH/hA8I/lWzdqt8tLliBh5hbN0GzSMI/c6apl4+T
 Ul3A==
X-Gm-Message-State: AOJu0Yz+lhzDFqXIOd4WIIEsT/E1CI+X2/a704oE6ZUqw0VhuEgbRhtD
 gzeniCeGQy5gBOnTfVzV6OUz6m2Rb0fsgzSd5/982u9DhxLbIF4+H9Uwq/RopdfoEw==
X-Google-Smtp-Source: AGHT+IGNfdUcohP4BKiAK7V+W7bLsZz3PVad76EolQPKCaFm9MaSgHAVqJlH0BBBDLiis3lSHk1ieA==
X-Received: by 2002:a05:6808:128e:b0:3bd:c1b2:b1d5 with SMTP id
 a14-20020a056808128e00b003bdc1b2b1d5mr7640905oiw.46.1706619083954; 
 Tue, 30 Jan 2024 04:51:23 -0800 (PST)
Received: from mi.mioffice.cn ([2408:8607:1b00:8:8eec:4bff:fe94:a95d])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a056a00234c00b006d9b35b2602sm7606311pfj.3.2024.01.30.04.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 04:51:23 -0800 (PST)
From: liujinbao1 <jinbaoliu365@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 30 Jan 2024 20:51:13 +0800
Message-ID: <20240130125113.14081-1-jinbaoliu365@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.178 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jinbaoliu365[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [jinbaoliu365[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.178 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rUnaK-0005Af-VF
Subject: [f2fs-dev] [PATCH] UPSTREAM: f2fs: sysfs: support gc_io_aware
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
Cc: liujinbao1 <liujinbao1@xiaomi.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: liujinbao1 <liujinbao1@xiaomi.corp-partner.google.com>

Currently, IO can only be ignored when GC_URGENT_HIGH is set,
 and the default algorithm used for GC_URGENT_HIGH is greedy.
It gives a way to enable/disable IO aware feature for background
gc, so that we can tune background gc more precisely. e.g.
force to disable IO aware and choose more suitable algorithm
if there are large number of dirty segments.

Change-Id: Ic0ea1bf8fb6602f0dd88b924088f1c1b33fcd809
Signed-off-by: liujinbao1 <liujinbao1@xiaomi.corp-partner.google.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++
 fs/f2fs/f2fs.h                          | 6 ++++++
 fs/f2fs/gc.c                            | 3 ++-
 fs/f2fs/gc.h                            | 1 +
 fs/f2fs/sysfs.c                         | 9 +++++++++
 5 files changed, 24 insertions(+), 1 deletion(-)

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
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 214fdd590fdf..ebe953e7459e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -374,6 +374,12 @@ enum {
 	MAX_DPOLICY,
 };
 
+enum {
+	GC_IO_AWARE_DISABLE,	/* force to not be aware of IO */
+	GC_IO_AWARE_ENABLE,	/* force to be aware of IO */
+	GC_IO_AWARE_MAX,
+};
+
 struct discard_policy {
 	int type;			/* type of discard */
 	unsigned int min_interval;	/* used for candidates exist */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 309da3d0faff..34a1e6b35af6 100644
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
+	gc_th->io_aware = GC_IO_AWARE_ENABLE;
 
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
index 417fae96890f..95409cfc48f4 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -516,6 +516,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "gc_io_aware")) {
+		if (t >= GC_IO_AWARE_MAX)
+			return -EINVAL;
+		*ui = t;
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
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
