Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 663BF7891D0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Aug 2023 00:44:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZfXW-0003Nx-4U;
	Fri, 25 Aug 2023 22:44:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3vy7pZAYKAO4TheiUdWeeWbU.Sec@flex--drosen.bounces.google.com>)
 id 1qZfXU-0003Nl-D7 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:44:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tvl63k+SkBEdbOEox0yQsjRHTUUbE0p3x/a0euL2/L8=; b=hFZs8c1OX6WBx9t2zt0w/EmfuR
 zAPD1esbUCnrL3lMib/Ze3kbrqkigyGH3a3Q5P1m2PjMxSTdUDvzVy6mv/aSOKbl2PLhbPHoPss6M
 KYE7XGTymi09eZM1rP2a0UuKd7wbexypFdcQRi6LwwiuTidrV8cwfKjfpIopw+RSNrdQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tvl63k+SkBEdbOEox0yQsjRHTUUbE0p3x/a0euL2/L8=; b=DAZYxImBYrf9yEkbKDC60j6pBR
 AV8ben2Dx2UAdtoYAek0m6oovK9H0Ac5TSHfseFoc49iOLXxh3yvCm5hztYni5aQ7JwsxYHoV+2T6
 r94pR74nCLRLSwhQyMWFWcrJvfmBEDN3QbW+hUdKfJbcg2tYKAdXBg8Pv2PDUuse4LZU=;
