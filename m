Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B25D972531
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Sep 2024 00:20:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1snmjn-0000LT-PA;
	Mon, 09 Sep 2024 22:20:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1snmjm-0000LL-IR
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 22:19:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iGCC+Dv6h85N/mf1N7X2UqBFYf5VzPR2k8+fGtZL+fQ=; b=Q0oin4kCqgdFGy7Zzqkh+qvVM+
 t4C0nRa7+61lpc/EG67YGcQY2ZC6Vk6WgNq4EhhdahF1KQEnhHe20mxyrprCIB5Z5j1rtfJBCfjC5
 taHLmHNHAHxazXxDtOdR/EG0dQSmo7TbhzMc8MS/VVBQ1xyvnnGymCqtlUPgp8pGEDCk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iGCC+Dv6h85N/mf1N7X2UqBFYf5VzPR2k8+fGtZL+fQ=; b=AcvUMeVLHhi7xbOC0LfS1uVAMC
 PYYFDyjwXJzN1p86pQdRdS1G2oX+FVuyBdyiS2Gi5RlkpBsbt7b52/Du9zcq9QjhQtpV0HYlI7df/
 GL0om/neTv+TQxGBMsmzDikY8xnIF1tGcVL4K39KrH0CdQpZak9TwboA5uOQvbsMTlqI=;
Received: from mail-pj1-f42.google.com ([209.85.216.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1snmjm-0006gD-GK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Sep 2024 22:19:59 +0000
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2d8a744aa9bso3137367a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 09 Sep 2024 15:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725920393; x=1726525193; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iGCC+Dv6h85N/mf1N7X2UqBFYf5VzPR2k8+fGtZL+fQ=;
 b=Ab5Rtyz1W061Bl8S20VWDEYPQ1OS0pf/o5Pc7N/bkv+c5wgMN3iXcgafFxmHSOSsL4
 guwLN/yqhpE9Rc0xiMuCxzfCZE2y15DOs6nz8rQhNkMvQfLj9SonLvuHsUrN2OT8SQkg
 +kj4ModDtnWSL2ZvXkHqX1PlCBwcFvpkgy+0KRLja/7Q8GoojEvJPz9RtyIyzaCApkpM
 VxHaFZ4PQmSGA/AXv4Ae8PShJEOdzlObnBK/zaA1aukTnQZEGhQr8/uc+8mX+HnCfB4Q
 ODh6TJnvqXNtw7L1YP2YvNIBVwkOlcUCJFaDK73Ms6pOt1sDjT4IZrgQ1n+MG8EwBbKn
 gV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725920393; x=1726525193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iGCC+Dv6h85N/mf1N7X2UqBFYf5VzPR2k8+fGtZL+fQ=;
 b=LwAtsn+YQnFxzPAGxN7hvJoqiUMLeX7MhFAGYZQD8GNPojCGjziMv5g0+QG0IfaCoH
 JTQW/DPz6GmJzaaLysNt2AzoqTM7TS7SJ5OzPd5NNyAiW+2rXJDsNBzplhDNnvJmAFvG
 2bpSwTjFBftPaIawJoG8iuz+V6fuGkOuaVAZTbNSwjlrqn3+3mMkh77NxuL353wbQM3B
 1guqE7ES1PVzp2PWdFAs+OgBAWI2Ve501NThH0Q9PscO8cR8F7GdnNHM23qXyZucQpLD
 dH5fh7idrqeiyOnSqWWCmj3FJiq1J+cg1IX1574oWJSjB82q6skIbj2JHkBoDsFPUGv8
 aCcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCULFSH9dBTHJ0Uudgl/Tf5ahsClbQc42xU+QYlItcDktHwytlfoKktxEBkeNBKmNVuBpBFRjHx4WQBoRx0QpIqO@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyrtev9hMOx4lI3LTXvKlU2RB1RlwDHM2gvyyblJMBcZmvrI1sF
 DJG0qjcVKk/2yldNumFrqp2hczGFN/b79VzfiaCmo15YD+x29rZp
X-Google-Smtp-Source: AGHT+IF+poKijXFR+9kbWavXc48h+JssHCWV+FY/Q/DkkEudniftOuE5WGPJoQNdnuKDdb0lIOEa+w==
X-Received: by 2002:a17:90a:ae13:b0:2c8:e888:26a2 with SMTP id
 98e67ed59e1d1-2dad4efda3bmr11982776a91.13.1725920392551; 
 Mon, 09 Sep 2024 15:19:52 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:ed56:14c3:db02:6c66])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2db04988470sm5016840a91.54.2024.09.09.15.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 15:19:52 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon,  9 Sep 2024 15:19:41 -0700
