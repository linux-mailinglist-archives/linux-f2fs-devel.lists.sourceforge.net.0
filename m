Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFCC934423
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jul 2024 23:47:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sUCUz-0005aJ-RE;
	Wed, 17 Jul 2024 21:47:46 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3-TuYZgYKAA4r526s1u22uzs.q20@flex--drosen.bounces.google.com>)
 id 1sUCUy-0005aB-M5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jul 2024 21:47:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LFrZwd9GNiLvkuS5/xMSjpbhFGQ7whY9+ki2oUxwZAE=; b=QHOb2g9cp3xnjWEZzo1kNpyN3Z
 RGA5EZktpPGUMUrjUEbo8Fpyd1XPQ8uRU/YgxgEFybr6WbJ3iS+3iTsAWFRi7W6p4x+V8lpsHcv+C
 fW812T7qHox4BW+dTvsvEnYd8VC9Ori+6tT2+LjGDTC8vnJrxhytw/pUwRvkeup0EMwM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LFrZwd9GNiLvkuS5/xMSjpbhFGQ7whY9+ki2oUxwZAE=; b=S
 TxFQ2FT5hYRKlGe7uWG8Lz/+2G46f0DFRncG3+KlDod40wev1XflnU5Av7l5Cwiyo0l55seJuQ5Bu
 tgKnV3bp3bPdW7TFAkpQDA/n6AHj+P9mDd0QBLgSOKMDUQA3FKSrv/eJ0e8BqZdFQFGN1RPeKZcOh
 wqIVwHv+9Ku7DRaE=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sUCUy-0004J8-Ip for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jul 2024 21:47:45 +0000
Received: by mail-yb1-f202.google.com with SMTP id
 3f1490d57ef6-e05d72f044cso325619276.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Jul 2024 14:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1721252858; x=1721857658;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LFrZwd9GNiLvkuS5/xMSjpbhFGQ7whY9+ki2oUxwZAE=;
 b=w0GqqR2giqKSO/LnhGYcY1ZlYaTDsc840KRkaKJgu4afYtR8A2DYH+TGHRK6qwEV2T
 5wOx3LPk9k+P1qDHyKoCt7RqKqjkzW6CwR8cL0dvri0cuOIjkTV5uX19+YZ4pz6Rf0dP
 1OiHYtmj76yKQXsydcs4ZuMH6GcoEQDYJM992d3rUNlx4hZHHIya4B2/6fBIVAOlh9ar
 W5EQDbJ/ltW1g6Dsu6Teep34biUW3ye4We6yIesI3o21wJ+k0IcI6XD7AHTZM2HcYHQa
 GWzu/FW+RfJd2ZOEml4GJDbePwCOQ+6K49Sy+cANDYqWbC93UX098sGkdHIGEitxwrAd
 vhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721252858; x=1721857658;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LFrZwd9GNiLvkuS5/xMSjpbhFGQ7whY9+ki2oUxwZAE=;
 b=pGmU1FVa4HX/krG8MgYVPlF3UU0Fc6fFegEPRXXs3x5QxRisUVIy1j7r+eSd5ushlg
 mPOX4iRQ1QtMbDMf3+cumyV0U5WDgvnECePbarD1eixsOSPdrXsKz/nxcdN0FhX0fJxw
 vM+82JeSxVhmy0YUxl9BtsfRPflJtFHdgcqcgPtQnwGcwB6SrFcJIcDN6lmJCNhC7nSF
 u9h+8XQOhLGEpV94le0XealRYEYuvl02MsIiTFdxanbxf69Iel3WCukdKnwDTbqdgloJ
 dCVI/WL3rVhtTQAZYWd5F/jxQASPsnmHsps/VhiU/dpFHqkFSrwQzxmrsAkse4VadiLf
 B2sA==
