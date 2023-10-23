Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 301CD7D3B68
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Oct 2023 17:50:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1quxC4-0003Uc-Bt;
	Mon, 23 Oct 2023 15:50:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1quxC3-0003UW-Ey
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Oct 2023 15:50:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lkM8TIq/NlYySFhvGqrE3jbsIZgqOu+BgOxJvgN4C04=; b=MjGOYSZ/HFSOrBc1knmGQEAV1f
 2TDrM5N4Dj4lZh4ewVqcoCTs6qhXkTukzHY0tEB3R7XfpLje+vZACFWyYKx623iVDO93JWQommCuo
 lcbzOU5C2fTZqMIh0FAaeY/zbYhubVQi/NedwXEWOa4hn0cF6akgaHuu/DyrvTaOaQtk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lkM8TIq/NlYySFhvGqrE3jbsIZgqOu+BgOxJvgN4C04=; b=E
 QITELvRRTEWk5o8vjrxYjk5aSzCZqN9rsviPlNau+ExmTlgtO0vzliqa5bUXRZzKStFYBJXjEoup+
 CX1xHNfyuCwSJL17lnKgLqoeW0m7iDRNOBYxdbKggOYYgO33YVeNFOC2tRXVsmhfsT1YqguL3BcUg
 sfrjmX7OSK4QypGc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1quxC1-0003CU-89 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Oct 2023 15:50:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CFB78611D2;
 Mon, 23 Oct 2023 15:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721DEC433C7;
 Mon, 23 Oct 2023 15:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698076207;
 bh=3B2tSxV6IN3MazpAODTh+X3dsGQV8JikrDOOfV8wqXA=;
 h=From:To:Cc:Subject:Date:From;
 b=HJHA6x73Q0PaE0ks7Q164g7yICuAhw9Vp/TYuwelhKPJRvtN3Z9OpFsMZeskstJcr
 OXIbaM72iWJvbr7M6Ouxo25iNczVDws6jvMkr1PGsz75+syKBVBlRCSH4vboTsLqQ+
 4DMLhNtMnHZu1P3T7snsi9tgZNVtneXbnAFWfoYuxIZe/oFAcxPu5swKURdIJziJp9
 fRzfjJ2cuyZ1FfQ4nHqnk6I3x3a6sk6wwSkMR4II3QUVV4GlR6H6mZBjbjkmT/8N1y
 Ai12X6THA8Ysoh4fqM8bd4e72rkJDXMJBMQfRUchWh3hBmvi+0RSpBShLrXC+fq2dn
 yowAWahzMu2/g==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 23 Oct 2023 08:50:05 -0700
Message-ID: <20231023155005.2259554-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong <daehojeong@google.com> Detect and fix a
 corrupted xattr entry. Signed-off-by: Daeho Jeong <daehojeong@google.com>
 --- fsck/dump.c | 2 +- fsck/fsck.c | 40
 ++++++++++++++++++++++++++++++++++++++++
 fsck/fsck.h | 4 +++- fsck/mount.c | 2 +- fsck/xattr.c | 9 +++++---- [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1quxC1-0003CU-89
Subject: [f2fs-dev] [PATCH] f2fs-tools: fix corrupted xattr entry
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Detect and fix a corrupted xattr entry.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/dump.c  |  2 +-
 fsck/fsck.c  | 40 ++++++++++++++++++++++++++++++++++++++++
 fsck/fsck.h  |  4 +++-
 fsck/mount.c |  2 +-
 fsck/xattr.c |  9 +++++----
 5 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index ecadfdd9b988..864a3c3bb624 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -359,7 +359,7 @@ static void dump_xattr(struct f2fs_sb_info *sbi, struct f2fs_node *node_blk)
 	char xattr_name[F2FS_NAME_LEN] = {0};
 	int ret;
 
-	xattr = read_all_xattrs(sbi, node_blk);
+	xattr = read_all_xattrs(sbi, node_blk, true);
 	if (!xattr)
 		return;
 
diff --git a/fsck/fsck.c b/fsck/fsck.c
index 69417ca6081c..72daa719bc27 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -834,6 +834,43 @@ void fsck_reada_all_direct_node_blocks(struct f2fs_sb_info *sbi,
 	}
 }
 
