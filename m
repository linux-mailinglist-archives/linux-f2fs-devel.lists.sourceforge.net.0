Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 198F1AAF2B2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 07:15:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSeWaSF9NT3WYvJH0EgnHj42H9jDZAXD5cdZsDotx+s=; b=RvTSkl7PKbnuHpK0J7YGJQeHhU
	80b7CrXQ5uRIwHxtPsrI+c8oJcbMdR/EGB7+blzXMq8mbQ5XSclyEe6kMEjandIRdovTp8UoTpKPH
	X+mWNvqaBvT1sBpruAeX/tGgrLb0LzpbERteQkqkVVRWZALM1lHPNymKzD1hGyeP2i50=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCtbi-00060C-HF;
	Thu, 08 May 2025 05:15:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+b29930b5fa9b2b8daadf+7928+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1uCtbg-000606-Ua for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 05:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mJ601YFTsjLc/Bu1ljq7runEahH6x5HE4nmzXPhOC1Q=; b=WN0Y/Nsv1ifaJ4at0AavF26nim
 WX7I1Jn4bzjjtENzARZfjTVps8kh2Uic/NjEHbAiQrFv1nZNBKC6BFlLr8EMdFqbCn0YzgWXEh1ei
 ZFtnzXmgPAEImN/1HcGIxCjBpG17GsKpJo1wcIKgmmTlHmtH7Uarm0pKC9NUwfoJqxuc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mJ601YFTsjLc/Bu1ljq7runEahH6x5HE4nmzXPhOC1Q=; b=dioY4gv/6vPkIFlwG3mYPWyhJx
 O/LNFMkVPJhfi0Aidrb1CZvLqzDHVSBLqfDM+an35ffDPg9fmVEV7hiXkpAcA8b9Yel6gqSkirVnP
 +I44xRDJgWNt4E/yH5LYsf2Xr1cM6QYHtAutMOJMX/I5H/ma8PFk23pjIJwLps00Io1k=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCtbf-0003cY-4N for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 05:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=mJ601YFTsjLc/Bu1ljq7runEahH6x5HE4nmzXPhOC1Q=; b=JBfVrU8uqyrhYLSbVLWM8tvrf+
 udba6Sw9VJE72XaxBHgNQA9LdhEY8oR45G7PaMlpK0EyGyPOOcKrA1XzEvcaDIOoVGQE6vpoQWNEZ
 jQYMU9LhF4WjO2PYpKTd3azTw4Vvpfl+w1zOxJIzmqyR1u7bVvykjMgB2YmGUrR8b/a2/QhsmW8/B
 TzuIpeeCwE6BW+lF+KjBFA9DbNMjOGEgWT+Luf6t5V0PK+XRam4DPvteL5lFEPqiWdvDuKgyTI87Z
 FzFNJcJ2WhNj2NLBq+u9BUVcN7Sp6KAU/b3ZZgOtdqDrrfwWTeJSMLOrFKt3UqkUmfUPD/s3bxws4
 Tn3kRrQw==;
Received: from
 2a02-8389-2341-5b80-2368-be33-a304-131f.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:2368:be33:a304:131f] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uCtbZ-0000000HLfw-1BuZ; Thu, 08 May 2025 05:15:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu,  8 May 2025 07:14:28 +0200
Message-ID: <20250508051520.4169795-3-hch@lst.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508051520.4169795-1-hch@lst.de>
References: <20250508051520.4169795-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.4 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: __f2fs_write_meta_folio can only return 0 or
 AOP_WRITEPAGE_ACTIVATE.
 As part of phasing out AOP_WRITEPAGE_ACTIVATE, switch to a bool return instead.
 Signed-off-by: Christoph Hellwig <hch@lst.de> Reviewed-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/checkpoint.c | 22 +++++++++++ 1 file changed, 11 insertions(+),
 11 deletions(-) 
 Content analysis details:   (-2.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1uCtbf-0003cY-4N
Subject: [f2fs-dev] [PATCH 2/6] f2fs: return bool from
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
Reviewed-by: Chao Yu <chao@kernel.org>
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
