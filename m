Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2099EA76EA2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWC-0001Ku-3f;
	Mon, 31 Mar 2025 20:14:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVn-000151-DS
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FktOkhHlSxH0iDj9aE3yB+k3poOZmfBlXIDQdzUhork=; b=YGdnVxjsyQbuYvg8bVAKBXlERZ
 8ASJvaNltOBhHXFAxF4SL19B4nhpRY1RX/YBRYI6flBgGR/gyflyziE73e0za4urtF9aJPjgGmQ0R
 n6XgvZcigXZpSjbrE5ob0M2zbD/2mdZ6vU7ASpORadsToJtfzZtxRsIw2ynPunZfIx4E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FktOkhHlSxH0iDj9aE3yB+k3poOZmfBlXIDQdzUhork=; b=MFFoldKTQ2iaLoCQSLmX0tdQ5j
 xHKVXHbfzhoL8NUB8Lc0Lr3t2PfUKCA3piX2w4O8P8ByyQit6owqs+8jtLm8mWAWRiDdJkTDUmlZf
 5dkgL/4HXpX2j1M9yxjlr+IGWDt5BUEptIHKdTCXC7JnSofls1zm9tR5pvYiSiXgBjxc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVi-0003f1-Kx for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=FktOkhHlSxH0iDj9aE3yB+k3poOZmfBlXIDQdzUhork=; b=WeLPmBgOXxbAeC0MZm/d0naoF6
 OaechCb075cBfXVZe7xJpSYaQNeZDKYaRSXmtWIFe2uJpkEP4mSf1QAWuWu/0yxKX7K5x6tjgoOsN
 KpfIZRgY6ntMYVrogzcxjcGk+LxqsObJtQ3cgwhQDQJXnR2jOBpFOL1CWVjPEDHXpP1Kv6bZJLrMZ
 AMjBH336H+MoRYFdcerG7xcbKXk7PEhO1vO9rIlAMxo+FjKwxdiouShhyqh/01A47eOFaq415+nqH
 DofFAE3XpPPet0k/zUDqM2S4m72PAJvIQlU2tF7d6CrpQm0yVdnLTyZ/kv96SvmVci43I9Rj5agre
 Cenlqhyw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVX-00000004SHU-0glw;
 Mon, 31 Mar 2025 20:13:19 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:05 +0100
Message-ID: <20250331201256.1057782-106-willy@infradead.org>
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
 Content preview: Remove a call to compound_head(). Signed-off-by: Matthew
 Wilcox
 (Oracle) <willy@infradead.org> --- fs/f2fs/inline.c | 14 +++++++------- 1
 file changed, 7 insertions(+), 7 deletions(-) diff --git a/fs/f2fs/inline.c
 b/fs/f2fs/inline.c index fda56c7e848e..81a6ab05363e 100644 ---
 a/fs/f2fs/inline.c +++ b/fs/f2fs/inline.c @@ -794, 12 +794,
 12 @@ int f2fs_inline_data_fiemap(struct inode *i [...] 
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
X-Headers-End: 1tzLVi-0003f1-Kx
Subject: [f2fs-dev] [PATCH 105/153] f2fs: Use a folio in
 f2fs_inline_data_fiemap()
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
 fs/f2fs/inline.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index fda56c7e848e..81a6ab05363e 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -794,12 +794,12 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 	__u32 flags = FIEMAP_EXTENT_DATA_INLINE | FIEMAP_EXTENT_NOT_ALIGNED |
 		FIEMAP_EXTENT_LAST;
 	struct node_info ni;
-	struct page *ipage;
+	struct folio *ifolio;
 	int err = 0;
 
-	ipage = f2fs_get_inode_page(F2FS_I_SB(inode), inode->i_ino);
-	if (IS_ERR(ipage))
-		return PTR_ERR(ipage);
+	ifolio = f2fs_get_inode_folio(F2FS_I_SB(inode), inode->i_ino);
+	if (IS_ERR(ifolio))
+		return PTR_ERR(ifolio);
 
 	if ((S_ISREG(inode->i_mode) || S_ISLNK(inode->i_mode)) &&
 				!f2fs_has_inline_data(inode)) {
@@ -824,11 +824,11 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 		goto out;
 
 	byteaddr = (__u64)ni.blk_addr << inode->i_sb->s_blocksize_bits;
-	byteaddr += (char *)inline_data_addr(inode, ipage) -
-					(char *)F2FS_INODE(ipage);
+	byteaddr += (char *)inline_data_addr(inode, &ifolio->page) -
+					(char *)F2FS_INODE(&ifolio->page);
 	err = fiemap_fill_next_extent(fieinfo, start, byteaddr, ilen, flags);
 	trace_f2fs_fiemap(inode, start, byteaddr, ilen, flags, err);
 out:
-	f2fs_put_page(ipage, 1);
+	f2fs_folio_put(ifolio, true);
 	return err;
 }
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
