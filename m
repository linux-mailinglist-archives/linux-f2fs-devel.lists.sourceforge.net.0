Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1CF8CDC18
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2024 23:28:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sAFz4-0003ic-QW;
	Thu, 23 May 2024 21:28:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3MrNPZgYKABEu859v4x55x2v.t53@flex--drosen.bounces.google.com>)
 id 1sAFz3-0003iW-AB for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 May 2024 21:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=htskdyvAENzpBs8chwjex8YiwQOSc++llgUgCQENABU=; b=N7c3X1DIv2meau2PF9pYK3KdbT
 AXMCHYKiTNvRIfMGqehNF+GmAl+UB9wjm3Kkkr+M+yyLcXeMwHra6fUgVHDQNjqxxHqq8+dwAwhrm
 I0HdgyYntVk+WYf9DZShZQ9xzipEHWvZrPoQONh6P4RAq2lWbgzoVrtZuZY2ShXvYHrQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=htskdyvAENzpBs8chwjex8YiwQOSc++llgUgCQENABU=; b=d
 tgT+Bq4JUu8YD7f1Svl2kQDU30qgS3BLGfNFzu+sCQ4e6wo4hzRHq7Yxinbk5LvTUU6f0c3JFH39y
 PCnYw+ZNAJrg0CI/o6JhwSwBL3G1yh4kuPzeQtcUt9dkx8Wv759+kXnZwwh0iVJmF+nqReey8PZai
 7SbMI06C+E5yFEEw=;
Received: from mail-qk1-f202.google.com ([209.85.222.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sAFz1-00024e-UD for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 May 2024 21:28:20 +0000
Received: by mail-qk1-f202.google.com with SMTP id
 af79cd13be357-79308bfe615so63481685a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 May 2024 14:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1716499688; x=1717104488;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=htskdyvAENzpBs8chwjex8YiwQOSc++llgUgCQENABU=;
 b=HVYskA+q3nBcHKtIih4rWR++Id/a4lBoB27jTyTVe8A41YvGK4nxUoxBBU5jgGBrkn
 vbo98fW38vc9j3rSVbiJhx9WUV5eziODtusxae56BWyl6ggg69ZQt+nwsY5znxFTj1Xe
 sOrKwNuxGr4dbyo2mYu9KP60P6NOkObo8MXFIF1P+UPWZx4rv5x+iX9WjBlMnZu5tGbl
 EMp9FUPeJG1Pt9G7N3QCxRvqRG8kuHlxaQ/Xm7XOvpyGhMc0wy2aNn0rDyVKrvbeAAfq
 eqitV7+2F4AR1KPWIMZNswZzUakaxBGA8bdDnvVzB+F6UKTmXI04Pz99OtJy3ZCitCeq
 QLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716499688; x=1717104488;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=htskdyvAENzpBs8chwjex8YiwQOSc++llgUgCQENABU=;
 b=AulH3LJDBSare6U+gh+EpgxdyKrUdUjRm7SngRmLnju63QhlYbSA4hW7uI9Gpfiptf
 9cw7zR1BzfGA9Pvro2DMWGLzEnCSMnOLFpkxmHjOUsec9DHdUVeCdf1iPneytF2Q8541
 CbXUpuZO4rvLHqrDPNqup+Nf7eRnI7nGSZB1yv2OoK+GSollbmfRUfr0DXFgTwBqqDIr
 QQcMV2AtSpDvNARRPQ/PW0Y2VBs4MO+q0C+QNHsfBKqJEb8E5bCB+oKms0tA3CQcXNey
 q6749lqC3JUWxzGJ83Av5ZwHFPVNlSlauuhyfPCr2T0310xQ/HNLYfvrNfOuY4etjm07
 XnCQ==
X-Gm-Message-State: AOJu0YyQ2y67ZlIhFTx1SjzbCn4/uCkTIL7wN8n40OFLxyN2QWi3gfii
 LYtPOSQnVqnkLfrnwH6r9ONX2pmplSE9D9ayNI1YeyWPCv4k3YMzRx05a8ikLg6OAGoxOtoGvu4
 65v4A9VLTJvqkxo+jQlAGFd1MuD8IbiiE/R3rIfge/EW/t1tqhRWct7n4xP8YGnGtyMtCYdnxkK
 9KNxpdIIvJpsOtChVtkKHMrHeJuoCHISGgJh+5EiDhPyHcqLii8fhr5A==
X-Google-Smtp-Source: AGHT+IGXtz47DYnEdJUFh3sQ+ANT2CEQwF1cTVQcTXELAT7P6gVg7bHlluOomwWvIDT/4PadhbTxuYUYXqo=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:a8c9:5272:5c18:de65])
 (user=drosen job=sendgmr) by 2002:a25:bc0c:0:b0:df4:d5f2:b8 with SMTP id
 3f1490d57ef6-df7722400b9mr36182276.12.1716499250963; Thu, 23 May 2024
 14:20:50 -0700 (PDT)