Received: from mail-yw1-f201.google.com ([209.85.128.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZfXQ-0007NL-Rt for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:44:25 +0000
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-58c8cbf0a0dso50117447b3.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Aug 2023 15:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693003455; x=1693608255;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Tvl63k+SkBEdbOEox0yQsjRHTUUbE0p3x/a0euL2/L8=;
 b=s4Ac/As/Qhhivqdy6bJ2EP67BJ93j83pLO9S7IToYi/bwTSOelFw0XArOGGd0RlX6i
 iXnbA30t4CTqHWfaL81CEnWj/Kfz/NZOi+5ca5+KeayqXpEzu/gbKluZhoTHukrgBCF5
 t9CGEHQu+2FUYzxcYikwTRv88mJ9HGc7dq1b4FhscdKhBYu+KbD6EN2bATnR0zSb5uv1
 qI1nViOTFH67Q1oEw65UZSNxbw0b+yHiUEprROPaizLjmzH+JqpH+C6dasb4PovaqetK
 MxFCTlgl8p9GHd0i7DjVQYJtPWmUOJCmkhETq3YSJo+cs98mknGXJS4z7+HUuGJUQDiq
 od0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693003455; x=1693608255;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tvl63k+SkBEdbOEox0yQsjRHTUUbE0p3x/a0euL2/L8=;
 b=JPSXNJ58CBlQ4NLMrbVTrORFqBF3TgTRG4qLtc9bGu2CEcvLLFzOJvFl4hR7EoRvuk
 32BoKm3F47LuAf+i9EkB8UGq68bWyXqXCUPiUWhoEudSY/nutvrRTI41pGKl2rbbBsvy
 bDyEEV8hJ19fnhA9Qmz52IA76AMqjyTv2rdxPOhkmcORoDCUcsWyt4jwB8RXIUBH5oGB
 rdpNoXk8uvOwXrgl1shx38V0/b/DI07AK+Kcydfrp1pvy1K3Fm+VFe7FLGduLmL1tf4w
 Gn3+lW0KXtgg16ixLo6cJEjgD4MWY6qJZOnCrByZnTf/Qb5X6VeOSaLJZ7mXMtlKAIvP
 d7cQ==
X-Gm-Message-State: AOJu0Yy5r7jbpWfBsocigkyRjKnupB5EvpHsrCGQKFvtgUsw1a4srPVp
 gElVFj/hzpRZA4f7CQoHoQJnoAhh8CqBbB7Zl7Ovu+4WUX1TLiLyKOc8v/CauDpji09b2bEdHOG
 BEnL/LmcwOEg5u5DeDhat2D+h75SUSND6Z1jZ8FtkdgerFbd23a7eJ1+Av8vMHIHTJ/uc9gs3mx
 chiYwAAO0=
X-Google-Smtp-Source: AGHT+IHwkWYj0kVNPPgoNEOlFu0OqFLQZUAMTpc7/hx+SFmnHXYbhh8sVqcfKN38gNKc9WwBbbh//EX9oQI=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:ad1d:adc4:c021:b463])
 (user=drosen job=sendgmr) by 2002:a05:690c:2f87:b0:586:e91a:46c2 with SMTP id
 ew7-20020a05690c2f8700b00586e91a46c2mr567272ywb.4.1693003455139; Fri, 25 Aug
 2023 15:44:15 -0700 (PDT)
Date: Fri, 25 Aug 2023 15:43:56 -0700
In-Reply-To: <20230825224400.2206278-1-drosen@google.com>
Mime-Version: 1.0
References: <20230825224400.2206278-1-drosen@google.com>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
Message-ID: <20230825224400.2206278-4-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This converts inodes, direct nodes, and indirect nodes over
 to not being based on a 4K page size. f2fs_inode's i_nids field should now
 be accessed via a macro, as it's location depends on block size. 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.201 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.201 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qZfXQ-0007NL-Rt
Subject: [f2fs-dev] [PATCH v2 3/7] f2fs-tools: Refactor f2fs_node struct and
 friends
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

This converts inodes, direct nodes, and indirect nodes over to not being
based on a 4K page size. f2fs_inode's i_nids field should now be
accessed via a macro, as it's location depends on block size.

Access to direct nodes and indirect nodes is unchanged.

The node footer's location is also based on block sized, and accessed
via a macro. With these changes, you should use F2FS_BLKSIZE in place of
sizeof(struct f2fs_node)

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fsck/dir.c         | 20 ++++++++---------
 fsck/dump.c        | 24 ++++++++++-----------
 fsck/f2fs.h        |  2 +-
 fsck/fsck.c        | 54 +++++++++++++++++++++++-----------------------
 fsck/mount.c       | 20 ++++++++---------
 fsck/node.c        | 12 +++++------
 fsck/node.h        | 20 ++++++++---------
 include/f2fs_fs.h  | 54 +++++++++++++++++++++++++++++++++-------------
 lib/libf2fs.c      |  2 +-
 mkfs/f2fs_format.c | 10 ++++-----
 10 files changed, 121 insertions(+), 97 deletions(-)

diff --git a/fsck/dir.c b/fsck/dir.c
index 33f83ee..64beaad 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -116,7 +116,7 @@ static int find_in_level(struct f2fs_sb_info *sbi, struct f2fs_node *dir,
 	struct dnode_of_data dn;
 	void *dentry_blk;
 	int max_slots = 214;
-	nid_t ino = le32_to_cpu(dir->footer.ino);
+	nid_t ino = le32_to_cpu(F2FS_NODE_FOOTER(dir)->ino);
 	f2fs_hash_t namehash;
 	unsigned int dir_level = dir->i.i_dir_level;
 	int ret = 0;
@@ -239,7 +239,7 @@ int f2fs_add_link(struct f2fs_sb_info *sbi, struct f2fs_node *parent,
 	dentry_hash = f2fs_dentry_hash(get_encoding(sbi),
 						IS_CASEFOLDED(&parent->i),
 						name, name_len);
-	pino = le32_to_cpu(parent->footer.ino);
+	pino = le32_to_cpu(F2FS_NODE_FOOTER(parent)->ino);
 	dir_level = parent->i.i_dir_level;
 
 	if (!pino) {
@@ -340,7 +340,7 @@ add_dentry:
 static void make_empty_dir(struct f2fs_sb_info *sbi, struct f2fs_node *inode)
 {
 	struct f2fs_dentry_block *dent_blk;
-	nid_t ino = le32_to_cpu(inode->footer.ino);
+	nid_t ino = le32_to_cpu(F2FS_NODE_FOOTER(inode)->ino);
 	nid_t pino = le32_to_cpu(inode->i.i_pino);
 	struct f2fs_summary sum;
 	struct node_info ni;
@@ -381,7 +381,7 @@ static void make_empty_dir(struct f2fs_sb_info *sbi, struct f2fs_node *inode)
 static void page_symlink(struct f2fs_sb_info *sbi, struct f2fs_node *inode,
 					const char *symname, int symlen)
 {
-	nid_t ino = le32_to_cpu(inode->footer.ino);
+	nid_t ino = le32_to_cpu(F2FS_NODE_FOOTER(inode)->ino);
 	struct f2fs_summary sum;
 	struct node_info ni;
 	char *data_blk;
@@ -531,10 +531,10 @@ static void init_inode_block(struct f2fs_sb_info *sbi,
 
 	set_file_temperature(sbi, node_blk, de->name);
 
-	node_blk->footer.ino = cpu_to_le32(de->ino);
-	node_blk->footer.nid = cpu_to_le32(de->ino);
-	node_blk->footer.flag = 0;
-	node_blk->footer.cp_ver = ckpt->checkpoint_ver;
+	F2FS_NODE_FOOTER(node_blk)->ino = cpu_to_le32(de->ino);
+	F2FS_NODE_FOOTER(node_blk)->nid = cpu_to_le32(de->ino);
+	F2FS_NODE_FOOTER(node_blk)->flag = 0;
+	F2FS_NODE_FOOTER(node_blk)->cp_ver = ckpt->checkpoint_ver;
 	set_cold_node(node_blk, S_ISDIR(mode));
 
 	if (S_ISDIR(mode)) {
@@ -556,7 +556,7 @@ int convert_inline_dentry(struct f2fs_sb_info *sbi, struct f2fs_node *node,
 {
 	struct f2fs_inode *inode = &(node->i);
 	unsigned int dir_level = node->i.i_dir_level;
-	nid_t ino = le32_to_cpu(node->footer.ino);
+	nid_t ino = le32_to_cpu(F2FS_NODE_FOOTER(node)->ino);
 	char inline_data[MAX_INLINE_DATA(node)];
 	struct dnode_of_data dn;
 	struct f2fs_dentry_ptr d;
@@ -751,7 +751,7 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 
 	ret = f2fs_add_link(sbi, parent, child->i.i_name,
 				le32_to_cpu(child->i.i_namelen),
-				le32_to_cpu(child->footer.ino),
+				le32_to_cpu(F2FS_NODE_FOOTER(child)->ino),
 				map_de_type(le16_to_cpu(child->i.i_mode)),
 				ni.blk_addr, 1);
 	if (ret) {
diff --git a/fsck/dump.c b/fsck/dump.c
index a3fb9bc..ecadfdd 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -71,7 +71,7 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
 					"nid:%5u\tino:%5u\toffset:%5u"
 					"\tblkaddr:%10u\tpack:%d\n",
 					ni.nid, ni.ino,
-					le32_to_cpu(node_block->footer.flag) >>
+					le32_to_cpu(F2FS_NODE_FOOTER(node_block)->flag) >>
 						OFFSET_BIT_SHIFT,
 					ni.blk_addr, pack);
 				ret = write(fd, buf, strlen(buf));
@@ -92,7 +92,7 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
 				"nid:%5u\tino:%5u\toffset:%5u"
 				"\tblkaddr:%10u\tpack:%d\n",
 				ni.nid, ni.ino,
-				le32_to_cpu(node_block->footer.flag) >>
+				le32_to_cpu(F2FS_NODE_FOOTER(node_block)->flag) >>
 					OFFSET_BIT_SHIFT,
 				ni.blk_addr, pack);
 			ret = write(fd, buf, strlen(buf));
@@ -456,17 +456,17 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	for (i = 0; i < 5; i++) {
 		if (i == 0 || i == 1)
 			dump_node_blk(sbi, TYPE_DIRECT_NODE,
-					le32_to_cpu(node_blk->i.i_nid[i]),
+					le32_to_cpu(F2FS_INODE_I_NID(&node_blk->i, i)),
 					addr_per_block,
 					&ofs);
 		else if (i == 2 || i == 3)
 			dump_node_blk(sbi, TYPE_INDIRECT_NODE,
-					le32_to_cpu(node_blk->i.i_nid[i]),
+					le32_to_cpu(F2FS_INODE_I_NID(&node_blk->i, i)),
 					addr_per_block,
 					&ofs);
 		else if (i == 4)
 			dump_node_blk(sbi, TYPE_DOUBLE_INDIRECT_NODE,
-					le32_to_cpu(node_blk->i.i_nid[i]),
+					le32_to_cpu(F2FS_INODE_I_NID(&node_blk->i, i)),
 					addr_per_block,
 					&ofs);
 		else
@@ -570,11 +570,11 @@ void dump_node_scan_disk(struct f2fs_sb_info *sbi, nid_t nid)
 
 		ret = dev_read_block(node_blk, blkaddr);
 		ASSERT(ret >= 0);
-		if (le32_to_cpu(node_blk->footer.ino) != nid ||
-				le32_to_cpu(node_blk->footer.nid) != nid)
+		if (le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->ino) != nid ||
+				le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->nid) != nid)
 			continue;
 		MSG(0, "Info: nid: %u, blkaddr: %lu\n", nid, blkaddr);
-		MSG(0, "node_blk.footer.flag [0x%x]\n", le32_to_cpu(node_blk->footer.flag));
+		MSG(0, "node_blk.footer.flag [0x%x]\n", le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->flag));
 		MSG(0, "node_blk.footer.cp_ver [%x]\n", (u32)(cpver_of_node(node_blk)));
 		print_inode_info(sbi, node_blk, 0);
 	}
@@ -608,11 +608,11 @@ int dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force)
 	if (!is_sit_bitmap_set(sbi, ni.blk_addr))
 		MSG(force, "Invalid sit bitmap, %u\n\n", ni.blk_addr);
 
-	DBG(1, "node_blk.footer.ino [0x%x]\n", le32_to_cpu(node_blk->footer.ino));
-	DBG(1, "node_blk.footer.nid [0x%x]\n", le32_to_cpu(node_blk->footer.nid));
+	DBG(1, "node_blk.footer.ino [0x%x]\n", le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->ino));
+	DBG(1, "node_blk.footer.nid [0x%x]\n", le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->nid));
 
-	if (le32_to_cpu(node_blk->footer.ino) == ni.ino &&
-			le32_to_cpu(node_blk->footer.nid) == ni.nid) {
+	if (le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->ino) == ni.ino &&
+			le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->nid) == ni.nid) {
 		if (!c.show_file_map)
 			print_node_info(sbi, node_blk, force);
 
diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 9791071..0b136b0 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -332,7 +332,7 @@ static inline void *inline_data_addr(struct f2fs_node *node_blk)
 
 static inline unsigned int ofs_of_node(struct f2fs_node *node_blk)
 {
-	unsigned flag = le32_to_cpu(node_blk->footer.flag);
+	unsigned flag = le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->flag);
 	return flag >> OFFSET_BIT_SHIFT;
 }
 
diff --git a/fsck/fsck.c b/fsck/fsck.c
index e0dce16..769ee65 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -243,7 +243,7 @@ static int is_valid_summary(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	ret = dev_read_block(node_blk, ni.blk_addr);
 	ASSERT(ret >= 0);
 
-	if (le32_to_cpu(node_blk->footer.nid) != nid)
+	if (le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->nid) != nid)
 		goto out;
 
 	/* check its block address */
@@ -436,33 +436,33 @@ static int sanity_check_nid(struct f2fs_sb_info *sbi, u32 nid,
 	ASSERT(ret >= 0);
 
 	if (ntype == TYPE_INODE &&
-			node_blk->footer.nid != node_blk->footer.ino) {
+			F2FS_NODE_FOOTER(node_blk)->nid != F2FS_NODE_FOOTER(node_blk)->ino) {
 		ASSERT_MSG("nid[0x%x] footer.nid[0x%x] footer.ino[0x%x]",
-				nid, le32_to_cpu(node_blk->footer.nid),
-				le32_to_cpu(node_blk->footer.ino));
+				nid, le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->nid),
+				le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->ino));
 		return -EINVAL;
 	}
-	if (ni->ino != le32_to_cpu(node_blk->footer.ino)) {
+	if (ni->ino != le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->ino)) {
 		ASSERT_MSG("nid[0x%x] nat_entry->ino[0x%x] footer.ino[0x%x]",
-				nid, ni->ino, le32_to_cpu(node_blk->footer.ino));
+				nid, ni->ino, le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->ino));
 		return -EINVAL;
 	}
 	if (ntype != TYPE_INODE && IS_INODE(node_blk)) {
 		ASSERT_MSG("nid[0x%x] footer.nid[0x%x] footer.ino[0x%x]",
-				nid, le32_to_cpu(node_blk->footer.nid),
-				le32_to_cpu(node_blk->footer.ino));
+				nid, le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->nid),
+				le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->ino));
 		return -EINVAL;
 	}
 
