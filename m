Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F9295074A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2024 16:14:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sdsHl-0002Qy-ET;
	Tue, 13 Aug 2024 14:14:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sdsHj-0002Qp-1y
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 14:14:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fv5AR5W3KMKZ5e07IpsLsS4ElWgcmPzeACpnc0VHM9I=; b=it2dZg9k4pvdhLb6mLKxdwJqh1
 E5jlylbM11prjfNmihHOEm0wlCWhyHNWidAhfBhd9HEU/5W3PIyfvXwuTyYlXqwEBTJGp5LuUm6UD
 v3FOzMFKU6BUExQSJ3bnVNMU/CPIT6JBOvcT/va0trNc3xWtVoQUlCyH2KuO3VWawv9E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fv5AR5W3KMKZ5e07IpsLsS4ElWgcmPzeACpnc0VHM9I=; b=e5CpcRkSI9/D7QYBTN4flvKI+7
 fRCzCHjiOXfpJuFvURwSJmefYOdbjwlNhuuaVavDGNsD5MSKFIowpcRvunj7KwX9+md7FZRMvnc5Z
 Ib1OTC4FCKwASbhc5PTa4MaOpjItCH6cjIrHGHLaCEK57/x4Q+/w/PMEIDWHFk4gR4qU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdsHi-0001D1-Tc for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 14:14:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9015C61722;
 Tue, 13 Aug 2024 14:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6733C4AF0F;
 Tue, 13 Aug 2024 14:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723558432;
 bh=CAOJ8mgA8jKzzI9hA7HpfYwAeUu6fh4NOYcV9F2ZHaw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jojLb2S8+RXDU3B+0dvEVenn7/GAwWb3Mu2ll6AbX3FJ+WXV0Ul8RFaFDRhqt2lAm
 Eyn1k3U1YVnoXMZrjxCmGRHdRlS8xIL5/BzSicOS/CkUwMXRc0S/VE2G/BpZ4F4w/k
 dBB6FWr3cf2GXDCdV/wExXZZQhhShlqJh70kMYz8XE+ATbLNZNfz/YGNohcpM5DVXB
 blgqcGLhod9jvLlJzDlQepVfEGQQyWpgXp5sMPm9U2YBZj20IR4lMoJDEpg3R7WFEN
 40HSY1IO/t4BvQ4i4T6uszN5J9GMXG6twUuW2mJkP/4D/61yQC1rHg3kSwhk+6iEgC
 OrEn7tvVBaDVg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 13 Aug 2024 22:13:27 +0800
