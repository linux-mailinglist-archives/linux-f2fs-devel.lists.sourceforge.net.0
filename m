Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1A1D1108D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 09:03:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajoZSBz81itYMQygU8pMjjBggeRR347lIW2opHVRUr8=; b=cfsO/M2DxsCnqUvOA24SyMRZ7j
	5Fnc5/s6V4n8mnfrYvXNyJITFHNpWSxyQ6s0egSLKZilG7vDSpCKk6TsQkl2TIqe+H+R5fQCan1rC
	O2mRD/tbi+rjEyMabiNHVnHf8o/0MiwNDHj8MoEPyRj90DBHH+6tnf446fGDuFIfupPU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfCtc-0007JK-RY;
	Mon, 12 Jan 2026 08:03:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vfCtY-0007HX-Mq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 08:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TjxAzqYnhsBHIlpoB58i5yuEhi5ASygP8u5auiqE5Qo=; b=Z2OsMYf+a+mqoxriOmyvofR/Zs
 qQLoNYTePS5YIkWZ38W3bE6DdEV26anO0y538OLE0Nm31V85TWh5XYQWkf+RKit5B0ycIBnuQNIbz
 5SuOLh50zR+1Lkh6LWNnz962z/VBaUYAIYlbEwuNrAPfnu/TCT4jMOgl8X+HLEwSckHk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TjxAzqYnhsBHIlpoB58i5yuEhi5ASygP8u5auiqE5Qo=; b=RpdYU3qX73uyepa9qTpIYuOOlS
 4rjTaoSS7NIfoIsNsoG3IRrI8vnFE6QcJV9pMRkoJvYxtdsCgc/rRfnaRI+2/Eb1gkwpjiGlqSSjB
 URa7aCWZFbXe6HssFIN/Js/tSIMKmwRq1AfAarL7JRxw0ojQQxmj7XdJKjQdFlBSqu5U=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfCtY-00041f-B9 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 08:03:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EA8D94438C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Jan 2026 08:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2098C19422;
 Mon, 12 Jan 2026 08:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768204998;
 bh=+S81VkDwUjl2ErYw3m0WiPBfUE/SwQLze82OjbLOVoY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mlnoW9+vPazu+kFEXnuFloiRzRMdrom+4ASnXCkIzukmXfASkjQZibM374/nx4wi5
 b36wUmu+qHwi2lviib5R2EzgBZmRCyIUmz1ClCsMWf6h7M4bzHPHgQwgjsrOG3CZne
 6lGtrXfEbFB5N2c2w9vrSeVB/Nz1nYmhomuTz4jwDVpxHiOKJRqi14meMNtolih3i0
 VsUArtw1fisrhtPaYhk1ORTBkMi4ZClmrUL+w4f4B3zLupBG5GBZGfpy5lesTHY7RE
 cH0ysrM6OTC5+B2O+QquULndeTvpPgMUnIMZfYyzT9mUti8CJVV5yennZBjMDSSgqJ
 bp+5jynNU/mqg==
To: jaegeuk@kernel.org
Date: Mon, 12 Jan 2026 15:49:17 +0800
Message-Id: <20260112074917.40107-3-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20260112074917.40107-1-chao@kernel.org>
References: <20260112074917.40107-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's enhance sanity_check_node_footer() to detect more
 inconsistent
 cases as below: Node Type Node Footer Info ===================
 =============================
 NODE_TYPE_REGULAR inode = true and xnode = true NODE_TYPE_INODE inode = false
 or xnode = true NODE_TYPE_XATTR inode = true [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfCtY-00041f-B9
Subject: [f2fs-dev] [PATCH v5 3/3] f2fs: detect more inconsistent cases in
 sanity_check_node_footer()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's enhance sanity_check_node_footer() to detect more inconsistent
cases as below:

Node Type			Node Footer Info
===================		=============================
NODE_TYPE_REGULAR		inode = true and xnode = true
NODE_TYPE_INODE			inode = false or xnode = true
NODE_TYPE_XATTR			inode = true or xnode = false
NODE_TYPE_NON_INODE		inode = false

Signed-off-by: Chao Yu <chao@kernel.org>
---
v5:
- split original patch 1/2 to two, in this patch, fix to not sanity check
on uninitialized i_mode for new inode page, instead, let's enhance
sanity_check_node_footer() to detect more inconsistent cases in node footer.
 fs/f2fs/node.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e8b2618fcac7..c79af2bc5728 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1515,20 +1515,29 @@ int f2fs_sanity_check_node_footer(struct f2fs_sb_info *sbi,
 					struct folio *folio, pgoff_t nid,
 					enum node_type ntype, bool in_irq)
 {
+	bool is_inode, is_xnode;
+
 	if (unlikely(nid != nid_of_node(folio)))
 		goto out_err;
 
+	is_inode = IS_INODE(folio);
+	is_xnode = f2fs_has_xattr_block(ofs_of_node(folio));
+
 	switch (ntype) {
+	case NODE_TYPE_REGULAR:
+		if (is_inode && is_xnode)
+			goto out_err;
+		break;
 	case NODE_TYPE_INODE:
-		if (!IS_INODE(folio))
+		if (!is_inode || is_xnode)
 			goto out_err;
 		break;
 	case NODE_TYPE_XATTR:
-		if (!f2fs_has_xattr_block(ofs_of_node(folio)))
+		if (is_inode || !is_xnode)
 			goto out_err;
 		break;
 	case NODE_TYPE_NON_INODE:
-		if (IS_INODE(folio))
+		if (is_inode)
 			goto out_err;
 		break;
 	default:
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
