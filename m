Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF33E64A7FA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Dec 2022 20:15:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4oH4-0000zB-4M;
	Mon, 12 Dec 2022 19:15:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1p4oH1-0000z0-4Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 19:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xkM+afTsz5CqxyM8zs9D+iGsBZPiJzEAQMC/u5lyTL0=; b=EvPJsOewXtUxU8VQ5tbgPrZcN4
 fDxaV7FzXSzGLpRTtD0mOnfNzIaKEsCKorq5hS+6/gVv51bSvYgI7FyuaJbFioYW+kBZFlgTBh054
 7/zce16aFMBIhByDKP25yB9335uIRdodnm0e2Y+rDjulLWvT9JyXbA84RMX/WdImtt+U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xkM+afTsz5CqxyM8zs9D+iGsBZPiJzEAQMC/u5lyTL0=; b=DdT5LBg5veF33rCnTkZX3Y8Vlh
 cF2ampGa7Ei9s9mLPdWrqiIlUOoDbgySrTl65rG8LvgBf2CI2AXTFXfS1sINgBwyXWpRsYrqQc5SF
 5CyLjMOzUyOZFlAbjnzfAL1SBmQN2wTtJ3ovIN22O1Vz+kPY7TZSuoBhfMID9xe8j9Ms=;
Received: from mail-pg1-f175.google.com ([209.85.215.175])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p4oH0-00F10s-FB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 19:15:35 +0000
Received: by mail-pg1-f175.google.com with SMTP id 62so8864646pgb.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Dec 2022 11:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xkM+afTsz5CqxyM8zs9D+iGsBZPiJzEAQMC/u5lyTL0=;
 b=nw6aRHz51wqaynmeH7AmMW3V+PrnQ7b13g7pdbT/3q/sYZ6zf4XwtfYCZ1rpiCiYqH
 pI4I/LqRIb5iTeb4DR9bwnqEWbh0bvxLhQnFn8DDCpiX7obMqaaacq4ZoujxXeeAtIpD
 iP7+Suj0lV5uFqedHjnmOEzupb/AZwifYl82gFtBMlsiuJNR2DjNQj/2WGXWaCy/Kups
 algKTyoa3OMcY7nFxh1KVtC2ohQx1eUS2udKylCSa7afpl0T2bCptskCXIT4SX0TNFr/
 w/+oa1x9pbOn//nzx0oIMuN1NiDR8cz9CT8LQu4zlDddjaJ0U19JkVnLzOrpPVnwvYqe
 zExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xkM+afTsz5CqxyM8zs9D+iGsBZPiJzEAQMC/u5lyTL0=;
 b=DWns11g1vkKqhJtAiY0tiuoVYyUjywO4lrr4Ep7KBcL5NkiW2+3PQmuilADenFsiRc
 93RbKkJZnblKspnG22Oc6SZDQKujPase9YT0v5FHKFXfevz8L9Ryc9WD5qEdRGrTpESA
 +13Tqp4Gxh5R4Et0isxa78b83MB2bMuuRhVzhIYAWehw2wn/opXa3l5WL2GH2Emuetgp
 H/4eEX8yDruJb6pne12G3rRXFLqrCxi4VRDcoOXnw9ZNbVutKGf5rFGAtSS3J1H5xRX9
 CrCJtIhkInBcY8i4N8gNh5rUsULQbFzFGNmP64HUzrk7hzbrYG5rqINEGK4WKb2w2LH6
 vVeA==
X-Gm-Message-State: ANoB5pnCbyZq9xX2deteqPG7O3jhRef2NevFwqLSo4B+YyBAqCd/Njvi
 Y+QlMOurKgZ1P/gAoviDlcM=
