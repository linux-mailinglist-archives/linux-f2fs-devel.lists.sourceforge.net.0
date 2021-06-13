Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E7D3A56B4
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 13 Jun 2021 07:56:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lsJ6D-0004dF-4J; Sun, 13 Jun 2021 05:55:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lsJ65-0004cv-G5
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Jun 2021 05:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OOwR3r4+otoWlXBuFGJYmgj8bnSeOuqShEb0P3tWuGQ=; b=UR623sdkMy0TxQhJuXEdieGgM/
 UU4k5Q7oBjaxkdaltKWO/aYtERlrb6DmpRX8EJHuw+tHO1QdnVhX6FL+AmX3wQwDUTpbZcdwljPkG
 aMfpkobl8woCSr8ey6neEv3pHrXIZI1TLFlemVs3d3qZt2inoJbA7bohBZwf1TSyTtwQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OOwR3r4+otoWlXBuFGJYmgj8bnSeOuqShEb0P3tWuGQ=; b=lPr3yJRCZPyu1HIsOundU2xzaj
 6S4ePXkKwiF2wjEEx4cheMFnLx87Jmh4PNmM1ChYisQotc5aiczyQy+nJYcQgMvaKWklyhEHq7U6z
 ucHyLTHkjWUvJQUIhw8tjGE9/n76SwDjT/yWIcTbPufPyScjOYmy7VNpzwgvtmstMwPM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lsJ61-007HPM-NZ
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Jun 2021 05:55:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AA4D611CE;
 Sun, 13 Jun 2021 05:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623563732;
 bh=qHbQrIlB4qwesWGvgKjIF9tlP4sMfmYjr+ut301+/c8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h3z9ioA0nzNCrEDGm20+MHyTM/39eIo3Z1XCXYzCl9jQBEjWJWWQy50nNBSjGUS4n
 i2WwfAkDAmI1tLVkYtmRlZun4lfTQWcVzlH5zl6O4nRlL/BZLAbY+5zLCNuxymffb4
 JUSuYUq41nFf3IjeRktwIzvYLKmxpSi/3dcE65fV1l1olC784CGlLHgaXW7C++BiCk
 eOaCrLNDfkxcqHH7fg3xAa6jjJ7o7K7eMIzxMrDZoIyTd4AQSA6iphONQiFNmN13RS
 PnoY9BOwofPgH2gsFAKbmsSOH5o5O2W/3AGgCc4QjJfVIFAR9FjwNSHIveiv91fR0p
 oO/mgyxpkwtRg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 12 Jun 2021 22:55:28 -0700
Message-Id: <20210613055529.2471492-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210613055529.2471492-1-jaegeuk@kernel.org>
References: <20210613055529.2471492-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lsJ61-007HPM-NZ
Subject: [f2fs-dev] [PATCH 2/3] fsck.f2fs: add -M to get file map
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

This option shows all the file names in the disk.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/dump.c       | 18 +++++++------
 fsck/fsck.c       | 64 +++++++++++++++++++++++++++++++++++++++++------
 fsck/fsck.h       | 15 ++++++++---
 fsck/main.c       |  9 +++++--
 fsck/mount.c      |  3 +++
 include/f2fs_fs.h |  5 ++--
 man/fsck.f2fs.8   |  7 ++++++
 7 files changed, 100 insertions(+), 21 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index e25c70af84ed..01e5954bd47d 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -400,7 +400,7 @@ static void dump_xattr(struct f2fs_sb_info *UNUSED(sbi),
 }
 #endif
 
-static void dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
+static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 					struct f2fs_node *node_blk)
 {
 	u32 i = 0;
@@ -411,7 +411,7 @@ static void dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 		/* recover from inline data */
 		dev_write_dump(((unsigned char *)node_blk) + INLINE_DATA_OFFSET,
 						0, MAX_INLINE_DATA(node_blk));
-		return;
+		return -1;
 	}
 
 	/* check data blocks in inode */
