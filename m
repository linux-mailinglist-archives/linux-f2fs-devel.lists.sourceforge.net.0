Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C9A4EFD1D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 Apr 2022 01:36:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1naQh1-0007C3-5T; Fri, 01 Apr 2022 23:36:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daeho43@gmail.com>) id 1naQgs-0007Br-Ar
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Apr 2022 23:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5KBsugBvk/kUjo1setQPCr3shVksyCHMmkAEk0uV2tc=; b=HN3jAqerzO9FJeI5CaszcavYQU
 MW3+61Pnv0uGm4wKPTxoxNURgsuHZ4ulV96jdaKTLPLMv6JkM2c+PmLIhKw4QYXGyt+738GRAHj8F
 hP3w7rudIMWLCGoXCSwjNJ4pdN03qW6xFnzfUs3RvahtJ+kn2CcWhbRKAxXOJsrWEKpM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5KBsugBvk/kUjo1setQPCr3shVksyCHMmkAEk0uV2tc=; b=M
 AW+1vBTEZUiYOneQgWIb+YAA7NxcAoqvnXxQfpCfk2sCCm4KAOTn2pDT/gk4UEIMSmhlc1KKkN1iy
 8eO/RDQiLvz8u9gBWxGnHxFNKugENsEy4Ll0AwcayzLnQm+gIh3lEHrywHjeDC0eqtZUBKH1/D+h2
 ePXnrndKw/ZUqQGw=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1naQoj-002MVH-2h
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Apr 2022 23:36:37 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 mp11-20020a17090b190b00b001c79aa8fac4so6056817pjb.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 01 Apr 2022 16:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5KBsugBvk/kUjo1setQPCr3shVksyCHMmkAEk0uV2tc=;
 b=l92SFgc5vDkBAaRecamPwmUyXMLcP/+I3CVDgHQSLuYCDmStZPaphMxmdrLYuPQqxL
 fPEolD+sa0SCosLgHYG7VCwDjtTQKAxXm3qTEoLxpLJaEonutvnzRclgcZ01rxR91lXG
 x3TS9tCXI064Fla6Ry0BL6bM+qmxkpoxgdUZWTrRydqeUkaXvCcNljwweIhnbsNo3yue
 Jx/5tjuFXhBZ91yARtfV2op10iYDWByYqrFIJmBTWfpYpq2ZIpbZJm4OvHAGQ2jmAKjI
 XsBfzwwRxayBytbsBVmWZ1koI7MJ9DvUBBprSNMvU9R6w8bf0xXqzRmO3q/geJcPCHhP
 zHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5KBsugBvk/kUjo1setQPCr3shVksyCHMmkAEk0uV2tc=;
 b=mjehJjvFdcJXjgyCdqtgLNQMxQYvIigOuBh2t5cnYZtgTiVAPVLsqqMajzcZ0W7bNg
 I+O+IEuMAdzW25qxLifG1m3Fz//J7z8C5t8fonhoOzI5laUeBEZDSPVff09j7v36zy94
 44wEqP+nsv/yK+67EuYvPU0nLHDjnShbugFWuBNC6h6CTu3xTU/mVoXktaCnlPb6b2Pm
 mmerobyOUNeUJHENu9vdFkxt2cyXMqWCIbBHIGUYFzjbyjZpzQq8AB2nwR3GBznHlJa0
 G3zqJl4lRyHPVYVous0/aANfOIha/KzDlBLDrcOyIcZ0/yUl/yXtG3AqdZ0TUVICIdH8
 lLDg==
X-Gm-Message-State: AOAM531G3Xu9XGdgp6dJTo/zh+Kh6HKiiXADF2DacFFBO+HMsVfTWm84
 NY2bj9NyugtSX+HLeMmlwzU=
X-Google-Smtp-Source: ABdhPJxuPsPUuX+56ltL7dJylDJ7HaOjuEHGvp9QBkAYwPu/Bn1ENfy9z8vPQ3SOJSDL7nXs0m8CkA==
X-Received: by 2002:a17:903:1212:b0:156:3ddc:84bd with SMTP id
 l18-20020a170903121200b001563ddc84bdmr12265826plh.70.1648856187049; 
 Fri, 01 Apr 2022 16:36:27 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:2af8:7bf6:5de0:7b61])
 by smtp.gmail.com with ESMTPSA id
 f30-20020a63755e000000b00381f6b7ef30sm3266352pgn.54.2022.04.01.16.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 16:36:26 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  1 Apr 2022 16:36:22 -0700
