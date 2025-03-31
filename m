Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F781A76E6B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVu-0003zr-QD;
	Mon, 31 Mar 2025 20:13:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVf-0003pk-Gv
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5nSgVvttRfPvSr+vL17rH0O+/947KP37lzIfDPMmrJ4=; b=AQd1dxdyW6uu/KREC9m++eITXy
 5qZb2fMc9C/oTcEYeyDKM5DkYAsByQFd1abox9cpzrY70bbjF0RZJ2RvYupzZKI5lrUQqgnEVpG9r
 +QZJsSXvGF3MRwQ1w0jvwu3qubwCBxTFmYWyuNjuSl9EJHHu68xExeGGm46tMzLvRu5E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5nSgVvttRfPvSr+vL17rH0O+/947KP37lzIfDPMmrJ4=; b=S9NRNbYqdGyy2+6qHH2A6hG4W5
 jvGDrBVr8Z0aaLoMvGD4JKbUphkIhBzudlg0EZhm0xUV/habdzGvjB7dRB0ravPstGvSm5oWqvtyW
 9BYMfr7ipBndTE61NuV8n6y6V+UM/YCnhYGsAyU3Yy7BqZyqZvaiK//V2EggvtDalHaQ=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVe-0003dP-Ru for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=5nSgVvttRfPvSr+vL17rH0O+/947KP37lzIfDPMmrJ4=; b=ipx3A3jEDkn6QXch+c0CJiH9TH
 dq0s0ydxnwm2a6zpW0x9kfJ509wZfA5GAfpsc2incPAUUxg+QSX/wC7vysx2YcbOGV2EGPNlzn14F
 YzF/2RZNUbZmvPCpxcnY/lv/1gpQMryBSM1s0uxPJKJBs/+wsN40ONTzRX478JdMakcZho5DUsaX4
 Yr0MUl9JDH3pItWQrMe7IKvZyomjqx05gXcf/sZaAGtcbVKLkaCwXkJUD+uULeulCgYbdaFSPZl3/
 zV5yEx99LcOvvHwbrUShk8jRYHrcP2rWh+Ev9/6uDgZTrOxdb+UFUoAxH5twr8VmajlFNN1N+yb/l
 9VqTbxog==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVY-00000004SOM-1yjf;
 Mon, 31 Mar 2025 20:13:20 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:13 +0100
Message-ID: <20250331201256.1057782-114-willy@infradead.org>
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
 Content preview: Remove a hidden call to compound_head(). Signed-off-by:
 Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/node.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-) diff --git a/fs/f2fs/node.c
 b/fs/f2fs/node.c index 2db41552ae76..b451374c255a 100644 --- a/fs/f2fs/node.c
 +++ b/fs/f2fs/node.c @@ -2724, 12 +2724,
 12 @@ int f2fs_recover_inline_xattr(struct inode *inode [...] 
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
X-Headers-End: 1tzLVe-0003dP-Ru
Subject: [f2fs-dev] [PATCH 113/153] f2fs: Use a folio in
 f2fs_recover_inline_xattr()
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

Remove a hidden call to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 2db41552ae76..b451374c255a 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2724,12 +2724,12 @@ int f2fs_recover_inline_xattr(struct inode *inode, struct page *page)
 {
 	void *src_addr, *dst_addr;
 	size_t inline_size;
-	struct page *ipage;
+	struct folio *ifolio;
 	struct f2fs_inode *ri;
 
-	ipage = f2fs_get_inode_page(F2FS_I_SB(inode), inode->i_ino);
-	if (IS_ERR(ipage))
-		return PTR_ERR(ipage);
+	ifolio = f2fs_get_inode_folio(F2FS_I_SB(inode), inode->i_ino);
+	if (IS_ERR(ifolio))
+		return PTR_ERR(ifolio);
 
 	ri = F2FS_INODE(page);
 	if (ri->i_inline & F2FS_INLINE_XATTR) {
@@ -2745,15 +2745,15 @@ int f2fs_recover_inline_xattr(struct inode *inode, struct page *page)
 		goto update_inode;
 	}
 
-	dst_addr = inline_xattr_addr(inode, ipage);
+	dst_addr = inline_xattr_addr(inode, &ifolio->page);
 	src_addr = inline_xattr_addr(inode, page);
 	inline_size = inline_xattr_size(inode);
 
-	f2fs_wait_on_page_writeback(ipage, NODE, true, true);
+	f2fs_folio_wait_writeback(ifolio, NODE, true, true);
 	memcpy(dst_addr, src_addr, inline_size);
 update_inode:
-	f2fs_update_inode(inode, ipage);
-	f2fs_put_page(ipage, 1);
+	f2fs_update_inode(inode, &ifolio->page);
+	f2fs_folio_put(ifolio, true);
 	return 0;
 }
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
