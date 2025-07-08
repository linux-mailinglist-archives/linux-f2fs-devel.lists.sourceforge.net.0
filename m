Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E26AFD43A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYNiZltZhPrj9amsJZZ5wI2xPA0rNc9L3I/RdUH4txs=; b=k9HNtTPvgQaf5GxBvKnG7f3HD2
	zEB2sBrUmSTpxubFx0Lu9UR3YraOTdxl/zdfn7Rz0Jg6MliwGKU+RVPzvrrFgHng7XSXeE2XVulVF
	doAta/O9VryjzhZ2BdoAPw51/Y1wzzH+cBka6FdPu+mzSePpCowSSK5fPm8nZBe8AofM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjx-0007Mh-3D;
	Tue, 08 Jul 2025 17:04:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjt-0007LC-PK
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UjCYKoEW5UeTaC16eDnjafHTkev7rBqR+hNXLD+B8SY=; b=Oqvkt7dmok/FMp7Y7JiLo5jL6n
 QVBAFlP7qcUCOlBITHHNBytApy1rvFWCa1Ik9sI1rLIH63kfdIQvnosfPeIeYSYosKye5CwekIHbj
 Um3F1OunzxjUO2x9LgqIuw6Uu7VDE3NPIT254N75DmPX0dY9J/oiaiPahbTvb4cErIVI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UjCYKoEW5UeTaC16eDnjafHTkev7rBqR+hNXLD+B8SY=; b=jgueS0/hGAN0Y/sTKzqTBGvNNk
 WCmeiRTHe9Ty4vIh+9mUAa72wuSZs+PsxmGI/G3C80nNGLF2fR+uXA+CgdSZB2LQ/KDZgBYnAAv9Z
 mlqO70YAE2m4ONRLZ5f3KPVmcIFJt/S3qF6psU6vOPnLSW4QniQe8DltwzG932qrMhhk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjq-0006EY-Gy for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=UjCYKoEW5UeTaC16eDnjafHTkev7rBqR+hNXLD+B8SY=; b=WCvJAFw8gX9Qu5lFzYiMT6Y5lD
 dqa8tpR3c43+bC5+VnKjh2qRJ8LpAdcBwIDscr1py8aRqvItlzaDuynlX+q4RRLrY+4+dQ8kvbR98
 sMu81yuPxavo9eHzpu7L0K9CgHqaw+C4CAxFYXKD01MV0moHP174Cat9jQssGKBYW5HI8Gn+B/GrO
 71e3i/ABR0AevDTlhRHJa5rbWUCn6n2MSpuzyoWu0NSDJum8aEyKQWZhdlA7g4aeKx45HqpZ89p/P
 5/c0/eOLClOXB+fUslz1RHyf/MOJHziiavKgBBcHCh+gClRAyHHJ86Dwen4mpRaaPXdO+fheG4SRb
 vgDdsE4Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjf-00000000T4F-0B6S;
 Tue, 08 Jul 2025 17:04:03 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:08 +0100
Message-ID: <20250708170359.111653-12-willy@infradead.org>
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
 Content preview: All callers have a folio so pass it in. Also make the
 argument
 const as the function does not modify it. Signed-off-by: Matthew Wilcox
 (Oracle)
 <willy@infradead.org> --- fs/f2fs/data.c | 2 +- fs/f2fs/inode.c | 4 ++--
 fs/f2fs/node.c | 6 +++--- fs/f2fs/node.h | 4 ++-- 4 files changed,
 8 insertions(+), 8 de [...] 
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
X-Headers-End: 1uZBjq-0006EY-Gy
Subject: [f2fs-dev] [PATCH 11/60] f2fs: Pass a folio to nid_of_node()
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

All callers have a folio so pass it in.  Also make the argument const
as the function does not modify it.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c  | 2 +-
 fs/f2fs/inode.c | 4 ++--
 fs/f2fs/node.c  | 6 +++---
 fs/f2fs/node.h  | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b023d15b4555..5fc3d985c4e3 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -355,7 +355,7 @@ static void f2fs_write_end_io(struct bio *bio)
 		}
 
 		f2fs_bug_on(sbi, is_node_folio(folio) &&
-				folio->index != nid_of_node(&folio->page));
+				folio->index != nid_of_node(folio));
 
 		dec_page_count(sbi, type);
 		if (f2fs_in_warm_node_list(sbi, folio))
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index eedc56a3561b..db4ccde3737a 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -280,10 +280,10 @@ static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
 		return false;
 	}
 
-	if (ino_of_node(node_folio) != nid_of_node(&node_folio->page)) {
+	if (ino_of_node(node_folio) != nid_of_node(node_folio)) {
 		f2fs_warn(sbi, "%s: corrupted inode footer i_ino=%lx, ino,nid: [%u, %u] run fsck to fix.",
 			  __func__, inode->i_ino,
-			  ino_of_node(node_folio), nid_of_node(&node_folio->page));
+			  ino_of_node(node_folio), nid_of_node(node_folio));
 		return false;
 	}
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index fabcb3fa47cd..26d3bc7597d9 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1477,14 +1477,14 @@ static int sanity_check_node_footer(struct f2fs_sb_info *sbi,
 {
 	struct page *page = &folio->page;
 
-	if (unlikely(nid != nid_of_node(page) ||
+	if (unlikely(nid != nid_of_node(folio) ||
 		(ntype == NODE_TYPE_INODE && !IS_INODE(page)) ||
 		(ntype == NODE_TYPE_XATTR &&
 		!f2fs_has_xattr_block(ofs_of_node(page))) ||
 		time_to_inject(sbi, FAULT_INCONSISTENT_FOOTER))) {
 		f2fs_warn(sbi, "inconsistent node block, node_type:%d, nid:%lu, "
 			  "node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
-			  ntype, nid, nid_of_node(page), ino_of_node(folio),
+			  ntype, nid, nid_of_node(folio), ino_of_node(folio),
 			  ofs_of_node(page), cpver_of_node(page),
 			  next_blkaddr_of_node(folio));
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
@@ -1706,7 +1706,7 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
 		goto redirty_out;
 
 	/* get old block addr of this node page */
-	nid = nid_of_node(&folio->page);
+	nid = nid_of_node(folio);
 	f2fs_bug_on(sbi, folio->index != nid);
 
 	if (f2fs_get_node_info(sbi, nid, &ni, !do_balance))
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 6c4fc3449a68..c03cc1fdd136 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -249,9 +249,9 @@ static inline nid_t ino_of_node(const struct folio *node_folio)
 	return le32_to_cpu(rn->footer.ino);
 }
 
-static inline nid_t nid_of_node(struct page *node_page)
+static inline nid_t nid_of_node(const struct folio *node_folio)
 {
-	struct f2fs_node *rn = F2FS_NODE(node_page);
+	struct f2fs_node *rn = F2FS_NODE(&node_folio->page);
 	return le32_to_cpu(rn->footer.nid);
 }
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
