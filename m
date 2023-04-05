Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFFB6D88DE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 22:43:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pk9yc-0003QJ-IY;
	Wed, 05 Apr 2023 20:43:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pk9ya-0003QD-Ok
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 20:43:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JniBpkCHHAEoMHOK1pvPuRbN+M6IRib/BlHFmE8D0Sg=; b=H5qR7nNzOoArhOYC6zLk8lcvpg
 GQJUUrJqy1SE9lGw0QHmbUU9RtQSdIo7sERchk8vo0lHY0bzkE/BORp7ooOsowr/DGEMnQfYBONDx
 YspY5IYEP/Geo6GF29S2gNa06+PIMT9JucjkveacBFblQmds7H+8bnslhO0QJREU5JfA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JniBpkCHHAEoMHOK1pvPuRbN+M6IRib/BlHFmE8D0Sg=; b=I
 d0vl7s30jEEeMFf+5A7m+q9fvchLqSm2jXe3OUKhy5BjrYRlPU3m2nUJ4zrLdUXBLBorbdRl0RZ0l
 4mQDsLmVugYpYme3qlPKshEq3gqPTkNkHhe0MMS4x6ZhxPpTAZJhHxZdkiWZ5pyD5YkALz8pLgB+w
 QA0OR36GguyzqUqU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pk9ya-0001W5-8S for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 20:43:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CCE8A6286E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  5 Apr 2023 20:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32284C433EF;
 Wed,  5 Apr 2023 20:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680727402;
 bh=6e4aZuW0CQQJwSrwrHjU6vWTR/ojeKCfsa6BmYjfvTA=;
 h=From:To:Cc:Subject:Date:From;
 b=kVU7e56XTp0GILO03kRtXnM7vFH2/BeDjpP+O+rtcTuTvrF1HZsC3vtmE8rd0+ljh
 zyXVwpICoks53jh1WRHNftqqHZZtLrWGmJMv1e8uf2m4eK6CfXuHCaPBCPgNRFlNZg
 gSloE5T4979gfWCTRQODPVDJ25EQTdiqwFy2xNd66vQZULILV3reSwLQtTvMFP27yG
 iWbMAFcMbdUzMM/pD/cpPK7+IDIepwMqmBcOw8MKIj0vnFWZ5CMwP6xfVwtbf7FhdP
 BkKYpeYDaHmWMoVyyVBqkelbmdHwoUgnMcypzG6dyEYJLkUL9Uu4izVri6EJSYGoFZ
 3AleDHXkHQjGw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  5 Apr 2023 13:43:21 -0700
Message-Id: <20230405204321.2056498-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: set_page_private_# increases a refcount after attaching
 page->private, and clear_page_private_# decreases it. But,
 f2fs_release_folio and f2fs_invalidate_folio
 call folio_detach_private() which decrea [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pk9ya-0001W5-8S
Subject: [f2fs-dev] [PATCH] f2fs: attach/detach private value in pair
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

set_page_private_# increases a refcount after attaching page->private, and
clear_page_private_# decreases it.
But, f2fs_release_folio and f2fs_invalidate_folio call folio_detach_private()
which decreases the refcount again, which corrupts the page cache.

Cc: <stable@vger.kernel.org>
Fixes: b763f3bedc2d ("f2fs: restructure f2fs page.private layout")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/compress.c |  4 ++--
 fs/f2fs/data.c     |  6 ++++--
 fs/f2fs/f2fs.h     | 48 ++++++++++++++++------------------------------
 3 files changed, 22 insertions(+), 36 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 11653fa79289..70b3910db413 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1854,7 +1854,7 @@ void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
 		return;
 	}
 
-	set_page_private_data(cpage, ino);
+	set_page_private_ino(cpage, ino);
 
 	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE_READ))
 		goto out;
@@ -1917,7 +1917,7 @@ void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino)
 				continue;
 			}
 
-			if (ino != get_page_private_data(&folio->page)) {
+			if (ino != get_page_private_ino(&folio->page)) {
 				folio_unlock(folio);
 				continue;
 			}
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 359de650772e..7262c754ff8b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3724,8 +3724,9 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
 
 	if (test_opt(sbi, COMPRESS_CACHE) &&
 			inode->i_ino == F2FS_COMPRESS_INO(sbi))
-		clear_page_private_data(&folio->page);
+		clear_page_private_ino(&folio->page);
 
+	WARN_ON_ONCE(page_private(&folio->page));
 	folio_detach_private(folio);
 }
 
@@ -3742,12 +3743,13 @@ bool f2fs_release_folio(struct folio *folio, gfp_t wait)
 		struct inode *inode = folio->mapping->host;
 
 		if (inode->i_ino == F2FS_COMPRESS_INO(sbi))
