Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 517DD1FB13C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2020 14:56:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlB86-0007yL-L6; Tue, 16 Jun 2020 12:55:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1jlB83-0007yC-Rr
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Jun 2020 12:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OfuMdSEXm546v9iglT/J8TXmnysB07rrBCcPtgqA94k=; b=mAl2E/7+Xcii3wfwmVRdsjuEj4
 wdypQIvkbs7rTelfeg5wuExeSdbQ8gqLLvqHZr2POMLhVVHssYeU3SJD0x2HVSW28XwvTNX+lXqNo
 tM4vxfQOpZppA/ototS/5m68JCZlnu6dPVNhzA3BFLYD5WpVlPa3PXZWCi/H7Wwg/J3Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OfuMdSEXm546v9iglT/J8TXmnysB07rrBCcPtgqA94k=; b=U
 9LmNb09/KERvDO8NGy6xXD0j+ijS1YQjLqU6fs5Vd31nqlqbb95AK1BS1j/rJ6juQSx41iHQG1w9e
 RrU6DeOf4wSY9txq3eJgT0muV9xTVZ4vbwWtBk6rpn5myistyvSb+MDAOtwoB9iVZOa1nLYV7gs8c
 SwkhtQsTZzvG5wB4=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jlB7x-005H2a-VU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Jun 2020 12:55:51 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id F227495F9AE44160EE43
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jun 2020 20:55:34 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Tue, 16 Jun 2020
 20:55:34 +0800
From: Jack Qiu <jack.qiu@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Tue, 16 Jun 2020 21:46:42 +0800
Message-ID: <20200616134642.39168-1-jack.qiu@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jlB7x-005H2a-VU
Subject: [f2fs-dev] [PATCH -next] f2fs: get the right gc victim section when
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
 fs/f2fs/gc.c      | 41 +++++++++++++++++++++++----------------
 fs/f2fs/segment.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++-
 fs/f2fs/segment.h |  6 +++++-
 3 files changed, 78 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 5b95d5a146eb..0fc5cc41a310 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -21,6 +21,11 @@
 #include "gc.h"
 #include <trace/events/f2fs.h>

+#define DIRTY_UNIT_MAP(p)	(((p)->ofs_unit > 1) ? \
+				((p)->dirty_secmap) : ((p)->dirty_segmap))
+static unsigned int count_bits(const unsigned long *addr,
+				unsigned int offset, unsigned int len);
+
 static int gc_thread_func(void *data)
 {
 	struct f2fs_sb_info *sbi = data;
@@ -192,9 +197,15 @@ static void select_policy(struct f2fs_sb_info *sbi, int gc_type,
 		p->ofs_unit = 1;
 	} else {
 		p->gc_mode = select_gc_type(sbi, gc_type);
-		p->dirty_segmap = dirty_i->dirty_segmap[DIRTY];
-		p->max_search = dirty_i->nr_dirty[DIRTY];
 		p->ofs_unit = sbi->segs_per_sec;
+		if (p->ofs_unit > 1) {
+			p->dirty_segmap = dirty_i->dirty_secmap;
+			p->max_search = count_bits(p->dirty_secmap,
+						0, MAIN_SECS(sbi));
+		} else {
+			p->dirty_segmap = dirty_i->dirty_segmap[DIRTY];
+			p->max_search = dirty_i->nr_dirty[DIRTY];
+		}
 	}

 	/*
@@ -365,10 +376,14 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 	}

 	while (1) {
-		unsigned long cost;
-		unsigned int segno;
-
-		segno = find_next_bit(p.dirty_segmap, last_segment, p.offset);
+		unsigned long cost, *dirty_bitmap;
+		unsigned int unit_no, segno;
+
+		dirty_bitmap = DIRTY_UNIT_MAP(&p);
+		unit_no = find_next_bit(dirty_bitmap,
+				last_segment / p.ofs_unit,
+				p.offset / p.ofs_unit);
+		segno = unit_no * p.ofs_unit;
 		if (segno >= last_segment) {
 			if (sm->last_victim[p.gc_mode]) {
 				last_segment =
@@ -381,14 +396,7 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
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
@@ -421,9 +429,10 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
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
index 196f31503511..60bd70a68447 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -778,6 +778,7 @@ static void __locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
 		enum dirty_type dirty_type)
 {
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
+	unsigned short valid_blocks;

 	/* need not be added */
 	if (IS_CURSEG(sbi, segno))
@@ -796,6 +797,16 @@ static void __locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
 		}
 		if (!test_and_set_bit(segno, dirty_i->dirty_segmap[t]))
 			dirty_i->nr_dirty[t]++;
