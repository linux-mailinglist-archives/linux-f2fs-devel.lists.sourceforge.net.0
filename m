Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 988FA951C3C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2024 15:51:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1seEPL-0006hf-TH;
	Wed, 14 Aug 2024 13:51:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1seEPI-0006hX-AB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 13:51:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v6so2n1jQRJdssKcNJO4HhrixUA74RmirSd4RGgmal4=; b=Fdqrm2ku7vxTLXwlbkgX9Fj2j/
 aefIQvQtpflr0XmK3fS/EGywpbbD/rGc4mwTbWIU9aC9KrXJYMy16PMDai85yy5BhQIg3OnnqDg0a
 VJKEA2BJ5dtS2wTP4wLqXO/46K2A7M/4sW3ZrPa1f/+0cbe2SzP5ch3AFb7BF40Lmm4U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=v6so2n1jQRJdssKcNJO4HhrixUA74RmirSd4RGgmal4=; b=a
 UZBUn0wYOghe9dUDO7OZ8nfQ2ftniyQpHQ1Rb59De2xs4w1VKGYvoQX41SBUSezVHCbKGetHwtWzG
 zWZwb9mWvpG+IVVfwGmEGvZF37gjGNDH8A9xTYvbq3JYRDqgkVW9ccj1hzdTC/nJL+79HGkm57xbf
 LTax5B+iw9GbMyn4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1seEPH-0002M0-76 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 13:51:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 31B6FCE19D8;
 Wed, 14 Aug 2024 13:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D143CC4AF0A;
 Wed, 14 Aug 2024 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723643466;
 bh=rxaqh40G6QYbFhGgXzDOgOuj/ji5qhnZ1FN1k7hQmDE=;
 h=From:To:Cc:Subject:Date:From;
 b=RLzMJL93JuH3bI0OtgWhHncPf+1MJqropPEpPcbKCeHmsq3OEPdiA0IkI0LHOnGTe
 M3eweyiCpZll8WleGA5CYE4hb8lLAmDqJ+Dr5yVQcfcsNoNaWWZX7VjQcT9dtzBiHh
 lHueliT5I8GztePjze4luzL6G3Xzt5b7KXerBKb0aZ6h9vWxJYjmYUYsZALNYuORJ5
 /TtUO21OQV/cMv4sY+/RQUULAsPktfNAziwORx7SUcoYMhj5x9K2tfSr1emQYa3Nny
 Jw68in1/TVX3dwu5A6+YOEt8y9Tjdy+I4DY2jdO/9Vgn+R7CokpLA/9zILbOQ3q2Q2
 Eon8aEiqKGx9A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 14 Aug 2024 21:50:59 +0800
Message-Id: <20240814135059.802454-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
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
 --- v2: - check return value of bio_add_folio() correctly. fs/f2fs/data.c
 | 28 ++++++++++++++++ 1 file cha [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1seEPH-0002M0-76
Subject: [f2fs-dev] [PATCH v2 8/9] f2fs: convert f2fs_read_multi_pages() to
 use folio
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
v2:
- check return value of bio_add_folio() correctly.
 fs/f2fs/data.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0779e222f709..4f4e76c33611 100644
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
+		if (!bio_add_folio(bio, folio, blocksize, 0))
 			goto submit_and_realloc;
 
 		ctx = get_post_read_ctx(bio);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
