Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B13A96DFAD9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Apr 2023 18:08:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmd1L-0003VA-KS;
	Wed, 12 Apr 2023 16:08:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pmd1K-0003V4-GN
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 16:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bL7JW7lTDok36JATXOIdhDtgRJiR9tQwFaIM0C0N7Tw=; b=NUQ3VYnAsvwtSPret28cM251G9
 54eHZ/LcsVsPVSsDZ1KpjGPQ0vWVj/k+KgH+YdTjBugqi6J738e/RskBlZSbfc9fUh3r6Mr4IcM7T
 kLluPZDc8HEUNiHkQP5nOHV7+/etSilZEt5r9ALVmkWFTh37wapePqn2iwoDrHiiNvbE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bL7JW7lTDok36JATXOIdhDtgRJiR9tQwFaIM0C0N7Tw=; b=W
 /V96qHoHGNLpwW3MbcypmqoQYqFpn2pNWQCiJis0azL2PnwnPd2w2fjSD1qbHFpT6fg0N+6yG8P5n
 sUW7ZRwzcYLYwA/V87QvSghq5fwQ9/uypmQcEugIHF3AQmFbu2gJLybi9T8xeijg32SVv3MkCIaOf
 z/0rS9kuNWCsQN+M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmd1I-005RHm-Ec for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 16:08:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 32753636BC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Apr 2023 16:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DED6C433EF;
 Wed, 12 Apr 2023 16:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681315701;
 bh=8XI4VwX95L0aDd5aZfR4XLw/V4QhNPw/aWXcf8kuWVA=;
 h=From:To:Cc:Subject:Date:From;
 b=nvruxvKHd7lTHzaainaw/rcOvL1cB+msXQGIwwJMdiXF6DS+qiScPwmjLT7AeN6e3
 YKiBXJxocqpa8nLtvoJOesaGOdULmPEIagNRsx1b8kOZ9ayF8UvFyL98l+r4aGIy72
 h8HC6Ls3rzvHcoQeWcEkiXmk3s0zX+UgoyRelhUg+GpJgSN46cEd0gAGFfeNFVRt5J
 oTeyk+CRAXS2IcexL1AoJKOZKPgL0MGHuu7z0nYbXruqZKi+J/R461jFek4SMxaZ6G
 ckvmuIN95v8e+b/YmOiovuWlS4UxKMAlSoG+0F5fnHy9QCLXRUEgOcQqtOWGl7A2Rg
 QhBsQ2PrW59yQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 12 Apr 2023 09:08:09 -0700
Message-Id: <20230412160810.1534632-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.40.0.577.gac1e443424-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: 2049d4fcb057 ("f2fs: avoid multiple node page writes due to
 inline_data") introduced flushing inline_data when flushing node pages.
 b763f3bedc2d
 ("f2fs: restructure f2fs page.private layout") Replace PageChecked with
 PagePrivate
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pmd1I-005RHm-Ec
Subject: [f2fs-dev] [PATCH 1/2] f2fs: remove set|get_private_inline to clean
 up
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

2049d4fcb057 ("f2fs: avoid multiple node page writes due to inline_data")
introduced flushing inline_data when flushing node pages.

b763f3bedc2d ("f2fs: restructure f2fs page.private layout")
Replace PageChecked with PagePrivate

But, it turned out the bit was not cleared in corner case.
Let's revert the original hack and rely on the generic write path to flush
inline_data.

Fixes: 2049d4fcb057 ("f2fs: avoid multiple node page writes due to inline_data")
Fixes: b763f3bedc2d ("f2fs: restructure f2fs page.private layout")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c   |  2 --
 fs/f2fs/f2fs.h   |  9 ++-------
 fs/f2fs/inline.c |  2 --
 fs/f2fs/inode.c  |  4 ----
 fs/f2fs/node.c   | 52 ------------------------------------------------
 5 files changed, 2 insertions(+), 67 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5a3636b70f48..14cd647d727d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3389,8 +3389,6 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 		if (pos + len <= MAX_INLINE_DATA(inode)) {
 			f2fs_do_read_inline_data(page, ipage);
 			set_inode_flag(inode, FI_DATA_EXIST);
-			if (inode->i_nlink)
-				set_page_private_inline(ipage);
 			goto out;
 		}
 		err = f2fs_convert_inline_page(&dn, page);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ede38bcef80e..200fb2243e8a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1382,9 +1382,8 @@ static inline void f2fs_clear_bit(unsigned int nr, char *addr);
  * bit 0	PAGE_PRIVATE_NOT_POINTER
  * bit 1	PAGE_PRIVATE_DUMMY_WRITE
  * bit 2	PAGE_PRIVATE_ONGOING_MIGRATION
- * bit 3	PAGE_PRIVATE_INLINE_INODE
- * bit 4	PAGE_PRIVATE_REF_RESOURCE
- * bit 5-	f2fs private data
+ * bit 3	PAGE_PRIVATE_REF_RESOURCE
+ * bit 4-	f2fs private data
  *
  * Layout B: lowest bit should be 0
  * page.private is a wrapped pointer.
@@ -1393,7 +1392,6 @@ enum {
 	PAGE_PRIVATE_NOT_POINTER,		/* private contains non-pointer data */
 	PAGE_PRIVATE_DUMMY_WRITE,		/* data page for padding aligned IO */
 	PAGE_PRIVATE_ONGOING_MIGRATION,		/* data page which is on-going migrating */
-	PAGE_PRIVATE_INLINE_INODE,		/* inode page contains inline data */
 	PAGE_PRIVATE_REF_RESOURCE,		/* dirty page has referenced resources */
 	PAGE_PRIVATE_MAX
 };
@@ -1432,17 +1430,14 @@ static inline void clear_page_private_##name(struct page *page) \
 }
 
 PAGE_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);
