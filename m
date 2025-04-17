Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12995A9122E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Apr 2025 06:15:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u5Ged-0008Tf-18;
	Thu, 17 Apr 2025 04:15:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1u5Geb-0008TN-00
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Apr 2025 04:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FhoD33BtPjt75fGQ2zE0hfIqCCZKsY/M+DhCStceSMo=; b=CZPpVD3ouuALgAZNvgDiilKRjP
 pyF6xDBFU9CfQHfvX7M5NIgaLbjZ/sPvh3rhku+8ZQZFVLvoIVQ2NI/vag+skdg6lolq/KL2eX16c
 VhwLhcwHYeq/AEDKE9VdBrIKmqCZLCv/KJCkZFMWrxDPTYCgXzrhQsNie4XfpkvHwSjE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FhoD33BtPjt75fGQ2zE0hfIqCCZKsY/M+DhCStceSMo=; b=G
 GdlXe5374EuGq2ZxvzHx5T6Ti+s1JN8wHafpaVKVOxMUp8Zh5ELSpHqGsRVD/o20JqiUiSv2uqep3
 uQFtfndf0ZBezY+gu8UP5ORgFbGdKEn23n7rsrTXmW0ZdaHcHfUOscYM1vXB8S7VLAGQPYu3cvDIn
 M/6lRuJxd5UiANeA=;
Received: from exvmail3.skhynix.com ([166.125.252.90]
 helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1u5GeK-0004ot-9C for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Apr 2025 04:15:09 +0000
X-AuditID: a67dfc59-03fff7000000aab6-4a-680080301993
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daeho43@gmail.com
Date: Thu, 17 Apr 2025 13:14:26 +0900
Message-ID: <20250417041429.2060-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJLMWRmVeSWpSXmKPExsXC9ZZnka5BA0OGwd2nEhanp55lsnhz5AyL
 xZP1s5gtLi1yt7i8aw6bA6vHzll32T02repk89i94DOTx+dNcgEsUVw2Kak5mWWpRfp2CVwZ
 px7MZS/46FzxafYb9gbG5+ZdjJwcEgImEivWv2aFsRsu7WQDsdkENCT+9PYyg9giAnYS3Q3f
 wGqYBdoYJW799QWxhQXCJfaeWMcEYrMIqErMO7+THcTmFTCTuLlgCxvETE2JHV/OM0HEBSVO
 znzCAjFHXqJ562xmiJqXrBJrzutD2JISB1fcYJnAyDsLScssJC0LGJlWMYpk5pXlJmbmGOsV
 Z2dU5mVW6CXn525iBAbYsto/kTsYv10IPsQowMGoxMN7YtH/dCHWxLLiytxDjBIczEoivOfM
 /6UL8aYkVlalFuXHF5XmpBYfYpTmYFES5zX6Vp4iJJCeWJKanZpakFoEk2Xi4JRqYGQOe3VC
 pC72ZmmGm1bRG0YNkxbH/M2c1+as2f6kTelwq4r5th+Lj88+o6e2vTaiLUXN+vltsZqLsq47
 3nCrl7bIx2zYxhDgGnz18tmr0/n3vwnpiL0+5+qlN6tmSq/psPxQGM0beXny+QU31B35lNUP
 nH3HccyAIb1vi+ghEZEu5hUbNrldD1ZiKc5INNRiLipOBADayiV0LAIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmluLIzCtJLcpLzFFi42LhmqEyR9eggSHD4N4RbovTU88yWbw5cobF
 4sn6WcwWlxa5W1zeNYfNYsLcq0wW77feY3Rg99g56y67x6ZVnWweuxd8ZvL4dtvD4/MmuQDW
 KC6blNSczLLUIn27BK6MUw/mshd8dK74NPsNewPjc/MuRk4OCQETiYZLO9lAbDYBDYk/vb3M
 ILaIgJ1Ed8M3VhCbWaCNUeLWX18QW1ggXGLviXVMIDaLgKrEvPM72UFsXgEziZsLtrBBzNSU
 2PHlPBNEXFDi5MwnLBBz5CWat85mnsDINQtJahaS1AJGplWMIpl5ZbmJmTlmesXZGZV5mRV6
 yfm5mxiBQbOs9s+kHYzfLrsfYhTgYFTi4T2x6H+6EGtiWXFl7iFGCQ5mJRHec+b/0oV4UxIr
 q1KL8uOLSnNSiw8xSnOwKInzeoWnJggJpCeWpGanphakFsFkmTg4pRoYBQ/NK5i18NjLDX/n
 8Dy1iAjbfeIHrxU7r5HSZmmDj9J8mt8i7siztX1jC1fX58x83iXidv3C3WPVgp4MX0Wr9TwX
 aNXJTMn7LlM75cfNlB1zJeaY7Pl0ul753N//SmUXZLfISnz7vzghhfXAz8rzDyMezost2L6B
 dcvy9Nd7ThWY/eVdfEfZXImlOCPRUIu5qDgRAIQAT8EWAgAA
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1u5GeK-0004ot-9C
Subject: [f2fs-dev] [PATCH v3 1/2] f2fs: Improve large section GC by
 locating valid block segments
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
 fs/f2fs/gc.c    | 89 +++++++++++++++++++++++++++++++++++++------------
 fs/f2fs/gc.h    |  6 ++++
 fs/f2fs/super.c |  8 ++++-
 4 files changed, 82 insertions(+), 23 deletions(-)

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
index 2b8f9239bede..fcd2cf68612d 100644
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
@@ -1838,15 +1866,20 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 		if (__is_large_section(sbi))
 			sbi->next_victim_seg[gc_type] =
 				(segno + 1 < sec_end_segno) ?
-					segno + 1 : NULL_SEGNO;
+				segno + 1 : NULL_SEGNO;
+
 skip:
 		f2fs_put_page(sum_page, 0);
 	}
 
+	if (__is_large_section(sbi) && list_empty(&gc_page_list))
+		sbi->next_victim_seg[gc_type] = NULL_SEGNO;
+
 	if (submitted)
 		f2fs_submit_merged_write(sbi, data_type);
 
 	blk_finish_plug(&plug);
+	release_gc_page_entry(&gc_page_list, false);
 
 	if (migrated)
 		stat_inc_gc_sec_count(sbi, data_type, gc_type);
@@ -2008,6 +2041,18 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
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
