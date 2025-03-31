Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 179D7A76E57
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVp-0000qw-Dt;
	Mon, 31 Mar 2025 20:13:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVb-0000kc-0K
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1973dk/Vxd80Py7knlF8+dEvloiWZIE0V+G+hJen7Kw=; b=f6GzTnJrS197igt5e4dhouHd+a
 Y6GhyLBEzd2M/fjnV8UeL10VHRUF18U6HC9t3kNxSWoxDyn3Psgc0SVpse17ydic4RCk0DME3llnz
 e17CrYXvYz5DYArZHOZ+xhieeRBFSS0gZkOKhBm3zP5vqPT/LbZ2r2z9XVdwJTzJhPCw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1973dk/Vxd80Py7knlF8+dEvloiWZIE0V+G+hJen7Kw=; b=gAwhdFgP7ZlZjwsPiLK+EWBQ66
 BqV+P1xr/LUkeKe+EfG4q27JghLhlVBNfgQ1vQbz7ipPLwcTGjNLMVZtnV4/NCnu0UGDpXgHKkZQK
 H7AGh9Yn6oTQRhkLwA1sl8XQtzxGs8C1YgtS2C8SQXHT6FPtWRpW8ahcOL3XGpG23nj0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVQ-0003Yg-TK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=1973dk/Vxd80Py7knlF8+dEvloiWZIE0V+G+hJen7Kw=; b=ZNnxeDuLRP9V9EVW5/ESwYdp8u
 H0YDh4WZaWnqF1mTCZkGPtbtudWlKjiBylkQm6LVpNSdqpiI7MGABSlVlutattti2BC5fbSd8eX/i
 dfiVNe23POS5jOAql2EoClkZWFiOxL7F8B1eIKUsdtcaNWEzRxh0BV+VqpTgFK8XFsBf+NzNB1ztM
 gIyCIFTzrFoeX+2xVM3GXYDGcMQmCrwdeuqXOkQbcLlr6D1EKIPUTkfBxO5AdC3pSpx1bUxnQIKdU
 lLYqou7sG0vEBHl6tcCcClBuBmAhQkS7UToKaGFA+os5H5uhX6z9kQuX1IG1IluTb8486sTFE/oc4
 rMXlh8/w==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVK-00000004RdU-1qIo;
 Mon, 31 Mar 2025 20:13:06 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:58 +0100
Message-ID: <20250331201256.1057782-39-willy@infradead.org>
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
 Content preview: Remove a conversion from folio to page by passing in the
 address
 of the first byte rather than the struct page containing it. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/node.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-) 
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
X-Headers-End: 1tzLVQ-0003Yg-TK
Subject: [f2fs-dev] [PATCH 038/153] f2fs: Pass an address to scan_nat_page()
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

Remove a conversion from folio to page by passing in the address of the
first byte rather than the struct page containing it.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index ffe71868f459..34dc61a131bf 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2423,10 +2423,9 @@ static void remove_free_nid(struct f2fs_sb_info *sbi, nid_t nid)
 }
 
 static int scan_nat_page(struct f2fs_sb_info *sbi,
-			struct page *nat_page, nid_t start_nid)
+			struct f2fs_nat_block *nat_blk, nid_t start_nid)
 {
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
-	struct f2fs_nat_block *nat_blk = page_address(nat_page);
 	block_t blk_addr;
 	unsigned int nat_ofs = NAT_BLOCK_OFFSET(start_nid);
 	int i;
@@ -2551,7 +2550,8 @@ static int __f2fs_build_free_nids(struct f2fs_sb_info *sbi,
 			if (IS_ERR(folio)) {
 				ret = PTR_ERR(folio);
 			} else {
-				ret = scan_nat_page(sbi, &folio->page, nid);
+				ret = scan_nat_page(sbi, folio_address(folio),
+						nid);
 				f2fs_folio_put(folio, true);
 			}
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
