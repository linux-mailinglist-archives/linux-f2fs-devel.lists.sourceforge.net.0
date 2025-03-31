Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B9CA76E92
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLW7-0004HC-Hc;
	Mon, 31 Mar 2025 20:13:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVv-00040R-1H
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oKWkkBGahzX1HGDz8cySknZkKvs9nklRxu1+zdalpPs=; b=evGzfHS79LCYUclhsmHQ+yd54B
 2RuHHDy6LzUn8dl+L5gVQJG6whZNkqg3aorLfUKIswa0g/sfLyeqDRGrdJLSIwKYXdbA4ERqAltE8
 fbixbe7q+51srkBu0hfFjtc5wqZ/GfLS2lSgSZm5986u5AIkUXowzMjvpIEvYG4Igs6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oKWkkBGahzX1HGDz8cySknZkKvs9nklRxu1+zdalpPs=; b=nV+yte15UIlOBCivUbmm2cP1PO
 grxN6PhumV5KBGIdrfJtnKgAvCK139+6Lb4GGmXmXYKxmDCbKlIHgFvqeprhE8oN+rVwp7H/nISPi
 JZSYgUMIXaIyQHQpiKPvo7TV3LKjBm6qkH6PuS/RxM3o4DNBYFSBCZEOImL1W/GyIvzI=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVp-0003i5-85 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=oKWkkBGahzX1HGDz8cySknZkKvs9nklRxu1+zdalpPs=; b=Rin5WO5RQWMOusUV21I+6WSKYh
 1aZc3h0gcFmnaU5yVmnWj55mmuXwJICNaWsCaOcd+XZRtQKpB93Crh8SOJz8Jhv/89ypRPJgsgloC
 6loYvpOXORqvstYC6jDOIT3JwAlgsmP9n9zKLDt9evjjMNQf4rz43eWn0hgC2l2End+KLYeOjrage
 yJH2fJ/uRCQY7LSB41BaukWyw1paAPwxgBGo+CFnofpR9TVyvBdh8dGkpaCNYisZe6ralJYEi5XMt
 wrVe3kYbb2CjuMT/WenBwoOPfAnTVf4OzSAuNP1QSY4PueDH4e6rCCGn5cbAlXoz4HKwD4VW7xt7V
 jFPsMVUw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVd-00000004ScX-2uQy;
 Mon, 31 Mar 2025 20:13:25 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:44 +0100
Message-ID: <20250331201256.1057782-145-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The only caller alredy has a folio so pass it in. Remove two
 calls to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/extent_cache.c | 8 ++++---- fs/f2fs/f2fs.h | 2 +- fs/f2fs/inode.c
 | 2 +- 3 files changed, 6 insertions(+), 6 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVp-0003i5-85
Subject: [f2fs-dev] [PATCH 144/153] f2fs: Pass a folio to
 f2fs_init_read_extent_tree()
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

The only caller alredy has a folio so pass it in.  Remove two calls
to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/extent_cache.c | 8 ++++----
 fs/f2fs/f2fs.h         | 2 +-
 fs/f2fs/inode.c        | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 347b3b647834..eabf49beebc1 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -407,11 +407,11 @@ static void __drop_largest_extent(struct extent_tree *et,
 	}
 }
 
-void f2fs_init_read_extent_tree(struct inode *inode, struct page *ipage)
+void f2fs_init_read_extent_tree(struct inode *inode, struct folio *ifolio)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct extent_tree_info *eti = &sbi->extent_tree[EX_READ];
-	struct f2fs_extent *i_ext = &F2FS_INODE(ipage)->i_ext;
+	struct f2fs_extent *i_ext = &F2FS_INODE(&ifolio->page)->i_ext;
 	struct extent_tree *et;
 	struct extent_node *en;
 	struct extent_info ei;
@@ -419,9 +419,9 @@ void f2fs_init_read_extent_tree(struct inode *inode, struct page *ipage)
 	if (!__may_extent_tree(inode, EX_READ)) {
 		/* drop largest read extent */
 		if (i_ext->len) {
-			f2fs_wait_on_page_writeback(ipage, NODE, true, true);
+			f2fs_folio_wait_writeback(ifolio, NODE, true, true);
 			i_ext->len = 0;
-			set_page_dirty(ipage);
+			folio_mark_dirty(ifolio);
 		}
 		set_inode_flag(inode, FI_NO_EXTENT);
 		return;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e459558fc071..ff0b1d57e103 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4332,7 +4332,7 @@ int __init f2fs_create_extent_cache(void);
 void f2fs_destroy_extent_cache(void);
 
 /* read extent cache ops */
-void f2fs_init_read_extent_tree(struct inode *inode, struct page *ipage);
+void f2fs_init_read_extent_tree(struct inode *inode, struct folio *ifolio);
 bool f2fs_lookup_read_extent_cache(struct inode *inode, pgoff_t pgofs,
 			struct extent_info *ei);
 bool f2fs_lookup_read_extent_cache_block(struct inode *inode, pgoff_t index,
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index add82902826f..0d45e3a249f8 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -531,7 +531,7 @@ static int do_read_inode(struct inode *inode)
 	}
 
 	/* Need all the flag bits */
-	f2fs_init_read_extent_tree(inode, &node_folio->page);
+	f2fs_init_read_extent_tree(inode, node_folio);
 	f2fs_init_age_extent_tree(inode);
 
 	f2fs_folio_put(node_folio, true);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