+
+		valid_blocks = get_valid_blocks(sbi, segno, true);
+		if (valid_blocks == 0 || valid_blocks == sbi->blocks_per_seg *
+				sbi->segs_per_sec) {
+			f2fs_bug_on(sbi, 1);
+		} else {
+			if (!IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, segno)))
+				set_bit(GET_SEC_FROM_SEG(sbi, segno),
+						dirty_i->dirty_secmap);
+		}
 	}
 }

@@ -803,6 +814,7 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
 		enum dirty_type dirty_type)
 {
 	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
+	unsigned short valid_blocks;

 	if (test_and_clear_bit(segno, dirty_i->dirty_segmap[dirty_type]))
 		dirty_i->nr_dirty[dirty_type]--;
@@ -814,13 +826,23 @@ static void __remove_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
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
+		if (valid_blocks == 0 || valid_blocks == sbi->blocks_per_seg *
+				sbi->segs_per_sec) {
+			clear_bit(GET_SEC_FROM_SEG(sbi, segno),
+					dirty_i->dirty_secmap);
+		} else {
+			if (!IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, segno)))
+				set_bit(GET_SEC_FROM_SEG(sbi, segno),
+						dirty_i->dirty_secmap);
+		}
 	}
 }

@@ -4313,6 +4335,22 @@ static void init_dirty_segmap(struct f2fs_sb_info *sbi)
 		__locate_dirty_segment(sbi, segno, DIRTY);
 		mutex_unlock(&dirty_i->seglist_lock);
 	}
+
+	segno = 0;
+	mutex_lock(&dirty_i->seglist_lock);
+	while (1) {
+		if (segno >= MAIN_SECS(sbi))
+			break;
+		valid_blocks = get_valid_blocks(sbi, segno, true);
+		if (!(valid_blocks == 0 || valid_blocks == sbi->blocks_per_seg *
+						sbi->segs_per_sec)) {
+			if (!IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, segno)))
+				set_bit(GET_SEC_FROM_SEG(sbi, segno),
+						dirty_i->dirty_secmap);
+		}
+		segno += sbi->segs_per_sec;
+	}
+	mutex_unlock(&dirty_i->seglist_lock);
 }

 static int init_victim_secmap(struct f2fs_sb_info *sbi)
@@ -4349,6 +4387,11 @@ static int build_dirty_segmap(struct f2fs_sb_info *sbi)
 			return -ENOMEM;
 	}

+	bitmap_size = f2fs_bitmap_size(MAIN_SECS(sbi));
+	dirty_i->dirty_secmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
+	if (!dirty_i->dirty_secmap)
+		return -ENOMEM;
+
 	init_dirty_segmap(sbi);
 	return init_victim_secmap(sbi);
 }
@@ -4775,6 +4818,10 @@ static void destroy_dirty_segmap(struct f2fs_sb_info *sbi)
 	for (i = 0; i < NR_DIRTY_TYPE; i++)
 		discard_dirty_segmap(sbi, i);

+	mutex_lock(&dirty_i->seglist_lock);
+	kvfree(dirty_i->dirty_secmap);
+	mutex_unlock(&dirty_i->seglist_lock);
+
 	destroy_victim_secmap(sbi);
 	SM_I(sbi)->dirty_info = NULL;
 	kvfree(dirty_i);
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index cba16cca5189..5037c4f54be2 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -166,7 +166,10 @@ enum {
 struct victim_sel_policy {
 	int alloc_mode;			/* LFS or SSR */
 	int gc_mode;			/* GC_CB or GC_GREEDY */
-	unsigned long *dirty_segmap;	/* dirty segment bitmap */
+	union {
+		unsigned long *dirty_segmap;	/* dirty segment bitmap */
+		unsigned long *dirty_secmap;	/* dirty section bitmap */
+	};
 	unsigned int max_search;	/* maximum # of segments to search */
 	unsigned int offset;		/* last scanned bitmap offset */
 	unsigned int ofs_unit;		/* bitmap search unit */
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