@@ -437,9 +437,10 @@ static void dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	print_extent(true);
 
 	dump_xattr(sbi, node_blk);
+	return 0;
 }
 
-static void dump_file(struct f2fs_sb_info *sbi, struct node_info *ni,
+static int dump_file(struct f2fs_sb_info *sbi, struct node_info *ni,
 				struct f2fs_node *node_blk, int force)
 {
 	struct f2fs_inode *inode = &node_blk->i;
@@ -453,13 +454,13 @@ static void dump_file(struct f2fs_sb_info *sbi, struct node_info *ni,
 
 	if (is_encrypted) {
 		MSG(force, "File is encrypted\n");
-		return;
+		return -1;
 	}
 
 	if ((!S_ISREG(imode) && !S_ISLNK(imode)) ||
 				namelen == 0 || namelen > F2FS_NAME_LEN) {
 		MSG(force, "Not a regular file or wrong name info\n\n");
-		return;
+		return -1;
 	}
 	if (force)
 		goto dump;
@@ -494,6 +495,7 @@ dump:
 
 		close(c.dump_fd);
 	}
+	return 0;
 }
 
 static bool is_sit_bitmap_set(struct f2fs_sb_info *sbi, u32 blk_addr)
@@ -508,10 +510,11 @@ static bool is_sit_bitmap_set(struct f2fs_sb_info *sbi, u32 blk_addr)
 			(const char *)se->cur_valid_map) != 0;
 }
 
-void dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force)
+int dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force)
 {
 	struct node_info ni;
 	struct f2fs_node *node_blk;
+	int ret = 0;
 
 	get_node_info(sbi, nid, &ni);
 
@@ -544,13 +547,14 @@ void dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force)
 			print_node_info(sbi, node_blk, force);
 
 		if (ni.ino == ni.nid)
-			dump_file(sbi, &ni, node_blk, force);
+			ret = dump_file(sbi, &ni, node_blk, force);
 	} else {
 		print_node_info(sbi, node_blk, force);
 		MSG(force, "Invalid (i)node block\n\n");
 	}
 out:
 	free(node_blk);
+	return ret;
 }
 
 static void dump_node_from_blkaddr(struct f2fs_sb_info *sbi, u32 blk_addr)