Message-ID: <20240909221946.2004046-2-daeho43@gmail.com>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240909221946.2004046-1-daeho43@gmail.com>
References: <20240909221946.2004046-1-daeho43@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong We can control the scanning window
 granularity
 for GC migration. For more frequent scanning and GC on zoned devices, we
 need a fine grained control knob for it. Signed-off-by: Daeho Jeong --- v2:
 introduced a new migration_window_granularity instead of changing the meaning
 of the current migration_granularity ---
 Documentation/ABI/testing/sysfs-fs-f2fs | 8 [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.42 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.42 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1snmjm-0006gD-GK
Subject: [f2fs-dev] [PATCH v2 2/7] f2fs: introduce
 migration_window_granularity
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

We can control the scanning window granularity for GC migration. For
more frequent scanning and GC on zoned devices, we need a fine grained
control knob for it.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: introduced a new migration_window_granularity instead of changing
    the meaning of the current migration_granularity
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  8 +++++++
 fs/f2fs/f2fs.h                          |  2 ++
 fs/f2fs/gc.c                            | 31 +++++++++++++++++--------
 fs/f2fs/gc.h                            |  1 +
 fs/f2fs/super.c                         |  2 ++
 fs/f2fs/sysfs.c                         |  7 ++++++
 6 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index cad6c3dc1f9c..9165f617d216 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -763,3 +763,11 @@ Date:		November 2023
 Contact:	"Chao Yu" <chao@kernel.org>
 Description:	It controls to enable/disable IO aware feature for background discard.
 		By default, the value is 1 which indicates IO aware is on.
+
+What:		/sys/fs/f2fs/<disk>/migration_window_granularity
+Date:		September 2024
+Contact:	"Daeho Jeong" <daehojeong@google.com>
+Description:	Controls migration window granularity of garbage collection on large
+		section. it can control the scanning window granularity for GC migration
+		in a unit of segment, while migration_granularity controls the number
+		of segments which can be migrated at the same turn.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5e4db3ba534a..a00e01e66e08 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1685,6 +1685,8 @@ struct f2fs_sb_info {
 	unsigned int max_victim_search;
 	/* migration granularity of garbage collection, unit: segment */
 	unsigned int migration_granularity;
+	/* migration window granularity of garbage collection, unit: segment */
+	unsigned int migration_window_granularity;
 
 	/*
 	 * for stat information.
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 46e3bc26b78a..5cd316d2102d 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1708,24 +1708,34 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 	struct blk_plug plug;
 	unsigned int segno = start_segno;
 	unsigned int end_segno = start_segno + SEGS_PER_SEC(sbi);
+	unsigned int sec_end_segno;
 	int seg_freed = 0, migrated = 0;
 	unsigned char type = IS_DATASEG(get_seg_entry(sbi, segno)->type) ?
 						SUM_TYPE_DATA : SUM_TYPE_NODE;
 	unsigned char data_type = (type == SUM_TYPE_DATA) ? DATA : NODE;
 	int submitted = 0;
 
-	if (__is_large_section(sbi))
-		end_segno = rounddown(end_segno, SEGS_PER_SEC(sbi));
+	if (__is_large_section(sbi)) {
+		sec_end_segno = rounddown(end_segno, SEGS_PER_SEC(sbi));
 
-	/*
-	 * zone-capacity can be less than zone-size in zoned devices,
-	 * resulting in less than expected usable segments in the zone,
-	 * calculate the end segno in the zone which can be garbage collected
-	 */
-	if (f2fs_sb_has_blkzoned(sbi))
-		end_segno -= SEGS_PER_SEC(sbi) -
+		/*
+		 * zone-capacity can be less than zone-size in zoned devices,
+		 * resulting in less than expected usable segments in the zone,
+		 * calculate the end segno in the zone which can be garbage
+		 * collected
+		 */
+		if (f2fs_sb_has_blkzoned(sbi))
+			sec_end_segno -= SEGS_PER_SEC(sbi) -
 					f2fs_usable_segs_in_sec(sbi, segno);
 
+		if (gc_type == BG_GC)
+			end_segno = start_segno +
+				sbi->migration_window_granularity;
+
+		if (end_segno > sec_end_segno)
+			end_segno = sec_end_segno;
+	}
+
 	sanity_check_seg_type(sbi, get_seg_entry(sbi, segno)->type);
 
 	/* readahead multi ssa blocks those have contiguous address */
@@ -1803,7 +1813,8 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 
 		if (__is_large_section(sbi))
 			sbi->next_victim_seg[gc_type] =
-				(segno + 1 < end_segno) ? segno + 1 : NULL_SEGNO;
+				(segno + 1 < sec_end_segno) ?
+					segno + 1 : NULL_SEGNO;
 skip:
 		f2fs_put_page(sum_page, 0);
 	}
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 55c4ba73362e..245f93663745 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -32,6 +32,7 @@
 
 #define LIMIT_NO_ZONED_GC	60 /* percentage over total user space of no gc for zoned devices */
 #define LIMIT_BOOST_ZONED_GC	25 /* percentage over total user space of boosted gc for zoned devices */
