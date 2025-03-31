Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33608A76E78
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVw-00042r-VB;
	Mon, 31 Mar 2025 20:13:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVj-0003ss-Lk
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zR/2ea6DNqY5IXRq+2VnjQjMp1XYOKO/5TPZvyMoWdc=; b=Hnmd8ErhEYqcRsHyVpMmgVTHxy
 6UyM3GefygFF6CaLOgBrRGSBoKFXO2G4WQLgVbvAX+ld3UpmiCmt71zKYwEoIxov4ksv/hVSNWQB/
 hxpYINk1bdkA15mF2PaQfJYgQVRvG+CD5K4XaWqjDFMQXtpQbPbpPeFKqzeUdZaA/djU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zR/2ea6DNqY5IXRq+2VnjQjMp1XYOKO/5TPZvyMoWdc=; b=eqJ4/HehehMIL/87HCJQoveQB6
 qt6KVYDgnN43U7ApNztZ8kYflBl/Q67H/Zs0iAYJYD3HzH5QaAjT62Rm71Po7WuFTqmQqlYvE9N8f
 P4vfMqMx7qX7OL6oyivZ+fCEjKzEx0pJ7RCv+KHMvA0exn5WcUQp/o/KUAoGiOg0+svo=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVd-0003cw-W1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=zR/2ea6DNqY5IXRq+2VnjQjMp1XYOKO/5TPZvyMoWdc=; b=fPoUS5ulFfUqGnj3PT8/Wx8V2P
 B75FVWPeejMVQTO0dPZsr6Oj48yLb+MDt+RS5xJLW03dA2qQoy8dHSnbmhhGfWNbDlORjg7wcOoGI
 rtzKh2g4FMbAc22JcptAsfKbsMmK3ep6xIscCKnbBMb293xx4ctI2dKeF+sKxUsg92zuD1goKt/OY
 0gHEubQG5io6Lq+P1mIQrMVcu5MPDddZuSByUb+ZAeo9TvOI4HdNedFzcWwnpsZhhC2dvaqwZTk9B
 a1ciOFLtSm5Dv23FoO6Z614knPrTX93k9J7TWjZOzvQz9+KXUZzfhKm3wZt/UrfX4q8m2k321Cweb
 Hw9Y3Ugw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVR-00000004Rzi-3bUJ;
 Mon, 31 Mar 2025 20:13:13 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:41 +0100
Message-ID: <20250331201256.1057782-82-willy@infradead.org>
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
 Content preview:  All three callers now have a folio so pass it in. Removes
 two calls to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/node.c | 25 ++++++++++++ 1 file changed, 12 insertions(+), 13
 deletions(-) 
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
X-Headers-End: 1tzLVd-0003cw-W1
Subject: [f2fs-dev] [PATCH 081/153] f2fs: Convert __write_node_page() to
 __write_node_folio()
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

All three callers now have a folio so pass it in.  Removes
two calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 20d62994cf46..f3fbf0d14341 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1676,21 +1676,20 @@ static struct folio *last_fsync_dnode(struct f2fs_sb_info *sbi, nid_t ino)
 	return last_folio;
 }
 
-static int __write_node_page(struct page *page, bool atomic, bool *submitted,
+static int __write_node_folio(struct folio *folio, bool atomic, bool *submitted,
 				struct writeback_control *wbc, bool do_balance,
 				enum iostat_type io_type, unsigned int *seq_id)
 {
-	struct f2fs_sb_info *sbi = F2FS_P_SB(page);
-	struct folio *folio = page_folio(page);
+	struct f2fs_sb_info *sbi = F2FS_F_SB(folio);
 	nid_t nid;
 	struct node_info ni;
 	struct f2fs_io_info fio = {
 		.sbi = sbi,
-		.ino = ino_of_node(page),
+		.ino = ino_of_node(&folio->page),
 		.type = NODE,
 		.op = REQ_OP_WRITE,
 		.op_flags = wbc_to_write_flags(wbc),
-		.page = page,
+		.page = &folio->page,
 		.encrypted_page = NULL,
 		.submitted = 0,
 		.io_type = io_type,
@@ -1715,11 +1714,11 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 
 	if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
 			wbc->sync_mode == WB_SYNC_NONE &&
-			IS_DNODE(page) && is_cold_node(page))
+			IS_DNODE(&folio->page) && is_cold_node(&folio->page))
 		goto redirty_out;
 
 	/* get old block addr of this node page */
-	nid = nid_of_node(page);
+	nid = nid_of_node(&folio->page);
 	f2fs_bug_on(sbi, folio->index != nid);
 
 	if (f2fs_get_node_info(sbi, nid, &ni, !do_balance))
@@ -1753,7 +1752,7 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 
 	/* should add to global list before clearing PAGECACHE status */
 	if (f2fs_in_warm_node_list(sbi, folio)) {
-		seq = f2fs_add_fsync_node_entry(sbi, page);
+		seq = f2fs_add_fsync_node_entry(sbi, &folio->page);
 		if (seq_id)
 			*seq_id = seq;
 	}
@@ -1762,12 +1761,12 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 
 	fio.old_blkaddr = ni.blk_addr;
 	f2fs_do_write_node_page(nid, &fio);
-	set_node_addr(sbi, &ni, fio.new_blkaddr, is_fsync_dnode(page));
+	set_node_addr(sbi, &ni, fio.new_blkaddr, is_fsync_dnode(&folio->page));
 	dec_page_count(sbi, F2FS_DIRTY_NODES);
 	f2fs_up_read(&sbi->node_write);
 
 	if (wbc->for_reclaim) {
-		f2fs_submit_merged_write_cond(sbi, NULL, page, 0, NODE);
+		f2fs_submit_merged_write_cond(sbi, NULL, &folio->page, 0, NODE);
 		submitted = NULL;
 	}
 
@@ -1809,7 +1808,7 @@ int f2fs_move_node_folio(struct folio *node_folio, int gc_type)
 			goto out_page;
 		}
 
-		if (__write_node_page(&node_folio->page, false, NULL,
+		if (__write_node_folio(node_folio, false, NULL,
 					&wbc, false, FS_GC_NODE_IO, NULL)) {
 			err = -EAGAIN;
 			folio_unlock(node_folio);
@@ -1908,7 +1907,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			if (!folio_clear_dirty_for_io(folio))
 				goto continue_unlock;
 
-			ret = __write_node_page(&folio->page, atomic &&
+			ret = __write_node_folio(folio, atomic &&
 						folio == last_folio,
 						&submitted, wbc, true,
 						FS_NODE_IO, seq_id);
@@ -2116,7 +2115,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 			set_fsync_mark(&folio->page, 0);
 			set_dentry_mark(&folio->page, 0);
 
-			ret = __write_node_page(&folio->page, false, &submitted,
+			ret = __write_node_folio(folio, false, &submitted,
 						wbc, do_balance, io_type, NULL);
 			if (ret)
 				folio_unlock(folio);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
