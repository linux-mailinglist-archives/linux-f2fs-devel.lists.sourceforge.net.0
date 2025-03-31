Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 131B0A76E77
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVx-0005qo-Dl;
	Mon, 31 Mar 2025 20:13:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVl-0005go-HS
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S+NU4kOngcXx9+oOnf46AI7FwaG5lr2Ibx71lKl0fxQ=; b=lv6sxF32WTKCKJgmWkIPPmyJlY
 5aaEqbZ66S8IJnnCOHBNPqDbvn+o3mRHZSR4+s8xwOjkKqMqaFH+ZSIPKkkd+lQS+kg5MWo1wnaYJ
 dBc23LGSOwCvBu8jky5lFMKWBf8vkpN/DweL5XOGCfAkunGyOj2uVuS6apRxpnHOjxjg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S+NU4kOngcXx9+oOnf46AI7FwaG5lr2Ibx71lKl0fxQ=; b=GxZCFZBDIJnxjnrX5hxC/U4SCb
 ept+7lNoqEfb9hZvBSJdog/8kSPOj52LDTbhQdezzU2PFO3Jc529i1LNZ7XBuI7EhTdti/SYMbCve
 pZXEC7TvxtLrOn4Ky9GbulT0rqGojB6U1HoS+cQujvvbtWVei6iVN2AT2PlCy+i3YKYs=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVj-0003fh-TZ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=S+NU4kOngcXx9+oOnf46AI7FwaG5lr2Ibx71lKl0fxQ=; b=EeNde8J3iyXi5IEmPKSl6pmy5b
 /gdq+6RgW+KF87cqzxIKBimjxXguhrQ8DzaNgpyjLEjcpDKa1qbOm55DPgnuQepij50NrZJjJ4TBh
 fB2al0XKmxuR2F3XA62aqCJJxl+TSiAffHkjRm5C7qIBf16VvUvePMhPtEJ5QkQ3PrfU1C7gcdqcw
 5SynSpcPoLGZx2mVY0HOPIjDWRApNzsaIxBY98LEv6cA449XeCHnNTUCmUOvuzJdv3BxZWjQMRLF3
 6QkYtHODGiwcnld3xhlzPwMgs8Cwtcauoh9WFVZN2/a4CE42nV5VBK8TBoxYd/qX97hf8mJvuFMKM
 mc9E12QA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVd-00000004ScI-29w6;
 Mon, 31 Mar 2025 20:13:25 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:43 +0100
Message-ID: <20250331201256.1057782-144-willy@infradead.org>
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
 Content preview: Fetch a folio from the pagecache and use it. Removes two
 calls to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/segment.c | 10 +++++----- 1 file changed, 5 insertions(+), 5
 deletions(-) 
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
X-Headers-End: 1tzLVj-0003fh-TZ
Subject: [f2fs-dev] [PATCH 143/153] f2fs: Use a folio in
 f2fs_wait_on_block_writeback()
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

Fetch a folio from the pagecache and use it.  Removes two calls
to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/segment.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 88890755a394..49cb5d282c45 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4178,7 +4178,7 @@ void f2fs_folio_wait_writeback(struct folio *folio, enum page_type type,
 void f2fs_wait_on_block_writeback(struct inode *inode, block_t blkaddr)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct page *cpage;
+	struct folio *cfolio;
 
 	if (!f2fs_meta_inode_gc_required(inode))
 		return;
@@ -4186,10 +4186,10 @@ void f2fs_wait_on_block_writeback(struct inode *inode, block_t blkaddr)
 	if (!__is_valid_data_blkaddr(blkaddr))
 		return;
 
-	cpage = find_lock_page(META_MAPPING(sbi), blkaddr);
-	if (cpage) {
-		f2fs_wait_on_page_writeback(cpage, DATA, true, true);
-		f2fs_put_page(cpage, 1);
+	cfolio = filemap_lock_folio(META_MAPPING(sbi), blkaddr);
+	if (!IS_ERR(cfolio)) {
+		f2fs_folio_wait_writeback(cfolio, DATA, true, true);
+		f2fs_folio_put(cfolio, true);
 	}
 }
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
