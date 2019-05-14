Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBFD1C34F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 May 2019 08:36:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQR3M-0002SR-0f; Tue, 14 May 2019 06:36:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hQR3K-0002SF-Ov
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 06:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E8XzTsUoeBYik5CPnRoGc5rHIaaysxAqExM1aGHFAlc=; b=W+mp2h2lnn/9fPIs0iT2IQNVdN
 tmMljo9yrHN6bFLCpbIikWMWhC23nRzspRM3iMz5BLbRnpv7pAyYdkPfiBE9bXH89zYnU2cnFzPFO
 gpLwVgIrvfAMG5d+8x2kVHpaWMXwlYg/psFqLOW9spwK569nVWFrP0fELMXxwUps44Sg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=E8XzTsUoeBYik5CPnRoGc5rHIaaysxAqExM1aGHFAlc=; b=l
 6hUZH4VRQ/6T3JmkzGAYH6K5ePuL1g5KyjM5mRRU92tXbY64FbyGldm4iIW1jeYgbZIiyHA2PVmHg
 MbQchVlkTWTnaRPRKidDuM823IETiCOFfrsKm6n5f81YYF/IoQgWetwBbClwfrNeiZFI27P2o6iSc
 yupvKNP3fMX2FnMQ=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hQR3J-00FmwV-FS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 May 2019 06:36:42 +0000
Received: by mail-pg1-f193.google.com with SMTP id w22so8076600pgi.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 May 2019 23:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E8XzTsUoeBYik5CPnRoGc5rHIaaysxAqExM1aGHFAlc=;
 b=mVnFsoY8IgVaatdta6T6OScsoTRvKkpZcpJ3s7ATKvOBRB7NT6OGlZoJJHBYXUAacz
 U6B8SiggXoKEQPa/TtQ/BBKD9HzItvAggrXyyc3l6ag0RyhnPGB1Oe9Cnh8izcHy6nG1
 uhwzVjlgJwhWHfLqG+JwWgj+hL1Hbpq327IAn9VVXeX/4ANoeyQbDE5BRHAk3HAGM6Mb
 QEUiM1J6yvWu8I8nPNy69mZU3PAmSrjuCYYblw9NSMwISE7Q3rCsOsaojJ99kHtAtvXc
 5pAUs8GUghV9haW3FugAXVO79nP5MV5l3TSvagzfKWKK/o5cO2FsSJfpGtf6WJZ57vkO
 KdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E8XzTsUoeBYik5CPnRoGc5rHIaaysxAqExM1aGHFAlc=;
 b=rHkIwWQ86T66m85EF5Y5o2dUmQF+BKCbUX6izXPsrQZgCGLvgOEO5sgSJ43+IEUCDe
 x9RwHnGLWapvG3aouZ+zuwlCw7B7LLhBrOhouVG2+vz8KYe/E6oj4gNSIYU3pLE+UCKW
 2mbDd5VJjLEMoJGD6VFk+b/Z3ITXsrYL8sNO616YSMn1M9Qkhfm/FhskPTDJCIyvVomu
 Q5ggoBsBRGgmXKkMSc1rDiSWzij/DmzMXGccL7PPl8EExNfKrwUvPUCYrtDKgbGrNB/K
 CLD9RLltSN9cKEzSS2BH4sCqQIZHLQ/fkXi5u0LJdDXu52LUhsynMohUmxqaMjYCZe5e
 SFvA==
X-Gm-Message-State: APjAAAVkBDqkTiV/HLW+2m8reuyZJizgpte6k9ioQSzjfnyXgUXfZ91I
 lXHXDQ4uWIkh/TXZsp5ZHFzg7uy7gtXxpQ==
X-Google-Smtp-Source: APXvYqyNSYN8DpKRQfkx2wvwl6HxJ5w7frUAAeu0bhkXLgOiBHzPsTfRlosEA6QJRBMl+sMtMc1ppw==
X-Received: by 2002:a62:8245:: with SMTP id w66mr38497239pfd.58.1557815795385; 
 Mon, 13 May 2019 23:36:35 -0700 (PDT)
