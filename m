Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D9A846EDD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Feb 2024 12:23:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rVrdM-0002l8-GT;
	Fri, 02 Feb 2024 11:23:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinbaoliu365@gmail.com>) id 1rVrdK-0002l2-JP
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Feb 2024 11:22:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iDv0UM+c6esZvNRhK5IQOpzsJDuTm6Hopa5EKVjce1o=; b=QDMrMY381NbZWWzsir8jFAf3Z1
 sJYGBtCNT5IiRLrQu/nS0zklAgZpOvbbb3d6dXdj0blf5asCX7wRABEJtWVSOWbHotvNL8XctVPyC
 /nfmN0hgSMOBV8IgL0wMhNWQWDcqwjrtoiaK2yflSz1bMyN+35z0OZljHi8g34IynNwo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iDv0UM+c6esZvNRhK5IQOpzsJDuTm6Hopa5EKVjce1o=; b=F
 8JD7hcYw3H0QRDBsncuhIGdbtrDmZI93WOqabbmGMBnFb+lw6thmftCrjqxvajQpVY0JE9yfy/VJD
 4UtBOHGIw4FhQLACBIMEZuGp391qIiUV75B1Wp08HlpQ85qNVT3eGPQxm2O6AcyzlonW9T/RhC0/1
 hUyZhuYMBn8DYOqI=;
Received: from mail-pl1-f179.google.com ([209.85.214.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rVrdJ-0007Az-RV for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Feb 2024 11:22:59 +0000
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1d932f6ccfaso15673045ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 02 Feb 2024 03:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706872973; x=1707477773; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iDv0UM+c6esZvNRhK5IQOpzsJDuTm6Hopa5EKVjce1o=;
 b=m8MePVU8O8akZ0RcOBHobGGSdEBtX41qxzFgPUaSHYheDNjuJfJmU8yt3ySKfpbr9/
 VKye7jEkOIdn0zCxxxZGTzsaar5KzMnHX7s/1sA5OFRWA7goySNDFfQRSWtMJAWt+xbP
 ZAzX0q9DzhQst/nlALn+UIuDMANSD47hjT26d++MtDDlJ3MeTLJTM2KBrGBRHaJubj8z
 Jju2/yX4CVIuSoUfE0hAq38B62QIBoGfsiDcQjaYfLBq5P6pfp5ot+bYEPLaJHUHdJKj
 u1ALwKEkd93DctxT1mCc49R7YwulGf4zCx8khu4BRj7fNJSlcJgxBSJg096AP8/Ltcpy
 Egzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706872973; x=1707477773;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iDv0UM+c6esZvNRhK5IQOpzsJDuTm6Hopa5EKVjce1o=;
 b=HBMZY/yvu74n4GhnwsWGzwOAU1fGYx6dDy0UDJLGwGxJCyWmdx7hAmBZuH0P9628C3
 EtFcPMgAx71O/8d6Sc/bezOmjXg4PjBcjppYE57AJ5OlmF2nXFI8SsZQRjvNN3ILdQJ5
 Fm8o36jxkEPsoVUofBcb8cquotikfO36mz4gdVEOEpvGABb0qG0M6n8FvcDUeJ5eCT62
 lXnurTFYx4mN8QI3+8S0HtsNn/XzMWv7kzLex5J4NBtUdz7NQIy01M7hI68XoMTsmb1b
 JGkPbIUfYMsWkJ4oe5bKDJhlF0uE0m+wyHqLIA80uSN78skH3Ffgp8V9ySmzknr1+RIw
 zc2g==
X-Gm-Message-State: AOJu0Ywl9P7XchmWU0Y9cYRz2hgG46stznL4/zSiE+jaSRmWomLyJAik
 /dVnlO2IqO5qFoxJJr8cQHCFJWAx2ioROgLsnSSfeTYFAsnrYrtY
X-Google-Smtp-Source: AGHT+IHbSvjkPvFNB/sCdH351XrytCdZsUAhhG/thXz9suC2cMVStXnKcOz3VvBRsI7ABfK5fyRCuA==
X-Received: by 2002:a17:903:32cc:b0:1d9:591b:227a with SMTP id
 i12-20020a17090332cc00b001d9591b227amr4449112plr.48.1706872972776; 
 Fri, 02 Feb 2024 03:22:52 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWNdpf8NT3hm40JJqjKjyQEeRk0cVjnL04EPKtojBBO7tl9XT5x6cN7HvTduuYb9yEBppZQAaJ+yTSDRbXcwm21A4Av1I4JHCH5FrBFygQHtbEtlJAtIId2q2UopOeLNH6xYniOpo26dJQJjGSVGZJsfcRuZo3O16mCXiLFLWzqST3tnYaSyoAU
Received: from mi.mioffice.cn ([2408:8607:1b00:8:8eec:4bff:fe94:a95d])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a170902d08b00b001d7134d149dsm1374865plv.256.2024.02.02.03.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 03:22:52 -0800 (PST)
From: liujinbao1 <jinbaoliu365@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri,  2 Feb 2024 19:22:25 +0800
Message-ID: <5a4cdc020f19e136e79f9d0b6ca2adf2879db888.1706859367.git.liujinbao1@xiaomi.corp-partner.google.com>
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jinbaoliu365[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [jinbaoliu365[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.179 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.179 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rVrdJ-0007Az-RV
Subject: [f2fs-dev] [PATCH v2] f2fs: sysfs: support gc_io_aware
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

Signed-off-by: liujinbao1 <liujinbao1@xiaomi.corp-partner.google.com>

changes of v2: Improve the patch according to Chao's suggestions

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
