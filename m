Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E3EAFD454
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33qZE+YkzLg0iZHHnKZhXlj+nNadfTNFSMkSth8IyZA=; b=DKciQ8r6Yd2zYxMQ1ArURdSi91
	I8gZrjI17ei/778l6N0mqDkvBIiYOHagIxQue6E7rssbasConM5Ywcw8UW2QmLQZNXQOZ8VJ0gwwR
	+tgG2R9jrzCKVDvBnDIjXpr2okroqeYC0FYaxS0tpD8KNjuRPeyTAmgSDD86aQ2dwGUs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBk2-0005Zh-Nd;
	Tue, 08 Jul 2025 17:04:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBju-0005WL-90
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bPpxCddO1YNWPXq/fDaWYHscJHV7G9GbUTfc3TIDZqw=; b=YUxZ45cinmMPQ6TevuuRm9sLDe
 Zwa8YHXsfXeMOZSkwjOHCp7hfhPVa0ChyrolpkY2GHLayLdLKKQYTE5e3ASzFjQ/girL2ss4hHSKY
 riWhi4wfat8MBvvq+GRWLRBDFHocOWuGkq1LDPS20o8IzDB4UaNQK5kIv/pjtZ5DqAyk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bPpxCddO1YNWPXq/fDaWYHscJHV7G9GbUTfc3TIDZqw=; b=dz588w/WYHaalgWPY51QB9w4FR
 FUSNwLcqYcKLi1RKVn+vUGr7gVcDe9RxJ51N4XfHc4mo4y0/2SWuMgM9sGSiITWxb2mI0guLSTm6E
 k7ueECWDe220cYfV+DhuKN03Jm94IqbqRnuwGebpdgrRmlvqA/u256OnpQrebHSrRUIM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjs-0006F0-1n for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=bPpxCddO1YNWPXq/fDaWYHscJHV7G9GbUTfc3TIDZqw=; b=fxTpQvkpriQbX63MhwnXg2B5Do
 LWlezKUXbjonlFI+Czv9ay0EPHMvVP2CBKB4qggXv2W626fIMWFUBpe4xpqFJSQ9Idw1KnfUEaOuE
 S/iGjvWTbAWMvfwQnzEbq58vV8VqSXO68Nyno/5o0HMSC1kCTQU3oCMvJecfYNAF7qa8XTGlZiHkn
 gISNADDESEbOeUvR6xJS7/Yx8Fq3LS/HGxajYHhJmHYYQn4WutGT9w44oKX3mbEPhKJ/AO8T/khRQ
 e+5HI4FOAjwe2YzslaFA7BIJ2uhtxNt6zJVfLL+Ws25jl8zhKHMstqXlt5sgS55kIiEqp9DfelcTg
 0bmD+gUQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjl-00000000T9F-2PR5;
 Tue, 08 Jul 2025 17:04:09 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:53 +0100
Message-ID: <20250708170359.111653-57-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: All callers can simply call folio_detach_private(). This was
 the only way that clear_page_private_data() could be called, so remove that
 too. Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/data.c
 | 4 ++-- fs/f2fs/dir.c | 2 +- fs/f2fs/f2fs.h | 18 3 files changed,
 3 insertions(+), 21 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uZBjs-0006F0-1n
Subject: [f2fs-dev] [PATCH 56/60] f2fs: Remove clear_page_private_all()
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

All callers can simply call folio_detach_private().  This was the
only way that clear_page_private_data() could be called, so remove
that too.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c |  4 ++--
 fs/f2fs/dir.c  |  2 +-
 fs/f2fs/f2fs.h | 18 ------------------
 3 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 942aaf10b78b..72565841a16c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3728,7 +3728,7 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
 			f2fs_remove_dirty_inode(inode);
 		}
 	}
-	clear_page_private_all(&folio->page);
+	folio_detach_private(folio);
 }
 
 bool f2fs_release_folio(struct folio *folio, gfp_t wait)
@@ -3737,7 +3737,7 @@ bool f2fs_release_folio(struct folio *folio, gfp_t wait)
 	if (folio_test_dirty(folio))
 		return false;
 
-	clear_page_private_all(&folio->page);
+	folio_detach_private(folio);
 	return true;
 }
 
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 888dca7e82ac..fffd7749d6d1 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -897,7 +897,7 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct folio *folio,
 		f2fs_clear_page_cache_dirty_tag(folio);
 		folio_clear_dirty_for_io(folio);
 		folio_clear_uptodate(folio);
-		clear_page_private_all(&folio->page);
+		folio_detach_private(folio);
 
 		inode_dec_dirty_pages(dir);
 		f2fs_remove_dirty_inode(dir);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1650610556e3..1ea8ecffec83 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2547,24 +2547,6 @@ static inline void folio_set_f2fs_data(struct folio *folio, unsigned long data)
 		folio->private = (void *)((unsigned long)folio->private | data);
 }
 
-static inline void clear_page_private_data(struct page *page)
-{
-	page_private(page) &= GENMASK(PAGE_PRIVATE_MAX - 1, 0);
-	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER))
-		detach_page_private(page);
-}
-
-static inline void clear_page_private_all(struct page *page)
-{
-	clear_page_private_data(page);
-	clear_page_private_reference(page);
-	clear_page_private_gcing(page);
-	clear_page_private_inline(page);
-	clear_page_private_atomic(page);
-
-	f2fs_bug_on(F2FS_P_SB(page), page_private(page));
-}
-
 static inline void dec_valid_block_count(struct f2fs_sb_info *sbi,
 						struct inode *inode,
 						block_t count)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
