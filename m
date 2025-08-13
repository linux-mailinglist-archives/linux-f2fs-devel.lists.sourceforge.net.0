Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC163B24599
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Aug 2025 11:39:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93/A8OtyGalMlS8wNcB6NpU9uwXV57Y3wdocXDeZRBU=; b=kXOIYWj6lALN4h/7Lvc4RCS1FT
	CwBUzblm67biDKxDioSRUM+mxdOacc3jQG+gfLIHHoVUZjio/MTQ6JQUUQQxJzoUWj5MOmdxkmm78
	4Ii+9KN91cdAfnbtl0XbMVspt4lAcTtw4CQk1GiHBFqrXoXmE4Iu9u+QSvZ8PuhOiULw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1um7wf-0007pi-D4;
	Wed, 13 Aug 2025 09:38:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1um7wa-0007pK-LH
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 09:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/ch+z7GSB5KCZPQlJoVXou/MWaJL2wpBA5pjQ8l8kXg=; b=RB3pZMofrm7ZrAwf83enu42OPm
 dGSYfV2dShNN8X2YGcWsTB2EwttmX5lvMluJUO5K/vlvK5G5A+4eYZ2oQnMRiL5GABQLlW6rpSoKj
 7971ayEliWzfrMDTnY9s18g6TN6KKR0LgsqYK/eEeWAQzlQ45Cc1GHQgpd5XU7j99SdQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/ch+z7GSB5KCZPQlJoVXou/MWaJL2wpBA5pjQ8l8kXg=; b=lY7OH9SDjt4i+vEPI7CQmpHZhX
 9NT9Tm9/qd3yLg0GJRFZo0iMPiO30sOyDqZPPEwEgeiWcjPF6B1JGdLg87IvhXAWQCFoH0+rPvpgF
 Tjbwp+4x3a6tAayGQ5+BBEeVyRywWFqCyoLinzWg9GQ0M7J2dH+hZmGDVrPTeLzJksgY=;
Received: from m16.mail.126.com ([117.135.210.8])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1um7wZ-0004Uw-QJ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Aug 2025 09:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=/c
 h+z7GSB5KCZPQlJoVXou/MWaJL2wpBA5pjQ8l8kXg=; b=PYwIZp98vzM+x7NSzW
 YDqRTzKPx91ihzhG6kwK4I4gfVpT1UK5gGLIF0TZy58IXkMN4n3QMfsQFX5GDdhH
 xvfc0m8b4Imu24HZrHJ/55YQ4LePNcfW1UakU/gMZxzUbRjTWRPfvqYOdAfcKewS
 SQxoBTMhYfKpGE2hs2YqARNYs=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wD3tyv8XJxo_MzyBQ--.54250S7; 
 Wed, 13 Aug 2025 17:38:26 +0800 (CST)
From: Nanzhe Zhao <nzzhao@126.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org
Date: Wed, 13 Aug 2025 17:37:51 +0800
Message-Id: <20250813093755.47599-6-nzzhao@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250813093755.47599-1-nzzhao@126.com>
References: <20250813093755.47599-1-nzzhao@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3tyv8XJxo_MzyBQ--.54250S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxur4kXF1DWry5WF45Kw4rXwb_yoWrur1rpF
 W8KrykJrWxWrZ8Wr1kJFsY9r1fKryFqayUXFWxKw1ft3Waqrna9F10vw1rZF4UJryrZ3Z7
 Za1jkFyUXF45tF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zij-ewUUUUU=
