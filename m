Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3791DA9122F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Apr 2025 06:15:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u5Geu-0004jr-Rq;
	Thu, 17 Apr 2025 04:15:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1u5Get-0004jl-On
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Apr 2025 04:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yGk3pITWrBQ/TJxGQwfShPt0+Q+2r4nf7LKhyPG3ILQ=; b=luq1d1mA8G1EnAGxVpS59uZhzL
 1dh4K/O0oylOuXTu0iMFxDCqkyGu8GqsaVbm3Bx/fOPAshbu24WYysRjMJwuGb48eKS9mWVkSzET8
 ODqfN6Z036niROf8CpqopT1BuILfLJ5Xkjoto1ZFCDHgdLtT+imWceUX1mqqXXHau7uQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yGk3pITWrBQ/TJxGQwfShPt0+Q+2r4nf7LKhyPG3ILQ=; b=Tcduk11/0yawOjks5uKj7/sc0o
 FzL6zE84sRtKVjP7iJdTNv2+e/hMVofPHZ07wdIDlPBHKlAkvhPsEksApGtP6xLwTNaZKpjlwCDqF
 HntHXTZRZAhYyAvw3KRk8R8b+2zD4Qz5K9KQKQWSc8eziD/nN2zeVzIWS1oJSg2qYDwU=;