-	if (le32_to_cpu(node_blk->footer.nid) != nid) {
+	if (le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->nid) != nid) {
 		ASSERT_MSG("nid[0x%x] blk_addr[0x%x] footer.nid[0x%x]",
 				nid, ni->blk_addr,
-				le32_to_cpu(node_blk->footer.nid));
+				le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->nid));
 		return -EINVAL;
 	}
 
 	if (ntype == TYPE_XATTR) {
-		u32 flag = le32_to_cpu(node_blk->footer.flag);
+		u32 flag = le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->flag);
 
 		if ((flag >> OFFSET_BIT_SHIFT) != XATTR_NODE_OFFSET) {
 			ASSERT_MSG("xnid[0x%x] has wrong ofs:[0x%x]",
@@ -674,9 +674,9 @@ retry:
 			ret = dev_read_block(node_blk, blkaddr);
 			ASSERT(ret >= 0);
 
-			if (le32_to_cpu(node_blk->footer.ino) !=
+			if (le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->ino) !=
 					root_ino ||
-				le32_to_cpu(node_blk->footer.nid) !=
+				le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->nid) !=
 					root_ino)
 				continue;
 
@@ -1131,13 +1131,13 @@ check_next:
 
 	/* readahead node blocks */
 	for (idx = 0; idx < 5; idx++) {
-		u32 nid = le32_to_cpu(node_blk->i.i_nid[idx]);
+		u32 nid = le32_to_cpu(F2FS_INODE_I_NID(&node_blk->i, idx));
 		fsck_reada_node_block(sbi, nid);
 	}
 
 	/* check node blocks in inode */
 	for (idx = 0; idx < 5; idx++) {
-		nid_t i_nid = le32_to_cpu(node_blk->i.i_nid[idx]);
+		nid_t i_nid = le32_to_cpu(F2FS_INODE_I_NID(&node_blk->i, idx));
 
 		if (idx == 0 || idx == 1)
 			ntype = TYPE_DIRECT_NODE;
@@ -1157,7 +1157,7 @@ check_next:
 			*blk_cnt = *blk_cnt + 1;
 		} else if (ret == -EINVAL) {
 			if (c.fix_on) {
-				node_blk->i.i_nid[idx] = 0;
+				F2FS_INODE_I_NID(&node_blk->i, idx) = 0;
 				need_fix = 1;
 				FIX_MSG("[0x%x] i_nid[%d] = 0", nid, idx);
 			}
@@ -1230,17 +1230,17 @@ skip_blkcnt_fix:
 			      file_enc_name(&node_blk->i));
 	if (ftype == F2FS_FT_ORPHAN)
 		DBG(1, "Orphan Inode: 0x%x [%s] i_blocks: %u\n\n",
-				le32_to_cpu(node_blk->footer.ino),
+				le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->ino),
 				en, (u32)i_blocks);
 
 	if (is_qf_ino(F2FS_RAW_SUPER(sbi), nid))
 		DBG(1, "Quota Inode: 0x%x [%s] i_blocks: %u\n\n",
-				le32_to_cpu(node_blk->footer.ino),
+				le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->ino),
 				en, (u32)i_blocks);
 
 	if (ftype == F2FS_FT_DIR) {
 		DBG(1, "Directory Inode: 0x%x [%s] depth: %d has %d files\n\n",
-				le32_to_cpu(node_blk->footer.ino), en,
+				le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->ino), en,
 				le32_to_cpu(node_blk->i.i_current_depth),
 				child.files);
 
