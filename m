Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E016E0134
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Apr 2023 23:51:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmiNJ-0001Sl-0R;
	Wed, 12 Apr 2023 21:51:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pmiNH-0001Sf-K5
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 21:51:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bcfZVyELM/bzNCZfdWrJUWOr94lwzo0+0uLpxCelMd0=; b=JZtVFl3Gw4PSoHWtZfRVojoLoa
 imyOKtPW65LMSQLvEKXErWmR9k1X/DycNFem90zZjz4LDagNIwvIY+ajs9Fr/YqIZSiSF2VvxnInz
 lu/+c9Dq/piLq49pAwTDJ92yYpdZsZZHgGNTz6qNt2qzgif1rx7QYjDX8oaCWod+TnPQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bcfZVyELM/bzNCZfdWrJUWOr94lwzo0+0uLpxCelMd0=; b=ILhntvl9I1tU4PXAyS5fZorc6u
 K9WgjfO25iglG4CY81SxckVvMkw27MUoQ29WdlU7y/WZ3k5x0uRDNgBuuqh6iFTKnNODJe9wrYcXL
 +TvRANqzjgC2lplHQEXaSwra02fWJF0R8g3yvacv2FSmeS5KSscNalc9m2qapuf4lk+g=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmiNF-0003Dp-SL for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 21:51:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F86D631DC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Apr 2023 21:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4070C433EF;
 Wed, 12 Apr 2023 21:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681336283;
 bh=pWM7vq7Zdu7WuUxg21CbTFApSSLmEdHPy/g/M9rEKzs=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=Rg4Yot9kE2L6H48x5ApXRLZCw3AZUhyM0x+kvu/jmHVEizhVEptaknfQzdE96ukl7
 jN6g/59XCgskNto8tPxmP75Vf2Z/UJ2lv05I5w9cAjSyl7U+5+XeDFg4nfv8qHyShc
 zLWZM17rt/himcXH86xjc+DCc4tyTuIQKKsFZ9dZHz6OaDPaWp5w4NRORGNdAIB911
 btxaR0ngVfLtPBSZTHxFDpA5n63TR4d0MUl8x9zNUbQy1yvaoOUTs65LSZy9cq1b+h
 A7uaU164aGjy23XJmk7O/YrWTkvJrwldwXMe8G5pQuKLJDOMx0w912IR30rUyGaXKW
 w71llH3Rth9Pw==
Date: Wed, 12 Apr 2023 14:51:22 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <ZDcn2iZ0T1MunCK8@google.com>
References: <20230412160810.1534632-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230412160810.1534632-1-jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We have maintain PagePrivate and page_private and page
 reference
 w/ {set, clear}_page_private_*, it doesn't need to call folio_detach_private()
 in the end of .invalidate_folio and .release_folio, remov [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pmiNF-0003Dp-SL
Subject: Re: [f2fs-dev] [PATCH 1/2 v2] f2fs: remove set|get_private_inline
 to clean up
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We have maintain PagePrivate and page_private and page reference
w/ {set,clear}_page_private_*, it doesn't need to call
folio_detach_private() in the end of .invalidate_folio and
.release_folio, remove it and use f2fs_bug_on instead.

Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 - Testing this version which avoid remaining inline_data bit.

 fs/f2fs/data.c |  25 +-------
 fs/f2fs/dir.c  |   6 +-
 fs/f2fs/f2fs.h | 154 ++++++++++++++++++++++++-------------------------
 3 files changed, 77 insertions(+), 108 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5a3636b70f48..f21e3aaa2474 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3726,37 +3726,16 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
 			f2fs_remove_dirty_inode(inode);
 		}
 	}
