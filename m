Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1998AA3930D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWo-0004sy-5s;
	Tue, 18 Feb 2025 05:52:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWl-0004sL-BV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mK1rK9VHgwCXb2pvCWp3vRM3/SS+G08uY5YQR+MXCiI=; b=GImlAXyL+/RdIP+jVyAMlGi5Uv
 Kdl7tRc66gI+ZiY1ZlySOuHFsGOAqs1G+1hohQhxXTn3gCWGYWN+dCApjH4yCo2WaW/5dp4/GAFR6
 Jz+rbIwCxJBPgKEXcA+I1iW0Zv25VAl2pdEhVrTlixRDoCpuz0jlEFlDYblkYMxBWkV0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mK1rK9VHgwCXb2pvCWp3vRM3/SS+G08uY5YQR+MXCiI=; b=FHazvao13Wd6GEye1EH+qwvhAO
 eu1UBMWDi0zRze1qjaCQwuusUmnvc7r5pR3wTVxzoF5XiPish2ov4zKuH7T/vg5331lmh6pRyeD9W
 Rzy/z1z6BFJ60meeJMvHBEVlgmcBuT3jSwlJgxThidioRmD2hkfG1LxrBrK5RhvYd6+M=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWj-0007bJ-C6 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=mK1rK9VHgwCXb2pvCWp3vRM3/SS+G08uY5YQR+MXCiI=; b=HDgJOe83+MqhmfuCiBO4cn9hoN
 0tDDAGK8VgMvIJubPAbNGh+3jpCx4fXB9+PpeQWr/1gZBXLlRFNUQGqZaOLaiLwD+uRNHvJ8qMLOB
 aRcyiFj+svn6+HkI2OHPplU9eM2yjkKO5zpXivSQyFirdIUV9biB24uh1bVelAqK9ZVh14rDKqixc
 XgqEkPjuke7puapm4hWCZ+8e4eOvKwlfB8BNRfq+6P0p7G5P0sPUq0c2iuh5Y4ESmsBpaI2N15a4K
 jSgL1IogdQgi33ubg85+DOvPDISq+AvM+DDHOr35QM3pX5vzWaOOEACgmVj5G6A0t6WCTTY0FvNeU
 jfi8HxEg==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWb-00000002Tqx-1YKP; Tue, 18 Feb 2025 05:52:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:35 +0000
Message-ID: <20250218055203.591403-2-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218055203.591403-1-willy@infradead.org>
References: <20250218055203.591403-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert f2fs_wait_on_page_writeback() to
 f2fs_folio_wait_writeback()
 and add a compatibiility wrapper. Replaces five calls to compound_head()
 with one. Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/f2fs.h | 6 ++++-- fs/f2fs/segment.c | 19 +++++++++ 2 files changed,
 13 insertions(+), 12 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tkGWj-0007bJ-C6
Subject: [f2fs-dev] [PATCH 01/27] f2fs: Add f2fs_folio_wait_writeback()
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
Cc: linux-fsdevel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert f2fs_wait_on_page_writeback() to f2fs_folio_wait_writeback()
and add a compatibiility wrapper.  Replaces five calls to
compound_head() with one.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h    |  6 ++++--
 fs/f2fs/segment.c | 19 +++++++++----------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 395f9d37449c..b05653f196dd 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3760,8 +3760,10 @@ int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 			struct f2fs_io_info *fio);
 void f2fs_update_device_state(struct f2fs_sb_info *sbi, nid_t ino,
 					block_t blkaddr, unsigned int blkcnt);
-void f2fs_wait_on_page_writeback(struct page *page,
-			enum page_type type, bool ordered, bool locked);
+void f2fs_folio_wait_writeback(struct folio *folio, enum page_type type,
+		bool ordered, bool locked);
+#define f2fs_wait_on_page_writeback(page, type, ordered, locked)	\
+		f2fs_folio_wait_writeback(page_folio(page), type, ordered, locked)
 void f2fs_wait_on_block_writeback(struct inode *inode, block_t blkaddr);
 void f2fs_wait_on_block_writeback_range(struct inode *inode, block_t blkaddr,
 								block_t len);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6ebe25eafafa..a29da14c5f19 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4154,22 +4154,21 @@ void f2fs_replace_block(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
 	f2fs_update_data_blkaddr(dn, new_addr);
 }
 
-void f2fs_wait_on_page_writeback(struct page *page,
-				enum page_type type, bool ordered, bool locked)
+void f2fs_folio_wait_writeback(struct folio *folio, enum page_type type,
+		bool ordered, bool locked)
 {
-	if (folio_test_writeback(page_folio(page))) {
-		struct f2fs_sb_info *sbi = F2FS_P_SB(page);
+	if (folio_test_writeback(folio)) {
+		struct f2fs_sb_info *sbi = F2FS_F_SB(folio);
 
 		/* submit cached LFS IO */
-		f2fs_submit_merged_write_cond(sbi, NULL, page, 0, type);
+		f2fs_submit_merged_write_cond(sbi, NULL, &folio->page, 0, type);
 		/* submit cached IPU IO */
-		f2fs_submit_merged_ipu_write(sbi, NULL, page);
+		f2fs_submit_merged_ipu_write(sbi, NULL, &folio->page);
 		if (ordered) {
-			wait_on_page_writeback(page);
-			f2fs_bug_on(sbi, locked &&
-				folio_test_writeback(page_folio(page)));
+			folio_wait_writeback(folio);
+			f2fs_bug_on(sbi, locked && folio_test_writeback(folio));
 		} else {
-			wait_for_stable_page(page);
+			folio_wait_stable(folio);
 		}
 	}
 }
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
