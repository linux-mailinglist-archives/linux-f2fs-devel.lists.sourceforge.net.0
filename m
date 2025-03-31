Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F612A76E73
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVw-00041R-0E;
	Mon, 31 Mar 2025 20:13:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVh-0003ql-Ci
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sNCRy29RipgYqgrO41aSTE7hfMGoH8z5d3FA39BoR9s=; b=RABSnA0nAii+hEL8McztS9ZIZ9
 c8F44mMt5Q7l+H8ukrW3bJKNpuB74w2Ht89Eu0zsvhaZnrenfyv4kd3Z6FVnDx5PGohnOO1pKepXS
 3H/2uqF6amzy/15REHz51Llf5sBKExccPLo4HYOlxPFEKe560/pCR8zKFkf/NPvKQ9Y8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sNCRy29RipgYqgrO41aSTE7hfMGoH8z5d3FA39BoR9s=; b=DNXTJM899yEqeuWz1OoY3x2TS2
 Yc3XiOzhKjSMXn8DWVn9WKiz97L90Wn/kmfqaTpF21jr3Q2cy3fKmWS7dLD+HVAi9Y3t+1G9hMP3R
 bHYFKzwMJCWS1yrVgppLikJcrBC4tdQdRgXcKA693X3k2u1dT3wsq8qh98nIRdvx7oLA=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVg-0003e6-Nq for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=sNCRy29RipgYqgrO41aSTE7hfMGoH8z5d3FA39BoR9s=; b=St9qfTJY8zkq/EzZgEVSQeBagZ
 m03t1xMT6E5/SEPwkdef6qquwg/9rf/48P088RsMItAjoJzB/VxukrIQa5yAfpjCK9KIX8BRzelx+
 cGg32OagtcRk7dQSir+yGddnObLIIn4me1WGrAcTaOxABGeuvLTkHSh8dat8Ul7PH+5ckLNYC+gD3
 2BkmydPrdhpySCRDPc9j2ZTCyroECeRdm8RBLYfVIyGRq5/Tcnnb/DFbND/GdgoIEQsJZXcF7G/xB
 0LrHfHWQ3vj99NYtyxHzSz+Pbb4rM2cuC/Q8b1+xqQ1UMHssTGh2ZcMhycho/CVtkU+EeT/0rzsp+
 v/WERfWQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVa-00000004SV3-1RV9;
 Mon, 31 Mar 2025 20:13:22 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:24 +0100
Message-ID: <20250331201256.1057782-125-willy@infradead.org>
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
 Content preview:  All callers now have a folio, so pass it in. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/data.c | 2 +-
 fs/f2fs/f2fs.h
 | 2 +- fs/f2fs/inline.c | 8 ++++---- 3 files changed, 6 insertions(+), 6
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
X-Headers-End: 1tzLVg-0003e6-Nq
Subject: [f2fs-dev] [PATCH 124/153] f2fs: Pass a folio to
 f2fs_do_read_inline_data()
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

All callers now have a folio, so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c   | 2 +-
 fs/f2fs/f2fs.h   | 2 +-
 fs/f2fs/inline.c | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index e434f4f5439c..952b3885a092 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3389,7 +3389,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 
 	if (f2fs_has_inline_data(inode)) {
 		if (pos + len <= MAX_INLINE_DATA(inode)) {
-			f2fs_do_read_inline_data(folio, &ifolio->page);
+			f2fs_do_read_inline_data(folio, ifolio);
 			set_inode_flag(inode, FI_DATA_EXIST);
 			if (inode->i_nlink)
 				set_page_private_inline(&ifolio->page);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ede550b9f60d..bb9e4f512242 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4273,7 +4273,7 @@ extern struct kmem_cache *f2fs_inode_entry_slab;
 bool f2fs_may_inline_data(struct inode *inode);
 bool f2fs_sanity_check_inline_data(struct inode *inode, struct page *ipage);
 bool f2fs_may_inline_dentry(struct inode *inode);
-void f2fs_do_read_inline_data(struct folio *folio, struct page *ipage);
+void f2fs_do_read_inline_data(struct folio *folio, struct folio *ifolio);
 void f2fs_truncate_inline_inode(struct inode *inode,
 						struct page *ipage, u64 from);
 int f2fs_read_inline_data(struct inode *inode, struct folio *folio);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 7a5481006ed3..39b936be6ca8 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -79,7 +79,7 @@ bool f2fs_may_inline_dentry(struct inode *inode)
 	return true;
 }
 
-void f2fs_do_read_inline_data(struct folio *folio, struct page *ipage)
+void f2fs_do_read_inline_data(struct folio *folio, struct folio *ifolio)
 {
 	struct inode *inode = folio->mapping->host;
 
@@ -91,7 +91,7 @@ void f2fs_do_read_inline_data(struct folio *folio, struct page *ipage)
 	folio_zero_segment(folio, MAX_INLINE_DATA(inode), folio_size(folio));
 
 	/* Copy the whole inline data block */
-	memcpy_to_folio(folio, 0, inline_data_addr(inode, ipage),
+	memcpy_to_folio(folio, 0, inline_data_addr(inode, &ifolio->page),
 		       MAX_INLINE_DATA(inode));
 	if (!folio_test_uptodate(folio))
 		folio_mark_uptodate(folio);
@@ -133,7 +133,7 @@ int f2fs_read_inline_data(struct inode *inode, struct folio *folio)
 	if (folio_index(folio))
 		folio_zero_segment(folio, 0, folio_size(folio));
 	else
-		f2fs_do_read_inline_data(folio, &ifolio->page);
+		f2fs_do_read_inline_data(folio, ifolio);
 
 	if (!folio_test_uptodate(folio))
 		folio_mark_uptodate(folio);
@@ -184,7 +184,7 @@ int f2fs_convert_inline_folio(struct dnode_of_data *dn, struct folio *folio)
 
 	f2fs_bug_on(F2FS_F_SB(folio), folio_test_writeback(folio));
 
-	f2fs_do_read_inline_data(folio, &dn->inode_folio->page);
+	f2fs_do_read_inline_data(folio, dn->inode_folio);
 	folio_mark_dirty(folio);
 
 	/* clear dirty state */
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
