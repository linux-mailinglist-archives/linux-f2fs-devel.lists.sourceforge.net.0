Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6780A72BC4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Mar 2025 09:47:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txit3-0002g0-BW;
	Thu, 27 Mar 2025 08:46:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1txit1-0002fs-Ng
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 08:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O+kfAP0qRNLKd+WKIrXacRaDyUxeaXQlGI1pWFWooao=; b=dTQDP8507xAocYtK8wx12Ts7HD
 0wKwy2AhpjvjD8g9D2EeXwzNJ93ItlfHXOy6N+VqtHSMt7rEpDL3cq7tGIxUJvL/ckevt8lq1MhHF
 c0Oie8Ck1v4u5c9hUCk1mbS3qBBf2b16b+/xcuM8+zFiLcl0Hlzwckr5T2+HFEGRk3iM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=O+kfAP0qRNLKd+WKIrXacRaDyUxeaXQlGI1pWFWooao=; b=V
 rS4sn6Mj3ga3/zFqeKWgYclaUFkicwDH0/NCg4q4zsndIqCtz6OHQ4z5QMaVfLGf7j9uF1ztMDFd6
 vL5E9326jpjm0wSIlaQxno+NO7/EKshyUMJn/DzFpKZRfYcnNc7qQYrSMy3RcUJiExlTep416BP/a
 0xTXSel1jRIKndcw=;
