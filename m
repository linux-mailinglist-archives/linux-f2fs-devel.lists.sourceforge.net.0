Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C233B1E43
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Jun 2021 18:04:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lw5Mr-0005TD-Hv; Wed, 23 Jun 2021 16:04:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lw5Mp-0005T5-Q9
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Jun 2021 16:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XQCYoKFktBV9LwNy7u1j9B5fiL9CvCAAco5rUfpVVgE=; b=IhBERVpaXxJBiUA45j97D0lNqM
 P/9KFBi3gPKhz8O12KZPRAjG5x6vr+ST9NQYwGpUwC5RAvClBQG33sfzBDBkJInPDgOGgkbiRi4DG
 S9GL/0VihXjj9NnYY75hP3uO3cjzFYuWKaLQXroC4SojKTHWQRfbqxutTWMtO6S3UoJs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XQCYoKFktBV9LwNy7u1j9B5fiL9CvCAAco5rUfpVVgE=; b=K4Qc4zR32ZG5xLjGYnqyU4EcTf
 4eH36yC6Uu95CHEW33KtZFL6YACv4zaxpqQuXCUN+XLMt2Ju9ElCfUcdwatixtKjJZU6XIWKca4NF
 SwN5/d3OI/Y8p3mfiSqyMR1FmkFzRvIgifWldM/seYTyLV5+e7QgGox/Qhq+Jw0OXDbc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lw5Mo-009Rc6-Ek
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Jun 2021 16:04:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0097E60233
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 23 Jun 2021 16:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624464277;
 bh=22mQbKs6fPseIVSoi5L+b4oksLrQHe+BrNaTcdJ/Zc4=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=r+alTl3llPh2m1uKrb3IeLcDPl/DSqa5CujjVmTIaW9BgegnVZqnBSUNWJUkEKzy/
 qf8I9P+l5T4Topc6E+6Zpk6EUwv+ZJsAbJo1Mb/svnT84EG1VCmmHtaTLlUMXLgHGQ
 Z8OKAF8OTffU6uyXJMUd2TivQyRuvaeMOYiFDnMmlwVK4Tgv66a16NAqOOAnPXE5Vr
 HeXDIE9MYfR4ct7fCbw3JED2WAZkjz8Ohl7ia2YpJmuV5OdJ5JOdlv3YJMx//bZxy+
 aFmHE9Bg28/759S5FWnMEKs6f3tqdXDj6TZF9aTgq8PcRiTMtdO+qVOcohBneHZhsQ
 Ca7jic2gK/gwQ==
Date: Wed, 23 Jun 2021 09:04:35 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YNNbk/AI2T6fkhLC@google.com>
References: <20210621023939.1510591-1-jaegeuk@kernel.org>
 <20210621023939.1510591-2-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210621023939.1510591-2-jaegeuk@kernel.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lw5Mo-009Rc6-Ek
Subject: Re: [f2fs-dev] [PATCH 2/4 v2] fsck|dump.f2fs: add -M to get file map
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

This option shows all the file names in the disk.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

Change log from v1:
 - fix typos and add asserts 
 - add memory free
 
 fsck/dump.c       | 74 ++++++++++++++++++++++++++++++++++++++++++-----
 fsck/fsck.c       | 74 ++++++++++++++++++++++++++++++++++++++++++-----
 fsck/fsck.h       | 15 ++++++++--
 fsck/main.c       | 15 ++++++++--
 fsck/mount.c      |  3 ++
 include/f2fs_fs.h |  7 +++--
 lib/libf2fs.c     | 11 ++++++-
 man/dump.f2fs.8   |  7 +++++
 man/fsck.f2fs.8   |  7 +++++
 9 files changed, 189 insertions(+), 24 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index 042a2e52edca..3307a54474ac 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -23,6 +23,9 @@
 
 #define BUF_SZ	80
 
