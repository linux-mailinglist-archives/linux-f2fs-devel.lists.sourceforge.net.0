Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2820921290F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Jul 2020 18:10:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jr1mv-0001Rt-Us; Thu, 02 Jul 2020 16:10:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=44573aa05=aravind.ramesh@wdc.com>)
 id 1jr1mt-0001Rh-Cy
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jul 2020 16:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dcJBJa0J6upSMT1iRBzduxs3Ya2kI3x2Kf48u8yTaPo=; b=cJwRtzCbDaed86hdzihGeDpbbG
 2h/t5stt4jMWFiqDFjEJi1zt6VzaDsRAG9YrcijS8AJedmRXaJOBrVNQQmrxTJB4/UaptJG9dYilR
 1P3DpBUjqSieWM4U1U22U1trVZTUFstiQ1CmL8ls/6vluMmu0bRQTDLCq9OJJ2I3WLjE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dcJBJa0J6upSMT1iRBzduxs3Ya2kI3x2Kf48u8yTaPo=; b=G4rcZj/4Mi6/k1GPsaqSR2r7Cv
 iOHMqEoJVOCxLjBOGoCHZEBrVH8JYwt4oGKLSXnr2C36oloK9GEWKEbT+TzJYbkSLeFA42cAuWQtU
 UJ147beKPgRelSCHtHmce26rUxlZhULlN4HaduEjUPxTLm5c0HwaUK5+up4NxwvJFE/g=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jr1mr-005v6l-Ot
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jul 2020 16:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593706209; x=1625242209;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IHRyrIz6GxQBsuErDsYPAbtoMwRL9k6kecW6G3me+2Y=;
 b=m2G30JkJe/ht4Y/mfhveLtHPDPmFjZMO0gnfdD9HrjP1Kv1RnJ2kIVMe
 fXhdXE57So/CmyWA2xo5Of1jAhUS3EBHBT33/xc4X5w3JjMj3/7TtaqX/
 89FUra3pZ7tmpSH+/Re59RpJwjxw8eamO2yqgjhBQ8O+nk6m02ToK+BwD
 ckDuduuY4B7CDatuSaVLRpWFXSHiIPK/fCIJzJT9pwigNgZzwQ/6oy/n/
 kx5Fj7RYNR/JzY9alqUVJi+bSHAHQwDvxk9cIrRdTVdEv7GU2CXAp00bu
 KxmLt3Ii0xeujBZTolyXsNTU5/wYlzW1LuXlBNtwiq+tFBXdoj8KtU9P9 Q==;
IronPort-SDR: hH4+QASuH5TRqZLW+tuWqwHvLQd70CWemPvIRVmq0g9T6abJE9MqSTzzimj0LSLibS2BAwuprw
 s45ftrPMuxq7JD4BB4SWXvXUw28qm9K8H/gti4i0IdoHv1wfli0h7f1xX6rq1l0Y1UA/QXBNtj
 ny9BPH4Dts9pA/0bznXG+iDPsH5AoJ0NbWW0E4QyM7XFSW4ug6fzgWN85K7V1j+OC32tNY/uiX
 U6CwKEcbArpLLJcRmh84YyKzo3MBb+l8/P/5LCJBEECQA9K5rL/zHGuQ3kdcaYNdjp63Z8V1mU
 gPY=
X-IronPort-AV: E=Sophos;i="5.75,304,1589212800"; d="scan'208";a="145822132"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Jul 2020 23:54:23 +0800
IronPort-SDR: cVDrFdG7MqruOxAmNy8mSGyLBB0P/ZuwapirvWFt6nPVzY+MJQcqsHXdsb1VSWVc8nDdi/4j6l
 7EdJG1qbW7M/39sQQKmIb3gyAcqLDGafA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 08:42:37 -0700
IronPort-SDR: ED5HLVy8RVczq73n8ic6g4m/5FutSyuPB/4NRzRl5KepDRKlCcj7XMutTxxfsQ6wdtuIvFeUWL
 vhVMznXagH6w==
WDCIronportException: Internal
Received: from aravind-workstation.hgst.com (HELO localhost.localdomain)
 ([10.64.18.44])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Jul 2020 08:54:20 -0700
From: Aravind Ramesh <aravind.ramesh@wdc.com>
To: jaegeuk@kernel.org, yuchao0@huawei.com, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hch@lst.de
Date: Thu,  2 Jul 2020 21:24:01 +0530
Message-Id: <20200702155401.13322-3-aravind.ramesh@wdc.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200702155401.13322-1-aravind.ramesh@wdc.com>
References: <20200702155401.13322-1-aravind.ramesh@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jr1mr-005v6l-Ot
Subject: [f2fs-dev] [PATCH 2/2] f2fs: manage zone capacity during writes and
 gc
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
Cc: niklas.cassel@wdc.com, Damien Le Moal <damien.lemoal@wdc.com>,
 Aravind Ramesh <aravind.ramesh@wdc.com>, matias.bjorling@wdc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Manage the usable segments in a section and usable blocks per segment