diff --git a/fsck/fsck.c b/fsck/fsck.c
index 80a6d8edfe71..2c741c16124f 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -695,6 +695,8 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 
 	if (ftype == F2FS_FT_DIR) {
 		f2fs_set_main_bitmap(sbi, ni->blk_addr, CURSEG_HOT_NODE);
+		memcpy(child.p_name, node_blk->i.i_name,
+					node_blk->i.i_namelen);;
 	} else {
 		if (f2fs_test_main_bitmap(sbi, ni->blk_addr) == 0) {
 			f2fs_set_main_bitmap(sbi, ni->blk_addr,
@@ -1298,10 +1300,12 @@ void pretty_print_filename(const u8 *raw_name, u32 len,
 	out[len] = 0;
 }
 
-static void print_dentry(__u32 depth, __u8 *name,
+static void print_dentry(struct f2fs_sb_info *sbi, __u8 *name,
 		u8 *bitmap, struct f2fs_dir_entry *dentry,
 		int max, int idx, int last_blk, int enc_name)
 {
+	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
+	u32 depth = fsck->dentry_depth;
 	int last_de = 0;
 	int next_idx = 0;
 	u32 name_len;
@@ -1309,7 +1313,7 @@ static void print_dentry(__u32 depth, __u8 *name,
 	int bit_offset;
 	char new[F2FS_PRINT_NAMELEN];
 
-	if (!c.show_dentry)
+	if (!c.show_dentry && !c.show_file_map)
 		return;
 
 	name_len = le16_to_cpu(dentry[idx].name_len);
@@ -1334,15 +1338,31 @@ static void print_dentry(__u32 depth, __u8 *name,
 	if (tree_mark[depth - 1] == '`')
 		tree_mark[depth - 1] = ' ';
 
-	for (i = 1; i < depth; i++)
-		printf("%c   ", tree_mark[i]);
-
 	pretty_print_filename(name, name_len, new, enc_name);
 
-	printf("%c-- %s <ino = 0x%x>, <encrypted (%d)>\n",
+	if (c.show_file_map) {
+		struct f2fs_dentry *d = fsck->dentry;
+
+		if (dentry[idx].file_type != F2FS_FT_REG_FILE)
+			return;
+
+		while (d) {
+			if (d->depth > 1)
+				printf("/%s", d->name);
+			d = d->next;
+		}
+		printf("/%s", new);
+		if (dump_node(sbi, le32_to_cpu(dentry[idx].ino), 0))
+			printf("\33[2K\r");
+	} else {
+		for (i = 1; i < depth; i++)
+			printf("%c   ", tree_mark[i]);
+
+		printf("%c-- %s <ino = 0x%x>, <encrypted (%d)>\n",
 			last_de ? '`' : '|',
 			new, le32_to_cpu(dentry[idx].ino),
 			enc_name);
+	}
 }
 
 static int f2fs_check_hash_code(int encoding, int casefolded,
@@ -1609,7 +1629,7 @@ static int __chk_dentries(struct f2fs_sb_info *sbi, int casefolded,
 				le32_to_cpu(dentry[i].ino),
 				dentry[i].file_type);
 
-		print_dentry(fsck->dentry_depth, name, bitmap,
+		print_dentry(sbi, name, bitmap,
 				dentry, max, i, last_blk, enc_name);
 
 		blk_cnt = 1;
@@ -1645,6 +1665,8 @@ int fsck_chk_inline_dentries(struct f2fs_sb_info *sbi,
 		struct f2fs_node *node_blk, struct child_info *child)
 {
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
+	struct f2fs_dentry *cur_dentry = fsck->dentry_end;
+	struct f2fs_dentry *new_dentry;
 	struct f2fs_dentry_ptr d;
 	void *inline_dentry;
 	int dentries;
@@ -1655,6 +1677,12 @@ int fsck_chk_inline_dentries(struct f2fs_sb_info *sbi,
 	make_dentry_ptr(&d, node_blk, inline_dentry, 2);
 
 	fsck->dentry_depth++;
+	new_dentry = calloc(sizeof(struct f2fs_dentry), 1);
+	new_dentry->depth = fsck->dentry_depth;
+	memcpy(new_dentry->name, child->p_name, F2FS_NAME_LEN);
+	cur_dentry->next = new_dentry;
+	fsck->dentry_end = new_dentry;
+
 	dentries = __chk_dentries(sbi, IS_CASEFOLDED(&node_blk->i), child,
 			d.bitmap, d.dentry, d.filename, d.max, 1,
 			file_is_encrypt(&node_blk->i));// pass through
@@ -1667,6 +1695,10 @@ int fsck_chk_inline_dentries(struct f2fs_sb_info *sbi,
 			fsck->dentry_depth, dentries,
 			d.max, F2FS_NAME_LEN);
 	}
+	fsck->dentry = cur_dentry;
+	fsck->dentry_end =cur_dentry;
+	cur_dentry->next = NULL;
+	free(new_dentry);
 	fsck->dentry_depth--;
 	return dentries;
 }
@@ -1676,6 +1708,8 @@ int fsck_chk_dentry_blk(struct f2fs_sb_info *sbi, int casefolded, u32 blk_addr,
 {
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	struct f2fs_dentry_block *de_blk;
+	struct f2fs_dentry *cur_dentry = fsck->dentry_end;
+	struct f2fs_dentry *new_dentry;
 	int dentries, ret;
 
 	de_blk = (struct f2fs_dentry_block *)calloc(BLOCK_SZ, 1);
@@ -1685,6 +1719,12 @@ int fsck_chk_dentry_blk(struct f2fs_sb_info *sbi, int casefolded, u32 blk_addr,
 	ASSERT(ret >= 0);
 
 	fsck->dentry_depth++;
+	new_dentry = calloc(sizeof(struct f2fs_dentry), 1);
+	new_dentry->depth = fsck->dentry_depth;
+	memcpy(new_dentry->name, child->p_name, F2FS_NAME_LEN);
+	cur_dentry->next = new_dentry;
+	fsck->dentry_end = new_dentry;
+
 	dentries = __chk_dentries(sbi, casefolded, child,
 			de_blk->dentry_bitmap,
 			de_blk->dentry, de_blk->filename,
@@ -1701,6 +1741,10 @@ int fsck_chk_dentry_blk(struct f2fs_sb_info *sbi, int casefolded, u32 blk_addr,
 			fsck->dentry_depth, blk_addr, dentries,
 			NR_DENTRY_IN_BLOCK, F2FS_NAME_LEN);
 	}
+	fsck->dentry = cur_dentry;
+	fsck->dentry_end =cur_dentry;
+	cur_dentry->next = NULL;
+	free(new_dentry);
 	fsck->dentry_depth--;
 	free(de_blk);
 	return 0;
@@ -2061,6 +2105,9 @@ void fsck_init(struct f2fs_sb_info *sbi)
 	ASSERT(tree_mark_size != 0);
 	tree_mark = calloc(tree_mark_size, 1);
 	ASSERT(tree_mark != NULL);
+	fsck->dentry = calloc(sizeof(struct f2fs_dentry), 1);
+	memcpy(fsck->dentry->name, "/", 1);
+	fsck->dentry_end = fsck->dentry;
 }
 
 static void fix_hard_links(struct f2fs_sb_info *sbi)
@@ -3022,6 +3069,9 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	struct hard_link_node *node = NULL;
 
+	if (c.show_file_map)
+		return 0;
+
 	printf("\n");
 
 	if (c.zoned_model == F2FS_ZONED_HM) {
diff --git a/fsck/fsck.h b/fsck/fsck.h
index b9dcd5c27982..6b3246aa57fa 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -72,13 +72,20 @@ struct child_info {
 	u32 pgofs;
 	u8 dots;
 	u8 dir_level;
-	u32 p_ino;		/*parent ino*/
-	u32 pp_ino;		/*parent parent ino*/
+	u32 p_ino;		/* parent ino */
+	char p_name[F2FS_NAME_LEN]; /* parent name */
+	u32 pp_ino;		/* parent parent ino*/
 	struct extent_info ei;
 	u32 last_blk;
 	u32 i_namelen;  /* dentry namelen */
 };
 
+struct f2fs_dentry {
+	char name[F2FS_NAME_LEN];
+	int depth;
+	struct f2fs_dentry *next;
+};
+
 struct f2fs_fsck {
 	struct f2fs_sb_info sbi;
 
@@ -110,6 +117,8 @@ struct f2fs_fsck {
 	u32 nr_nat_entries;
 
 	u32 dentry_depth;
+	struct f2fs_dentry *dentry;
+	struct f2fs_dentry *dentry_end;
 	struct f2fs_nat_entry *entries;
 	u32 nat_valid_inode_cnt;
 
@@ -253,7 +262,7 @@ struct dump_option {
 extern void nat_dump(struct f2fs_sb_info *, nid_t, nid_t);
 extern void sit_dump(struct f2fs_sb_info *, unsigned int, unsigned int);
 extern void ssa_dump(struct f2fs_sb_info *, int, int);
-extern void dump_node(struct f2fs_sb_info *, nid_t, int);
+extern int dump_node(struct f2fs_sb_info *, nid_t, int);
 extern int dump_info_from_blkaddr(struct f2fs_sb_info *, u32);
 extern unsigned int start_bidx_of_node(unsigned int, struct f2fs_node *);
 
diff --git a/fsck/main.c b/fsck/main.c
index 2588a01799c2..a8a9562cf7b7 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -72,6 +72,7 @@ void fsck_usage()
 	MSG(0, "  -f check/fix entire partition\n");
 	MSG(0, "  -g add default options\n");
 	MSG(0, "  -l show superblock/checkpoint\n");
+	MSG(0, "  -M show a file map\n");
 	MSG(0, "  -O feature1[feature2,feature3,...] e.g. \"encrypt\"\n");
 	MSG(0, "  -p preen mode [default:0 the same as -a [0|1]]\n");
 	MSG(0, "  -S sparse_mode\n");
@@ -228,7 +229,7 @@ void f2fs_parse_options(int argc, char *argv[])
 	}
 
 	if (!strcmp("fsck.f2fs", prog)) {
-		const char *option_string = ":aC:c:m:d:fg:lO:p:q:StyV";
+		const char *option_string = ":aC:c:m:Md:fg:lO:p:q:StyV";
 		int opt = 0, val;
 		char *token;
 		struct option long_opt[] = {
@@ -278,6 +279,9 @@ void f2fs_parse_options(int argc, char *argv[])
 			case 'l':
 				c.layout = 1;
 				break;
+			case 'M':
+				c.show_file_map = 1;
+				break;
 			case 'O':
 				if (parse_feature(feature_table, optarg))
 					fsck_usage();
@@ -1212,7 +1216,8 @@ retry:
 	if (c.func == SLOAD)
 		c.compress.filter_ops->destroy();
 
-	printf("\nDone: %lf secs\n", (get_boottime_ns() - start) / 1000000000.0);
+	if (!c.show_file_map)
+		printf("\nDone: %lf secs\n", (get_boottime_ns() - start) / 1000000000.0);
 	return ret;
 
 out_err:
diff --git a/fsck/mount.c b/fsck/mount.c
index de692b62e1c2..598410e5f4fa 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -489,6 +489,9 @@ printout:
 
 void print_cp_state(u32 flag)
 {
+	if (c.show_file_map)
+		return;
+
 	MSG(0, "Info: checkpoint state = %x : ", flag);
 	if (flag & CP_QUOTA_NEED_FSCK_FLAG)
 		MSG(0, "%s", " quota_need_fsck");
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 8969ae2ebc34..1618d654973d 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -240,14 +240,14 @@ static inline uint64_t bswap_64(uint64_t val)
 
 #define MSG(n, fmt, ...)						\
 	do {								\
-		if (c.dbg_lv >= n && !c.layout) {			\
+		if (c.dbg_lv >= n && !c.layout && !c.show_file_map) {	\
 			printf(fmt, ##__VA_ARGS__);			\
 		}							\
 	} while (0)
 
 #define DBG(n, fmt, ...)						\
 	do {								\
-		if (c.dbg_lv >= n && !c.layout) {			\
+		if (c.dbg_lv >= n && !c.layout && !c.show_file_map) {	\
 			printf("[%s:%4d] " fmt,				\
 				__func__, __LINE__, ##__VA_ARGS__);	\
 		}							\
@@ -491,6 +491,7 @@ struct f2fs_configuration {
 	int alloc_failed;
 	int auto_fix;
 	int layout;
+	int show_file_map;
 	int quota_fix;
 	int preen_mode;
 	int ro;
diff --git a/man/fsck.f2fs.8 b/man/fsck.f2fs.8
index af1076cb72bc..aff4ff24a2e1 100644
--- a/man/fsck.f2fs.8
+++ b/man/fsck.f2fs.8
@@ -14,6 +14,10 @@ fsck.f2fs \- check a Linux F2FS file system
 .I enable force fix
 ]
 [
+.B \-M
+.I show file map
+]
+[
 .B \-p
 .I enable preen mode
 ]
@@ -44,6 +48,9 @@ module. It is disabled by default.
 .BI \-f " enable force fix"
 Enable to fix all the inconsistency in the partition.
 .TP
+.BI \-M " show files map"
+Enable to show all the filenames and inode numbers stored in the image
+.TP
 .BI \-p " enable preen mode"
 Same as "-a" to support general fsck convention.
 .TP
-- 
2.32.0.272.g935e593368-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
