Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CB189E477
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Apr 2024 22:34:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ruIAo-00073L-Br;
	Tue, 09 Apr 2024 20:34:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ruIAn-00073B-A2
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 20:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NhtsXoRKUqq4hsMx2pA6WaoBbzOvRD+NiaEMAGMouh4=; b=mnwDDWNUmoWwNkKFACiH9ixZjT
 WFjIz9HB11XanZk003iu1rJxzoRV0H3lYVeCSJsQNKn0e2911O3w/x+j5zjeeRtvnLMoWV6XHGHiA
 9vx2WhLpCGF8GGWMm7CIVEXw3YjXup0CyRV99yEOyQsI8r2OIfEPh6sqPd36C5o0TAHY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NhtsXoRKUqq4hsMx2pA6WaoBbzOvRD+NiaEMAGMouh4=; b=R
 OWqEEUqyWHxG++swCNvuwzyAWJiWH8Xekl79MFMRb1w9SVQvk8ID15Pom5SnSetfhEnoZJ1ksYxEG
 z0w/c8qQsrlLM/7j5Lw15De4JSZWJk3H4MbyoXg+8+uNzGhegI/mJWsMJhKtnsnquyZWyu5VcrmyV
 FkqrTzXSqKGKL5wY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruIAf-0001Q9-BM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 20:34:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 08B0861A0A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  9 Apr 2024 20:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9061AC433F1;
 Tue,  9 Apr 2024 20:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712694855;
 bh=b3ttuqhR2lE3/ooK+He6Bxq4Y4ocjGQu2qVnnFvzt3E=;
 h=From:To:Cc:Subject:Date:From;
 b=jgV+KyxMSmKVsIW5Datu32WxKTPm4RUP3BcRod7zvS2MN6JReG6EoIjj5fgi4XGtE
 7vTK+miVqsVB2MhHxmbrXMtlQbzEM2ILUxcXHPgc9pxviFXQfwQkh5M/SefZPKuAvk
 gGRrC2VtowxWxDd4zptc5FoF0eicC1tyBFZ2PoXO5a1eWYs0YxBA0HMaJOpox7belm
 GrwsYUxaUhNMt+f8/veKgcWDptT3e52FZ+gbXdZHiP2mo8wnr6AbNiYAPy9ZLS9a7a
 +XuWk4M+4vBRTstUu4xCKXOjLpFONnQHmuPAUmjBRl/gyhl5aPoRX/RqgveM1yF5nz
 Drx+6Fi2bmXtw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  9 Apr 2024 20:34:09 +0000
