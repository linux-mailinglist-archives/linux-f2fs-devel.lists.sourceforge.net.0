Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EAAB0ABC0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Jul 2025 23:50:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8RjMQKEtevp9U2MExovyyakZsWPxMu8S7JEBQdBGPoI=; b=kr/swma39GxOi+ELNB6sq0ZOEL
	/x83f0Jrn9/XSbOtl7kUhVyJ319H+B/85J35omj7Jq94XQzVQ/Fpla9Bc2qwE9aXBi7vAsViVTW9o
	FMQOltd4eVeLIVJzjp3iC1pL4n3fV76ZHKEw/4IO6wfBlV4lGCEYS5KQl/2hN0Q33qbs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ucsy7-0008SC-90;
	Fri, 18 Jul 2025 21:50:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1ucsy6-0008S5-FW
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Jul 2025 21:50:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vkMUMoA1UivzBLhqZ+bzZIQ12HlKF5zuA3g0fn0IJSg=; b=QoGTCqkl3Wnd1SS7Uwf8/QQVlx
 7fWztPiIr15UUrhTFMzXjU8Wm0nryCDuJLlNv6cgjB/DBkLrlDMV0jMfvgWXP49xOVSVMKKHJGZDi
 dlaOW/mh2jHbqfpUdj2A1ocuNKpvO/voNhNGlk3FeCxn9bbMNyyuo2OSmCJOsZXoFFts=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vkMUMoA1UivzBLhqZ+bzZIQ12HlKF5zuA3g0fn0IJSg=; b=d
 xlNB4Yui2fd6sQMbqd/lwQwNdibtO+4AZZEtKophMmqk0YOcrAcT6VYLx9CkBe9lT3b/aQWLxteVu
 QpRAl3uGmTGDRnHZV1Ucq9a8+s1zcBLKZmFlMpNtZi7wLBC7dkXMFqZojBTxlgi1lDCkHrcLhjS+f
 rKxX+M0/qKcIpoN0=;
Received: from mail-pl1-f170.google.com ([209.85.214.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ucsy6-0006S1-3C for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Jul 2025 21:50:14 +0000
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-23649faf69fso22921855ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 18 Jul 2025 14:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752875408; x=1753480208; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vkMUMoA1UivzBLhqZ+bzZIQ12HlKF5zuA3g0fn0IJSg=;
 b=UzEReV9soKC7tY5wGMpcX+K17y2sAXCFVLMYykdpfPJ/vgny7XFjvbkVJI9gO0Y0HG
 ip4cHZUmVtaW0JpK2mS3m19TVSax8kafexETI+9uwFw+U/rUJJ3L/xxULkZx5Ri1ETiH
 5TTnv6e2gg4i4rWu/7/H34Gb1qhwtfb3tZDb+Kbtg1voq9nm/dimP8RA9oc1bSWnvlmv
 ipBczIyONq9WSlhyLBVTzgYOk0iORAsdsBGtOhnHmIl2Qpudpg5Zv9btz5SJ3c31AACP
 iHTNZeMC7gRZOlCfJnVpYY8jLMSAbH6xsJHv0KlRfF6o02N0cZWgKcGrWqa5vxrHxxG/
 5miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752875408; x=1753480208;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vkMUMoA1UivzBLhqZ+bzZIQ12HlKF5zuA3g0fn0IJSg=;
 b=hMWrddwbEvM88dLnNRwV45sB1AhGTw9pYaDZ12/DbRTdiN1Mx1mG1y20uNMYXgMPKu
 pJSYks8TZSVvWxK4zwHtxwl29HzbyT+QxsIpb1yVYHVr/PKGdnxdkNymeDrW3G/7F22B
 IIEEtEGTs65aQMlUV5R5cdFIH7/JzZhpMU6k5nl1yPEe3Eh9o8fzM+UJbOkesE+yzvED
 WvXj+iNxZFLuCFXymjJ/B77B2pPtFxhoajCxAn7SQyuomSqZP4GZ8hC+qjwjuhwO6hpE
 lYw2pb1h1yb8CElY1I9JtYJe8uZDpHTR7EpvKeer1WLzUcUqcu7xnTf0sj3zK+ApIKsj
 X3tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWkIRFDStRZ9KmyPnZBHDEt+uzSCdFUFMQBLOROUo8We08525TdlkF3m7vUdQTEbB/Gyn5nsRKF5w+isXKK4tR@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwfXiMsm11ahZhC8uVhMCnQsFFtgw8PegCzrmKPTgT5lht1brPT
 XAnlzOmfP3FSn1R81fkQkPyLbgq3/eRLLTteqDi3IKyNRy40SrEMPmUk
X-Gm-Gg: ASbGncs5ao/KZV8DqxnKqN17NmRWZmgIy3WHd/biXbBm+2GVal9fSvIvk4uEu98iQz/
 FNXyA2Pqiw7U/kC5gGPhHt0fxxyn8Pj9FngFf1HRvdEcuQ1CPbkHdLNM0aWoyKktJ7hF7pH5OLu
 kCH86TpgaceNzzo/fmTPz0+Via4Z9ohDXi1Kw2C9f3pDcW+V+YclkEnCrB2FVVClSqS99RqPHJU
 fyqKQ2tv2LGRNS1JA/uuTn/vzcD5FmV86OCkeI40ipErpnPK+onoG+iYTI7ZLemy6Nx9Neq79GO
 xU6Y4xSob0Y02coCMbSaAaXMGcHcc62N+IYhjWQQ3jkTS4GDCyRksviPdFxRCG/KF5dZXTr4oZM
 uN/GZmfJBybP10CHmfoae/C83qOKlLMNTuqL7+ILfrYe0Y7MD1fyuXvKpt+UU9mXWDlqWX8ml6g
 FGHljEL8OVW1tngQ==
X-Google-Smtp-Source: AGHT+IFVZlkWS40fPv2xMRzPGNdRd58qU6Vif92LpMuLo3svyO4zJnooHC4ZMgfo8z7+w3Goti4Eaw==
X-Received: by 2002:a17:902:ef49:b0:235:779:edfd with SMTP id
 d9443c01a7336-23e25759752mr173198155ad.39.1752875408325; 
 Fri, 18 Jul 2025 14:50:08 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:902e:59ec:cd2a:fc00])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6d2dd6sm18156305ad.164.2025.07.18.14.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 14:50:07 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 18 Jul 2025 14:50:03 -0700