+#define DEF_MIGRATION_WINDOW_GRANULARITY_ZONED	3
 
 #define DEF_GC_FAILED_PINNED_FILES	2048
 #define MAX_GC_FAILED_PINNED_FILES	USHRT_MAX
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ca2101ad918e..7b4908545793 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3791,6 +3791,8 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
 	sbi->max_victim_search = DEF_MAX_VICTIM_SEARCH;
 	sbi->migration_granularity = SEGS_PER_SEC(sbi);
+	sbi->migration_window_granularity = f2fs_sb_has_blkzoned(sbi) ?
+		DEF_MIGRATION_WINDOW_GRANULARITY_ZONED : SEGS_PER_SEC(sbi);
 	sbi->seq_file_ra_mul = MIN_RA_MUL;
 	sbi->max_fragment_chunk = DEF_FRAGMENT_SIZE;
 	sbi->max_fragment_hole = DEF_FRAGMENT_SIZE;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index fee7ee45ceaa..66d15609d5ad 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -561,6 +561,11 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 			return -EINVAL;
 	}
 
+	if (!strcmp(a->attr.name, "migration_window_granularity")) {
+		if (t == 0 || t > SEGS_PER_SEC(sbi))
+			return -EINVAL;
+	}
+
 	if (!strcmp(a->attr.name, "gc_urgent")) {
 		if (t == 0) {
 			sbi->gc_mode = GC_NORMAL;
@@ -1001,6 +1006,7 @@ F2FS_SBI_RW_ATTR(gc_pin_file_thresh, gc_pin_file_threshold);
 F2FS_SBI_RW_ATTR(gc_reclaimed_segments, gc_reclaimed_segs);
 F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
 F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
+F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
 F2FS_SBI_GENERAL_RW_ATTR(dir_level);
 #ifdef CONFIG_F2FS_IOSTAT
 F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
@@ -1140,6 +1146,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(min_ssr_sections),
 	ATTR_LIST(max_victim_search),
 	ATTR_LIST(migration_granularity),
+	ATTR_LIST(migration_window_granularity),
 	ATTR_LIST(dir_level),
 	ATTR_LIST(ram_thresh),
 	ATTR_LIST(ra_nid_pages),
-- 
2.46.0.598.g6f2099f65c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
