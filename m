Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43041A76E22
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVZ-0003m5-UK;
	Mon, 31 Mar 2025 20:13:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVV-0003kp-4V
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0/yn+upxxOkdnsMKc4t+LjUuffr/A4Hxe5USUhifPNU=; b=P+Sq8SCJSBdcIBWv/Lo9/GLGWy
 RPF1ug7VNY6cCgBdPVDkgasC53jViJqEkWudTMKzvb3RX/RrxSM+Q5ejZZQEP84YDfTXJZsvJ0liE
 RCc51OaaLevWd6OJOLLRwE5Iwbf1B98yqtI8cDKRcoFx5T7d0v9UNYaklN8VtmG8LMNg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0/yn+upxxOkdnsMKc4t+LjUuffr/A4Hxe5USUhifPNU=; b=N3KQYo1310dCu5cUmnCv1vjSAK
 SuxXXbTOvgzXqu9fxJOy3n+M8s8wx2xmfZ4YfUG9ui4Gs7BFerPCiUIu1Qu2vdAsOC8+FNhxwscGY
 Ps00cQh1tNbtkW4Ab8/4K09AU1Xpb8eWwTOQMa097UdM8YgpC08QWgOdhoq26Ynq9AEA=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVU-0003ZX-ER for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=0/yn+upxxOkdnsMKc4t+LjUuffr/A4Hxe5USUhifPNU=; b=SbbLts9GaxCBMkYwfIRzGP+TBo
 YzcEzKhxmLT6PHWVLW1k8/rRwGgobWclqRuf0gKKnCY4kXptzrLelM0HID2blXyLNmEkfRqhAkX31
 9fGYuLNFgWrJz8hwZkhJpOjuSnpzLHhS71YqJFbhGckBX2OQ/ZXMqkG3q7K6A2OcqnjtKy3QojD/f
 XTVjkyZGcTtvy1qAflhFGvuSy4I3o6wX27C/BwyJKqD3eTBC8ORhwQDweSITflhWQ/RedKNpMFreQ
 ignIKvrkwl7U+F2pS0A6zN9ci1rkGHRWJXbaTTnUDKqg2xMLSMINR40ov38cKQvicHrdc3Lq3XrGc
 KOjXFnYw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVJ-00000004RbG-0Zcu;
 Mon, 31 Mar 2025 20:13:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:49 +0100
Message-ID: <20250331201256.1057782-30-willy@infradead.org>
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
 Content preview:  Get a folio instead of a page and use it throughout. Saves
 two hidden calls to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> --- fs/f2fs/checkpoint.c | 14 +++++++------- 1 file
 changed, 7 insertions(+), 7 deletions(-) 
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
X-Headers-End: 1tzLVU-0003ZX-ER
Subject: [f2fs-dev] [PATCH 029/153] f2fs: Use a folio in
 f2fs_recover_orphan_inodes()
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

Get a folio instead of a page and use it throughout.  Saves two
hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/checkpoint.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 50fc1bbb8685..10fdbf48a6bc 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -748,26 +748,26 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
 	f2fs_ra_meta_pages(sbi, start_blk, orphan_blocks, META_CP, true);
 
 	for (i = 0; i < orphan_blocks; i++) {
-		struct page *page;
+		struct folio *folio;
 		struct f2fs_orphan_block *orphan_blk;
 
-		page = f2fs_get_meta_page(sbi, start_blk + i);
-		if (IS_ERR(page)) {
-			err = PTR_ERR(page);
+		folio = f2fs_get_meta_folio(sbi, start_blk + i);
+		if (IS_ERR(folio)) {
+			err = PTR_ERR(folio);
 			goto out;
 		}
 
-		orphan_blk = (struct f2fs_orphan_block *)page_address(page);
+		orphan_blk = folio_address(folio);
 		for (j = 0; j < le32_to_cpu(orphan_blk->entry_count); j++) {
 			nid_t ino = le32_to_cpu(orphan_blk->ino[j]);
 
 			err = recover_orphan_inode(sbi, ino);
 			if (err) {
-				f2fs_put_page(page, 1);
+				f2fs_folio_put(folio, true);
 				goto out;
 			}
 		}
-		f2fs_put_page(page, 1);
+		f2fs_folio_put(folio, true);
 	}
 	/* clear Orphan Flag */
 	clear_ckpt_flags(sbi, CP_ORPHAN_PRESENT_FLAG);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