-			clear_page_private_data(&folio->page);
+			clear_page_private_ino(&folio->page);
 	}
 
 	clear_page_private_reference(&folio->page);
 	clear_page_private_gcing(&folio->page);
 
+	WARN_ON_ONCE(page_private(&folio->page));
 	folio_detach_private(folio);
 	return true;
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index dfead8160a51..3d883201e7a5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1395,6 +1395,7 @@ enum {
 	PAGE_PRIVATE_ONGOING_MIGRATION,		/* data page which is on-going migrating */
 	PAGE_PRIVATE_INLINE_INODE,		/* inode page contains inline data */
 	PAGE_PRIVATE_REF_RESOURCE,		/* dirty page has referenced resources */
+	PAGE_PRIVATE_DATA,			/* page has referenced data */
 	PAGE_PRIVATE_MAX
 };
 
@@ -1409,73 +1410,56 @@ static inline bool page_private_##name(struct page *page) \
 #define PAGE_PRIVATE_SET_FUNC(name, flagname) \
 static inline void set_page_private_##name(struct page *page) \
 { \
-	if (!PagePrivate(page)) { \
-		get_page(page); \
-		SetPagePrivate(page); \
-		set_page_private(page, 0); \
-	} \
+	if (!PagePrivate(page)) \
+		attach_page_private(page, 0); \
 	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
 	set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
 }
 
+/* clear private by f2fs_release_folio or f2fs_invalidate_folio */
 #define PAGE_PRIVATE_CLEAR_FUNC(name, flagname) \
 static inline void clear_page_private_##name(struct page *page) \
 { \
 	clear_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
-	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) { \
+	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) \
 		set_page_private(page, 0); \
-		if (PagePrivate(page)) { \
-			ClearPagePrivate(page); \
-			put_page(page); \
-		}\
-	} \
 }
 
 PAGE_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);
 PAGE_PRIVATE_GET_FUNC(inline, INLINE_INODE);
 PAGE_PRIVATE_GET_FUNC(gcing, ONGOING_MIGRATION);
 PAGE_PRIVATE_GET_FUNC(dummy, DUMMY_WRITE);
+PAGE_PRIVATE_GET_FUNC(data, DATA);
 
 PAGE_PRIVATE_SET_FUNC(reference, REF_RESOURCE);
 PAGE_PRIVATE_SET_FUNC(inline, INLINE_INODE);
 PAGE_PRIVATE_SET_FUNC(gcing, ONGOING_MIGRATION);
 PAGE_PRIVATE_SET_FUNC(dummy, DUMMY_WRITE);
+PAGE_PRIVATE_SET_FUNC(data, DATA);
 
 PAGE_PRIVATE_CLEAR_FUNC(reference, REF_RESOURCE);
 PAGE_PRIVATE_CLEAR_FUNC(inline, INLINE_INODE);
 PAGE_PRIVATE_CLEAR_FUNC(gcing, ONGOING_MIGRATION);
 PAGE_PRIVATE_CLEAR_FUNC(dummy, DUMMY_WRITE);
+PAGE_PRIVATE_CLEAR_FUNC(data, DATA);
 
-static inline unsigned long get_page_private_data(struct page *page)
+static inline nid_t get_page_private_ino(struct page *page)
 {
-	unsigned long data = page_private(page);
-
-	if (!test_bit(PAGE_PRIVATE_NOT_POINTER, &data))
+	if (!page_private_data(page))
 		return 0;
-	return data >> PAGE_PRIVATE_MAX;
+	return page_private(page) >> PAGE_PRIVATE_MAX;
 }
 
-static inline void set_page_private_data(struct page *page, unsigned long data)
+static inline void set_page_private_ino(struct page *page, nid_t ino)
 {
-	if (!PagePrivate(page)) {
-		get_page(page);
-		SetPagePrivate(page);
-		set_page_private(page, 0);
-	}
-	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page));
-	page_private(page) |= data << PAGE_PRIVATE_MAX;
+	set_page_private_data(page);
+	page_private(page) |= ino << PAGE_PRIVATE_MAX;
 }
 
-static inline void clear_page_private_data(struct page *page)
+static inline void clear_page_private_ino(struct page *page)
 {
 	page_private(page) &= GENMASK(PAGE_PRIVATE_MAX - 1, 0);
-	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) {
-		set_page_private(page, 0);
-		if (PagePrivate(page)) {
-			ClearPagePrivate(page);
-			put_page(page);
-		}
-	}
+	clear_page_private_data(page);
 }
 
 /* For compression */
-- 
2.40.0.348.gf938b09366-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
