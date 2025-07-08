Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0885AFD430
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIY8MPB0wQ70IqdbcMHUqnzx6xSWDXqbqkdfOOT7sqQ=; b=gks6LnnVbWDbstQcek24o+QNO3
	0Ib81LQo+3ECSaUR2TMRy9kHSqCH142Fn3cL0XXFZ6R0E4laRHnaPtj/6Nus3CzTskQlK89VxQC4U
	P/0Zx+FpnOxg8uVQdfGju+a2v7PBrx9ZUupSGd6HkSuv8rIJXgxgKdT37MM7GzcA3Z7s=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjt-0005Ep-KZ;
	Tue, 08 Jul 2025 17:04:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjq-0005DP-5G
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gb6WisPYFgpF9KJSOyfzaqfP/xShIh9p9aXE3Ep5OIY=; b=ZO21RB4xSch/DDELz/BhSBdzW8
 NoVpew3Ou0dOHFjq0ev+m0vzRLEqb1Wovi8hAUxeTOgmoXuf1q9LHNQ+laOeZeIM39RI6z65TkPxN
 HGRnZHkJL20ooPcS9g1q4d51Le8w6ZsWhTuCBdk4xCYP5CVvux3PgYFFiSLqWEUOyy8k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gb6WisPYFgpF9KJSOyfzaqfP/xShIh9p9aXE3Ep5OIY=; b=JaHtxMfbpor1OZclF0cT4M8Gxv
 xWGE0FXs3SJgP0KYxss8fRZW+xiKpjeYz0X2JcJ7/uxKFccylNnwRljtReyesUiEQEDMxG7cuE4rW
 RyLl8JPV7MmkLBACxvI8qscgNXSgZfV2rMXn5FdqG+XZSOsnNmpwzex//9lAKsFDBajE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjp-0006EN-IC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Gb6WisPYFgpF9KJSOyfzaqfP/xShIh9p9aXE3Ep5OIY=; b=lNpQB02lYPvywCHJQ6dapb0sfB
 JD4bDQLX1k9PBkeyfYt0xDdGJxwhYx2RSxkIyNigfakqs48UFQuq4CXMBu4kj/D1GlFff0z6Q4Vav
 Nsf9A3uC1RcxU5YNuwOcOVJ518D7RdI8YHkMqNRdN9fdDYd0W6L3ImK7hmQM9cR5lis+q36TTxa8b
 MUZh0DXatgcrwXpCkDdsI2H1AYuzffOVKlpSfURnDp+BCVPJ7kXOxK4hjOzRMz4jmb8OyOR9AZk0J
 0b1DgqiqYvrTxGNKbciPlh21O59nxueVruuXNlo9s36YYdExHQFKQ9rsSBqMC+9tQrRMkJxnRzCp2
 N+B5tBTw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjj-00000000T7E-0XBH;
 Tue, 08 Jul 2025 17:04:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:36 +0100
Message-ID: <20250708170359.111653-40-willy@infradead.org>
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
 Content preview:  Convert the passed page to a folio and use it throughout.
 Removes a use of fscrypt_is_bounce_page(),
 which we're trying to remove. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/data.c | 11
 ++++++-----
 fs/f2fs/f2fs.h | 2 +- include/linux/fscrypt.h | 7 ++++--- 3 files changed,
 11 insertions(+), 9 deletion [...] 
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
X-Headers-End: 1uZBjp-0006EN-IC
Subject: [f2fs-dev] [PATCH 39/60] f2fs: Use a folio in
 f2fs_is_cp_guaranteed()
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

Convert the passed page to a folio and use it throughout.  Removes
a use of fscrypt_is_bounce_page(), which we're trying to remove.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c          | 11 ++++++-----
 fs/f2fs/f2fs.h          |  2 +-
 include/linux/fscrypt.h |  7 ++++---
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index da6e80d70e43..20add6761d81 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -47,14 +47,15 @@ void f2fs_destroy_bioset(void)
 	bioset_exit(&f2fs_bioset);
 }
 
-bool f2fs_is_cp_guaranteed(struct page *page)
+bool f2fs_is_cp_guaranteed(const struct page *page)
 {
-	struct address_space *mapping = page_folio(page)->mapping;
+	const struct folio *folio = page_folio(page);
+	struct address_space *mapping = folio->mapping;
 	struct inode *inode;
 	struct f2fs_sb_info *sbi;
 
-	if (fscrypt_is_bounce_page(page))
-		return page_private_gcing(fscrypt_pagecache_page(page));
+	if (fscrypt_is_bounce_folio(folio))
+		return folio_test_f2fs_gcing(fscrypt_pagecache_folio(folio));
 
 	inode = mapping->host;
 	sbi = F2FS_I_SB(inode);
@@ -65,7 +66,7 @@ bool f2fs_is_cp_guaranteed(struct page *page)
 		return true;
 
 	if ((S_ISREG(inode->i_mode) && IS_NOQUOTA(inode)) ||
-			page_private_gcing(page))
+			folio_test_f2fs_gcing(folio))
 		return true;
 	return false;
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 02759cd93a3e..065f53006a82 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3990,7 +3990,7 @@ void f2fs_init_ckpt_req_control(struct f2fs_sb_info *sbi);
  */
 int __init f2fs_init_bioset(void);
 void f2fs_destroy_bioset(void);
-bool f2fs_is_cp_guaranteed(struct page *page);
+bool f2fs_is_cp_guaranteed(const struct page *page);
 int f2fs_init_bio_entry_cache(void);
 void f2fs_destroy_bio_entry_cache(void);
 void f2fs_submit_read_bio(struct f2fs_sb_info *sbi, struct bio *bio,
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 56fad33043d5..b334c0538864 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -332,12 +332,13 @@ static inline struct page *fscrypt_pagecache_page(struct page *bounce_page)
 	return (struct page *)page_private(bounce_page);
 }
 
-static inline bool fscrypt_is_bounce_folio(struct folio *folio)
+static inline bool fscrypt_is_bounce_folio(const struct folio *folio)
 {
 	return folio->mapping == NULL;
 }
 
-static inline struct folio *fscrypt_pagecache_folio(struct folio *bounce_folio)
+static inline
+struct folio *fscrypt_pagecache_folio(const struct folio *bounce_folio)
 {
 	return bounce_folio->private;
 }
@@ -518,7 +519,7 @@ static inline struct page *fscrypt_pagecache_page(struct page *bounce_page)
 	return ERR_PTR(-EINVAL);
 }
 
-static inline bool fscrypt_is_bounce_folio(struct folio *folio)
+static inline bool fscrypt_is_bounce_folio(const struct folio *folio)
 {
 	return false;
 }
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