Received: from localhost.localdomain ([121.170.223.70])
 by smtp.gmail.com with ESMTPSA id 19sm19767285pfz.84.2019.05.13.23.36.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 May 2019 23:36:34 -0700 (PDT)
From: Park Ju Hyung <qkrwngud825@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 14 May 2019 15:36:21 +0900
Message-Id: <20190514063623.57162-1-qkrwngud825@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1hQR3J-00FmwV-FS
Subject: [f2fs-dev] [PATCH 1/3] f2fs: remove sleep_time under gc_urgent
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

gc_urgent is meant to be a hint from the user to force f2fs to run GC
aggressively, which means they are willing to take the hit on increased
latency during gc_urgent. It's meaningless to sleep between each GC under
gc_urgent, Not to mention that the default value of 500 ms makes gc_urgent
super ineffective.

Remove urgent_sleep_time entirely and allow GC to be finished much faster.

Use 1 for wait_ms instead of 0 to prevent possible CPU hoggings.

Signed-off-by: Park Ju Hyung <qkrwngud825@gmail.com>
---
 fs/f2fs/gc.c    | 3 +--
 fs/f2fs/gc.h    | 2 --
 fs/f2fs/sysfs.c | 3 ---
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 963fb4571fd9..9c3ed89c8c5b 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -77,7 +77,7 @@ static int gc_thread_func(void *data)
 		 * So, I'd like to wait some time to collect dirty segments.
 		 */
 		if (sbi->gc_mode == GC_URGENT) {
-			wait_ms = gc_th->urgent_sleep_time;
+			wait_ms = 1;
 			mutex_lock(&sbi->gc_mutex);
 			goto do_gc;
 		}
@@ -129,7 +129,6 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 		goto out;
 	}
 
-	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
 	gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME;
 	gc_th->max_sleep_time = DEF_GC_THREAD_MAX_SLEEP_TIME;
 	gc_th->no_gc_sleep_time = DEF_GC_THREAD_NOGC_SLEEP_TIME;
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index bbac9d3787bd..de79a867837e 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -10,7 +10,6 @@
 						 * whether IO subsystem is idle
 						 * or not
 						 */
-#define DEF_GC_THREAD_URGENT_SLEEP_TIME	500	/* 500 ms */
 #define DEF_GC_THREAD_MIN_SLEEP_TIME	30000	/* milliseconds */
 #define DEF_GC_THREAD_MAX_SLEEP_TIME	60000
 #define DEF_GC_THREAD_NOGC_SLEEP_TIME	300000	/* wait 5 min */
@@ -27,7 +26,6 @@ struct f2fs_gc_kthread {
 	wait_queue_head_t gc_wait_queue_head;
 
 	/* for gc sleep time */
-	unsigned int urgent_sleep_time;
 	unsigned int min_sleep_time;
 	unsigned int max_sleep_time;
 	unsigned int no_gc_sleep_time;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 729f46a3c9ee..0165431e83e5 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -397,8 +397,6 @@ static struct f2fs_attr f2fs_attr_##_name = {			\
 	.id	= _id,						\
 }
 
-F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_urgent_sleep_time,
-							urgent_sleep_time);
 F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_min_sleep_time, min_sleep_time);
 F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_max_sleep_time, max_sleep_time);
 F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_no_gc_sleep_time, no_gc_sleep_time);
@@ -459,7 +457,6 @@ F2FS_FEATURE_RO_ATTR(sb_checksum, FEAT_SB_CHECKSUM);
 
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
 static struct attribute *f2fs_attrs[] = {
-	ATTR_LIST(gc_urgent_sleep_time),
 	ATTR_LIST(gc_min_sleep_time),
 	ATTR_LIST(gc_max_sleep_time),
 	ATTR_LIST(gc_no_gc_sleep_time),
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