X-Google-Smtp-Source: AA0mqf6xHmaysAxy1tMtGrFaKJFTa1JaRWPfex9MBQgoDXluY4qrM4PveChIIQzp53ZYM19xWdXpBg==
X-Received: by 2002:a05:6a00:1c9c:b0:577:3126:704b with SMTP id
 y28-20020a056a001c9c00b005773126704bmr18893111pfw.17.1670872528763; 
 Mon, 12 Dec 2022 11:15:28 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::2c6b])
 by smtp.googlemail.com with ESMTPSA id
 u24-20020a62d458000000b00574345ee12csm6149470pfl.23.2022.12.12.11.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 11:15:28 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: chao@kernel.org
Date: Mon, 12 Dec 2022 11:13:18 -0800
Message-Id: <20221212191317.9730-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <0a95ba7b-9335-ce03-0f47-5d9f4cce988f@kernel.org>
References: <0a95ba7b-9335-ce03-0f47-5d9f4cce988f@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Converted the function to use a folio_batch instead of
 pagevec.
 This is in preparation for the removal of find_get_pages_range_tag(). Also
 modified f2fs_all_cluster_page_ready to take in a folio_batch instead of
 pagevec. This does NOT support large folios. The function currently only
 utilizes folios of size 1 so this shouldn't cause [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.175 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.175 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p4oH0-00F10s-FB
Subject: [f2fs-dev] [RFC PATCH] f2fs: Convert f2fs_write_cache_pages() to
 use filemap_get_folios_tag()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Converted the function to use a folio_batch instead of pagevec. This is in
preparation for the removal of find_get_pages_range_tag().

Also modified f2fs_all_cluster_page_ready to take in a folio_batch instead
of pagevec. This does NOT support large folios. The function currently
only utilizes folios of size 1 so this shouldn't cause any issues right
now.

This version of the patch limits the number of pages fetched to
F2FS_ONSTACK_PAGES. If that ever happens, update the start index here
since filemap_get_folios_tag() updates the index to be after the last
found folio, not necessarily the last used page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---

Let me know if you prefer this version and I'll include it in v5
of the patch series when I rebase it after the merge window.

---
 fs/f2fs/data.c | 86 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 59 insertions(+), 27 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a71e818cd67b..1703e353f0e0 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2939,6 +2939,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	int ret = 0;
 	int done = 0, retry = 0;
 	struct page *pages[F2FS_ONSTACK_PAGES];
+	struct folio_batch fbatch;
 	struct f2fs_sb_info *sbi = F2FS_M_SB(mapping);
 	struct bio *bio = NULL;
 	sector_t last_block;
@@ -2959,6 +2960,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 		.private = NULL,
 	};
 #endif
+	int nr_folios, p, idx;
 	int nr_pages;
 	pgoff_t index;
 	pgoff_t end;		/* Inclusive */
@@ -2969,6 +2971,8 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	int submitted = 0;
 	int i;
 
