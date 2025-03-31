Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDFEA76E82
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVz-0000xp-BX;
	Mon, 31 Mar 2025 20:13:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVc-0000kv-TY
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F3oluPBxtd9F/yCdzkYGJHH3KSu8ztCrVjs+v+dh37Y=; b=YDr5NjhVuakUuipMc3fFI464K5
 GMw8Pa3dbrC2w8ZblXjS3NBVY5otB92G9nHDZ1q8mNxRBBCLDFhlJ7uZnQvSJrgL2TYMZlQmrSQJ6
 F7rXaUEjoDlM7iz2Mcg6l5wjrSo8eaajm52v3U9SmDCvGxTKc7krqT3vXmqCWTxBGhMI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F3oluPBxtd9F/yCdzkYGJHH3KSu8ztCrVjs+v+dh37Y=; b=g1l4CbBwJGhtI4PjyiSI13BI1D
 pw3eNQzaMRsIVyuEFBgCPkigkAi0J0D1ktyrnrNmoI+FkDbvPDxTcSyGb0r2Sur7q4AXt1PoU3Q/u
 VHt+1SdsQ6t0JV+xtzE60Ku6JeD+TrGhpT/8AvPfAOvTxnt4eOvnbCPSFPZZlk7QGpH8=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVc-0003cN-Nq for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=F3oluPBxtd9F/yCdzkYGJHH3KSu8ztCrVjs+v+dh37Y=; b=AQt2a7zHPmhHDtIweJfmrCPUc3
 /S9wCzX5gCdu4lXhfTODxiug2ZohpgIb9oP+7D/PoyTmib2Q5+eSTnFQ78K7ZcNWNnRzH7cg3Ixaf
 vU0QCJ0MoDAYLms1zzpxM122KhWCmWPGvyerUeD24tov+OF89FFUNi9/CqrnnXbSAX8IxlaCO29y1
 /YdZZzbATkEj2fYuFCbtW/S1Eukntxh8hpHqkQIU3Am7ML4RUNccSwkiYerDGkf4yZXqhvneK+yWN
 XmYSR+BleeRbSkZAk2MNMFUuJCtM2G35rDr/PHLMIZSAzAfPAOuzpdN4Mwdd12dmP5Io7q+x/u485
 DGmGa0Ig==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVR-00000004Ry3-149v;
 Mon, 31 Mar 2025 20:13:13 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:39 +0100
Message-ID: <20250331201256.1057782-80-willy@infradead.org>
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
 Content preview: Remove three calls to compound_head(). Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/gc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-) diff --git a/fs/f2fs/gc.c
 b/fs/f2fs/gc.c index 45b1ffa5ea93..56c0ca609fc1 100644 --- a/fs/f2fs/gc.c
 +++ b/fs/f2fs/gc.c @@ -1045,7 +1045,7 @@ static int gc_node_segment(struct
 f2fs_sb_info *sbi, 
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
X-Headers-End: 1tzLVc-0003cN-Nq
Subject: [f2fs-dev] [PATCH 079/153] f2fs: Use a folio in gc_node_segment()
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

Remove three calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/gc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 45b1ffa5ea93..56c0ca609fc1 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1045,7 +1045,7 @@ static int gc_node_segment(struct f2fs_sb_info *sbi,
 
 	for (off = 0; off < usable_blks_in_seg; off++, entry++) {
 		nid_t nid = le32_to_cpu(entry->nid);
-		struct page *node_page;
+		struct folio *node_folio;
 		struct node_info ni;
 		int err;
 
@@ -1068,27 +1068,27 @@ static int gc_node_segment(struct f2fs_sb_info *sbi,
 		}
 
 		/* phase == 2 */
-		node_page = f2fs_get_node_page(sbi, nid);
-		if (IS_ERR(node_page))
+		node_folio = f2fs_get_node_folio(sbi, nid);
+		if (IS_ERR(node_folio))
 			continue;
 
-		/* block may become invalid during f2fs_get_node_page */
+		/* block may become invalid during f2fs_get_node_folio */
 		if (check_valid_map(sbi, segno, off) == 0) {
-			f2fs_put_page(node_page, 1);
+			f2fs_folio_put(node_folio, true);
 			continue;
 		}
 
 		if (f2fs_get_node_info(sbi, nid, &ni, false)) {
-			f2fs_put_page(node_page, 1);
+			f2fs_folio_put(node_folio, true);
 			continue;
 		}
 
 		if (ni.blk_addr != start_addr + off) {
-			f2fs_put_page(node_page, 1);
+			f2fs_folio_put(node_folio, true);
 			continue;
 		}
 
-		err = f2fs_move_node_page(node_page, gc_type);
+		err = f2fs_move_node_page(&node_folio->page, gc_type);
 		if (!err && gc_type == FG_GC)
 			submitted++;
 		stat_inc_node_blk_count(sbi, 1, gc_type);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