Message-Id: <20240813141331.417067-5-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240813141331.417067-1-chao@kernel.org>
References: <20240813141331.417067-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert to use folio, so that we can get rid of 'page->index'
 to prepare for removal of 'index' field in structure page [1]. [1]
 https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/
 Cc: Matthew Wilcox <willy@infradead.org> Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/compress.c | 3 ++- fs/f2fs/data.c | 29 +++++++++++++++
 fs/f2fs/f2fs.h | 2 +- 3 files changed [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sdsHi-0001D1-Tc
Subject: [f2fs-dev] [PATCH 5/9] f2fs: convert f2fs_write_single_data_page()
 to use folio
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
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert to use folio, so that we can get rid of 'page->index' to
prepare for removal of 'index' field in structure page [1].

[1] https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/

Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c |  3 ++-
 fs/f2fs/data.c     | 29 +++++++++++++++--------------
 fs/f2fs/f2fs.h     |  2 +-
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index eb5cd1457ffc..82c31641e696 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1523,7 +1523,8 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 		if (!clear_page_dirty_for_io(cc->rpages[i]))
 			goto continue_unlock;
 
-		ret = f2fs_write_single_data_page(cc->rpages[i], &submitted,
+		ret = f2fs_write_single_data_page(page_folio(cc->rpages[i]),
+						&submitted,
 						NULL, NULL, wbc, io_type,
 						compr_blocks, false);
 		if (ret) {
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6d2a37db0c9e..0779e222f709 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2764,7 +2764,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	return err;
 }
 
-int f2fs_write_single_data_page(struct page *page, int *submitted,
+int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 				struct bio **bio,
 				sector_t *last_block,
 				struct writeback_control *wbc,
@@ -2772,12 +2772,13 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 				int compr_blocks,
 				bool allow_balance)
 {
-	struct inode *inode = page->mapping->host;
+	struct inode *inode = folio->mapping->host;
+	struct page *page = folio_page(folio, 0);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	loff_t i_size = i_size_read(inode);
 	const pgoff_t end_index = ((unsigned long long)i_size)
 							>> PAGE_SHIFT;
-	loff_t psize = (loff_t)(page->index + 1) << PAGE_SHIFT;
+	loff_t psize = (loff_t)(folio->index + 1) << PAGE_SHIFT;
 	unsigned offset = 0;
 	bool need_balance_fs = false;
 	bool quota_inode = IS_NOQUOTA(inode);
@@ -2801,11 +2802,11 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 		.last_block = last_block,
 	};
 
-	trace_f2fs_writepage(page_folio(page), DATA);
+	trace_f2fs_writepage(folio, DATA);
 
 	/* we should bypass data pages to proceed the kworker jobs */
 	if (unlikely(f2fs_cp_error(sbi))) {
-		mapping_set_error(page->mapping, -EIO);
+		mapping_set_error(folio->mapping, -EIO);
 		/*
 		 * don't drop any dirty dentry pages for keeping lastest
 		 * directory structure.
@@ -2823,7 +2824,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
 		goto redirty_out;
 
-	if (page->index < end_index ||
+	if (folio->index < end_index ||
 			f2fs_verity_in_progress(inode) ||
 			compr_blocks)
 		goto write;
@@ -2833,10 +2834,10 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 	 * this page does not have to be written to disk.
 	 */
 	offset = i_size & (PAGE_SIZE - 1);
-	if ((page->index >= end_index + 1) || !offset)
+	if ((folio->index >= end_index + 1) || !offset)
 		goto out;
 
-	zero_user_segment(page, offset, PAGE_SIZE);
+	folio_zero_segment(folio, offset, folio_size(folio));
 write:
 	/* Dentry/quota blocks are controlled by checkpoint */
 	if (S_ISDIR(inode->i_mode) || quota_inode) {
@@ -2896,7 +2897,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 out:
 	inode_dec_dirty_pages(inode);
 	if (err) {
-		ClearPageUptodate(page);
+		folio_clear_uptodate(folio);
 		clear_page_private_gcing(page);
 	}
 
@@ -2906,7 +2907,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 		f2fs_remove_dirty_inode(inode);
 		submitted = NULL;
 	}
-	unlock_page(page);
+	folio_unlock(folio);
 	if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode) &&
 			!F2FS_I(inode)->wb_task && allow_balance)
 		f2fs_balance_fs(sbi, need_balance_fs);
@@ -2924,7 +2925,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 	return 0;
 
 redirty_out:
-	redirty_page_for_writepage(wbc, page);
+	folio_redirty_for_writepage(wbc, folio);
 	/*
 	 * pageout() in MM translates EAGAIN, so calls handle_write_error()
 	 * -> mapping_set_error() -> set_bit(AS_EIO, ...).
@@ -2933,7 +2934,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 	 */
 	if (!err || wbc->for_reclaim)
 		return AOP_WRITEPAGE_ACTIVATE;
-	unlock_page(page);
+	folio_unlock(folio);
 	return err;
 }
 
@@ -2955,7 +2956,7 @@ static int f2fs_write_data_page(struct page *page,
 out:
 #endif
 
-	return f2fs_write_single_data_page(page, NULL, NULL, NULL,
+	return f2fs_write_single_data_page(page_folio(page), NULL, NULL, NULL,
 						wbc, FS_DATA_IO, 0, true);
 }
 
@@ -3165,7 +3166,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 				continue;
 			}
 #endif
-			ret = f2fs_write_single_data_page(&folio->page,
+			ret = f2fs_write_single_data_page(folio,
 					&submitted, &bio, &last_block,
 					wbc, io_type, 0, true);
 			if (ret == AOP_WRITEPAGE_ACTIVATE)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 7c7760aa1a7c..5800ac90a5f7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3881,7 +3881,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 int f2fs_encrypt_one_page(struct f2fs_io_info *fio);
 bool f2fs_should_update_inplace(struct inode *inode, struct f2fs_io_info *fio);
 bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio);
-int f2fs_write_single_data_page(struct page *page, int *submitted,
+int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 				struct bio **bio, sector_t *last_block,
 				struct writeback_control *wbc,
 				enum iostat_type io_type,
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
