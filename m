Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 689C4A76E55
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVn-0000qP-U3;
	Mon, 31 Mar 2025 20:13:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVa-0000kW-Cp
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0FiYv3MOh+8NO6NUSjF04eKQ/q9+GbajCYPDAtHYfes=; b=ISycL3BJj0aBR/Ag8rqrNoswuD
 j+w74bexzojfQxot4FH184FFS3OHBXlQwEQy7SJPz/5MjG7z9Rs41AmRnG7XCAsAPKwiRjcrihVvB
 Rxo6kiyIF5J7JuLf3gExuCxpVpfMsNB1svqYNWTIJjGQQO3zVxxYkusTrwJQaYfm4ROY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0FiYv3MOh+8NO6NUSjF04eKQ/q9+GbajCYPDAtHYfes=; b=J31nwybKMza02oLyKbke3TfG3c
 H/r/Cc1aMFHUJ+8PYLVMzQkTb3FUIzS1SfRYk5eNBqLtaZoaNB/tR+aHznKHObhbwoOfdBiiqUUZC
 ikSeC6+TTAoQk3qvRAFskVBGZiglpBp7RjlYuxZLFEYOQUkZ3cfE5E53jmWQar7sMLaM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVV-0003Ze-0q for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=0FiYv3MOh+8NO6NUSjF04eKQ/q9+GbajCYPDAtHYfes=; b=ugDZLaVNEooO6YWlDNHAeKdPZ0
 lnTAnK4HsGFVawhW0RDVUKfuzXEpCU13i/pxvNTsNf3OMDErPg0F7HfR/BZA4wrqDrOWR9p79clv/
 OJluQPTPOGKDFT0PYQAUjEkvRF/6tRKz3UU/ok58vgR+lS5avVtEEv39ATYn9Oe1g/WXrPlkKyYz7
 t3oG4hfS/W0R9JMCthXtECASxIA/yZJpwjseF5xZa4RzupWxruNPRDVnbsXSfxekroFkncMDS2pYi
 +MVsHPSIa7qNUTyEhwNW7mdLeHtmDa/7E1O0kRxMRFBki4CxcA4+VPrbOVzm2TWpxYyT0qZ27QYw5
 MQKskPcA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVJ-00000004Rbz-2jAM;
 Mon, 31 Mar 2025 20:13:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:53 +0100
Message-ID: <20250331201256.1057782-34-willy@infradead.org>
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
 Content preview: Get a folio instead of a page. Saves a hidden call to
 compound_head().
 Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/node.c
 | 12 ++++++------ 1 file changed, 6 insertions(+), 6 deletions(-) 
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
X-Headers-End: 1tzLVV-0003Ze-0q
Subject: [f2fs-dev] [PATCH 033/153] f2fs: Use a folio in __get_nat_bitmaps()
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

Get a folio instead of a page.  Saves a hidden call to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 7e32763cc51e..e1fa3babb50f 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -3175,15 +3175,15 @@ static int __get_nat_bitmaps(struct f2fs_sb_info *sbi)
 	nat_bits_addr = __start_cp_addr(sbi) + BLKS_PER_SEG(sbi) -
 						nm_i->nat_bits_blocks;
 	for (i = 0; i < nm_i->nat_bits_blocks; i++) {
-		struct page *page;
+		struct folio *folio;
 
-		page = f2fs_get_meta_page(sbi, nat_bits_addr++);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
+		folio = f2fs_get_meta_folio(sbi, nat_bits_addr++);
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
 
 		memcpy(nm_i->nat_bits + F2FS_BLK_TO_BYTES(i),
-					page_address(page), F2FS_BLKSIZE);
-		f2fs_put_page(page, 1);
+					folio_address(folio), F2FS_BLKSIZE);
+		f2fs_folio_put(folio, true);
 	}
 
 	cp_ver |= (cur_cp_crc(ckpt) << 32);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
