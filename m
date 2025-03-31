Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 531D8A76E2A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVc-0003nX-L4;
	Mon, 31 Mar 2025 20:13:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVX-0003l2-HE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o3yvfRzuz9Y40Eg1ySM0h82wkx50qsx+7jlrAppN6AQ=; b=UGumDBwiEJeEhMtoF59KwInhur
 6cM3QxNndidQwkqvr/cJtCuAig0nlA7nab1sFvhdolA/c3ABldZd3dR64oAgRuggJAgKbmUIge93N
 LFbGZf1DbHn7Y+ZXSwllFstmT5cpaP0gt6fJbxCYpUZ+YiBmiZnpeIGLBFK487gp/tO4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o3yvfRzuz9Y40Eg1ySM0h82wkx50qsx+7jlrAppN6AQ=; b=LHCQ/WInTJ5A1Pj4uLpz9+UZrA
 xauQBUTRzE4x/DTlry+V10lPyL/L5DkZWKyQMgPwG0jL4jMJGBA6J0VV7x8nMsCqdxU4eFi3F1NTW
 DRsodb0/xyMPVQtOUtXT9g6+XI1UjeO7sSfxxu2wBNQrEdtLs5YE2O+PZrQTZpVVG23c=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVM-0003Y7-Nm for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=o3yvfRzuz9Y40Eg1ySM0h82wkx50qsx+7jlrAppN6AQ=; b=EEMpWJdspfc2x8kGfXrS8sgR1W
 t6p67iH7em+igL46zAweHMZ8mCs7S1TBokKD9XHnMaeXEtS5SMh+raJfJo07tpEHuE04UK5i63zFZ
 sK2u9rsC06Y8U/YoiLxSJJzUs0zQhsMTPylEgvXSA5LUU3oy41vI8JY3Y9EhLlMCJi9Lv8nywXlDz
 sjjy/TzTkZX1xpO0dkXlx+dPnVOsH1SVCjSV+24r2Y7YVx3BE7c0W/Y9ZwPhEW7qsmbUhcitUjvDw
 zGYHllKmYUEoXCkSyC/d/f0k9AuqRGQUtW2rVsRN8kMiZTERDSg0YPET49UQajXiS6Il2YEhM++Jf
 opvpqbvA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVG-00000004RVZ-1QbX;
 Mon, 31 Mar 2025 20:13:02 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:29 +0100
Message-ID: <20250331201256.1057782-10-willy@infradead.org>
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
 Content preview: Support arbitrary size folios and remove a few hidden calls
 to compound_head(). Also remove an unnecessary test of the uptodaate flag;
 if mapping_read_folio_gfp() cannot bring the folio uptodate, it w [...] 
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
X-Headers-End: 1tzLVM-0003Y7-Nm
Subject: [f2fs-dev] [PATCH 009/153] f2fs: Use a folio in f2fs_quota_read()
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

Support arbitrary size folios and remove a few hidden calls to
compound_head().  Also remove an unnecessary test of the uptodaate flag;
if mapping_read_folio_gfp() cannot bring the folio uptodate, it will
return an error.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/super.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f087b2b71c89..fd93581bee89 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2689,12 +2689,9 @@ static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
 {
 	struct inode *inode = sb_dqopt(sb)->files[type];
 	struct address_space *mapping = inode->i_mapping;
-	block_t blkidx = F2FS_BYTES_TO_BLK(off);
-	int offset = off & (sb->s_blocksize - 1);
 	int tocopy;
 	size_t toread;
 	loff_t i_size = i_size_read(inode);
-	struct page *page;
 
 	if (off > i_size)
 		return 0;
@@ -2703,37 +2700,36 @@ static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
 		len = i_size - off;
 	toread = len;
 	while (toread > 0) {
-		tocopy = min_t(unsigned long, sb->s_blocksize - offset, toread);
+		struct folio *folio;
+		size_t offset;
+
 repeat:
-		page = read_cache_page_gfp(mapping, blkidx, GFP_NOFS);
-		if (IS_ERR(page)) {
-			if (PTR_ERR(page) == -ENOMEM) {
+		folio = mapping_read_folio_gfp(mapping, off >> PAGE_SHIFT,
+				GFP_NOFS);
+		if (IS_ERR(folio)) {
+			if (PTR_ERR(folio) == -ENOMEM) {
 				memalloc_retry_wait(GFP_NOFS);
 				goto repeat;
 			}
 			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
-			return PTR_ERR(page);
+			return PTR_ERR(folio);
 		}
+		offset = offset_in_folio(folio, off);
+		tocopy = min(folio_size(folio) - offset, toread);
 
-		lock_page(page);
+		folio_lock(folio);
 
-		if (unlikely(page->mapping != mapping)) {
-			f2fs_put_page(page, 1);
+		if (unlikely(folio->mapping != mapping)) {
+			f2fs_folio_put(folio, true);
 			goto repeat;
 		}
-		if (unlikely(!PageUptodate(page))) {
-			f2fs_put_page(page, 1);
-			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
-			return -EIO;
-		}
 
-		memcpy_from_page(data, page, offset, tocopy);
-		f2fs_put_page(page, 1);
+		memcpy_from_folio(data, folio, offset, tocopy);
+		f2fs_folio_put(folio, true);
 
-		offset = 0;
 		toread -= tocopy;
 		data += tocopy;
-		blkidx++;
+		off += tocopy;
 	}
 	return len;
 }
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
