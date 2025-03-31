Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E793A76E21
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVX-0000tX-9g;
	Mon, 31 Mar 2025 20:13:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVV-0000sK-1M
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uPYDPe5bi5K9TZoWnww0axJYtK/8MBa6UKszp3TxOEk=; b=lv1Qqww5GWdMYaapCax5jrRInI
 E/DRH0voqvZK2mw458DMWcE3MRkWlJjcLaqm/KBxFVxI92A+Cy1EDTZ++YuI+WNd0e3lSR34qydOi
 jw8dag7F8JmzUFAJw8no8cDlN863q0oi+l6O4cgcX5dXw82pvL0ex8vA+Q8gJbMGnSyU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uPYDPe5bi5K9TZoWnww0axJYtK/8MBa6UKszp3TxOEk=; b=fmcK6VLIOuMSFpxSCLtPLwOd22
 e43OPijoyMBlL5EYp7I0dW5ZN5P26dVLRnQu8uywhtTfRWO7tsnmjm18sUJIlJCUu6NgGvoyFF6Ps
 hzaToDAkhT41ZCt5lwks5PwkcEtFsaBXyt5Xy0SN6wtXvEnAk2+5mENZmUUmyK1ueXIc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVV-0003Zh-4X for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=uPYDPe5bi5K9TZoWnww0axJYtK/8MBa6UKszp3TxOEk=; b=L6dyzuMrkWjM/91fMxnp/tDi5d
 OndRFXw5c1YxpL/Dn9X3IXk4InodB9FLWfwQakAy5vecbWGV61vbgrKPiS0quUzzxAmZShfcUQ4zX
 Sja3i1tliMCuYnfoWs6eEuYIUFG44wlWNjSRYhAV8WmdrH0g+F+15JQ56Y9y606zAVWTbF8JVeN04
 0qqzMQIHEY8897qgYBmCP4ciAZBU+ktBStRB7SsjAl5y0a3FwIZz2lMcx+bYTy5pJScS52avrzQkx
 TpyRyz81u+6j/hvGC7pih0KmrnkO7thm11+Wo0Drai9hOwrn0VDzo03CppcR68NKgUXzT7Ug2DOnH
 rVRdr6YA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVJ-00000004RcN-3JGZ;
 Mon, 31 Mar 2025 20:13:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:54 +0100
Message-ID: <20250331201256.1057782-35-willy@infradead.org>
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
 Content preview: Get a folio instead of a page. Saves two hidden calls to
 compound_head().
 Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/segment.c
 | 23 +++++++++++ 1 file changed, 11 insertions(+), 12 deletions(-) 
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
X-Headers-End: 1tzLVV-0003Zh-4X
Subject: [f2fs-dev] [PATCH 034/153] f2fs: Use a folio in
 read_compacted_summaries()
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

Get a folio instead of a page.  Saves two hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/segment.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index aa0f2f243dba..61888496eaa9 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4213,16 +4213,16 @@ static int read_compacted_summaries(struct f2fs_sb_info *sbi)
 	struct f2fs_checkpoint *ckpt = F2FS_CKPT(sbi);
 	struct curseg_info *seg_i;
 	unsigned char *kaddr;
-	struct page *page;
+	struct folio *folio;
 	block_t start;
 	int i, j, offset;
 
 	start = start_sum_block(sbi);
 
-	page = f2fs_get_meta_page(sbi, start++);
-	if (IS_ERR(page))
-		return PTR_ERR(page);
-	kaddr = (unsigned char *)page_address(page);
+	folio = f2fs_get_meta_folio(sbi, start++);
+	if (IS_ERR(folio))
+		return PTR_ERR(folio);
+	kaddr = folio_address(folio);
 
 	/* Step 1: restore nat cache */
 	seg_i = CURSEG_I(sbi, CURSEG_HOT_DATA);
@@ -4259,17 +4259,16 @@ static int read_compacted_summaries(struct f2fs_sb_info *sbi)
 						SUM_FOOTER_SIZE)
 				continue;
 
-			f2fs_put_page(page, 1);
-			page = NULL;
+			f2fs_folio_put(folio, true);
 
-			page = f2fs_get_meta_page(sbi, start++);
-			if (IS_ERR(page))
-				return PTR_ERR(page);
-			kaddr = (unsigned char *)page_address(page);
+			folio = f2fs_get_meta_folio(sbi, start++);
+			if (IS_ERR(folio))
+				return PTR_ERR(folio);
+			kaddr = folio_address(folio);
 			offset = 0;
 		}
 	}
-	f2fs_put_page(page, 1);
+	f2fs_folio_put(folio, true);
 	return 0;
 }
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
