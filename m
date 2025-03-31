Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C75A76E61
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVr-0000tl-UC;
	Mon, 31 Mar 2025 20:13:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVc-0000kp-AD
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZVVzQEttUyU8CT5M2dqeFgjP5oY+v6hQUuJM6uII//4=; b=OR9xvuj6EZSFTnAVl8C5VRPdrC
 DRpH132IKvg0ggpoJsj9QUQiqpTRRfFZz+98ALETb0rvkjTAMEHTqJ2nw9BE6+obJ82IeUhHE0kbW
 1oC8zGyGqAMDTQHUMANpwzMMCo1f9lVoed/hRNb7ocjiJh6MEP98bdAQP4X+pa06hsDI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZVVzQEttUyU8CT5M2dqeFgjP5oY+v6hQUuJM6uII//4=; b=W+q0NatcocvscpnLYfiyqHMHu3
 vK+MjnyNqHqEDmi2xQ0IfRZp4foa6HdieviKhOAzopCMmDOtv8t+eHAVTRDuGLL9fWi3nJRuidxnW
 5syDcOLOR3SpSTANwm8+iFQiLDIc+RVf+Snury5IfF1Pncgkl+3Fu+sId6gob2Nti70U=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVX-0003aI-5d for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=ZVVzQEttUyU8CT5M2dqeFgjP5oY+v6hQUuJM6uII//4=; b=AlD1HksBMoWO6jFVk5seK/0q4l
 b5xaMEi0OThR31d/ZV9Cb36Wj+W5CsqcFdPstroTTDWeBKSdVjZvXkHk8zjDETG5qT5Z8lNiBKIM7
 clUv3yPlqed7MQO7KzSroI0JRk8d5Qonu9vv+4gYxM1xwrNa+Ys98YBZ798tf5MgGgGdJF8afpEoe
 apSaiePufvvF4iz3nJ+Xo90zf87Vey07Una13bchlDWojllVNPyOONlle+SyrCkuix/cgS9zqCjpn
 9Na1cttp/0NnDoT7BxhLqLx2Qs85+24s8ZKG+mQLgLKJLzzepRYZgRSR2z6mjH0eiwzqkRGRe64Dg
 Ong3x5ow==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVL-00000004RhG-2naE;
 Mon, 31 Mar 2025 20:13:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:05 +0100
Message-ID: <20250331201256.1057782-46-willy@infradead.org>
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
 Content preview: Get a folio instead of a page and operate on it. Saves a call
 to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/dir.c | 12 ++++++------ 1 file changed, 6 insertions(+),
 6 deletions(-)
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
X-Headers-End: 1tzLVX-0003aI-5d
Subject: [f2fs-dev] [PATCH 045/153] f2fs: Use a folio in f2fs_delete_entry()
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

Get a folio instead of a page and operate on it.  Saves a call to
compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/dir.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index f2dd3c159e28..a24f04fc9073 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -912,7 +912,6 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct page *page,
 bool f2fs_empty_dir(struct inode *dir)
 {
 	unsigned long bidx = 0;
-	struct page *dentry_page;
 	unsigned int bit_pos;
 	struct f2fs_dentry_block *dentry_blk;
 	unsigned long nblock = dir_blocks(dir);
@@ -922,10 +921,11 @@ bool f2fs_empty_dir(struct inode *dir)
 
 	while (bidx < nblock) {
 		pgoff_t next_pgofs;
+		struct folio *dentry_folio;
 
-		dentry_page = f2fs_find_data_page(dir, bidx, &next_pgofs);
-		if (IS_ERR(dentry_page)) {
-			if (PTR_ERR(dentry_page) == -ENOENT) {
+		dentry_folio = f2fs_find_data_folio(dir, bidx, &next_pgofs);
+		if (IS_ERR(dentry_folio)) {
+			if (PTR_ERR(dentry_folio) == -ENOENT) {
 				bidx = next_pgofs;
 				continue;
 			} else {
@@ -933,7 +933,7 @@ bool f2fs_empty_dir(struct inode *dir)
 			}
 		}
 
-		dentry_blk = page_address(dentry_page);
+		dentry_blk = folio_address(dentry_folio);
 		if (bidx == 0)
 			bit_pos = 2;
 		else
@@ -942,7 +942,7 @@ bool f2fs_empty_dir(struct inode *dir)
 						NR_DENTRY_IN_BLOCK,
 						bit_pos);
 
-		f2fs_put_page(dentry_page, 0);
+		f2fs_folio_put(dentry_folio, false);
 
 		if (bit_pos < NR_DENTRY_IN_BLOCK)
 			return false;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
