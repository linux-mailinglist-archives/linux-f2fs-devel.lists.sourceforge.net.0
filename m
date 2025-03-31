Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C54DA76EAF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWM-00019B-SZ;
	Mon, 31 Mar 2025 20:14:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVg-0000lf-UD
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qjw5xibtNyi8x65rtUe3k2fUFGZv4Lxhs/wmfXrtFW4=; b=PM38tNsZVTH+xhG7keCas64fCE
 zEz5mKzxouyPxCsdo/kkfE5odS67kOhdHamw0Rv51IQm89KollKK7o6g35hPo6BjgffySzuEwtxb2
 0w+Qv+AEfcpAiPH63ycEXroivxt2/F7ssuvMK7QFPnV7tSONxoMhOSolrqsMkMUWs5AQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qjw5xibtNyi8x65rtUe3k2fUFGZv4Lxhs/wmfXrtFW4=; b=gCmhKQNFVoe1Mtaqa9udq/UMCM
 uGst9VztT0O9ec7sjI44Hr5xMad/EdgElL1ZnQI6rtvTUuB0MmEITOOq6JiUJSnwAH8ULi7ENiGrW
 5l3WcYAQCeOVHfIvOe/OUd6pP1iXmakeREcBkDTG6QLMHRjfxPwODUapAOVLj94Jh160=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVg-0003e7-Na for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=qjw5xibtNyi8x65rtUe3k2fUFGZv4Lxhs/wmfXrtFW4=; b=qKn7KYiTJqbmZz8n546e1wYm9j
 OHlHL0pCghhxkXqSMSZDAWLWILNJH9f0QQA7i7/JJ3iTB1N53kDFFFHzkhtZHpLQISehWbJbK33pH
 fLa1A0BZqCZWC3eGx85BdO7Kk0KtEvSPFdA22fCz5m8ZPnhjMc5G/vztic7dj9MZDO5P+ool8KM2y
 suwtHArhLdQZ/heVSVj7z5lKHBwZvk8Szgj63r4QPCWITT0Xt1UskM2yZXkQEFbaqSRFtetmBqN7n
 p7cRSCCSKlijXNo2ecoTLYn1VXcuI98ty1q+DfGMdAtWrFdXbRN5n74U6+wEV7zC4UKaHXsLCjd0Q
 57YV2Ueg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVV-00000004S8l-1UgY;
 Mon, 31 Mar 2025 20:13:17 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:54 +0100
Message-ID: <20250331201256.1057782-95-willy@infradead.org>
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
 Content preview: Remove a call to compound_head(). Signed-off-by: Matthew
 Wilcox
 (Oracle) <willy@infradead.org> --- fs/f2fs/node.c | 12 ++++++------ 1 file
 changed, 6 insertions(+),
 6 deletions(-) diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
 index cc4c3ba98140..d1fa244c9fa7 100644 --- a/fs/f2fs/node.c +++
 b/fs/f2fs/node.c
 @@ -1242,20 +1242,20 @@ int f2fs_truncate_xattr_node(struct inode *inode)
 [...] Content analysis details:   (-2.5 points, 6.0 required)
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
X-Headers-End: 1tzLVg-0003e7-Na
Subject: [f2fs-dev] [PATCH 094/153] f2fs: Use a folio in
 f2fs_truncate_xattr_node()
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

Remove a call to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index cc4c3ba98140..d1fa244c9fa7 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1242,20 +1242,20 @@ int f2fs_truncate_xattr_node(struct inode *inode)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	nid_t nid = F2FS_I(inode)->i_xattr_nid;
 	struct dnode_of_data dn;
-	struct page *npage;
+	struct folio *nfolio;
 	int err;
 
 	if (!nid)
 		return 0;
 
-	npage = f2fs_get_xnode_page(sbi, nid);
-	if (IS_ERR(npage))
-		return PTR_ERR(npage);
+	nfolio = f2fs_get_xnode_folio(sbi, nid);
+	if (IS_ERR(nfolio))
+		return PTR_ERR(nfolio);
 
-	set_new_dnode(&dn, inode, NULL, npage, nid);
+	set_new_dnode(&dn, inode, NULL, &nfolio->page, nid);
 	err = truncate_node(&dn);
 	if (err) {
-		f2fs_put_page(npage, 1);
+		f2fs_folio_put(nfolio, true);
 		return err;
 	}
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
