Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8F4AA9125
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 May 2025 12:30:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J7g5OzNoJfrZP+SF+gH8+ZUmXnqDcYvTChCs0zfw6is=; b=W972C11N+DE4QgRuz4wnqtMCJQ
	K/2W2K4NzCy6Pa9nWCGpCKVQTy6e2+mMu2XmJIP1j1gkKjjb9M0FCYC4AAXGN3DuFJXgsxdxWsbNp
	RVSHVaEzw9AQ8fRgR93A5kU3VEl6HgHYBS3PDgScOF6UqbQs0GnQ794wkhqcR9Aygn4A=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uBt4u-0005Vi-8Q;
	Mon, 05 May 2025 10:29:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+9b9d72b124a21f5aaaac+7925+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1uBt4s-0005VW-Vz for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 May 2025 10:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MU+DP9oUJ78DUz/JlwF2VOH8GLV5VB5IwnkShLsTeuc=; b=TulEBQ+k0Yzw1UQe3zkDq+3FC6
 3/XVrgv4QjdVQZQgdyQJ+Lwh7TwiQXrCzCMW2K8lUyR+mh16f4FhsUkEwNKy4DNbhLjShkubBuiSz
 8IczEHdHhi5kH/32THDIm04PnUOMGzsW4oHPyhmFPjWuieNEEsl5AFMBWztn0ynTQuAc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MU+DP9oUJ78DUz/JlwF2VOH8GLV5VB5IwnkShLsTeuc=; b=amSKtLEqFu3MDBWgj1Us0UImRz
 MPj4pKfPg1sdwhxtyN8V3IUKaiv/m0WbH2xsiAqM7KkZXeO0iniaUqPE0yQJcSYn6UZYetOBRG8IO
 SODZ3zAeLLRknLdAQGopVl0ij0Fi0sA61hHiGkVke26/35GgI1a3zBiGfigX3GpqQl8I=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uBt4d-0002u7-4P for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 May 2025 10:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=MU+DP9oUJ78DUz/JlwF2VOH8GLV5VB5IwnkShLsTeuc=; b=l5+bbz5NDvUzHz9BTTjPIAfEqW
 2/zDFRbV/NggjUXTVL9SB/2pf6+IJi+Gi3ivi9+q46QTiuLglNLk30mVKIkEV3LgLvtb3lpdVtwbP
 /VE8ltRAMxeJi0AjaBAwIdIFy50wV2g9hjn4up0LREKYrnWgy39rRfRxzQMc9+9oIKILfHBccEBuu
 tqNDb3aS2WPvJgC4Amyku+woiZxm/CT8XMKlnbQz9PrRX9EtvykDDzYja5dO15zKvYVMn4ss4NJpO
 yg03ZGzkIl6QrE9vF3H34IIrJtGtdUd4Vb52fBCCLnK9AJ1te7CWd/4DxwFoCpQIwZcqyMrZbDa1X
 /tZMrm0g==;
Received: from
 2a02-8389-2341-5b80-c9f7-77ec-522e-47ca.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:c9f7:77ec:522e:47ca] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uBs5a-00000006ukp-0vNe; Mon, 05 May 2025 09:26:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon,  5 May 2025 11:25:58 +0200
Message-ID: <20250505092613.3451524-2-hch@lst.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505092613.3451524-1-hch@lst.de>
References: <20250505092613.3451524-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: __f2fs_write_meta_folio can only return 0 or
 AOP_WRITEPAGE_ACTIVATE.
 As part of phasing out AOP_WRITEPAGE_ACTIVATE, switch to a bool return instead.
 Signed-off-by: Christoph Hellwig <hch@lst.de> --- fs/f2fs/checkpoint.c |
 22 +++++++++++ 1 file changed, 11 insertions(+), 11 deletions(-) 
 Content analysis details:   (-2.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
 Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1uBt4d-0002u7-4P
Subject: [f2fs-dev] [PATCH 1/4] f2fs: return bool from
 __f2fs_write_meta_folio
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

__f2fs_write_meta_folio can only return 0 or AOP_WRITEPAGE_ACTIVATE.
As part of phasing out AOP_WRITEPAGE_ACTIVATE, switch to a bool return
instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/checkpoint.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index e42ed62fa45c..595d6e87aa2f 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -340,7 +340,7 @@ void f2fs_ra_meta_pages_cond(struct f2fs_sb_info *sbi, pgoff_t index,
 		f2fs_ra_meta_pages(sbi, index, ra_blocks, META_POR, true);
 }
 
-static int __f2fs_write_meta_folio(struct folio *folio,
+static bool __f2fs_write_meta_folio(struct folio *folio,
 				struct writeback_control *wbc,
 				enum iostat_type io_type)
 {
@@ -353,7 +353,7 @@ static int __f2fs_write_meta_folio(struct folio *folio,
 			folio_clear_uptodate(folio);
 			dec_page_count(sbi, F2FS_DIRTY_META);
 			folio_unlock(folio);
-			return 0;
+			return true;
 		}
 		goto redirty_out;
 	}
@@ -373,11 +373,11 @@ static int __f2fs_write_meta_folio(struct folio *folio,
 	if (unlikely(f2fs_cp_error(sbi)))
 		f2fs_submit_merged_write(sbi, META);
 
-	return 0;
+	return true;
 
 redirty_out:
 	folio_redirty_for_writepage(wbc, folio);
-	return AOP_WRITEPAGE_ACTIVATE;
+	return false;
 }
 
 static int f2fs_write_meta_pages(struct address_space *mapping,
@@ -461,7 +461,7 @@ long f2fs_sync_meta_pages(struct f2fs_sb_info *sbi, enum page_type type,
 			if (!folio_clear_dirty_for_io(folio))
 				goto continue_unlock;
 
-			if (__f2fs_write_meta_folio(folio, &wbc,
+			if (!__f2fs_write_meta_folio(folio, &wbc,
 						io_type)) {
 				folio_unlock(folio);
 				break;
@@ -1409,7 +1409,6 @@ static void commit_checkpoint(struct f2fs_sb_info *sbi,
 	 * f2fs_sync_meta_pages are combined in this function.
 	 */
 	struct folio *folio = f2fs_grab_meta_folio(sbi, blk_addr);
-	int err;
 
 	memcpy(folio_address(folio), src, PAGE_SIZE);
 
@@ -1418,13 +1417,14 @@ static void commit_checkpoint(struct f2fs_sb_info *sbi,
 		f2fs_bug_on(sbi, 1);
 
 	/* writeout cp pack 2 page */
-	err = __f2fs_write_meta_folio(folio, &wbc, FS_CP_META_IO);
-	if (unlikely(err && f2fs_cp_error(sbi))) {
-		f2fs_folio_put(folio, true);
-		return;
+	if (unlikely(!__f2fs_write_meta_folio(folio, &wbc, FS_CP_META_IO))) {
+		if (f2fs_cp_error(sbi)) {
+			f2fs_folio_put(folio, true);
+			return;
+		}
+		f2fs_bug_on(sbi, true);
 	}
 
-	f2fs_bug_on(sbi, err);
 	f2fs_folio_put(folio, false);
 
 	/* submit checkpoint (with barrier if NOBARRIER is not set) */
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
