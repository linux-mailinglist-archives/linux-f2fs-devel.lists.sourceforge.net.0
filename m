Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95426AFD432
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Yo3+83B22EMnEsbvRtbcpkJUW9Cu9cm2HdeeTkyegw=; b=k6SCc0qAhLJ7zGg2XgNHWXcUde
	rNXDSDV0ve49vyEJD9+F4t9uvYZ9mgAItYWjea/O0aNsuaYY1RP7fbAVaoB1MvsXhdP0561bKVn37
	g1W6VERCbUtZjJ9Alh3SGiq+tmLwz3009OR9JyMCnQrcYoH68MhodyBr1zTO4NJmQusI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBju-0005FV-EE;
	Tue, 08 Jul 2025 17:04:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjs-0005EA-Fn
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IwJ9kWbJXxnQwXvC4oYYrd23pyw0pdtioDNcAmj2l+M=; b=dkxhJ4zG+N6tSa0YUsqhBAdma6
 Rpe9OITgDvSvkfCPhci5aOprF68SliRY/Q3TqKUl+cvj1NXDmc76z3CLObgoP+T2YXELjUItXvUB0
 TIWsN9mR37DXFbhmAQky1HDpjmY1DPjTBZMg6UkwR/oLKemN0QQCWx+Ubsw0zKgzMenY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IwJ9kWbJXxnQwXvC4oYYrd23pyw0pdtioDNcAmj2l+M=; b=kxDHUnJEm0i1X5CT4JjWaHJBl4
 nlqDD9jTcik3POxrde3Nfp4F4Ar2n/MR/qtN4KiSZmwR23VnTZAuOBlNYwOBvF5yWLwaFxxikQLdr
 eXg2CeL5Ah274ZrCghW86yjA/uH3jPs1ucjag24ZGzB7e+0ZrtXpMKy2MUG7RJ0MQhK4=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjp-0006EO-M3 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=IwJ9kWbJXxnQwXvC4oYYrd23pyw0pdtioDNcAmj2l+M=; b=IREUPf7UPeLYo5wrluymflwlrM
 HUjNqaxEtLh/ragl2OLjdfIb4ZDRGrSywLj2+KDX4vGmuVWt/lqjosmUZJG8WhOvkSATqBZ/y+D8j
 7ZesHg+sP7sNSqp5R8M9zeupntN3TCixVojrmOfbWMxo3ix3o4uOO9go3pehVseb9t8GG9rE/owQJ
 RzDvx59vDz5Hh+gHz6NhP4IfeB20OXsBCLK9X0efsNYLNS7z71a01GL/7ddXleW5CMX3WTH1Go4uR
 y6NkrOQSIBkTlJjHl+FRStHojbcaUhB05ubD34rOOcVo1JRtPYSbDlUqoe3yRpIVSG59lRHBwkm6m
 dAdO03Jg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBje-00000000T3g-1AUD;
 Tue, 08 Jul 2025 17:04:02 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:03 +0100
Message-ID: <20250708170359.111653-7-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The only caller has a folio, so pass it in. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/inode.c | 16
 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-) diff --git a/fs/f2fs/inode.c
 b/fs/f2fs/inode.c index 6ce6279e4eb5..6b91531f79a4 100644 ---
 a/fs/f2fs/inode.c +++ b/fs/f2fs/inode.c @@ -266, 28 +266,
 28 @@ static bool sanity_check_compress_inode(struct [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZBjp-0006EO-M3
Subject: [f2fs-dev] [PATCH 06/60] f2fs: Pass a folio to sanity_check_inode()
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

The only caller has a folio, so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/inode.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 6ce6279e4eb5..6b91531f79a4 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -266,28 +266,28 @@ static bool sanity_check_compress_inode(struct inode *inode,
 	return false;
 }
 
-static bool sanity_check_inode(struct inode *inode, struct page *node_page)
+static bool sanity_check_inode(struct inode *inode, struct folio *node_folio)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
-	struct f2fs_inode *ri = F2FS_INODE(node_page);
+	struct f2fs_inode *ri = F2FS_INODE(&node_folio->page);
 	unsigned long long iblocks;
 
-	iblocks = le64_to_cpu(F2FS_INODE(node_page)->i_blocks);
+	iblocks = le64_to_cpu(F2FS_INODE(&node_folio->page)->i_blocks);
 	if (!iblocks) {
 		f2fs_warn(sbi, "%s: corrupted inode i_blocks i_ino=%lx iblocks=%llu, run fsck to fix.",
 			  __func__, inode->i_ino, iblocks);
 		return false;
 	}
 
-	if (ino_of_node(node_page) != nid_of_node(node_page)) {
+	if (ino_of_node(&node_folio->page) != nid_of_node(&node_folio->page)) {
 		f2fs_warn(sbi, "%s: corrupted inode footer i_ino=%lx, ino,nid: [%u, %u] run fsck to fix.",
 			  __func__, inode->i_ino,
-			  ino_of_node(node_page), nid_of_node(node_page));
+			  ino_of_node(&node_folio->page), nid_of_node(&node_folio->page));
 		return false;
 	}
 
-	if (ino_of_node(node_page) == fi->i_xattr_nid) {
+	if (ino_of_node(&node_folio->page) == fi->i_xattr_nid) {
 		f2fs_warn(sbi, "%s: corrupted inode i_ino=%lx, xnid=%x, run fsck to fix.",
 			  __func__, inode->i_ino, fi->i_xattr_nid);
 		return false;
@@ -354,7 +354,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 		}
 	}
 
-	if (f2fs_sanity_check_inline_data(inode, node_page)) {
+	if (f2fs_sanity_check_inline_data(inode, &node_folio->page)) {
 		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
 			  __func__, inode->i_ino, inode->i_mode);
 		return false;
@@ -469,7 +469,7 @@ static int do_read_inode(struct inode *inode)
 		fi->i_inline_xattr_size = 0;
 	}
 
-	if (!sanity_check_inode(inode, &node_folio->page)) {
+	if (!sanity_check_inode(inode, node_folio)) {
 		f2fs_folio_put(node_folio, true);
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_handle_error(sbi, ERROR_CORRUPTED_INODE);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
