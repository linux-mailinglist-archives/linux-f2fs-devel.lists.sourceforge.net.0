Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF90A76EB8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWT-0001Ci-0G;
	Mon, 31 Mar 2025 20:14:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVm-0000os-B2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RrTSVrTrJMYpkQcmctfnN5cyED60W75xRhIPnWYliUQ=; b=NmkkRVJ/x/MOXCK+qDfyicf/0Z
 E/F9a4N8QpZbxzUX7gy7r0Y/mn01jfGTDia2yzt/ehMwcV/N9LgCVFyrhBsRxC9MHVQsd0wu8yRFG
 MOC+j/ssQysU7dSo/wHo13OfnAKtkfNwBam8YGLHDsI5LKw70C5hjfxmwwmw+NOJH8lE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RrTSVrTrJMYpkQcmctfnN5cyED60W75xRhIPnWYliUQ=; b=ZFvJgw6/j3yNmT1as/Ji9y+Z8W
 irOuI/s2hwmGSihHnDu6MciO9nzHhGCL55Ck+OyDSE+NscYfSWwJ05ZAILoQ9GOL6qekyJejUvHxP
 280/PvyTlCGnbuPtf8PXbYxoAU88kUDbC9pueqeUQ4iJBhNpjFKUjUEc9wBz+pO2o5V0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVh-0003eK-5l for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=RrTSVrTrJMYpkQcmctfnN5cyED60W75xRhIPnWYliUQ=; b=iH8y3eYgPpcHep4S8KX9NzzwuG
 Vl5YNIRK6JAHGFJx8v/pM2hMR+6VnTNINOfdBfYyH1BDtyQ/I2V66ecroCWyqDnhZUb8mrp2jUfSU
 2XosjAVKIt1d6K0+/48QzPUVOTLi2H1lAxRtL3hxMb6wqRxdZs7pqVB9uwTxU3jYiQUDS8KARdpLB
 GYqWeNSCmVXPVYx47Jea8itpUAnEuZZ1+xsRgqjedLzhabxFGspVCUV3N9qF2rmulLuh1Rf6UFCHU
 bU2FlnDQk4KtoMV/gVkFlQFBhX+vbMNLtChkPrJ+9If0mkNkSXVVARMmh5SLdneguh3M4oduiWXS6
 QdGJ/oFg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVV-00000004SAY-3Ppw;
 Mon, 31 Mar 2025 20:13:17 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:57 +0100
Message-ID: <20250331201256.1057782-98-willy@infradead.org>
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
 Content preview: Remove a call to compound_head() Signed-off-by: Matthew
 Wilcox
 (Oracle) <willy@infradead.org> --- fs/f2fs/xattr.c | 12 ++++++------ 1 file
 changed, 6 insertions(+),
 6 deletions(-) diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
 index d58b1e44e133..dd632df8d944 100644 --- a/fs/f2fs/xattr.c +++
 b/fs/f2fs/xattr.c
 @@ -299,17 +299,17 @@ static int read_xattr_block(struct inode *inode [...]
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
X-Headers-End: 1tzLVh-0003eK-5l
Subject: [f2fs-dev] [PATCH 097/153] f2fs: Use a folio in read_xattr_block()
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

Remove a call to compound_head()

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/xattr.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index d58b1e44e133..dd632df8d944 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -299,17 +299,17 @@ static int read_xattr_block(struct inode *inode, void *txattr_addr)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	nid_t xnid = F2FS_I(inode)->i_xattr_nid;
 	unsigned int inline_size = inline_xattr_size(inode);
-	struct page *xpage;
+	struct folio *xfolio;
 	void *xattr_addr;
 
 	/* The inode already has an extended attribute block. */
-	xpage = f2fs_get_xnode_page(sbi, xnid);
-	if (IS_ERR(xpage))
-		return PTR_ERR(xpage);
+	xfolio = f2fs_get_xnode_folio(sbi, xnid);
+	if (IS_ERR(xfolio))
+		return PTR_ERR(xfolio);
 
-	xattr_addr = page_address(xpage);
+	xattr_addr = folio_address(xfolio);
 	memcpy(txattr_addr + inline_size, xattr_addr, VALID_XATTR_BLOCK_SIZE);
-	f2fs_put_page(xpage, 1);
+	f2fs_folio_put(xfolio, true);
 
 	return 0;
 }
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
