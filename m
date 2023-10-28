Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9354D7DAA30
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Oct 2023 01:48:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qwt2f-0006ah-CD;
	Sat, 28 Oct 2023 23:48:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qwt2e-0006aX-2z
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Oct 2023 23:48:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1qUHyQKuUGHLuYSjCRld1/Wq56UxqEdy/3GJflvXUUw=; b=kiy90AMQEl7JypPdKmE0TrgOnK
 nmndxxOaB68oBISFhogxnrceLCAFKHrrdFmyrzxfwshLWcPtt3LKJBfMLJBH32AthP5yBW1GlJfTp
 M5EpMuf7iHIJXCgIG0yvpCLhfl1VOCzex0b8qaLf4cp27lRYg5Smg/gmAkExF+aZFPsc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1qUHyQKuUGHLuYSjCRld1/Wq56UxqEdy/3GJflvXUUw=; b=S
 Cv0J1vNHOhs2osrCjLt2fbUE5RjNGxUwt0yO/3abSJ8Y8AD4xlWp2LwIDMXcX24ubyLVldL4sDGif
 J07vQwgiUwaTbEec/Mq9NDgwIlk7GNlokcBXsZ1vF0nJvSkABux4D5/DHwSNX+mjGBkiLesrITtXu
 imQbJGsaUPhgcRCs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qwt2b-0008Fe-O3 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Oct 2023 23:48:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A6595B80935
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 28 Oct 2023 23:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1767DC433C8;
 Sat, 28 Oct 2023 23:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698536896;
 bh=4A142/pGzVZ8QRIaYTqPHYJnltXB3UHXAOTJQkHYX94=;
 h=From:To:Cc:Subject:Date:From;
 b=hApcVqxFV/WNbj7OQj74bzPdSs3+qdmrLjEVfJjMMXTOTfupTyLgR7Bh3XBxpXdWK
 Lw6x0wfyi0Kp1KCpOkb3vaDDTkTA6nXk8VQEgi3H3APitnvCyokosqxPextro4dtQ/
 FVdE/m0/0jXbskv52R/XnCQRDlAgJ54Rsf2zwC27juJcpCpfUU6Vzt455Xnong5guO
 8JjizydcaC9/nrwWouugsdmwVAZMWyKu8TZHtV1HM/MkXtWdeumQUaUDMpSV07LwmR
 LCBED1rrp8Q4GN0+cgtqVyDLUchlfKi/SRxS/DZRL2N8+PedaiZtTsar98CL6V3CcU
 QHAJYTpORDCMw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 28 Oct 2023 16:48:12 -0700