Message-Id: <20220401233622.838797-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Current atomic write has three major issues
 like below. - keeps the updates in non-reclaimable memory space and they
 are even hard to be migrated,
 which is not good for contiguous memory allocation. - [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.45 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1naQoj-002MVH-2h
Subject: [f2fs-dev] [PATCH] f2fs: change the current atomic write way
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

Current atomic write has three major issues like below.
 - keeps the updates in non-reclaimable memory space and they are even
   hard to be migrated, which is not good for contiguous memory
   allocation.
 - disk spaces used for atomic files cannot be garbage collected, so
   this makes it difficult for the filesystem to be defragmented.
 - If atomic write operations hit the threshold of either memory usage
   or garbage collection failure count, All the atomic write operations
   will fail immediately.

To resolve the issues, I will keep a COW inode internally for all the
updates to be flushed from memory, when we need to flush them out in a
situation like high memory pressure. These COW inodes will be tagged
as orphan inodes to be reclaimed in case of sudden power-cut or system
failure during atomic writes.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/data.c    | 176 ++++++++++++++--------
 fs/f2fs/debug.c   |  12 +-
 fs/f2fs/f2fs.h    |  27 +---
 fs/f2fs/file.c    |  48 +++---
 fs/f2fs/gc.c      |  27 +---
 fs/f2fs/inode.c   |   3 +-
 fs/f2fs/namei.c   |  28 ++--
 fs/f2fs/node.c    |   4 -
 fs/f2fs/node.h    |   1 -
 fs/f2fs/segment.c | 374 ++++++++++++++++------------------------------
 fs/f2fs/segment.h |   4 +-
 fs/f2fs/super.c   |   6 +-
 12 files changed, 298 insertions(+), 412 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 67d031589a7b..f45eea2fd96f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -69,8 +69,7 @@ static bool __is_cp_guaranteed(struct page *page)
 
 	if (f2fs_is_compressed_page(page))
 		return false;
-	if ((S_ISREG(inode->i_mode) &&
-			(f2fs_is_atomic_file(inode) || IS_NOQUOTA(inode))) ||
+	if ((S_ISREG(inode->i_mode) && IS_NOQUOTA(inode)) ||
 			page_private_gcing(page))
 		return true;
 	return false;
@@ -2556,7 +2555,12 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	bool ipu_force = false;
 	int err = 0;
 
-	set_new_dnode(&dn, inode, NULL, NULL, 0);
+	/* Use COW inode to make dnode_of_data for atomic write */
+	if (f2fs_is_atomic_file(inode))
+		set_new_dnode(&dn, F2FS_I(inode)->cow_inode, NULL, NULL, 0);
+	else
+		set_new_dnode(&dn, inode, NULL, NULL, 0);
+
 	if (need_inplace_update(fio) &&
 			f2fs_lookup_extent_cache(inode, page->index, &ei)) {
 		fio->old_blkaddr = ei.blk + page->index - ei.fofs;
@@ -2593,6 +2597,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		err = -EFSCORRUPTED;
 		goto out_writepage;
 	}
+
 	/*
 	 * If current allocation needs SSR,
 	 * it had better in-place writes for updated data.
@@ -3307,6 +3312,100 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 	return err;
 }
 
+static int __find_data_block(struct inode *inode, pgoff_t index,
+				block_t *blk_addr)
+{
+	struct dnode_of_data dn;
+	struct page *ipage;
+	struct extent_info ei = {0, };
+	int err = 0;
+
+	ipage = f2fs_get_node_page(F2FS_I_SB(inode), inode->i_ino);
+	if (IS_ERR(ipage))
+		return PTR_ERR(ipage);
+
+	set_new_dnode(&dn, inode, ipage, ipage, 0);
+
+	if (f2fs_lookup_extent_cache(inode, index, &ei)) {
+		dn.data_blkaddr = ei.blk + index - ei.fofs;
+	} else {
+		/* hole case */
+		err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
+		if (err) {
+			dn.data_blkaddr = NULL_ADDR;
+			err = 0;
+		}
+	}
+	*blk_addr = dn.data_blkaddr;
+	f2fs_put_dnode(&dn);
+	return err;
+}
+
+static int __reserve_data_block(struct inode *inode, pgoff_t index,
+				block_t *blk_addr, bool *node_changed)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct dnode_of_data dn;
+	struct page *ipage;
+	int err = 0;
+
+	f2fs_do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, true);
+
+	ipage = f2fs_get_node_page(sbi, inode->i_ino);
+	if (IS_ERR(ipage)) {
+		err = PTR_ERR(ipage);
+		goto unlock_out;
+	}
+	set_new_dnode(&dn, inode, ipage, ipage, 0);
+
+	err = f2fs_get_block(&dn, index);
+
+	*blk_addr = dn.data_blkaddr;
+	*node_changed = dn.node_changed;
+	f2fs_put_dnode(&dn);
+
+unlock_out:
+	f2fs_do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, false);
+	return err;
+}
+
+static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
+			struct page *page, loff_t pos, unsigned int len,
+			block_t *blk_addr, bool *node_changed)
+{
+	struct inode *inode = page->mapping->host;
+	struct inode *cow_inode = F2FS_I(inode)->cow_inode;
+	pgoff_t index = page->index;
+	int err = 0;
+	block_t ori_blk_addr;
+
+	/* If pos is beyond the end of file, reserve a new block in COW inode */
+	if ((pos & PAGE_MASK) >= i_size_read(inode))
+		return __reserve_data_block(cow_inode, index, blk_addr,
+					node_changed);
+
+	/* Look for the block in COW inode first */
+	err = __find_data_block(cow_inode, index, blk_addr);
+	if (err)
+		return err;
+	else if (*blk_addr != NULL_ADDR)
+		return 0;
+
+	/* Look for the block in the original inode */
+	err = __find_data_block(inode, index, &ori_blk_addr);
+	if (err)
+		return err;
+
+	/* Finally, we should reserve a new block in COW inode for the update */
+	err = __reserve_data_block(cow_inode, index, blk_addr, node_changed);
+	if (err)
+		return err;
+
+	if (ori_blk_addr != NULL_ADDR)
+		*blk_addr = ori_blk_addr;
+	return 0;
+}
+
 static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 		loff_t pos, unsigned len, unsigned flags,
 		struct page **pagep, void **fsdata)
@@ -3315,7 +3414,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct page *page = NULL;
 	pgoff_t index = ((unsigned long long) pos) >> PAGE_SHIFT;
-	bool need_balance = false, drop_atomic = false;
+	bool need_balance = false;
 	block_t blkaddr = NULL_ADDR;
 	int err = 0;
 
@@ -3326,14 +3425,6 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 		goto fail;
 	}
 
