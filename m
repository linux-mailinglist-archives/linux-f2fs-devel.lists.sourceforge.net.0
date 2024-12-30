Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 144E99FE656
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Dec 2024 14:23:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tSFkE-0000mA-9T;
	Mon, 30 Dec 2024 13:23:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1tSFk8-0000m0-Qi
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Dec 2024 13:23:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FqrS2QLScSV5nwDi79TaVTxvXWY2OW2FjHzWJcY12F4=; b=kriRwWzzevXZGxUprJHyAi26hd
 mmizwmRZh/JBXGpu25XqMeqctmQG14RNzYBpenVnELegJJ+kFWr7rEFUU/Ys8i7uKwGeZWxDwhfAv
 RH+tL33rh84URdLXPfUQnQ8H9TOk5uAZHkgclaO93MGHwdLLqRgcU5YzVcnpElKtOAxU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FqrS2QLScSV5nwDi79TaVTxvXWY2OW2FjHzWJcY12F4=; b=K
 100WMpovdNjm8ChDcjDyThpR4GJaS9ACIkoNZrx3aLIbPvQ5OKi54H5sJi246+KmWvQxuFPdOy1HI
 ArmhWB4ZDG9oCfhr965Tbx8NMk+VgKCV+YKBtNLk1tC+Qns5Sb26RFyzXJ/rzOboHvG1xxQpJ6tRy
 f7P8DUiGlVoS1+No=;
Received: from mta22.hihonor.com ([81.70.192.198])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tSFk7-0000ev-EF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Dec 2024 13:23:36 +0000
Received: from w002.hihonor.com (unknown [10.68.28.120])
 by mta22.hihonor.com (SkyGuard) with ESMTPS id 4YMGy56mzRzYlG1p;
 Mon, 30 Dec 2024 21:23:25 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 30 Dec
 2024 21:23:27 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 30 Dec
 2024 21:23:27 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>, <shengyong@oppo.com>