Message-ID: <20250718215003.2283009-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Add this to control GC algorithm for boost
 GC. Signed-off-by: Daeho Jeong --- v2: use GC_GREEDY instead of 1 ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 8 +++++++- fs/f2fs/gc.c | 3 ++- fs/f2fs/gc.h | 1 + fs/f2fs/sysfs.c | 16
 ++++++++++++++++ 4 [...] 
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ucsy6-0006S1-3C
Subject: [f2fs-dev] [PATCH v2] f2fs: add gc_boost_gc_greedy sysfs node
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

Add this to control GC algorithm for boost GC.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: use GC_GREEDY instead of 1
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  8 +++++++-
 fs/f2fs/gc.c                            |  3 ++-
 fs/f2fs/gc.h                            |  1 +
 fs/f2fs/sysfs.c                         | 16 ++++++++++++++++
 4 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 931c1f63aa2e..2158055cd9d1 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -866,6 +866,12 @@ What:		/sys/fs/f2fs/<disk>/gc_boost_gc_multiple
 Date:		June 2025
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	Set a multiplier for the background GC migration window when F2FS GC is
-		boosted.
+		boosted. the range should be from 1 to the segment count in a section.
 		Default: 5
 
+What:		/sys/fs/f2fs/<disk>/gc_boost_gc_greedy
+Date:		June 2025
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	Control GC algorithm for boost GC. 0: cost benefit, 1: greedy
+		Default: 1
+
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index de7e59bc0906..0d7703e7f9e0 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -141,7 +141,7 @@ static int gc_thread_func(void *data)
 					FOREGROUND : BACKGROUND);
 
 		sync_mode = (F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC) ||
-				gc_control.one_time;
+			(gc_control.one_time && gc_th->boost_gc_greedy);
 
 		/* foreground GC was been triggered via f2fs_balance_fs() */
 		if (foreground)
@@ -198,6 +198,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
 	gc_th->valid_thresh_ratio = DEF_GC_THREAD_VALID_THRESH_RATIO;
 	gc_th->boost_gc_multiple = BOOST_GC_MULTIPLE;
+	gc_th->boost_gc_greedy = GC_GREEDY;
 
 	if (f2fs_sb_has_blkzoned(sbi)) {
 		gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME_ZONED;
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index efa1968810a0..1a2e7a84b59f 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -69,6 +69,7 @@ struct f2fs_gc_kthread {
 	unsigned int boost_zoned_gc_percent;
 	unsigned int valid_thresh_ratio;
 	unsigned int boost_gc_multiple;
+	unsigned int boost_gc_greedy;
 };
 
 struct gc_inode_list {
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index b0270b1c939c..3a52f51ee3c6 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -824,6 +824,20 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "gc_boost_gc_multiple")) {
+		if (t < 1 || t > SEGS_PER_SEC(sbi))
+			return -EINVAL;
+		sbi->gc_thread->boost_gc_multiple = (unsigned int)t;
+		return count;
+	}
+
+	if (!strcmp(a->attr.name, "gc_boost_gc_greedy")) {
+		if (t > GC_GREEDY)
+			return -EINVAL;
+		sbi->gc_thread->boost_gc_greedy = (unsigned int)t;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -1051,6 +1065,7 @@ GC_THREAD_RW_ATTR(gc_no_zoned_gc_percent, no_zoned_gc_percent);
 GC_THREAD_RW_ATTR(gc_boost_zoned_gc_percent, boost_zoned_gc_percent);
 GC_THREAD_RW_ATTR(gc_valid_thresh_ratio, valid_thresh_ratio);
 GC_THREAD_RW_ATTR(gc_boost_gc_multiple, boost_gc_multiple);
+GC_THREAD_RW_ATTR(gc_boost_gc_greedy, boost_gc_greedy);
 
 /* SM_INFO ATTR */
 SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
@@ -1222,6 +1237,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_boost_zoned_gc_percent),
 	ATTR_LIST(gc_valid_thresh_ratio),
 	ATTR_LIST(gc_boost_gc_multiple),
+	ATTR_LIST(gc_boost_gc_greedy),
 	ATTR_LIST(gc_idle),
 	ATTR_LIST(gc_urgent),
 	ATTR_LIST(reclaim_segments),
-- 
2.50.0.727.gbf7dc18ff4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