X-Gm-Message-State: AOJu0YxjmyfzPrFs69TaxRnMlT7MAdRsgwTjtsxzrj8A+h+VKBJAbSp9
 wq04W3KByyLpEQJvbQM/MnbkAT1gO8HJvblVDRc8XqafxuxwoRYBUAgNZ/vxf6lrX5J/Uz0IciM
 0kgjOXnCWPfJavn/PISVv780jDRA32TtwXukz+f3ww7b174KwMWBej1KmIhzqtbigXqMOodkHYw
 Z1MRAyEqUszy+onJXVtYrzFfYzCilCkVrJd/sl87ow1tY0pDT2dvTsqg==
X-Google-Smtp-Source: AGHT+IERn7jchP17TcPpS/jTpbVkuul+aEwwfvCmtxgvth3FwMT/UhxzXFX0kWfeeKOj8qB8AaTLAW3mZzI=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:67d2:d18c:b377:9764])
 (user=drosen job=sendgmr) by 2002:a05:6902:1209:b0:e03:a2f7:72e with SMTP id
 3f1490d57ef6-e05fe74bf8cmr1720276.0.1721252857968; Wed, 17 Jul 2024 14:47:37
 -0700 (PDT)
Date: Wed, 17 Jul 2024 14:47:33 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240717214733.3919322-1-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Previously, dumped symlinks would always create regular files
 instead. This allows symlinks to be dumped as symlinks with the -L option.
 The i_name field's name may not be the same as the actual name from the dirent,
 so we use the dirent name when available. 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.219.202 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.219.202 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1sUCUy-0004J8-Ip
Subject: [f2fs-dev] [PATCH v2] dump.f2fs: Dump symlinks as symlinks
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
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Previously, dumped symlinks would always create regular files instead.
This allows symlinks to be dumped as symlinks with the -L option.

The i_name field's name may not be the same as the actual name from the
dirent, so we use the dirent name when available.

Currently hardlinks aren't detected, so print a warning if we notice a
nondirectory with a link count over 1.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---