Date: Mon, 30 Dec 2024 21:23:25 +0800
Message-ID: <20241230132325.2891011-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w010.hihonor.com (10.68.28.113) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently when we check xattr of inode which dosen't have
 xnid,
 we make unnecessary memory alloc and copy. Followed by ShengYong's
 suggestion[1], 
 change the behaviors of read_all_xattrs and write_all_ [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [81.70.192.198 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [81.70.192.198 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1tSFk7-0000ev-EF
Subject: [f2fs-dev] [PATCH v3] f2fs-tools: reduce memory alloc and copy for
 xattr
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
Cc: wangzijie <wangzijie1@honor.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Currently when we check xattr of inode which dosen't have xnid, we make unnecessary
memory alloc and copy. Followed by ShengYong's suggestion[1], change the behaviors of
read_all_xattrs and write_all_xattrs, and add a new function free_xattrs.

* read_all_xattrs: If xnid dosen't exist and there's no possibility to change xattr(which
   may enlarge xattr's size and leads to alloc new xnid) in next steps, return inline_xattr
   directly without alloc and memcpy.
* write_all_xattrs checks whether inline_xattr and new txattr_addr have the same address
   to avoid copying back.
* free_xattrs checks whether inline_xattr and new txattr_addr have the same address to
   free xattr buffer properly.

After that, instances(except setxattr) where {read|write}_all_xattrs are called can avoid unnecessary
memory alloc and copy.

Use free_xattrs(xattrs) instead of free(xattrs) to free buffer properly.

[1] https://lore.kernel.org/linux-f2fs-devel/502ae396-ae82-44d6-b08d-617e9e9c4092@oppo.com/

Signed-off-by: wangzijie <wangzijie1@honor.com>
---
v2 -> v3:
 - fix read_all_xattrs logic to check and set xattr header
 - change parameter name for read_all_xattrs
 - change subject
v1 -> v2:
 - Suggestions from ShengYong to change {read|write}_all_xattrs and add free_xattrs
 - If we may need change xattr, still alloc xattr buffer in read_all_xattrs
---
---
 fsck/dump.c  |  4 ++--
 fsck/fsck.c  |  6 +++---
 fsck/fsck.h  |  3 ++-
 fsck/mount.c |  4 ++--
 fsck/xattr.c | 25 +++++++++++++++++++++----
 5 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index dc3c199..cc89909 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -399,7 +399,7 @@ static void dump_xattr(struct f2fs_sb_info *sbi, struct f2fs_node *node_blk, int
 	char xattr_name[F2FS_NAME_LEN] = {0};
 	int ret;
 
-	xattr = read_all_xattrs(sbi, node_blk, true);
+	xattr = read_all_xattrs(sbi, node_blk, true, false);
 	if (!xattr)
 		return;
 
@@ -478,7 +478,7 @@ static void dump_xattr(struct f2fs_sb_info *sbi, struct f2fs_node *node_blk, int
 		free(name);
 	}
 
-	free(xattr);
+	free_xattrs(node_blk, xattr);
 }
 #else
 static void dump_xattr(struct f2fs_sb_info *UNUSED(sbi),
diff --git a/fsck/fsck.c b/fsck/fsck.c
index aa3fb97..982defb 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -844,7 +844,7 @@ int chk_extended_attributes(struct f2fs_sb_info *sbi, u32 nid,
 	if (xattr_size == 0)
 		return 0;
 
-	xattr = read_all_xattrs(sbi, inode, false);
+	xattr = read_all_xattrs(sbi, inode, false, false);
 	ASSERT(xattr);
 
 	last_base_addr = (void *)xattr + xattr_size;
@@ -869,10 +869,10 @@ int chk_extended_attributes(struct f2fs_sb_info *sbi, u32 nid,
 		memset(ent, 0, (u8 *)last_base_addr - (u8 *)ent);
 		write_all_xattrs(sbi, inode, xattr_size, xattr);
 		FIX_MSG("[0x%x] nullify wrong xattr entries", nid);
-		free(xattr);
+		free_xattrs(inode, xattr);
 		return 1;
 	}
-	free(xattr);
+	free_xattrs(inode, xattr);
 	return 0;
 }
 
diff --git a/fsck/fsck.h b/fsck/fsck.h
index b581d3e..2897a5e 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -341,9 +341,10 @@ struct hardlink_cache_entry *f2fs_search_hardlink(struct f2fs_sb_info *sbi,
 						struct dentry *de);
 
 /* xattr.c */
-void *read_all_xattrs(struct f2fs_sb_info *, struct f2fs_node *, bool);
+void *read_all_xattrs(struct f2fs_sb_info *, struct f2fs_node *, bool, bool);
 void write_all_xattrs(struct f2fs_sb_info *sbi,
 		struct f2fs_node *inode, __u32 hsize, void *txattr_addr);
+void free_xattrs(struct f2fs_node *inode, void *txattr_addr);
 
 /* dir.c */
 int convert_inline_dentry(struct f2fs_sb_info *sbi, struct f2fs_node *node,
diff --git a/fsck/mount.c b/fsck/mount.c
index a189ba7..f6085e9 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -370,7 +370,7 @@ void print_inode_info(struct f2fs_sb_info *sbi,
 	DISP_u32(F2FS_INODE_NIDS(inode), i_nid[3]);	/* indirect */
 	DISP_u32(F2FS_INODE_NIDS(inode), i_nid[4]);	/* double indirect */
 
-	xattr_addr = read_all_xattrs(sbi, node, true);
+	xattr_addr = read_all_xattrs(sbi, node, true, false);
 	if (!xattr_addr)
 		goto out;
 
@@ -384,7 +384,7 @@ void print_inode_info(struct f2fs_sb_info *sbi,
 		}
 		print_xattr_entry(ent);
 	}
-	free(xattr_addr);
+	free_xattrs(node, xattr_addr);
 
 out:
 	printf("\n");
diff --git a/fsck/xattr.c b/fsck/xattr.c
index 6373c06..413cf73 100644
--- a/fsck/xattr.c
+++ b/fsck/xattr.c
@@ -18,7 +18,7 @@
 #include "xattr.h"
 
 void *read_all_xattrs(struct f2fs_sb_info *sbi, struct f2fs_node *inode,
-			bool sanity_check)
+			bool sanity_check, bool for_change)
 {
 	struct f2fs_xattr_header *header;
 	void *txattr_addr;
@@ -30,6 +30,11 @@ void *read_all_xattrs(struct f2fs_sb_info *sbi, struct f2fs_node *inode,
 			return NULL;
 	}
 
+	if (!xnid && !for_change) {
+		txattr_addr = inline_xattr_addr(&inode->i);
+		goto check_header;
+	}
+
 	txattr_addr = calloc(inline_size + F2FS_BLKSIZE, 1);
 	ASSERT(txattr_addr);
 
@@ -49,6 +54,7 @@ void *read_all_xattrs(struct f2fs_sb_info *sbi, struct f2fs_node *inode,
 				sizeof(struct node_footer));
 	}
 
+check_header:
 	header = XATTR_HDR(txattr_addr);
 
 	/* Never been allocated xattrs */
@@ -97,7 +103,8 @@ void write_all_xattrs(struct f2fs_sb_info *sbi,
 	bool xattrblk_alloced = false;
 	struct seg_entry *se;
 
-	memcpy(inline_xattr_addr(&inode->i), txattr_addr, inline_size);
+	if (inline_xattr_addr(&inode->i) != txattr_addr)
+		memcpy(inline_xattr_addr(&inode->i), txattr_addr, inline_size);
 
 	if (hsize <= inline_size)
 		return;
@@ -137,6 +144,16 @@ free_xattr_node:
 	ASSERT(ret >= 0);
 }
 
+/*
+ * Different addresses between inline_xattr and txattr_addr means
+ * we newly allocate xattr buffer in read_all_xattrs, free it
+ */
+void free_xattrs(struct f2fs_node *inode, void *txattr_addr)
+{
+	if (inline_xattr_addr(&inode->i) != txattr_addr)
+		free(txattr_addr);
+}
+
 int f2fs_setxattr(struct f2fs_sb_info *sbi, nid_t ino, int index, const char *name,
 		const void *value, size_t size, int flags)
 {
@@ -174,7 +191,7 @@ int f2fs_setxattr(struct f2fs_sb_info *sbi, nid_t ino, int index, const char *na
 	ret = dev_read_block(inode, ni.blk_addr);
 	ASSERT(ret >= 0);
 
-	base_addr = read_all_xattrs(sbi, inode, true);
+	base_addr = read_all_xattrs(sbi, inode, true, true);
 	ASSERT(base_addr);
 
 	last_base_addr = (void *)base_addr + XATTR_SIZE(&inode->i);
@@ -257,8 +274,8 @@ int f2fs_setxattr(struct f2fs_sb_info *sbi, nid_t ino, int index, const char *na
 	/* inode need update */
 	ASSERT(update_inode(sbi, inode, &ni.blk_addr) >= 0);
 exit:
+	free_xattrs(inode, base_addr);
 	free(inode);
-	free(base_addr);
 	return error;
 }
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
