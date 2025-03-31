Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CF3A76E60
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVr-00017g-6f;
	Mon, 31 Mar 2025 20:13:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVg-000117-4s
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ORhRBgpjl/mJLkSjNw4lX0BD9+W0aqv9xsBmMTyKTt4=; b=KqV+mOx/6vvYZBHh4u0rp4h52M
 OSbq+HdqjPuyXGA2qN06p4q5Vd2SfAIKw7wH9P1c1cy2jRCZLofwh8Kzs2Pb0W4MGTWu0EvBRydK9
 qWUDO6I6X3ylPPT/E0vO0iIbWc9+hT96Ow/M7wNX52isPm6U5kndZPlFAUvYyKAQv3/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ORhRBgpjl/mJLkSjNw4lX0BD9+W0aqv9xsBmMTyKTt4=; b=kZJaXRKOHrp5aERMUhHUs8wyS8
 pda0tfYNTrftdhrWsonXgYzV8zytHuuJZWVXuMUPsovdRsKwG/rH72lqp4ArXZHxj1BbHSvM0UOW2
 xV5qbMEZERAno4tMBv/2vse/45SwaZXYVSWbOnFSvRtpckACy7afdgumg+Hs7CxiBxmg=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVV-0003Zx-VS for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=ORhRBgpjl/mJLkSjNw4lX0BD9+W0aqv9xsBmMTyKTt4=; b=p/gSMxKOQcWdw0u1lMz2JSAN95
 55Fcm1gnZTjx/FrtsL52FZEwu6UqhZ4ttUx1c9f89Eym5ZaK8yvosdHP8khbkJO0eZKTOGXvpMORV
 KBD3H108R13aIpOeAjJxg8yoGALy64NMam10rImxQ/CRQlhKvge1WZZXUOciAXtdgjfFJJwh+xY7X
 5adnOngMiK2haWQRzQzAwudGEZYZDhwNxFg0V73h+dy+j5G2W/DzX7rSv7SjemGIr1XtoDotVoOTd
 ZjRswoRn466ILeY2g21IffDBSdGFD4Od3HlDE7q2G6qjQNRE4UaGol5tUgS8lJ7trh73VnG+hU+i3
 Bhv9lw1g==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVP-00000004Rsh-24xZ;
 Mon, 31 Mar 2025 20:13:11 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:28 +0100
Message-ID: <20250331201256.1057782-69-willy@infradead.org>
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
 Content preview:  Save four hidden calls to compound_head(). Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/node.c | 20
 ++++++++++
 1 file changed, 10 insertions(+), 10 deletions(-) diff --git a/fs/f2fs/node.c
 b/fs/f2fs/node.c index e63bfdd807b3..225006e6ba32 100644 --- a/fs/f2fs/node.c
 +++ b/fs/f2fs/node.c @@ -2817, 7 +2817, 7 @@ int f2fs_recover_inode_page(struct
 f2fs_sb_info *sb [...] 
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
X-Headers-End: 1tzLVV-0003Zx-VS
Subject: [f2fs-dev] [PATCH 068/153] f2fs: Use a folio in
 f2fs_recover_inode_page()
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

Save four hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e63bfdd807b3..225006e6ba32 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2817,7 +2817,7 @@ int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct page *page)
 	struct f2fs_inode *src, *dst;
 	nid_t ino = ino_of_node(page);
 	struct node_info old_ni, new_ni;
-	struct page *ipage;
+	struct folio *ifolio;
 	int err;
 
 	err = f2fs_get_node_info(sbi, ino, &old_ni, false);
@@ -2827,8 +2827,8 @@ int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct page *page)
 	if (unlikely(old_ni.blk_addr != NULL_ADDR))
 		return -EINVAL;
 retry:
-	ipage = f2fs_grab_cache_page(NODE_MAPPING(sbi), ino, false);
-	if (!ipage) {
+	ifolio = f2fs_grab_cache_folio(NODE_MAPPING(sbi), ino, false);
+	if (IS_ERR(ifolio)) {
 		memalloc_retry_wait(GFP_NOFS);
 		goto retry;
 	}
@@ -2836,13 +2836,13 @@ int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct page *page)
 	/* Should not use this inode from free nid list */
 	remove_free_nid(sbi, ino);
 
-	if (!PageUptodate(ipage))
-		SetPageUptodate(ipage);
-	fill_node_footer(ipage, ino, ino, 0, true);
-	set_cold_node(ipage, false);
+	if (!folio_test_uptodate(ifolio))
+		folio_mark_uptodate(ifolio);
+	fill_node_footer(&ifolio->page, ino, ino, 0, true);
+	set_cold_node(&ifolio->page, false);
 
 	src = F2FS_INODE(page);
-	dst = F2FS_INODE(ipage);
+	dst = F2FS_INODE(&ifolio->page);
 
 	memcpy(dst, src, offsetof(struct f2fs_inode, i_ext));
 	dst->i_size = 0;
@@ -2878,8 +2878,8 @@ int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct page *page)
 		WARN_ON(1);
 	set_node_addr(sbi, &new_ni, NEW_ADDR, false);
 	inc_valid_inode_count(sbi);
-	set_page_dirty(ipage);
-	f2fs_put_page(ipage, 1);
+	folio_mark_dirty(ifolio);
+	f2fs_folio_put(ifolio, true);
 	return 0;
 }
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
