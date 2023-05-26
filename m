Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C10711FAA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 May 2023 08:12:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q2QgF-00073H-FQ;
	Fri, 26 May 2023 06:12:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q2Qg2-000735-7Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 May 2023 06:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oKW2uQ0L9MMDbXSbE3kqTzYB3YF9H1jSvaR7KjKIQk0=; b=W0aSDU9gIJlphuXDa1M1FQ78Q+
 B6LZrWmUrIvT0p4LwdjpRgZzobojhdY02lZrRxHoGK4JBE9bGehABGN40Mk45JUjdODaFv47GYjLA
 /rbtHrpstQAGr/5UNj0t6G8osXk50lKJELjwwb7kVYTvIq0PbYiB7kymP4bn7LoXzXcc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oKW2uQ0L9MMDbXSbE3kqTzYB3YF9H1jSvaR7KjKIQk0=; b=B
 ZR5h+2+4DsXrEFafIJa2mJcF6pCiOEKt2pluBv8oalmIf2Lh2HmiuvlpnK+TCZAva23ES9M8kA35S
 O996qKrVHR5YtUn24w/sWW+0yfMMFWY3MyzRFF9GanLcjIXTtGy6oAeAaA16BgNiBTkiCP9l+Euf0
 u/WK1Ez+h4orupU8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q2Qfx-0002cp-Rm for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 May 2023 06:11:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 354DC60915
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 May 2023 06:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D0EC433EF;
 Fri, 26 May 2023 06:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685081494;
 bh=xDCVC/e9uHVmDmLhzmDEqP757w4kPIdiRMFqV3+n69Y=;
 h=From:To:Cc:Subject:Date:From;
 b=eWC4oUn0bhMGedbO06J7oZwx109BHEBt4pSOAFv608301qR5I7MgkJOE2tuHtxkJx
 g8zJJMuS+JTO1w0YB+wwsAePfic2I4N9ZnCTljbuGcrDzK/83PjZR9KRBSoqitBOnQ
 9ziosy6opxR29S1EmV6//9KjCW7a8bmd5LmaEQXuOp0IHzl27xsN2otqf7T3ihuxoC
 y6pS+HDDotw93iKyKWsYiZ2zLjg/rMPnZO/074hZoapsQFdo7K91H8bFkT3ICietYu
 vY9SSu4Bjc+j2v9M76LEP5Z3P6mUNdNKmLDpvIqIVBnxo6GyMgQ/YSDTTPgxiNCDK1
 xfyU5i1TI0Ngg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 26 May 2023 14:11:28 +0800
Message-Id: <20230526061129.2999437-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Fix below incorrect use: - compare cpu and le32 type
 variable:
 if (get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO)) - compare le32 type
 vairable:
 if (c.feature & cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR)) - [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q2Qfx-0002cp-Rm
Subject: [f2fs-dev] [PATCH 1/2] f2fs-tools: fix to le32 type variable
 correctly
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

Fix below incorrect use:
- compare cpu and le32 type variable:
if (get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO))
- compare le32 type vairable:
if (c.feature & cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR))
- miss get_sb(feature)
(cpu_to_le32(F2FS_FEATURE_RO) ? 1 : 0)
- update le32 type variable
sb->feature |= cpu_to_le32(F2FS_FEATURE_ENCRYPT);

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/dir.c              |  4 +--
 fsck/fsck.c             | 21 ++++++-----
 fsck/main.c             |  6 ++--
 fsck/mount.c            | 78 +++++++++++++++++++++--------------------
 fsck/node.c             |  2 +-
 fsck/segment.c          |  8 ++---
 include/f2fs_fs.h       | 14 ++++----
 lib/libf2fs.c           | 12 +++----
 mkfs/f2fs_format.c      | 34 +++++++++---------
 mkfs/f2fs_format_main.c | 48 ++++++++++++-------------
 10 files changed, 114 insertions(+), 113 deletions(-)

diff --git a/fsck/dir.c b/fsck/dir.c
index 4a3eb6e..ef7c1c2 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -520,7 +520,7 @@ static void init_inode_block(struct f2fs_sb_info *sbi,
 	memcpy(node_blk->i.i_name, de->name, de->len);
 	node_blk->i.i_name[de->len] = 0;
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR)) {
+	if (c.feature & F2FS_FEATURE_EXTRA_ATTR) {
 		node_blk->i.i_inline |= F2FS_EXTRA_ATTR;
 		node_blk->i.i_extra_isize = cpu_to_le16(calc_extra_isize());
 	}
@@ -542,7 +542,7 @@ static void init_inode_block(struct f2fs_sb_info *sbi,
 		de->link = NULL;
 	}
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CHKSUM))
+	if (c.feature & F2FS_FEATURE_INODE_CHKSUM)
 		node_blk->i.i_inode_checksum =
 			cpu_to_le32(f2fs_inode_chksum(node_blk));
 }
diff --git a/fsck/fsck.c b/fsck/fsck.c
index ac4cd98..a4db2a3 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -152,7 +152,7 @@ static int is_valid_ssa_node_blk(struct f2fs_sb_info *sbi, u32 nid,
 	int need_fix = 0, ret = 0;
 	int type;
 
-	if (get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO))
+	if (get_sb(feature) & F2FS_FEATURE_RO)
 		return 0;
 
 	segno = GET_SEGNO(sbi, blk_addr);