+/* current extent info */
+struct extent_info dump_extent;
+
 const char *seg_type_name[SEG_TYPE_MAX + 1] = {
 	"SEG_TYPE_DATA",
 	"SEG_TYPE_CUR_DATA",
@@ -227,10 +230,51 @@ void ssa_dump(struct f2fs_sb_info *sbi, int start_ssa, int end_ssa)
 	close(fd);
 }
 
+static void print_extent(bool last)
+{
+	if (dump_extent.len == 0)
+		goto out;
+
+	if (dump_extent.len == 1)
+		printf(" %d", dump_extent.blk);
+	else
+		printf(" %d-%d",
+			dump_extent.blk,
+			dump_extent.blk + dump_extent.len - 1);
+	dump_extent.len = 0;
+out:
+	if (last)
+		printf("\n");
+}
+
 static void dump_data_blk(struct f2fs_sb_info *sbi, __u64 offset, u32 blkaddr)
 {
 	char buf[F2FS_BLKSIZE];
 
+	if (c.show_file_map) {
+		if (c.show_file_map_max_offset < offset) {
+			ASSERT(blkaddr == NULL_ADDR);
+			return;
+		}
+		if (blkaddr == NULL_ADDR || blkaddr == NEW_ADDR ||
+					blkaddr == COMPRESS_ADDR) {
+			print_extent(false);
+			dump_extent.blk = 0;
+			dump_extent.len = 1;
+			print_extent(false);
+		} else if (dump_extent.len == 0) {
+			dump_extent.blk = blkaddr;
+			dump_extent.len = 1;
+		} else if (dump_extent.blk + dump_extent.len == blkaddr) {
+			dump_extent.len++;
+		} else {
+			print_extent(false);
+			dump_extent.blk = blkaddr;
+			dump_extent.len = 1;
+		}
+		return;
+	}
+
 	if (blkaddr == NULL_ADDR)
 		return;
 
@@ -239,6 +283,7 @@ static void dump_data_blk(struct f2fs_sb_info *sbi, __u64 offset, u32 blkaddr)
 		memset(buf, 0, F2FS_BLKSIZE);
 	} else {
 		int ret;
+
 		ret = dev_read_block(buf, blkaddr);
 		ASSERT(ret >= 0);
 	}
@@ -371,7 +416,7 @@ static void dump_xattr(struct f2fs_sb_info *UNUSED(sbi),
 }
 #endif
 
-static void dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
+static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 					struct f2fs_node *node_blk)
 {
 	u32 i = 0;
@@ -382,9 +427,11 @@ static void dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 		/* recover from inline data */
 		dev_write_dump(((unsigned char *)node_blk) + INLINE_DATA_OFFSET,
 						0, MAX_INLINE_DATA(node_blk));
-		return;
+		return -1;
 	}
 
+	c.show_file_map_max_offset = f2fs_max_file_offset(&node_blk->i);
+
 	/* check data blocks in inode */
 	for (i = 0; i < ADDRS_PER_INODE(&node_blk->i); i++, ofs++)
 		dump_data_blk(sbi, ofs * F2FS_BLKSIZE, le32_to_cpu(
@@ -404,11 +451,14 @@ static void dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 		else
 			ASSERT(0);
 	}
+	/* last block in extent cache */
+	print_extent(true);
 
 	dump_xattr(sbi, node_blk);
+	return 0;
 }
 
