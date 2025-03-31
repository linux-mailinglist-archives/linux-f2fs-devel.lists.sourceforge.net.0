Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A6EA76E8B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLW1-0000zV-Nf;
	Mon, 31 Mar 2025 20:13:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVe-0000lE-Hr
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uExzE9Z9hxU4dqkuMZxcGJZtLu7OJGNqcL60v7DBK7U=; b=JDnxM6RGx1DrkjPNzdqxonqvQp
 OWxdUNlnFecWTo17qWI8j/lzIIGahqcK3O+Awh5imEOBRf0oiJOl/Q/LwwQfnFsHkky+DzULzDLOM
 t3jDcytkTEoW28bX9xN21Y7Hm5EiVGfBIBZD0V4WSpl1BvZIGpk+glnMrr7uSym9L4Oc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uExzE9Z9hxU4dqkuMZxcGJZtLu7OJGNqcL60v7DBK7U=; b=JKzjmv8hTXGGsHH5pQWPeYYUbp
 rlk25qF9xuwkuZciHXpT+gnKlXq54q7tPO14y4UTXYAkoHeO6YMO/+iGloQL/RyrLvOKg4/eklJpk
 dDGlLywzRUevC4Qdt2s7fdXKU7hB2PVISiieFACSuwIkKjMOYNM6wzo5pPbp+YEUkIjs=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVe-0003d6-76 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=uExzE9Z9hxU4dqkuMZxcGJZtLu7OJGNqcL60v7DBK7U=; b=snEFj/msOYnHnZPGV7fjKkuOZL
 hqK+G9DDoYN7otKPAuA5VlEHe3JSWYKIjsOWTDtvxNfCnnSPldfqLOVLnYF6nqZHlkwLUFJHq7bo1
 DOnZQeZzBlWA4l2R1HMmkIZIw7aRcPN0jFm8yBF1NLOFCvrS18P/AQQELvw4IKtcdPjzAZpaDNsfh
 eDoVh2XTp02afDXXGWt4k7/d8f97Rm0vIEu2IMzBNxBffZ2xaNWft8Et8anhsD+Tp+RifPv1Bz2c5
 OW+32myqqvHc3A/tCepO1E80tkX4Dj1yINl9UexIsFao/+wiDojYKiw1mXON1kSNDvy9zxSDOBLuD
 ri0zi2Qg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVS-00000004S0j-3EvK;
 Mon, 31 Mar 2025 20:13:14 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:42 +0100
Message-ID: <20250331201256.1057782-83-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Remove four calls to compound_head(). Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/gc.c | 22 +++++++++++ 1
 file changed, 11 insertions(+), 11 deletions(-) diff --git a/fs/f2fs/gc.c
 b/fs/f2fs/gc.c index 5c58e6a306f4..b18fecd2c352 100644 --- a/fs/f2fs/gc.c
 +++ b/fs/f2fs/gc.c @@ -1134, 7 +1134,
 7 @@ block_t f2fs_start_bidx_of_node(unsigned
 int node_ofs, stru [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVe-0003d6-76
Subject: [f2fs-dev] [PATCH 082/153] f2fs: Use a folio in is_alive()
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

Remove four calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/gc.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 5c58e6a306f4..b18fecd2c352 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1134,7 +1134,7 @@ block_t f2fs_start_bidx_of_node(unsigned int node_ofs, struct inode *inode)
 static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		struct node_info *dni, block_t blkaddr, unsigned int *nofs)
 {
-	struct page *node_page;
+	struct folio *node_folio;
 	nid_t nid;
 	unsigned int ofs_in_node, max_addrs, base;
 	block_t source_blkaddr;
@@ -1142,12 +1142,12 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	nid = le32_to_cpu(sum->nid);
 	ofs_in_node = le16_to_cpu(sum->ofs_in_node);
 
-	node_page = f2fs_get_node_page(sbi, nid);
-	if (IS_ERR(node_page))
+	node_folio = f2fs_get_node_folio(sbi, nid);
+	if (IS_ERR(node_folio))
 		return false;
 
 	if (f2fs_get_node_info(sbi, nid, dni, false)) {
-		f2fs_put_page(node_page, 1);
+		f2fs_folio_put(node_folio, true);
 		return false;
 	}
 
@@ -1158,12 +1158,12 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	}
 
 	if (f2fs_check_nid_range(sbi, dni->ino)) {
-		f2fs_put_page(node_page, 1);
+		f2fs_folio_put(node_folio, true);
 		return false;
 	}
 
-	if (IS_INODE(node_page)) {
-		base = offset_in_addr(F2FS_INODE(node_page));
+	if (IS_INODE(&node_folio->page)) {
+		base = offset_in_addr(F2FS_INODE(&node_folio->page));
 		max_addrs = DEF_ADDRS_PER_INODE;
 	} else {
 		base = 0;
@@ -1173,13 +1173,13 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	if (base + ofs_in_node >= max_addrs) {
 		f2fs_err(sbi, "Inconsistent blkaddr offset: base:%u, ofs_in_node:%u, max:%u, ino:%u, nid:%u",
 			base, ofs_in_node, max_addrs, dni->ino, dni->nid);
-		f2fs_put_page(node_page, 1);
+		f2fs_folio_put(node_folio, true);
 		return false;
 	}
 
-	*nofs = ofs_of_node(node_page);
-	source_blkaddr = data_blkaddr(NULL, node_page, ofs_in_node);
-	f2fs_put_page(node_page, 1);
+	*nofs = ofs_of_node(&node_folio->page);
+	source_blkaddr = data_blkaddr(NULL, &node_folio->page, ofs_in_node);
+	f2fs_folio_put(node_folio, true);
 
 	if (source_blkaddr != blkaddr) {
 #ifdef CONFIG_F2FS_CHECK_FS
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
