Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0C2A39328
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWz-0006bM-6U;
	Tue, 18 Feb 2025 05:52:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWp-0006Zb-PT
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s1CFGYWZAtt7BsUGV9ZEVbRTHj4UASOxllRmfzj9/2A=; b=gj/Yx+5HDVGb/8nO5eP2xPXnNn
 3XaOItW/p6wtQJBxfjYUstOYWFPEP1IzvR1yp3JmC2Q/LHXEdocOfTLRkFa8j4px2553gKe3xk2nZ
 oyRpwWGsC/ZRogbzqUHtTStIc6b5sRgVERgyO2Qc+xDlJ81PNuTI5Mx8DU3U8/aCblxU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s1CFGYWZAtt7BsUGV9ZEVbRTHj4UASOxllRmfzj9/2A=; b=lmcex+6UcEDSYFZH6MdgF8M4Pw
 RLmapP6dVRoyImJ/DBS1fdijJIM1jIkcl1iQ9I3m/3xvOJ9SBKzZfxLkssJHATrck+Pl+8lIloH86
 EK8ZgMo9RDGNRSSx4M+cRu9CtWnAYHbxddgbjVNXLYJ3nWjDjO8nGoIweJz8YHVbIz/A=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWp-0007cE-4S for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=s1CFGYWZAtt7BsUGV9ZEVbRTHj4UASOxllRmfzj9/2A=; b=k48cTfr23zhiHyZ58KKy63TFud
 eoc5G6DuJaxFkoC8o5ucq2aZ4wrhOo4yPMrgsT1T6Sfv5fUZINCmFaeenyJHv9AlqsM4fRqXCB5in
 BDIN/XHcoSGDhTxFWvQQmVu+0rGIsCur/WBIWDD9ved0DuIi7gOA6lAJsAkSu+HGQT2OlPijN8DM5
 f+cBmEa+eLuKlSTmjnrnNZBhFyga6mjjYAKzLUh6wjq8Sg7O6bi4p5hlQ/iHrPMgxBO7+pKKnoedx
 RTA5dj+Ry/jaBdh4JegKohB2ND9+QLAomyNrGyNLB06ALDVEO1VKTOQmx3y+42OAtMpHg+oT0FYZk
 K+kKvrYw==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWd-00000002Tsn-3LWo; Tue, 18 Feb 2025 05:52:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:51 +0000
Message-ID: <20250218055203.591403-18-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218055203.591403-1-willy@infradead.org>
References: <20250218055203.591403-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Change __get_node_page() to return a folio and convert back
 to a page in f2fs_get_node_page() and f2fs_get_node_page_ra(). Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/f2fs.h | 1 +
 fs/f2fs/node.c
 | 18 +++++++++++++----- 2 files changed, 14 insertions(+), 5 deletions(-)
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tkGWp-0007cE-4S
Subject: [f2fs-dev] [PATCH 17/27] f2fs: Add f2fs_get_node_folio()
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
Cc: linux-fsdevel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Change __get_node_page() to return a folio and convert back to a page in
f2fs_get_node_page() and f2fs_get_node_page_ra().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h |  1 +
 fs/f2fs/node.c | 18 +++++++++++++-----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bbaa61da83a8..8f23bb082c6f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3689,6 +3689,7 @@ struct page *f2fs_new_inode_page(struct inode *inode);
 struct page *f2fs_new_node_page(struct dnode_of_data *dn, unsigned int ofs);
 void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid);
 struct page *f2fs_get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid);
+struct folio *f2fs_get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid);
 struct page *f2fs_get_node_page_ra(struct page *parent, int start);
 int f2fs_move_node_page(struct page *node_page, int gc_type);
 void f2fs_flush_inline_data(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index da28e295c701..2d161ddda9c3 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1449,7 +1449,7 @@ void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid)
 	f2fs_put_page(apage, err ? 1 : 0);
 }
 
-static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
+static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
 					struct page *parent, int start)
 {
 	struct folio *folio;
@@ -1462,7 +1462,7 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
 repeat:
 	folio = f2fs_grab_cache_folio(NODE_MAPPING(sbi), nid, false);
 	if (IS_ERR(folio))
-		return ERR_CAST(folio);
+		return folio;
 
 	err = read_node_page(&folio->page, 0);
 	if (err < 0) {
@@ -1493,7 +1493,7 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
 	}
 page_hit:
 	if (likely(nid == nid_of_node(&folio->page)))
-		return &folio->page;
+		return folio;
 
 	f2fs_warn(sbi, "inconsistent node block, nid:%lu, node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
 			  nid, nid_of_node(&folio->page), ino_of_node(&folio->page),
@@ -1512,17 +1512,25 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
 	return ERR_PTR(err);
 }
 
+struct folio *f2fs_get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid)
+{
+	return __get_node_folio(sbi, nid, NULL, 0);
+}
+
 struct page *f2fs_get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid)
 {
-	return __get_node_page(sbi, nid, NULL, 0);
+	struct folio *folio = __get_node_folio(sbi, nid, NULL, 0);
+
+	return &folio->page;
 }
 
 struct page *f2fs_get_node_page_ra(struct page *parent, int start)
 {
 	struct f2fs_sb_info *sbi = F2FS_P_SB(parent);
 	nid_t nid = get_nid(parent, start, false);
+	struct folio *folio = __get_node_folio(sbi, nid, parent, start);
 
-	return __get_node_page(sbi, nid, parent, start);
+	return &folio->page;
 }
 
 static void flush_inline_data(struct f2fs_sb_info *sbi, nid_t ino)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
