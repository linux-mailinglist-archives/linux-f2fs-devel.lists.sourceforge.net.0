Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2F0A76E94
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLW9-00060k-0Q;
	Mon, 31 Mar 2025 20:13:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVo-0005is-5t
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1LqAkX+Jp50syhpR/D84Y4JziRavuIdos/+WKL2Pb+o=; b=Qz0nUq4Lt+x0EgMP9RcbAVlijv
 7kiGkveJRWwGmLSKsVYHHVSF9VrLexn+0BpmZRGUtXQR+UgxaHLtPRVD8bZkQPYlx2MYDJjt3jG+M
 LOne6M1XFrE6mBODQnaDYrnRDVyscydqIgO9YAE1DjeTQ8G0jFbrX4LX04BjEDHgQwxI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1LqAkX+Jp50syhpR/D84Y4JziRavuIdos/+WKL2Pb+o=; b=b6svAMVPp2Wy974/g8VGos4F5t
 kUInEycgomgdY9S3TQk5AZxjmqfIvbF7COtTUGV98JQi8iSrq2aapK2Haa2WZ2VkM2ESIPYRn9n6y
 fmZmV0rlLuAu41qhPs3bwAQvTH+aaU5KB5aenu1acjHlE7B8bc4TW3zlq+lmK2wWQTBA=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVc-0003cW-Uc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=1LqAkX+Jp50syhpR/D84Y4JziRavuIdos/+WKL2Pb+o=; b=pxSyXVd4mIUlx181ufX7G2MOSc
 rU4bxLrtzn+woTVk6fHQEMm00+0t6EDtQO+ex+0eeJ52qA3Xopzmvi0BCJCbr1nIPyy6XxmhIgMmu
 aUpclIYrgSuINJzNGm857MTQdrDMTjOB9fwUiTdAHOFLduFSTDlLBEKNDMdEWh54xE7LJmr50UIn8
 Hpej6v3LsKMnGZLbf+yYnuwSq3AOMztBltrorPAAaJDzcgxdk1Agq3jinjEyDK4LrLf9yBPXNZnEr
 rTpFvFwE44kUOVOSe/okOsKExBiN4gJ6VgijPTwNtUm91XocLX7vPBbnOlt1m7KYQl6wY68WrTTQ7
 03jUyxWg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVW-00000004SDn-21Sq;
 Mon, 31 Mar 2025 20:13:18 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:01 +0100
Message-ID: <20250331201256.1057782-102-willy@infradead.org>
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
 Content preview: Remove four calls to compound_head(). Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/inline.c | 26 +++++++++++++
 1 file changed, 13 insertions(+), 13 deletions(-) 
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
X-Headers-End: 1tzLVc-0003cW-Uc
Subject: [f2fs-dev] [PATCH 101/153] f2fs: Use a folio in
 f2fs_recover_inline_data()
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

Remove four calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/inline.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 245cbff2ca2c..13ede6ccc312 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -296,7 +296,6 @@ int f2fs_recover_inline_data(struct inode *inode, struct page *npage)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_inode *ri = NULL;
 	void *src_addr, *dst_addr;
-	struct page *ipage;
 
 	/*
 	 * The inline_data recovery policy is as follows.
@@ -311,33 +310,34 @@ int f2fs_recover_inline_data(struct inode *inode, struct page *npage)
 
 	if (f2fs_has_inline_data(inode) &&
 			ri && (ri->i_inline & F2FS_INLINE_DATA)) {
+		struct folio *ifolio;
 process_inline:
-		ipage = f2fs_get_inode_page(sbi, inode->i_ino);
-		if (IS_ERR(ipage))
-			return PTR_ERR(ipage);
+		ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
+		if (IS_ERR(ifolio))
+			return PTR_ERR(ifolio);
 
-		f2fs_wait_on_page_writeback(ipage, NODE, true, true);
+		f2fs_folio_wait_writeback(ifolio, NODE, true, true);
 
 		src_addr = inline_data_addr(inode, npage);
-		dst_addr = inline_data_addr(inode, ipage);
+		dst_addr = inline_data_addr(inode, &ifolio->page);
 		memcpy(dst_addr, src_addr, MAX_INLINE_DATA(inode));
 
 		set_inode_flag(inode, FI_INLINE_DATA);
 		set_inode_flag(inode, FI_DATA_EXIST);
 
-		set_page_dirty(ipage);
-		f2fs_put_page(ipage, 1);
+		folio_mark_dirty(ifolio);
+		f2fs_folio_put(ifolio, true);
 		return 1;
 	}
 
 	if (f2fs_has_inline_data(inode)) {
-		ipage = f2fs_get_inode_page(sbi, inode->i_ino);
-		if (IS_ERR(ipage))
-			return PTR_ERR(ipage);
-		f2fs_truncate_inline_inode(inode, ipage, 0);
+		struct folio *ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
+		if (IS_ERR(ifolio))
+			return PTR_ERR(ifolio);
+		f2fs_truncate_inline_inode(inode, &ifolio->page, 0);
 		stat_dec_inline_inode(inode);
 		clear_inode_flag(inode, FI_INLINE_DATA);
-		f2fs_put_page(ipage, 1);
+		f2fs_folio_put(ifolio, true);
 	} else if (ri && (ri->i_inline & F2FS_INLINE_DATA)) {
 		int ret;
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
