Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DD3950749
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2024 16:14:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sdsHk-0007JG-Qa;
	Tue, 13 Aug 2024 14:14:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sdsHi-0007J5-L2
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 14:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nu4q/nFZYYBYeYZkY4mJDO7VXvwLTIoN1gM1xC/rvio=; b=RdjMcmyMb09EthTXgjO0eRyeod
 RsRVIetihcoyxKeC5OWnyfhSV4g1rU/LYsiyudVNqVK8CJdfUq+oTDe3/EftsI2AxhWfjIDitVvAj
 J19Sl/bZY8IMDpuiP6pbiiE7IwXn7t7Y74jrknqqcq1PKyK46hdZOo8HiWgGEFtIQ6nc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nu4q/nFZYYBYeYZkY4mJDO7VXvwLTIoN1gM1xC/rvio=; b=MJeEEqo/vlHefjg2bkluEDHywu
 CMQ2hAhdRQAngkYZMGgHgabBRJ4y2BJRw7riu+54HnxBun3vsknuIN6AN/STaJsIC/0SV65Q7TfxP
 SxId1LDpVchB2PsZyOUtMyLCsBe/4UeKojVp+r0UsY/BBhTh1KliTGPeTj3F3y75DHbI=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdsHg-0001Cs-U4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 14:14:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3E5ACCE13CA;
 Tue, 13 Aug 2024 14:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F278BC4AF09;
 Tue, 13 Aug 2024 14:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723558428;
 bh=eWtrXzMhJKS5xOWZigySRTMy/cUMuJ5/xx/SVnO/CfE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=deSS6dQWX6MhyUkHKOW35OnUJXdbXGhjTAED2iUx20cNK7aJallgy3rIyQ1jlXP23
 o58u1wZSlop3de6DqDEwwyRCEY9DF85+1eNYjfKxMNLXfXvfLhAFNDW6KnvbZa6Ss5
 RxtFQfYz2MCMpny54vB2qv81YayXky0y9l0rIsT6zQbLnzj32w0uf3+IRYPFJI7gN/
 aWmhxuwul5XvIW5LukXURj9dqVIy9fJ0iNNJwzLZPjYVrDuTdCAM8eymv1NbfoJzzw
 z7haXumUHWmdZTrXHy8lDCs95z/GBNzJUn4ROcm5UFNIR/lnFGWTpZXTym3tPNEM+9
 m49vf8yl4rPpg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 13 Aug 2024 22:13:25 +0800
Message-Id: <20240813141331.417067-3-chao@kernel.org>
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
 --- fs/f2fs/data.c | 3 +-- fs/f2fs/dir.c | 2 +- fs/f2fs/f2fs.h | 2 +-
 fs/f2fs/inline.c | 2 +- fs/f2fs/node.c | 2 +- 5 [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
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
X-Headers-End: 1sdsHg-0001Cs-U4
Subject: [f2fs-dev] [PATCH 3/9] f2fs: convert
 f2fs_clear_page_cache_dirty_tag() to use folio
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
 fs/f2fs/data.c   | 3 +--
 fs/f2fs/dir.c    | 2 +-
 fs/f2fs/f2fs.h   | 2 +-
 fs/f2fs/inline.c | 2 +-
 fs/f2fs/node.c   | 2 +-
 5 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 100b6526717f..0df5a0c66ede 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4117,9 +4117,8 @@ const struct address_space_operations f2fs_dblock_aops = {
 	.swap_deactivate = f2fs_swap_deactivate,
 };
 
-void f2fs_clear_page_cache_dirty_tag(struct page *page)
+void f2fs_clear_page_cache_dirty_tag(struct folio *folio)
 {
-	struct folio *folio = page_folio(page);
 	struct address_space *mapping = folio->mapping;
 	unsigned long flags;
 
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 14900ca8a9ff..5fcc952107e9 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -868,7 +868,7 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct page *page,
 
 	if (bit_pos == NR_DENTRY_IN_BLOCK &&
 		!f2fs_truncate_hole(dir, page->index, page->index + 1)) {
-		f2fs_clear_page_cache_dirty_tag(page);
+		f2fs_clear_page_cache_dirty_tag(page_folio(page));
 		clear_page_dirty_for_io(page);
 		ClearPageUptodate(page);
 		clear_page_private_all(page);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index df436dd3aac1..a4b90215a51f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3890,7 +3890,7 @@ void f2fs_write_failed(struct inode *inode, loff_t to);
 void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
 bool f2fs_release_folio(struct folio *folio, gfp_t wait);
 bool f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len);
-void f2fs_clear_page_cache_dirty_tag(struct page *page);
+void f2fs_clear_page_cache_dirty_tag(struct folio *folio);
 int f2fs_init_post_read_processing(void);
 void f2fs_destroy_post_read_processing(void);
 int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index d76a3bed7093..98d122164cd1 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -281,7 +281,7 @@ int f2fs_write_inline_data(struct inode *inode, struct page *page)
 			 page, 0, MAX_INLINE_DATA(inode));
 	set_page_dirty(ipage);
 
-	f2fs_clear_page_cache_dirty_tag(page);
+	f2fs_clear_page_cache_dirty_tag(page_folio(page));
 
 	set_inode_flag(inode, FI_APPEND_WRITE);
 	set_inode_flag(inode, FI_DATA_EXIST);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 9e7a6e21f30c..20518c12f5b7 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -123,7 +123,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 static void clear_node_page_dirty(struct page *page)
 {
 	if (PageDirty(page)) {
-		f2fs_clear_page_cache_dirty_tag(page);
+		f2fs_clear_page_cache_dirty_tag(page_folio(page));
 		clear_page_dirty_for_io(page);
 		dec_page_count(F2FS_P_SB(page), F2FS_DIRTY_NODES);
 	}
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
