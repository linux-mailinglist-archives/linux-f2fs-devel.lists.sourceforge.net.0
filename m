Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8DEAFD43D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uG82UGbe1/dy7Brj80WwSUWgOJCrRwRqIgPDQ4sfurc=; b=FXeFsYIMLfELDfs+8jBSr+t6l1
	vnbHKpJZwJbzOVQfZwjMg6czJ+XkZZb0zsBoovEH+ryZrZU8Q5eYVEC+45/MGoP9B1r9xIkpyqsoz
	/BlyfAgcUYdc6yULxX6Oci1kYPgJJdciksnoZY823vP899luzwgpVjUMVsEVNjP+IrgE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjx-0007Ny-TA;
	Tue, 08 Jul 2025 17:04:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBju-0007LQ-Iz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XJM8cJ24IQBQo7fb8GN3ydjysfJ97cAh+gRDkGOaq9s=; b=B9w+Jq0y/adTfUdo+rb1pobtqX
 REjeuXwsx2MTXgthCtQt/CiRns6lYRhavQXwqkpZ1Ovd4POVxZ+my4btkW9yfx7djnPgnwyWpqSop
 2nYeol4xVrYpBd/FKs1SeMsHNZZxDuBuGY4/3/SsszlGWRNz5w/Mvzup53O7Y/9kwzuQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XJM8cJ24IQBQo7fb8GN3ydjysfJ97cAh+gRDkGOaq9s=; b=B6r4BAMcnUwIcwHmiVqj5C3rem
 3wWcBp/Z7SW2q2L2mGh4KtF9QUG1tlCCXeQy+t69r3F4htPASLy6/Nh2bpTbl4Hi3ARVydjWzIf+q
 LlGlA9uDOCVl7iH7v/JVwtJT3oagZYmDXbQntPP3m1fvp7ZHzcfFymHKF2NkbUQXzHhQ=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjq-0006EW-Cq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=XJM8cJ24IQBQo7fb8GN3ydjysfJ97cAh+gRDkGOaq9s=; b=BfIM5dqZcu3JL+92HmW1ZG9Pse
 tA7T9jrbbGkLSFIHGtMFwdsRFAUDljeUeg7TfWX7kaiU5Za/B2+u5XP1Eud3aQz9Zs/41tCipyRcr
 ad01fHAqqSfSRx9GHhraJpr8UXAnM9cVa74z0ktnrRr/Ah4q3S1HazzxodCVnX2YVpGGghKKYt0N6
 DQiHKAuwp1t0Fn72c0kFiBit4pps/wQuGmaVBNoSD1u0a+iEvY/P1N9YrKpMb54hLN21Kw3PwK962
 UVd2jjoyMhYbf4ClvWKZ3gq1M7tzYtExbZNZH616ca9rkG0rFPAi3p/Z265LkhPrsfY5NaiiaBCao
 jDh7HpAA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjj-00000000T7u-46jc;
 Tue, 08 Jul 2025 17:04:08 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:42 +0100
Message-ID: <20250708170359.111653-46-willy@infradead.org>
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
 Content preview:  All callers now have a folio so pass it in. Removes a call
 to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/compress.c | 2 +- fs/f2fs/data.c | 11 +++++------ fs/f2fs/f2fs.h
 | 6 +++--- 3 files changed, 9 insertions(+), 10 deletions(-) 
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
X-Headers-End: 1uZBjq-0006EW-Cq
Subject: [f2fs-dev] [PATCH 45/60] f2fs: Pass a folio to WB_DATA_TYPE() and
 f2fs_is_cp_guaranteed()
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

All callers now have a folio so pass it in.  Removes a call to
compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/compress.c |  2 +-
 fs/f2fs/data.c     | 11 +++++------
 fs/f2fs/f2fs.h     |  6 +++---
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index c1334e61823c..10b4230607de 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1478,7 +1478,7 @@ void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio)
 	struct page *page = &folio->page;
 	struct f2fs_sb_info *sbi = bio->bi_private;
 	struct compress_io_ctx *cic = folio->private;