-	if ((f2fs_is_atomic_file(inode) &&
-			!f2fs_available_free_memory(sbi, INMEM_PAGES)) ||
-			is_inode_flag_set(inode, FI_ATOMIC_REVOKE_REQUEST)) {
-		err = -ENOMEM;
-		drop_atomic = true;
-		goto fail;
-	}
-
 	/*
 	 * We should check this at this moment to avoid deadlock on inode page
 	 * and #0 page. The locking rule for inline_data conversion should be:
@@ -3381,7 +3472,11 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 
 	*pagep = page;
 
-	err = prepare_write_begin(sbi, page, pos, len,
+	if (f2fs_is_atomic_file(inode))
+		err = prepare_atomic_write_begin(sbi, page, pos, len,
+					&blkaddr, &need_balance);
+	else
+		err = prepare_write_begin(sbi, page, pos, len,
 					&blkaddr, &need_balance);
 	if (err)
 		goto fail;
@@ -3437,8 +3532,6 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 fail:
 	f2fs_put_page(page, 1);
 	f2fs_write_failed(inode, pos + len);
-	if (drop_atomic)
-		f2fs_drop_inmem_pages_all(sbi, false);
 	return err;
 }
 
@@ -3482,8 +3575,12 @@ static int f2fs_write_end(struct file *file,
 	set_page_dirty(page);
 
 	if (pos + copied > i_size_read(inode) &&
-	    !f2fs_verity_in_progress(inode))
+	    !f2fs_verity_in_progress(inode)) {
 		f2fs_i_size_write(inode, pos + copied);
+		if (f2fs_is_atomic_file(inode))
+			f2fs_i_size_write(F2FS_I(inode)->cow_inode,
+					pos + copied);
+	}
 unlock_out:
 	f2fs_put_page(page, 1);
 	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
@@ -3517,9 +3614,6 @@ void f2fs_invalidate_page(struct page *page, unsigned int offset,
 			inode->i_ino == F2FS_COMPRESS_INO(sbi))
 		clear_page_private_data(page);
 
-	if (page_private_atomic(page))
-		return f2fs_drop_inmem_page(inode, page);
-
 	detach_page_private(page);
 	set_page_private(page, 0);
 }
@@ -3559,18 +3653,6 @@ static int f2fs_set_data_page_dirty(struct page *page)
 	if (PageSwapCache(page))
 		return __set_page_dirty_nobuffers(page);
 
-	if (f2fs_is_atomic_file(inode) && !f2fs_is_commit_atomic_write(inode)) {
-		if (!page_private_atomic(page)) {
-			f2fs_register_inmem_page(inode, page);
-			return 1;
-		}
-		/*
-		 * Previously, this page has been registered, we just
-		 * return here.
-		 */
-		return 0;
-	}
-
 	if (!PageDirty(page)) {
 		__set_page_dirty_nobuffers(page);
 		f2fs_update_dirty_page(inode, page);
@@ -3650,42 +3732,14 @@ static sector_t f2fs_bmap(struct address_space *mapping, sector_t block)
 int f2fs_migrate_page(struct address_space *mapping,
 		struct page *newpage, struct page *page, enum migrate_mode mode)
 {
-	int rc, extra_count;
-	struct f2fs_inode_info *fi = F2FS_I(mapping->host);
-	bool atomic_written = page_private_atomic(page);
+	int rc, extra_count = 0;
 
 	BUG_ON(PageWriteback(page));
 
-	/* migrating an atomic written page is safe with the inmem_lock hold */
-	if (atomic_written) {
-		if (mode != MIGRATE_SYNC)
-			return -EBUSY;
-		if (!mutex_trylock(&fi->inmem_lock))
-			return -EAGAIN;
-	}
-
-	/* one extra reference was held for atomic_write page */
-	extra_count = atomic_written ? 1 : 0;
 	rc = migrate_page_move_mapping(mapping, newpage,
 				page, extra_count);
-	if (rc != MIGRATEPAGE_SUCCESS) {
-		if (atomic_written)
-			mutex_unlock(&fi->inmem_lock);
+	if (rc != MIGRATEPAGE_SUCCESS)
 		return rc;
-	}
-
-	if (atomic_written) {
-		struct inmem_pages *cur;
-
-		list_for_each_entry(cur, &fi->inmem_pages, list)
-			if (cur->page == page) {
-				cur->page = newpage;
-				break;
-			}
-		mutex_unlock(&fi->inmem_lock);
-		put_page(page);
-		get_page(newpage);
-	}
 
 	/* guarantee to start from no stale private field */
 	set_page_private(newpage, 0);
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index fcdf253cd211..65f0bcf498bb 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -91,7 +91,6 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	si->ndirty_files = sbi->ndirty_inode[FILE_INODE];
 	si->nquota_files = sbi->nquota_files;
 	si->ndirty_all = sbi->ndirty_inode[DIRTY_META];
-	si->inmem_pages = get_pages(sbi, F2FS_INMEM_PAGES);
 	si->aw_cnt = sbi->atomic_files;
 	si->vw_cnt = atomic_read(&sbi->vw_cnt);
 	si->max_aw_cnt = atomic_read(&sbi->max_aw_cnt);
@@ -167,8 +166,6 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	si->alloc_nids = NM_I(sbi)->nid_cnt[PREALLOC_NID];
 	si->io_skip_bggc = sbi->io_skip_bggc;
 	si->other_skip_bggc = sbi->other_skip_bggc;
-	si->skipped_atomic_files[BG_GC] = sbi->skipped_atomic_files[BG_GC];
-	si->skipped_atomic_files[FG_GC] = sbi->skipped_atomic_files[FG_GC];
 	si->util_free = (int)(free_user_blocks(sbi) >> sbi->log_blocks_per_seg)
 		* 100 / (int)(sbi->user_block_count >> sbi->log_blocks_per_seg)
 		/ 2;
@@ -296,7 +293,6 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
 				sizeof(struct nat_entry);
 	si->cache_mem += NM_I(sbi)->nat_cnt[DIRTY_NAT] *
 				sizeof(struct nat_entry_set);
-	si->cache_mem += si->inmem_pages * sizeof(struct inmem_pages);
 	for (i = 0; i < MAX_INO_ENTRY; i++)
 		si->cache_mem += sbi->im[i].ino_num * sizeof(struct ino_entry);
 	si->cache_mem += atomic_read(&sbi->total_ext_tree) *
@@ -491,10 +487,6 @@ static int stat_show(struct seq_file *s, void *v)
 				si->bg_data_blks);
 		seq_printf(s, "  - node blocks : %d (%d)\n", si->node_blks,
 				si->bg_node_blks);
-		seq_printf(s, "Skipped : atomic write %llu (%llu)\n",
-				si->skipped_atomic_files[BG_GC] +
-				si->skipped_atomic_files[FG_GC],
-				si->skipped_atomic_files[BG_GC]);
 		seq_printf(s, "BG skip : IO: %u, Other: %u\n",
 				si->io_skip_bggc, si->other_skip_bggc);
 		seq_puts(s, "\nExtent Cache:\n");
@@ -519,9 +511,9 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->flush_list_empty,
 			   si->nr_discarding, si->nr_discarded,
 			   si->nr_discard_cmd, si->undiscard_blks);