+int chk_extended_attributes(struct f2fs_sb_info *sbi, u32 nid,
+		struct f2fs_node *inode)
+{
+	void *xattr;
+	void *last_base_addr;
+	struct f2fs_xattr_entry *ent;
+	__u32 xattr_size = XATTR_SIZE(&inode->i);
+
+	if (xattr_size == 0)
+		return 0;
+
+	xattr = read_all_xattrs(sbi, inode, false);
+	ASSERT(xattr);
+
+	last_base_addr = (void *)xattr + xattr_size;
+
+	list_for_each_xattr(ent, xattr) {
+		if ((void *)(ent) + sizeof(__u32) > last_base_addr ||
+			(void *)XATTR_NEXT_ENTRY(ent) > last_base_addr) {
+			ASSERT_MSG("[0x%x] last xattr entry (offset: %lx) "
+					"crosses the boundary",
+					nid, (long int)((void *)ent - xattr));
+			if (c.fix_on) {
+				memset(ent, 0,
+					(char *)last_base_addr - (char *)ent);
+				write_all_xattrs(sbi, inode, xattr_size, xattr);
+				FIX_MSG("[0x%x] nullify wrong xattr entries",
+						nid);
+				return 1;
+			}
+			break;
+		}
+	}
+
+	return 0;
+}
+
 /* start with valid nid and blkaddr */
 void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 		enum FILE_TYPE ftype, struct f2fs_node *node_blk,
@@ -1008,6 +1045,9 @@ check_next:
 		}
 	}
 
+	if (chk_extended_attributes(sbi, nid, node_blk))
+		need_fix = 1;
+
 	if ((node_blk->i.i_inline & F2FS_INLINE_DATA)) {
 		unsigned int inline_size = MAX_INLINE_DATA(node_blk);
 		if (cur_qtype != -1)
diff --git a/fsck/fsck.h b/fsck/fsck.h
index 091b5d863d34..c25f3819f980 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -330,6 +330,8 @@ struct hardlink_cache_entry *f2fs_search_hardlink(struct f2fs_sb_info *sbi,
 						struct dentry *de);
 
 /* xattr.c */
-void *read_all_xattrs(struct f2fs_sb_info *, struct f2fs_node *);
+void *read_all_xattrs(struct f2fs_sb_info *, struct f2fs_node *, bool);
+void write_all_xattrs(struct f2fs_sb_info *sbi,
+		struct f2fs_node *inode, __u32 hsize, void *txattr_addr);
 
 #endif /* _FSCK_H_ */
diff --git a/fsck/mount.c b/fsck/mount.c
index a1389ed61c24..3b02d73fee93 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -370,7 +370,7 @@ void print_inode_info(struct f2fs_sb_info *sbi,
 	DISP_u32(F2FS_INODE_NIDS(inode), i_nid[3]);	/* indirect */
 	DISP_u32(F2FS_INODE_NIDS(inode), i_nid[4]);	/* double indirect */
 
-	xattr_addr = read_all_xattrs(sbi, node);
+	xattr_addr = read_all_xattrs(sbi, node, true);
 	if (!xattr_addr)
 		goto out;
 
diff --git a/fsck/xattr.c b/fsck/xattr.c
index fe28437b81ea..9ccf3615229e 100644
--- a/fsck/xattr.c
+++ b/fsck/xattr.c
@@ -17,14 +17,15 @@
 #include "node.h"
 #include "xattr.h"
 
-void *read_all_xattrs(struct f2fs_sb_info *sbi, struct f2fs_node *inode)
+void *read_all_xattrs(struct f2fs_sb_info *sbi, struct f2fs_node *inode,
+			bool sanity_check)
 {
 	struct f2fs_xattr_header *header;
 	void *txattr_addr;
 	u64 inline_size = inline_xattr_size(&inode->i);
 	nid_t xnid = le32_to_cpu(inode->i.i_xattr_nid);
 
-	if (c.func == FSCK && xnid) {
+	if (c.func == FSCK && xnid && sanity_check) {
 		if (fsck_sanity_check_nid(sbi, xnid, F2FS_FT_XATTR, TYPE_XATTR))
 			return NULL;
 	}
@@ -78,7 +79,7 @@ static struct f2fs_xattr_entry *__find_xattr(void *base_addr,
 	return entry;
 }
 
-static void write_all_xattrs(struct f2fs_sb_info *sbi,
+void write_all_xattrs(struct f2fs_sb_info *sbi,
 		struct f2fs_node *inode, __u32 hsize, void *txattr_addr)
 {
 	void *xattr_addr;
@@ -165,7 +166,7 @@ int f2fs_setxattr(struct f2fs_sb_info *sbi, nid_t ino, int index, const char *na
 	ret = dev_read_block(inode, ni.blk_addr);
 	ASSERT(ret >= 0);
 
-	base_addr = read_all_xattrs(sbi, inode);
+	base_addr = read_all_xattrs(sbi, inode, true);
 	ASSERT(base_addr);
 
 	last_base_addr = (void *)base_addr + XATTR_SIZE(&inode->i);
-- 
2.42.0.655.g421f12c284-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
