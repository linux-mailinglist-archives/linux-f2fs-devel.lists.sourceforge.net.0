Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F84E1FE99A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 05:46:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jllVT-00032H-DZ; Thu, 18 Jun 2020 03:46:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1jllVS-000323-9z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 03:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KGHW34GopcTv8qLabprOiEJJyBwdFv81TVK4jXSJXAc=; b=HIFyXbv4gvQ3ZyoGGkO+0+YYnc
 b1zPczYOH4jfbTb2Khm4ppkUOZDAhAfpjo/fknHsLnRVYOmPj1t3YIwzoDL5eJs4ETx3+PWIlubtp
 8ApM9KalmCfJGfkZhwoDRILhye7dOxlu3Y5hx55AW+Qo580wCJ9xhW6Cp7FcM/hvT7k0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KGHW34GopcTv8qLabprOiEJJyBwdFv81TVK4jXSJXAc=; b=J
 dYt34dVgV22DuvjoTOScAL7S0r92UtsUDc3x11X8Yosm4biMtz4maIZId9u+7YxkHftcAOIA3i1IX
 jQZ16iZATB8diCyiShW9wXtAyomd0XGONJdVgFP8BZIWO0o+8ALVuEId3DZI+BL3vt18J7gjdhHGQ
 DvFbyrJwuHgm96Co=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jllVP-0077cx-L4
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 03:46:26 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 080D55406C0881B7B1AF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 Jun 2020 11:46:08 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Thu, 18 Jun 2020
 11:46:03 +0800
From: Jack Qiu <jack.qiu@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Thu, 18 Jun 2020 12:37:10 +0800
Message-ID: <20200618043710.35938-1-jack.qiu@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jllVP-0077cx-L4
Subject: [f2fs-dev] [PATCH v2] f2fs: get the right gc victim section when
 section has several segments
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

Assume each section has 4 segment:
     .___________________________.
     |_Segment0_|_..._|_Segment3_|
     .                          .
     .                  .
     .__________.
     |_section0_|

Segment 0~2 has 0 valid block, segment 3 has 512 valid blocks.
It will fail if we want to gc section0 in this scenes,
because all 4 segments in section0 is not dirty.
So we should use dirty section bitmap instead of dirty segment bitmap
to get right victim section.

Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
---
 fs/f2fs/gc.c      | 41 ++++++++++++++++++-------------
 fs/f2fs/segment.c | 61 +++++++++++++++++++++++++++++++++++++++++++++--
 fs/f2fs/segment.h |  8 +++++--
 3 files changed, 89 insertions(+), 21 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 5b95d5a146eb..9b6fc61ce649 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -21,6 +21,9 @@
 #include "gc.h"
 #include <trace/events/f2fs.h>

