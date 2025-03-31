Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 042D3A76E89
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLW1-0004A1-Ps;
	Mon, 31 Mar 2025 20:13:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVp-0003xG-Va
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=temWFA5kaYQXF8R1zwnXbhnvhmPb643a6rF8lt1jdn4=; b=IYca3o6EGxb8NMlAXTvIjQP2gR
 R7Eu7WSPlcKTajGqFOJ9bm8Gjdlo64b4qgF+44n/BtuKdqK7Cd608E4rxH7TbrL9JyYliGmJKTe+/
 Yl0V/nRz7mjG0vyDNuqb+h/JEvOu2t96PhAebj3HFnNwc6XIwkaA9xWZdJaElFTv92O8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=temWFA5kaYQXF8R1zwnXbhnvhmPb643a6rF8lt1jdn4=; b=FH5YTQipKu6i+jnHlAld85yS1J
 OCLkEq0juh+au37mThlMXXI8UT/vfQ79L+dCdfTx97FOmyR8yL34U9iCftkbiECLa8jbD1EDmZAzH
 PDsiz6lMafDQ2cp/Mtl4SXE9Ql4A5MbgXcg8F1mnGrl7R3LffHlyp5jZHLyfAoOCOHto=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVk-0003fx-D3 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=temWFA5kaYQXF8R1zwnXbhnvhmPb643a6rF8lt1jdn4=; b=cJ4IYaK5rxcfroNT5UfI42uQag
 JCmJ+UpaQ5KdMsW4zvQ2QH6zzMszYXSj6ftTYEzdj47ad/iyANfhJnGo/K+S3KTZMnCcf68uZf3CX
 IbeYl2ktahLcg3xfr8dz9+VmyTkwmSetZiGSqgUK1zT/5g78CSkCc+eJ4ZzlPXz9Ji75Ls/EdQUhH
 uUNovtgPal0/baI/+WPM3M/vhxNj2YCZllmIwcbDdDVo3VRD/o1X1ThrDgLjrWtsBQW82dt2TyBvO
 jntn8ZJIPYsRi6uyxnclnNDAuDV65V1HweHcL8M15OqpD2FaXrY/G8MudfZAvt6qhJyxTrl9CZ+4d
 7s1Hn9Rg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVY-00000004SQV-46FT;
 Mon, 31 Mar 2025 20:13:21 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:16 +0100
Message-ID: <20250331201256.1057782-117-willy@infradead.org>
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
 Content preview:  Both callers have a folio,
 so pass it in. Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/xattr.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-) diff --git a/fs/f2fs/xattr.c
 b/fs/f2fs/xattr.c index ff49bcba96f3..c07b3d7c45fa 100644 ---
 a/fs/f2fs/xattr.c
 +++ b/fs/f2fs/xattr.c @@ -271,7 +271,7 @@ static struct f2fs_xattr_entry
 *__find_inline_xat [...] 
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
X-Headers-End: 1tzLVk-0003fx-D3
Subject: [f2fs-dev] [PATCH 116/153] f2fs: Pass a folio to read_inline_xattr()
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

Both callers have a folio, so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/xattr.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index ff49bcba96f3..c07b3d7c45fa 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -271,7 +271,7 @@ static struct f2fs_xattr_entry *__find_inline_xattr(struct inode *inode,
 	return entry;
 }
 
-static int read_inline_xattr(struct inode *inode, struct page *ipage,
+static int read_inline_xattr(struct inode *inode, struct folio *ifolio,
 							void *txattr_addr)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
@@ -279,8 +279,8 @@ static int read_inline_xattr(struct inode *inode, struct page *ipage,
 	struct folio *folio = NULL;
 	void *inline_addr;
 
-	if (ipage) {
-		inline_addr = inline_xattr_addr(inode, ipage);
+	if (ifolio) {
+		inline_addr = inline_xattr_addr(inode, &ifolio->page);
 	} else {
 		folio = f2fs_get_inode_folio(sbi, inode->i_ino);
 		if (IS_ERR(folio))
@@ -338,7 +338,7 @@ static int lookup_all_xattrs(struct inode *inode, struct folio *ifolio,
 
 	/* read from inline xattr */
 	if (inline_size) {
-		err = read_inline_xattr(inode, &ifolio->page, txattr_addr);
+		err = read_inline_xattr(inode, ifolio, txattr_addr);
 		if (err)
 			goto out;
 
@@ -402,7 +402,7 @@ static int read_all_xattrs(struct inode *inode, struct folio *ifolio,
 
 	/* read from inline xattr */
 	if (inline_size) {
-		err = read_inline_xattr(inode, &ifolio->page, txattr_addr);
+		err = read_inline_xattr(inode, ifolio, txattr_addr);
 		if (err)
 			goto fail;
 	}
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
