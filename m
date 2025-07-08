Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DA4AFD471
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:05:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTMJ3k2yFkXFyrIvJyuo0goJnpnqV0U1MeIvSosyHHs=; b=fnYG42GbeFAZ9ME25fAltlYfSF
	oayZpu9Epq7ExifUlMa+8s9qdzri2qu76/FkVbagPFv7Jokvu3U5/AKBmrsks5uK1z+pXURZiMNFn
	dBdDo+sDveq3q/B96+zDj+rUUPU0ET884BC+G40VAiYVJSTWx4i0XTJbYT7Gzcobp3cE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBl3-0007jP-7T;
	Tue, 08 Jul 2025 17:05:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjz-0007Q7-I7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7VzXFiUco8apCEcnhK8YpaprJH1+ePLNnaqCyNnhm98=; b=LPRC7izHheArPOHTzLtJd0Srd2
 6m5VLyedhRO/5JEYyO3SIErZfsSxFa+xMtv+8EbgrKucaOhBjqbo36JlN0B9I798IDEYw0etYrcay
 5mn4MZGBoAb06QVYW1V8QRPoO4OwqDodld1vfIuqx2HRnX3xxCUgkJVTO1rHD7qIHFLM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7VzXFiUco8apCEcnhK8YpaprJH1+ePLNnaqCyNnhm98=; b=WHn3LuttBEEvTfKkmvqIX7WtL1
 ex8NihZ+HAEp8RAgULw8JzMG56MUCGvcsSnxlIeXyScesYreJkI72JsXruYk3gWBwBEPNFjSZArI1
 Pp4cpm7PVKN1vAOsU8fhCJT2LeTUDl4kYa6+szA4Zw0YI+7XTZdBZYkeea8v00hKOGWc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjx-0006HG-6Y for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=7VzXFiUco8apCEcnhK8YpaprJH1+ePLNnaqCyNnhm98=; b=tTQ196EhHFbjkdEmcV0FwdCK1e
 UPVjw8gzyY/k+79gFINtxszsC2Ko3Av9jP4bMeGczDTrBEcBPF/HpOh1FbR1q2wj9envIpxkE9WJk
 xtrt++EnmwCRWqllS0IdkodKi6KnfS9SnxAkvYCVXCVEfLq9eYPJ5Eipf6L01OaA2kBYfMqqRb/4Q
 mce2BLxMcUWHZKcwLbZ0OgmUfR1EDq2z8yp7eV6BX58XxBaa2Nazv88hr/4heDshmfHMSsBmoPHqs
 SOz6CDBKZERPGQy4KTnjS3pl5g2gPec4zvRjuPRQwlNCp56Xjas6zXGyc+mLlMXVK/rPdMdAxcLpe
 0Qlq0Ogw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjl-00000000T9S-39PR;
 Tue, 08 Jul 2025 17:04:09 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:54 +0100
Message-ID: <20250708170359.111653-58-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Both remaining uses of page now have a folio equivalent.
 Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/data.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-) diff --git a/fs/f2fs/data.c
 b/fs/f2fs/data.c index 72565841a16c..18c5b619f48e 100644 --- a/fs/f2fs/data.c
 +++ b/fs/f2fs/data.c @@ -2768, 7 +2768,
 6 @@ int f2fs_write_single_data_page(struct folio *folio [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZBjx-0006HG-6Y
Subject: [f2fs-dev] [PATCH 57/60] f2fs: Remove use of page from
 f2fs_write_single_data_page()
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

Both remaining uses of page now have a folio equivalent.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 72565841a16c..18c5b619f48e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2768,7 +2768,6 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 				bool allow_balance)
 {
 	struct inode *inode = folio->mapping->host;
-	struct page *page = folio_page(folio, 0);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	loff_t i_size = i_size_read(inode);
 	const pgoff_t end_index = ((unsigned long long)i_size)
@@ -2785,7 +2784,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 		.op = REQ_OP_WRITE,
 		.op_flags = wbc_to_write_flags(wbc),
 		.old_blkaddr = NULL_ADDR,
-		.page = page,
+		.folio = folio,
 		.encrypted_page = NULL,
 		.submitted = 0,
 		.compr_blocks = compr_blocks,
@@ -2887,7 +2886,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 	inode_dec_dirty_pages(inode);
 	if (err) {
 		folio_clear_uptodate(folio);
-		clear_page_private_gcing(page);
+		folio_clear_f2fs_gcing(folio);
 	}
 	folio_unlock(folio);
 	if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode) &&
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
