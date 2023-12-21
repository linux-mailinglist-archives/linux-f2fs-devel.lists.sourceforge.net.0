Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E553B81AEE6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Dec 2023 07:49:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rGCsD-0002cs-0g;
	Thu, 21 Dec 2023 06:49:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <haokexin@gmail.com>) id 1rGCsB-0002cm-4g
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Dec 2023 06:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8+mMi4N9KQ1zevhr1u/oJ5yorKjkYCEKBRjsAuTkitA=; b=BeMAwpxrjLQth8bfTNNQemsOAH
 Ggsei1CPCtFrRKc4M8P6zgyLSSLBaevQB8CHjoA074sQdSEXtwDgi/m1xSzL1TvxPkafXTjUIjq3i
 N2Pgm9j8Bw3eMJrSfMSF1uPA6qtwwlXnKIVIErDWfaXNtQhQ2RGgbts+Tv1LA66M7Xqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8+mMi4N9KQ1zevhr1u/oJ5yorKjkYCEKBRjsAuTkitA=; b=A
 IkEoD75DumSSLO1mCHOoMCK/t60K9g76Az+2Tg5ksUe7iz3xhFRwkhrBK1955vBZgHr03Pg4FM38x
 8Mg0OeLvT8irXgaSxV7nZfRN64Oi7zqHGmUsxQJldy8fSbRQ0RDp2CTyP8gv/JcqQBr3Hx771Yj4g
 yeYxqKi9+qCYha3w=;
Received: from mail-qv1-f52.google.com ([209.85.219.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rGCsA-0003Pf-VG for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Dec 2023 06:49:35 +0000
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-67f6729a57fso11929016d6.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Dec 2023 22:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703141369; x=1703746169; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8+mMi4N9KQ1zevhr1u/oJ5yorKjkYCEKBRjsAuTkitA=;
 b=Q/E6FBVqJnC9NPx3Ozxr55YowLPLBEtIbfLxlxwmjfGy16X0xR0oxo3Gi3a7njgNRZ
 gcSCOzJNQns5OHfDwLn2TlUu9zwRb29ygsgEs5uZl+HosJB3VRn+ZqXuVckCH/sq8jTs
 GK79qjfBs7Loe/nC9TQW8LrMWDNtRL8tH2lNSEHZ3aYcZsD8/3DVW8wdOMFiePQ5LGMQ
 7LJ9la9IJku4alOSwuR8tzGXdsWI0oS8sWXeUilSV3Sknkqt7DjL/TXN46wTVG9AjCiZ
 +TX80HzmSOR5nok+YgYvBleR0unDAW/eVUH+BdliIoEYY5Kx8cyJjvphWzwXMJgmPWwn
 Qk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703141369; x=1703746169;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8+mMi4N9KQ1zevhr1u/oJ5yorKjkYCEKBRjsAuTkitA=;
 b=AIkzLzyGuPNhVuD41u1hDw7dTLGpf/NKqm4ShHrGqKFWa3kEVh2LDftPOs0roluwfI
 cmNTolciBeCDH9jVFu5DuiaJ0nPysyC2Hvcnxu2V6SqZzisUA2+ADVg2QZzrp1O3wNHS
 ydVe/cB+1Az2s64RRqmuv+PkEpeFOWJaD03DVmOxyfK2plDFFkvOJRFZnqU+uga7mYtD
 GZDRbbkUZW0MGIql4w1/VqEPDW9Qm18irbjKOllaw1S6pQA06jZ3e6BZz5XHCW314r/v
 VCr4D9m1eXNF/BAL5L1EcyQq99RR/9cx7k6qBaEII52FbNO69TAcLTnqtMVHg//2ebpX
 YpgA==
X-Gm-Message-State: AOJu0Yx8kcPtiNJ3pD1CZWgPU6GvhoOeV0ohPRXzRqXp3wTMVLNJBK2Y
 Dt2pP6K6BrnvTtpwq4GOH2BE4Yj+4qIxbg==
X-Google-Smtp-Source: AGHT+IHOwV5URiC+YaaI2HMR/ywtmkUmzQU5yzHFvzd9S00MgGxvGfGEd6JgPoMNOj8R1HL8K5+nLA==
X-Received: by 2002:a05:6214:194c:b0:67f:7c81:a5d3 with SMTP id
 q12-20020a056214194c00b0067f7c81a5d3mr353406qvk.36.1703141368990; 
 Wed, 20 Dec 2023 22:49:28 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-121.windriver.com.
 [147.11.105.121]) by smtp.gmail.com with ESMTPSA id
 b2-20020ad45182000000b0067f48f2143csm436563qvp.53.2023.12.20.22.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 22:49:28 -0800 (PST)
From: Kevin Hao <haokexin@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 21 Dec 2023 14:49:16 +0800
Message-Id: <20231221064916.1930095-1-haokexin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: A freezable kernel thread can enter frozen state during
 freezing
 by either calling try_to_freeze() or using wait_event_freezable() and its
 variants. So for the following snippet of code in a kernel th [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [haokexin[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.52 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.52 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rGCsA-0003Pf-VG
Subject: [f2fs-dev] [PATCH v2] f2fs: Use wait_event_freezable_timeout() for
 freezable kthread
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

A freezable kernel thread can enter frozen state during freezing by
either calling try_to_freeze() or using wait_event_freezable() and its
variants. So for the following snippet of code in a kernel thread loop:
  wait_event_interruptible_timeout();
  try_to_freeze();

We can change it to a simple wait_event_freezable_timeout() and then
eliminate the function calls to try_to_freeze() and freezing().

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
v2: Drop the invocation of freezing().

 fs/f2fs/gc.c      | 6 +++---
 fs/f2fs/segment.c | 7 ++-----
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 405a6077bd83..e99f58b5f15c 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -46,8 +46,8 @@ static int gc_thread_func(void *data)
 	do {
 		bool sync_mode, foreground = false;
 
-		wait_event_interruptible_timeout(*wq,
-				kthread_should_stop() || freezing(current) ||
+		wait_event_freezable_timeout(*wq,
+				kthread_should_stop() ||
 				waitqueue_active(fggc_wq) ||
 				gc_th->gc_wake,
 				msecs_to_jiffies(wait_ms));
@@ -59,7 +59,7 @@ static int gc_thread_func(void *data)
 		if (gc_th->gc_wake)
 			gc_th->gc_wake = false;
 
-		if (try_to_freeze() || f2fs_readonly(sbi->sb)) {
+		if (f2fs_readonly(sbi->sb)) {
 			stat_other_skip_bggc_count(sbi);
 			continue;
 		}
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 61da26eb61cc..4c8836ded90f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1887,9 +1887,8 @@ static int issue_discard_thread(void *data)
 	set_freezable();
 
 	do {
-		wait_event_interruptible_timeout(*q,
-				kthread_should_stop() || freezing(current) ||
-				dcc->discard_wake,
+		wait_event_freezable_timeout(*q,
+				kthread_should_stop() || dcc->discard_wake,
 				msecs_to_jiffies(wait_ms));
 
 		if (sbi->gc_mode == GC_URGENT_HIGH ||
@@ -1907,8 +1906,6 @@ static int issue_discard_thread(void *data)
 		if (atomic_read(&dcc->queued_discard))
 			__wait_all_discard_cmd(sbi, NULL);
 
-		if (try_to_freeze())
-			continue;
 		if (f2fs_readonly(sbi->sb))
 			continue;
 		if (kthread_should_stop())
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