-		seq_printf(s, "  - inmem: %4d, atomic IO: %4d (Max. %4d), "
+		seq_printf(s, "  - atomic IO: %4d (Max. %4d), "
 			"volatile IO: %4d (Max. %4d)\n",
-			   si->inmem_pages, si->aw_cnt, si->max_aw_cnt,
+			   si->aw_cnt, si->max_aw_cnt,
 			   si->vw_cnt, si->max_vw_cnt);
 		seq_printf(s, "  - compress: %4d, hit:%8d\n", si->compress_pages, si->compress_page_hit);
 		seq_printf(s, "  - nodes: %4d in %4d\n",
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9c72a91912ae..63554428cbb2 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -717,7 +717,6 @@ enum {
 
 enum {
 	GC_FAILURE_PIN,
-	GC_FAILURE_ATOMIC,
 	MAX_GC_FAILURE
 };
 
@@ -739,7 +738,6 @@ enum {
 	FI_UPDATE_WRITE,	/* inode has in-place-update data */
 	FI_NEED_IPU,		/* used for ipu per file */
 	FI_ATOMIC_FILE,		/* indicate atomic file */
-	FI_ATOMIC_COMMIT,	/* indicate the state of atomical committing */
 	FI_VOLATILE_FILE,	/* indicate volatile file */
 	FI_FIRST_BLOCK_WRITTEN,	/* indicate #0 data block was written */
 	FI_DROP_CACHE,		/* drop dirty page cache */
@@ -753,7 +751,6 @@ enum {
 	FI_EXTRA_ATTR,		/* indicate file has extra attribute */
 	FI_PROJ_INHERIT,	/* indicate file inherits projectid */
 	FI_PIN_FILE,		/* indicate file should not be gced */
-	FI_ATOMIC_REVOKE_REQUEST, /* request to drop atomic data */
 	FI_VERITY_IN_PROGRESS,	/* building fs-verity Merkle tree */
 	FI_COMPRESSED_FILE,	/* indicate file's data can be compressed */
 	FI_COMPRESS_CORRUPT,	/* indicate compressed cluster is corrupted */
@@ -795,11 +792,9 @@ struct f2fs_inode_info {
 #endif
 	struct list_head dirty_list;	/* dirty list for dirs and files */
 	struct list_head gdirty_list;	/* linked in global dirty list */
-	struct list_head inmem_ilist;	/* list for inmem inodes */
-	struct list_head inmem_pages;	/* inmemory pages managed by f2fs */
-	struct task_struct *inmem_task;	/* store inmemory task */
-	struct mutex inmem_lock;	/* lock for inmemory pages */
+	struct task_struct *atomic_write_task;	/* store atomic write task */
 	struct extent_tree *extent_tree;	/* cached extent_tree entry */
+	struct inode *cow_inode;	/* copy-on-write inode for atomic write */
 
 	/* avoid racing between foreground op and gc */
 	struct f2fs_rwsem i_gc_rwsem[2];
@@ -1093,7 +1088,6 @@ enum count_type {
 	F2FS_DIRTY_QDATA,
 	F2FS_DIRTY_NODES,
 	F2FS_DIRTY_META,
-	F2FS_INMEM_PAGES,
 	F2FS_DIRTY_IMETA,
 	F2FS_WB_CP_DATA,
 	F2FS_WB_DATA,
@@ -1725,7 +1719,6 @@ struct f2fs_sb_info {
 
 	/* for skip statistic */
 	unsigned int atomic_files;		/* # of opened atomic file */
-	unsigned long long skipped_atomic_files[2];	/* FG_GC and BG_GC */
 	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
 
 	/* threshold for gc trials on pinned files */
@@ -3203,11 +3196,6 @@ static inline bool f2fs_is_atomic_file(struct inode *inode)
 	return is_inode_flag_set(inode, FI_ATOMIC_FILE);
 }
 
-static inline bool f2fs_is_commit_atomic_write(struct inode *inode)
-{
-	return is_inode_flag_set(inode, FI_ATOMIC_COMMIT);
-}
-
 static inline bool f2fs_is_volatile_file(struct inode *inode)
 {
 	return is_inode_flag_set(inode, FI_VOLATILE_FILE);
@@ -3445,6 +3433,8 @@ void f2fs_handle_failed_inode(struct inode *inode);
 int f2fs_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
 							bool hot, bool set);
 struct dentry *f2fs_get_parent(struct dentry *child);
+int f2fs_get_tmpfile(struct user_namespace *mnt_userns, struct inode *dir,
+		     struct inode **new_inode);
 
 /*
  * dir.c
@@ -3580,11 +3570,8 @@ void f2fs_destroy_node_manager_caches(void);
  * segment.c
  */
 bool f2fs_need_SSR(struct f2fs_sb_info *sbi);
-void f2fs_register_inmem_page(struct inode *inode, struct page *page);
-void f2fs_drop_inmem_pages_all(struct f2fs_sb_info *sbi, bool gc_failure);
-void f2fs_drop_inmem_pages(struct inode *inode);
-void f2fs_drop_inmem_page(struct inode *inode, struct page *page);
-int f2fs_commit_inmem_pages(struct inode *inode);
+int f2fs_commit_atomic_write(struct inode *inode);
+void f2fs_abort_atomic_write(struct inode *inode, bool clean);
 void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need);
 void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg);
 int f2fs_issue_flush(struct f2fs_sb_info *sbi, nid_t ino);
@@ -3819,7 +3806,6 @@ struct f2fs_stat_info {
 	int ext_tree, zombie_tree, ext_node;
 	int ndirty_node, ndirty_dent, ndirty_meta, ndirty_imeta;
 	int ndirty_data, ndirty_qdata;
-	int inmem_pages;
 	unsigned int ndirty_dirs, ndirty_files, nquota_files, ndirty_all;
 	int nats, dirty_nats, sits, dirty_sits;
 	int free_nids, avail_nids, alloc_nids;
@@ -3849,7 +3835,6 @@ struct f2fs_stat_info {
 	int bg_node_segs, bg_data_segs;
 	int tot_blks, data_blks, node_blks;
 	int bg_data_blks, bg_node_blks;
-	unsigned long long skipped_atomic_files[2];
 	int curseg[NR_CURSEG_TYPE];
 	int cursec[NR_CURSEG_TYPE];
 	int curzone[NR_CURSEG_TYPE];
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 68ddf4c7ca64..2ce383e3205d 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1804,9 +1804,8 @@ static int f2fs_release_file(struct inode *inode, struct file *filp)
 			atomic_read(&inode->i_writecount) != 1)
 		return 0;
 
-	/* some remained atomic pages should discarded */
 	if (f2fs_is_atomic_file(inode))
-		f2fs_drop_inmem_pages(inode);
+		f2fs_abort_atomic_write(inode, true);
 	if (f2fs_is_volatile_file(inode)) {
 		set_inode_flag(inode, FI_DROP_CACHE);
 		filemap_fdatawrite(inode->i_mapping);
@@ -1828,8 +1827,8 @@ static int f2fs_file_flush(struct file *file, fl_owner_t id)
 	 * before dropping file lock, it needs to do in ->flush.
 	 */
 	if (f2fs_is_atomic_file(inode) &&
-			F2FS_I(inode)->inmem_task == current)
-		f2fs_drop_inmem_pages(inode);
+			F2FS_I(inode)->atomic_write_task == current)
+		f2fs_abort_atomic_write(inode, true);
 	return 0;
 }
 
@@ -1992,6 +1991,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 	struct user_namespace *mnt_userns = file_mnt_user_ns(filp);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct inode *pinode;
 	int ret;
 
 	if (!inode_owner_or_capable(mnt_userns, inode))
@@ -2014,11 +2014,8 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 		goto out;
 	}
 
-	if (f2fs_is_atomic_file(inode)) {
-		if (is_inode_flag_set(inode, FI_ATOMIC_REVOKE_REQUEST))
-			ret = -EINVAL;
+	if (f2fs_is_atomic_file(inode))
 		goto out;
-	}
 
 	ret = f2fs_convert_inline_inode(inode);
 	if (ret)
@@ -2039,19 +2036,32 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 		goto out;
 	}
 
+	/* Create a COW inode for atomic write */
+	pinode = f2fs_iget(inode->i_sb, fi->i_pino);
+	if (IS_ERR(pinode)) {
+		f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+		goto out;
+	}
+
+	ret = f2fs_get_tmpfile(mnt_userns, pinode, &fi->cow_inode);
+	iput(pinode);
+	if (ret) {
+		f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+		goto out;
+	}
+	f2fs_i_size_write(fi->cow_inode, i_size_read(inode));
+
 	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
-	if (list_empty(&fi->inmem_ilist))
-		list_add_tail(&fi->inmem_ilist, &sbi->inode_list[ATOMIC_FILE]);
 	sbi->atomic_files++;
 	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
 
-	/* add inode in inmem_list first and set atomic_file */
 	set_inode_flag(inode, FI_ATOMIC_FILE);
-	clear_inode_flag(inode, FI_ATOMIC_REVOKE_REQUEST);
+	set_inode_flag(fi->cow_inode, FI_ATOMIC_FILE);
+	clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
 	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 
 	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
-	F2FS_I(inode)->inmem_task = current;
+	F2FS_I(inode)->atomic_write_task = current;
 	stat_update_max_atomic_write(inode);
 out:
 	inode_unlock(inode);
@@ -2082,21 +2092,17 @@ static int f2fs_ioc_commit_atomic_write(struct file *filp)
 	}
 
 	if (f2fs_is_atomic_file(inode)) {
-		ret = f2fs_commit_inmem_pages(inode);
+		ret = f2fs_commit_atomic_write(inode);
 		if (ret)
 			goto err_out;
 
 		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 0, true);
 		if (!ret)
-			f2fs_drop_inmem_pages(inode);
+			f2fs_abort_atomic_write(inode, false);
 	} else {
 		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 1, false);
 	}
 err_out:
-	if (is_inode_flag_set(inode, FI_ATOMIC_REVOKE_REQUEST)) {
-		clear_inode_flag(inode, FI_ATOMIC_REVOKE_REQUEST);
-		ret = -EINVAL;
-	}
 	inode_unlock(inode);
 	mnt_drop_write_file(filp);
 	return ret;
@@ -2184,15 +2190,13 @@ static int f2fs_ioc_abort_volatile_write(struct file *filp)
 	inode_lock(inode);
 
 	if (f2fs_is_atomic_file(inode))
-		f2fs_drop_inmem_pages(inode);
+		f2fs_abort_atomic_write(inode, true);
 	if (f2fs_is_volatile_file(inode)) {
 		clear_inode_flag(inode, FI_VOLATILE_FILE);
 		stat_dec_volatile_write(inode);
 		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 0, true);
 	}
 
-	clear_inode_flag(inode, FI_ATOMIC_REVOKE_REQUEST);
-
 	inode_unlock(inode);
 
 	mnt_drop_write_file(filp);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index ea5b93b689cd..71f6a13d5f1f 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1194,13 +1194,6 @@ static int move_data_block(struct inode *inode, block_t bidx,
 		goto out;
 	}
 
-	if (f2fs_is_atomic_file(inode)) {
-		F2FS_I(inode)->i_gc_failures[GC_FAILURE_ATOMIC]++;
-		F2FS_I_SB(inode)->skipped_atomic_files[gc_type]++;
-		err = -EAGAIN;
-		goto out;
-	}
-
 	if (f2fs_is_pinned_file(inode)) {
 		f2fs_pin_file_control(inode, true);
 		err = -EAGAIN;
@@ -1344,12 +1337,6 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 		goto out;
 	}
 
-	if (f2fs_is_atomic_file(inode)) {
-		F2FS_I(inode)->i_gc_failures[GC_FAILURE_ATOMIC]++;
-		F2FS_I_SB(inode)->skipped_atomic_files[gc_type]++;
-		err = -EAGAIN;
-		goto out;
-	}
 	if (f2fs_is_pinned_file(inode)) {
 		if (gc_type == FG_GC)
 			f2fs_pin_file_control(inode, true);
@@ -1711,8 +1698,6 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 		.ilist = LIST_HEAD_INIT(gc_list.ilist),
 		.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
 	};
-	unsigned long long last_skipped = sbi->skipped_atomic_files[FG_GC];
-	unsigned long long first_skipped;
 	unsigned int skipped_round = 0, round = 0;
 
 	trace_f2fs_gc_begin(sbi->sb, sync, background,
@@ -1726,7 +1711,6 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 
 	cpc.reason = __get_cp_reason(sbi);
 	sbi->skipped_gc_rwsem = 0;
-	first_skipped = last_skipped;
 gc_more:
 	if (unlikely(!(sbi->sb->s_flags & SB_ACTIVE))) {
 		ret = -EINVAL;
@@ -1769,10 +1753,8 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 	total_freed += seg_freed;
 
 	if (gc_type == FG_GC) {
-		if (sbi->skipped_atomic_files[FG_GC] > last_skipped ||
-						sbi->skipped_gc_rwsem)
+		if (sbi->skipped_gc_rwsem)
 			skipped_round++;
-		last_skipped = sbi->skipped_atomic_files[FG_GC];
 		round++;
 	}
 
@@ -1789,13 +1771,6 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 			goto gc_more;
 		}
 
-		if (first_skipped < last_skipped &&
-				(last_skipped - first_skipped) >
-						sbi->skipped_gc_rwsem) {
-			f2fs_drop_inmem_pages_all(sbi, true);
-			segno = NULL_SEGNO;
-			goto gc_more;
-		}
 		if (gc_type == FG_GC && !is_sbi_flag_set(sbi, SBI_CP_DISABLED))
 			ret = f2fs_write_checkpoint(sbi, &cpc);
 	}
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 71f232dcf3c2..f78cd9a609d0 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -744,9 +744,8 @@ void f2fs_evict_inode(struct inode *inode)
 	nid_t xnid = F2FS_I(inode)->i_xattr_nid;
 	int err = 0;
 
-	/* some remained atomic pages should discarded */
 	if (f2fs_is_atomic_file(inode))
-		f2fs_drop_inmem_pages(inode);
+		f2fs_abort_atomic_write(inode, true);
 
 	trace_f2fs_evict_inode(inode);
 	truncate_inode_pages_final(&inode->i_data);
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 5ed79b29999f..19b026b66c36 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -836,8 +836,8 @@ static int f2fs_mknod(struct user_namespace *mnt_userns, struct inode *dir,
 }
 
 static int __f2fs_tmpfile(struct user_namespace *mnt_userns, struct inode *dir,
-					struct dentry *dentry, umode_t mode,
-					struct inode **whiteout)
+			  struct dentry *dentry, umode_t mode, bool is_whiteout,
+			  struct inode **new_inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
 	struct inode *inode;