Date: Thu, 23 May 2024 14:20:31 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240523212032.137615-1-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -12.7 (------------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This adds the ability to dump folders as well as files.
 Folders
 are dumped recursively. Additionally, dumped files/folders may be directed
 to a folder specified by -o [path] instead of ./lost_found. T [...] 
 Content analysis details:   (-12.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.222.202 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1sAFz1-00024e-UD
Subject: [f2fs-dev] [PATCH v3 1/2] dump.f2fs: Add ability to dump folders
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>, Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This adds the ability to dump folders as well as files. Folders are
dumped recursively. Additionally, dumped files/folders may be directed
to a folder specified by -o [path] instead of ./lost_found. The -r flag
will dump the entire fs from the root inode. -f or -y will skip the
prompt before dumping, and -P will preserve the mode/owner info for the
created file/folder.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
Reviewed-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/dump.c     | 178 ++++++++++++++++++++++++++++++++++++++----------
 fsck/fsck.c     |   4 +-
 fsck/fsck.h     |   4 +-
 fsck/main.c     |  29 +++++++-
 man/dump.f2fs.8 |  17 ++++-
 5 files changed, 190 insertions(+), 42 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index b2e990b..1a733f8 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -247,7 +247,26 @@ out:
 		printf("\n");
 }
 
-static void dump_data_blk(struct f2fs_sb_info *sbi, __u64 offset, u32 blkaddr)
+static void dump_folder_contents(struct f2fs_sb_info *sbi, u8 *bitmap,
+				struct f2fs_dir_entry *dentry,
+				__u8 (*filenames)[F2FS_SLOT_LEN], int max)
+{
+	int i;
+	int name_len;
+
+	for (i = 0; i < max; i++) {
+		if (test_bit_le(i, bitmap) == 0)
+			continue;
+		name_len = le16_to_cpu(dentry[i].name_len);
+		if (name_len == 1 && filenames[i][0] == '.')
+			continue;
+		if (name_len == 2 && filenames[i][0] == '.' && filenames[i][1] == '.')
+			continue;
+		dump_node(sbi, le32_to_cpu(dentry[i].ino), 1, NULL, 0, 1);
+	}
+}
+
+static void dump_data_blk(struct f2fs_sb_info *sbi, __u64 offset, u32 blkaddr, bool is_folder)
 {
 	char buf[F2FS_BLKSIZE];
 
@@ -288,12 +307,19 @@ static void dump_data_blk(struct f2fs_sb_info *sbi, __u64 offset, u32 blkaddr)
 		ASSERT(ret >= 0);
 	}
 
-	/* write blkaddr */
-	dev_write_dump(buf, offset, F2FS_BLKSIZE);
+	if (is_folder) {
+		struct f2fs_dentry_block *d = (struct f2fs_dentry_block *) buf;
+
+		dump_folder_contents(sbi, d->dentry_bitmap, F2FS_DENTRY_BLOCK_DENTRIES(d),
+					F2FS_DENTRY_BLOCK_FILENAMES(d), NR_DENTRY_IN_BLOCK);
+	} else {
+		/* write blkaddr */
+		dev_write_dump(buf, offset, F2FS_BLKSIZE);
+	}
 }
 
 static void dump_node_blk(struct f2fs_sb_info *sbi, int ntype,
-				u32 nid, u32 addr_per_block, u64 *ofs)
+				u32 nid, u32 addr_per_block, u64 *ofs, int is_dir)
 {
 	struct node_info ni;
 	struct f2fs_node *node_blk;
@@ -330,20 +356,20 @@ static void dump_node_blk(struct f2fs_sb_info *sbi, int ntype,
 		switch (ntype) {
 		case TYPE_DIRECT_NODE:
 			dump_data_blk(sbi, *ofs * F2FS_BLKSIZE,
-					le32_to_cpu(node_blk->dn.addr[i]));
+					le32_to_cpu(node_blk->dn.addr[i]), is_dir);
 			(*ofs)++;
 			break;
 		case TYPE_INDIRECT_NODE:
 			dump_node_blk(sbi, TYPE_DIRECT_NODE,
 					le32_to_cpu(node_blk->in.nid[i]),
 					addr_per_block,
-					ofs);
+					ofs, is_dir);
 			break;
 		case TYPE_DOUBLE_INDIRECT_NODE:
 			dump_node_blk(sbi, TYPE_INDIRECT_NODE,
 					le32_to_cpu(node_blk->in.nid[i]),
 					addr_per_block,
-					ofs);
+					ofs, is_dir);
 			break;
 		}
 	}
