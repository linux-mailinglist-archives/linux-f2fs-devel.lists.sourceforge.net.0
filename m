Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A83B6B335
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jul 2019 03:29:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hnYl7-0007Ua-Vr; Wed, 17 Jul 2019 01:29:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hnYl5-0007UT-Ud
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jul 2019 01:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rcHJudXY/IwF+fcSQYNl6hkfzZVxmE69OJNXBjB1tWk=; b=gMXd1uQEKxulJGN7TCqcOuvFMq
 1XMEYzhK7buOvdj036tFD3bzT53rtMAVjwS4ZxLszqInNcL6/wJ78MF1UWfxSt6woFPoRiPvxopc9
 Pn1vj5kOR0iJBUMq20NaDTJ+8+Sz+zD696bcFRL+QuLLXY+t/f/UyrwXI0xF62ufT4HY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rcHJudXY/IwF+fcSQYNl6hkfzZVxmE69OJNXBjB1tWk=; b=F
 915HGst+dayi336kEH1QMyoAD7FsMKxHzbcoAKQd+rK8TOcdtUTENoJgm6xENaEVzYpscBZE0KhmY
 3gBQWdaRbLnDUzXmPPvLZNXtLVr8oeOzIehBYbZynEYCoT8QlHEgNPNyvGM472TlcCJwYsUiDuU4v
 Rf9IdjfG796j0zKI=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hnYl4-004UZA-Ii
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jul 2019 01:29:27 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C3937C5E48B5F247A709;
 Wed, 17 Jul 2019 09:29:10 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Wed, 17 Jul 2019 09:29:01 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 17 Jul 2019 09:28:51 +0800
Message-ID: <20190717012851.80918-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
X-Headers-End: 1hnYl4-004UZA-Ii
Subject: [f2fs-dev] [PATCH v3] fsck.f2fs: write checkpoint with OPU mode
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This original patch was from Weichao Guo.

We may encounter both checkpoints invalid in such a case:
1. kernel writes CP A;
2. power-cut when kernel writes CP B, then CP B is corrupted;
3. fsck: load CP A, fix meta/data;
4. power-cut when fsck writes CP A in-place, then CP A is corrupted too;

To avoid both checkpoints being invalid, this patch changes to duplicate
valid checkpoint to mirror position first, and then, write fixed checkpoint
to CP #0 position.

This can make sure that, while fsck repairing, even there is sudden
power-cut, last valid checkpoint can be kept in CP #1 position.

Signed-off-by: Weichao Guo <guoweichao@huawei.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v3:
- fix wrong size of duplication.
 fsck/f2fs.h  |  2 ++
 fsck/fsck.c  | 15 +++++++++++++--
 fsck/fsck.h  |  2 ++
 fsck/mount.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 4dc6698..52e68ec 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -195,6 +195,8 @@ struct f2fs_sb_info {
 
 	unsigned int cur_victim_sec;            /* current victim section num */
 	u32 free_segments;
+
+	int cp_backuped;			/* backup valid checkpoint */
 };
 
 static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info *sbi)
diff --git a/fsck/fsck.c b/fsck/fsck.c
index 8953ca1..49363d3 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2127,6 +2127,16 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
 	ASSERT(ret >= 0);
 }
 
+static void fix_checkpoints(struct f2fs_sb_info *sbi)
+{
+	/* copy valid checkpoint to its mirror position */
+	duplicate_checkpoint(sbi);
+
+	/* repair checkpoint at CP #0 position */
+	sbi->cur_cp = 1;
+	fix_checkpoint(sbi);
+}
+
 int check_curseg_offset(struct f2fs_sb_info *sbi, int type)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
@@ -2765,6 +2775,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 		}
 	}
 #endif