-
-	clear_page_private_reference(&folio->page);
-	clear_page_private_gcing(&folio->page);
-
-	if (test_opt(sbi, COMPRESS_CACHE) &&
-			inode->i_ino == F2FS_COMPRESS_INO(sbi))
-		clear_page_private_data(&folio->page);
-
-	folio_detach_private(folio);
+	clear_page_private_all(&folio->page);
 }
 
 bool f2fs_release_folio(struct folio *folio, gfp_t wait)
 {
-	struct f2fs_sb_info *sbi;
-
 	/* If this is dirty folio, keep private data */
 	if (folio_test_dirty(folio))
 		return false;
 
-	sbi = F2FS_M_SB(folio->mapping);
-	if (test_opt(sbi, COMPRESS_CACHE)) {
-		struct inode *inode = folio->mapping->host;
-
-		if (inode->i_ino == F2FS_COMPRESS_INO(sbi))
-			clear_page_private_data(&folio->page);
-	}
-
-	clear_page_private_reference(&folio->page);
-	clear_page_private_gcing(&folio->page);
-
-	folio_detach_private(folio);
+	clear_page_private_all(&folio->page);
 	return true;
 }
 
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index d6dd8327e82d..887e55988450 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -905,14 +905,10 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct page *page,
 		f2fs_clear_page_cache_dirty_tag(page);
 		clear_page_dirty_for_io(page);
 		ClearPageUptodate(page);
-
-		clear_page_private_gcing(page);
+		clear_page_private_all(page);
 
 		inode_dec_dirty_pages(dir);
 		f2fs_remove_dirty_inode(dir);
-
-		detach_page_private(page);
-		set_page_private(page, 0);
 	}
 	f2fs_put_page(page, 1);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ede38bcef80e..6cae94d51821 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1398,86 +1398,6 @@ enum {
 	PAGE_PRIVATE_MAX
 };
 
