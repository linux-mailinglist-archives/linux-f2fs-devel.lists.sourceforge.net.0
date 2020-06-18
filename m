Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F7C1FEB83
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 08:37:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jloAT-0002GG-TF; Thu, 18 Jun 2020 06:36:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jloAR-0002G1-Gn
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 06:36:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Dl8N+tb63STIq0R//sfoPwX/qpQ3sXir2LwLFGxeY8=; b=Ad1XLZaobZWFcwbeIBNzLev5wF
 ssWnaA1OpULlMolOSFy2ATs6UqA/R0rS/OapDh63XhEOdSVwK6hFQVMPN2HuypsPld9PjWLjJENxO
 CFWLhMaBWx/RiZIrAdlk5uTy2fgAQQeQjCz7oalB6bhYqWveFUynFHjmj/ZnUNJnhDE4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9Dl8N+tb63STIq0R//sfoPwX/qpQ3sXir2LwLFGxeY8=; b=E
 7mfIEqRHHJtgl/5cnTXRX5CLFwJn4vKr5BPRKHmwZdOBykGTnZqG2NNt6OJdW/GUQANRXW+z/Zj5c
 BpyZXqd+hVnS9ViObQi2s8b/F+3ZS1sux6t4Qb8NEFbfINT1Q9Hn5bQJY3SXHFKoRfN3DUb13HFHK
 9gJgNBOJM/vZ3l4g=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jloAN-007xlM-C8
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 06:36:55 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 798B494F5464E55442C0;
 Thu, 18 Jun 2020 14:36:40 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Thu, 18 Jun 2020 14:36:30 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 18 Jun 2020 14:36:21 +0800
Message-ID: <20200618063625.110273-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jloAN-007xlM-C8
Subject: [f2fs-dev] [PATCH 1/5] f2fs: fix to wait page writeback before
 update
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

to make page content stable for special device like raid.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/dir.c          |  2 ++
 fs/f2fs/extent_cache.c | 18 +++++++++---------
 fs/f2fs/f2fs.h         |  2 +-
 fs/f2fs/file.c         |  1 +
 fs/f2fs/inline.c       |  2 ++
 fs/f2fs/inode.c        |  3 +--
 6 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index d35976785e8c..91e86747a604 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -495,6 +495,8 @@ static int make_empty_dir(struct inode *inode,
 	if (IS_ERR(dentry_page))
 		return PTR_ERR(dentry_page);
 
+	f2fs_bug_on(F2FS_I_SB(inode), PageWriteback(dentry_page));
+
 	dentry_blk = page_address(dentry_page);
 
 	make_dentry_ptr_block(NULL, &d, dentry_blk);
diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index e60078460ad1..686c68b98610 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -325,9 +325,10 @@ static void __drop_largest_extent(struct extent_tree *et,
 }
 
 /* return true, if inode page is changed */
-static bool __f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_ext)
+static void __f2fs_init_extent_tree(struct inode *inode, struct page *ipage)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_extent *i_ext = ipage ? &F2FS_INODE(ipage)->i_ext : NULL;
 	struct extent_tree *et;
 	struct extent_node *en;
 	struct extent_info ei;
@@ -335,16 +336,18 @@ static bool __f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_e
 	if (!f2fs_may_extent_tree(inode)) {
 		/* drop largest extent */
 		if (i_ext && i_ext->len) {
+			f2fs_wait_on_page_writeback(ipage, NODE, true, true);
 			i_ext->len = 0;
-			return true;
+			set_page_dirty(ipage);
+			return;
 		}
-		return false;
+		return;
 	}
 
 	et = __grab_extent_tree(inode);
 
 	if (!i_ext || !i_ext->len)
-		return false;
+		return;
 
 	get_extent_info(&ei, i_ext);
 
@@ -360,17 +363,14 @@ static bool __f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_e
 	}
 out:
 	write_unlock(&et->lock);
-	return false;
 }
 
-bool f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_ext)
+void f2fs_init_extent_tree(struct inode *inode, struct page *ipage)
 {
-	bool ret =  __f2fs_init_extent_tree(inode, i_ext);
+	__f2fs_init_extent_tree(inode, ipage);
 
 	if (!F2FS_I(inode)->extent_tree)
 		set_inode_flag(inode, FI_NO_EXTENT);
-
-	return ret;
 }
 
 static bool f2fs_lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b35a50f4953c..326c12fa0da5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3795,7 +3795,7 @@ struct rb_entry *f2fs_lookup_rb_tree_ret(struct rb_root_cached *root,
 bool f2fs_check_rb_tree_consistence(struct f2fs_sb_info *sbi,
 						struct rb_root_cached *root);
 unsigned int f2fs_shrink_extent_tree(struct f2fs_sb_info *sbi, int nr_shrink);
-bool f2fs_init_extent_tree(struct inode *inode, struct f2fs_extent *i_ext);
+void f2fs_init_extent_tree(struct inode *inode, struct page *ipage);
 void f2fs_drop_extent_tree(struct inode *inode);
 unsigned int f2fs_destroy_extent_node(struct inode *inode);
 void f2fs_destroy_extent_tree(struct inode *inode);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3268f8dd59bb..1862073b96d2 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1250,6 +1250,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 				f2fs_put_page(psrc, 1);
 				return PTR_ERR(pdst);
 			}
+			f2fs_wait_on_page_writeback(pdst, DATA, true, true);
 			f2fs_copy_page(psrc, pdst);
 			set_page_dirty(pdst);
 			f2fs_put_page(pdst, 1);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index dbade310dc79..4bcbc486c9e2 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -340,6 +340,8 @@ int f2fs_make_empty_inline_dir(struct inode *inode, struct inode *parent,
 	struct f2fs_dentry_ptr d;
 	void *inline_dentry;
 
+	f2fs_wait_on_page_writeback(ipage, NODE, true, true);
+
 	inline_dentry = inline_data_addr(inode, ipage);
 
 	make_dentry_ptr_inline(inode, &d, inline_dentry);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 44582a4db513..7c156eb26dd7 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -367,8 +367,7 @@ static int do_read_inode(struct inode *inode)
 	fi->i_pino = le32_to_cpu(ri->i_pino);
 	fi->i_dir_level = ri->i_dir_level;
 
-	if (f2fs_init_extent_tree(inode, &ri->i_ext))
-		set_page_dirty(node_page);
+	f2fs_init_extent_tree(inode, node_page);
 
 	get_inline_info(inode, ri);
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
