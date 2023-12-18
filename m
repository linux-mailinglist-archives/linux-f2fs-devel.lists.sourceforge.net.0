Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 461038166F7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Dec 2023 08:01:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rF7dN-0003H7-Nu;
	Mon, 18 Dec 2023 07:01:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <haokexin@gmail.com>) id 1rF7dM-0003H0-AU
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Dec 2023 07:01:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SpwYoAUGwrcugpUUYwCUNOv9XnG/7ENaTvtgcxe7G10=; b=QrpCi8iyllPSd2i68HCw9w8KRB
 zq1iJhZwRzGEBsBVXMXqPRFROzEoUJcHNQaFtbRhQRcO+jztyXy09ax92NyQ0uiz7rU8G6ZSjQBjX
 0bEXXVe1zjpHZLbFOFB7jKgeTy6tPUjCVY19J8NZX+oTglsxhPQD7OHF1NFItrWDcsYM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SpwYoAUGwrcugpUUYwCUNOv9XnG/7ENaTvtgcxe7G10=; b=V
 NPTMbIMsj+0UpRLpfPd8EzXmsArWkBTa4anR+ANZ+k0xSL6YOxIK4Ropj0GWZzDM++T+uwPTO+liM
 cWc7hOlroY+yMg7uVCuKxD3CpB4kCMfivl2zXmyu+Y6aDkq3pYUHD00pbgIIGoQ7WxQ6Es9lY7KHu
 OLXd8W40og60bHTo=;
Received: from mail-qv1-f50.google.com ([209.85.219.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rF7dH-00019m-Si for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Dec 2023 07:01:47 +0000
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-67ee17ab697so26901556d6.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 17 Dec 2023 23:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702882893; x=1703487693; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SpwYoAUGwrcugpUUYwCUNOv9XnG/7ENaTvtgcxe7G10=;
 b=C1a0l3/Z9yH587QBq/mS9xeqmW3F6wF8IQXaXV9dHv5AcpizDXjgdwbOBY4T7AYpf8
 0pihSJRGFuUrVCyg8CTAm4pvIxOc96vb4l0dDHNxIu3q4uKrICIAkObprtfRk2S4z9sO
 no2aMQKaatrQp4EJr5K/JRC4zdP38kZRNARr52fkGm26vLs3HZdfNRZ9Aw0Vg87yDoKm
 mEWNZkhRAYRPLmsVnS0mRcbkksIQqVhENDqLd93o/FM0C8wlxbXix1pNRxhhSOJgHeP5
 dTSOQgLnRBfabLM+YwUSBhE05rjhmAJe1e6OhZlYNNYHkfMhADfzOm0yJoPRUnLgRTci
 M5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702882893; x=1703487693;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SpwYoAUGwrcugpUUYwCUNOv9XnG/7ENaTvtgcxe7G10=;
 b=rV2BFzAk4XHQmW0PeppUiCpq09cU3sNXu9PXxgR+ptXiwX9klWfFHONzx5bMLGoFzi
 icosOClxuI8In8eqwVf1EmMQzRtVVyBHKGEiL1A3bkmMEhJGM4VJv5yrk5f71Zx1Q0EL
 hJtylrYskzsMOYKxylmekcEGhK03kB/ubU6s4wf/Iud/oW83yRlkjeNak/OiOvUrgAzP
 /lTAHpV/lOUUIZkFnq6OCCEQxRKr2c+uqhH9BuuIJeDCljcKm+BqYkzhcd6lDHp9uhnB
 I+pKuMNH2PdmHOt0GZCnjCnrxPNzz0fdG03h5glQ1mOzBh+RJJrngZrAJUtLUkfT0DjH
 PYjQ==
X-Gm-Message-State: AOJu0Yz3KVL/IvKVqIh7vgN6yguSZOj3UGTexXEB2Qe9U7bNm1is3cPd
 IA9+tCrlvpCQG6Uo4HZ/tcQBJD3oybQ=
X-Google-Smtp-Source: AGHT+IEIvpHhjNMmwLXW6u9p7+9doptm0W/RT/4UYVIwuWXOtR4FIC2SdzZsj5c0LLOIgimuBmSozA==
X-Received: by 2002:ad4:5f8e:0:b0:67f:30d5:ba22 with SMTP id
 jp14-20020ad45f8e000000b0067f30d5ba22mr4830521qvb.96.1702882892891; 
 Sun, 17 Dec 2023 23:01:32 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-121.windriver.com.
 [147.11.105.121]) by smtp.gmail.com with ESMTPSA id
 nd6-20020a056214420600b0067f40caff08sm893925qvb.23.2023.12.17.23.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Dec 2023 23:01:32 -0800 (PST)
From: Kevin Hao <haokexin@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 18 Dec 2023 15:01:23 +0800
Message-Id: <20231218070123.1221322-1-haokexin@gmail.com>
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.50 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.50 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [haokexin[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rF7dH-00019m-Si
Subject: [f2fs-dev] [PATCH] f2fs: Use wait_event_freezable_timeout() for
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
eliminate a function call.

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 fs/f2fs/gc.c      | 4 ++--
 fs/f2fs/segment.c | 4 +---
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 405a6077bd83..d83bbd0e5657 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -46,7 +46,7 @@ static int gc_thread_func(void *data)
 	do {
 		bool sync_mode, foreground = false;
 
-		wait_event_interruptible_timeout(*wq,
+		wait_event_freezable_timeout(*wq,
 				kthread_should_stop() || freezing(current) ||
 				waitqueue_active(fggc_wq) ||
 				gc_th->gc_wake,
@@ -59,7 +59,7 @@ static int gc_thread_func(void *data)
 		if (gc_th->gc_wake)
 			gc_th->gc_wake = false;
 
-		if (try_to_freeze() || f2fs_readonly(sbi->sb)) {
+		if (f2fs_readonly(sbi->sb)) {
 			stat_other_skip_bggc_count(sbi);
 			continue;
 		}
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 61da26eb61cc..a3e6533ebfc1 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1887,7 +1887,7 @@ static int issue_discard_thread(void *data)
 	set_freezable();
 
 	do {
-		wait_event_interruptible_timeout(*q,
+		wait_event_freezable_timeout(*q,
 				kthread_should_stop() || freezing(current) ||
 				dcc->discard_wake,
 				msecs_to_jiffies(wait_ms));
@@ -1907,8 +1907,6 @@ static int issue_discard_thread(void *data)
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