V2: Fixed some issues on the Windows build. Also S_ISLNK is defined as
false for the Windows build, so I adjusted some checks to not rely on that.
Removed some unused variables.

 fsck/dump.c       | 121 ++++++++++++++++++++++++++++++++++------------
 fsck/fsck.c       |   4 +-
 fsck/fsck.h       |   2 +-
 fsck/main.c       |  13 ++++-
 include/f2fs_fs.h |   8 +++
 lib/libf2fs_io.c  |  10 ++++
 man/dump.f2fs.8   |   3 ++
 7 files changed, 125 insertions(+), 36 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index 8d5613e..b67bf92 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -253,20 +253,27 @@ static void dump_folder_contents(struct f2fs_sb_info *sbi, u8 *bitmap,
 {
 	int i;
 	int name_len;
+	char name[F2FS_NAME_LEN + 1] = {0};
 
 	for (i = 0; i < max; i++) {
 		if (test_bit_le(i, bitmap) == 0)
 			continue;
 		name_len = le16_to_cpu(dentry[i].name_len);
+		if (name_len == 0 || name_len > F2FS_NAME_LEN) {
+			MSG(c.force, "Wrong name info\n\n");
+			ASSERT(name_len == 0 || name_len > F2FS_NAME_LEN);
+		}
 		if (name_len == 1 && filenames[i][0] == '.')
 			continue;
 		if (name_len == 2 && filenames[i][0] == '.' && filenames[i][1] == '.')
 			continue;
-		dump_node(sbi, le32_to_cpu(dentry[i].ino), 1, NULL, 0, 1);
+		strncpy(name, (const char *)filenames[i], name_len);
+		name[name_len] = 0;
+		dump_node(sbi, le32_to_cpu(dentry[i].ino), 1, NULL, 0, 1, name);
 	}
 }
 
-static void dump_data_blk(struct f2fs_sb_info *sbi, __u64 offset, u32 blkaddr, bool is_folder)
+static void dump_data_blk(struct f2fs_sb_info *sbi, __u64 offset, u32 blkaddr, int type)
 {
 	char buf[F2FS_BLKSIZE];
 
@@ -307,11 +314,15 @@ static void dump_data_blk(struct f2fs_sb_info *sbi, __u64 offset, u32 blkaddr, b
 		ASSERT(ret >= 0);
 	}
 
-	if (is_folder) {
+	if (S_ISDIR(type)) {
 		struct f2fs_dentry_block *d = (struct f2fs_dentry_block *) buf;
 
 		dump_folder_contents(sbi, d->dentry_bitmap, F2FS_DENTRY_BLOCK_DENTRIES(d),
 					F2FS_DENTRY_BLOCK_FILENAMES(d), NR_DENTRY_IN_BLOCK);
+#if !defined(__MINGW32__)
+	} if (S_ISLNK(type)) {
+		dev_write_symlink(buf, c.dump_sym_target_len);
+#endif
 	} else {
 		/* write blkaddr */
 		dev_write_dump(buf, offset, F2FS_BLKSIZE);
@@ -319,7 +330,7 @@ static void dump_data_blk(struct f2fs_sb_info *sbi, __u64 offset, u32 blkaddr, b
 }
 
 static void dump_node_blk(struct f2fs_sb_info *sbi, int ntype,
-				u32 nid, u32 addr_per_block, u64 *ofs, int is_dir)
+				u32 nid, u32 addr_per_block, u64 *ofs, int type)
 {
 	struct node_info ni;
 	struct f2fs_node *node_blk;
@@ -356,20 +367,20 @@ static void dump_node_blk(struct f2fs_sb_info *sbi, int ntype,
 		switch (ntype) {
 		case TYPE_DIRECT_NODE:
 			dump_data_blk(sbi, *ofs * F2FS_BLKSIZE,
-					le32_to_cpu(node_blk->dn.addr[i]), is_dir);
+					le32_to_cpu(node_blk->dn.addr[i]), type);
 			(*ofs)++;
 			break;
 		case TYPE_INDIRECT_NODE:
 			dump_node_blk(sbi, TYPE_DIRECT_NODE,
 					le32_to_cpu(node_blk->in.nid[i]),
 					addr_per_block,
-					ofs, is_dir);
+					ofs, type);
 			break;
 		case TYPE_DOUBLE_INDIRECT_NODE:
 			dump_node_blk(sbi, TYPE_INDIRECT_NODE,
 					le32_to_cpu(node_blk->in.nid[i]),
 					addr_per_block,
-					ofs, is_dir);
+					ofs, type);
 			break;
 		}
 	}
@@ -377,7 +388,7 @@ static void dump_node_blk(struct f2fs_sb_info *sbi, int ntype,
 }
 
 #ifdef HAVE_FSETXATTR
-static void dump_xattr(struct f2fs_sb_info *sbi, struct f2fs_node *node_blk, int is_dir)
+static void dump_xattr(struct f2fs_sb_info *sbi, struct f2fs_node *node_blk, int type)
 {
 	void *xattr;
 	void *last_base_addr;
@@ -431,19 +442,26 @@ static void dump_xattr(struct f2fs_sb_info *sbi, struct f2fs_node *node_blk, int
 
 		DBG(1, "fd %d xattr_name %s\n", c.dump_fd, xattr_name);
 #if defined(__linux__)
-		if (is_dir) {
+		if (S_ISDIR(type)) {
 			ret = setxattr(".", xattr_name, value,
 							le16_to_cpu(ent->e_value_size), 0);
+		} if (S_ISLNK(type) && c.preserve_symlinks) {
+			ret = lsetxattr(c.dump_symlink, xattr_name, value,
+							le16_to_cpu(ent->e_value_size), 0);
 		} else {
 			ret = fsetxattr(c.dump_fd, xattr_name, value,
 							le16_to_cpu(ent->e_value_size), 0);
 		}
 
 #elif defined(__APPLE__)
-		if (is_dir) {
+		if (S_ISDIR(type)) {
 			ret = setxattr(".", xattr_name, value,
 					le16_to_cpu(ent->e_value_size), 0,
 					XATTR_CREATE);
+		} if (S_ISLNK(type) && c.preserve_symlinks) {
+			ret = lsetxattr(c.dump_symlink, xattr_name, value,
+					le16_to_cpu(ent->e_value_size), 0,
+					XATTR_CREATE);
 		} else {
 			ret = fsetxattr(c.dump_fd, xattr_name, value,
 					le16_to_cpu(ent->e_value_size), 0,
@@ -473,14 +491,21 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	u32 i = 0;
 	u64 ofs = 0;
 	u32 addr_per_block;
-	bool is_dir = S_ISDIR(le16_to_cpu(node_blk->i.i_mode));
+	u16 type = le16_to_cpu(node_blk->i.i_mode);
 	int ret = 0;
 
 	if ((node_blk->i.i_inline & F2FS_INLINE_DATA)) {
 		DBG(3, "ino[0x%x] has inline data!\n", nid);
 		/* recover from inline data */
-		dev_write_dump(inline_data_addr(node_blk),
+#if !defined(__MINGW32__)
+		if (S_ISLNK(type) && c.preserve_symlinks) {
+			dev_write_symlink(inline_data_addr(node_blk), c.dump_sym_target_len);
+		} else
+#endif
+		{
+			dev_write_dump(inline_data_addr(node_blk),
 						0, MAX_INLINE_DATA(node_blk));
+		}
 		ret = -1;
 		goto dump_xattr;
 	}
@@ -504,7 +529,7 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	/* check data blocks in inode */
 	for (i = 0; i < ADDRS_PER_INODE(&node_blk->i); i++, ofs++)
 		dump_data_blk(sbi, ofs * F2FS_BLKSIZE, le32_to_cpu(
-			node_blk->i.i_addr[get_extra_isize(node_blk) + i]), is_dir);
+			node_blk->i.i_addr[get_extra_isize(node_blk) + i]), type);
 
 	/* check node blocks in inode */
 	for (i = 0; i < 5; i++) {
@@ -513,26 +538,26 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 					le32_to_cpu(F2FS_INODE_I_NID(&node_blk->i, i)),
 					addr_per_block,
 					&ofs,
-					is_dir);
+					type);
 		else if (i == 2 || i == 3)
 			dump_node_blk(sbi, TYPE_INDIRECT_NODE,
 					le32_to_cpu(F2FS_INODE_I_NID(&node_blk->i, i)),
 					addr_per_block,
 					&ofs,
-					is_dir);
+					type);
 		else if (i == 4)
 			dump_node_blk(sbi, TYPE_DOUBLE_INDIRECT_NODE,
 					le32_to_cpu(F2FS_INODE_I_NID(&node_blk->i, i)),
 					addr_per_block,
 					&ofs,
-					is_dir);
+					type);
 		else
 			ASSERT(0);
 	}
 	/* last block in extent cache */
 	print_extent(true);
 dump_xattr:
-	dump_xattr(sbi, node_blk, is_dir);
+	dump_xattr(sbi, node_blk, type);
 	return ret;
 }
 
@@ -555,6 +580,23 @@ static void dump_file(struct f2fs_sb_info *sbi, struct node_info *ni,
 	close(c.dump_fd);
 }
 
+static void dump_link(struct f2fs_sb_info *sbi, struct node_info *ni,
+				struct f2fs_node *node_blk, char *name)
+{
+#if defined(__MINGW32__)
+	dump_file(sbi, ni, node_blk, name);
+#else
+	struct f2fs_inode *inode = &node_blk->i;
+	int len = le32_to_cpu(inode->i_size);
+
+	if (!c.preserve_symlinks)
+		return dump_file(sbi, ni, node_blk, name);
+	c.dump_symlink = name;
+	c.dump_sym_target_len = len + 1;
+	dump_inode_blk(sbi, ni->ino, node_blk);
+#endif
+}
+
 static void dump_folder(struct f2fs_sb_info *sbi, struct node_info *ni,
 				struct f2fs_node *node_blk, char *path, int is_root)
 {
@@ -580,18 +622,24 @@ static void dump_folder(struct f2fs_sb_info *sbi, struct node_info *ni,
 
 static int dump_filesystem(struct f2fs_sb_info *sbi, struct node_info *ni,
 				struct f2fs_node *node_blk, int force, char *base_path,
-				bool is_base, bool allow_folder)
+				bool is_base, bool allow_folder, char *dirent_name)
 {
 	struct f2fs_inode *inode = &node_blk->i;
 	u32 imode = le16_to_cpu(inode->i_mode);
-	u32 namelen = le32_to_cpu(inode->i_namelen);
-	char name[F2FS_NAME_LEN + 1] = {0};
+	u32 ilinks = le32_to_cpu(inode->i_links);
+	u32 i_namelen = le32_to_cpu(inode->i_namelen);
+	char i_name[F2FS_NAME_LEN + 1] = {0};
+	char *name;
 	char path[1024] = {0};
 	char ans[255] = {0};
 	int is_encrypted = file_is_encrypt(inode);
 	int is_root = sbi->root_ino_num == ni->nid;
 	int ret;
 
+	if (!S_ISDIR(imode) && ilinks != 1) {
+		MSG(force, "Warning: Hard link detected. Dumped files may be duplicated\n");
+	}
+
 	if (is_encrypted) {
 		MSG(force, "File is encrypted\n");
 		return -1;
@@ -601,7 +649,7 @@ static int dump_filesystem(struct f2fs_sb_info *sbi, struct node_info *ni,
 		MSG(force, "Not a valid file type\n\n");
 		return -1;
 	}
-	if (!is_root && (namelen == 0 || namelen > F2FS_NAME_LEN)) {
+	if (!is_root && !dirent_name && (i_namelen == 0 || i_namelen > F2FS_NAME_LEN)) {
 		MSG(force, "Wrong name info\n\n");
 		return -1;
 	}
@@ -614,7 +662,7 @@ static int dump_filesystem(struct f2fs_sb_info *sbi, struct node_info *ni,
 		return dump_inode_blk(sbi, ni->ino, node_blk);
 
 	printf("Do you want to dump this %s into %s/? [Y/N] ",
-			S_ISREG(imode) || S_ISLNK(imode) ? "file" : "folder",
+			S_ISDIR(imode) ? "folder" : "file",
 			base_path);
 	ret = scanf("%s", ans);
 	ASSERT(ret >= 0);
@@ -635,23 +683,34 @@ dump:
 
 		/* make a file */
 		if (!is_root) {
-			strncpy(name, (const char *)inode->i_name, namelen);
-			name[namelen] = 0;
+			/* The i_name name may be out of date. Prefer dirent_name */
+			if (dirent_name) {
+				name = dirent_name;
+			} else  {
+				strncpy(i_name, (const char *)inode->i_name, i_namelen);
+				i_name[i_namelen] = 0;
+				name = i_name;
+			}
 		}
 
-		if (S_ISREG(imode) || S_ISLNK(imode)) {
+		if (S_ISREG(imode)) {
 			dump_file(sbi, ni, node_blk, name);
-		} else {
+		} else if (S_ISDIR(imode)) {
 			dump_folder(sbi, ni, node_blk, name, is_root);
+		} else {
+			dump_link(sbi, ni, node_blk, name);
 		}
 
 #if !defined(__MINGW32__)
 		/* fix up mode/owner */
 		if (c.preserve_perms) {
-			if (is_root)
+			if (is_root) {
+				name = i_name;
 				strncpy(name, ".", 2);
-			ASSERT(chmod(name, imode) == 0);
-			ASSERT(chown(name, inode->i_uid, inode->i_gid) == 0);
+			}
+			if (!S_ISLNK(imode))
+				ASSERT(chmod(name, imode) == 0);
+			ASSERT(lchown(name, inode->i_uid, inode->i_gid) == 0);
 		}
 #endif
 		if (is_base)
@@ -705,7 +764,7 @@ void dump_node_scan_disk(struct f2fs_sb_info *sbi, nid_t nid)
 	free(node_blk);
 }
 
-int dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force, char *base_path, int base, int allow_folder)
+int dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force, char *base_path, int base, int allow_folder, char *dirent_name)
 {
 	struct node_info ni;
 	struct f2fs_node *node_blk;
@@ -740,7 +799,7 @@ int dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force, char *base_path, i
 			print_node_info(sbi, node_blk, force);
 
 		if (ni.ino == ni.nid)
-			ret = dump_filesystem(sbi, &ni, node_blk, force, base_path, base, allow_folder);
+			ret = dump_filesystem(sbi, &ni, node_blk, force, base_path, base, allow_folder, dirent_name);
 	} else {
 		print_node_info(sbi, node_blk, force);
 		MSG(force, "Invalid (i)node block\n\n");
diff --git a/fsck/fsck.c b/fsck/fsck.c
index 7400dcf..b79b354 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1651,7 +1651,7 @@ static void print_dentry(struct f2fs_sb_info *sbi, __u8 *name,
 			d = d->next;
 		}
 		printf("/%s", new);
-		if (dump_node(sbi, le32_to_cpu(dentry[idx].ino), 0, NULL, 0, 0))
+		if (dump_node(sbi, le32_to_cpu(dentry[idx].ino), 0, NULL, 0, 0, NULL))
 			printf("\33[2K\r");
 	} else {
 		for (i = 1; i < depth; i++)
@@ -3632,7 +3632,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 		if (!strcasecmp(ans, "y")) {
 			for (i = 0; i < fsck->nr_nat_entries; i++) {
 				if (f2fs_test_bit(i, fsck->nat_area_bitmap))
-					dump_node(sbi, i, 1, NULL, 1, 0);
+					dump_node(sbi, i, 1, NULL, 1, 0, NULL);
 			}
 		}
 	}
diff --git a/fsck/fsck.h b/fsck/fsck.h
index 6cac926..476b436 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -277,7 +277,7 @@ struct dump_option {
 extern void nat_dump(struct f2fs_sb_info *, nid_t, nid_t);
 extern void sit_dump(struct f2fs_sb_info *, unsigned int, unsigned int);
 extern void ssa_dump(struct f2fs_sb_info *, int, int);
-extern int dump_node(struct f2fs_sb_info *, nid_t, int, char *, int, int);
+extern int dump_node(struct f2fs_sb_info *, nid_t, int, char *, int, int, char *);
 extern int dump_info_from_blkaddr(struct f2fs_sb_info *, u32);
 extern unsigned int start_bidx_of_node(unsigned int, struct f2fs_node *);
 extern void dump_node_scan_disk(struct f2fs_sb_info *sbi, nid_t nid);
diff --git a/fsck/main.c b/fsck/main.c
index c13e287..af00fa5 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -102,6 +102,7 @@ void dump_usage()
 	MSG(0, "  -y alias for -f\n");
 	MSG(0, "  -o dump inodes to the given path\n");
 	MSG(0, "  -P preserve mode/owner/group for dumped inode\n");
+	MSG(0, "  -L Preserves symlinks. Otherwise symlinks are dumped as regular files.\n");
 	MSG(0, "  -V print the version number and exit\n");
 
 	exit(1);
@@ -389,7 +390,7 @@ void f2fs_parse_options(int argc, char *argv[])
 		}
 	} else if (!strcmp("dump.f2fs", prog)) {
 #ifdef WITH_DUMP
-		const char *option_string = "d:fi:I:n:Mo:Prs:Sa:b:Vy";
+		const char *option_string = "d:fi:I:n:LMo:Prs:Sa:b:Vy";
 		static struct dump_option dump_opt = {
 			.nid = 0,	/* default root ino */
 			.start_nat = -1,
@@ -479,6 +480,14 @@ void f2fs_parse_options(int argc, char *argv[])
 				err = EWRONG_OPT;
 #else
 				c.preserve_perms = 1;
+#endif
+				break;
+			case 'L':
+#if defined(__MINGW32__)
+				MSG(0, "-L not supported for Windows\n");
+				err = EWRONG_OPT;
+#else
+				c.preserve_symlinks = 1;
 #endif
 				break;
 			case 'V':
@@ -957,7 +966,7 @@ static void do_dump(struct f2fs_sb_info *sbi)
 	if (opt->blk_addr != -1)
 		dump_info_from_blkaddr(sbi, opt->blk_addr);
 	if (opt->nid)
-		dump_node(sbi, opt->nid, c.force, opt->base_path, 1, 1);
+		dump_node(sbi, opt->nid, c.force, opt->base_path, 1, 1, NULL);
 	if (opt->scan_nid)
 		dump_node_scan_disk(sbi, opt->scan_nid);
 
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 870a6e4..08ba32d 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1478,6 +1478,8 @@ struct f2fs_configuration {
 	uint16_t s_encoding_flags;
 	int32_t kd;
 	int32_t dump_fd;
+	char *dump_symlink;
+	int dump_sym_target_len;
 	struct device_info devices[MAX_DEVICES];
 	int ndevs;
 	char *extension_list[2];
@@ -1540,7 +1542,10 @@ struct f2fs_configuration {
 	struct selinux_opt seopt_file[8];
 	int nr_opt;
 #endif
+
+	/* dump parameters */
 	int preserve_perms;
+	int preserve_symlinks;
 
 	/* resize parameters */
 	int safe_resize;
@@ -1614,6 +1619,9 @@ extern int dev_readahead(__u64, size_t UNUSED(len));
 extern int dev_write(void *, __u64, size_t);
 extern int dev_write_block(void *, __u64);
 extern int dev_write_dump(void *, __u64, size_t);
+#if !defined(__MINGW32__)
+extern int dev_write_symlink(char *, size_t);
+#endif
 /* All bytes in the buffer must be 0 use dev_fill(). */
 extern int dev_fill(void *, __u64, size_t);
 extern int dev_fill_block(void *, __u64);
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index b2d6933..f39367a 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -598,6 +598,16 @@ int dev_write_dump(void *buf, __u64 offset, size_t len)
 	return 0;
 }
 
+#if !defined(__MINGW32__)
+int dev_write_symlink(char *buf, size_t len)
+{
+	buf[len] = 0;
+	if (symlink(buf, c.dump_symlink))
+		return -1;
+	return 0;
+}
+#endif
+
 int dev_fill(void *buf, __u64 offset, size_t len)
 {
 	int fd;
diff --git a/man/dump.f2fs.8 b/man/dump.f2fs.8
index 60d6783..4035d57 100644
--- a/man/dump.f2fs.8
+++ b/man/dump.f2fs.8
@@ -71,6 +71,9 @@ Dump inodes to the given path
 .BI \-P
 Preserve mode/owner/group for dumped inode
 .TP
+.BI \-L
+Preserves symlinks. Otherwise symlinks are dumped as regular files.
+.TP
 .BI \-I " inode number"
 Specify an inode number and scan full disk to dump out, include history inode block
 .TP

base-commit: 584ebc710bc0779381595135e0686492c3908a20
-- 
2.45.2.993.g49e7a77208-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