-PAGE_PRIVATE_GET_FUNC(inline, INLINE_INODE);
 PAGE_PRIVATE_GET_FUNC(gcing, ONGOING_MIGRATION);
 PAGE_PRIVATE_GET_FUNC(dummy, DUMMY_WRITE);
 
 PAGE_PRIVATE_SET_FUNC(reference, REF_RESOURCE);
-PAGE_PRIVATE_SET_FUNC(inline, INLINE_INODE);
 PAGE_PRIVATE_SET_FUNC(gcing, ONGOING_MIGRATION);
 PAGE_PRIVATE_SET_FUNC(dummy, DUMMY_WRITE);
 
 PAGE_PRIVATE_CLEAR_FUNC(reference, REF_RESOURCE);
-PAGE_PRIVATE_CLEAR_FUNC(inline, INLINE_INODE);
 PAGE_PRIVATE_CLEAR_FUNC(gcing, ONGOING_MIGRATION);
 PAGE_PRIVATE_CLEAR_FUNC(dummy, DUMMY_WRITE);
 
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 4638fee16a91..c9ede493f8cc 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -188,7 +188,6 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
 
 	/* clear inline data and flag after data writeback */
 	f2fs_truncate_inline_inode(dn->inode, dn->inode_page, 0);
-	clear_page_private_inline(dn->inode_page);
 clear_out:
 	stat_dec_inline_inode(dn->inode);
 	clear_inode_flag(dn->inode, FI_INLINE_DATA);
@@ -267,7 +266,6 @@ int f2fs_write_inline_data(struct inode *inode, struct page *page)
 	set_inode_flag(inode, FI_APPEND_WRITE);
 	set_inode_flag(inode, FI_DATA_EXIST);
 
-	clear_page_private_inline(dn.inode_page);
 	f2fs_put_dnode(&dn);
 	return 0;
 }
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index cf4327ad106c..336f92afb7e7 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -699,10 +699,6 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
 
 	__set_inode_rdev(inode, ri);
 
-	/* deleted inode */
-	if (inode->i_nlink == 0)
-		clear_page_private_inline(node_page);
-
 	init_idisk_time(inode);
 #ifdef CONFIG_F2FS_CHECK_FS
 	f2fs_inode_chksum_set(F2FS_I_SB(inode), node_page);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index bd1dad523796..8bdcf80ca07a 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1479,42 +1479,6 @@ struct page *f2fs_get_node_page_ra(struct page *parent, int start)
 	return __get_node_page(sbi, nid, parent, start);
 }
 
-static void flush_inline_data(struct f2fs_sb_info *sbi, nid_t ino)
-{
-	struct inode *inode;
-	struct page *page;
-	int ret;
-
-	/* should flush inline_data before evict_inode */
-	inode = ilookup(sbi->sb, ino);
-	if (!inode)
-		return;
-
-	page = f2fs_pagecache_get_page(inode->i_mapping, 0,
-					FGP_LOCK|FGP_NOWAIT, 0);
-	if (!page)
-		goto iput_out;
-
-	if (!PageUptodate(page))
-		goto page_out;
-
-	if (!PageDirty(page))
-		goto page_out;
-
-	if (!clear_page_dirty_for_io(page))
-		goto page_out;
-
-	ret = f2fs_write_inline_data(inode, page);
-	inode_dec_dirty_pages(inode);
-	f2fs_remove_dirty_inode(inode);
-	if (ret)
-		set_page_dirty(page);
-page_out:
-	f2fs_put_page(page, 1);
-iput_out:
-	iput(inode);
-}
-
 static struct page *last_fsync_dnode(struct f2fs_sb_info *sbi, nid_t ino)
 {
 	pgoff_t index;
@@ -1918,14 +1882,6 @@ void f2fs_flush_inline_data(struct f2fs_sb_info *sbi)
 				/* someone wrote it for us */
 				goto continue_unlock;
 			}
-
-			/* flush inline_data, if it's async context. */
-			if (page_private_inline(page)) {
-				clear_page_private_inline(page);
-				unlock_page(page);
-				flush_inline_data(sbi, ino_of_node(page));
-				continue;
-			}
 			unlock_page(page);
 		}
 		folio_batch_release(&fbatch);
@@ -2000,14 +1956,6 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 			if (!do_balance)
 				goto write_node;
 
-			/* flush inline_data */
-			if (page_private_inline(page)) {
-				clear_page_private_inline(page);
-				unlock_page(page);
-				flush_inline_data(sbi, ino_of_node(page));
-				goto lock_node;
-			}
-
 			/* flush dirty inode */
 			if (IS_INODE(page) && flush_dirty_inode(page))
 				goto lock_node;
-- 
2.40.0.577.gac1e443424-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