@@ -435,8 +461,9 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	u32 i = 0;
 	u64 ofs = 0;
 	u32 addr_per_block;
+	bool is_dir = S_ISDIR(le16_to_cpu(node_blk->i.i_mode));
 
-	if((node_blk->i.i_inline & F2FS_INLINE_DATA)) {
+	if ((node_blk->i.i_inline & F2FS_INLINE_DATA)) {
 		DBG(3, "ino[0x%x] has inline data!\n", nid);
 		/* recover from inline data */
 		dev_write_dump(((unsigned char *)node_blk) + INLINE_DATA_OFFSET,
@@ -444,13 +471,25 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 		return -1;
 	}
 
+	if ((node_blk->i.i_inline & F2FS_INLINE_DENTRY)) {
+		void *inline_dentry = inline_data_addr(node_blk);
+		struct f2fs_dentry_ptr d;
+
+		make_dentry_ptr(&d, node_blk, inline_dentry, 2);
+
+		DBG(3, "ino[0x%x] has inline dentries!\n", nid);
+		/* recover from inline dentry */
+		dump_folder_contents(sbi, d.bitmap, d.dentry, d.filename, d.max);
+		return -1;
+	}
+
 	c.show_file_map_max_offset = f2fs_max_file_offset(&node_blk->i);
 	addr_per_block = ADDRS_PER_BLOCK(&node_blk->i);
 
 	/* check data blocks in inode */
 	for (i = 0; i < ADDRS_PER_INODE(&node_blk->i); i++, ofs++)
 		dump_data_blk(sbi, ofs * F2FS_BLKSIZE, le32_to_cpu(
-			node_blk->i.i_addr[get_extra_isize(node_blk) + i]));
+			node_blk->i.i_addr[get_extra_isize(node_blk) + i]), is_dir);
 
 	/* check node blocks in inode */
 	for (i = 0; i < 5; i++) {
@@ -458,17 +497,20 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 			dump_node_blk(sbi, TYPE_DIRECT_NODE,
 					le32_to_cpu(F2FS_INODE_I_NID(&node_blk->i, i)),
 					addr_per_block,
-					&ofs);
+					&ofs,
+					is_dir);
 		else if (i == 2 || i == 3)
 			dump_node_blk(sbi, TYPE_INDIRECT_NODE,
 					le32_to_cpu(F2FS_INODE_I_NID(&node_blk->i, i)),
 					addr_per_block,
-					&ofs);
+					&ofs,
+					is_dir);
 		else if (i == 4)
 			dump_node_blk(sbi, TYPE_DOUBLE_INDIRECT_NODE,
 					le32_to_cpu(F2FS_INODE_I_NID(&node_blk->i, i)),
 					addr_per_block,
-					&ofs);
+					&ofs,
+					is_dir);
 		else
 			ASSERT(0);
 	}
@@ -479,8 +521,51 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	return 0;
 }
 