+
 	/* fix global metadata */
 	if (force || (c.fix_on && f2fs_dev_is_writable())) {
 		struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
@@ -2777,10 +2788,10 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 			rewrite_sit_area_bitmap(sbi);
 			fix_curseg_info(sbi);
 			fix_checksum(sbi);
-			fix_checkpoint(sbi);
+			fix_checkpoints(sbi);
 		} else if (is_set_ckpt_flags(cp, CP_FSCK_FLAG) ||
 			is_set_ckpt_flags(cp, CP_QUOTA_NEED_FSCK_FLAG)) {
-			write_checkpoint(sbi);
+			write_checkpoints(sbi);
 		}
 	}
 	return ret;
diff --git a/fsck/fsck.h b/fsck/fsck.h
index d38e8de..3699b35 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -191,7 +191,9 @@ extern void flush_sit_entries(struct f2fs_sb_info *);
 extern void move_curseg_info(struct f2fs_sb_info *, u64, int);
 extern void write_curseg_info(struct f2fs_sb_info *);
 extern int find_next_free_block(struct f2fs_sb_info *, u64 *, int, int);
+extern void duplicate_checkpoint(struct f2fs_sb_info *);
 extern void write_checkpoint(struct f2fs_sb_info *);
+extern void write_checkpoints(struct f2fs_sb_info *);
 extern void update_superblock(struct f2fs_super_block *, int);
 extern void update_data_blkaddr(struct f2fs_sb_info *, nid_t, u16, block_t);
 extern void update_nat_blkaddr(struct f2fs_sb_info *, nid_t, nid_t, block_t);
diff --git a/fsck/mount.c b/fsck/mount.c
index 60e0e4a..973c82f 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2229,7 +2229,7 @@ void flush_journal_entries(struct f2fs_sb_info *sbi)
 	int n_sits = flush_sit_journal_entries(sbi);
 
 	if (n_nats || n_sits)
-		write_checkpoint(sbi);
+		write_checkpoints(sbi);
 }
 
 void flush_sit_entries(struct f2fs_sb_info *sbi)
@@ -2478,6 +2478,47 @@ void nullify_nat_entry(struct f2fs_sb_info *sbi, u32 nid)
 	free(nat_block);
 }
 
+void duplicate_checkpoint(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
+	unsigned long long dst, src;
+	void *buf;
+	unsigned int seg_size = 1 << get_sb(log_blocks_per_seg);
+	int ret;
+
+	if (sbi->cp_backuped)
+		return;
+
+	buf = malloc(F2FS_BLKSIZE * seg_size);
+	ASSERT(buf);
+
+	if (sbi->cur_cp == 1) {
+		src = get_sb(cp_blkaddr);
+		dst = src + seg_size;
+	} else {
+		dst = get_sb(cp_blkaddr);
+		src = dst + seg_size;
+	}
+
+	ret = dev_read(buf, src << F2FS_BLKSIZE_BITS,
+				seg_size << F2FS_BLKSIZE_BITS);
+	ASSERT(ret >= 0);
+
+	ret = dev_write(buf, dst << F2FS_BLKSIZE_BITS,
+				seg_size << F2FS_BLKSIZE_BITS);
+	ASSERT(ret >= 0);
+
+	free(buf);
+
+	ret = f2fs_fsync_device();
+	ASSERT(ret >= 0);
+
+	sbi->cp_backuped = 1;
+
+	MSG(0, "Info: Duplicate valid checkpoint to mirror position "
+		"%llu -> %llu\n", src, dst);
+}
+
 void write_checkpoint(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
@@ -2557,6 +2598,16 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
 	ASSERT(ret >= 0);
 }
 
+void write_checkpoints(struct f2fs_sb_info *sbi)
+{
+	/* copy valid checkpoint to its mirror position */
+	duplicate_checkpoint(sbi);
+
+	/* repair checkpoint at CP #0 position */
+	sbi->cur_cp = 1;
+	write_checkpoint(sbi);
+}
+
 void build_nat_area_bitmap(struct f2fs_sb_info *sbi)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