+	folio_batch_init(&fbatch);
+
 	if (get_dirty_pages(mapping->host) <=
 				SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
 		set_inode_flag(mapping->host, FI_HOT_DATA);
@@ -2994,13 +2998,38 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 		tag_pages_for_writeback(mapping, index, end);
 	done_index = index;
 	while (!done && !retry && (index <= end)) {
-		nr_pages = find_get_pages_range_tag(mapping, &index, end,
-				tag, F2FS_ONSTACK_PAGES, pages);
-		if (nr_pages == 0)
+		nr_pages = 0;
+again:
+		nr_folios = filemap_get_folios_tag(mapping, &index, end,
+				tag, &fbatch);
+		if (nr_folios == 0) {
+			if (nr_pages)
+				goto write;
 			break;
+		}
 
+		for (i = 0; i < nr_folios; i++) {
+			struct folio* folio = fbatch.folios[i];
+
+			idx = 0;
+			p = folio_nr_pages(folio);
+add_more:
+			pages[nr_pages] = folio_page(folio,idx);
+			folio_ref_inc(folio);
+			if (++nr_pages == F2FS_ONSTACK_PAGES) {
+				index = folio->index + idx + 1;
+				folio_batch_release(&fbatch);
+				goto write;
+			}
+			if (++idx < p)
+				goto add_more;
+		}
+		folio_batch_release(&fbatch);
+		goto again;
+write:
 		for (i = 0; i < nr_pages; i++) {
 			struct page *page = pages[i];
+			struct folio *folio = page_folio(page);
 			bool need_readd;
 readd:
 			need_readd = false;
@@ -3017,7 +3046,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 				}
 
 				if (!f2fs_cluster_can_merge_page(&cc,
-								page->index)) {
+								folio->index)) {
 					ret = f2fs_write_multi_pages(&cc,
 						&submitted, wbc, io_type);
 					if (!ret)
@@ -3026,27 +3055,28 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 				}
 
 				if (unlikely(f2fs_cp_error(sbi)))
-					goto lock_page;
+					goto lock_folio;
 
 				if (!f2fs_cluster_is_empty(&cc))
-					goto lock_page;
+					goto lock_folio;
 
 				if (f2fs_all_cluster_page_ready(&cc,
 					pages, i, nr_pages, true))
-					goto lock_page;
+					goto lock_folio;
 
 				ret2 = f2fs_prepare_compress_overwrite(
 							inode, &pagep,
-							page->index, &fsdata);
+							folio->index, &fsdata);
 				if (ret2 < 0) {
 					ret = ret2;
 					done = 1;
 					break;
 				} else if (ret2 &&
 					(!f2fs_compress_write_end(inode,
-						fsdata, page->index, 1) ||
+						fsdata, folio->index, 1) ||
 					 !f2fs_all_cluster_page_ready(&cc,
-						pages, i, nr_pages, false))) {
+						pages, i, nr_pages,
+						false))) {
 					retry = 1;
 					break;
 				}
@@ -3059,46 +3089,47 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 				break;
 			}
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-lock_page:
+lock_folio:
 #endif
-			done_index = page->index;
+			done_index = folio->index;
 retry_write:
-			lock_page(page);
+			folio_lock(folio);
 
-			if (unlikely(page->mapping != mapping)) {
+			if (unlikely(folio->mapping != mapping)) {
 continue_unlock:
-				unlock_page(page);
+				folio_unlock(folio);
 				continue;
 			}
 
-			if (!PageDirty(page)) {
+			if (!folio_test_dirty(folio)) {
 				/* someone wrote it for us */
 				goto continue_unlock;
 			}
 
-			if (PageWriteback(page)) {
+			if (folio_test_writeback(folio)) {
 				if (wbc->sync_mode != WB_SYNC_NONE)
-					f2fs_wait_on_page_writeback(page,
+					f2fs_wait_on_page_writeback(
+							&folio->page,
 							DATA, true, true);
 				else
 					goto continue_unlock;
 			}
 
-			if (!clear_page_dirty_for_io(page))
+			if (!folio_clear_dirty_for_io(folio))
 				goto continue_unlock;
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 			if (f2fs_compressed_file(inode)) {
-				get_page(page);
-				f2fs_compress_ctx_add_page(&cc, page);
+				folio_get(folio);
+				f2fs_compress_ctx_add_page(&cc, &folio->page);
 				continue;
 			}
 #endif
-			ret = f2fs_write_single_data_page(page, &submitted,
-					&bio, &last_block, wbc, io_type,
-					0, true);
+			ret = f2fs_write_single_data_page(&folio->page,
+					&submitted, &bio, &last_block,
+					wbc, io_type, 0, true);
 			if (ret == AOP_WRITEPAGE_ACTIVATE)
-				unlock_page(page);
+				folio_unlock(folio);
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 result:
 #endif
@@ -3122,7 +3153,8 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 					}
 					goto next;
 				}
-				done_index = page->index + 1;
+				done_index = folio->index +
+					folio_nr_pages(folio);
 				done = 1;
 				break;
 			}
@@ -3136,7 +3168,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 			if (need_readd)
 				goto readd;
 		}
-		release_pages(pages, nr_pages);
+		release_pages(pages,nr_pages);
 		cond_resched();
 	}
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
