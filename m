Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBA0A76E66
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVt-0003yZ-Fs;
	Mon, 31 Mar 2025 20:13:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVd-0003or-U0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zvDOhBAtOa2oFHq5Knt+I5wRwuZkacJe91924aLNHwQ=; b=ECrKymBiiI+Xj3ObPCMuqir+yL
 8Fp7QYPp9itTaHyPKNss3K1pacn/V4Ti0IS2r9022/YtGYovYsm+RwIcui//aoAXIBa0iU/P3Nb4r
 OeQBKTcKkcW8nxtuBY61/OEdRIBLr5h90w00xc3a5OId1y25nzgAT1yqRzOTTmCqqTQU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zvDOhBAtOa2oFHq5Knt+I5wRwuZkacJe91924aLNHwQ=; b=mRziNl6oInbXgPjJz9e6at2IEy
 5OMfi5YUcantSiZzWjFOvzarQqJwGfjW5/xDl3gf6FtMIXlOp4ULSFb8IGkG/m+hyoXOoVRgY4Xln
 fXau6OY4KhpmkcV38r3PWRHke+5PMOKeOWncSrvyrXzr3HALs7ithtZdjsiAVriGjp0U=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVY-0003al-C9 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=zvDOhBAtOa2oFHq5Knt+I5wRwuZkacJe91924aLNHwQ=; b=iFtNtKzKq23X1NDO396A9ah2m9
 tyyxxmG0jDGJ8llwDTQjldaSleQ9dxJ63oAasxwktoEgdRc66y16Fll1ZZ7YPKeH9PkwW/jFTN9fR
 0uotYkg1bwPD+ujRIOxsn9urW037vwTwWVPjRlo+8n6+V4llBWPNHKKnhDr5jqn1TS7ka1ofs4aOW
 r1o6fo6snW7PZyy9BEmHGhJipdOptb6dtv5croJrVZycW0w1iF0n/kOdSu2DdZs+kh9ujkZ11Mam9
 4dPVJh543P54tQlywn9aa6QDf9R6/a/lTxwdIoDk3Od/NSSGpBTR3olBTeejNH9/OCYF1dmLczAdP
 cTCIwjPA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVM-00000004Rlt-49bV;
 Mon, 31 Mar 2025 20:13:09 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:13 +0100
Message-ID: <20250331201256.1057782-54-willy@infradead.org>
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
 Content preview: Remove three hidden calls to compound_head(). Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/file.c | 16
 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-) diff --git a/fs/f2fs/file.c
 b/fs/f2fs/file.c index 5529b740c37f..ab46fb272cc2 100644 --- a/fs/f2fs/file.c
 +++ b/fs/f2fs/file.c @@ -2920, 19 +2920,
 19 @@ static int f2fs_defragment_range(struct f2fs_sb_i [...] 
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
X-Headers-End: 1tzLVY-0003al-C9
Subject: [f2fs-dev] [PATCH 053/153] f2fs: Use a folio in
 f2fs_defragment_range()
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

Remove three hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/file.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5529b740c37f..ab46fb272cc2 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2920,19 +2920,19 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 		idx = map.m_lblk;
 		while (idx < map.m_lblk + map.m_len &&
 						cnt < BLKS_PER_SEG(sbi)) {
-			struct page *page;
+			struct folio *folio;
 
-			page = f2fs_get_lock_data_page(inode, idx, true);
-			if (IS_ERR(page)) {
-				err = PTR_ERR(page);
+			folio = f2fs_get_lock_data_folio(inode, idx, true);
+			if (IS_ERR(folio)) {
+				err = PTR_ERR(folio);
 				goto clear_out;
 			}
 
-			f2fs_wait_on_page_writeback(page, DATA, true, true);
+			f2fs_folio_wait_writeback(folio, DATA, true, true);
 
-			set_page_dirty(page);
-			set_page_private_gcing(page);
-			f2fs_put_page(page, 1);
+			folio_mark_dirty(folio);
+			set_page_private_gcing(&folio->page);
+			f2fs_folio_put(folio, true);
 
 			idx++;
 			cnt++;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
