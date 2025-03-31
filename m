Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4BFA76E3E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVh-0003qx-QB;
	Mon, 31 Mar 2025 20:13:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVZ-0003m4-Ql
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lTeMed4bBP5yT1MhNG9IRVhe65cRqBYthSkFlgZWHIs=; b=H3YNpAVZzMxwa6Xd6xwX62+NWq
 E6ZbPkziUObZdjKMOEPpwYJjjucmFKsFwU0mzuadbX+3PYFDuuP5W/aQR2o5NkKimr3G8CR5hNMZF
 9yMILJE1vhVDvwEo1FPaNcPe36fC/eeZ9TtCHQrTd0qSlnSOTaNlvh+57gSdKwZRW+gA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lTeMed4bBP5yT1MhNG9IRVhe65cRqBYthSkFlgZWHIs=; b=USBwWecTuOl6zi77RCAt1qBE+H
 mGHPVqdxUScrk78ous/Demxr2cNRF/J2SGUwQHsUGgZ2ZVFEgDq77lzNLU2QfmGqcWzxpo3HhWWcS
 Oz9uKw95spuS4h+aVYH07ZqcOteCOWD3KPMi0GmdDxvcvvg3AtyTeMJwbiiBMfilcBLA=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVU-0003ZU-7m for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=lTeMed4bBP5yT1MhNG9IRVhe65cRqBYthSkFlgZWHIs=; b=Z/EkGlyIEJJZRhBkhyxZ0qyjq9
 Ue1rUZUXIPkpACDp6LjVIQtEhM1ds0zovwaKByubJl6mXxZVT22IOQ6K6668jJ3HEN76EsRu2eXFm
 tfjt34q7oYYa9EuUMzMjuGGSAPUwjSQM0SHGi/5cTaQnvP38SVNX2VhtusRCbW/2zQuKtpWrmyxQ1
 +icGJDS7+OiMEm5iG2m/6DUJcrD9ObzhiY9IOqC93vuQZLUN16BKzlxpkbGkjJpMLlL6a442kryS3
 XrSkqJxxA53dqj6jlPp0ksQqUjD5mv9V0sCELgRGuJY14KIlc1/h+D4zy+hsNxJJM27rLBXuTJxXg
 rvkNk1wQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVN-00000004Ro6-3TEh;
 Mon, 31 Mar 2025 20:13:09 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:19 +0100
Message-ID: <20250331201256.1057782-60-willy@infradead.org>
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
 Content preview: Remove four hidden calls to compound_head(). Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/data.c | 25
 +++++++++++++ 1 file changed, 13 insertions(+), 12 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVU-0003ZU-7m
Subject: [f2fs-dev] [PATCH 059/153] f2fs: Use a folio in f2fs_xattr_fiemap()
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

Remove four hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 09b440e1dd12..af0106e4f184 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1826,7 +1826,6 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 				struct fiemap_extent_info *fieinfo)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct page *page;
 	struct node_info ni;
 	__u64 phys = 0, len;
 	__u32 flags;
@@ -1835,15 +1834,15 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 
 	if (f2fs_has_inline_xattr(inode)) {
 		int offset;
+		struct folio *folio = f2fs_grab_cache_folio(NODE_MAPPING(sbi),
+				inode->i_ino, false);
 
-		page = f2fs_grab_cache_page(NODE_MAPPING(sbi),
-						inode->i_ino, false);
-		if (!page)
-			return -ENOMEM;
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
 
 		err = f2fs_get_node_info(sbi, inode->i_ino, &ni, false);
 		if (err) {
-			f2fs_put_page(page, 1);
+			f2fs_folio_put(folio, true);
 			return err;
 		}
 
@@ -1855,7 +1854,7 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 		phys += offset;
 		len = inline_xattr_size(inode);
 
-		f2fs_put_page(page, 1);
+		f2fs_folio_put(folio, true);
 
 		flags = FIEMAP_EXTENT_DATA_INLINE | FIEMAP_EXTENT_NOT_ALIGNED;
 
@@ -1869,20 +1868,22 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 	}
 
 	if (xnid) {
-		page = f2fs_grab_cache_page(NODE_MAPPING(sbi), xnid, false);
-		if (!page)
-			return -ENOMEM;
+		struct folio *folio = f2fs_grab_cache_folio(NODE_MAPPING(sbi),
+				xnid, false);
+
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
 
 		err = f2fs_get_node_info(sbi, xnid, &ni, false);
 		if (err) {
-			f2fs_put_page(page, 1);
+			f2fs_folio_put(folio, true);
 			return err;
 		}
 
 		phys = F2FS_BLK_TO_BYTES(ni.blk_addr);
 		len = inode->i_sb->s_blocksize;
 
-		f2fs_put_page(page, 1);
+		f2fs_folio_put(folio, true);
 
 		flags = FIEMAP_EXTENT_LAST;
 	}
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
