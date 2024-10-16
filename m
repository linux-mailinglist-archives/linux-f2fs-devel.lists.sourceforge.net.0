Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B929C9A009A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Oct 2024 07:28:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t0waQ-00070i-LB;
	Wed, 16 Oct 2024 05:28:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Yi.Sun@unisoc.com>) id 1t0waP-00070c-P8
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Oct 2024 05:28:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G13PNk0fsElVvLUortfQvKxyQcDzwzP626eYFm5E6Eo=; b=Wx4C7XyQYOJ7GeknUTbymPiDYC
 gzp7ISbfWuX3wZ/J2e8VtOkcShCNXloIzSxrUQ5B4U5yqwGcv4GVp9gTSgnKH8Ir7sNxa60bvg2qZ
 cjvj45m758PySQz3yfdxEuR6J2P+Bb//BVub8zAFidim3eULE52Rbmj+LCr77+FiM45o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G13PNk0fsElVvLUortfQvKxyQcDzwzP626eYFm5E6Eo=; b=X8Kyox1pI8RAitBLK03C3h/Q3V
 y6PmK1E8+vj+6iF1tF7mt3+ojn/VVg3W2bwMQ08BslmxtPjnUf+5pxol1RKqa4IbciVNz9X3rWRCg
 T3mP3+QqfdEFZ2s3WevDZK2uNFiSQJJKEWNlh05sDGQLrkZCNcO/BVEGoVP93X3W53MM=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t0waP-00044k-EC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Oct 2024 05:28:42 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 49G5S63f033963;
 Wed, 16 Oct 2024 13:28:06 +0800 (+08)
 (envelope-from Yi.Sun@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4XSzy41Lghz2SW4QH;
 Wed, 16 Oct 2024 13:27:56 +0800 (CST)
Received: from tj10379pcu.spreadtrum.com (10.5.32.15) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 16 Oct 2024 13:28:03 +0800
From: Yi Sun <yi.sun@unisoc.com>
To: <chao@kernel.org>
Date: Wed, 16 Oct 2024 13:27:58 +0800
Message-ID: <20241016052758.3400359-3-yi.sun@unisoc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241016052758.3400359-1-yi.sun@unisoc.com>
References: <20241016052758.3400359-1-yi.sun@unisoc.com>
MIME-Version: 1.0
X-Originating-IP: [10.5.32.15]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 49G5S63f033963
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When doing truncate, consecutive blocks in the same segment
 can be processed at the same time. So that the efficiency of doing truncate
 can be improved. Add f2fs_invalidate_compress_pages_range() only for doing
 truncate. Add check_f2fs_invalidate_consecutive_blocks() only for doing
 truncate
 and to determine whether the blocks are continuous and belong [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1t0waP-00044k-EC
Subject: [f2fs-dev] [RFC PATCH 2/2] f2fs: introduce
 f2fs_invalidate_consecutive_blocks()
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
Cc: ke.wang@unisoc.com, yi.sun@unisoc.com, linux-kernel@vger.kernel.org,
 sunyibuaa@gmail.com, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When doing truncate, consecutive blocks in the same segment
can be processed at the same time. So that the efficiency of
doing truncate can be improved.

Add f2fs_invalidate_compress_pages_range() only for doing truncate.
Add check_f2fs_invalidate_consecutive_blocks() only for doing
truncate and to determine whether the blocks are continuous and
belong to the same segment.

Signed-off-by: Yi Sun <yi.sun@unisoc.com>
---
 fs/f2fs/compress.c | 14 ++++++++++++++
 fs/f2fs/f2fs.h     |  5 +++++
 fs/f2fs/file.c     | 34 +++++++++++++++++++++++++++++++++-
 fs/f2fs/segment.c  | 25 +++++++++++++++++++++++++
 4 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 7f26440e8595..70929a87e9bf 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -2014,6 +2014,20 @@ void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino)
 	} while (index < end);
 }
 
+void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
+					block_t blkaddr, int cnt)
+{
+	if (!sbi->compress_inode)
+		return;
+
+	if (cnt < 1) {
+		f2fs_bug_on(sbi, 1);
+		cnt = 1;
+	}
+
+	invalidate_mapping_pages(COMPRESS_MAPPING(sbi), blkaddr, blkaddr + cnt - 1);
+}
+
 int f2fs_init_compress_inode(struct f2fs_sb_info *sbi)
 {
 	struct inode *inode;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ce00cb546f4a..99767f35678f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3716,6 +3716,7 @@ int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi);
 int f2fs_flush_device_cache(struct f2fs_sb_info *sbi);
 void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool free);
 void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr);