@@ -277,7 +277,7 @@ static int is_valid_ssa_data_blk(struct f2fs_sb_info *sbi, u32 blk_addr,
 	int need_fix = 0, ret = 0;
 	int type;
 
-	if (get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO))
+	if (get_sb(feature) & F2FS_FEATURE_RO)
 		return 0;
 
 	segno = GET_SEGNO(sbi, blk_addr);
@@ -838,7 +838,7 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	u32 i_links = le32_to_cpu(node_blk->i.i_links);
 	u64 i_size = le64_to_cpu(node_blk->i.i_size);
 	u64 i_blocks = le64_to_cpu(node_blk->i.i_blocks);
-	bool compr_supported = c.feature & cpu_to_le32(F2FS_FEATURE_COMPRESSION);
+	bool compr_supported = c.feature & F2FS_FEATURE_COMPRESSION;
 	u32 i_flags = le32_to_cpu(node_blk->i.i_flags);
 	bool compressed = i_flags & F2FS_COMPR_FL;
 	bool compr_rel = node_blk->i.i_inline & F2FS_COMPRESS_RELEASED;
@@ -938,7 +938,7 @@ check_next:
 	child.last_blk = 0;
 
 	if (f2fs_has_extra_isize(&node_blk->i)) {
-		if (c.feature & cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR)) {
+		if (c.feature & F2FS_FEATURE_EXTRA_ATTR) {
 			unsigned int isize =
 				le16_to_cpu(node_blk->i.i_extra_isize);
 			if (isize > 4 * DEF_ADDRS_PER_INODE) {
@@ -966,8 +966,7 @@ check_next:
 			}
 		}
 
-		if ((c.feature &
-			cpu_to_le32(F2FS_FEATURE_FLEXIBLE_INLINE_XATTR)) &&
+		if ((c.feature & F2FS_FEATURE_FLEXIBLE_INLINE_XATTR) &&
 			(node_blk->i.i_inline & F2FS_INLINE_XATTR)) {
 			unsigned int inline_size =
 				le16_to_cpu(node_blk->i.i_inline_xattr_size);
@@ -992,7 +991,7 @@ check_next:
 
 	if ((node_blk->i.i_flags & cpu_to_le32(F2FS_CASEFOLD_FL)) &&
 	    (ftype != F2FS_FT_DIR ||
-	     !(c.feature & cpu_to_le32(F2FS_FEATURE_CASEFOLD)))) {
+	     !(c.feature & F2FS_FEATURE_CASEFOLD))) {
 		ASSERT_MSG("[0x%x] unexpected casefold flag", nid);
 		if (c.fix_on) {
 			FIX_MSG("ino[0x%x] clear casefold flag", nid);
@@ -1313,7 +1312,7 @@ skip_blkcnt_fix:
 	if (need_fix && f2fs_dev_is_writable())
 		node_blk->i.i_ext.len = 0;
 
-	if ((c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CHKSUM)) &&
+	if ((c.feature & F2FS_FEATURE_INODE_CHKSUM) &&
 				f2fs_has_extra_isize(&node_blk->i)) {
 		__u32 provided, calculated;
 
@@ -2689,7 +2688,7 @@ int check_curseg_offset(struct f2fs_sb_info *sbi, int type)
 	struct seg_entry *se;
 	int j, nblocks;
 
-	if (get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO) &&
+	if ((get_sb(feature) & F2FS_FEATURE_RO) &&
 			type != CURSEG_HOT_DATA && type != CURSEG_HOT_NODE)
 		return 0;
 
@@ -3289,7 +3288,7 @@ int fsck_chk_curseg_info(struct f2fs_sb_info *sbi)
 		se = get_seg_entry(sbi, curseg->segno);
 		sum_blk = curseg->sum_blk;
 
-		if ((get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO)) &&
+		if ((get_sb(feature) & F2FS_FEATURE_RO) &&
 			(i != CURSEG_HOT_DATA && i != CURSEG_HOT_NODE))
 			continue;
 
@@ -3350,7 +3349,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 			force = 1;
 	}
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_LOST_FOUND)) {
+	if (c.feature & F2FS_FEATURE_LOST_FOUND) {
 		for (i = 0; i < fsck->nr_nat_entries; i++)
 			if (f2fs_test_bit(i, fsck->nat_area_bitmap) != 0)
 				break;
diff --git a/fsck/main.c b/fsck/main.c
index e8c3dc4..3690c74 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -367,7 +367,7 @@ void f2fs_parse_options(int argc, char *argv[])
 					MSG(0, "\tError: Unknown flag %s\n", token);
 					fsck_usage();
 				}
-				c.feature |= cpu_to_le32(F2FS_FEATURE_CASEFOLD);
+				c.feature |= F2FS_FEATURE_CASEFOLD;
 				break;
 			case 'V':
 				show_version(prog);
@@ -877,7 +877,7 @@ static int do_fsck(struct f2fs_sb_info *sbi)
 	cbc.cnt = 0;
 	cbc.cheader_pgofs = CHEADER_PGOFS_NONE;
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_QUOTA_INO)) {
+	if (c.feature & F2FS_FEATURE_QUOTA_INO) {
 		ret = quota_init_context(sbi);
 		if (ret) {
 			ASSERT_MSG("quota_init_context failure: %d", ret);
@@ -939,7 +939,7 @@ static int do_defrag(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 
-	if (get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO)) {
+	if (get_sb(feature) & F2FS_FEATURE_RO) {
 		MSG(0, "Not support on readonly image.\n");
 		return -1;
 	}
diff --git a/fsck/mount.c b/fsck/mount.c
index 70619c9..70e8b46 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -292,19 +292,19 @@ void print_inode_info(struct f2fs_sb_info *sbi,
 			le32_to_cpu(inode->i_ext.blk_addr),
 			le32_to_cpu(inode->i_ext.len));
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR)) {
+	if (c.feature & F2FS_FEATURE_EXTRA_ATTR) {
 		DISP_u16(inode, i_extra_isize);
-		if (c.feature & cpu_to_le32(F2FS_FEATURE_FLEXIBLE_INLINE_XATTR))
+		if (c.feature & F2FS_FEATURE_FLEXIBLE_INLINE_XATTR)
 			DISP_u16(inode, i_inline_xattr_size);
-		if (c.feature & cpu_to_le32(F2FS_FEATURE_PRJQUOTA))
+		if (c.feature & F2FS_FEATURE_PRJQUOTA)
 			DISP_u32(inode, i_projid);
-		if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CHKSUM))
+		if (c.feature & F2FS_FEATURE_INODE_CHKSUM)
 			DISP_u32(inode, i_inode_checksum);
-		if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CRTIME)) {
+		if (c.feature & F2FS_FEATURE_INODE_CRTIME) {
 			DISP_u64(inode, i_crtime);
 			DISP_u32(inode, i_crtime_nsec);
 		}
-		if (c.feature & cpu_to_le32(F2FS_FEATURE_COMPRESSION)) {
+		if (c.feature & F2FS_FEATURE_COMPRESSION) {
 			DISP_u64(inode, i_compr_blocks);
 			DISP_u8(inode, i_compress_algorithm);
 			DISP_u8(inode, i_log_cluster_size);
@@ -601,50 +601,50 @@ void print_cp_state(u32 flag)
 
 void print_sb_state(struct f2fs_super_block *sb)
 {
-	__le32 f = sb->feature;
+	unsigned int f = get_sb(feature);
 	int i;
 
 	MSG(0, "Info: superblock features = %x : ", f);
-	if (f & cpu_to_le32(F2FS_FEATURE_ENCRYPT)) {
+	if (f & F2FS_FEATURE_ENCRYPT) {
 		MSG(0, "%s", " encrypt");
 	}
-	if (f & cpu_to_le32(F2FS_FEATURE_VERITY)) {
+	if (f & F2FS_FEATURE_VERITY) {
 		MSG(0, "%s", " verity");
 	}
-	if (f & cpu_to_le32(F2FS_FEATURE_BLKZONED)) {
+	if (f & F2FS_FEATURE_BLKZONED) {
 		MSG(0, "%s", " blkzoned");
 	}
-	if (f & cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR)) {
+	if (f & F2FS_FEATURE_EXTRA_ATTR) {
 		MSG(0, "%s", " extra_attr");
 	}
-	if (f & cpu_to_le32(F2FS_FEATURE_PRJQUOTA)) {
+	if (f & F2FS_FEATURE_PRJQUOTA) {
 		MSG(0, "%s", " project_quota");
 	}
-	if (f & cpu_to_le32(F2FS_FEATURE_INODE_CHKSUM)) {
+	if (f & F2FS_FEATURE_INODE_CHKSUM) {
 		MSG(0, "%s", " inode_checksum");
 	}
-	if (f & cpu_to_le32(F2FS_FEATURE_FLEXIBLE_INLINE_XATTR)) {
+	if (f & F2FS_FEATURE_FLEXIBLE_INLINE_XATTR) {
 		MSG(0, "%s", " flexible_inline_xattr");
 	}
-	if (f & cpu_to_le32(F2FS_FEATURE_QUOTA_INO)) {
+	if (f & F2FS_FEATURE_QUOTA_INO) {
 		MSG(0, "%s", " quota_ino");
 	}
-	if (f & cpu_to_le32(F2FS_FEATURE_INODE_CRTIME)) {
+	if (f & F2FS_FEATURE_INODE_CRTIME) {
 		MSG(0, "%s", " inode_crtime");
 	}
-	if (f & cpu_to_le32(F2FS_FEATURE_LOST_FOUND)) {
+	if (f & F2FS_FEATURE_LOST_FOUND) {
 		MSG(0, "%s", " lost_found");
 	}
-	if (f & cpu_to_le32(F2FS_FEATURE_SB_CHKSUM)) {
+	if (f & F2FS_FEATURE_SB_CHKSUM) {
 		MSG(0, "%s", " sb_checksum");
 	}
-	if (f & cpu_to_le32(F2FS_FEATURE_CASEFOLD)) {
+	if (f & F2FS_FEATURE_CASEFOLD) {
 		MSG(0, "%s", " casefold");
 	}
-	if (f & cpu_to_le32(F2FS_FEATURE_COMPRESSION)) {
+	if (f & F2FS_FEATURE_COMPRESSION) {
 		MSG(0, "%s", " compression");
 	}
-	if (f & cpu_to_le32(F2FS_FEATURE_RO)) {
+	if (f & F2FS_FEATURE_RO) {
 		MSG(0, "%s", " ro");
 	}
 	MSG(0, "\n");
@@ -1020,7 +1020,7 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
 		return -1;
 	}
 
-	if (!(get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO)) &&
+	if (!(get_sb(feature) & F2FS_FEATURE_RO) &&
 			(total_sections > segment_count ||
 			total_sections < F2FS_MIN_SEGMENTS ||
 			segs_per_sec > segment_count || !segs_per_sec)) {
@@ -1088,7 +1088,7 @@ int sanity_check_raw_super(struct f2fs_super_block *sb, enum SB_ADDR sb_addr)
 
 	/* Check zoned block device feature */
 	if (c.devices[0].zoned_model != F2FS_ZONED_NONE &&
-			!(sb->feature & cpu_to_le32(F2FS_FEATURE_BLKZONED))) {
+			!(get_sb(feature) & F2FS_FEATURE_BLKZONED)) {
 		MSG(0, "\tMissing zoned block device feature\n");
 		return -1;
 	}
@@ -1456,7 +1456,7 @@ int sanity_check_ckpt(struct f2fs_sb_info *sbi)
 	ovp_segments = get_cp(overprov_segment_count);
 	reserved_segments = get_cp(rsvd_segment_count);
 
-	if (!(get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO)) &&
+	if (!(get_sb(feature) & F2FS_FEATURE_RO) &&
 		(fsmeta < F2FS_MIN_SEGMENT || ovp_segments == 0 ||
 					reserved_segments == 0)) {
 		MSG(0, "\tWrong layout: check mkfs.f2fs version\n");
@@ -1465,7 +1465,7 @@ int sanity_check_ckpt(struct f2fs_sb_info *sbi)
 
 	user_block_count = get_cp(user_block_count);
 	segment_count_main = get_sb(segment_count_main) +
-				(cpu_to_le32(F2FS_FEATURE_RO) ? 1 : 0);
+				((get_sb(feature) & F2FS_FEATURE_RO) ? 1 : 0);
 	log_blocks_per_seg = get_sb(log_blocks_per_seg);
 	if (!user_block_count || user_block_count >=
 			segment_count_main << log_blocks_per_seg) {
@@ -1530,7 +1530,7 @@ int sanity_check_ckpt(struct f2fs_sb_info *sbi)
 			NR_CURSEG_TYPE) {
 		MSG(0, "\tWrong cp_pack_start_sum(%u) or cp_payload(%u)\n",
 			cp_pack_start_sum, cp_payload);
-		if ((get_sb(feature) & F2FS_FEATURE_SB_CHKSUM))
+		if (get_sb(feature) & F2FS_FEATURE_SB_CHKSUM)
 			return 1;
 		set_sb(cp_payload, cp_pack_start_sum - 1);
 		update_superblock(sb, SB_MASK_ALL);
@@ -2095,7 +2095,7 @@ void update_sum_entry(struct f2fs_sb_info *sbi, block_t blk_addr,
 	int type, ret;
 	struct seg_entry *se;
 
-	if (get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO))
+	if (get_sb(feature) & F2FS_FEATURE_RO)
 		return;
 
 	segno = GET_SEGNO(sbi, blk_addr);
@@ -2941,7 +2941,7 @@ next_segment:
 						START_BLOCK(sbi, segno + 1);
 			continue;
 		}
-		if (!(get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO)) &&
+		if (!(get_sb(feature) & F2FS_FEATURE_RO) &&
 						IS_CUR_SEGNO(sbi, segno))
 			goto next_segment;
 		if (vblocks == 0 && not_enough)
@@ -2983,7 +2983,7 @@ static void move_one_curseg_info(struct f2fs_sb_info *sbi, u64 from, int left,
 	u64 ssa_blk, to;
 	int ret;
 
-	if ((get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO))) {
+	if ((get_sb(feature) & F2FS_FEATURE_RO)) {
 		if (i != CURSEG_HOT_DATA && i != CURSEG_HOT_NODE)
 			return;
 
@@ -3258,7 +3258,7 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
 		ret = dev_write_block(curseg->sum_blk, cp_blk_no++);
 		ASSERT(ret >= 0);
 
-		if (!(get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO))) {
+		if (!(get_sb(feature) & F2FS_FEATURE_RO)) {
 			/* update original SSA too */
 			ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
 			ret = dev_write_block(curseg->sum_blk, ssa_blk);
@@ -3453,25 +3453,27 @@ static int tune_sb_features(struct f2fs_sb_info *sbi)
 	int sb_changed = 0;
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 
-	if (!(sb->feature & cpu_to_le32(F2FS_FEATURE_ENCRYPT)) &&
-			c.feature & cpu_to_le32(F2FS_FEATURE_ENCRYPT)) {
-		sb->feature |= cpu_to_le32(F2FS_FEATURE_ENCRYPT);
+	if (!(get_sb(feature) & F2FS_FEATURE_ENCRYPT) &&
+			c.feature & F2FS_FEATURE_ENCRYPT) {
+		sb->feature = cpu_to_le32(get_sb(feature) |
+					F2FS_FEATURE_ENCRYPT);
 		MSG(0, "Info: Set Encryption feature\n");
 		sb_changed = 1;
 	}
-	if (!(sb->feature & cpu_to_le32(F2FS_FEATURE_CASEFOLD)) &&
-		c.feature & cpu_to_le32(F2FS_FEATURE_CASEFOLD)) {
+	if (!(get_sb(feature) & F2FS_FEATURE_CASEFOLD) &&
+		c.feature & F2FS_FEATURE_CASEFOLD) {
 		if (!c.s_encoding) {
 			ERR_MSG("ERROR: Must specify encoding to enable casefolding.\n");
 			return -1;
 		}
-		sb->feature |= cpu_to_le32(F2FS_FEATURE_CASEFOLD);
+		sb->feature = cpu_to_le32(get_sb(feature) |
+					F2FS_FEATURE_CASEFOLD);
 		MSG(0, "Info: Set Casefold feature\n");
 		sb_changed = 1;
 	}
 	/* TODO: quota needs to allocate inode numbers */
 
-	c.feature = sb->feature;
+	c.feature = get_sb(feature);
 	if (!sb_changed)
 		return 0;
 
@@ -3831,7 +3833,7 @@ out:
 		return -1;
 
 	/* precompute checksum seed for metadata */
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CHKSUM))
+	if (c.feature & F2FS_FEATURE_INODE_CHKSUM)
 		c.chksum_seed = f2fs_cal_crc32(~0, sb->uuid, sizeof(sb->uuid));
 
 	sbi->total_valid_node_count = get_cp(valid_node_count);
diff --git a/fsck/node.c b/fsck/node.c
index 4dc7890..49bc2b6 100644
--- a/fsck/node.c
+++ b/fsck/node.c
@@ -142,7 +142,7 @@ block_t new_node_block(struct f2fs_sb_info *sbi,
 			type = CURSEG_WARM_NODE;
 	}
 
-	if ((get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO)) &&
+	if ((get_sb(feature) & F2FS_FEATURE_RO) &&
 					type != CURSEG_HOT_NODE)
 		type = CURSEG_HOT_NODE;
 
diff --git a/fsck/segment.c b/fsck/segment.c
index 0ca8b5a..ffe7701 100644
--- a/fsck/segment.c
+++ b/fsck/segment.c
@@ -57,7 +57,7 @@ int reserve_new_block(struct f2fs_sb_info *sbi, block_t *to,
 
 	blkaddr = SM_I(sbi)->main_blkaddr;
 
-	if (sbi->raw_super->feature & cpu_to_le32(F2FS_FEATURE_RO)) {
+	if (le32_to_cpu(sbi->raw_super->feature) & F2FS_FEATURE_RO) {
 		if (IS_NODESEG(type)) {
 			type = CURSEG_HOT_NODE;
 			blkaddr = __end_block_addr(sbi);
@@ -123,7 +123,7 @@ int new_data_block(struct f2fs_sb_info *sbi, void *block,
 	unsigned int blkaddr = datablock_addr(dn->node_blk, dn->ofs_in_node);
 	int ret;
 
-	if ((get_sb(feature) & cpu_to_le32(F2FS_FEATURE_RO)) &&
+	if ((get_sb(feature) & F2FS_FEATURE_RO) &&
 					type != CURSEG_HOT_DATA)
 		type = CURSEG_HOT_DATA;
 
@@ -608,7 +608,7 @@ int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
 		node_blk->i.i_inline |= F2FS_INLINE_DATA;
 		node_blk->i.i_inline |= F2FS_DATA_EXIST;
 
-		if (c.feature & cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR)) {
+		if (c.feature & F2FS_FEATURE_EXTRA_ATTR) {
 			node_blk->i.i_inline |= F2FS_EXTRA_ATTR;
 			node_blk->i.i_extra_isize =
 					cpu_to_le16(calc_extra_isize());
@@ -710,7 +710,7 @@ int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
 	if (n < 0)
 		return -1;
 
-	if (!c.compress.enabled || (c.feature & cpu_to_le32(F2FS_FEATURE_RO)))
+	if (!c.compress.enabled || (c.feature & F2FS_FEATURE_RO))
 		update_largest_extent(sbi, de->ino);
 	update_free_segments(sbi);
 
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index e441749..9d35b42 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1432,7 +1432,7 @@ struct f2fs_configuration {
 	int preserve_limits;		/* preserve quota limits */
 	int large_nat_bitmap;
 	int fix_chksum;			/* fix old cp.chksum position */
-	__le32 feature;			/* defined features */
+	unsigned int feature;			/* defined features */
 	unsigned int quota_bits;	/* quota bits */
 	time_t fixed_time;
 
@@ -1553,7 +1553,7 @@ static inline int __get_extra_isize(struct f2fs_inode *inode)
 extern struct f2fs_configuration c;
 static inline int get_inline_xattr_addrs(struct f2fs_inode *inode)
 {
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_FLEXIBLE_INLINE_XATTR))
+	if (c.feature & F2FS_FEATURE_FLEXIBLE_INLINE_XATTR)
 		return le16_to_cpu(inode->i_inline_xattr_size);
 	else if (inode->i_inline & F2FS_INLINE_XATTR ||
 			inode->i_inline & F2FS_INLINE_DENTRY)
@@ -1784,20 +1784,20 @@ static inline void f2fs_init_inode(struct f2fs_super_block *sb,
 	raw_node->i.i_size = cpu_to_le64(1 << get_sb(log_blocksize));
 	raw_node->i.i_blocks = cpu_to_le64(2);
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR)) {
+	if (c.feature & F2FS_FEATURE_EXTRA_ATTR) {
 		raw_node->i.i_inline = F2FS_EXTRA_ATTR;
 		raw_node->i.i_extra_isize = cpu_to_le16(calc_extra_isize());
 	}
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_PRJQUOTA))
+	if (c.feature & F2FS_FEATURE_PRJQUOTA)
 		raw_node->i.i_projid = cpu_to_le32(F2FS_DEF_PROJID);
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CRTIME)) {
+	if (c.feature & F2FS_FEATURE_INODE_CRTIME) {
 		raw_node->i.i_crtime = cpu_to_le32(mtime);
 		raw_node->i.i_crtime_nsec = 0;
 	}
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_COMPRESSION)) {
+	if (c.feature & F2FS_FEATURE_COMPRESSION) {
 		raw_node->i.i_compr_blocks = 0;
 		raw_node->i.i_compress_algorithm = 0;
 		raw_node->i.i_log_cluster_size = 0;
@@ -1844,7 +1844,7 @@ static inline int set_feature_bits(struct feature *table, char *features)
 {
 	u32 mask = feature_map(table, features);
 	if (mask) {
-		c.feature |= cpu_to_le32(mask);
+		c.feature |= mask;
 	} else {
 		MSG(0, "Error: Wrong features %s\n", features);
 		return -1;
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 31f9b34..7a08a7f 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -609,7 +609,7 @@ __u32 f2fs_checkpoint_chksum(struct f2fs_checkpoint *cp)
 
 int write_inode(struct f2fs_node *inode, u64 blkaddr)
 {
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CHKSUM))
+	if (c.feature & F2FS_FEATURE_INODE_CHKSUM)
 		inode->i.i_inode_checksum =
 			cpu_to_le32(f2fs_inode_chksum(inode));
 	return dev_write_block(inode, blkaddr);
@@ -1326,15 +1326,15 @@ unsigned int calc_extra_isize(void)
 {
 	unsigned int size = offsetof(struct f2fs_inode, i_projid);
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_FLEXIBLE_INLINE_XATTR))
+	if (c.feature & F2FS_FEATURE_FLEXIBLE_INLINE_XATTR)
 		size = offsetof(struct f2fs_inode, i_projid);
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_PRJQUOTA))
+	if (c.feature & F2FS_FEATURE_PRJQUOTA)
 		size = offsetof(struct f2fs_inode, i_inode_checksum);
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CHKSUM))
+	if (c.feature & F2FS_FEATURE_INODE_CHKSUM)
 		size = offsetof(struct f2fs_inode, i_crtime);
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CRTIME))
+	if (c.feature & F2FS_FEATURE_INODE_CRTIME)
 		size = offsetof(struct f2fs_inode, i_compr_blocks);
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_COMPRESSION))
+	if (c.feature & F2FS_FEATURE_COMPRESSION)
 		size = offsetof(struct f2fs_inode, i_extra_end);
 
 	return size - F2FS_EXTRA_ISIZE_OFFSET;
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 9257c2e..d833643 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -260,7 +260,7 @@ static int f2fs_prepare_super_block(void)
 		zone_size_bytes * zone_size_bytes -
 		(uint64_t) c.start_sector * DEFAULT_SECTOR_SIZE;
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO))
+	if (c.feature & F2FS_FEATURE_RO)
 		zone_align_start_offset = 8192;
 
 	if (c.start_sector % DEFAULT_SECTORS_PER_BLOCK) {
@@ -413,7 +413,7 @@ static int f2fs_prepare_super_block(void)
 			get_sb(segment_count_nat))) *
 			c.blks_per_seg;
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO))
+	if (c.feature & F2FS_FEATURE_RO)
 		blocks_for_ssa = 0;
 	else
 		blocks_for_ssa = total_valid_blks_available /
@@ -487,11 +487,11 @@ static int f2fs_prepare_super_block(void)
 
 	c.reserved_segments = get_reserved(sb, c.overprovision);
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
+	if (c.feature & F2FS_FEATURE_RO) {
 		c.overprovision = 0;
 		c.reserved_segments = 0;
 	}
-	if ((!(c.feature & cpu_to_le32(F2FS_FEATURE_RO)) &&
+	if ((!(c.feature & F2FS_FEATURE_RO) &&
 		c.overprovision == 0) ||
 		c.total_segments < F2FS_MIN_SEGMENTS ||
 		(c.devices[0].total_sectors *
@@ -511,7 +511,7 @@ static int f2fs_prepare_super_block(void)
 	}
 
 	/* precompute checksum seed for metadata */
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CHKSUM))
+	if (c.feature & F2FS_FEATURE_INODE_CHKSUM)
 		c.chksum_seed = f2fs_cal_crc32(~0, sb->uuid, sizeof(sb->uuid));
 
 	utf8_to_utf16((char *)sb->volume_name, (const char *)c.vol_label,
@@ -529,10 +529,10 @@ static int f2fs_prepare_super_block(void)
 					qtype, c.next_free_nid - 1);
 	}
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_LOST_FOUND))
+	if (c.feature & F2FS_FEATURE_LOST_FOUND)
 		c.lpf_ino = c.next_free_nid++;
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO))
+	if (c.feature & F2FS_FEATURE_RO)
 		avail_zones = 2;
 	else
 		avail_zones = 6;
@@ -543,7 +543,7 @@ static int f2fs_prepare_super_block(void)
 		return -1;
 	}
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
+	if (c.feature & F2FS_FEATURE_RO) {
 		c.cur_seg[CURSEG_HOT_NODE] = last_section(last_zone(total_zones));
 		c.cur_seg[CURSEG_WARM_NODE] = 0;
 		c.cur_seg[CURSEG_COLD_NODE] = 0;
@@ -579,7 +579,7 @@ static int f2fs_prepare_super_block(void)
 	}
 
 	/* if there is redundancy, reassign it */
-	if (!(c.feature & cpu_to_le32(F2FS_FEATURE_RO)))
+	if (!(c.feature & F2FS_FEATURE_RO))
 		verify_cur_segs();
 
 	cure_extension_list();
@@ -596,14 +596,14 @@ static int f2fs_prepare_super_block(void)
 	memcpy(sb->version, c.version, VERSION_LEN);
 	memcpy(sb->init_version, c.version, VERSION_LEN);
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_CASEFOLD)) {
+	if (c.feature & F2FS_FEATURE_CASEFOLD) {
 		set_sb(s_encoding, c.s_encoding);
 		set_sb(s_encoding_flags, c.s_encoding_flags);
 	}
 
-	sb->feature = c.feature;
+	sb->feature = cpu_to_le32(c.feature);
 
-	if (get_sb(feature) & F2FS_FEATURE_SB_CHKSUM) {
+	if (c.feature & F2FS_FEATURE_SB_CHKSUM) {
 		set_sb(checksum_offset, SB_CHKSUM_OFFSET);
 		set_sb(crc, f2fs_cal_crc32(F2FS_SUPER_MAGIC, sb,
 						SB_CHKSUM_OFFSET));
@@ -800,7 +800,7 @@ static int f2fs_write_check_point_pack(void)
 					c.reserved_segments);
 
 	/* main segments - reserved segments - (node + data segments) */
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
+	if (c.feature & F2FS_FEATURE_RO) {
 		set_cp(free_segment_count, f2fs_get_usable_segments(sb) - 2);
 		set_cp(user_block_count, ((get_cp(free_segment_count) + 2 -
 			get_cp(overprov_segment_count)) * c.blks_per_seg));
@@ -892,7 +892,7 @@ static int f2fs_write_check_point_pack(void)
 	/* sit_journal */
 	journal = &c.sit_jnl;
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
+	if (c.feature & F2FS_FEATURE_RO) {
 		i = CURSEG_RO_HOT_DATA;
 		vblocks = le16_to_cpu(journal->sit_j.entries[i].se.vblocks);
 		journal->sit_j.entries[i].segno = cp->cur_data_segno[0];
@@ -1103,7 +1103,7 @@ static int f2fs_discard_obsolete_dnode(void)
 	uint64_t start_inode_pos = get_sb(main_blkaddr);
 	uint64_t last_inode_pos;
 
-	if (c.zoned_mode || c.feature & cpu_to_le32(F2FS_FEATURE_RO))
+	if (c.zoned_mode || c.feature & F2FS_FEATURE_RO)
 		return 0;
 
 	raw_node = calloc(sizeof(struct f2fs_node), 1);
@@ -1169,7 +1169,7 @@ void update_sit_journal(int curseg_type)
 	unsigned short vblocks;
 	int idx = curseg_type;
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_RO)) {
+	if (c.feature & F2FS_FEATURE_RO) {
 		if (curseg_type < NR_CURSEG_DATA_TYPE)
 			idx = CURSEG_RO_HOT_DATA;
 		else
@@ -1598,7 +1598,7 @@ static int f2fs_create_root_dir(void)
 		}
 	}
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_LOST_FOUND)) {
+	if (c.feature & F2FS_FEATURE_LOST_FOUND) {
 		err = f2fs_write_lpf_inode();
 		if (err < 0) {
 			MSG(1, "\tError: Failed to write lost+found inode!!!\n");
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 07995b3..d8c9cea 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -101,13 +101,13 @@ static void f2fs_show_info()
 	if (c.defset == CONF_ANDROID)
 		MSG(0, "Info: Set conf for android\n");
 
-	if (c.feature & le32_to_cpu(F2FS_FEATURE_CASEFOLD))
+	if (c.feature & F2FS_FEATURE_CASEFOLD)
 		MSG(0, "Info: Enable %s with casefolding\n",
 					f2fs_encoding2str(c.s_encoding));
-	if (c.feature & le32_to_cpu(F2FS_FEATURE_PRJQUOTA))
+	if (c.feature & F2FS_FEATURE_PRJQUOTA)
 		MSG(0, "Info: Enable Project quota\n");
 
-	if (c.feature & le32_to_cpu(F2FS_FEATURE_COMPRESSION))
+	if (c.feature & F2FS_FEATURE_COMPRESSION)
 		MSG(0, "Info: Enable Compression\n");
 }
 
@@ -145,32 +145,32 @@ static void add_default_options(void)
 		c.root_uid = c.root_gid = 0;
 
 		/* RO doesn't need any other features */
-		if (c.feature & cpu_to_le32(F2FS_FEATURE_RO))
+		if (c.feature & F2FS_FEATURE_RO)
 			return;
 
 		/* -O encrypt -O project_quota,extra_attr,{quota} -O verity */
-		c.feature |= cpu_to_le32(F2FS_FEATURE_ENCRYPT);
+		c.feature |= F2FS_FEATURE_ENCRYPT;
 		if (!kernel_version_over(4, 14))
-			c.feature |= cpu_to_le32(F2FS_FEATURE_QUOTA_INO);
-		c.feature |= cpu_to_le32(F2FS_FEATURE_PRJQUOTA);
-		c.feature |= cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR);
-		c.feature |= cpu_to_le32(F2FS_FEATURE_VERITY);
+			c.feature |= F2FS_FEATURE_QUOTA_INO;
+		c.feature |= F2FS_FEATURE_PRJQUOTA;
+		c.feature |= F2FS_FEATURE_EXTRA_ATTR;
+		c.feature |= F2FS_FEATURE_VERITY;
 		break;
 	}
 #ifdef CONF_CASEFOLD
 	c.s_encoding = F2FS_ENC_UTF8_12_1;
-	c.feature |= cpu_to_le32(F2FS_FEATURE_CASEFOLD);
+	c.feature |= F2FS_FEATURE_CASEFOLD;
 #endif
 #ifdef CONF_PROJID
-	c.feature |= cpu_to_le32(F2FS_FEATURE_QUOTA_INO);
-	c.feature |= cpu_to_le32(F2FS_FEATURE_PRJQUOTA);
-	c.feature |= cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR);
+	c.feature |= F2FS_FEATURE_QUOTA_INO;
+	c.feature |= F2FS_FEATURE_PRJQUOTA;
+	c.feature |= F2FS_FEATURE_EXTRA_ATTR;
 #endif
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_QUOTA_INO))
+	if (c.feature & F2FS_FEATURE_QUOTA_INO)
 		c.quota_bits = QUOTA_USR_BIT | QUOTA_GRP_BIT;
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_PRJQUOTA)) {
-		c.feature |= cpu_to_le32(F2FS_FEATURE_QUOTA_INO);
+	if (c.feature & F2FS_FEATURE_PRJQUOTA) {
+		c.feature |= F2FS_FEATURE_QUOTA_INO;
 		c.quota_bits |= QUOTA_PRJ_BIT;
 	}
 }
@@ -294,7 +294,7 @@ static void f2fs_parse_options(int argc, char *argv[])
 				MSG(0, "\tError: Unknown flag %s\n",token);
 				mkfs_usage();
 			}
