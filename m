Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7E0B58BFF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Sep 2025 04:47:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8u8S2xL+Irm7lqVEpye+vWHWaHzmCD+vSMFfbSPIA98=; b=IM+c8WKtKUerJpiAOfmM5DpZjT
	sMsKP22dlck6agAFAPpmKjWsnn8wylvBbArtJ0wFs8MFLEx/lJgkqaUBxzUKFhGVoOHtwe0VknYT4
	zeRI5GwE7RftZVbDOhIb/l9M7XM2qqVtAVGQQmz/VwRtnWw/+d6dXL78SknTxEZ3lSOA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uyLj5-0007KY-2G;
	Tue, 16 Sep 2025 02:47:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uyLj3-0007KR-NG
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Sep 2025 02:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g/5imLnzr/x5vVLqVEtqBfJSLB5Vo3J3tc17Ir0Bw4s=; b=Yb0sZiv9cC4IG035WrATvolxvR
 IOVOLe8YejPuPjL2ecfrPmRD7ZlU5F3uU9sLqrbn2/O21eGPO+gbASj4sLgO4COh5OALn0DEEL1H2
 xQNNQhH2oj6qTsXK1efX78HPz8jZj71A1hvJCMFIl0yiBtJEHHAzwhmKNt4TqDID2Llw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=g/5imLnzr/x5vVLqVEtqBfJSLB5Vo3J3tc17Ir0Bw4s=; b=S
 UOHYSBavqMa0osMN77EmIHC2SvozTVXm5RkQzvcynd+ex2JGkT4cS5WbTwQrxhs5ZHNMLqqwH9ICS
 w0c8qxUjEFvUKlrjVIVZ5BLv2UCt+2ogxkQvFmzNt3XO6jg7fcR3aNGfiTI2VzV1GIvBEz10S4KXx
 NhzRz2TFzJO26jCg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uyLj3-0002eU-3Z for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Sep 2025 02:47:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B27E34363B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Sep 2025 02:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99478C4CEF1;
 Tue, 16 Sep 2025 02:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757990834;
 bh=gLl5zCZ3KiCyWlZjwZLlDoiE8YMPXz91EbVzCyIiF7Q=;
 h=From:To:Cc:Subject:Date:From;
 b=eMgwSPYY+mY4FAx6rnD3KVwKpoHBO1RN6TxhlkhV15xlOorFiRW5yscomM69xL94+
 h3Gz6eJPt0sc7MyG1Md++zBIUWZvmZbBLevwCOMcKCr6Ga214A/jHtQdArUqzHykrY
 DMELkfKDPaeDNNxfPouRCdE8EcSCdqotsGqEWkrg+KGs8i0A/BHkDVKxJlI0qXXj/7
 t/SEimAg8C4e/c6G5E3Qr16W00oeQJKL+H4JKOaT2gIfwfelnReVX5I+Pe2X5Lw6da
 X8jYc5iqIpob83hhTGRF+XOzb2K1vdKIypPdV15QrtVfAB9oE8IdTzzCWAC9J0rj0I
 e039GgnEmPjgg==