during write and gc. Segments which are beyond zone-capacity are never
allocated, and do not need to be garbage collected, only the segments
which are before zone-capacity needs to garbage collected.
For spanning segments based on the number of usable blocks in that
segment, write to blocks only up to zone-capacity.

Signed-off-by: Aravind Ramesh <aravind.ramesh@wdc.com>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 fs/f2fs/gc.c      | 27 ++++++++++++++++++++-------
 fs/f2fs/gc.h      | 42 ++++++++++++++++++++++++++++++++++++++----
 fs/f2fs/segment.c | 18 ++++++++++--------
 fs/f2fs/segment.h |  6 +++---
 4 files changed, 71 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 9a40761445d3..dfa6d91cffcb 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -266,13 +266,14 @@ static unsigned int get_cb_cost(struct f2fs_sb_info *sbi, unsigned int segno)
 	unsigned char age = 0;
 	unsigned char u;
 	unsigned int i;
+	unsigned int usable_segs_per_sec = f2fs_usable_segs_in_sec(sbi, segno);
 
-	for (i = 0; i < sbi->segs_per_sec; i++)
+	for (i = 0; i < usable_segs_per_sec; i++)
 		mtime += get_seg_entry(sbi, start + i)->mtime;
 	vblocks = get_valid_blocks(sbi, segno, true);
 
-	mtime = div_u64(mtime, sbi->segs_per_sec);
-	vblocks = div_u64(vblocks, sbi->segs_per_sec);
+	mtime = div_u64(mtime, usable_segs_per_sec);
+	vblocks = div_u64(vblocks, usable_segs_per_sec);
 
 	u = (vblocks * 100) >> sbi->log_blocks_per_seg;
 