@@ -851,7 +851,7 @@ static int __f2fs_tmpfile(struct user_namespace *mnt_userns, struct inode *dir,
 	if (IS_ERR(inode))
 		return PTR_ERR(inode);
 
-	if (whiteout) {
+	if (is_whiteout) {
 		init_special_inode(inode, inode->i_mode, WHITEOUT_DEV);
 		inode->i_op = &f2fs_special_inode_operations;
 	} else {
@@ -876,21 +876,25 @@ static int __f2fs_tmpfile(struct user_namespace *mnt_userns, struct inode *dir,
 	f2fs_add_orphan_inode(inode);
 	f2fs_alloc_nid_done(sbi, inode->i_ino);
 
-	if (whiteout) {
+	if (is_whiteout) {
 		f2fs_i_links_write(inode, false);
 
 		spin_lock(&inode->i_lock);
 		inode->i_state |= I_LINKABLE;
 		spin_unlock(&inode->i_lock);
-
-		*whiteout = inode;
 	} else {
-		d_tmpfile(dentry, inode);
+		if (dentry)
+			d_tmpfile(dentry, inode);
+		else
+			f2fs_i_links_write(inode, false);
 	}
 	/* link_count was changed by d_tmpfile as well. */
 	f2fs_unlock_op(sbi);
 	unlock_new_inode(inode);
 
+	if (new_inode)
+		*new_inode = inode;
+
 	f2fs_balance_fs(sbi, true);
 	return 0;
 
@@ -911,7 +915,7 @@ static int f2fs_tmpfile(struct user_namespace *mnt_userns, struct inode *dir,
 	if (!f2fs_is_checkpoint_ready(sbi))
 		return -ENOSPC;
 
-	return __f2fs_tmpfile(mnt_userns, dir, dentry, mode, NULL);
+	return __f2fs_tmpfile(mnt_userns, dir, dentry, mode, false, NULL);
 }
 
 static int f2fs_create_whiteout(struct user_namespace *mnt_userns,
@@ -921,7 +925,13 @@ static int f2fs_create_whiteout(struct user_namespace *mnt_userns,
 		return -EIO;
 
 	return __f2fs_tmpfile(mnt_userns, dir, NULL,
-				S_IFCHR | WHITEOUT_MODE, whiteout);
+				S_IFCHR | WHITEOUT_MODE, true, whiteout);
+}
+
+int f2fs_get_tmpfile(struct user_namespace *mnt_userns, struct inode *dir,
+		     struct inode **new_inode)
+{
+	return __f2fs_tmpfile(mnt_userns, dir, NULL, S_IFREG, false, new_inode);
 }
 
 static int f2fs_rename(struct user_namespace *mnt_userns, struct inode *old_dir,
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index fe8c38c9ac77..f17f6338bab2 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -90,10 +90,6 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 				atomic_read(&sbi->total_ext_node) *
 				sizeof(struct extent_node)) >> PAGE_SHIFT;
 		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 1);
-	} else if (type == INMEM_PAGES) {
-		/* it allows 20% / total_ram for inmemory pages */
-		mem_size = get_pages(sbi, F2FS_INMEM_PAGES);
-		res = mem_size < (val.totalram / 5);
 	} else if (type == DISCARD_CACHE) {
 		mem_size = (atomic_read(&dcc->discard_cmd_cnt) *
 				sizeof(struct discard_cmd)) >> PAGE_SHIFT;
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 4c1d34bfea78..3c09cae058b0 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -147,7 +147,6 @@ enum mem_type {
 	DIRTY_DENTS,	/* indicates dirty dentry pages */
 	INO_ENTRIES,	/* indicates inode entries */
 	EXTENT_CACHE,	/* indicates extent cache */
-	INMEM_PAGES,	/* indicates inmemory pages */
 	DISCARD_CACHE,	/* indicates memory of cached discard cmds */
 	COMPRESS_PAGE,	/* indicates memory of cached compressed pages */
 	BASE_CHECK,	/* check kernel status */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 012524db7437..a04fb32b12b9 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -30,7 +30,7 @@
 static struct kmem_cache *discard_entry_slab;
 static struct kmem_cache *discard_cmd_slab;
 static struct kmem_cache *sit_entry_set_slab;
-static struct kmem_cache *inmem_entry_slab;
+static struct kmem_cache *revoke_entry_slab;
 
 static unsigned long __reverse_ulong(unsigned char *str)
 {
@@ -185,285 +185,167 @@ bool f2fs_need_SSR(struct f2fs_sb_info *sbi)
 			SM_I(sbi)->min_ssr_sections + reserved_sections(sbi));
 }
 
-void f2fs_register_inmem_page(struct inode *inode, struct page *page)
+void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 {
-	struct inmem_pages *new;
-
-	set_page_private_atomic(page);
-
-	new = f2fs_kmem_cache_alloc(inmem_entry_slab,
-					GFP_NOFS, true, NULL);
-
-	/* add atomic page indices to the list */
-	new->page = page;
-	INIT_LIST_HEAD(&new->list);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_inode_info *fi = F2FS_I(inode);
 
-	/* increase reference count with clean state */
-	get_page(page);
-	mutex_lock(&F2FS_I(inode)->inmem_lock);
-	list_add_tail(&new->list, &F2FS_I(inode)->inmem_pages);
-	inc_page_count(F2FS_I_SB(inode), F2FS_INMEM_PAGES);
-	mutex_unlock(&F2FS_I(inode)->inmem_lock);
+	if (f2fs_is_atomic_file(inode)) {
+		clear_inode_flag(inode, FI_ATOMIC_FILE);
+		clear_inode_flag(fi->cow_inode, FI_ATOMIC_FILE);
+		if (clean)
+			truncate_inode_pages_final(inode->i_mapping);
+		iput(fi->cow_inode);
+		fi->cow_inode = NULL;
 
-	trace_f2fs_register_inmem_page(page, INMEM);
+		spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
+		sbi->atomic_files--;
+		spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
+	}
 }
 
-static int __revoke_inmem_pages(struct inode *inode,
-				struct list_head *head, bool drop, bool recover,
-				bool trylock)
+static int __replace_atomic_write_block(struct inode *inode, pgoff_t index,
+			block_t new_addr, block_t *old_addr, bool recover)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct inmem_pages *cur, *tmp;
-	int err = 0;
-
-	list_for_each_entry_safe(cur, tmp, head, list) {
-		struct page *page = cur->page;
-
-		if (drop)
-			trace_f2fs_commit_inmem_page(page, INMEM_DROP);
-
-		if (trylock) {
-			/*
-			 * to avoid deadlock in between page lock and
-			 * inmem_lock.
-			 */
-			if (!trylock_page(page))
-				continue;
-		} else {
-			lock_page(page);
-		}
-
-		f2fs_wait_on_page_writeback(page, DATA, true, true);
-
-		if (recover) {
-			struct dnode_of_data dn;
-			struct node_info ni;
+	struct dnode_of_data dn;
+	struct node_info ni;
+	int err;
 
-			trace_f2fs_commit_inmem_page(page, INMEM_REVOKE);
 retry:
-			set_new_dnode(&dn, inode, NULL, NULL, 0);
-			err = f2fs_get_dnode_of_data(&dn, page->index,
-								LOOKUP_NODE);
-			if (err) {
-				if (err == -ENOMEM) {
-					memalloc_retry_wait(GFP_NOFS);
-					goto retry;
-				}
-				err = -EAGAIN;
-				goto next;
-			}
-
-			err = f2fs_get_node_info(sbi, dn.nid, &ni, false);
-			if (err) {
-				f2fs_put_dnode(&dn);
-				return err;
-			}
-
-			if (cur->old_addr == NEW_ADDR) {
-				f2fs_invalidate_blocks(sbi, dn.data_blkaddr);
-				f2fs_update_data_blkaddr(&dn, NEW_ADDR);
-			} else
-				f2fs_replace_block(sbi, &dn, dn.data_blkaddr,
-					cur->old_addr, ni.version, true, true);
-			f2fs_put_dnode(&dn);
-		}
-next:
-		/* we don't need to invalidate this in the sccessful status */
-		if (drop || recover) {
-			ClearPageUptodate(page);
-			clear_page_private_gcing(page);
+	set_new_dnode(&dn, inode, NULL, NULL, 0);
+	err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE_RA);
+	if (err) {
+		if (err == -ENOMEM) {
+			congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
+			cond_resched();
+			goto retry;
 		}
-		detach_page_private(page);
-		set_page_private(page, 0);
-		f2fs_put_page(page, 1);
-
-		list_del(&cur->list);
-		kmem_cache_free(inmem_entry_slab, cur);
-		dec_page_count(F2FS_I_SB(inode), F2FS_INMEM_PAGES);
+		return err;
 	}
-	return err;
-}
 
-void f2fs_drop_inmem_pages_all(struct f2fs_sb_info *sbi, bool gc_failure)
-{
-	struct list_head *head = &sbi->inode_list[ATOMIC_FILE];
-	struct inode *inode;
-	struct f2fs_inode_info *fi;
-	unsigned int count = sbi->atomic_files;
-	unsigned int looped = 0;
-next:
-	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
-	if (list_empty(head)) {
-		spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
-		return;
+	err = f2fs_get_node_info(sbi, dn.nid, &ni, false);
+	if (err) {
+		f2fs_put_dnode(&dn);
+		return err;
 	}
-	fi = list_first_entry(head, struct f2fs_inode_info, inmem_ilist);
-	inode = igrab(&fi->vfs_inode);
-	if (inode)
-		list_move_tail(&fi->inmem_ilist, head);
-	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
 
-	if (inode) {
-		if (gc_failure) {
-			if (!fi->i_gc_failures[GC_FAILURE_ATOMIC])
-				goto skip;
+	if (recover) {
+		/* dn.data_blkaddr is always valid */
+		if (!__is_valid_data_blkaddr(new_addr)) {
+			if (new_addr == NULL_ADDR)
+				dec_valid_block_count(sbi, inode, 1);
+			f2fs_invalidate_blocks(sbi, dn.data_blkaddr);
+			f2fs_update_data_blkaddr(&dn, new_addr);
+		} else {
+			f2fs_replace_block(sbi, &dn, dn.data_blkaddr,
+					new_addr, ni.version, true, true);
 		}
-		set_inode_flag(inode, FI_ATOMIC_REVOKE_REQUEST);
-		f2fs_drop_inmem_pages(inode);
-skip:
-		iput(inode);
-	}
-	congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
-	cond_resched();
-	if (gc_failure) {
-		if (++looped >= count)
-			return;
-	}
-	goto next;
-}
-
-void f2fs_drop_inmem_pages(struct inode *inode)
-{
-	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct f2fs_inode_info *fi = F2FS_I(inode);
+	} else {
+		blkcnt_t count = 1;
 
-	do {
-		mutex_lock(&fi->inmem_lock);
-		if (list_empty(&fi->inmem_pages)) {
-			fi->i_gc_failures[GC_FAILURE_ATOMIC] = 0;
-
-			spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
-			if (!list_empty(&fi->inmem_ilist))
-				list_del_init(&fi->inmem_ilist);
-			if (f2fs_is_atomic_file(inode)) {
-				clear_inode_flag(inode, FI_ATOMIC_FILE);
-				sbi->atomic_files--;
-			}
-			spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
+		*old_addr = dn.data_blkaddr;
+		f2fs_truncate_data_blocks_range(&dn, 1);
+		dec_valid_block_count(sbi, F2FS_I(inode)->cow_inode, count);
+		inc_valid_block_count(sbi, inode, &count);
+		f2fs_replace_block(sbi, &dn, dn.data_blkaddr, new_addr,
+					ni.version, true, false);
+	}
 
-			mutex_unlock(&fi->inmem_lock);
-			break;
-		}
-		__revoke_inmem_pages(inode, &fi->inmem_pages,
-						true, false, true);
-		mutex_unlock(&fi->inmem_lock);
-	} while (1);
+	f2fs_put_dnode(&dn);
+	return 0;
 }
 
-void f2fs_drop_inmem_page(struct inode *inode, struct page *page)
+static void __complete_revoke_list(struct inode *inode, struct list_head *head,
+				   bool revoke)
 {
-	struct f2fs_inode_info *fi = F2FS_I(inode);
-	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct list_head *head = &fi->inmem_pages;
-	struct inmem_pages *cur = NULL;
-
-	f2fs_bug_on(sbi, !page_private_atomic(page));
+	struct revoke_entry *cur, *tmp;
 
-	mutex_lock(&fi->inmem_lock);
-	list_for_each_entry(cur, head, list) {
-		if (cur->page == page)
-			break;
+	list_for_each_entry_safe(cur, tmp, head, list) {
+		if (revoke)
+			__replace_atomic_write_block(inode, cur->index,
+						cur->old_addr, NULL, true);
+		list_del(&cur->list);
+		kmem_cache_free(revoke_entry_slab, cur);
 	}
-
-	f2fs_bug_on(sbi, list_empty(head) || cur->page != page);
-	list_del(&cur->list);
-	mutex_unlock(&fi->inmem_lock);
-
-	dec_page_count(sbi, F2FS_INMEM_PAGES);
-	kmem_cache_free(inmem_entry_slab, cur);
-
-	ClearPageUptodate(page);
-	clear_page_private_atomic(page);
-	f2fs_put_page(page, 0);
-
-	detach_page_private(page);
-	set_page_private(page, 0);
-
-	trace_f2fs_commit_inmem_page(page, INMEM_INVALIDATE);
 }
 
-static int __f2fs_commit_inmem_pages(struct inode *inode)
+static int __f2fs_commit_atomic_write(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
-	struct inmem_pages *cur, *tmp;
-	struct f2fs_io_info fio = {
-		.sbi = sbi,
-		.ino = inode->i_ino,
-		.type = DATA,
-		.op = REQ_OP_WRITE,
-		.op_flags = REQ_SYNC | REQ_PRIO,
-		.io_type = FS_DATA_IO,
-	};
+	struct inode *cow_inode = fi->cow_inode;
+	struct revoke_entry *new;
 	struct list_head revoke_list;
-	bool submit_bio = false;
-	int err = 0;
+	block_t blkaddr;
+	struct dnode_of_data dn;
+	pgoff_t len = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
+	pgoff_t off = 0, blen, index;
+	int ret = 0, i;
 
 	INIT_LIST_HEAD(&revoke_list);
 
-	list_for_each_entry_safe(cur, tmp, &fi->inmem_pages, list) {
-		struct page *page = cur->page;
+	while (len) {
+		blen = min_t(pgoff_t, ADDRS_PER_BLOCK(cow_inode), len);
 
-		lock_page(page);
-		if (page->mapping == inode->i_mapping) {
-			trace_f2fs_commit_inmem_page(page, INMEM);
+		set_new_dnode(&dn, cow_inode, NULL, NULL, 0);
+		ret = f2fs_get_dnode_of_data(&dn, off, LOOKUP_NODE_RA);
+		if (ret && ret != -ENOENT) {
+			goto out;
+		} else if (ret == -ENOENT) {
+			if (dn.max_level == 0)
+				goto out;
+			goto next;
+		}
 
-			f2fs_wait_on_page_writeback(page, DATA, true, true);
+		blen = min((pgoff_t)ADDRS_PER_PAGE(dn.node_page, cow_inode),
+				len);
+		index = off;
+		for (i = 0; i < blen; i++, dn.ofs_in_node++, index++) {
+			blkaddr = f2fs_data_blkaddr(&dn);
 
-			set_page_dirty(page);
-			if (clear_page_dirty_for_io(page)) {
-				inode_dec_dirty_pages(inode);
-				f2fs_remove_dirty_inode(inode);
-			}
-retry:
-			fio.page = page;
-			fio.old_blkaddr = NULL_ADDR;
-			fio.encrypted_page = NULL;
-			fio.need_lock = LOCK_DONE;
-			err = f2fs_do_write_data_page(&fio);
-			if (err) {
-				if (err == -ENOMEM) {
-					memalloc_retry_wait(GFP_NOFS);
-					goto retry;
-				}
-				unlock_page(page);
-				break;
+			if (!__is_valid_data_blkaddr(blkaddr)) {
+				continue;
+			} else if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
+					DATA_GENERIC_ENHANCE)) {
+				f2fs_put_dnode(&dn);
+				ret = -EFSCORRUPTED;
+				goto out;
 			}
-			/* record old blkaddr for revoking */
-			cur->old_addr = fio.old_blkaddr;
-			submit_bio = true;
-		}
-		unlock_page(page);
-		list_move_tail(&cur->list, &revoke_list);
-	}
 
-	if (submit_bio)
-		f2fs_submit_merged_write_cond(sbi, inode, NULL, 0, DATA);
+			new = f2fs_kmem_cache_alloc(revoke_entry_slab, GFP_NOFS,
+							true, NULL);
+			if (!new) {
+				f2fs_put_dnode(&dn);
+				ret = -ENOMEM;
+				goto out;
+			}
 
-	if (err) {
-		/*
-		 * try to revoke all committed pages, but still we could fail
-		 * due to no memory or other reason, if that happened, EAGAIN
-		 * will be returned, which means in such case, transaction is
-		 * already not integrity, caller should use journal to do the
-		 * recovery or rewrite & commit last transaction. For other
-		 * error number, revoking was done by filesystem itself.
-		 */
-		err = __revoke_inmem_pages(inode, &revoke_list,
-						false, true, false);
+			ret = __replace_atomic_write_block(inode, index, blkaddr,
+							&new->old_addr, false);
+			if (ret) {
+				f2fs_put_dnode(&dn);
+				kmem_cache_free(revoke_entry_slab, new);
+				goto out;
+			}
 
-		/* drop all uncommitted pages */
-		__revoke_inmem_pages(inode, &fi->inmem_pages,
-						true, false, false);
-	} else {
-		__revoke_inmem_pages(inode, &revoke_list,
-						false, false, false);
+			f2fs_update_data_blkaddr(&dn, NULL_ADDR);
+			new->index = index;
+			list_add_tail(&new->list, &revoke_list);
+		}
+		f2fs_put_dnode(&dn);
+next:
+		off += blen;
+		len -= blen;
 	}
 
-	return err;
+out:
+	__complete_revoke_list(inode, &revoke_list, ret ? true : false);
+
+	return ret;
 }
 
-int f2fs_commit_inmem_pages(struct inode *inode)
+int f2fs_commit_atomic_write(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
@@ -472,15 +354,9 @@ int f2fs_commit_inmem_pages(struct inode *inode)
 	f2fs_balance_fs(sbi, true);
 
 	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
-
 	f2fs_lock_op(sbi);
-	set_inode_flag(inode, FI_ATOMIC_COMMIT);
-
-	mutex_lock(&fi->inmem_lock);
-	err = __f2fs_commit_inmem_pages(inode);
-	mutex_unlock(&fi->inmem_lock);
 
-	clear_inode_flag(inode, FI_ATOMIC_COMMIT);
+	err = __f2fs_commit_atomic_write(inode);
 
 	f2fs_unlock_op(sbi);
 	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
@@ -5434,9 +5310,9 @@ int __init f2fs_create_segment_manager_caches(void)
 	if (!sit_entry_set_slab)
 		goto destroy_discard_cmd;
 
-	inmem_entry_slab = f2fs_kmem_cache_create("f2fs_inmem_page_entry",
-			sizeof(struct inmem_pages));
-	if (!inmem_entry_slab)
+	revoke_entry_slab = f2fs_kmem_cache_create("f2fs_revoke_entry",
+			sizeof(struct revoke_entry));
+	if (!revoke_entry_slab)
 		goto destroy_sit_entry_set;
 	return 0;
 
@@ -5455,5 +5331,5 @@ void f2fs_destroy_segment_manager_caches(void)
 	kmem_cache_destroy(sit_entry_set_slab);
 	kmem_cache_destroy(discard_cmd_slab);
 	kmem_cache_destroy(discard_entry_slab);
-	kmem_cache_destroy(inmem_entry_slab);
+	kmem_cache_destroy(revoke_entry_slab);
 }
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 5c94caf0c0a1..5f61c4adf61b 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -224,10 +224,10 @@ struct segment_allocation {
 
 #define MAX_SKIP_GC_COUNT			16
 
-struct inmem_pages {
+struct revoke_entry {
 	struct list_head list;
-	struct page *page;
 	block_t old_addr;		/* for revoking when fail to commit */
+	pgoff_t index;
 };
 
 struct sit_info {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 769d18a2041f..0e92642b5509 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1359,9 +1359,6 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
 	spin_lock_init(&fi->i_size_lock);
 	INIT_LIST_HEAD(&fi->dirty_list);
 	INIT_LIST_HEAD(&fi->gdirty_list);
-	INIT_LIST_HEAD(&fi->inmem_ilist);
-	INIT_LIST_HEAD(&fi->inmem_pages);
-	mutex_init(&fi->inmem_lock);
 	init_f2fs_rwsem(&fi->i_gc_rwsem[READ]);
 	init_f2fs_rwsem(&fi->i_gc_rwsem[WRITE]);
 	init_f2fs_rwsem(&fi->i_xattr_sem);
@@ -1402,9 +1399,8 @@ static int f2fs_drop_inode(struct inode *inode)
 			atomic_inc(&inode->i_count);
 			spin_unlock(&inode->i_lock);
 
-			/* some remained atomic pages should discarded */
 			if (f2fs_is_atomic_file(inode))
-				f2fs_drop_inmem_pages(inode);
+				f2fs_abort_atomic_write(inode, true);
 
 			/* should remain fi->extent_tree for writepage */
 			f2fs_destroy_extent_node(inode);
-- 
2.35.1.1094.g7c7d902a7c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
