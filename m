Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A82A76ECB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWX-0001Jx-VR;
	Mon, 31 Mar 2025 20:14:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVu-0000vl-Jq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rBimH4+XrYE/UpNaM4JFAJW07I/LS6/9YyR4raJsXlc=; b=GBFzDBU+SF9t/p8NMyDmwqkbY1
 IZgDbxvxPhrdHTduSmga5V+J54VbhWRznNsbqaugtYI1fHZMYnGnzEcruPhxcN5FExpyiXa8Gkol3
 jKo0zid9wX0r2CXmeEp91aKN/eTP90nmM6LjcbWaXkQVDUEkuiceJfZ6xfZSWivhC9os=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rBimH4+XrYE/UpNaM4JFAJW07I/LS6/9YyR4raJsXlc=; b=GAG6SwU3oa0qICmDvDOoMxH1Dh
 qLUCLkg3TuVwtvCLMc73L23zVpfr5JZdyOi+3fagJtJzwAjN6VpoaeWhn6/NXLYifZjQkhWLWYz7v
 oorx6vbxkMpAN7Bja7854mEKeBrH/8YHTkyPKROI3+ltHvX5jK9b/oNuWuQyA6jjqgb0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVp-0003iB-BN for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=rBimH4+XrYE/UpNaM4JFAJW07I/LS6/9YyR4raJsXlc=; b=enEs171Bfr8tWvPcj4W3mPDKsb
 NX1sA2ZGrGD6yk2oN6jJ7gPgIP9hvApUTkIyIViKMf6MmmvGHQfSFLGcwAUcxO+NV9kdPVjfvtpww
 G4P+JvgZaO4fMMHITIaEbbWGhP8PShojVLjD/TeOWsJ0Zd2AbmwWjjW3Khm5wBigf9hB9iFTKdE4I
 woNypu9PTaEBdGpE6Q9SQI/9yU8iGEXm4T4yAW83P7duChl3XAjwXums0tAARy6M+0ITzuLgpRIb9
 ngvp2xHwU/O1CoDyY5rvZJR/5/GcWKkOt3pQcBwPU0HI9yMwrbqTPOmLK0FkeCsETLMkMqQhO9J/X
 bhDv88FQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVd-00000004Scu-42I6;
 Mon, 31 Mar 2025 20:13:25 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:46 +0100
Message-ID: <20250331201256.1057782-147-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  All callers now have a folio, so pass it in. Remove two calls
 to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/dir.c | 4 ++-- fs/f2fs/f2fs.h | 2 +- fs/f2fs/inline.c | 2 +-
 fs/f2fs/inode.c | 16 ++++++++-------- fs/f2fs/node.c | 6 +++--- 5 [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVp-0003iB-BN
Subject: [f2fs-dev] [PATCH 146/153] f2fs: Pass a folio to f2fs_update_inode()
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

All callers now have a folio, so pass it in.  Remove two calls to
compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/dir.c    |  4 ++--
 fs/f2fs/f2fs.h   |  2 +-
 fs/f2fs/inline.c |  2 +-
 fs/f2fs/inode.c  | 16 ++++++++--------
 fs/f2fs/node.c   |  6 +++---
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 7e35192de2d9..bb9ff8556fb8 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -578,7 +578,7 @@ struct folio *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 
 put_error:
 	clear_nlink(inode);
-	f2fs_update_inode(inode, &folio->page);
+	f2fs_update_inode(inode, folio);
 	f2fs_folio_put(folio, true);
 	return ERR_PTR(err);
 }
@@ -737,7 +737,7 @@ int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
 
 		/* synchronize inode page's data from inode cache */
 		if (is_inode_flag_set(inode, FI_NEW_INODE))
-			f2fs_update_inode(inode, &folio->page);
+			f2fs_update_inode(inode, folio);
 
 		f2fs_folio_put(folio, true);
 	}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5d7d51c97bbf..a94e62c7d892 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3602,7 +3602,7 @@ void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page);
 struct inode *f2fs_iget(struct super_block *sb, unsigned long ino);
 struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino);
 int f2fs_try_to_free_nats(struct f2fs_sb_info *sbi, int nr_shrink);