-			c.feature |= cpu_to_le32(F2FS_FEATURE_CASEFOLD);
+			c.feature |= F2FS_FEATURE_CASEFOLD;
 			break;
 		case 'Z':
 			c.conf_reserved_sections = atoi(optarg);
@@ -308,28 +308,28 @@ static void f2fs_parse_options(int argc, char *argv[])
 
 	add_default_options();
 
-	if (!(c.feature & cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR))) {
-		if (c.feature & cpu_to_le32(F2FS_FEATURE_PRJQUOTA)) {
+	if (!(c.feature & F2FS_FEATURE_EXTRA_ATTR)) {
+		if (c.feature & F2FS_FEATURE_PRJQUOTA) {
 			MSG(0, "\tInfo: project quota feature should always be "
 				"enabled with extra attr feature\n");
 			exit(1);
 		}
-		if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CHKSUM)) {
+		if (c.feature & F2FS_FEATURE_INODE_CHKSUM) {
 			MSG(0, "\tInfo: inode checksum feature should always be "
 				"enabled with extra attr feature\n");
 			exit(1);
 		}
-		if (c.feature & cpu_to_le32(F2FS_FEATURE_FLEXIBLE_INLINE_XATTR)) {
+		if (c.feature & F2FS_FEATURE_FLEXIBLE_INLINE_XATTR) {
 			MSG(0, "\tInfo: flexible inline xattr feature should always be "
 				"enabled with extra attr feature\n");
 			exit(1);
 		}
-		if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CRTIME)) {
+		if (c.feature & F2FS_FEATURE_INODE_CRTIME) {
 			MSG(0, "\tInfo: inode crtime feature should always be "
 				"enabled with extra attr feature\n");
 			exit(1);
 		}
-		if (c.feature & cpu_to_le32(F2FS_FEATURE_COMPRESSION)) {
+		if (c.feature & F2FS_FEATURE_COMPRESSION) {
 			MSG(0, "\tInfo: compression feature should always be "
 				"enabled with extra attr feature\n");
 			exit(1);
@@ -356,7 +356,7 @@ static void f2fs_parse_options(int argc, char *argv[])
 		c.trim = 0;
 
 	if (c.zoned_mode)
-		c.feature |= cpu_to_le32(F2FS_FEATURE_BLKZONED);
+		c.feature |= F2FS_FEATURE_BLKZONED;
 }
 
 #ifdef HAVE_LIBBLKID
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