+static unsigned int count_bits(const unsigned long *addr,
+				unsigned int offset, unsigned int len);
+
 static int gc_thread_func(void *data)
 {
 	struct f2fs_sb_info *sbi = data;
@@ -187,14 +190,20 @@ static void select_policy(struct f2fs_sb_info *sbi, int gc_type,

 	if (p->alloc_mode == SSR) {
 		p->gc_mode = GC_GREEDY;
-		p->dirty_segmap = dirty_i->dirty_segmap[type];
+		p->dirty_bitmap = dirty_i->dirty_segmap[type];
 		p->max_search = dirty_i->nr_dirty[type];
 		p->ofs_unit = 1;
 	} else {
 		p->gc_mode = select_gc_type(sbi, gc_type);
-		p->dirty_segmap = dirty_i->dirty_segmap[DIRTY];
-		p->max_search = dirty_i->nr_dirty[DIRTY];
 		p->ofs_unit = sbi->segs_per_sec;
+		if (__is_large_section(sbi)) {
+			p->dirty_bitmap = dirty_i->dirty_secmap;
+			p->max_search = count_bits(p->dirty_bitmap,
+						0, MAIN_SECS(sbi));
+		} else {
+			p->dirty_bitmap = dirty_i->dirty_segmap[DIRTY];
+			p->max_search = dirty_i->nr_dirty[DIRTY];
+		}
 	}

 	/*
@@ -365,10 +374,14 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 	}

 	while (1) {
-		unsigned long cost;
-		unsigned int segno;
-
-		segno = find_next_bit(p.dirty_segmap, last_segment, p.offset);
+		unsigned long cost, *dirty_bitmap;
+		unsigned int unit_no, segno;
+
+		dirty_bitmap = p.dirty_bitmap;
+		unit_no = find_next_bit(dirty_bitmap,
+				last_segment / p.ofs_unit,
+				p.offset / p.ofs_unit);
+		segno = unit_no * p.ofs_unit;
 		if (segno >= last_segment) {
 			if (sm->last_victim[p.gc_mode]) {
 				last_segment =
@@ -381,14 +394,7 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 		}

 		p.offset = segno + p.ofs_unit;
-		if (p.ofs_unit > 1) {
-			p.offset -= segno % p.ofs_unit;
-			nsearched += count_bits(p.dirty_segmap,
-						p.offset - p.ofs_unit,
-						p.ofs_unit);
-		} else {
-			nsearched++;
-		}
+		nsearched++;

 #ifdef CONFIG_F2FS_CHECK_FS
 		/*
@@ -421,9 +427,10 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 next:
 		if (nsearched >= p.max_search) {
 			if (!sm->last_victim[p.gc_mode] && segno <= last_victim)
-				sm->last_victim[p.gc_mode] = last_victim + 1;
+				sm->last_victim[p.gc_mode] =
+					last_victim + p.ofs_unit;
 			else
-				sm->last_victim[p.gc_mode] = segno + 1;
+				sm->last_victim[p.gc_mode] = segno + p.ofs_unit;
 			sm->last_victim[p.gc_mode] %=
 				(MAIN_SECS(sbi) * sbi->segs_per_sec);
 			break;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 196f31503511..66eeaba30e91 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -796,6 +796,18 @@ static void __locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
 		}
 		if (!test_and_set_bit(segno, dirty_i->dirty_segmap[t]))
 			dirty_i->nr_dirty[t]++;
+
+		if (__is_large_section(sbi)) {
+			unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
+			unsigned short valid_blocks =
+				get_valid_blocks(sbi, segno, true);
+
+			f2fs_bug_on(sbi, unlikely(!valid_blocks ||
+					valid_blocks == BLKS_PER_SEC(sbi)));
+
+			if (!IS_CURSEC(sbi, secno))
+				set_bit(secno, dirty_i->dirty_secmap);
+		}
 	}
 }

@@ -803,6 +815,7 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
 		enum dirty_type dirty_type)
 {
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
+	unsigned short valid_blocks;

 	if (test_and_clear_bit(segno, dirty_i->dirty_segmap[dirty_type]))
 		dirty_i->nr_dirty[dirty_type]--;
@@ -814,13 +827,26 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
 		if (test_and_clear_bit(segno, dirty_i->dirty_segmap[t]))
 			dirty_i->nr_dirty[t]--;

-		if (get_valid_blocks(sbi, segno, true) == 0) {
+		valid_blocks = get_valid_blocks(sbi, segno, true);
+		if (valid_blocks == 0) {
 			clear_bit(GET_SEC_FROM_SEG(sbi, segno),
 						dirty_i->victim_secmap);
 #ifdef CONFIG_F2FS_CHECK_FS
 			clear_bit(segno, SIT_I(sbi)->invalid_segmap);
 #endif
 		}
+		if (__is_large_section(sbi)) {
+			unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
+
+			if (!valid_blocks ||
+					valid_blocks == BLKS_PER_SEC(sbi)) {
+				clear_bit(secno, dirty_i->dirty_secmap);
+				return;
+			}
+
+			if (!IS_CURSEC(sbi, secno))
+				set_bit(secno, dirty_i->dirty_secmap);
+		}
 	}
 }

@@ -4293,8 +4319,9 @@ static void init_dirty_segmap(struct f2fs_sb_info *sbi)
 {
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
 	struct free_segmap_info *free_i = FREE_I(sbi);
-	unsigned int segno = 0, offset = 0;
+	unsigned int segno = 0, offset = 0, secno;
 	unsigned short valid_blocks;
+	unsigned short blks_per_sec = BLKS_PER_SEC(sbi);

 	while (1) {
 		/* find dirty segment based on free segmap */
@@ -4313,6 +4340,22 @@ static void init_dirty_segmap(struct f2fs_sb_info *sbi)
 		__locate_dirty_segment(sbi, segno, DIRTY);
 		mutex_unlock(&dirty_i->seglist_lock);
 	}
+
+	if (!__is_large_section(sbi))
+		return;
+
+	mutex_lock(&dirty_i->seglist_lock);
+	for (segno = 0; segno < MAIN_SECS(sbi); segno += blks_per_sec) {
+		valid_blocks = get_valid_blocks(sbi, segno, true);
+		secno = GET_SEC_FROM_SEG(sbi, segno);
+
+		if (!valid_blocks || valid_blocks == blks_per_sec)
+			continue;
+		if (IS_CURSEC(sbi, secno))
+			continue;
+		set_bit(secno, dirty_i->dirty_secmap);
+	}
+	mutex_unlock(&dirty_i->seglist_lock);
 }

 static int init_victim_secmap(struct f2fs_sb_info *sbi)