-void f2fs_update_inode(struct inode *inode, struct page *node_page);
+void f2fs_update_inode(struct inode *inode, struct folio *node_folio);
 void f2fs_update_inode_page(struct inode *inode);
 int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc);
 void f2fs_evict_inode(struct inode *inode);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 3b65adb4d1b0..72bb2bed28f8 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -683,7 +683,7 @@ int f2fs_add_inline_entry(struct inode *dir, const struct f2fs_filename *fname,
 
 		/* synchronize inode page's data from inode cache */
 		if (is_inode_flag_set(inode, FI_NEW_INODE))
-			f2fs_update_inode(inode, &folio->page);
+			f2fs_update_inode(inode, folio);
 
 		f2fs_folio_put(folio, true);
 	}
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 0d45e3a249f8..201e3d2a9adf 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -651,18 +651,18 @@ struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino)
 	return inode;
 }
 
-void f2fs_update_inode(struct inode *inode, struct page *node_page)
+void f2fs_update_inode(struct inode *inode, struct folio *node_folio)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	struct f2fs_inode *ri;
 	struct extent_tree *et = fi->extent_tree[EX_READ];
 
-	f2fs_wait_on_page_writeback(node_page, NODE, true, true);
-	set_page_dirty(node_page);
+	f2fs_folio_wait_writeback(node_folio, NODE, true, true);
+	folio_mark_dirty(node_folio);
 
 	f2fs_inode_synced(inode);
 
-	ri = F2FS_INODE(node_page);
+	ri = F2FS_INODE(&node_folio->page);
 
 	ri->i_mode = cpu_to_le16(inode->i_mode);
 	ri->i_advise = fi->i_advise;
@@ -737,15 +737,15 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
 		}
 	}
 
-	__set_inode_rdev(inode, node_page);
+	__set_inode_rdev(inode, &node_folio->page);
 
 	/* deleted inode */
 	if (inode->i_nlink == 0)
-		clear_page_private_inline(node_page);
+		clear_page_private_inline(&node_folio->page);
 
 	init_idisk_time(inode);
 #ifdef CONFIG_F2FS_CHECK_FS
-	f2fs_inode_chksum_set(F2FS_I_SB(inode), node_page);
+	f2fs_inode_chksum_set(F2FS_I_SB(inode), &node_folio->page);
 #endif
 }
 
@@ -772,7 +772,7 @@ void f2fs_update_inode_page(struct inode *inode)
 		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_UPDATE_INODE);
 		return;
 	}
-	f2fs_update_inode(inode, &node_folio->page);
+	f2fs_update_inode(inode, node_folio);
 	f2fs_folio_put(node_folio, true);
 }
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index bf583cd2a589..152c664f94bf 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1872,7 +1872,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 				if (IS_INODE(&folio->page)) {
 					if (is_inode_flag_set(inode,
 								FI_DIRTY_INODE))
-						f2fs_update_inode(inode, &folio->page);
+						f2fs_update_inode(inode, folio);
 					set_dentry_mark(&folio->page,
 						f2fs_need_dentry_mark(sbi, ino));
 				}
@@ -1957,7 +1957,7 @@ static bool flush_dirty_inode(struct folio *folio)
 	if (!inode)
 		return false;
 
-	f2fs_update_inode(inode, &folio->page);
+	f2fs_update_inode(inode, folio);
 	folio_unlock(folio);
 
 	iput(inode);
@@ -2745,7 +2745,7 @@ int f2fs_recover_inline_xattr(struct inode *inode, struct folio *folio)
 	f2fs_folio_wait_writeback(ifolio, NODE, true, true);
 	memcpy(dst_addr, src_addr, inline_size);
 update_inode:
-	f2fs_update_inode(inode, &ifolio->page);
+	f2fs_update_inode(inode, ifolio);
 	f2fs_folio_put(ifolio, true);
 	return 0;
 }
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
