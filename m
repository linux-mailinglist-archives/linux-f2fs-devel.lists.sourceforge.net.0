Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4362CAFD429
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfVx39POIithezeLPkveV8LkuBEfQrR0noyD0p1upD0=; b=jH91WqeSk8oBXhEds35flZyum/
	J6kaX9s3/9SNomGGRWiKzJkBBiV6+s47eAdu9w6R4riLdcxPJCFwLHUAYi+il1lvxOVeZivUhwS8B
	Uc9ET064ESDDKnfPxWYavC1rOMRvmUq3YqwIYUklmJgmKYXNUASB/IpFGh8HLD+VOd20=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjr-0002mG-MC;
	Tue, 08 Jul 2025 17:04:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjp-0002lQ-Gw
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SDGZY/He0bysIukV6ears9f7H2ebGbOQzMTPwDv8htc=; b=QhukcX+pC2q0zrVFYeg5brtj7K
 NxxGOLspPWAno26nocouN11oMh1i4tMUSoMMVk45wqjKjieqoL7q617Bhv4xOGM8FXWmn5kCWqbd7
 +1KYWGwrji2hbEOni3JJYyHjsaMXQ9ue4esXNbSp/pyRe215TzV9uU3fHuEpkP6qPxhQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SDGZY/He0bysIukV6ears9f7H2ebGbOQzMTPwDv8htc=; b=WIy36fWVzz+PPqr2UkoYWKdjEI
 AFU6oU09gQHZcUMN5mWmBvsFCPmXzYIudPeicCv32m6h7E89TJ1Me+MS6gzocY5/Er15DvzKILW2i
 LyasMwxNVxi4MxTKFIMNEg56NxLrmWhyDfwwWl8tDbDy6+b1sJP1L/17yBrLgl2kbwxc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjo-0006EH-Lw for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=SDGZY/He0bysIukV6ears9f7H2ebGbOQzMTPwDv8htc=; b=Zo4KDtFbHTym5mMXgFFKL6HkeT
 /d0EITVHcj1j8HShq40WDNMIIRKOrKp++FvSLijZ9zbjKs77gSy8CnfM2ZLmShdqvrqqIIpILhMxM
 YdE3/qexsuSlNEUTaNR3hzLYu6LvhHxjKrlnu+Kki7rnnM1jjD84rhHJaC9JiSEhVqBuWQfN3LtQO
 MVk/JF68HCUWez/dAalbA/mxS5KiwKWTliMxCJlWHM2GX89Ulk+mdko1svEBccCw94vKdAXDw2RZS
 sSmEnyGdoxFFQFQvjhEZ72BMiXfASGAZf6JGvHuDwfPg1rlmqrnZbBrBFMxDFe3a3Saw/yIZLHxVN
 kxRXD6cg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBji-00000000T6Y-0kkR;
 Tue, 08 Jul 2025 17:04:06 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:30 +0100
Message-ID: <20250708170359.111653-34-willy@infradead.org>
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
 Content preview:  All callers now have a folio so pass it in. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/node.c | 15
 +++++++--------
 fs/f2fs/node.h | 4 ++-- fs/f2fs/segment.c | 4 ++-- 3 files changed,
 11 insertions(+), 12 deletions( [...] 
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
X-Headers-End: 1uZBjo-0006EH-Lw
Subject: [f2fs-dev] [PATCH 33/60] f2fs: Pass a folio to IS_DNODE()
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

All callers now have a folio so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c    | 15 +++++++--------
 fs/f2fs/node.h    |  4 ++--
 fs/f2fs/segment.c |  4 ++--
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index d406342714f7..a2258883ca77 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -312,8 +312,7 @@ static unsigned int __gang_lookup_nat_set(struct f2fs_nm_info *nm_i,
 
 bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, struct folio *folio)
 {
-	return is_node_folio(folio) && IS_DNODE(&folio->page) &&
-					is_cold_node(folio);
+	return is_node_folio(folio) && IS_DNODE(folio) && is_cold_node(folio);
 }
 
 void f2fs_init_fsync_node_info(struct f2fs_sb_info *sbi)
@@ -1631,7 +1630,7 @@ static struct folio *last_fsync_dnode(struct f2fs_sb_info *sbi, nid_t ino)
 				return ERR_PTR(-EIO);
 			}
 
-			if (!IS_DNODE(&folio->page) || !is_cold_node(folio))
+			if (!IS_DNODE(folio) || !is_cold_node(folio))
 				continue;
 			if (ino_of_node(folio) != ino)
 				continue;
@@ -1702,7 +1701,7 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
 
 	if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
 			wbc->sync_mode == WB_SYNC_NONE &&
-			IS_DNODE(&folio->page) && is_cold_node(folio))
+			IS_DNODE(folio) && is_cold_node(folio))
 		goto redirty_out;
 
 	/* get old block addr of this node page */
@@ -1840,7 +1839,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 				goto out;
 			}
 
-			if (!IS_DNODE(&folio->page) || !is_cold_node(folio))
+			if (!IS_DNODE(folio) || !is_cold_node(folio))
 				continue;
 			if (ino_of_node(folio) != ino)
 				continue;
@@ -2040,12 +2039,12 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 			 * 1. dentry dnodes
 			 * 2. file dnodes
 			 */
-			if (step == 0 && IS_DNODE(&folio->page))
+			if (step == 0 && IS_DNODE(folio))
 				continue;
-			if (step == 1 && (!IS_DNODE(&folio->page) ||
+			if (step == 1 && (!IS_DNODE(folio) ||
 						is_cold_node(folio)))
 				continue;
-			if (step == 2 && (!IS_DNODE(&folio->page) ||
+			if (step == 2 && (!IS_DNODE(folio) ||
 						!is_cold_node(folio)))
 				continue;
 lock_node:
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 657f9a2d4b05..d366e2e25498 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -350,9 +350,9 @@ static inline bool is_recoverable_dnode(const struct folio *folio)
  *                 `- indirect node ((6 + 2N) + (N - 1)(N + 1))
  *                       `- direct node
  */
-static inline bool IS_DNODE(const struct page *node_page)
+static inline bool IS_DNODE(const struct folio *node_folio)
 {
-	unsigned int ofs = ofs_of_node(node_page);
+	unsigned int ofs = ofs_of_node(&node_folio->page);
 
 	if (f2fs_has_xattr_block(ofs))
 		return true;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index cd49015a905a..9bc9bdddc3e0 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3620,7 +3620,7 @@ static int __get_segment_type_4(struct f2fs_io_info *fio)
 		else
 			return CURSEG_COLD_DATA;
 	} else {
-		if (IS_DNODE(fio->page) && is_cold_node(fio->folio))
+		if (IS_DNODE(fio->folio) && is_cold_node(fio->folio))
 			return CURSEG_WARM_NODE;
 		else
 			return CURSEG_COLD_NODE;
@@ -3677,7 +3677,7 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 		return f2fs_rw_hint_to_seg_type(F2FS_I_SB(inode),
 						inode->i_write_hint);
 	} else {
-		if (IS_DNODE(fio->page))
+		if (IS_DNODE(fio->folio))
 			return is_cold_node(fio->folio) ? CURSEG_WARM_NODE :
 						CURSEG_HOT_NODE;
 		return CURSEG_COLD_NODE;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