Message-ID: <20240409203411.1885121-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
MIME-Version: 1.0
X-Spam-Score: -6.9 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's convert PageWriteback to folio_test_writeback.
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/compress.c | 2 +- fs/f2fs/data.c
 | 3 +-- fs/f2fs/f2fs.h | 2 +- fs/f2fs/gc.c | 2 +- fs/f2fs/inline.c | 2 +-
 fs/f2fs/inode.c | 3 ++- fs/f2fs/n [...] 
 Content analysis details:   (-6.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ruIAf-0001Q9-BM
Subject: [f2fs-dev] [PATCH 1/3] f2fs: use folio_test_writeback
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's convert PageWriteback to folio_test_writeback.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/compress.c |  2 +-
 fs/f2fs/data.c     |  3 +--
 fs/f2fs/f2fs.h     |  2 +-
 fs/f2fs/gc.c       |  2 +-
 fs/f2fs/inline.c   |  2 +-
 fs/f2fs/inode.c    |  3 ++-
 fs/f2fs/node.c     |  2 +-
 fs/f2fs/segment.c  | 10 +++++-----
 8 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 8892c8262141..d67c471ab5df 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1484,7 +1484,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 		if (!PageDirty(cc->rpages[i]))
 			goto continue_unlock;
 
-		if (PageWriteback(cc->rpages[i])) {
+		if (folio_test_writeback(page_folio(cc->rpages[i]))) {
 			if (wbc->sync_mode == WB_SYNC_NONE)
 				goto continue_unlock;
 			f2fs_wait_on_page_writeback(cc->rpages[i], DATA, true, true);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 60056b9a51be..19f1e573297d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2707,8 +2707,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		if (err) {
 			if (fscrypt_inode_uses_fs_layer_crypto(inode))
 				fscrypt_finalize_bounce_page(&fio->encrypted_page);
-			if (PageWriteback(page))
-				end_page_writeback(page);
+			end_page_writeback(page);
 		} else {
 			set_inode_flag(inode, FI_UPDATE_WRITE);
 		}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e9ef971f4dba..dd530dc70005 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4660,7 +4660,7 @@ static inline void f2fs_truncate_meta_inode_pages(struct f2fs_sb_info *sbi,
 
 		page = find_get_page(META_MAPPING(sbi), blkaddr + i);
 		if (page) {
-			if (PageWriteback(page))
+			if (folio_test_writeback(page_folio(page)))
 				need_submit = true;
 			f2fs_put_page(page, 0);
 		}
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 8852814dab7f..ac4cbbe50c2f 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1434,7 +1434,7 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 		goto out;
 
 	if (gc_type == BG_GC) {
-		if (PageWriteback(page)) {
+		if (folio_test_writeback(page_folio(page))) {
 			err = -EAGAIN;
 			goto out;
 		}
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index ac00423f117b..3d3218a4b29d 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -164,7 +164,7 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
 		return -EFSCORRUPTED;
 	}
 
-	f2fs_bug_on(F2FS_P_SB(page), PageWriteback(page));
+	f2fs_bug_on(F2FS_P_SB(page), folio_test_writeback(page_folio(page)));
 
 	f2fs_do_read_inline_data(page, dn->inode_page);
 	set_page_dirty(page);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 12b1fef31f43..d7a5a88a1a5e 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -161,7 +161,8 @@ bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct page *page)
 	if (!f2fs_enable_inode_chksum(sbi, page))
 #else
 	if (!f2fs_enable_inode_chksum(sbi, page) ||
-			PageDirty(page) || PageWriteback(page))
+			PageDirty(page) ||
+			folio_test_writeback(page_folio(page)))
 #endif
 		return true;
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index bb57bbaff7b4..3b9eb5693683 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1743,7 +1743,7 @@ int f2fs_move_node_page(struct page *node_page, int gc_type)
 		goto release_page;
 	} else {
 		/* set page dirty and write it */
-		if (!PageWriteback(node_page))
+		if (!folio_test_writeback(page_folio(node_page)))
 			set_page_dirty(node_page);
 	}
 out_page:
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 4fd76e867e0a..065fd5919b48 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3612,13 +3612,13 @@ int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 	mutex_unlock(&curseg->curseg_mutex);
 	f2fs_up_read(&SM_I(sbi)->curseg_lock);
 	return 0;
+
 out_err:
 	*new_blkaddr = NULL_ADDR;
 	up_write(&sit_i->sentry_lock);
 	mutex_unlock(&curseg->curseg_mutex);
 	f2fs_up_read(&SM_I(sbi)->curseg_lock);
 	return ret;
-
 }
 
 void f2fs_update_device_state(struct f2fs_sb_info *sbi, nid_t ino,
@@ -3660,8 +3660,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 			&fio->new_blkaddr, sum, type, fio)) {
 		if (fscrypt_inode_uses_fs_layer_crypto(fio->page->mapping->host))
 			fscrypt_finalize_bounce_page(&fio->encrypted_page);
-		if (PageWriteback(fio->page))
-			end_page_writeback(fio->page);
+		end_page_writeback(fio->page);
 		if (f2fs_in_warm_node_list(fio->sbi, fio->page))
 			f2fs_del_fsync_node_entry(fio->sbi, fio->page);
 		goto out;
@@ -3904,7 +3903,7 @@ void f2fs_replace_block(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
 void f2fs_wait_on_page_writeback(struct page *page,
 				enum page_type type, bool ordered, bool locked)
 {
-	if (PageWriteback(page)) {
+	if (folio_test_writeback(page_folio(page))) {
 		struct f2fs_sb_info *sbi = F2FS_P_SB(page);
 
 		/* submit cached LFS IO */
@@ -3913,7 +3912,8 @@ void f2fs_wait_on_page_writeback(struct page *page,
 		f2fs_submit_merged_ipu_write(sbi, NULL, page);
 		if (ordered) {
 			wait_on_page_writeback(page);
-			f2fs_bug_on(sbi, locked && PageWriteback(page));
+			f2fs_bug_on(sbi, locked &&
+				folio_test_writeback(page_folio(page)));
 		} else {
 			wait_for_stable_page(page);
 		}
-- 
2.44.0.478.gd926399ef9-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