-static int dump_file(struct f2fs_sb_info *sbi, struct node_info *ni,
-				struct f2fs_node *node_blk, int force)
+static void dump_file(struct f2fs_sb_info *sbi, struct node_info *ni,
+				struct f2fs_node *node_blk, char *path)
+{
+	struct f2fs_inode *inode = &node_blk->i;
+	int ret;
+
+	c.dump_fd = open(path, O_TRUNC|O_CREAT|O_RDWR, 0666);
+	ASSERT(c.dump_fd >= 0);
+
+	/* dump file's data */
+	dump_inode_blk(sbi, ni->ino, node_blk);
+
+	/* adjust file size */
+	ret = ftruncate(c.dump_fd, le32_to_cpu(inode->i_size));
+	ASSERT(ret >= 0);
+
+	close(c.dump_fd);
+}
+
+static void dump_folder(struct f2fs_sb_info *sbi, struct node_info *ni,
+				struct f2fs_node *node_blk, char *path, int is_root)
+{
+	if (!is_root) {
+#if defined(__MINGW32__)
+		if (mkdir(path) < 0 && errno != EEXIST) {
+			MSG(0, "Failed to create directory %s\n", path);
+			return;
+		}
+#else
+		if (mkdir(path, 0777) < 0 && errno != EEXIST) {
+			MSG(0, "Failed to create directory %s\n", path);
+			return;
+		}
+#endif
+		ASSERT(chdir(path) == 0);
+	}
+	/* dump folder data */
+	dump_inode_blk(sbi, ni->ino, node_blk);
+	if (!is_root)
+		ASSERT(chdir("..") == 0);
+}
+
+static int dump_filesystem(struct f2fs_sb_info *sbi, struct node_info *ni,
+				struct f2fs_node *node_blk, int force, char *base_path,
+				bool is_base, bool allow_folder)
 {
 	struct f2fs_inode *inode = &node_blk->i;
 	u32 imode = le16_to_cpu(inode->i_mode);
@@ -489,6 +574,7 @@ static int dump_file(struct f2fs_sb_info *sbi, struct node_info *ni,
 	char path[1024] = {0};
 	char ans[255] = {0};
 	int is_encrypted = file_is_encrypt(inode);
+	int is_root = sbi->root_ino_num == ni->nid;
 	int ret;
 
 	if (is_encrypted) {
@@ -496,11 +582,15 @@ static int dump_file(struct f2fs_sb_info *sbi, struct node_info *ni,
 		return -1;
 	}
 
-	if ((!S_ISREG(imode) && !S_ISLNK(imode)) ||
-				namelen == 0 || namelen > F2FS_NAME_LEN) {
-		MSG(force, "Not a regular file or wrong name info\n\n");
+	if ((!S_ISREG(imode) && !S_ISLNK(imode) && !(S_ISDIR(imode) && allow_folder))) {
+		MSG(force, "Not a valid file type\n\n");
+		return -1;
+	}
+	if (!is_root && (namelen == 0 || namelen > F2FS_NAME_LEN)) {
+		MSG(force, "Wrong name info\n\n");
 		return -1;
 	}
+	base_path = base_path ?: "./lost_found";
 	if (force)
 		goto dump;
 
@@ -508,31 +598,49 @@ static int dump_file(struct f2fs_sb_info *sbi, struct node_info *ni,
 	if (c.show_file_map)
 		return dump_inode_blk(sbi, ni->ino, node_blk);
 
-	printf("Do you want to dump this file into ./lost_found/? [Y/N] ");
+	printf("Do you want to dump this %s into %s/? [Y/N] ",
+			S_ISREG(imode) || S_ISLNK(imode) ? "file" : "folder",
+			base_path);
 	ret = scanf("%s", ans);
 	ASSERT(ret >= 0);
 
 	if (!strcasecmp(ans, "y")) {
 dump:
-		ret = system("mkdir -p ./lost_found");
-		ASSERT(ret >= 0);
-
-		/* make a file */
-		strncpy(name, (const char *)inode->i_name, namelen);
-		name[namelen] = 0;
-		sprintf(path, "./lost_found/%s", name);
+		if (is_base) {
+			getcwd(path, sizeof(path));
+#if defined(__MINGW32__)
+			ret = mkdir(base_path);
+#else
+			ret = mkdir(base_path, 0777);
+#endif
 
-		c.dump_fd = open(path, O_TRUNC|O_CREAT|O_RDWR, 0666);
-		ASSERT(c.dump_fd >= 0);
+			ASSERT(ret == 0 || errno == EEXIST);
+			ASSERT(chdir(base_path) == 0);
+		}
 
-		/* dump file's data */
-		dump_inode_blk(sbi, ni->ino, node_blk);
+		/* make a file */
+		if (!is_root) {
+			strncpy(name, (const char *)inode->i_name, namelen);
+			name[namelen] = 0;
+		}
 
-		/* adjust file size */
-		ret = ftruncate(c.dump_fd, le32_to_cpu(inode->i_size));
-		ASSERT(ret >= 0);
+		if (S_ISREG(imode) || S_ISLNK(imode)) {
+			dump_file(sbi, ni, node_blk, name);
+		} else {
+			dump_folder(sbi, ni, node_blk, name, is_root);
+		}
 
-		close(c.dump_fd);
+#if !defined(__MINGW32__)
+		/* fix up mode/owner */
+		if (c.preserve_perms) {
+			if (is_root)
+				strncpy(name, ".", 2);
+			chmod(name, imode);
+			chown(name, inode->i_uid, inode->i_gid);
+		}
+#endif
+		if (is_base)
+			chdir(path);
 	}
 	return 0;
 }
@@ -582,7 +690,7 @@ void dump_node_scan_disk(struct f2fs_sb_info *sbi, nid_t nid)
 	free(node_blk);
 }
 
-int dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force)
+int dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force, char *base_path, int base, int allow_folder)
 {
 	struct node_info ni;
 	struct f2fs_node *node_blk;
@@ -617,7 +725,7 @@ int dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force)
 			print_node_info(sbi, node_blk, force);
 
 		if (ni.ino == ni.nid)
-			ret = dump_file(sbi, &ni, node_blk, force);
+			ret = dump_filesystem(sbi, &ni, node_blk, force, base_path, base, allow_folder);
 	} else {
 		print_node_info(sbi, node_blk, force);
 		MSG(force, "Invalid (i)node block\n\n");
diff --git a/fsck/fsck.c b/fsck/fsck.c
index 5d345d0..7400dcf 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1651,7 +1651,7 @@ static void print_dentry(struct f2fs_sb_info *sbi, __u8 *name,
 			d = d->next;
 		}
 		printf("/%s", new);
-		if (dump_node(sbi, le32_to_cpu(dentry[idx].ino), 0))
+		if (dump_node(sbi, le32_to_cpu(dentry[idx].ino), 0, NULL, 0, 0))
 			printf("\33[2K\r");
 	} else {
 		for (i = 1; i < depth; i++)
@@ -3632,7 +3632,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 		if (!strcasecmp(ans, "y")) {
 			for (i = 0; i < fsck->nr_nat_entries; i++) {
 				if (f2fs_test_bit(i, fsck->nat_area_bitmap))
-					dump_node(sbi, i, 1);
+					dump_node(sbi, i, 1, NULL, 1, 0);
 			}
 		}
 	}