@@ -536,6 +537,7 @@ static int gc_node_segment(struct f2fs_sb_info *sbi,
 	int phase = 0;
 	bool fggc = (gc_type == FG_GC);
 	int submitted = 0;
+	unsigned int usable_blks_in_seg = f2fs_usable_blks_in_seg(sbi, segno);
 
 	start_addr = START_BLOCK(sbi, segno);
 
@@ -545,7 +547,7 @@ static int gc_node_segment(struct f2fs_sb_info *sbi,
 	if (fggc && phase == 2)
 		atomic_inc(&sbi->wb_sync_req[NODE]);
 
-	for (off = 0; off < sbi->blocks_per_seg; off++, entry++) {
+	for (off = 0; off < usable_blks_in_seg; off++, entry++) {
 		nid_t nid = le32_to_cpu(entry->nid);
 		struct page *node_page;
 		struct node_info ni;
@@ -1033,13 +1035,14 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	int off;
 	int phase = 0;
 	int submitted = 0;
+	unsigned int usable_blks_in_seg = f2fs_usable_blks_in_seg(sbi, segno);
 
 	start_addr = START_BLOCK(sbi, segno);
 
 next_step:
 	entry = sum;
 
-	for (off = 0; off < sbi->blocks_per_seg; off++, entry++) {
+	for (off = 0; off < usable_blks_in_seg; off++, entry++) {
 		struct page *data_page;
 		struct inode *inode;
 		struct node_info dni; /* dnode info for the data */
@@ -1201,7 +1204,16 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 						SUM_TYPE_DATA : SUM_TYPE_NODE;
 	int submitted = 0;
 
-	if (__is_large_section(sbi))
+       /*
+	* zone-capacity can be less than zone-size in zoned devices,
+	* resulting in less than expected usable segments in the zone,
+	* calculate the end segno in the zone which can be garbage collected
+	*/
+	if (f2fs_sb_has_blkzoned(sbi))
+		end_segno -= sbi->segs_per_sec -
+					f2fs_usable_segs_in_sec(sbi, segno);
+
+	else if (__is_large_section(sbi))
 		end_segno = rounddown(end_segno, sbi->segs_per_sec);
 
 	/* readahead multi ssa blocks those have contiguous address */
@@ -1356,7 +1368,8 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 		goto stop;
 
 	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type);
-	if (gc_type == FG_GC && seg_freed == sbi->segs_per_sec)
+	if (gc_type == FG_GC &&
+		seg_freed == f2fs_usable_segs_in_sec(sbi, segno))
 		sec_freed++;
 	total_freed += seg_freed;
 
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index db3c61046aa4..463b4e38b864 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -44,13 +44,47 @@ struct gc_inode_list {
 /*
  * inline functions
  */
+
+/*
+ * On a Zoned device zone-capacity can be less than zone-size and if
+ * zone-capacity is not aligned to f2fs segment size(2MB), then the segment
+ * starting just before zone-capacity has some blocks spanning across the
+ * zone-capacity, these blocks are not usable.
+ * Such spanning segments can be in free list so calculate the sum of usable
+ * blocks in currently free segments including normal and spanning segments.
+ */
+static inline block_t free_segs_blk_count_zoned(struct f2fs_sb_info *sbi)
+{
+	block_t free_seg_blks = 0;
+	struct free_segmap_info *free_i = FREE_I(sbi);
+	int j;
+
+	for (j = 0; j < MAIN_SEGS(sbi); j++)
+		if (!test_bit(j, free_i->free_segmap))
+			free_seg_blks += f2fs_usable_blks_in_seg(sbi, j);
+
+	return free_seg_blks;
+}
+
+static inline block_t free_segs_blk_count(struct f2fs_sb_info *sbi)
+{
+	if (f2fs_sb_has_blkzoned(sbi))
+		return free_segs_blk_count_zoned(sbi);
+
+	return free_segments(sbi) << sbi->log_blocks_per_seg;
+}
+
 static inline block_t free_user_blocks(struct f2fs_sb_info *sbi)
 {
-	if (free_segments(sbi) < overprovision_segments(sbi))
+	block_t free_blks, ovp_blks;
+
+	free_blks = free_segs_blk_count(sbi);
+	ovp_blks = overprovision_segments(sbi) << sbi->log_blocks_per_seg;
+
+	if (free_blks < ovp_blks)
 		return 0;
-	else
-		return (free_segments(sbi) - overprovision_segments(sbi))
-			<< sbi->log_blocks_per_seg;
+
+	return free_blks - ovp_blks;
 }
 
 static inline block_t limit_invalid_user_blocks(struct f2fs_sb_info *sbi)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index d2156f3f56a5..d75c1849dc83 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -869,10 +869,10 @@ static void locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno)
 	ckpt_valid_blocks = get_ckpt_valid_blocks(sbi, segno);
 
 	if (valid_blocks == 0 && (!is_sbi_flag_set(sbi, SBI_CP_DISABLED) ||
-				ckpt_valid_blocks == sbi->blocks_per_seg)) {
+		ckpt_valid_blocks == f2fs_usable_blks_in_seg(sbi, segno))) {
 		__locate_dirty_segment(sbi, segno, PRE);
 		__remove_dirty_segment(sbi, segno, DIRTY);
-	} else if (valid_blocks < sbi->blocks_per_seg) {
+	} else if (valid_blocks < f2fs_usable_blks_in_seg(sbi, segno)) {
 		__locate_dirty_segment(sbi, segno, DIRTY);
 	} else {
 		/* Recovery routine with SSR needs this */
@@ -915,9 +915,11 @@ block_t f2fs_get_unusable_blocks(struct f2fs_sb_info *sbi)
 	for_each_set_bit(segno, dirty_i->dirty_segmap[DIRTY], MAIN_SEGS(sbi)) {
 		se = get_seg_entry(sbi, segno);
 		if (IS_NODESEG(se->type))
-			holes[NODE] += sbi->blocks_per_seg - se->valid_blocks;
+			holes[NODE] += f2fs_usable_blks_in_seg(sbi, segno) -
+							se->valid_blocks;
 		else
-			holes[DATA] += sbi->blocks_per_seg - se->valid_blocks;
+			holes[DATA] += f2fs_usable_blks_in_seg(sbi, segno) -
+							se->valid_blocks;
 	}
 	mutex_unlock(&dirty_i->seglist_lock);
 
@@ -2167,7 +2169,7 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 	offset = GET_BLKOFF_FROM_SEG0(sbi, blkaddr);
 
 	f2fs_bug_on(sbi, (new_vblocks >> (sizeof(unsigned short) << 3) ||
-				(new_vblocks > sbi->blocks_per_seg)));
+			(new_vblocks > f2fs_usable_blks_in_seg(sbi, segno))));
 
 	se->valid_blocks = new_vblocks;
 	se->mtime = get_mtime(sbi, false);
@@ -2933,9 +2935,9 @@ int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
 static bool __has_curseg_space(struct f2fs_sb_info *sbi, int type)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
-	if (curseg->next_blkoff < sbi->blocks_per_seg)
-		return true;
-	return false;
+
+	return curseg->next_blkoff < f2fs_usable_blks_in_seg(sbi,
+							curseg->segno);
 }
 
 int f2fs_rw_hint_to_seg_type(enum rw_hint hint)
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 79b0dc33feaf..170df8c84f75 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -548,8 +548,8 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi)
 	/* check current node segment */
 	for (i = CURSEG_HOT_NODE; i <= CURSEG_COLD_NODE; i++) {
 		segno = CURSEG_I(sbi, i)->segno;
-		left_blocks = sbi->blocks_per_seg -
-			get_seg_entry(sbi, segno)->ckpt_valid_blocks;
+		left_blocks = f2fs_usable_blks_in_seg(sbi, segno) -
+				get_seg_entry(sbi, segno)->ckpt_valid_blocks;
 
 		if (node_blocks > left_blocks)
 			return false;
@@ -557,7 +557,7 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi)
 
 	/* check current data segment */
 	segno = CURSEG_I(sbi, CURSEG_HOT_DATA)->segno;
-	left_blocks = sbi->blocks_per_seg -
+	left_blocks = f2fs_usable_blks_in_seg(sbi, segno) -
 			get_seg_entry(sbi, segno)->ckpt_valid_blocks;
 	if (dent_blocks > left_blocks)
 		return false;
-- 
2.19.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
