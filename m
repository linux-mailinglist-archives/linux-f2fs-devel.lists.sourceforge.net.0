Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D71C8250B1C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Aug 2020 23:49:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kAKKq-0006M1-Cl; Mon, 24 Aug 2020 21:49:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1kAKKp-0006Lu-7U
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 21:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DBR5Fp4FeMLTXbHKHs/oT7OXQ2LJWa8ts52qpCNQqq0=; b=ityMFduBxybWIdFBMkSePvcdus
 BO4Sub0QVZwt80V+B8x8NbunbqlnhztdSwZPLEgj4YG2CAAT0H9m/FnYPrBKU2c5J708b/u9bDviq
 InZpTVDcCcSW24TzuD9R6IJyeYPS+K3Xw7XVA2szs7arGYj/7mHzWbwDB1YX2Uinhi2Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DBR5Fp4FeMLTXbHKHs/oT7OXQ2LJWa8ts52qpCNQqq0=; b=b
 VXralG2EdKqyRAjcai8GQ0l1/HbW61KaHyzUYcgI3M17gMg62BWcNOdFzbvG8VIQFeMLLhvbz6Zea
 +rjEFyBfOXe4+BwCZsbdyzRCjakVQNr+1cO+KYGVNTCQrRbPazSdIaJDKUbeYsfMCMRmE19BkHJT+
 9RdqZqobbTHtMSVY=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kAKKn-005bxF-1e
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 21:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=DBR5Fp4FeMLTXbHKHs/oT7OXQ2LJWa8ts52qpCNQqq0=; b=WeGEh6d1ORkwoAM1hC8njVK2wf
 mH1I2kwXEzglmzZ+gMpy5JZFSRsVVYeT1ii0no5STYlh/bD3fwK0QzP9ect+nLrb9OK6nXAp5PUi5
 R6HxJwiligukjP3KHds+Ccuec3uV7boGPG3wY2lNmKlcXaCvh3pe1VHgTHoKLXpAvtMFZR3MJ0NQD
 75RavrHPVaeua9hSfLU2H2j83Q/suoMB5DkM83fTaeRfkPXJfDM72gH8NjVbK9oiZU97oyKlTSCE1
 svWoxHi64X3crotSmrHAQSXI8hn/4Fik5Up8R0Ql+tTnU8UX7BpiVxPx+Ib68kE5ceWQdya7DJKf8
 iF8bdU+A==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kAKKY-0004T5-Dl; Mon, 24 Aug 2020 21:48:42 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 24 Aug 2020 22:48:41 +0100
Message-Id: <20200824214841.17132-1-willy@infradead.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kAKKn-005bxF-1e
Subject: [f2fs-dev] [PATCH] f2fs: Simplify SEEK_DATA implementation
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
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Instead of finding the first dirty page and then seeing if it matches
the index of a block that is NEW_ADDR, delay the lookup of the dirty
bit until we've actually found a block that's NEW_ADDR.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/file.c | 35 ++++++++---------------------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 8a422400e824..14f478871698 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -376,32 +376,15 @@ int f2fs_sync_file(struct file *file, loff_t start, loff_t end, int datasync)
 	return f2fs_do_sync_file(file, start, end, datasync, false);
 }
 
-static pgoff_t __get_first_dirty_index(struct address_space *mapping,
-						pgoff_t pgofs, int whence)
-{
-	struct page *page;
-	int nr_pages;
-
-	if (whence != SEEK_DATA)
-		return 0;
-
-	/* find first dirty page index */
-	nr_pages = find_get_pages_tag(mapping, &pgofs, PAGECACHE_TAG_DIRTY,
-				      1, &page);
-	if (!nr_pages)
-		return ULONG_MAX;
-	pgofs = page->index;
-	put_page(page);
-	return pgofs;
-}
-
-static bool __found_offset(struct f2fs_sb_info *sbi, block_t blkaddr,
-				pgoff_t dirty, pgoff_t pgofs, int whence)
+static bool __found_offset(struct address_space *mapping, block_t blkaddr,
+				pgoff_t index, int whence)
 {
 	switch (whence) {
 	case SEEK_DATA:
-		if ((blkaddr == NEW_ADDR && dirty == pgofs) ||
-			__is_valid_data_blkaddr(blkaddr))
+		if (__is_valid_data_blkaddr(blkaddr))
+			return true;
+		if (blkaddr == NEW_ADDR &&
+		    xa_get_mark(&mapping->i_pages, index, PAGECACHE_TAG_DIRTY))
 			return true;
 		break;
 	case SEEK_HOLE:
@@ -417,7 +400,7 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 	struct inode *inode = file->f_mapping->host;
 	loff_t maxbytes = inode->i_sb->s_maxbytes;
 	struct dnode_of_data dn;
-	pgoff_t pgofs, end_offset, dirty;
+	pgoff_t pgofs, end_offset;
 	loff_t data_ofs = offset;
 	loff_t isize;
 	int err = 0;
@@ -437,8 +420,6 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 
 	pgofs = (pgoff_t)(offset >> PAGE_SHIFT);
 
-	dirty = __get_first_dirty_index(inode->i_mapping, pgofs, whence);
-
 	for (; data_ofs < isize; data_ofs = (loff_t)pgofs << PAGE_SHIFT) {
 		set_new_dnode(&dn, inode, NULL, NULL, 0);
 		err = f2fs_get_dnode_of_data(&dn, pgofs, LOOKUP_NODE);
@@ -471,7 +452,7 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 				goto fail;
 			}
 
-			if (__found_offset(F2FS_I_SB(inode), blkaddr, dirty,
+			if (__found_offset(file->f_mapping, blkaddr,
 							pgofs, whence)) {
 				f2fs_put_dnode(&dn);
 				goto found;
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