diff --git a/fsck/fsck.h b/fsck/fsck.h
index f5282e2..6cac926 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -270,12 +270,14 @@ struct dump_option {
 	int end_ssa;
 	int32_t blk_addr;
 	nid_t scan_nid;
+	int use_root_nid;
+	char *base_path;
 };
 
 extern void nat_dump(struct f2fs_sb_info *, nid_t, nid_t);
 extern void sit_dump(struct f2fs_sb_info *, unsigned int, unsigned int);
 extern void ssa_dump(struct f2fs_sb_info *, int, int);
-extern int dump_node(struct f2fs_sb_info *, nid_t, int);
+extern int dump_node(struct f2fs_sb_info *, nid_t, int, char *, int, int);
 extern int dump_info_from_blkaddr(struct f2fs_sb_info *, u32);
 extern unsigned int start_bidx_of_node(unsigned int, struct f2fs_node *);
 extern void dump_node_scan_disk(struct f2fs_sb_info *sbi, nid_t nid);
diff --git a/fsck/main.c b/fsck/main.c
index c4d0956..6edc902 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -34,7 +34,7 @@ struct f2fs_fsck gfsck;
 
 INIT_FEATURE_TABLE;
 
-#ifdef WITH_SLOAD
+#if defined(WITH_SLOAD) || defined(WITH_DUMP)
 static char *absolute_path(const char *file)
 {
 	char *ret;
@@ -384,7 +384,7 @@ void f2fs_parse_options(int argc, char *argv[])
 		}
 	} else if (!strcmp("dump.f2fs", prog)) {
 #ifdef WITH_DUMP
-		const char *option_string = "d:i:I:n:Ms:Sa:b:V";
+		const char *option_string = "d:fi:I:n:Mo:Prs:Sa:b:Vy";
 		static struct dump_option dump_opt = {
 			.nid = 0,	/* default root ino */
 			.start_nat = -1,
@@ -395,6 +395,8 @@ void f2fs_parse_options(int argc, char *argv[])
 			.end_ssa = -1,
 			.blk_addr = -1,
 			.scan_nid = 0,
+			.use_root_nid = 0,
+			.base_path = NULL,
 		};
 
 		c.func = DUMP;
@@ -456,6 +458,24 @@ void f2fs_parse_options(int argc, char *argv[])
 					ret = sscanf(optarg, "%x",
 							&dump_opt.blk_addr);
 				break;
+			case 'y':
+			case 'f':
+				c.force = 1;
+				break;
+			case 'r':
+				dump_opt.use_root_nid = 1;
+				break;
+			case 'o':
+				dump_opt.base_path = absolute_path(optarg);
+				break;
+			case 'P':
+#if defined(__MINGW32__)
+				MSG(0, "-P not supported for Windows\n");
+				err = EWRONG_OPT;
+#else
+				c.preserve_perms = 1;
+#endif
+				break;
 			case 'V':
 				show_version(prog);
 				exit(0);
@@ -914,6 +934,9 @@ static void do_dump(struct f2fs_sb_info *sbi)
 	struct f2fs_checkpoint *ckpt = F2FS_CKPT(sbi);
 	u32 flag = le32_to_cpu(ckpt->ckpt_flags);
 
+	if (opt->use_root_nid)
+		opt->nid = sbi->root_ino_num;
+
 	if (opt->end_nat == -1)
 		opt->end_nat = NM_I(sbi)->max_nid;
 	if (opt->end_sit == -1)
@@ -929,7 +952,7 @@ static void do_dump(struct f2fs_sb_info *sbi)
 	if (opt->blk_addr != -1)
 		dump_info_from_blkaddr(sbi, opt->blk_addr);
 	if (opt->nid)
-		dump_node(sbi, opt->nid, 0);
+		dump_node(sbi, opt->nid, c.force, opt->base_path, 1, 1);
 	if (opt->scan_nid)
 		dump_node_scan_disk(sbi, opt->scan_nid);
 
diff --git a/man/dump.f2fs.8 b/man/dump.f2fs.8
index 94bf5f3..60d6783 100644
--- a/man/dump.f2fs.8
+++ b/man/dump.f2fs.8
@@ -44,7 +44,8 @@ is used to retrieve f2fs metadata (usually in a disk partition).
 \fIdevice\fP is the special file corresponding to the device (e.g.
 \fI/dev/sdXX\fP).
 
-Currently, it can retrieve 1) a file given its inode number, 2) NAT
+Currently, it can retrieve 1) a file or folder given its inode number
+(folders are dumped recursively), 2) NAT
 entries into a file, 3) SIT entries into a file, 4) SSA entries into
 a file, 5) reverse information from the given block address.
 .PP
@@ -56,6 +57,20 @@ is 0 on success and -1 on failure.
 .BI \-i " inode number"
 Specify an inode number to dump out.
 .TP
+.BI \-r
+Dump out from the root inode.
+.TP
+.BI \-f
+Do not prompt before dumping
+.TP
+.BI \-y
+Alias for \-f
+.TP
+.BI \-o " path"
+Dump inodes to the given path
+.BI \-P
+Preserve mode/owner/group for dumped inode
+.TP
 .BI \-I " inode number"
 Specify an inode number and scan full disk to dump out, include history inode block
 .TP
-- 
2.45.1.288.g0e0cd299f1-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