Received: from exvmail3.hynix.com ([166.125.252.90] helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1txiso-0004mN-I9 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Mar 2025 08:46:51 +0000
X-AuditID: a67dfc59-03fff7000000aab6-97-67e51060ba89
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daeho43@gmail.com
Date: Thu, 27 Mar 2025 17:46:19 +0900
Message-ID: <20250327084620.2152-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFLMWRmVeSWpSXmKPExsXC9ZZnoW6ywNN0g193xSxOTz3LZPHmyBkW
 iyfrZzFbXFrkbnF51xw2B1aPnbPusntsWtXJ5rF7wWcmj8+b5AJYorhsUlJzMstSi/TtErgy
 fk/oZy047VLR/ruBuYFxpUUXIyeHhICJxIEFb5hg7DWHf7GD2GwCGhJ/enuZQWwRATuJ7oZv
 rCA2s0Abo8Stv74gtrBAsMTqZUsYQWwWAVWJ7yeXsYDYvAJmEj1zvjFCzNSU2PHlPBNEXFDi
 5MwnLBBz5CWat84Gms8FVPOSVWLd106oBkmJgytusExg5J2FpGcWkp4FjEyrGEUy88pyEzNz
 jPWKszMq8zIr9JLzczcxAkNsWe2fyB2M3y4EH2IU4GBU4uFN4HiSLsSaWFZcmXuIUYKDWUmE
 V/IKUIg3JbGyKrUoP76oNCe1+BCjNAeLkjiv0bfyFCGB9MSS1OzU1ILUIpgsEwenVANjnJ7F
 70merNl7p1l3Sax9o3BY4Nra6faGGjlb73yQttrsusz+VPDp6osXGSdtPD7HKMtMd3+5prDQ
 RGblFJWNthU1XTdLP4rVib0vabld+XxzxIGSXF5b83V23f3KqsYi73033Z3/46qhoO1+6UUS
 DGq9RvJctxaFb5ijt5l5Umt9ofOHjzpKLMUZiYZazEXFiQBuKQn8LQIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmluLIzCtJLcpLzFFi42LhmqEyRzdB4Gm6wY6XKhanp55lsnhz5AyL
 xZP1s5gtLi1yt7i8aw6bxYS5V5ks3m+9x+jA7rFz1l12j02rOtk8di/4zOTx7baHx+dNcgGs
 UVw2Kak5mWWpRfp2CVwZvyf0sxacdqlo/93A3MC40qKLkZNDQsBEYs3hX+wgNpuAhsSf3l5m
 EFtEwE6iu+EbK4jNLNDGKHHrry+ILSwQLLF62RJGEJtFQFXi+8llLCA2r4CZRM+cb4wQMzUl
 dnw5zwQRF5Q4OfMJC8QceYnmrbOZJzByzUKSmoUktYCRaRWjSGZeWW5iZo6ZXnF2RmVeZoVe
 cn7uJkZg0Cyr/TNpB+O3y+6HGAU4GJV4eBM4nqQLsSaWFVfmHmKU4GBWEuGVvAIU4k1JrKxK
 LcqPLyrNSS0+xCjNwaIkzusVnpogJJCeWJKanZpakFoEk2Xi4JRqYGR49Y9ZVThSUbJ0hU+I
 9dW9J68dW2/hcuqPwfLiPLNiI1afXa9f/zj9VOb1Kn7umb2u0jw1bTEGj0+e7ubbYto+s+16
 57nLpl8nc61oUjTIt5x+60HBbIGvUXK3rQ4lbPgwLWLuNvtVpbOUQrtPNnzczifq3clQcnbR
 vUt96onLM6TXKewyrVdiKc5INNRiLipOBABSSsJVFgIAAA==
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Change the large section GC to locate valid block segments
 instead of performing a sequential search. This modification enhances
 performance
 by reducing unnecessary block scanning in large storage sec [...] 
 Content analysis details:   (0.0 points, 6.0 required)
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1txiso-0004mN-I9
Subject: [f2fs-dev] [PATCH v1] f2fs: Improve large section GC by locating
 valid block segments
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

Change the large section GC to locate valid block segments instead of
performing a sequential search. This modification enhances performance
by reducing unnecessary block scanning in large storage sections.

example :
[invalid seg 0] [invalid seg 1] [invalid seg 2]
[  valid seg 3] [  valid seg 4] [  valid seg 5]

Current: In the first GC, nothing is moved,
but in the second GC, segments 3, 4, and 5 are moved.
Change: In the first GC, segments 3, 4, and 5 are moved.

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 fs/f2fs/f2fs.h  |  2 ++
 fs/f2fs/gc.c    | 92 +++++++++++++++++++++++++++++++++++--------------
 fs/f2fs/gc.h    |  6 ++++
 fs/f2fs/super.c |  8 ++++-
 4 files changed, 82 insertions(+), 26 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f1576dc6ec67..348417edac25 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4008,6 +4008,8 @@ int f2fs_gc_range(struct f2fs_sb_info *sbi,
 int f2fs_resize_fs(struct file *filp, __u64 block_count);
 int __init f2fs_create_garbage_collection_cache(void);
 void f2fs_destroy_garbage_collection_cache(void);
+int __init f2fs_init_garbage_collection_summary_cache(void);
+void f2fs_destroy_garbage_collection_summary_cache(void);
 /* victim selection function for cleaning and SSR */
 int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
 			int gc_type, int type, char alloc_mode,
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 2b8f9239bede..3b63e85fa038 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -24,6 +24,7 @@
 #include <trace/events/f2fs.h>
 
 static struct kmem_cache *victim_entry_slab;
+static struct kmem_cache *gc_page_entry_slab;
 
 static unsigned int count_bits(const unsigned long *addr,
 				unsigned int offset, unsigned int len);
@@ -711,6 +712,30 @@ static void release_victim_entry(struct f2fs_sb_info *sbi)
 	f2fs_bug_on(sbi, !list_empty(&am->victim_list));
 }
 
+static struct gc_page_entry *add_gc_page_entry(struct list_head *gc_page_list,
+					struct page *sum_page, unsigned int segno)
+{
+	struct gc_page_entry *gpe;
+
+	gpe = f2fs_kmem_cache_alloc(gc_page_entry_slab, GFP_NOFS, true, NULL);
+	gpe->segno = segno;
+	gpe->sum_page = sum_page;
+	list_add_tail(&gpe->list, gc_page_list);
+	return gpe;
+}
+
+static void release_gc_page_entry(struct list_head *gc_page_list, bool putpage)
+{
+	struct gc_page_entry *gpe, *tmp;
+
+	list_for_each_entry_safe(gpe, tmp, gc_page_list, list) {
+		if (putpage)
+			f2fs_put_page(gpe->sum_page, 0);
+		list_del(&gpe->list);
+		kmem_cache_free(gc_page_entry_slab, gpe);
+	}
+}
+
 static bool f2fs_pin_section(struct f2fs_sb_info *sbi, unsigned int segno)
 {
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
@@ -1721,14 +1746,18 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 	struct page *sum_page;
 	struct f2fs_summary_block *sum;
 	struct blk_plug plug;
+	struct gc_page_entry *gpe;
 	unsigned int segno = start_segno;
 	unsigned int end_segno = start_segno + SEGS_PER_SEC(sbi);
 	unsigned int sec_end_segno;
+	unsigned int window_granularity = 1;
 	int seg_freed = 0, migrated = 0;
 	unsigned char type = IS_DATASEG(get_seg_entry(sbi, segno)->type) ?
 						SUM_TYPE_DATA : SUM_TYPE_NODE;
 	unsigned char data_type = (type == SUM_TYPE_DATA) ? DATA : NODE;
 	int submitted = 0;
+	int gc_list_count = 0;
+	LIST_HEAD(gc_page_list);
 
 	if (__is_large_section(sbi)) {
 		sec_end_segno = rounddown(end_segno, SEGS_PER_SEC(sbi));
@@ -1744,7 +1773,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 					f2fs_usable_segs_in_sec(sbi);
 
 		if (gc_type == BG_GC || one_time) {
-			unsigned int window_granularity =
+			window_granularity =
 				sbi->migration_window_granularity;
 
 			if (f2fs_sb_has_blkzoned(sbi) &&
@@ -1752,8 +1781,6 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 					sbi->gc_thread->boost_zoned_gc_percent))
 				window_granularity *=
 					BOOST_GC_MULTIPLE;
-
-			end_segno = start_segno + window_granularity;
 		}
 
 		if (end_segno > sec_end_segno)
@@ -1762,37 +1789,38 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 
 	sanity_check_seg_type(sbi, get_seg_entry(sbi, segno)->type);
 
-	/* readahead multi ssa blocks those have contiguous address */
-	if (__is_large_section(sbi))
+	for (segno = start_segno; segno < end_segno; segno++) {
+		if (!get_valid_blocks(sbi, segno, false))
+			continue;
+
+		/* readahead multi ssa blocks those have contiguous address */
 		f2fs_ra_meta_pages(sbi, GET_SUM_BLOCK(sbi, segno),
-					end_segno - segno, META_SSA, true);
+				window_granularity, META_SSA, true);
 
-	/* reference all summary page */
-	while (segno < end_segno) {
-		sum_page = f2fs_get_sum_page(sbi, segno++);
+		/* reference all summary page */
+		sum_page = f2fs_get_sum_page(sbi, segno);
 		if (IS_ERR(sum_page)) {
 			int err = PTR_ERR(sum_page);
-
-			end_segno = segno - 1;
-			for (segno = start_segno; segno < end_segno; segno++) {
-				sum_page = find_get_page(META_MAPPING(sbi),
-						GET_SUM_BLOCK(sbi, segno));
-				f2fs_put_page(sum_page, 0);
-				f2fs_put_page(sum_page, 0);
-			}
+			release_gc_page_entry(&gc_page_list, true);
 			return err;
 		}
+		add_gc_page_entry(&gc_page_list, sum_page, segno);
 		unlock_page(sum_page);
+		if (++gc_list_count >= window_granularity)
+			break;
 	}
 
 	blk_start_plug(&plug);
 
-	for (segno = start_segno; segno < end_segno; segno++) {
+	list_for_each_entry(gpe, &gc_page_list, list) {
 
 		/* find segment summary of victim */
-		sum_page = find_get_page(META_MAPPING(sbi),
-					GET_SUM_BLOCK(sbi, segno));
-		f2fs_put_page(sum_page, 0);
+		sum_page = gpe->sum_page;
+		segno = gpe->segno;
+		if (!sum_page) {
+			f2fs_err(sbi, "Failed to get summary page for segment %u", segno);
+			goto skip;
+		}
 
 		if (get_valid_blocks(sbi, segno, false) == 0)
 			goto freed;
@@ -1835,18 +1863,20 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 				get_valid_blocks(sbi, segno, false) == 0)
 			seg_freed++;
 
-		if (__is_large_section(sbi))
-			sbi->next_victim_seg[gc_type] =
-				(segno + 1 < sec_end_segno) ?
-					segno + 1 : NULL_SEGNO;
 skip:
 		f2fs_put_page(sum_page, 0);
 	}
 
+	if (__is_large_section(sbi) && !list_empty(&gc_page_list))
+		sbi->next_victim_seg[gc_type] =
+			(segno + 1 < sec_end_segno) ?
+				segno + 1 : NULL_SEGNO;
+
 	if (submitted)
 		f2fs_submit_merged_write(sbi, data_type);
 
 	blk_finish_plug(&plug);
+	release_gc_page_entry(&gc_page_list, false);
 
 	if (migrated)
 		stat_inc_gc_sec_count(sbi, data_type, gc_type);
@@ -2008,6 +2038,18 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 	return ret;
 }
 
+int __init f2fs_init_garbage_collection_summary_cache(void)
+{
+	gc_page_entry_slab = f2fs_kmem_cache_create("f2fs_gc_page_entry",
+					sizeof(struct gc_page_entry));
+	return gc_page_entry_slab ? 0 : -ENOMEM;
+}
+
+void f2fs_destroy_garbage_collection_summary_cache(void)
+{
+	kmem_cache_destroy(gc_page_entry_slab);
+}
+
 int __init f2fs_create_garbage_collection_cache(void)
 {
 	victim_entry_slab = f2fs_kmem_cache_create("f2fs_victim_entry",
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 5c1eaf55e127..9c8695efe394 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -82,6 +82,12 @@ struct victim_entry {
 	struct list_head list;
 };
 
+struct gc_page_entry {
+	unsigned int segno;
+	struct page *sum_page;
+	struct list_head list;
+};
+
 /*
  * inline functions
  */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f087b2b71c89..a3241730fe4f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5090,9 +5090,12 @@ static int __init init_f2fs_fs(void)
 	err = f2fs_create_garbage_collection_cache();
 	if (err)
 		goto free_extent_cache;
-	err = f2fs_init_sysfs();
+	err = f2fs_init_garbage_collection_summary_cache();
 	if (err)
 		goto free_garbage_collection_cache;
+	err = f2fs_init_sysfs();
+	if (err)
+		goto free_garbage_collection_summary_cache;
 	err = f2fs_init_shrinker();
 	if (err)
 		goto free_sysfs;
@@ -5141,6 +5144,8 @@ static int __init init_f2fs_fs(void)
 	f2fs_exit_shrinker();
 free_sysfs:
 	f2fs_exit_sysfs();
+free_garbage_collection_summary_cache:
+	f2fs_destroy_garbage_collection_summary_cache();
 free_garbage_collection_cache:
 	f2fs_destroy_garbage_collection_cache();
 free_extent_cache:
@@ -5172,6 +5177,7 @@ static void __exit exit_f2fs_fs(void)
 	f2fs_destroy_root_stats();
 	f2fs_exit_shrinker();
 	f2fs_exit_sysfs();
+	f2fs_destroy_garbage_collection_summary_cache();
 	f2fs_destroy_garbage_collection_cache();
 	f2fs_destroy_extent_cache();
 	f2fs_destroy_recovery_cache();
-- 
2.33.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