@@ -1276,7 +1276,7 @@ skip_blkcnt_fix:
 		(c.preen_mode != PREEN_MODE_2 || i_gc_failures != 0x01)) {
 
 		DBG(1, "Regular Inode: 0x%x [%s] depth: %d\n\n",
-				le32_to_cpu(node_blk->footer.ino), en,
+				le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->ino), en,
 				i_gc_failures);
 
 		if (c.fix_on) {
@@ -1436,7 +1436,7 @@ skip:
 
 	if (need_fix && f2fs_dev_is_writable()) {
 		struct node_info ni;
-		nid_t nid = le32_to_cpu(node_blk->footer.nid);
+		nid_t nid = le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->nid);
 
 		get_node_info(sbi, nid, &ni);
 		ret = dev_write_block(node_blk, ni.blk_addr);
@@ -1478,7 +1478,7 @@ skip:
 
 	if (need_fix && f2fs_dev_is_writable()) {
 		struct node_info ni;
-		nid_t nid = le32_to_cpu(node_blk->footer.nid);
+		nid_t nid = le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->nid);
 
 		get_node_info(sbi, nid, &ni);
 		ret = dev_write_block(node_blk, ni.blk_addr);
@@ -2826,7 +2826,7 @@ static struct f2fs_node *fsck_get_lpf(struct f2fs_sb_info *sbi)
 		    de.ino, ni.blk_addr);
 	}
 