X-Originating-IP: [58.240.165.118]
X-CM-SenderInfo: xq22xtbr6rjloofrz/1tbiFhCoz2icTc3imwAAss
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  `f2fs_is_compressed_page` now already accept a folio as a
 parameter.So the name now is confusing. Rename it to
 `f2fs_is_compressed_folio`.
 If a folio has f2fs_iomap_folio_state then it must not be a c [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [117.135.210.8 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1um7wZ-0004Uw-QJ
Subject: [f2fs-dev] [RFC PATCH 5/9] f2fs:Refactor `f2fs_is_compressed_page`
 to `f2fs_is_compressed_folio`
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
Cc: Nanzhe Zhao <nzzhao@126.com>, Barry Song <21cnbao@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Yi Zhang <yi.zhang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

`f2fs_is_compressed_page` now already accept a folio as
a parameter.So the name now is confusing.
Rename it to `f2fs_is_compressed_folio`.
If a folio has f2fs_iomap_folio_state then it must not be
a compressed folio.

Signed-off-by: Nanzhe Zhao <nzzhao@126.com>
---
 fs/f2fs/compress.c | 11 ++++++-----
 fs/f2fs/data.c     | 10 +++++-----
 fs/f2fs/f2fs.h     |  7 +++++--
 3 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 6ad8d3bc6df7..627013ef856c 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -71,13 +71,14 @@ static pgoff_t start_idx_of_cluster(struct compress_ctx *cc)
 	return cc->cluster_idx << cc->log_cluster_size;
 }
 
-bool f2fs_is_compressed_page(struct folio *folio)
+bool f2fs_is_compressed_folio(struct folio *folio)
 {
-	if (!folio->private)
+	if (!folio_test_private(folio))
 		return false;
 	if (folio_test_f2fs_nonpointer(folio))
 		return false;
-
+	if (folio_get_f2fs_ifs(folio)) /*compressed folio current don't support higer order*/
+		return false;
 	f2fs_bug_on(F2FS_F_SB(folio),
 		*((u32 *)folio->private) != F2FS_COMPRESSED_PAGE_MAGIC);
 	return true;
@@ -1483,8 +1484,8 @@ void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio)
 	struct page *page = &folio->page;
 	struct f2fs_sb_info *sbi = bio->bi_private;
 	struct compress_io_ctx *cic = folio->private;
-	enum count_type type = WB_DATA_TYPE(folio,
-				f2fs_is_compressed_page(folio));
+	enum count_type type =
+		WB_DATA_TYPE(folio, f2fs_is_compressed_folio(folio));
 	int i;
 
 	if (unlikely(bio->bi_status != BLK_STS_OK))
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5589280294c1..a9dc2572bdc4 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -142,7 +142,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 	bio_for_each_folio_all(fi, bio) {
 		struct folio *folio = fi.folio;
 
-		if (f2fs_is_compressed_page(folio)) {
+		if (f2fs_is_compressed_folio(folio)) {
 			if (ctx && !ctx->decompression_attempted)
 				f2fs_end_read_compressed_page(folio, true, 0,
 							in_task);
@@ -186,7 +186,7 @@ static void f2fs_verify_bio(struct work_struct *work)
 		bio_for_each_folio_all(fi, bio) {
 			struct folio *folio = fi.folio;
 
-			if (!f2fs_is_compressed_page(folio) &&
+			if (!f2fs_is_compressed_folio(folio) &&
 			    !fsverity_verify_page(&folio->page)) {
 				bio->bi_status = BLK_STS_IOERR;
 				break;
@@ -239,7 +239,7 @@ static void f2fs_handle_step_decompress(struct bio_post_read_ctx *ctx,
 	bio_for_each_folio_all(fi, ctx->bio) {
 		struct folio *folio = fi.folio;
 
-		if (f2fs_is_compressed_page(folio))
+		if (f2fs_is_compressed_folio(folio))
 			f2fs_end_read_compressed_page(folio, false, blkaddr,
 						      in_task);
 		else
@@ -344,7 +344,7 @@ static void f2fs_write_end_io(struct bio *bio)
 		}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-		if (f2fs_is_compressed_page(folio)) {
+		if (f2fs_is_compressed_folio(folio)) {
 			f2fs_compress_write_end_io(bio, folio);
 			continue;
 		}
@@ -568,7 +568,7 @@ static bool __has_merged_page(struct bio *bio, struct inode *inode,
 			if (IS_ERR(target))
 				continue;
 		}
-		if (f2fs_is_compressed_page(target)) {
+		if (f2fs_is_compressed_folio(target)) {
 			target = f2fs_compress_control_folio(target);
 			if (IS_ERR(target))
 				continue;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a14bef4dc394..9f88be53174b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4677,7 +4677,7 @@ enum cluster_check_type {
 	CLUSTER_COMPR_BLKS, /* return # of compressed blocks in a cluster */
 	CLUSTER_RAW_BLKS    /* return # of raw blocks in a cluster */
 };
-bool f2fs_is_compressed_page(struct folio *folio);
+bool f2fs_is_compressed_folio(struct folio *folio);
 struct folio *f2fs_compress_control_folio(struct folio *folio);
 int f2fs_prepare_compress_overwrite(struct inode *inode,
 			struct page **pagep, pgoff_t index, void **fsdata);
@@ -4744,7 +4744,10 @@ void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino);
 		sbi->compr_saved_block += diff;				\
 	} while (0)
 #else
-static inline bool f2fs_is_compressed_page(struct folio *folio) { return false; }
+static inline bool f2fs_is_compressed_folio(struct folio *folio)
+{
+	return false;
+}
 static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
 {
 	if (!f2fs_compressed_file(inode))
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