-static void dump_file(struct f2fs_sb_info *sbi, struct node_info *ni,
+static int dump_file(struct f2fs_sb_info *sbi, struct node_info *ni,
 				struct f2fs_node *node_blk, int force)
 {
 	struct f2fs_inode *inode = &node_blk->i;
@@ -422,17 +472,21 @@ static void dump_file(struct f2fs_sb_info *sbi, struct node_info *ni,
 
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
 
+	/* dump file's data */
+	if (c.show_file_map)
+		return dump_inode_blk(sbi, ni->ino, node_blk);
+
 	printf("Do you want to dump this file into ./lost_found/? [Y/N] ");
 	ret = scanf("%s", ans);
 	ASSERT(ret >= 0);
@@ -459,6 +513,7 @@ dump:
 
 		close(c.dump_fd);
 	}
+	return 0;
 }
 
 static bool is_sit_bitmap_set(struct f2fs_sb_info *sbi, u32 blk_addr)
@@ -473,10 +528,11 @@ static bool is_sit_bitmap_set(struct f2fs_sb_info *sbi, u32 blk_addr)
 			(const char *)se->cur_valid_map) != 0;
 }
 
-void dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force)
+int dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force)
 {
 	struct node_info ni;
 	struct f2fs_node *node_blk;
+	int ret = 0;
 
 	get_node_info(sbi, nid, &ni);
 
@@ -505,16 +561,18 @@ void dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force)
 
 	if (le32_to_cpu(node_blk->footer.ino) == ni.ino &&
 			le32_to_cpu(node_blk->footer.nid) == ni.nid) {
-		print_node_info(sbi, node_blk, force);
+		if (!c.show_file_map)
+			print_node_info(sbi, node_blk, force);
 
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
index 80a6d8edfe71..6ca85f0870b9 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -695,6 +695,8 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 
 	if (ftype == F2FS_FT_DIR) {
 		f2fs_set_main_bitmap(sbi, ni->blk_addr, CURSEG_HOT_NODE);
+		memcpy(child.p_name, node_blk->i.i_name,
+					node_blk->i.i_namelen);
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
@@ -1655,6 +1677,14 @@ int fsck_chk_inline_dentries(struct f2fs_sb_info *sbi,
 	make_dentry_ptr(&d, node_blk, inline_dentry, 2);
 
 	fsck->dentry_depth++;
+	new_dentry = calloc(sizeof(struct f2fs_dentry), 1);
+	ASSERT(new_dentry != NULL);
+
+	new_dentry->depth = fsck->dentry_depth;
+	memcpy(new_dentry->name, child->p_name, F2FS_NAME_LEN);
+	cur_dentry->next = new_dentry;
+	fsck->dentry_end = new_dentry;
+
 	dentries = __chk_dentries(sbi, IS_CASEFOLDED(&node_blk->i), child,
 			d.bitmap, d.dentry, d.filename, d.max, 1,
 			file_is_encrypt(&node_blk->i));// pass through
@@ -1667,6 +1697,10 @@ int fsck_chk_inline_dentries(struct f2fs_sb_info *sbi,
 			fsck->dentry_depth, dentries,
 			d.max, F2FS_NAME_LEN);
 	}
+	fsck->dentry = cur_dentry;
+	fsck->dentry_end = cur_dentry;
+	cur_dentry->next = NULL;
+	free(new_dentry);
 	fsck->dentry_depth--;
 	return dentries;
 }
@@ -1676,6 +1710,8 @@ int fsck_chk_dentry_blk(struct f2fs_sb_info *sbi, int casefolded, u32 blk_addr,
 {
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	struct f2fs_dentry_block *de_blk;
+	struct f2fs_dentry *cur_dentry = fsck->dentry_end;
+	struct f2fs_dentry *new_dentry;
 	int dentries, ret;
 
 	de_blk = (struct f2fs_dentry_block *)calloc(BLOCK_SZ, 1);
@@ -1685,6 +1721,12 @@ int fsck_chk_dentry_blk(struct f2fs_sb_info *sbi, int casefolded, u32 blk_addr,
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
@@ -1701,6 +1743,10 @@ int fsck_chk_dentry_blk(struct f2fs_sb_info *sbi, int casefolded, u32 blk_addr,
 			fsck->dentry_depth, blk_addr, dentries,
 			NR_DENTRY_IN_BLOCK, F2FS_NAME_LEN);
 	}
+	fsck->dentry = cur_dentry;
+	fsck->dentry_end = cur_dentry;
+	cur_dentry->next = NULL;
+	free(new_dentry);
 	fsck->dentry_depth--;
 	free(de_blk);
 	return 0;
@@ -2061,6 +2107,10 @@ void fsck_init(struct f2fs_sb_info *sbi)
 	ASSERT(tree_mark_size != 0);
 	tree_mark = calloc(tree_mark_size, 1);
 	ASSERT(tree_mark != NULL);
+	fsck->dentry = calloc(sizeof(struct f2fs_dentry), 1);
+	ASSERT(fsck->dentry != NULL);
+	memcpy(fsck->dentry->name, "/", 1);
+	fsck->dentry_end = fsck->dentry;
 }
 
 static void fix_hard_links(struct f2fs_sb_info *sbi)
@@ -3022,6 +3072,9 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	struct hard_link_node *node = NULL;
 
+	if (c.show_file_map)
+		return 0;
+
 	printf("\n");
 
 	if (c.zoned_model == F2FS_ZONED_HM) {
@@ -3229,4 +3282,11 @@ void fsck_free(struct f2fs_sb_info *sbi)
 
 	if (tree_mark)
 		free(tree_mark);
+
+	while (fsck->dentry) {
+		struct f2fs_dentry *dentry = fsck->dentry;
+
+		fsck->dentry = fsck->dentry->next;
+		free(dentry);
+	}
 }
diff --git a/fsck/fsck.h b/fsck/fsck.h
index b9dcd5c27982..d79afef55025 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -72,13 +72,20 @@ struct child_info {
 	u32 pgofs;
 	u8 dots;
 	u8 dir_level;
-	u32 p_ino;		/*parent ino*/
-	u32 pp_ino;		/*parent parent ino*/
+	u32 p_ino;		/* parent ino */
+	char p_name[F2FS_NAME_LEN + 1]; /* parent name */
+	u32 pp_ino;		/* parent parent ino*/
 	struct extent_info ei;
 	u32 last_blk;
 	u32 i_namelen;  /* dentry namelen */
 };
 
+struct f2fs_dentry {
+	char name[F2FS_NAME_LEN + 1];
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
index b36169845762..260ff29dcdd2 100644
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
@@ -93,6 +94,7 @@ void dump_usage()
 	MSG(0, "  -d debug level [default:0]\n");
 	MSG(0, "  -i inode no (hex)\n");
 	MSG(0, "  -n [NAT dump nid from #1~#2 (decimal), for all 0~-1]\n");
+	MSG(0, "  -M show a block map\n");
 	MSG(0, "  -s [SIT dump segno from #1~#2 (decimal), for all 0~-1]\n");
 	MSG(0, "  -S sparse_mode\n");
 	MSG(0, "  -a [SSA dump segno from #1~#2 (decimal), for all 0~-1]\n");
@@ -228,7 +230,7 @@ void f2fs_parse_options(int argc, char *argv[])
 	}
 
 	if (!strcmp("fsck.f2fs", prog)) {
-		const char *option_string = ":aC:c:m:d:fg:lO:p:q:StyV";
+		const char *option_string = ":aC:c:m:Md:fg:lO:p:q:StyV";
 		int opt = 0, val;
 		char *token;
 		struct option long_opt[] = {
@@ -278,6 +280,9 @@ void f2fs_parse_options(int argc, char *argv[])
 			case 'l':
 				c.layout = 1;
 				break;
+			case 'M':
+				c.show_file_map = 1;
+				break;
 			case 'O':
 				if (parse_feature(feature_table, optarg))
 					fsck_usage();
@@ -377,7 +382,7 @@ void f2fs_parse_options(int argc, char *argv[])
 		}
 	} else if (!strcmp("dump.f2fs", prog)) {
 #ifdef WITH_DUMP
-		const char *option_string = "d:i:n:s:Sa:b:V";
+		const char *option_string = "d:i:n:Ms:Sa:b:V";
 		static struct dump_option dump_opt = {
 			.nid = 0,	/* default root ino */
 			.start_nat = -1,
@@ -424,6 +429,9 @@ void f2fs_parse_options(int argc, char *argv[])
 							&dump_opt.start_nat,
 							&dump_opt.end_nat);
 				break;
+			case 'M':
+				c.show_file_map = 1;
+				break;
 			case 's':
 				ret = sscanf(optarg, "%d~%d",
 							&dump_opt.start_sit,
@@ -1209,7 +1217,8 @@ retry:
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
index 8969ae2ebc34..45f72573dadd 100644
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
@@ -491,6 +491,8 @@ struct f2fs_configuration {
 	int alloc_failed;
 	int auto_fix;
 	int layout;
+	int show_file_map;
+	u64 show_file_map_max_offset;
 	int quota_fix;
 	int preen_mode;
 	int ro;
@@ -1298,6 +1300,7 @@ extern int utf16_to_utf8(char *, const u_int16_t *, size_t, size_t);
 extern int log_base_2(u_int32_t);
 extern unsigned int addrs_per_inode(struct f2fs_inode *);
 extern unsigned int addrs_per_block(struct f2fs_inode *);
+extern unsigned int f2fs_max_file_offset(struct f2fs_inode *);
 extern __u32 f2fs_inode_chksum(struct f2fs_node *);
 extern __u32 f2fs_checkpoint_chksum(struct f2fs_checkpoint *);
 extern int write_inode(struct f2fs_node *, u64);
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 0add9018d2ce..876c1dc848b3 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -499,7 +499,8 @@ opaque_seq:
 	return __f2fs_dentry_hash(name, len);
 }
 
-#define ALIGN_DOWN(addrs, size)		(((addrs) / (size)) * (size))
+#define ALIGN_DOWN(addrs, size)	(((addrs) / (size)) * (size))
+#define ALIGN_UP(addrs, size)	ALIGN_DOWN(((addrs) + (size) - 1), (size))
 unsigned int addrs_per_inode(struct f2fs_inode *i)
 {
 	unsigned int addrs = CUR_ADDRS_PER_INODE(i) - get_inline_xattr_addrs(i);
@@ -518,6 +519,14 @@ unsigned int addrs_per_block(struct f2fs_inode *i)
 	return ALIGN_DOWN(DEF_ADDRS_PER_BLOCK, 1 << i->i_log_cluster_size);
 }
 
+unsigned int f2fs_max_file_offset(struct f2fs_inode *i)
+{
+	if (!LINUX_S_ISREG(le16_to_cpu(i->i_mode)) ||
+			!(le32_to_cpu(i->i_flags) & F2FS_COMPR_FL))
+		return le64_to_cpu(i->i_size);
+	return ALIGN_UP(le64_to_cpu(i->i_size), 1 << i->i_log_cluster_size);
+}
+
 /*
  * CRC32
  */
diff --git a/man/dump.f2fs.8 b/man/dump.f2fs.8
index eedba855721f..1ddb7fc5d0d9 100644
--- a/man/dump.f2fs.8
+++ b/man/dump.f2fs.8
@@ -14,6 +14,10 @@ dump.f2fs \- retrieve directory and file entries from an F2FS-formated image
 .I NAT range
 ]
 [
+.B \-M
+.I Block map
+]
+[
 .B \-s
 .I SIT range
 ]
@@ -51,6 +55,9 @@ Specify an inode number to dump out.
 .BI \-n " NAT range"
 Specify a range presented by nids to dump NAT entries.
 .TP
+.BI \-M " Block map"
+Show all the allocated block addresses given inode number.
+.TP
 .BI \-s " SIT range"
 Specify a range presented by segment numbers to dump SIT entries.
 .TP
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
2.32.0.288.g62a8d224e6-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