+void f2fs_invalidate_consecutive_blocks(struct f2fs_sb_info *sbi, block_t addr, int cnt);
 bool f2fs_is_checkpointed_data(struct f2fs_sb_info *sbi, block_t blkaddr);
 int f2fs_start_discard_thread(struct f2fs_sb_info *sbi);
 void f2fs_drop_discard_cmd(struct f2fs_sb_info *sbi);
@@ -4375,6 +4376,8 @@ void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
 bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
 								block_t blkaddr);
 void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino);
+void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
+					block_t blkaddr, int cnt);
 #define inc_compr_inode_stat(inode)					\
 	do {								\
 		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);		\
@@ -4432,6 +4435,8 @@ static inline bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi,
 				struct page *page, block_t blkaddr) { return false; }
 static inline void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi,
 							nid_t ino) { }
+static inline void f2fs_invalidate_compress_pages_range(struct f2fs_sb_info *sbi,
+						block_t blkaddr, int cnt) { }
 #define inc_compr_inode_stat(inode)		do { } while (0)
 static inline int f2fs_is_compressed_cluster(
 				struct inode *inode,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 7057efa8ec17..634691e3b5f1 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -612,6 +612,18 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
 	return finish_preallocate_blocks(inode);
 }
 
+static bool check_f2fs_invalidate_consecutive_blocks(struct f2fs_sb_info *sbi,
+					block_t blkaddr1, block_t blkaddr2)
+{
+	if (blkaddr2 - blkaddr1 != 1)
+		return false;
+
+	if (GET_SEGNO(sbi, blkaddr1) != GET_SEGNO(sbi, blkaddr2))
+		return false;
+
+	return true;
+}
+
 void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
@@ -621,6 +633,9 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 	int cluster_index = 0, valid_blocks = 0;
 	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
 	bool released = !atomic_read(&F2FS_I(dn->inode)->i_compr_blocks);
+	block_t con_start;
+	bool run_invalid = true;
+	int con_cnt = 1;
 
 	addr = get_dnode_addr(dn->inode, dn->node_page) + ofs;
 
@@ -652,7 +667,24 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 				valid_blocks++;
 		}
 
-		f2fs_invalidate_blocks(sbi, blkaddr);
+		if (run_invalid)
+			con_start = blkaddr;
+
+		if (count > 1 &&
+			check_f2fs_invalidate_consecutive_blocks(sbi, blkaddr,
+				le32_to_cpu(*(addr + 1)))) {
+			run_invalid = false;
+
+			if (con_cnt++ == 1)
+				con_start = blkaddr;
+		} else {
+			run_invalid = true;
+		}
+
+		if (run_invalid) {
+			f2fs_invalidate_consecutive_blocks(sbi, con_start, con_cnt);
+			con_cnt = 1;
+		}
 
 		if (!released || blkaddr != COMPRESS_ADDR)
 			nr_free++;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index f118faf36d35..edb8a78985ba 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2570,6 +2570,31 @@ void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr)
 	up_write(&sit_i->sentry_lock);
 }
 
+void f2fs_invalidate_consecutive_blocks(struct f2fs_sb_info *sbi, block_t addr, int cnt)
+{
+	unsigned int segno = GET_SEGNO(sbi, addr);
+	unsigned int segno2 = GET_SEGNO(sbi, addr + cnt - 1);
+	struct sit_info *sit_i = SIT_I(sbi);
+
+	f2fs_bug_on(sbi, addr == NULL_ADDR || segno != segno2);
+	if (addr == NEW_ADDR || addr == COMPRESS_ADDR)
+		return;
+
+	f2fs_truncate_meta_inode_pages(sbi, addr, cnt);
+	f2fs_invalidate_compress_pages_range(sbi, addr, cnt);
+
+	/* add it into sit main buffer */
+	down_write(&sit_i->sentry_lock);
+
+	update_segment_mtime(sbi, addr, 0);
+	update_sit_entry(sbi, addr, -cnt);
+
+	/* add it into dirty seglist */
+	locate_dirty_segment(sbi, segno);
+
+	up_write(&sit_i->sentry_lock);
+}
+
 bool f2fs_is_checkpointed_data(struct f2fs_sb_info *sbi, block_t blkaddr)
 {
 	struct sit_info *sit_i = SIT_I(sbi);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