-	enum count_type type = WB_DATA_TYPE(page,
+	enum count_type type = WB_DATA_TYPE(folio,
 				f2fs_is_compressed_page(page));
 	int i;
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 4649c0a510a0..067270f9486b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -47,9 +47,8 @@ void f2fs_destroy_bioset(void)
 	bioset_exit(&f2fs_bioset);
 }
 
-bool f2fs_is_cp_guaranteed(const struct page *page)
+bool f2fs_is_cp_guaranteed(const struct folio *folio)
 {
-	const struct folio *folio = page_folio(page);
 	struct address_space *mapping = folio->mapping;
 	struct inode *inode;
 	struct f2fs_sb_info *sbi;
@@ -346,7 +345,7 @@ static void f2fs_write_end_io(struct bio *bio)
 		}
 #endif
 
-		type = WB_DATA_TYPE(&folio->page, false);
+		type = WB_DATA_TYPE(folio, false);
 
 		if (unlikely(bio->bi_status != BLK_STS_OK)) {
 			mapping_set_error(folio->mapping, -EIO);
@@ -713,7 +712,7 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 		wbc_account_cgroup_owner(fio->io_wbc, fio_folio, PAGE_SIZE);
 
 	inc_page_count(fio->sbi, is_read_io(fio->op) ?
-			__read_io_type(data_folio) : WB_DATA_TYPE(fio->page, false));
+			__read_io_type(data_folio) : WB_DATA_TYPE(fio->folio, false));
 
 	if (is_read_io(bio_op(bio)))
 		f2fs_submit_read_bio(fio->sbi, bio, fio->type);
@@ -914,7 +913,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 	if (fio->io_wbc)
 		wbc_account_cgroup_owner(fio->io_wbc, folio, folio_size(folio));
 
-	inc_page_count(fio->sbi, WB_DATA_TYPE(&data_folio->page, false));
+	inc_page_count(fio->sbi, WB_DATA_TYPE(data_folio, false));
 
 	*fio->last_block = fio->new_blkaddr;
 	*fio->bio = bio;
@@ -989,7 +988,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	/* set submitted = true as a return value */
 	fio->submitted = 1;
 
-	type = WB_DATA_TYPE(&bio_folio->page, fio->compressed_page);
+	type = WB_DATA_TYPE(bio_folio, fio->compressed_page);
 	inc_page_count(sbi, type);
 
 	if (io->bio &&
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f86c89a9dd99..5c1c21808489 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1123,8 +1123,8 @@ struct f2fs_sm_info {
  * f2fs monitors the number of several block types such as on-writeback,
  * dirty dentry blocks, dirty node blocks, and dirty meta blocks.
  */
-#define WB_DATA_TYPE(p, f)			\
-	(f || f2fs_is_cp_guaranteed(p) ? F2FS_WB_CP_DATA : F2FS_WB_DATA)
+#define WB_DATA_TYPE(folio, f)			\
+	(f || f2fs_is_cp_guaranteed(folio) ? F2FS_WB_CP_DATA : F2FS_WB_DATA)
 enum count_type {
 	F2FS_DIRTY_DENTS,
 	F2FS_DIRTY_DATA,
@@ -3992,7 +3992,7 @@ void f2fs_init_ckpt_req_control(struct f2fs_sb_info *sbi);
  */
 int __init f2fs_init_bioset(void);
 void f2fs_destroy_bioset(void);
-bool f2fs_is_cp_guaranteed(const struct page *page);
+bool f2fs_is_cp_guaranteed(const struct folio *folio);
 int f2fs_init_bio_entry_cache(void);
 void f2fs_destroy_bio_entry_cache(void);
 void f2fs_submit_read_bio(struct f2fs_sb_info *sbi, struct bio *bio,
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
