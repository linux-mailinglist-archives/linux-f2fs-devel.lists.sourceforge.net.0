Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A638A76E43
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVj-0005f6-Bn;
	Mon, 31 Mar 2025 20:13:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVb-0005ag-04
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zO0Teoxr8gEuCVM+xkUsKcfiNxOqEDmm56aeSYCh+x0=; b=cBR/YrOFGWdS2IhJ9dDiur9ROo
 koLhLdcooOypYmlf/o5SfP4TGy4JZhQ1QBczHrE4MU4+bmuLRT1zhQ/LpROBNEwjEVddVfnDzoN7f
 JoG3loicB4ZV56ZXaEUc/YpOyKdA6AAA8pV6iiZRYF9Cb1ZsNfojTIXoAabhk3SUHvEg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zO0Teoxr8gEuCVM+xkUsKcfiNxOqEDmm56aeSYCh+x0=; b=E50ZIbim6zp4H+2pwLV0aagzVP
 QCOBe7n2KaObI1E+k6DlmMCBq+Tqhi6W2RfUSvAbNIncFxDpXIpfLt9UcuqdDoJRihrKAj8V0zGkm
 H+nLx5ivFF+9I0rfkKmxRg8oTyIfkf/2WMdV1tHalmTsxHczFMxSW6i7jdnzO18gRfSs=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVZ-0003bF-OC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=zO0Teoxr8gEuCVM+xkUsKcfiNxOqEDmm56aeSYCh+x0=; b=Z711srQrxGUttCVcZTJhwxv+yX
 KzMb/I4ozYsY9xTsAf3H4xl88guP23SqymkR1eq/AkuPhNyNX4ZMIY3wifF6cCvoRWIiEVEV1cwtp
 7GuMfMSrRIwG6PuI0EnK444kWl+iB8p4BmXAaJpQU8Pio7yhIPIPvIVptAujpZTHe/vN2bQI5wX3E
 0aMnvggs2hB1EEgxKo/VJEnMhBMDcSgPC7MQJYuKy0PvwSbJXLKYz51KRD39MNUrkJE7K4ZMY8ODe
 B3E2EgZj4Qo8Scve6EKXuQHfc86tDIfsnYjiNDIJirKZr4oJ4+MJxjTC/ksDMREvhCVfki/Yh54kl
 SjDdhu5Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVT-00000004S1p-1gzz;
 Mon, 31 Mar 2025 20:13:15 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:46 +0100
Message-ID: <20250331201256.1057782-87-willy@infradead.org>
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
 Content preview: Remove a call to f2fs_get_inode_page(). Signed-off-by:
 Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/data.c | 20 ++++++++++
 1 file changed, 10 insertions(+), 10 deletions(-) diff --git a/fs/f2fs/data.c
 b/fs/f2fs/data.c index 5904a40fbf51..733802a53444 100644 --- a/fs/f2fs/data.c
 +++ b/fs/f2fs/data.c @@ -3439, 14 +3439,
 14 @@ static int __find_data_block(struct inode *inode, [...] 
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
X-Headers-End: 1tzLVZ-0003bF-OC
Subject: [f2fs-dev] [PATCH 086/153] f2fs: Use a folio in __find_data_block()
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

Remove a call to f2fs_get_inode_page().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5904a40fbf51..733802a53444 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3439,14 +3439,14 @@ static int __find_data_block(struct inode *inode, pgoff_t index,
 				block_t *blk_addr)
 {
 	struct dnode_of_data dn;
-	struct page *ipage;
+	struct folio *ifolio;
 	int err = 0;
 
-	ipage = f2fs_get_inode_page(F2FS_I_SB(inode), inode->i_ino);
-	if (IS_ERR(ipage))
-		return PTR_ERR(ipage);
+	ifolio = f2fs_get_inode_folio(F2FS_I_SB(inode), inode->i_ino);
+	if (IS_ERR(ifolio))
+		return PTR_ERR(ifolio);
 
-	set_new_dnode(&dn, inode, ipage, ipage, 0);
+	set_new_dnode(&dn, inode, &ifolio->page, &ifolio->page, 0);
 
 	if (!f2fs_lookup_read_extent_cache_block(inode, index,
 						 &dn.data_blkaddr)) {
@@ -3467,17 +3467,17 @@ static int __reserve_data_block(struct inode *inode, pgoff_t index,
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct dnode_of_data dn;
-	struct page *ipage;
+	struct folio *ifolio;
 	int err = 0;
 
 	f2fs_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO);
 
-	ipage = f2fs_get_inode_page(sbi, inode->i_ino);
-	if (IS_ERR(ipage)) {
-		err = PTR_ERR(ipage);
+	ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
+	if (IS_ERR(ifolio)) {
+		err = PTR_ERR(ifolio);
 		goto unlock_out;
 	}
-	set_new_dnode(&dn, inode, ipage, ipage, 0);
+	set_new_dnode(&dn, inode, &ifolio->page, &ifolio->page, 0);
 
 	if (!f2fs_lookup_read_extent_cache_block(dn.inode, index,
 						&dn.data_blkaddr))
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