Message-ID: <20231028234813.496851-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: No need to do Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
 --- fsck/defrag.c | 2 +- fsck/dir.c | 18 +++++++++--------- fsck/dump.c |
 20 ++++++++++ fsck/fsck.c | 24 ++++++++++++ fsck/fsck.h [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qwt2b-0008Fe-O3
Subject: [f2fs-dev] [PATCH 1/2] f2fs-tools: use F2FS_BLKSIZE by default
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

No need to do

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/defrag.c  |  2 +-
 fsck/dir.c     | 18 +++++++++---------
 fsck/dump.c    | 20 ++++++++++----------
 fsck/fsck.c    | 24 ++++++++++++------------
 fsck/fsck.h    |  2 --
 fsck/mkquota.c |  2 +-
 fsck/mount.c   | 24 ++++++++++++------------
 fsck/node.c    |  4 ++--
 fsck/node.h    |  2 +-
 fsck/resize.c  | 26 +++++++++++++-------------
 fsck/segment.c | 48 ++++++++++++++++++++++++------------------------
 fsck/xattr.c   |  6 +++---
 12 files changed, 88 insertions(+), 90 deletions(-)

diff --git a/fsck/defrag.c b/fsck/defrag.c
index a630a78f4899..90c2962f19c2 100644
--- a/fsck/defrag.c
+++ b/fsck/defrag.c
@@ -11,7 +11,7 @@
 
 static int migrate_block(struct f2fs_sb_info *sbi, u64 from, u64 to)
 {
-	void *raw = calloc(BLOCK_SZ, 1);
+	void *raw = calloc(F2FS_BLKSIZE, 1);
 	struct seg_entry *se;
 	struct f2fs_summary sum;
 	u64 offset;
diff --git a/fsck/dir.c b/fsck/dir.c
index 21d9da3e7696..d51176a08c5f 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -130,7 +130,7 @@ static int find_in_level(struct f2fs_sb_info *sbi, struct f2fs_node *dir,
 	bidx = dir_block_index(level, dir_level, le32_to_cpu(namehash) % nbucket);
 	end_block = bidx + nblock;
 
-	dentry_blk = calloc(BLOCK_SZ, 1);
+	dentry_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(dentry_blk);
 
 	memset(&dn, 0, sizeof(dn));
@@ -247,7 +247,7 @@ int f2fs_add_link(struct f2fs_sb_info *sbi, struct f2fs_node *parent,
 		return -EINVAL;
 	}
 
-	dentry_blk = calloc(BLOCK_SZ, 1);
+	dentry_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(dentry_blk);
 
 	current_depth = le32_to_cpu(parent->i.i_current_depth);
@@ -349,7 +349,7 @@ static void make_empty_dir(struct f2fs_sb_info *sbi, struct f2fs_node *inode)
 
 	get_node_info(sbi, ino, &ni);
 
-	dent_blk = calloc(BLOCK_SZ, 1);
+	dent_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(dent_blk);
 
 	F2FS_DENTRY_BLOCK_DENTRY(dent_blk, 0).hash_code = 0;
@@ -398,7 +398,7 @@ static void page_symlink(struct f2fs_sb_info *sbi, struct f2fs_node *inode,
 		return;
 	}
 
-	data_blk = calloc(BLOCK_SZ, 1);
+	data_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(data_blk);
 
 	memcpy(data_blk, symname, symlen);
@@ -578,7 +578,7 @@ int convert_inline_dentry(struct f2fs_sb_info *sbi, struct f2fs_node *node,
 		struct f2fs_dentry_block *dentry_blk;
 		struct f2fs_dentry_ptr src, dst;
 
-		dentry_blk = calloc(BLOCK_SZ, 1);
+		dentry_blk = calloc(F2FS_BLKSIZE, 1);
 		ASSERT(dentry_blk);
 
 		set_new_dnode(&dn, node, NULL, ino);
@@ -698,7 +698,7 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 	if (de->from_devino)
 		found_hardlink = f2fs_search_hardlink(sbi, de);
 
-	parent = calloc(BLOCK_SZ, 1);
+	parent = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(parent);
 
 	ret = dev_read_block(parent, ni.blk_addr);
@@ -722,7 +722,7 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 		goto free_parent_dir;
 	}
 
-	child = calloc(BLOCK_SZ, 1);
+	child = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(child);
 
 	if (found_hardlink && found_hardlink->to_ino) {
@@ -770,7 +770,7 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 			/* Replace child with original block */
 			free(child);
 
-			child = calloc(BLOCK_SZ, 1);
+			child = calloc(F2FS_BLKSIZE, 1);
 			ASSERT(child);
 
 			ret = dev_read_block(child, blkaddr);
@@ -838,7 +838,7 @@ int f2fs_find_path(struct f2fs_sb_info *sbi, char *path, nid_t *ino)
 		return -ENOENT;
 
 	*ino = F2FS_ROOT_INO(sbi);
-	parent = calloc(BLOCK_SZ, 1);
+	parent = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(parent);
 
 	p = strtok(path, "/");
diff --git a/fsck/dump.c b/fsck/dump.c
index 864a3c3bb624..b2e990b2aa29 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -43,9 +43,9 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
 	char buf[BUF_SZ];
 	int fd, ret, pack;
 
-	nat_block = (struct f2fs_nat_block *)calloc(BLOCK_SZ, 1);
+	nat_block = (struct f2fs_nat_block *)calloc(F2FS_BLKSIZE, 1);
 	ASSERT(nat_block);
-	node_block = (struct f2fs_node *)calloc(BLOCK_SZ, 1);
+	node_block = (struct f2fs_node *)calloc(F2FS_BLKSIZE, 1);
 	ASSERT(node_block);
 
 	fd = open("dump_nat", O_CREAT|O_WRONLY|O_TRUNC, 0666);
@@ -321,7 +321,7 @@ static void dump_node_blk(struct f2fs_sb_info *sbi, int ntype,
 
 	get_node_info(sbi, nid, &ni);
 
-	node_blk = calloc(BLOCK_SZ, 1);
+	node_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(node_blk);
 
 	dev_read_block(node_blk, ni.blk_addr);
@@ -558,7 +558,7 @@ void dump_node_scan_disk(struct f2fs_sb_info *sbi, nid_t nid)
 	pgoff_t end_blkaddr = start_blkaddr +
 		(SM_I(sbi)->main_segments << sbi->log_blocks_per_seg);
 
-	node_blk = calloc(BLOCK_SZ, 1);
+	node_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(node_blk);
 	MSG(0, "Info: scan all nid: %u from block_addr [%lu: %lu]\n",
 			nid, start_blkaddr, end_blkaddr);
@@ -590,7 +590,7 @@ int dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force)
 
 	get_node_info(sbi, nid, &ni);
 
-	node_blk = calloc(BLOCK_SZ, 1);
+	node_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(node_blk);
 
 	DBG(1, "Node ID               [0x%x]\n", nid);
@@ -632,7 +632,7 @@ static void dump_node_from_blkaddr(struct f2fs_sb_info *sbi, u32 blk_addr)
 	struct f2fs_node *node_blk;
 	int ret;
 
-	node_blk = calloc(BLOCK_SZ, 1);
+	node_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(node_blk);
 
 	ret = dev_read_block(node_blk, blk_addr);
@@ -675,7 +675,7 @@ static void dump_data_offset(u32 blk_addr, int ofs_in_node)
 	unsigned int node_ofs;
 	int ret;
 
-	node_blk = calloc(BLOCK_SZ, 1);
+	node_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(node_blk);
 
 	ret = dev_read_block(node_blk, blk_addr);
@@ -697,7 +697,7 @@ static void dump_node_offset(u32 blk_addr)
 	struct f2fs_node *node_blk;
 	int ret;
 
-	node_blk = calloc(BLOCK_SZ, 1);
+	node_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(node_blk);
 
 	ret = dev_read_block(node_blk, blk_addr);
@@ -712,7 +712,7 @@ static int has_dirent(u32 blk_addr, int is_inline, int *enc_name)
 	struct f2fs_node *node_blk;
 	int ret, is_dentry = 0;
 
-	node_blk = calloc(BLOCK_SZ, 1);
+	node_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(node_blk);
 
 	ret = dev_read_block(node_blk, blk_addr);
@@ -737,7 +737,7 @@ static void dump_dirent(u32 blk_addr, int is_inline, int enc_name)
 	void *inline_dentry, *blk;
 	int ret, i = 0;
 
-	blk = calloc(BLOCK_SZ, 1);
+	blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(blk);
 
 	ret = dev_read_block(blk, blk_addr);
diff --git a/fsck/fsck.c b/fsck/fsck.c
index 429761605e7d..c97dceb406b3 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -236,7 +236,7 @@ static int is_valid_summary(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	struct node_info ni;
 	int ret = 0;
 
-	node_blk = (struct f2fs_node *)calloc(BLOCK_SZ, 1);
+	node_blk = (struct f2fs_node *)calloc(F2FS_BLKSIZE, 1);
 	ASSERT(node_blk != NULL);
 
 	if (!IS_VALID_NID(sbi, nid))
@@ -545,7 +545,7 @@ int fsck_sanity_check_nid(struct f2fs_sb_info *sbi, u32 nid,
 	struct node_info ni;
 	int ret;
 
-	node_blk = (struct f2fs_node *)calloc(BLOCK_SZ, 1);
+	node_blk = (struct f2fs_node *)calloc(F2FS_BLKSIZE, 1);
 	ASSERT(node_blk != NULL);
 
 	ret = sanity_check_nid(sbi, nid, node_blk, ftype, ntype, &ni);
@@ -564,7 +564,7 @@ static int fsck_chk_xattr_blk(struct f2fs_sb_info *sbi, u32 ino,
 	if (x_nid == 0x0)
 		return 0;
 
-	node_blk = (struct f2fs_node *)calloc(BLOCK_SZ, 1);
+	node_blk = (struct f2fs_node *)calloc(F2FS_BLKSIZE, 1);
 	ASSERT(node_blk != NULL);
 
 	/* Sanity check */
@@ -590,7 +590,7 @@ int fsck_chk_node_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
 	struct node_info ni;
 	struct f2fs_node *node_blk = NULL;
 
-	node_blk = (struct f2fs_node *)calloc(BLOCK_SZ, 1);
+	node_blk = (struct f2fs_node *)calloc(F2FS_BLKSIZE, 1);
 	ASSERT(node_blk != NULL);
 
 	if (sanity_check_nid(sbi, nid, node_blk, ftype, ntype, &ni))
@@ -657,7 +657,7 @@ int fsck_chk_root_inode(struct f2fs_sb_info *sbi)
 	u32 last_ctime_nsec = 0;
 	int ret = -EINVAL;
 
-	node_blk = calloc(BLOCK_SZ, 1);
+	node_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(node_blk);
 
 	MSG(0, "Info: root inode is corrupted, search and relink it\n");
@@ -2013,7 +2013,7 @@ int fsck_chk_dentry_blk(struct f2fs_sb_info *sbi, int casefolded, u32 blk_addr,
 	struct f2fs_dentry *new_dentry;
 	int dentries, ret;
 
-	de_blk = (struct f2fs_dentry_block *)calloc(BLOCK_SZ, 1);
+	de_blk = (struct f2fs_dentry_block *)calloc(F2FS_BLKSIZE, 1);
 	ASSERT(de_blk != NULL);
 
 	ret = dev_read_block(de_blk, blk_addr);
@@ -2113,10 +2113,10 @@ int fsck_chk_orphan_node(struct f2fs_sb_info *sbi)
 
 	f2fs_ra_meta_pages(sbi, start_blk, orphan_blkaddr, META_CP);
 
-	orphan_blk = calloc(BLOCK_SZ, 1);
+	orphan_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(orphan_blk);
 
-	new_blk = calloc(BLOCK_SZ, 1);
+	new_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(new_blk);
 
 	for (i = 0; i < orphan_blkaddr; i++) {
@@ -2164,8 +2164,8 @@ int fsck_chk_orphan_node(struct f2fs_sb_info *sbi)
 			ret = dev_write_block(new_blk, start_blk + i);
 			ASSERT(ret >= 0);
 		}
-		memset(orphan_blk, 0, BLOCK_SZ);
-		memset(new_blk, 0, BLOCK_SZ);
+		memset(orphan_blk, 0, F2FS_BLKSIZE);
+		memset(new_blk, 0, F2FS_BLKSIZE);
 	}
 	free(orphan_blk);
 	free(new_blk);
@@ -2442,7 +2442,7 @@ static void fix_hard_links(struct f2fs_sb_info *sbi)
 	if (fsck->hard_link_list_head == NULL)
 		return;
 
-	node_blk = (struct f2fs_node *)calloc(BLOCK_SZ, 1);
+	node_blk = (struct f2fs_node *)calloc(F2FS_BLKSIZE, 1);
 	ASSERT(node_blk != NULL);
 
 	node = fsck->hard_link_list_head;
@@ -2482,7 +2482,7 @@ static void flush_curseg_sit_entries(struct f2fs_sb_info *sbi)
 	struct f2fs_sit_block *sit_blk;
 	int i;
 
-	sit_blk = calloc(BLOCK_SZ, 1);
+	sit_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(sit_blk);
 	/* update curseg sit entries, since we may change
 	 * a segment type in move_curseg_info
diff --git a/fsck/fsck.h b/fsck/fsck.h
index c25f3819f980..c85a0741b257 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -126,8 +126,6 @@ struct f2fs_fsck {
 	struct quota_ctx *qctx;
 };
 
-#define BLOCK_SZ		F2FS_BLKSIZE
-
 enum NODE_TYPE {
 	TYPE_INODE = 37,
 	TYPE_DIRECT_NODE = 43,
diff --git a/fsck/mkquota.c b/fsck/mkquota.c
index d18141e2460f..2451b58ed030 100644
--- a/fsck/mkquota.c
+++ b/fsck/mkquota.c
@@ -302,7 +302,7 @@ void quota_add_inode_usage(quota_ctx_t qctx, f2fs_ino_t ino,
 					UINT_TO_VOIDPTR(ino), NULL);
 		}
 
-		qsize_t space = (inode->i_blocks - 1) * BLOCK_SZ;
+		qsize_t space = (inode->i_blocks - 1) * F2FS_BLKSIZE;
 		quota_data_add(qctx, inode, space);
 		quota_data_inodes(qctx, inode, +1);
 	}
diff --git a/fsck/mount.c b/fsck/mount.c
index 805671cdd628..7871f2f48c81 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -859,7 +859,7 @@ void update_superblock(struct f2fs_super_block *sb, int sb_mask)
 	uint8_t *buf;
 	u32 old_crc, new_crc;
 
-	buf = calloc(BLOCK_SZ, 1);
+	buf = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(buf);
 
 	if (get_sb(feature) & F2FS_FEATURE_SB_CHKSUM) {
@@ -2366,7 +2366,7 @@ struct f2fs_summary_block *get_sum_block(struct f2fs_sb_info *sbi,
 		}
 	}
 
-	sum_blk = calloc(BLOCK_SZ, 1);
+	sum_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(sum_blk);
 
 	ret = dev_read_block(sum_blk, ssa_blk);
@@ -2410,7 +2410,7 @@ static void get_nat_entry(struct f2fs_sb_info *sbi, nid_t nid,
 	if (lookup_nat_in_journal(sbi, nid, raw_nat) >= 0)
 		return;
 
-	nat_block = (struct f2fs_nat_block *)calloc(BLOCK_SZ, 1);
+	nat_block = (struct f2fs_nat_block *)calloc(F2FS_BLKSIZE, 1);
 	ASSERT(nat_block);
 
 	entry_off = nid % NAT_ENTRY_PER_BLOCK;
@@ -2432,7 +2432,7 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
 	block_t oldaddr, startaddr, endaddr;
 	int ret;
 
-	node_blk = (struct f2fs_node *)calloc(BLOCK_SZ, 1);
+	node_blk = (struct f2fs_node *)calloc(F2FS_BLKSIZE, 1);
 	ASSERT(node_blk);
 
 	get_node_info(sbi, nid, &ni);
@@ -2484,7 +2484,7 @@ void update_nat_blkaddr(struct f2fs_sb_info *sbi, nid_t ino,
 	int entry_off;
 	int ret;
 
-	nat_block = (struct f2fs_nat_block *)calloc(BLOCK_SZ, 1);
+	nat_block = (struct f2fs_nat_block *)calloc(F2FS_BLKSIZE, 1);
 	ASSERT(nat_block);
 
 	entry_off = nid % NAT_ENTRY_PER_BLOCK;
@@ -2532,7 +2532,7 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 	unsigned int i, segno, end;
 	unsigned int readed, start_blk = 0;
 
-	sit_blk = calloc(BLOCK_SZ, 1);
+	sit_blk = calloc(F2FS_BLKSIZE, 1);
 	if (!sit_blk) {
 		MSG(1, "\tError: Calloc failed for build_sit_entries!\n");
 		return -ENOMEM;
@@ -2684,7 +2684,7 @@ void rewrite_sit_area_bitmap(struct f2fs_sb_info *sbi)
 	struct f2fs_summary_block *sum = curseg->sum_blk;
 	char *ptr = NULL;
 
-	sit_blk = calloc(BLOCK_SZ, 1);
+	sit_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(sit_blk);
 	/* remove sit journal */
 	F2FS_SUMMARY_BLOCK_JOURNAL(sum)->n_sits = 0;
@@ -2734,7 +2734,7 @@ static int flush_sit_journal_entries(struct f2fs_sb_info *sbi)
 	unsigned int segno;
 	int i;
 
-	sit_blk = calloc(BLOCK_SZ, 1);
+	sit_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(sit_blk);
 	for (i = 0; i < sits_in_cursum(journal); i++) {
 		struct f2fs_sit_entry *sit;
@@ -2770,7 +2770,7 @@ static int flush_nat_journal_entries(struct f2fs_sb_info *sbi)
 	int ret;
 	int i = 0;
 
-	nat_block = (struct f2fs_nat_block *)calloc(BLOCK_SZ, 1);
+	nat_block = (struct f2fs_nat_block *)calloc(F2FS_BLKSIZE, 1);
 	ASSERT(nat_block);
 next:
 	if (i >= nats_in_cursum(journal)) {
@@ -2814,7 +2814,7 @@ void flush_sit_entries(struct f2fs_sb_info *sbi)
 	struct f2fs_sit_block *sit_blk;
 	unsigned int segno = 0;
 
-	sit_blk = calloc(BLOCK_SZ, 1);
+	sit_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(sit_blk);
 	/* update free segments */
 	for (segno = 0; segno < MAIN_SEGS(sbi); segno++) {
@@ -3129,7 +3129,7 @@ void nullify_nat_entry(struct f2fs_sb_info *sbi, u32 nid)
 			return;
 		}
 	}
-	nat_block = (struct f2fs_nat_block *)calloc(BLOCK_SZ, 1);
+	nat_block = (struct f2fs_nat_block *)calloc(F2FS_BLKSIZE, 1);
 	ASSERT(nat_block);
 
 	entry_off = nid % NAT_ENTRY_PER_BLOCK;
@@ -3331,7 +3331,7 @@ void build_nat_area_bitmap(struct f2fs_sb_info *sbi)
 	int ret;
 	unsigned int i;
 
-	nat_block = (struct f2fs_nat_block *)calloc(BLOCK_SZ, 1);
+	nat_block = (struct f2fs_nat_block *)calloc(F2FS_BLKSIZE, 1);
 	ASSERT(nat_block);
 
 	/* Alloc & build nat entry bitmap */
diff --git a/fsck/node.c b/fsck/node.c
index 3761470d60ea..d53756dc3af2 100644
--- a/fsck/node.c
+++ b/fsck/node.c
@@ -125,7 +125,7 @@ block_t new_node_block(struct f2fs_sb_info *sbi,
 
 	f2fs_inode = dn->inode_blk;
 
-	node_blk = calloc(BLOCK_SZ, 1);
+	node_blk = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(node_blk);
 
 	F2FS_NODE_FOOTER(node_blk)->nid = cpu_to_le32(dn->nid);
@@ -290,7 +290,7 @@ int get_dnode_of_data(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
 			struct node_info ni;
 
 			get_node_info(sbi, nids[i], &ni);
-			dn->node_blk = calloc(BLOCK_SZ, 1);
+			dn->node_blk = calloc(F2FS_BLKSIZE, 1);
 			ASSERT(dn->node_blk);
 
 			ret = dev_read_block(dn->node_blk, ni.blk_addr);
diff --git a/fsck/node.h b/fsck/node.h
index a6108aca8d68..ac0e7b3a5cd3 100644
--- a/fsck/node.h
+++ b/fsck/node.h
@@ -35,7 +35,7 @@ static inline unsigned int ADDRS_PER_PAGE(struct f2fs_sb_info *sbi,
 	if (!inode_blk) {
 		struct node_info ni;
 
-		inode_blk = calloc(BLOCK_SZ, 2);
+		inode_blk = calloc(F2FS_BLKSIZE, 2);
 		ASSERT(inode_blk);
 
 		get_node_info(sbi, ino, &ni);
diff --git a/fsck/resize.c b/fsck/resize.c
index 6c3f4bdb49c1..a3424b4011ee 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -167,7 +167,7 @@ safe_resize:
 
 static void migrate_main(struct f2fs_sb_info *sbi, unsigned int offset)
 {
-	void *raw = calloc(BLOCK_SZ, 1);
+	void *raw = calloc(F2FS_BLKSIZE, 1);
 	struct seg_entry *se;
 	block_t from, to;
 	int i, j, ret;
@@ -243,7 +243,7 @@ static void migrate_ssa(struct f2fs_sb_info *sbi,
 					MAIN_SEGS(sbi) - offset;
 	block_t blkaddr;
 	int ret;
-	void *zero_block = calloc(BLOCK_SZ, 1);
+	void *zero_block = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(zero_block);
 
 	if (offset && new_sum_blkaddr < old_sum_blkaddr + offset) {
@@ -287,9 +287,9 @@ static int shrink_nats(struct f2fs_sb_info *sbi,
 	pgoff_t block_addr;
 	int seg_off;
 
-	nat_block = malloc(BLOCK_SZ);
+	nat_block = malloc(F2FS_BLKSIZE);
 	ASSERT(nat_block);
-	zero_block = calloc(BLOCK_SZ, 1);
+	zero_block = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(zero_block);
 
 	nat_blocks = get_newsb(segment_count_nat) >> 1;
@@ -309,7 +309,7 @@ static int shrink_nats(struct f2fs_sb_info *sbi,
 		ret = dev_read_block(nat_block, block_addr);
 		ASSERT(ret >= 0);
 
-		if (memcmp(zero_block, nat_block, BLOCK_SZ)) {
+		if (memcmp(zero_block, nat_block, F2FS_BLKSIZE)) {
 			ret = -1;
 			goto not_avail;
 		}
@@ -336,7 +336,7 @@ static void migrate_nat(struct f2fs_sb_info *sbi,
 	pgoff_t block_addr;
 	int seg_off;
 
-	nat_block = malloc(BLOCK_SZ);
+	nat_block = malloc(F2FS_BLKSIZE);
 	ASSERT(nat_block);
 
 	for (nid = nm_i->max_nid - 1; nid >= 0; nid -= NAT_ENTRY_PER_BLOCK) {
@@ -364,7 +364,7 @@ static void migrate_nat(struct f2fs_sb_info *sbi,
 		ASSERT(ret >= 0);
 	}
 	/* zero out newly assigned nids */
-	memset(nat_block, 0, BLOCK_SZ);
+	memset(nat_block, 0, F2FS_BLKSIZE);
 	nat_blocks = get_newsb(segment_count_nat) >> 1;
 	nat_blocks = nat_blocks << get_sb(log_blocks_per_seg);
 	new_max_nid = NAT_ENTRY_PER_BLOCK * nat_blocks;
@@ -396,7 +396,7 @@ static void migrate_sit(struct f2fs_sb_info *sbi,
 	struct sit_info *sit_i = SIT_I(sbi);
 	unsigned int ofs = 0, pre_ofs = 0;
 	unsigned int segno, index;
-	struct f2fs_sit_block *sit_blk = calloc(BLOCK_SZ, 1);
+	struct f2fs_sit_block *sit_blk = calloc(F2FS_BLKSIZE, 1);
 	block_t sit_blks = get_newsb(segment_count_sit) <<
 						(sbi->log_blocks_per_seg - 1);
 	struct seg_entry *se;
@@ -430,7 +430,7 @@ static void migrate_sit(struct f2fs_sb_info *sbi,
 			DBG(1, "Write valid sit: %x\n", blk_addr);
 
 			pre_ofs = ofs;
-			memset(sit_blk, 0, BLOCK_SZ);
+			memset(sit_blk, 0, F2FS_BLKSIZE);
 		}
 
 		sit = &sit_blk->entries[SIT_ENTRY_OFFSET(sit_i, segno - offset)];
@@ -464,10 +464,10 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
 	void *buf;
 	int i, ret;
 
-	new_cp = calloc(new_cp_blks * BLOCK_SZ, 1);
+	new_cp = calloc(new_cp_blks * F2FS_BLKSIZE, 1);
 	ASSERT(new_cp);
 
-	buf = malloc(BLOCK_SZ);
+	buf = malloc(F2FS_BLKSIZE);
 	ASSERT(buf);
 
 	/* ovp / free segments */
@@ -561,7 +561,7 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
 	ret = dev_write_block(new_cp, new_cp_blk_no++);
 	ASSERT(ret >= 0);
 
-	memset(buf, 0, BLOCK_SZ);
+	memset(buf, 0, F2FS_BLKSIZE);
 	for (i = 0; i < get_newsb(cp_payload); i++) {
 		ret = dev_write_block(buf, new_cp_blk_no++);
 		ASSERT(ret >= 0);
@@ -594,7 +594,7 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
 		write_nat_bits(sbi, new_sb, new_cp, sbi->cur_cp == 1 ? 2 : 1);
 
 	/* disable old checkpoint */
-	memset(buf, 0, BLOCK_SZ);
+	memset(buf, 0, F2FS_BLKSIZE);
 	ret = dev_write_block(buf, old_cp_blk_no);
 	ASSERT(ret >= 0);
 
diff --git a/fsck/segment.c b/fsck/segment.c
index 4ea0a6f33afd..934004e1c7f1 100644
--- a/fsck/segment.c
+++ b/fsck/segment.c
@@ -131,7 +131,7 @@ int new_data_block(struct f2fs_sb_info *sbi, void *block,
 		type = CURSEG_HOT_DATA;
 
 	ASSERT(dn->node_blk);
-	memset(block, 0, BLOCK_SZ);
+	memset(block, 0, F2FS_BLKSIZE);
 
 	get_node_info(sbi, dn->nid, &ni);
 	set_summary(&sum, dn->nid, dn->ofs_in_node, ni.version);
@@ -157,7 +157,7 @@ u64 f2fs_quota_size(struct quota_file *qf)
 	struct f2fs_node *inode;
 	u64 filesize;
 
-	inode = (struct f2fs_node *) calloc(BLOCK_SZ, 1);
+	inode = (struct f2fs_node *) calloc(F2FS_BLKSIZE, 1);
 	ASSERT(inode);
 
 	/* Read inode */
@@ -188,9 +188,9 @@ u64 f2fs_read(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
 	memset(&dn, 0, sizeof(dn));
 
 	/* Memory allocation for block buffer and inode. */
-	blk_buffer = calloc(BLOCK_SZ, 2);
+	blk_buffer = calloc(F2FS_BLKSIZE, 2);
 	ASSERT(blk_buffer);
-	inode = (struct f2fs_node*)(blk_buffer + BLOCK_SZ);
+	inode = (struct f2fs_node*)(blk_buffer + F2FS_BLKSIZE);
 
 	/* Read inode */
 	get_node_info(sbi, ino, &ni);
@@ -225,13 +225,13 @@ u64 f2fs_read(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
 		if (blkaddr == NULL_ADDR || blkaddr == NEW_ADDR)
 			break;
 
-		off_in_blk = offset % BLOCK_SZ;
-		len_in_blk = BLOCK_SZ - off_in_blk;
+		off_in_blk = offset % F2FS_BLKSIZE;
+		len_in_blk = F2FS_BLKSIZE - off_in_blk;
 		if (len_in_blk > count)
 			len_in_blk = count;
 
 		/* Read data from single block. */
-		if (len_in_blk < BLOCK_SZ) {
+		if (len_in_blk < F2FS_BLKSIZE) {
 			ASSERT(dev_read_block(blk_buffer, blkaddr) >= 0);
 			memcpy(buffer, blk_buffer + off_in_blk, len_in_blk);
 		} else {
@@ -290,9 +290,9 @@ static u64 f2fs_write_ex(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
 		ASSERT(offset % F2FS_BLKSIZE == 0); /* block boundary only */
 
 	/* Memory allocation for block buffer and inode. */
-	blk_buffer = calloc(BLOCK_SZ, 2);
+	blk_buffer = calloc(F2FS_BLKSIZE, 2);
 	ASSERT(blk_buffer);
-	inode = (struct f2fs_node*)(blk_buffer + BLOCK_SZ);
+	inode = (struct f2fs_node*)(blk_buffer + F2FS_BLKSIZE);
 
 	/* Read inode */
 	get_node_info(sbi, ino, &ni);
@@ -340,13 +340,13 @@ static u64 f2fs_write_ex(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
 			idirty |= dn.idirty;
 		}
 
-		off_in_blk = offset % BLOCK_SZ;
-		len_in_blk = BLOCK_SZ - off_in_blk;
+		off_in_blk = offset % F2FS_BLKSIZE;
+		len_in_blk = F2FS_BLKSIZE - off_in_blk;
 		if (len_in_blk > count)
 			len_in_blk = count;
 
 		/* Write data to single block. */
-		if (len_in_blk < BLOCK_SZ) {
+		if (len_in_blk < F2FS_BLKSIZE) {
 			ASSERT(dev_read_block(blk_buffer, blkaddr) >= 0);
 			memcpy(blk_buffer + off_in_blk, buffer, len_in_blk);
 			ASSERT(dev_write_block(blk_buffer, blkaddr) >= 0);
@@ -406,7 +406,7 @@ void f2fs_filesize_update(struct f2fs_sb_info *sbi, nid_t ino, u64 filesize)
 	struct node_info ni;
 	struct f2fs_node *inode;
 
-	inode = calloc(BLOCK_SZ, 1);
+	inode = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(inode);
 	get_node_info(sbi, ino, &ni);
 
@@ -504,7 +504,7 @@ static void update_largest_extent(struct f2fs_sb_info *sbi, nid_t ino)
 	memset(&dn, 0, sizeof(dn));
 	largest_ext.len = cur_ext.len = 0;
 
-	inode = (struct f2fs_node *) calloc(BLOCK_SZ, 1);
+	inode = (struct f2fs_node *) calloc(F2FS_BLKSIZE, 1);
 	ASSERT(inode);
 
 	/* Read inode info */
@@ -572,7 +572,7 @@ int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
 {
 	int fd, n = -1;
 	pgoff_t off = 0;
-	u8 buffer[BLOCK_SZ];
+	u8 buffer[F2FS_BLKSIZE];
 	struct node_info ni;
 	struct f2fs_node *node_blk;
 
@@ -602,7 +602,7 @@ int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
 
 		get_node_info(sbi, de->ino, &ni);
 
-		node_blk = calloc(BLOCK_SZ, 1);
+		node_blk = calloc(F2FS_BLKSIZE, 1);
 		ASSERT(node_blk);
 
 		ret = dev_read_block(node_blk, ni.blk_addr);
@@ -616,7 +616,7 @@ int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
 			node_blk->i.i_extra_isize =
 					cpu_to_le16(calc_extra_isize());
 		}
-		n = read(fd, buffer, BLOCK_SZ);
+		n = read(fd, buffer, F2FS_BLKSIZE);
 		ASSERT((unsigned long)n == de->size);
 		memcpy(inline_data_addr(node_blk), buffer, de->size);
 		node_blk->i.i_size = cpu_to_le64(de->size);
@@ -629,7 +629,7 @@ int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
 		u8 *rbuf = c.compress.cc.rbuf;
 		unsigned int cblocks = 0;
 
-		node_blk = calloc(BLOCK_SZ, 1);
+		node_blk = calloc(F2FS_BLKSIZE, 1);
 		ASSERT(node_blk);
 
 		/* read inode */
@@ -649,11 +649,11 @@ int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
 			int ret = c.compress.ops->compress(&c.compress.cc);
 			u64 wlen;
 			u32 csize = ALIGN_UP(c.compress.cc.clen +
-					COMPRESS_HEADER_SIZE, BLOCK_SZ);
+					COMPRESS_HEADER_SIZE, F2FS_BLKSIZE);
 			unsigned int cur_cblk;
 
 			if (ret || n < c.compress.cc.rlen ||
-				n < (int)(csize + BLOCK_SZ *
+				n < (int)(csize + F2FS_BLKSIZE *
 						c.compress.min_blocks)) {
 				wlen = f2fs_write(sbi, de->ino, rbuf, n, off);
 				ASSERT((int)wlen == n);
@@ -663,14 +663,14 @@ int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
 				ASSERT(!wlen);
 				wlen = f2fs_write_compress_data(sbi, de->ino,
 						(u8 *)c.compress.cc.cbuf,
-						csize, off + BLOCK_SZ);
+						csize, off + F2FS_BLKSIZE);
 				ASSERT(wlen == csize);
 				c.compress.ops->reset(&c.compress.cc);
 				cur_cblk = (c.compress.cc.rlen - csize) /
-								BLOCK_SZ;
+								F2FS_BLKSIZE;
 				cblocks += cur_cblk;
 				wlen = f2fs_fix_mutable(sbi, de->ino,
-						off + BLOCK_SZ + csize,
+						off + F2FS_BLKSIZE + csize,
 						cur_cblk);
 				ASSERT(!wlen);
 			}
@@ -703,7 +703,7 @@ int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
 		}
 #endif
 	} else {
-		while ((n = read(fd, buffer, BLOCK_SZ)) > 0) {
+		while ((n = read(fd, buffer, F2FS_BLKSIZE)) > 0) {
 			f2fs_write(sbi, de->ino, buffer, n, off);
 			off += n;
 		}
diff --git a/fsck/xattr.c b/fsck/xattr.c
index 9ccf3615229e..e291ef4740ba 100644
--- a/fsck/xattr.c
+++ b/fsck/xattr.c
@@ -30,7 +30,7 @@ void *read_all_xattrs(struct f2fs_sb_info *sbi, struct f2fs_node *inode,
 			return NULL;
 	}
 
-	txattr_addr = calloc(inline_size + BLOCK_SZ, 1);
+	txattr_addr = calloc(inline_size + F2FS_BLKSIZE, 1);
 	ASSERT(txattr_addr);
 
 	if (inline_size)
@@ -110,7 +110,7 @@ void write_all_xattrs(struct f2fs_sb_info *sbi,
 		set_new_dnode(&dn, inode, NULL, xnid);
 		get_node_info(sbi, xnid, &ni);
 		blkaddr = ni.blk_addr;
-		xattr_node = calloc(BLOCK_SZ, 1);
+		xattr_node = calloc(F2FS_BLKSIZE, 1);
 		ASSERT(xattr_node);
 		ret = dev_read_block(xattr_node, ni.blk_addr);
 		if (ret < 0)
@@ -161,7 +161,7 @@ int f2fs_setxattr(struct f2fs_sb_info *sbi, nid_t ino, int index, const char *na
 	ASSERT(index == F2FS_XATTR_INDEX_SECURITY);
 
 	get_node_info(sbi, ino, &ni);
-	inode = calloc(BLOCK_SZ, 1);
+	inode = calloc(F2FS_BLKSIZE, 1);
 	ASSERT(inode);
 	ret = dev_read_block(inode, ni.blk_addr);
 	ASSERT(ret >= 0);
-- 
2.42.0.820.g83a721a137-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