@@ -4349,6 +4392,14 @@ static int build_dirty_segmap(struct f2fs_sb_info *sbi)
 			return -ENOMEM;
 	}

+	if (__is_large_section(sbi)) {
+		bitmap_size = f2fs_bitmap_size(MAIN_SECS(sbi));
+		dirty_i->dirty_secmap = f2fs_kvzalloc(sbi,
+						bitmap_size, GFP_KERNEL);
+		if (!dirty_i->dirty_secmap)
+			return -ENOMEM;
+	}
+
 	init_dirty_segmap(sbi);
 	return init_victim_secmap(sbi);
 }
@@ -4775,6 +4826,12 @@ static void destroy_dirty_segmap(struct f2fs_sb_info *sbi)
 	for (i = 0; i < NR_DIRTY_TYPE; i++)
 		discard_dirty_segmap(sbi, i);

+	if (__is_large_section(sbi)) {
+		mutex_lock(&dirty_i->seglist_lock);
+		kvfree(dirty_i->dirty_secmap);
+		mutex_unlock(&dirty_i->seglist_lock);
+	}
+
 	destroy_victim_secmap(sbi);
 	SM_I(sbi)->dirty_info = NULL;
 	kvfree(dirty_i);
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index cba16cca5189..f261e3e6a69b 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -166,8 +166,11 @@ enum {
 struct victim_sel_policy {
 	int alloc_mode;			/* LFS or SSR */
 	int gc_mode;			/* GC_CB or GC_GREEDY */
-	unsigned long *dirty_segmap;	/* dirty segment bitmap */
-	unsigned int max_search;	/* maximum # of segments to search */
+	unsigned long *dirty_bitmap;	/* dirty segment/section bitmap */
+	unsigned int max_search;	/*
+					 * maximum # of segments/sections
+					 * to search
+					 */
 	unsigned int offset;		/* last scanned bitmap offset */
 	unsigned int ofs_unit;		/* bitmap search unit */
 	unsigned int min_cost;		/* minimum cost */
@@ -266,6 +269,7 @@ enum dirty_type {
 struct dirty_seglist_info {
 	const struct victim_selection *v_ops;	/* victim selction operation */
 	unsigned long *dirty_segmap[NR_DIRTY_TYPE];
+	unsigned long *dirty_secmap;
 	struct mutex seglist_lock;		/* lock for segment bitmaps */
 	int nr_dirty[NR_DIRTY_TYPE];		/* # of dirty segments */
 	unsigned long *victim_secmap;		/* background GC victims */
--
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