Received: from exvmail3.skhynix.com ([166.125.252.90]
 helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1u5Ged-0004ot-2w for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Apr 2025 04:15:27 +0000
X-AuditID: a67dfc59-03fff7000000aab6-5b-680080351a10
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daeho43@gmail.com
Date: Thu, 17 Apr 2025 13:14:27 +0900
Message-ID: <20250417041429.2060-2-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250417041429.2060-1-yohan.joung@sk.com>
References: <20250417041429.2060-1-yohan.joung@sk.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsXC9ZZnka5pA0OGweT7Bhanp55lsnhz5AyL
 xZP1s5gtLi1yt7i8aw6bA6vHzll32T02repk89i94DOTx+dNcgEsUVw2Kak5mWWpRfp2CVwZ
 W7cuYy+Yol/x7N5HtgbG72pdjJwcEgImEmsvP2WHsZftbmYFsdkENCT+9PYyg9giAnYS3Q3f
 wOLMAm2MErf++oLYwgIpEk82TGEBsVkEVCXmTdoNVsMrYCYxdckiVoiZmhI7vpxnArE5Bcwl
 ts35wAZiCwHVLNi7hAWiXlDi5MwnLBDz5SWat84G2ssF1NvIJnF1bR8TxCBJiYMrbrBMYOSf
 haRnFpKeBYxMqxhFMvPKchMzc4z1irMzKvMyK/SS83M3MQJDclntn8gdjN8uBB9iFOBgVOLh
 PbHof7oQa2JZcWXuIUYJDmYlEd5z5v/ShXhTEiurUovy44tKc1KLDzFKc7AoifMafStPERJI
 TyxJzU5NLUgtgskycXBKNTDWnV5UF7AvMXjjd+mZFhNN2vuuMf5+dOlV0fEPJ/m8T4U3/4sQ
 WL9r8aF3Cbw3rZV4WlJbxbkTbfLvTMwy2X+QK2FPPIfvNYOasB/XfNP/pURu37fonlu08Ftp
 d/9dddN18r6nh3512tIvrLuT+dfv0xubZ5kk9F5ITd993W+2KfeXhZUuZS1KLMUZiYZazEXF
 iQBBxk/cRQIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNLMWRmVeSWpSXmKPExsXCNUNljq5pA0OGwb9DGhanp55lsnhz5AyL
 xZP1s5gtLi1yt7i8aw6bxYS5V5ks3m+9x+jA7rFz1l12j02rOtk8di/4zOTx7baHx+dNcgGs
 UVw2Kak5mWWpRfp2CVwZW7cuYy+Yol/x7N5HtgbG72pdjJwcEgImEst2N7OC2GwCGhJ/enuZ
 QWwRATuJ7oZvYHFmgTZGiVt/fUFsYYEUiScbprCA2CwCqhLzJu0Gq+EVMJOYumQRK8RMTYkd
 X84zgdicAuYS2+Z8YAOxhYBqFuxdwgJRLyhxcuYTFoj58hLNW2czT2DkmYUkNQtJagEj0ypG
 kcy8stzEzBwzveLsjMq8zAq95PzcTYzAIFtW+2fSDsZvl90PMQpwMCrx8J5Y9D9diDWxrLgy
 9xCjBAezkgjvOfN/6UK8KYmVValF+fFFpTmpxYcYpTlYlMR5vcJTE4QE0hNLUrNTUwtSi2Cy
 TBycUg2Mdtyzjn5xrD13MjbG/OSxyVr/bGST3rxedyd8v7x1xZm9QvP5tti4Z57nbw1wD3Xs
 970swlfy2Zdz/ckHZ9auDty2/vYUxk2JgVX7Zh/RuqDm9Ebh3kHGYKvQHeYqV6LPfPB1zw25
 +XWLJ59X0c7be9bandJjlb8w2aDppX/At3K+JVG9/z+pK7EUZyQaajEXFScCANyiQO0uAgAA
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Modify the large section so that only segments with valid
 blocks are moved. Remove Migration Window Granularity by searching based on
 segment numbers instead of window search Signed-off-by: yohan.joung
 <yohan.joung@sk.com>
 --- Documentation/ABI/testing/sysfs-fs-f2fs | 8 -------- fs/f2fs/gc.c | 15
 +++++++++------ fs/f2fs/gc.h | 2 +- fs/f2fs/super.c | 5 ++--- fs/f2fs/sysfs.c
 [...] Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1u5Ged-0004ot-2w
Subject: [f2fs-dev] [PATCH v3 2/2] f2fs: Integration of migration window
 granularity with migration Granularity
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
Cc: pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Modify the large section so that only segments
with valid blocks are moved.
Remove Migration Window Granularity by searching
based on segment numbers instead of window search

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  8 --------
 fs/f2fs/gc.c                            | 15 +++++++++------
 fs/f2fs/gc.h                            |  2 +-
 fs/f2fs/super.c                         |  5 ++---
 fs/f2fs/sysfs.c                         |  7 -------
 5 files changed, 12 insertions(+), 25 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 59adb7dc6f9e..b65033730a2c 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -788,14 +788,6 @@ Description:	The zone UFS we are currently using consists of two parts:
 		blkzone_alloc_policy = 2  Prioritize writing to conventional zones
 		========================  =========================================
 
-What:		/sys/fs/f2fs/<disk>/migration_window_granularity
-Date:		September 2024
-Contact:	"Daeho Jeong" <daehojeong@google.com>
-Description:	Controls migration window granularity of garbage collection on large
-		section. it can control the scanning window granularity for GC migration
-		in a unit of segment, while migration_granularity controls the number
-		of segments which can be migrated at the same turn.
-
 What:		/sys/fs/f2fs/<disk>/reserved_segments
 Date:		September 2024
 Contact:	"Daeho Jeong" <daehojeong@google.com>
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index fcd2cf68612d..3496c1523be7 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1750,7 +1750,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 	unsigned int segno = start_segno;
 	unsigned int end_segno = start_segno + SEGS_PER_SEC(sbi);
 	unsigned int sec_end_segno;
-	unsigned int window_granularity = 1;
+	unsigned int migration_granularity = sbi->migration_granularity;
 	int seg_freed = 0, migrated = 0;
 	unsigned char type = IS_DATASEG(get_seg_entry(sbi, segno)->type) ?
 						SUM_TYPE_DATA : SUM_TYPE_NODE;
@@ -1773,29 +1773,32 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 					f2fs_usable_segs_in_sec(sbi);
 
 		if (gc_type == BG_GC || one_time) {
-			window_granularity =
-				sbi->migration_window_granularity;
 
 			if (f2fs_sb_has_blkzoned(sbi) &&
 					!has_enough_free_blocks(sbi,
 					sbi->gc_thread->boost_zoned_gc_percent))
-				window_granularity *=
+				migration_granularity *=
 					BOOST_GC_MULTIPLE;
 		}
 
+		if (gc_type == FG_GC) {
+			migration_granularity = sec_end_segno - start_segno;
+		}
+
 		if (end_segno > sec_end_segno)
 			end_segno = sec_end_segno;
 	}
 
 	sanity_check_seg_type(sbi, get_seg_entry(sbi, segno)->type);
 
