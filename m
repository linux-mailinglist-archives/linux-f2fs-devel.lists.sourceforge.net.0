Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A990595074D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2024 16:14:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sdsHo-0001LC-GM;
	Tue, 13 Aug 2024 14:14:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sdsHk-0001Kg-Hg
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 14:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aKA/ZZ3O8Z+6nCg36uZ9SadppOXjFaBHpqnT40tFc/k=; b=UYYCoZKCRDncVWIyb/+I4sh6Ru
 +sgbe2j8LKuSqP8VOr6aFyqW0IRuIsRPdrL1H0584C6oZkbTCnB9DA5nB+AqR78FazJs0wNXHKgI6
 CMLl3ECXs4ZCAASQnBfVzrgPxqwGFTX2tmO1BZKEmUZ11WXza3MZhXUzpZrhyr28SKws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aKA/ZZ3O8Z+6nCg36uZ9SadppOXjFaBHpqnT40tFc/k=; b=De+LFRUMQcbdarGW2BGxcEMBwh
 JMZS64w2qeC7hKmIotoKbh8ZaNSgemf4y+B5d47noqvOV/EtsHdQqcfZIKc73qcvGkZLGwRIa6GLO
 436XNPA0QXf1GFF7feiHXWO1R4RdKYWhtr5Aqd3bEcmnpJ0HvlLE3Af2z4WQ2wRh0L+w=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdsHj-0001D5-R3 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 14:14:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7D2E361726;
 Tue, 13 Aug 2024 14:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D559CC4AF0B;
 Tue, 13 Aug 2024 14:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723558438;
 bh=5T499NbgrjKr5NOj5StQGgnVfYV5k+BMGIi5VEOc7AU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EpS+8sNg/0fjtUqjjEU21HwpPd1cVu3aEWiOVNVS6pXd87OhjQlLc2OjCXW4Z/qOC
 CMui+djcxR8+17IaMN3S1g/nnlIEu/2OMbeEDLIFqsb38mCsaKE0BT1tsGvbm1g5dI
 I2hG+3ecJsm+Q6Oc9JkJeBXKGednlRW6hsQqbzF95oF1k3QcYQ/OxyJYpjTvMDapWq
 6arnDIddQiw4lng0uDwIlQIH16LMkeYPqEXCK2sSB+2OqHjoatR9rhnDcOXo6rB+bW
 3oYsk2yOWwXYyPa49ge+ahGv4R45qYQ8ky4bGSTgYeqd7dF6+cTZcPrAsEQ/jdWX2L
 gICkksTrwlR/w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 13 Aug 2024 22:13:30 +0800
Message-Id: <20240813141331.417067-8-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240813141331.417067-1-chao@kernel.org>
References: <20240813141331.417067-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert to use folio, so that we can get rid of 'page->index'
 to prepare for removal of 'index' field in structure page [1]. [1]
 https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/
 Cc: Matthew Wilcox <willy@infradead.org> Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/data.c | 28 ++++++++++++++++ 1 file changed, 16 insertions(+),
 12 deletions(-) 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sdsHj-0001D5-R3
Subject: [f2fs-dev] [PATCH 8/9] f2fs: convert f2fs_read_multi_pages() to use
 folio
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
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert to use folio, so that we can get rid of 'page->index' to
prepare for removal of 'index' field in structure page [1].

[1] https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/

Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0779e222f709..9e21cfe11cc7 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2207,19 +2207,22 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	/* get rid of pages beyond EOF */
 	for (i = 0; i < cc->cluster_size; i++) {
 		struct page *page = cc->rpages[i];
+		struct folio *folio;
 
 		if (!page)
 			continue;
-		if ((sector_t)page->index >= last_block_in_file) {
-			zero_user_segment(page, 0, PAGE_SIZE);
-			if (!PageUptodate(page))
-				SetPageUptodate(page);
-		} else if (!PageUptodate(page)) {
+
+		folio = page_folio(page);
+		if ((sector_t)folio->index >= last_block_in_file) {
+			folio_zero_segment(folio, 0, folio_size(folio));
+			if (!folio_test_uptodate(folio))
+				folio_mark_uptodate(folio);
+		} else if (!folio_test_uptodate(folio)) {
 			continue;
 		}
-		unlock_page(page);
+		folio_unlock(folio);
 		if (for_write)
-			put_page(page);
+			folio_put(folio);
 		cc->rpages[i] = NULL;
 		cc->nr_rpages--;
 	}
@@ -2279,7 +2282,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	}
 
 	for (i = 0; i < cc->nr_cpages; i++) {
-		struct page *page = dic->cpages[i];
+		struct folio *folio = page_folio(dic->cpages[i]);
 		block_t blkaddr;
 		struct bio_post_read_ctx *ctx;
 
@@ -2289,7 +2292,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 
 		f2fs_wait_on_block_writeback(inode, blkaddr);
 
-		if (f2fs_load_compressed_page(sbi, page, blkaddr)) {
+		if (f2fs_load_compressed_page(sbi, folio_page(folio, 0),
+								blkaddr)) {
 			if (atomic_dec_and_test(&dic->remaining_pages)) {
 				f2fs_decompress_cluster(dic, true);
 				break;
@@ -2299,7 +2303,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 
 		if (bio && (!page_is_mergeable(sbi, bio,
 					*last_block_in_bio, blkaddr) ||
-		    !f2fs_crypt_mergeable_bio(bio, inode, page->index, NULL))) {
+		    !f2fs_crypt_mergeable_bio(bio, inode, folio->index, NULL))) {
 submit_and_realloc:
 			f2fs_submit_read_bio(sbi, bio, DATA);
 			bio = NULL;
@@ -2308,7 +2312,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		if (!bio) {
 			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages,
 					f2fs_ra_op_flags(rac),
-					page->index, for_write);
+					folio->index, for_write);
 			if (IS_ERR(bio)) {
 				ret = PTR_ERR(bio);
 				f2fs_decompress_end_io(dic, ret, true);
@@ -2318,7 +2322,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 			}
 		}
 
-		if (bio_add_page(bio, page, blocksize, 0) < blocksize)
+		if (bio_add_folio(bio, folio, blocksize, 0) < blocksize)
 			goto submit_and_realloc;
 
 		ctx = get_post_read_ctx(bio);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