-#define PAGE_PRIVATE_GET_FUNC(name, flagname) \
-static inline bool page_private_##name(struct page *page) \
-{ \
-	return PagePrivate(page) && \
-		test_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)) && \
-		test_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
-}
-
-#define PAGE_PRIVATE_SET_FUNC(name, flagname) \
-static inline void set_page_private_##name(struct page *page) \
-{ \
-	if (!PagePrivate(page)) { \
-		get_page(page); \
-		SetPagePrivate(page); \
-		set_page_private(page, 0); \
-	} \
-	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
-	set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
-}
-
-#define PAGE_PRIVATE_CLEAR_FUNC(name, flagname) \
-static inline void clear_page_private_##name(struct page *page) \
-{ \
-	clear_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
-	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) { \
-		set_page_private(page, 0); \
-		if (PagePrivate(page)) { \
-			ClearPagePrivate(page); \
-			put_page(page); \
-		}\
-	} \
-}
-
-PAGE_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);
-PAGE_PRIVATE_GET_FUNC(inline, INLINE_INODE);
-PAGE_PRIVATE_GET_FUNC(gcing, ONGOING_MIGRATION);
-PAGE_PRIVATE_GET_FUNC(dummy, DUMMY_WRITE);
-
-PAGE_PRIVATE_SET_FUNC(reference, REF_RESOURCE);
-PAGE_PRIVATE_SET_FUNC(inline, INLINE_INODE);
-PAGE_PRIVATE_SET_FUNC(gcing, ONGOING_MIGRATION);
-PAGE_PRIVATE_SET_FUNC(dummy, DUMMY_WRITE);
-
-PAGE_PRIVATE_CLEAR_FUNC(reference, REF_RESOURCE);
-PAGE_PRIVATE_CLEAR_FUNC(inline, INLINE_INODE);
-PAGE_PRIVATE_CLEAR_FUNC(gcing, ONGOING_MIGRATION);
-PAGE_PRIVATE_CLEAR_FUNC(dummy, DUMMY_WRITE);
-
-static inline unsigned long get_page_private_data(struct page *page)
-{
-	unsigned long data = page_private(page);
-
-	if (!test_bit(PAGE_PRIVATE_NOT_POINTER, &data))
-		return 0;
-	return data >> PAGE_PRIVATE_MAX;
-}
-
-static inline void set_page_private_data(struct page *page, unsigned long data)
-{
-	if (!PagePrivate(page)) {
-		get_page(page);
-		SetPagePrivate(page);
-		set_page_private(page, 0);
-	}
-	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page));
-	page_private(page) |= data << PAGE_PRIVATE_MAX;
-}
-
-static inline void clear_page_private_data(struct page *page)
-{
-	page_private(page) &= GENMASK(PAGE_PRIVATE_MAX - 1, 0);
-	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) {
-		set_page_private(page, 0);
-		if (PagePrivate(page)) {
-			ClearPagePrivate(page);
-			put_page(page);
-		}
-	}
-}
-
 /* For compression */
 enum compress_algorithm_type {
 	COMPRESS_LZO,
@@ -2372,6 +2292,80 @@ void f2fs_printk(struct f2fs_sb_info *sbi, const char *fmt, ...);
 #define f2fs_debug(sbi, fmt, ...)					\
 	f2fs_printk(sbi, KERN_DEBUG fmt, ##__VA_ARGS__)
 
+#define PAGE_PRIVATE_GET_FUNC(name, flagname) \
+static inline bool page_private_##name(struct page *page) \
+{ \
+	return PagePrivate(page) && \
+		test_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)) && \
+		test_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
+}
+
+#define PAGE_PRIVATE_SET_FUNC(name, flagname) \
+static inline void set_page_private_##name(struct page *page) \
+{ \
+	if (!PagePrivate(page)) \
+		attach_page_private(page, (void *)0); \
+	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
+	set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
+}
+
+#define PAGE_PRIVATE_CLEAR_FUNC(name, flagname) \
+static inline void clear_page_private_##name(struct page *page) \
+{ \
+	clear_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
+	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) \
+		detach_page_private(page); \
+}
+
+PAGE_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);
+PAGE_PRIVATE_GET_FUNC(inline, INLINE_INODE);
+PAGE_PRIVATE_GET_FUNC(gcing, ONGOING_MIGRATION);
+PAGE_PRIVATE_GET_FUNC(dummy, DUMMY_WRITE);
+
+PAGE_PRIVATE_SET_FUNC(reference, REF_RESOURCE);
+PAGE_PRIVATE_SET_FUNC(inline, INLINE_INODE);
+PAGE_PRIVATE_SET_FUNC(gcing, ONGOING_MIGRATION);
+PAGE_PRIVATE_SET_FUNC(dummy, DUMMY_WRITE);
+
+PAGE_PRIVATE_CLEAR_FUNC(reference, REF_RESOURCE);
+PAGE_PRIVATE_CLEAR_FUNC(inline, INLINE_INODE);
+PAGE_PRIVATE_CLEAR_FUNC(gcing, ONGOING_MIGRATION);
+PAGE_PRIVATE_CLEAR_FUNC(dummy, DUMMY_WRITE);
+
+static inline unsigned long get_page_private_data(struct page *page)
+{
+	unsigned long data = page_private(page);
+
+	if (!test_bit(PAGE_PRIVATE_NOT_POINTER, &data))
+		return 0;
+	return data >> PAGE_PRIVATE_MAX;
+}
+
+static inline void set_page_private_data(struct page *page, unsigned long data)
+{
+	if (!PagePrivate(page))
+		attach_page_private(page, (void *)0);
+	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page));
+	page_private(page) |= data << PAGE_PRIVATE_MAX;
+}
+
+static inline void clear_page_private_data(struct page *page)
+{
+	page_private(page) &= GENMASK(PAGE_PRIVATE_MAX - 1, 0);
+	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER))
+		detach_page_private(page);
+}
+
+static inline void clear_page_private_all(struct page *page)
+{
+	clear_page_private_data(page);
+	clear_page_private_reference(page);
+	clear_page_private_gcing(page);
+	clear_page_private_inline(page);
+
+	f2fs_bug_on(F2FS_P_SB(page), page_private(page));
+}
+
 static inline void dec_valid_block_count(struct f2fs_sb_info *sbi,
 						struct inode *inode,
 						block_t count)
-- 
2.40.0.577.gac1e443424-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