-	c.lpf_ino = le32_to_cpu(node->footer.ino);
+	c.lpf_ino = le32_to_cpu(F2FS_NODE_FOOTER(node)->ino);
 	return node;
 out:
 	free(node);
@@ -2839,7 +2839,7 @@ static int fsck_do_reconnect_file(struct f2fs_sb_info *sbi,
 {
 	char name[80];
 	size_t namelen;
-	nid_t ino = le32_to_cpu(fnode->footer.ino);
+	nid_t ino = le32_to_cpu(F2FS_NODE_FOOTER(fnode)->ino);
 	struct node_info ni;
 	int ftype, ret;
 
@@ -2853,7 +2853,7 @@ static int fsck_do_reconnect_file(struct f2fs_sb_info *sbi,
 		return -EEXIST;
 	}
 
-	get_node_info(sbi, le32_to_cpu(lpf->footer.ino), &ni);
+	get_node_info(sbi, le32_to_cpu(F2FS_NODE_FOOTER(lpf)->ino), &ni);
 	ftype = map_de_type(le16_to_cpu(fnode->i.i_mode));
 	ret = f2fs_add_link(sbi, lpf, (unsigned char *)name, namelen,
 			    ino, ftype, ni.blk_addr, 0);
@@ -2866,7 +2866,7 @@ static int fsck_do_reconnect_file(struct f2fs_sb_info *sbi,
 	memcpy(fnode->i.i_name, name, namelen);
 	fnode->i.i_namelen = cpu_to_le32(namelen);
 	fnode->i.i_pino = c.lpf_ino;
-	get_node_info(sbi, le32_to_cpu(fnode->footer.ino), &ni);
+	get_node_info(sbi, le32_to_cpu(F2FS_NODE_FOOTER(fnode)->ino), &ni);
 	ret = dev_write_block(fnode, ni.blk_addr);
 	ASSERT(ret >= 0);
 
@@ -3017,7 +3017,7 @@ static void fsck_failed_reconnect_file(struct f2fs_sb_info *sbi, nid_t ino)
 	}
 
 	for (i = 0; i < 5; i++) {
-		nid = le32_to_cpu(node->i.i_nid[i]);
+		nid = le32_to_cpu(F2FS_INODE_I_NID(&node->i, i));
 		if (!nid)
 			continue;
 
diff --git a/fsck/mount.c b/fsck/mount.c
index f09e468..162d742 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -364,11 +364,11 @@ void print_inode_info(struct f2fs_sb_info *sbi,
 				blkaddr, blkaddr);
 	}
 
-	DISP_u32(inode, i_nid[0]);	/* direct */
-	DISP_u32(inode, i_nid[1]);	/* direct */
-	DISP_u32(inode, i_nid[2]);	/* indirect */
-	DISP_u32(inode, i_nid[3]);	/* indirect */
-	DISP_u32(inode, i_nid[4]);	/* double indirect */
+	DISP_u32(F2FS_INODE_NIDS(inode), i_nid[0]);	/* direct */
+	DISP_u32(F2FS_INODE_NIDS(inode), i_nid[1]);	/* direct */
+	DISP_u32(F2FS_INODE_NIDS(inode), i_nid[2]);	/* indirect */
+	DISP_u32(F2FS_INODE_NIDS(inode), i_nid[3]);	/* indirect */
+	DISP_u32(F2FS_INODE_NIDS(inode), i_nid[4]);	/* double indirect */
 
 	xattr_addr = read_all_xattrs(sbi, node);
 	if (!xattr_addr)
@@ -393,8 +393,8 @@ out:
 void print_node_info(struct f2fs_sb_info *sbi,
 			struct f2fs_node *node_block, int verbose)
 {
-	nid_t ino = le32_to_cpu(node_block->footer.ino);
-	nid_t nid = le32_to_cpu(node_block->footer.nid);
+	nid_t ino = le32_to_cpu(F2FS_NODE_FOOTER(node_block)->ino);
+	nid_t nid = le32_to_cpu(F2FS_NODE_FOOTER(node_block)->nid);
 	/* Is this inode? */
 	if (ino == nid) {
 		DBG(verbose, "Node ID [0x%x:%u] is inode\n", nid, nid);
@@ -2058,7 +2058,7 @@ static void restore_node_summary(struct f2fs_sb_info *sbi,
 	for (i = 0; i < sbi->blocks_per_seg; i++, sum_entry++) {
 		ret = dev_read_block(node_blk, addr);
 		ASSERT(ret >= 0);
-		sum_entry->nid = node_blk->footer.nid;
+		sum_entry->nid = F2FS_NODE_FOOTER(node_blk)->nid;
 		addr++;
 	}
 	free(node_blk);
@@ -2453,7 +2453,7 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
 
 	/* check extent cache entry */
 	if (!IS_INODE(node_blk)) {
-		get_node_info(sbi, le32_to_cpu(node_blk->footer.ino), &ni);
+		get_node_info(sbi, le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->ino), &ni);
 
 		/* read inode block */
 		ret = dev_read_block(node_blk, ni.blk_addr);
@@ -3568,7 +3568,7 @@ static int loop_node_chain_fix(block_t blkaddr_fast,
 	} while (blkaddr != blkaddr_entry);
 
 	/* fix the blkaddr of last node with NULL_ADDR. */
-	node_blk->footer.next_blkaddr = NULL_ADDR;
+	F2FS_NODE_FOOTER(node_blk)->next_blkaddr = NULL_ADDR;
 	if (IS_INODE(node_blk))
 		err = write_inode(node_blk, blkaddr_tmp);
 	else
diff --git a/fsck/node.c b/fsck/node.c
index 49bc2b6..3761470 100644
--- a/fsck/node.c
+++ b/fsck/node.c
@@ -66,7 +66,7 @@ int f2fs_rebuild_qf_inode(struct f2fs_sb_info *sbi, int qtype)
 
 	if (is_set_ckpt_flags(ckpt, CP_CRC_RECOVERY_FLAG))
 		cp_ver |= (cur_cp_crc(ckpt) << 32);
-	raw_node->footer.cp_ver = cpu_to_le64(cp_ver);
+	F2FS_NODE_FOOTER(raw_node)->cp_ver = cpu_to_le64(cp_ver);
 
 	get_node_info(sbi, ino, &ni);
 	set_summary(&sum, ino, 0, ni.version);
@@ -128,10 +128,10 @@ block_t new_node_block(struct f2fs_sb_info *sbi,
 	node_blk = calloc(BLOCK_SZ, 1);
 	ASSERT(node_blk);
 
-	node_blk->footer.nid = cpu_to_le32(dn->nid);
-	node_blk->footer.ino = f2fs_inode->footer.ino;
-	node_blk->footer.flag = cpu_to_le32(ofs << OFFSET_BIT_SHIFT);
-	node_blk->footer.cp_ver = ckpt->checkpoint_ver;
+	F2FS_NODE_FOOTER(node_blk)->nid = cpu_to_le32(dn->nid);
+	F2FS_NODE_FOOTER(node_blk)->ino = F2FS_NODE_FOOTER(f2fs_inode)->ino;
+	F2FS_NODE_FOOTER(node_blk)->flag = cpu_to_le32(ofs << OFFSET_BIT_SHIFT);
+	F2FS_NODE_FOOTER(node_blk)->cp_ver = ckpt->checkpoint_ver;
 	set_cold_node(node_blk, S_ISDIR(le16_to_cpu(f2fs_inode->i.i_mode)));
 
 	type = CURSEG_COLD_NODE;
@@ -155,7 +155,7 @@ block_t new_node_block(struct f2fs_sb_info *sbi,
 	}
 
 	/* update nat info */
-	update_nat_blkaddr(sbi, le32_to_cpu(f2fs_inode->footer.ino),
+	update_nat_blkaddr(sbi, le32_to_cpu(F2FS_NODE_FOOTER(f2fs_inode)->ino),
 						dn->nid, blkaddr);
 
 	dn->node_blk = node_blk;
diff --git a/fsck/node.h b/fsck/node.h
index d38c322..a6108ac 100644
--- a/fsck/node.h
+++ b/fsck/node.h
@@ -20,13 +20,13 @@
 
 static inline bool IS_INODE(struct f2fs_node *node)
 {
-	return node->footer.ino == node->footer.nid;
+	return F2FS_NODE_FOOTER(node)->nid == F2FS_NODE_FOOTER(node)->ino;
 }
 
 static inline unsigned int ADDRS_PER_PAGE(struct f2fs_sb_info *sbi,
 		struct f2fs_node *node_blk, struct f2fs_node *inode_blk)
 {
-	nid_t ino = le32_to_cpu(node_blk->footer.ino);
+	nid_t ino = le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->ino);
 	unsigned int nblocks;
 
 	if (IS_INODE(node_blk))
@@ -71,7 +71,7 @@ static inline block_t datablock_addr(struct f2fs_node *node_page,
 static inline void set_nid(struct f2fs_node * rn, int off, nid_t nid, int i)
 {
 	if (i)
-		rn->i.i_nid[off - NODE_DIR1_BLOCK] = cpu_to_le32(nid);
+		F2FS_INODE_I_NID(&rn->i, off - NODE_DIR1_BLOCK) = cpu_to_le32(nid);
 	else
 		rn->in.nid[off] = cpu_to_le32(nid);
 }
@@ -79,7 +79,7 @@ static inline void set_nid(struct f2fs_node * rn, int off, nid_t nid, int i)
 static inline nid_t get_nid(struct f2fs_node * rn, int off, int i)
 {
 	if (i)
-		return le32_to_cpu(rn->i.i_nid[off - NODE_DIR1_BLOCK]);
+		return le32_to_cpu(F2FS_INODE_I_NID(&rn->i, off - NODE_DIR1_BLOCK));
 	else
 		return le32_to_cpu(rn->in.nid[off]);
 }
@@ -127,12 +127,12 @@ static inline int IS_DNODE(struct f2fs_node *node_page)
 
 static inline nid_t ino_of_node(struct f2fs_node *node_blk)
 {
-	return le32_to_cpu(node_blk->footer.ino);
+	return le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->ino);
 }
 
 static inline __u64 cpver_of_node(struct f2fs_node *node_blk)
 {
-	return le64_to_cpu(node_blk->footer.cp_ver);
+	return le64_to_cpu(F2FS_NODE_FOOTER(node_blk)->cp_ver);
 }
 
 static inline bool is_recoverable_dnode(struct f2fs_sb_info *sbi,
@@ -153,23 +153,23 @@ static inline bool is_recoverable_dnode(struct f2fs_sb_info *sbi,
 
 static inline block_t next_blkaddr_of_node(struct f2fs_node *node_blk)
 {
-	return le32_to_cpu(node_blk->footer.next_blkaddr);
+	return le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->next_blkaddr);
 }
 
 static inline int is_node(struct f2fs_node *node_blk, int type)
 {
-	return le32_to_cpu(node_blk->footer.flag) & (1 << type);
+	return le32_to_cpu(F2FS_NODE_FOOTER(node_blk)->flag) & (1 << type);
 }
 
 static inline void set_cold_node(struct f2fs_node *rn, bool is_dir)
 {
-	unsigned int flag = le32_to_cpu(rn->footer.flag);
+	unsigned int flag = le32_to_cpu(F2FS_NODE_FOOTER(rn)->flag);
 
 	if (is_dir)
 		flag &= ~(0x1 << COLD_BIT_SHIFT);
 	else
 		flag |= (0x1 << COLD_BIT_SHIFT);
-	rn->footer.flag = cpu_to_le32(flag);
+	F2FS_NODE_FOOTER(rn)->flag = cpu_to_le32(flag);
 }
 
 #define is_fsync_dnode(node_blk)	is_node(node_blk, FSYNC_BIT_SHIFT)
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index c5b1e26..13a1c14 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -995,6 +995,14 @@ struct f2fs_compr_blk_cnt {
  * inode flags
  */
 #define F2FS_COMPR_FL		0x00000004 /* Compress file */
+/*
+ * On disk layout is
+ * struct f2fs_inode
+ * struct f2fs_inode_nids
+ *
+ * where the size of f2fs_inode depends on block size.
+ * Do NOT use sizeof
+ */
 struct f2fs_inode {
 	__le16 i_mode;			/* file mode */
 	__u8 i_advise;			/* file hints */
@@ -1044,28 +1052,28 @@ struct f2fs_inode {
 						 */
 			__le32 i_extra_end[0];	/* for attribute size calculation */
 		} __attribute__((packed));
-		__le32 i_addr[DEF_ADDRS_PER_INODE];	/* Pointers to data blocks */
+		__le32 i_addr[0];	/* Pointers to DEF_ADDRS_PER_INODE data blocks */
 	};
+};
+struct f2fs_inode_nids {
 	__le32 i_nid[5];		/* direct(2), indirect(2),
 						double_indirect(1) node id */
 };
 
+#define F2FS_INODE_NIDS(inode) ((struct f2fs_inode_nids *)(&(inode)->i_addr[DEF_ADDRS_PER_INODE]))
+#define F2FS_INODE_I_NID(inode, i) (F2FS_INODE_NIDS((inode))->i_nid[(i)])
+
 static_assert(offsetof(struct f2fs_inode, i_extra_end) -
 	      offsetof(struct f2fs_inode, i_extra_isize) == 36, "");
-static_assert(sizeof(struct f2fs_inode) == F2FS_BLKSIZE - 24, "");
 
 struct direct_node {
-	__le32 addr[DEF_ADDRS_PER_BLOCK];	/* array of data block address */
+	__le32 addr[0];	/* array of DEF_ADDRS_PER_BLOCK data block address */
 };
 
-static_assert(sizeof(struct direct_node) == F2FS_BLKSIZE - 24, "");
-
 struct indirect_node {
-	__le32 nid[NIDS_PER_BLOCK];	/* array of data block address */
+	__le32 nid[0];	/* array of NIDS_PER_BLOCK data block address */
 };
 
-static_assert(sizeof(struct indirect_node) == F2FS_BLKSIZE - 24, "");
-
 enum {
 	COLD_BIT_SHIFT = 0,
 	FSYNC_BIT_SHIFT,
@@ -1075,7 +1083,14 @@ enum {
 
 #define XATTR_NODE_OFFSET	((((unsigned int)-1) << OFFSET_BIT_SHIFT) \
 				>> OFFSET_BIT_SHIFT)
-
+/*
+ * On disk format is:
+ * struct f2fs_node
+ * struct node_footer
+ *
+ * where the size of f2fs_node depends on Block Size.
+ * Do NOT use sizeof. Use F2FS_BLKSIZE instead.
+ */
 struct f2fs_node {
 	/* can be one of three types: inode, direct, and indirect types */
 	union {
@@ -1083,10 +1098,9 @@ struct f2fs_node {
 		struct direct_node dn;
 		struct indirect_node in;
 	};
-	struct node_footer footer;
 };
-
-static_assert(sizeof(struct f2fs_node) == F2FS_BLKSIZE, "");
+#define F2FS_NODE_FOOTER(blk) ((struct node_footer *)\
+				&(((char *)(&(blk)->i))[F2FS_BLKSIZE - sizeof(struct node_footer)]))
 
 /*
  * For NAT entries
@@ -1783,9 +1797,9 @@ static inline void show_version(const char *prog)
 static inline void f2fs_init_inode(struct f2fs_super_block *sb,
 		struct f2fs_node *raw_node, nid_t ino, time_t mtime, mode_t mode)
 {
-	raw_node->footer.nid = cpu_to_le32(ino);
-	raw_node->footer.ino = cpu_to_le32(ino);
-	raw_node->footer.cp_ver = cpu_to_le64(1);
+	F2FS_NODE_FOOTER(raw_node)->nid = cpu_to_le32(ino);
+	F2FS_NODE_FOOTER(raw_node)->ino = cpu_to_le32(ino);
+	F2FS_NODE_FOOTER(raw_node)->cp_ver = cpu_to_le64(1);
 
 	raw_node->i.i_uid = cpu_to_le32(c.root_uid);
 	raw_node->i.i_gid = cpu_to_le32(c.root_gid);
@@ -1971,6 +1985,16 @@ static inline void check_block_struct_sizes(void)
 	/* Check Orphan Block Size */
 	assert(F2FS_ORPHANS_PER_BLOCK * sizeof(__le32)
 			+ sizeof(struct orphan_block_footer) == F2FS_BLKSIZE);
+
+	/* Check Inode Block Size */
+	assert(offsetof(struct f2fs_inode, i_extra_isize) + DEF_ADDRS_PER_INODE * sizeof(__le32)
+		+ sizeof(struct f2fs_inode_nids) + sizeof(struct node_footer) == F2FS_BLKSIZE);
+
+	/* Check Direct Block Size */
+	assert(DEF_ADDRS_PER_BLOCK * sizeof(__le32) + sizeof(struct node_footer) == F2FS_BLKSIZE);
+
+	/* Check Indirect Block Size */
+	assert(NIDS_PER_BLOCK * sizeof(__le32) + sizeof(struct node_footer) == F2FS_BLKSIZE);
 }
 
 #endif	/*__F2FS_FS_H */
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index c3d5744..8f2cc3b 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -571,7 +571,7 @@ int f2fs_crc_valid(uint32_t blk_crc, void *buf, int len)
 __u32 f2fs_inode_chksum(struct f2fs_node *node)
 {
 	struct f2fs_inode *ri = &node->i;
-	__le32 ino = node->footer.ino;
+	__le32 ino = F2FS_NODE_FOOTER(node)->ino;
 	__le32 gen = ri->i_generation;
 	__u32 chksum, chksum_seed;
 	__u32 dummy_cs = 0;
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 3453e17..50890c8 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -1104,7 +1104,7 @@ static int f2fs_discard_obsolete_dnode(void)
 	if (c.zoned_mode || c.feature & F2FS_FEATURE_RO)
 		return 0;
 
-	raw_node = calloc(sizeof(struct f2fs_node), 1);
+	raw_node = calloc(F2FS_BLKSIZE, 1);
 	if (raw_node == NULL) {
 		MSG(1, "\tError: Calloc Failed for discard_raw_node!!!\n");
 		return -1;
@@ -1128,7 +1128,7 @@ static int f2fs_discard_obsolete_dnode(void)
 			return -1;
 		}
 
-		next_blkaddr = le32_to_cpu(raw_node->footer.next_blkaddr);
+		next_blkaddr = le32_to_cpu(F2FS_NODE_FOOTER(raw_node)->next_blkaddr);
 		memset(raw_node, 0, F2FS_BLKSIZE);
 
 		DBG(1, "\tDiscard dnode, at offset 0x%08"PRIx64"\n", offset);
@@ -1295,7 +1295,7 @@ static int f2fs_write_root_inode(void)
 				cpu_to_le32(data_blkaddr);
 
 	node_blkaddr = alloc_next_free_block(CURSEG_HOT_NODE);
-	raw_node->footer.next_blkaddr = cpu_to_le32(node_blkaddr + 1);
+	F2FS_NODE_FOOTER(raw_node)->next_blkaddr = cpu_to_le32(node_blkaddr + 1);
 
 	DBG(1, "\tWriting root inode (hot node), offset 0x%x\n", node_blkaddr);
 	if (write_inode(raw_node, node_blkaddr) < 0) {
@@ -1413,7 +1413,7 @@ static int f2fs_write_qf_inode(int qtype)
 	raw_node->i.i_flags = F2FS_NOATIME_FL | F2FS_IMMUTABLE_FL;
 
 	node_blkaddr = alloc_next_free_block(CURSEG_HOT_NODE);
-	raw_node->footer.next_blkaddr = cpu_to_le32(node_blkaddr + 1);
+	F2FS_NODE_FOOTER(raw_node)->next_blkaddr = cpu_to_le32(node_blkaddr + 1);
 
 	if (qtype == 0)
 		raw_id = raw_node->i.i_uid;
@@ -1548,7 +1548,7 @@ static int f2fs_write_lpf_inode(void)
 	memcpy(raw_node->i.i_name, LPF, strlen(LPF));
 
 	node_blkaddr = alloc_next_free_block(CURSEG_HOT_NODE);
-	raw_node->footer.next_blkaddr = cpu_to_le32(node_blkaddr + 1);
+	F2FS_NODE_FOOTER(raw_node)->next_blkaddr = cpu_to_le32(node_blkaddr + 1);
 
 	data_blkaddr = f2fs_add_default_dentry_lpf();
 	if (data_blkaddr == 0) {
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