+
 	for (segno = start_segno; segno < end_segno; segno++) {
 		if (!get_valid_blocks(sbi, segno, false))
 			continue;
 
 		/* readahead multi ssa blocks those have contiguous address */
 		f2fs_ra_meta_pages(sbi, GET_SUM_BLOCK(sbi, segno),
-				window_granularity, META_SSA, true);
+				migration_granularity, META_SSA, true);
 
 		/* reference all summary page */
 		sum_page = f2fs_get_sum_page(sbi, segno);
@@ -1806,7 +1809,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 		}
 		add_gc_page_entry(&gc_page_list, sum_page, segno);
 		unlock_page(sum_page);
-		if (++gc_list_count >= window_granularity)
+		if (++gc_list_count >= migration_granularity)
 			break;
 	}
 
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 9c8695efe394..5e933c2110d2 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -33,7 +33,7 @@
 
 #define LIMIT_NO_ZONED_GC	60 /* percentage over total user space of no gc for zoned devices */
 #define LIMIT_BOOST_ZONED_GC	25 /* percentage over total user space of boosted gc for zoned devices */
-#define DEF_MIGRATION_WINDOW_GRANULARITY_ZONED	3
+#define DEF_MIGRATION_GRANULARITY_ZONED	3
 #define BOOST_GC_MULTIPLE	5
 #define ZONED_PIN_SEC_REQUIRED_COUNT	1
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a3241730fe4f..775a6e3cc6a6 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3890,9 +3890,8 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
 	sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
 	sbi->max_victim_search = DEF_MAX_VICTIM_SEARCH;
-	sbi->migration_granularity = SEGS_PER_SEC(sbi);
-	sbi->migration_window_granularity = f2fs_sb_has_blkzoned(sbi) ?
-		DEF_MIGRATION_WINDOW_GRANULARITY_ZONED : SEGS_PER_SEC(sbi);
+	sbi->migration_granularity = f2fs_sb_has_blkzoned(sbi) ?
+		DEF_MIGRATION_GRANULARITY_ZONED : SEGS_PER_SEC(sbi);
 	sbi->seq_file_ra_mul = MIN_RA_MUL;
 	sbi->max_fragment_chunk = DEF_FRAGMENT_SIZE;
 	sbi->max_fragment_hole = DEF_FRAGMENT_SIZE;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index c69161366467..6a47b9c9c267 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -568,11 +568,6 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 			return -EINVAL;
 	}
 
-	if (!strcmp(a->attr.name, "migration_window_granularity")) {
-		if (t == 0 || t > SEGS_PER_SEC(sbi))
-			return -EINVAL;
-	}
-
 	if (!strcmp(a->attr.name, "gc_urgent")) {
 		if (t == 0) {
 			sbi->gc_mode = GC_NORMAL;
@@ -1085,7 +1080,6 @@ F2FS_SBI_RW_ATTR(gc_pin_file_thresh, gc_pin_file_threshold);
 F2FS_SBI_RW_ATTR(gc_reclaimed_segments, gc_reclaimed_segs);
 F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
 F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
-F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
 F2FS_SBI_GENERAL_RW_ATTR(dir_level);
 #ifdef CONFIG_F2FS_IOSTAT
 F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
@@ -1234,7 +1228,6 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(reserved_segments),
 	ATTR_LIST(max_victim_search),
 	ATTR_LIST(migration_granularity),
-	ATTR_LIST(migration_window_granularity),
 	ATTR_LIST(dir_level),
 	ATTR_LIST(ram_thresh),
 	ATTR_LIST(ra_nid_pages),
-- 
2.33.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
