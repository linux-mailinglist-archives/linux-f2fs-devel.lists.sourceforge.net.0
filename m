Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E542AA76E44
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVj-0005fl-TK;
	Mon, 31 Mar 2025 20:13:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVb-0005am-L4
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9f5hy2Vlpud8/ktAkFddMFM7/+3sI2x7YF4v0A2AnS0=; b=E9VuALMoTQBI0G/pI2e5Og1wiH
 yfpuJQzG1N0j52frhsJCmnvAhXUqew7kEKgbSb8gKuw7Ym+qKHQ9dg0Me9ReWPnB3/KAudNBH2J3X
 MLFd88RGJYnmQFp1DO/zXfjioN3DhkBuUboPvAd2ks96AeGk9ZZbc1JKmK+T2utZ6Lpc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9f5hy2Vlpud8/ktAkFddMFM7/+3sI2x7YF4v0A2AnS0=; b=UyPTMl+T6Hwl2awW/MVzg5Zyn7
 s6CkSgQICsdORXum7s5T8zPHYXUzp0tgVXeeqQGEN+JSsOK3FbB0PxMS/RBTO1ZNET3sM/EFGNBdb
 2f/+JMcQDfmJC7Fdvq50A58YaxpL/co/2crzaFf8DbNEYIVFn13pK0t/19k5GQIKhrbE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVV-0003Zk-FI for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=9f5hy2Vlpud8/ktAkFddMFM7/+3sI2x7YF4v0A2AnS0=; b=VS0vJZvdjOADptdKbaggQSUnSN
 +M98JqM82eA8uSacpjjR6dXM/Ch4kYRoAY70HYAgk3NaTW6N8hJVxbY3vjWzdaX4/5gWWtrmH1RUq
 Ownvfb0AdJATx27C/lMTjS/81vtSqGaXviqU+dqVoA0+KFHlX6FLFJrq+iMlX6GhYt1BE4ZJtlckc
 48hsAHT6ha3rrubA8WpBB4g2WH1CyqYxpSutyC/PXRNn4cpQD7deYIuwgiAZI5rVyuLS9R45FIZQ3
 7suLCIpSCVBsB6oi7CKKuXwHaWk8hEKvJRJXWOWM/HhtBZMwWVjiXYOgsThTMiDEHaJs4SA2jz+os
 y74ngNlQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVP-00000004RrU-06SE;
 Mon, 31 Mar 2025 20:13:11 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:25 +0100
Message-ID: <20250331201256.1057782-66-willy@infradead.org>
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
 Content preview: Save a call to compound_head(). Signed-off-by: Matthew Wilcox
 (Oracle) <willy@infradead.org> --- fs/f2fs/node.c | 14 +++++++------- 1 file
 changed, 7 insertions(+),
 7 deletions(-) diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
 index 5fe8f48b2ac5..083863557414 100644 --- a/fs/f2fs/node.c +++
 b/fs/f2fs/node.c
 @@ -1436,7 +1436,7 @@ static int read_node_page(struct page *page, blk_op
 [...] Content analysis details:   (-2.5 points, 6.0 required)
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
X-Headers-End: 1tzLVV-0003Zk-FI
Subject: [f2fs-dev] [PATCH 065/153] f2fs: Use a folio in f2fs_ra_node_page()
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

Save a call to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 5fe8f48b2ac5..083863557414 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1436,7 +1436,7 @@ static int read_node_page(struct page *page, blk_opf_t op_flags)
  */
 void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid)
 {
-	struct page *apage;
+	struct folio *afolio;
 	int err;
 
 	if (!nid)
@@ -1444,16 +1444,16 @@ void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid)
 	if (f2fs_check_nid_range(sbi, nid))
 		return;
 
-	apage = xa_load(&NODE_MAPPING(sbi)->i_pages, nid);
-	if (apage)
+	afolio = xa_load(&NODE_MAPPING(sbi)->i_pages, nid);
+	if (afolio)
 		return;
 
-	apage = f2fs_grab_cache_page(NODE_MAPPING(sbi), nid, false);
-	if (!apage)
+	afolio = f2fs_grab_cache_folio(NODE_MAPPING(sbi), nid, false);
+	if (IS_ERR(afolio))
 		return;
 
-	err = read_node_page(apage, REQ_RAHEAD);
-	f2fs_put_page(apage, err ? 1 : 0);
+	err = read_node_page(&afolio->page, REQ_RAHEAD);
+	f2fs_folio_put(afolio, err ? true : false);
 }
 
 static int sanity_check_node_footer(struct f2fs_sb_info *sbi,
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
