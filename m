Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 265E76DFADA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Apr 2023 18:08:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmd1N-00019X-Vz;
	Wed, 12 Apr 2023 16:08:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pmd1L-00019R-GD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 16:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6tHcvpNWiPht801PO9Zrv9yhnQM7CzF7GEisM5jFpsg=; b=O+OXjY1hV0Fxy8TW5h4dyXKV0k
 g6n6fEGmTjyQXgZC//F0Eq9lYf7sKcRxraSDx9YFerHrvMsV9A5Ql8o9a8py256+cuSKjVgEbI1lz
 3rMT767HDlmVJFPJ1rSXpuiu2WsN6CqcAKCaOmdPXG33XsdRhUAAo8TlMg6ubW1/iXME=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6tHcvpNWiPht801PO9Zrv9yhnQM7CzF7GEisM5jFpsg=; b=Gx+2+LTuve1mS4S3t+3R8GEFFO
 +bF1jDSQGX7WMVtBi6iBsV+09C+uQab+sp8VaJ/e6P7zibpU57ACDhJHUkGbPgRQt05vajKRsVsfK
 DE3MXbBVOFvMYoL6ymEI/ZcpGWUlvlvmojLCP87ddck+USnR9qtzHPoW5M4HL9PJ67RM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmd1L-00005E-I8 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 16:08:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E343B636C5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Apr 2023 16:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476C9C4339B;
 Wed, 12 Apr 2023 16:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681315702;
 bh=ErdIVpMC3VDYiThvtybryY3eGzznLtXvGbiDRfOIaas=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BTJQXgFhL2eaZ4SKpHjGxCwSPn0yTAk4ZK7EMWcE7zMzFlGbA90+FDDf+t7vijQj0
 o2dGPaDEr0c+iEwgZofIu1EkKZtyRO1nqT5WKMNfCyubomd2SOm9+lXh4gyVcYNDBC
 48Qxbt6waTRzbBV67xtSZ2YGq6A3de7QL4T1E8nAg6FKPmHWPrUTe6Ye5rlf1e/3l1
 rVRbuKgt4sOKunV3NJui7CdWH/ggJ4wjb/tCOfA2WknXupSytJJQAP3iPpU2mpIZF2
 DReKRlsCuhtSKLjclcXBCSvWlDOY9sE5PwJ5dEiO/9pH7faL2bT6+D1Gz+LyfphcNo
 8j1sLLKapRn3w==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 12 Apr 2023 09:08:10 -0700
Message-Id: <20230412160810.1534632-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.40.0.577.gac1e443424-goog
In-Reply-To: <20230412160810.1534632-1-jaegeuk@kernel.org>
References: <20230412160810.1534632-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> We have maintain PagePrivate
 and page_private and page reference w/ {set, clear}_page_private_*, it doesn't
 need to call folio_detach_private() in the end of .invalidate_folio and
 .release_folio, remov [...] 
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
X-Headers-End: 1pmd1L-00005E-I8
Subject: [f2fs-dev] [PATCH 2/2] f2fs: remove folio_detach_private() in
 .invalidate_folio and .release_folio
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

From: Chao Yu <chao@kernel.org>

We have maintain PagePrivate and page_private and page reference
w/ {set,clear}_page_private_*, it doesn't need to call
folio_detach_private() in the end of .invalidate_folio and
.release_folio, remove it and use f2fs_bug_on instead.

This patch should be applied along with
("f2fs: remove set|get_private_inline to clean up").

Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c |  4 ++--
 fs/f2fs/dir.c  |  5 ++---
 fs/f2fs/f2fs.h | 32 ++++++++------------------------
 3 files changed, 12 insertions(+), 29 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 14cd647d727d..037e70e85f63 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3732,7 +3732,7 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
 			inode->i_ino == F2FS_COMPRESS_INO(sbi))
 		clear_page_private_data(&folio->page);
 
-	folio_detach_private(folio);
+	f2fs_bug_on(sbi, page_private(&folio->page));
 }
 
 bool f2fs_release_folio(struct folio *folio, gfp_t wait)
@@ -3754,7 +3754,7 @@ bool f2fs_release_folio(struct folio *folio, gfp_t wait)
 	clear_page_private_reference(&folio->page);
 	clear_page_private_gcing(&folio->page);
 
-	folio_detach_private(folio);
+	f2fs_bug_on(sbi, page_private(&folio->page));
 	return true;
 }
 
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index d6dd8327e82d..cea179dec3b6 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -906,13 +906,12 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct page *page,
 		clear_page_dirty_for_io(page);
 		ClearPageUptodate(page);
 
+		clear_page_private_reference(page);
 		clear_page_private_gcing(page);
+		f2fs_bug_on(F2FS_I_SB(dir), page_private(page));
 
 		inode_dec_dirty_pages(dir);
 		f2fs_remove_dirty_inode(dir);
-
-		detach_page_private(page);
-		set_page_private(page, 0);
 	}
 	f2fs_put_page(page, 1);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 200fb2243e8a..48fbd8b54e69 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1407,11 +1407,8 @@ static inline bool page_private_##name(struct page *page) \
 #define PAGE_PRIVATE_SET_FUNC(name, flagname) \
 static inline void set_page_private_##name(struct page *page) \
 { \
-	if (!PagePrivate(page)) { \
-		get_page(page); \
-		SetPagePrivate(page); \
-		set_page_private(page, 0); \
-	} \
+	if (!PagePrivate(page)) \
+		attach_page_private(page, (void *)0); \
 	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
 	set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
 }
@@ -1420,13 +1417,8 @@ static inline void set_page_private_##name(struct page *page) \
 static inline void clear_page_private_##name(struct page *page) \
 { \
 	clear_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
-	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) { \
-		set_page_private(page, 0); \
-		if (PagePrivate(page)) { \
-			ClearPagePrivate(page); \
-			put_page(page); \
-		}\
-	} \
+	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) \
+		detach_page_private(page); \
 }
 
 PAGE_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);
@@ -1452,11 +1444,8 @@ static inline unsigned long get_page_private_data(struct page *page)
 
 static inline void set_page_private_data(struct page *page, unsigned long data)
 {
-	if (!PagePrivate(page)) {
-		get_page(page);
-		SetPagePrivate(page);
-		set_page_private(page, 0);
-	}
+	if (!PagePrivate(page))
+		attach_page_private(page, (void *)0);
 	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page));
 	page_private(page) |= data << PAGE_PRIVATE_MAX;
 }
@@ -1464,13 +1453,8 @@ static inline void set_page_private_data(struct page *page, unsigned long data)
 static inline void clear_page_private_data(struct page *page)
 {
 	page_private(page) &= GENMASK(PAGE_PRIVATE_MAX - 1, 0);
-	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) {
-		set_page_private(page, 0);
-		if (PagePrivate(page)) {
-			ClearPagePrivate(page);
-			put_page(page);
-		}
-	}
+	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER))
+		detach_page_private(page);
 }
 
 /* For compression */
-- 
2.40.0.577.gac1e443424-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
