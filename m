Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0E4A76E99
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLW9-0001HI-3M;
	Mon, 31 Mar 2025 20:13:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVk-00013h-DC
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hk171z3YNGKvNAh+rv4gwbqHs7CnO2btTFQqSqtfGZM=; b=Wqde4qgOiCpqUgYwSpun1UtCpu
 i1qH/nM3bPXmYbeSBkJnNJZBsxzYd5Tr3+C+k9dt12e0lpmFyC3Ov3SgYXHu6AXqvAEqYkM9etYEY
 Pp+xjrBvRJBQNaEMVMbqgXen9zdBJky5UPOkfDB6XoX1xP4ujhzEd5e6VDNsZuk1DjG0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hk171z3YNGKvNAh+rv4gwbqHs7CnO2btTFQqSqtfGZM=; b=O+lJMwGathF7hGS5NORzGmixVH
 0ffni3IbNWeNfWNOZKGQZlchhl3Z2LnpUCs/0W5fS1WCo4N+oNmv1mAZe0A32GapzVwqOdtEjkSd2
 KpnN/O4iFzSSo3RphFkQoy5+NnsEos3pkPGynD5yo4hyeC206jidHXlvroBbV0KjiFpw=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVa-0003ba-IM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Hk171z3YNGKvNAh+rv4gwbqHs7CnO2btTFQqSqtfGZM=; b=CP/ea8imWjmvzkQRHCNZVtCJ/J
 rt7m0UNblpBC5uOuZqp+PjOZ1z1TmsA2CauR1r8RsIzqZAzlKEoSW7VOnTlge8hNHuVlc9kfaCTxr
 17+I3mNDVkP0vBNINR/SOcuRV/LOlQ5F5EVNllxBomEap3WVl5BFxc7wpm9JSTOXY+I1FVMeMh/mb
 yN61ydjzcY5s1VR0GvL2c/gL8v7/0UMWg+ctW1dba+UloTRBUA+n4mehZTwMiMTOJjlpSikCsjoZy
 IeZz7ynrep9Gh4FVUWMnF83OZx65WzomBEeOhG2E2UoZgVUMWYVOjdow8rIKd/4Z9S2ZvsbJmjazC
 VDhEZcPA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVP-00000004Rrn-0ifL;
 Mon, 31 Mar 2025 20:13:11 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:26 +0100
Message-ID: <20250331201256.1057782-67-willy@infradead.org>
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
 Content preview:  Both callers now have a folio, so pass it in and remove the
 conversion back to a folio. Removes two calls to compound_head().
 Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/node.c | 19
 +++++++++ 1 file changed, 9 insertions(+), 10 deletions(-) 
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
X-Headers-End: 1tzLVa-0003ba-IM
Subject: [f2fs-dev] [PATCH 066/153] f2fs: Convert read_node_page() to
 read_node_folio()
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

Both callers now have a folio, so pass it in and remove the
conversion back to a folio.  Removes two calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 083863557414..f1f0d5159f2d 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1385,26 +1385,25 @@ struct folio *f2fs_new_node_folio(struct dnode_of_data *dn, unsigned int ofs)
 
 /*
  * Caller should do after getting the following values.
- * 0: f2fs_put_page(page, 0)
- * LOCKED_PAGE or error: f2fs_put_page(page, 1)
+ * 0: f2fs_folio_put(folio, false)
+ * LOCKED_PAGE or error: f2fs_folio_put(folio, true)
  */
-static int read_node_page(struct page *page, blk_opf_t op_flags)
+static int read_node_folio(struct folio *folio, blk_opf_t op_flags)
 {
-	struct folio *folio = page_folio(page);
-	struct f2fs_sb_info *sbi = F2FS_P_SB(page);
+	struct f2fs_sb_info *sbi = F2FS_F_SB(folio);
 	struct node_info ni;
 	struct f2fs_io_info fio = {
 		.sbi = sbi,
 		.type = NODE,
 		.op = REQ_OP_READ,
 		.op_flags = op_flags,
-		.page = page,
+		.page = &folio->page,
 		.encrypted_page = NULL,
 	};
 	int err;
 
 	if (folio_test_uptodate(folio)) {
-		if (!f2fs_inode_chksum_verify(sbi, page)) {
+		if (!f2fs_inode_chksum_verify(sbi, &folio->page)) {
 			folio_clear_uptodate(folio);
 			return -EFSBADCRC;
 		}
@@ -1452,7 +1451,7 @@ void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid)
 	if (IS_ERR(afolio))
 		return;
 
-	err = read_node_page(&afolio->page, REQ_RAHEAD);
+	err = read_node_folio(afolio, REQ_RAHEAD);
 	f2fs_folio_put(afolio, err ? true : false);
 }
 
@@ -1495,7 +1494,7 @@ static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
 	if (IS_ERR(folio))
 		return folio;
 
-	err = read_node_page(&folio->page, 0);
+	err = read_node_folio(folio, 0);
 	if (err < 0) {
 		goto out_put_err;
 	} else if (err == LOCKED_PAGE) {
@@ -1529,7 +1528,7 @@ static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
 out_err:
 	folio_clear_uptodate(folio);
 out_put_err:
-	/* ENOENT comes from read_node_page which is not an error. */
+	/* ENOENT comes from read_node_folio which is not an error. */
 	if (err != -ENOENT)
 		f2fs_handle_page_eio(sbi, folio, NODE);
 	f2fs_folio_put(folio, true);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