To: jaegeuk@kernel.org
Date: Tue, 16 Sep 2025 10:47:09 +0800
Message-ID: <20250916024709.4062265-1-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: f2fs_zero_post_eof_page() may cuase more overhead due to
 invalidate_lock
 and page lookup, change as below to mitigate its overhead: - check new_size
 before grabbing invalidate_lock - lookup and invali [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uyLj3-0002eU-3Z
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to mitigate overhead of
 f2fs_zero_post_eof_page()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs_zero_post_eof_page() may cuase more overhead due to invalidate_lock
and page lookup, change as below to mitigate its overhead:
- check new_size before grabbing invalidate_lock
- lookup and invalidate pages only in range of [old_size, new_size]

Fixes: ba8dac350faf ("f2fs: fix to zero post-eof page")
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- check page number in mapping
 fs/f2fs/file.c | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 1aae4361d0a8..ffa045b39c01 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -35,15 +35,23 @@
 #include <trace/events/f2fs.h>
 #include <uapi/linux/f2fs.h>
 
-static void f2fs_zero_post_eof_page(struct inode *inode, loff_t new_size)
+static void f2fs_zero_post_eof_page(struct inode *inode,
+					loff_t new_size, bool lock)
 {
 	loff_t old_size = i_size_read(inode);
 
 	if (old_size >= new_size)
 		return;
 
+	if (mapping_empty(inode->i_mapping))
+		return;
+
+	if (lock)
+		filemap_invalidate_lock(inode->i_mapping);
 	/* zero or drop pages only in range of [old_size, new_size] */
-	truncate_pagecache(inode, old_size);
+	truncate_inode_pages_range(inode->i_mapping, old_size, new_size);
+	if (lock)
+		filemap_invalidate_unlock(inode->i_mapping);
 }
 
 static vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
@@ -114,9 +122,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 
 	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
 
-	filemap_invalidate_lock(inode->i_mapping);
-	f2fs_zero_post_eof_page(inode, (folio->index + 1) << PAGE_SHIFT);
-	filemap_invalidate_unlock(inode->i_mapping);
+	f2fs_zero_post_eof_page(inode, (folio->index + 1) << PAGE_SHIFT, true);
 
 	file_update_time(vmf->vma->vm_file);
 	filemap_invalidate_lock_shared(inode->i_mapping);
@@ -1149,7 +1155,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 		filemap_invalidate_lock(inode->i_mapping);
 
 		if (attr->ia_size > old_size)
-			f2fs_zero_post_eof_page(inode, attr->ia_size);
+			f2fs_zero_post_eof_page(inode, attr->ia_size, false);
 		truncate_setsize(inode, attr->ia_size);
 
 		if (attr->ia_size <= old_size)
@@ -1268,9 +1274,7 @@ static int f2fs_punch_hole(struct inode *inode, loff_t offset, loff_t len)
 	if (ret)
 		return ret;
 
-	filemap_invalidate_lock(inode->i_mapping);
-	f2fs_zero_post_eof_page(inode, offset + len);
-	filemap_invalidate_unlock(inode->i_mapping);
+	f2fs_zero_post_eof_page(inode, offset + len, true);
 
 	pg_start = ((unsigned long long) offset) >> PAGE_SHIFT;
 	pg_end = ((unsigned long long) offset + len) >> PAGE_SHIFT;
@@ -1555,7 +1559,7 @@ static int f2fs_do_collapse(struct inode *inode, loff_t offset, loff_t len)
 	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	filemap_invalidate_lock(inode->i_mapping);
 
-	f2fs_zero_post_eof_page(inode, offset + len);
+	f2fs_zero_post_eof_page(inode, offset + len, false);
 
 	f2fs_lock_op(sbi);
 	f2fs_drop_extent_tree(inode);
@@ -1678,9 +1682,7 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 	if (ret)
 		return ret;
 
-	filemap_invalidate_lock(mapping);
-	f2fs_zero_post_eof_page(inode, offset + len);
-	filemap_invalidate_unlock(mapping);
+	f2fs_zero_post_eof_page(inode, offset + len, true);
 
 	pg_start = ((unsigned long long) offset) >> PAGE_SHIFT;
 	pg_end = ((unsigned long long) offset + len) >> PAGE_SHIFT;
@@ -1814,7 +1816,7 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	filemap_invalidate_lock(mapping);
 
-	f2fs_zero_post_eof_page(inode, offset + len);
+	f2fs_zero_post_eof_page(inode, offset + len, false);
 	truncate_pagecache(inode, offset);
 
 	while (!ret && idx > pg_start) {
@@ -1872,9 +1874,7 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 	if (err)
 		return err;
 
-	filemap_invalidate_lock(inode->i_mapping);
-	f2fs_zero_post_eof_page(inode, offset + len);
-	filemap_invalidate_unlock(inode->i_mapping);
+	f2fs_zero_post_eof_page(inode, offset + len, true);
 
 	f2fs_balance_fs(sbi, true);
 
@@ -4922,9 +4922,8 @@ static ssize_t f2fs_write_checks(struct kiocb *iocb, struct iov_iter *from)
 	if (err)
 		return err;
 
-	filemap_invalidate_lock(inode->i_mapping);
-	f2fs_zero_post_eof_page(inode, iocb->ki_pos + iov_iter_count(from));
-	filemap_invalidate_unlock(inode->i_mapping);
+	f2fs_zero_post_eof_page(inode,
+		iocb->ki_pos + iov_iter_count(from), true);
 	return count;
 }
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
