Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0C75B605C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Sep 2022 20:25:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oXo85-0005ZR-Ir;
	Mon, 12 Sep 2022 18:25:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oXo83-0005Ym-Hp
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 18:25:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YZ9m9PEte2VFIEg+ZjqrJWhRYr046qHZsEH0p4wP4bQ=; b=QLxoFPiVycx6TBP8vUm3qKqD33
 +YT/MNuUfDMV3JN1XDw5FOdC+enheyXSRGgv1LOfUtq5APjTGDAWatsOoIwE4gHsp+tYH9TAIpiOi
 B+TLP+mK3lEMALKx+2vDsE82uKUkp0gD2Wx3PHagsE9Hstu0xE3Z6bfopw/POe+OfG9I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YZ9m9PEte2VFIEg+ZjqrJWhRYr046qHZsEH0p4wP4bQ=; b=m8f0RlqdylnGSrP3vHuyVkEF1F
 pHApF4WAKjdL0xfAnGC0r2c28biGvOVbmdgvcE7wVJzWVcgUPMyCd6Y810kxeMJxRMaNoP/BZOtG3
 jlHOrUnvwHjoYseM0yMFHR4y2XbUKJxorBGoEJz7MFrHCZFaniZ9/EJC9zKSL8Jwpe3c=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oXo82-0003nA-TP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 18:25:55 +0000
Received: by mail-pl1-f171.google.com with SMTP id f24so9394219plr.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Sep 2022 11:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=YZ9m9PEte2VFIEg+ZjqrJWhRYr046qHZsEH0p4wP4bQ=;
 b=PzgRiXVE3yrxA/K+oDOKGWXJ1AL69iNVAX5Ct8UX0CAc07XinJWHOHoRdZO3Yau9YR
 c8vGsb0z95KFb6fVMII+ntFC6dzlS1BHKUcFlptsDc91LYeHSvmtg4Hbg8D/ORa1TF7p
 H8dLeiPvRIZeb6AVCdqBZ6yhgJRtkYSjfhTXN0xtP4ycbR9huzolwut/ABl161ypgBl7
 A6HA2HyiGQWO4YhdzlnWAwYFsURg5TPW+l4AjlG4i9JJBB/Fu99iXvsFjS4vMCIg2uAD
 gLJqXP5sgRQzYDD7eBdgtZtbPWgf1Vd/GBHerYBx8Yq7FaHBwo//n3qz9Gh4ToeeAwTC
 0N7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=YZ9m9PEte2VFIEg+ZjqrJWhRYr046qHZsEH0p4wP4bQ=;
 b=XR4J5l7cGpMYLAmiPycFvr5fCMCeIZ4LHeeuvBUTz9otlyqDThMscH1fTjYOz8k+Ku
 t40sPFhnar6INNUcdJxWihYy076pUwZsji/YPVhtNp/4pwtMO2GSDyOuX9XCQPOZTvHD
 p6PMsPS0bCvNQs7csjsUX6DwV/HN7W4PTYWz66aluY8NOZHSAZIm7H25luLAQfIFxvxy
 8RpZvHu+4JFoCafJ5i14jtg0Xbm2P/UxJu0vSzMr76Id48QBempzMWY+K5Xt67nbk7go
 UOEMj7xFBxHSj5LNESQ3sLI8U/avLBFuvvDObBlmgd8O8yjZr8U5SnAnIaYtIv3E16/L
 qk7Q==
X-Gm-Message-State: ACgBeo1ZmhXl7Q+JgU9MQ7rX4olJUQ27H3va9FEI4yt92GmTmUO+vcFZ
 zYIcoCIAEVtJhYWzIC8qGM8=
X-Google-Smtp-Source: AA6agR6vSFy+9kM45HEYmvJBMnXUggnIRCddt2JVkkB9zZi/qC2JZFNfFnJUz4f9ZFSD6bx6zCUCJA==
X-Received: by 2002:a17:902:8643:b0:172:e067:d7ac with SMTP id
 y3-20020a170902864300b00172e067d7acmr28154722plt.164.1663007149311; 
 Mon, 12 Sep 2022 11:25:49 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 x127-20020a626385000000b0053b2681b0e0sm5916894pfb.39.2022.09.12.11.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 11:25:48 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 12 Sep 2022 11:22:18 -0700
Message-Id: <20220912182224.514561-18-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220912182224.514561-1-vishal.moola@gmail.com>
References: <20220912182224.514561-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Converted function to use folios throughout. This is in
 preparation
 for the removal of find_get_pgaes_range_tag(). Also had to modify and rename
 gfs2_write_jdata_pagevec() to take in and utilize folio_batch rather than
 pagevec and use folios rather than pages. gfs2_write_jdata_batch() now
 supports large folios. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.171 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oXo82-0003nA-TP
Subject: [f2fs-dev] [PATCH v2 17/23] gfs2: Convert gfs2_write_cache_jdata()
 to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Converted function to use folios throughout. This is in preparation for
the removal of find_get_pgaes_range_tag().

Also had to modify and rename gfs2_write_jdata_pagevec() to take in
and utilize folio_batch rather than pagevec and use folios rather
than pages. gfs2_write_jdata_batch() now supports large folios.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/gfs2/aops.c | 64 +++++++++++++++++++++++++++-----------------------
 1 file changed, 35 insertions(+), 29 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 05bee80ac7de..8f87c2551a3d 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -195,67 +195,71 @@ static int gfs2_writepages(struct address_space *mapping,
 }
 
 /**
- * gfs2_write_jdata_pagevec - Write back a pagevec's worth of pages
+ * gfs2_write_jdata_batch - Write back a folio batch's worth of folios
  * @mapping: The mapping
  * @wbc: The writeback control
- * @pvec: The vector of pages
- * @nr_pages: The number of pages to write
+ * @fbatch: The batch of folios
  * @done_index: Page index
  *
  * Returns: non-zero if loop should terminate, zero otherwise
  */
 
-static int gfs2_write_jdata_pagevec(struct address_space *mapping,
+static int gfs2_write_jdata_batch(struct address_space *mapping,
 				    struct writeback_control *wbc,
-				    struct pagevec *pvec,
-				    int nr_pages,
+				    struct folio_batch *fbatch,
 				    pgoff_t *done_index)
 {
 	struct inode *inode = mapping->host;
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
-	unsigned nrblocks = nr_pages * (PAGE_SIZE >> inode->i_blkbits);
+	unsigned nrblocks;
 	int i;
 	int ret;
+	int nr_pages = 0;
+	int nr_folios = folio_batch_count(fbatch);
+
+	for (i = 0; i < nr_folios; i++)
+		nr_pages += folio_nr_pages(fbatch->folios[i]);
+	nrblocks = nr_pages * (PAGE_SIZE >> inode->i_blkbits);
 
 	ret = gfs2_trans_begin(sdp, nrblocks, nrblocks);
 	if (ret < 0)
 		return ret;
 
-	for(i = 0; i < nr_pages; i++) {
-		struct page *page = pvec->pages[i];
+	for (i = 0; i < nr_folios; i++) {
+		struct folio *folio = fbatch->folios[i];
 
-		*done_index = page->index;
+		*done_index = folio->index;
 
-		lock_page(page);
+		folio_lock(folio);
 
-		if (unlikely(page->mapping != mapping)) {
+		if (unlikely(folio->mapping != mapping)) {
 continue_unlock:
-			unlock_page(page);
+			folio_unlock(folio);
 			continue;
 		}
 
-		if (!PageDirty(page)) {
+		if (!folio_test_dirty(folio)) {
 			/* someone wrote it for us */
 			goto continue_unlock;
 		}
 
-		if (PageWriteback(page)) {
+		if (folio_test_writeback(folio)) {
 			if (wbc->sync_mode != WB_SYNC_NONE)
-				wait_on_page_writeback(page);
+				folio_wait_writeback(folio);
 			else
 				goto continue_unlock;
 		}
 
-		BUG_ON(PageWriteback(page));
-		if (!clear_page_dirty_for_io(page))
+		BUG_ON(folio_test_writeback(folio));
+		if (!folio_clear_dirty_for_io(folio))
 			goto continue_unlock;
 
 		trace_wbc_writepage(wbc, inode_to_bdi(inode));
 
-		ret = __gfs2_jdata_writepage(page, wbc);
+		ret = __gfs2_jdata_writepage(&folio->page, wbc);
 		if (unlikely(ret)) {
 			if (ret == AOP_WRITEPAGE_ACTIVATE) {
-				unlock_page(page);
+				folio_unlock(folio);
 				ret = 0;
 			} else {
 
@@ -268,7 +272,8 @@ static int gfs2_write_jdata_pagevec(struct address_space *mapping,
 				 * not be suitable for data integrity
 				 * writeout).
 				 */
-				*done_index = page->index + 1;
+				*done_index = folio->index +
+					folio_nr_pages(folio);
 				ret = 1;
 				break;
 			}
@@ -305,8 +310,8 @@ static int gfs2_write_cache_jdata(struct address_space *mapping,
 {
 	int ret = 0;
 	int done = 0;
-	struct pagevec pvec;
-	int nr_pages;
+	struct folio_batch fbatch;
+	int nr_folios;
 	pgoff_t writeback_index;
 	pgoff_t index;
 	pgoff_t end;
@@ -315,7 +320,7 @@ static int gfs2_write_cache_jdata(struct address_space *mapping,
 	int range_whole = 0;
 	xa_mark_t tag;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 	if (wbc->range_cyclic) {
 		writeback_index = mapping->writeback_index; /* prev offset */
 		index = writeback_index;
@@ -341,17 +346,18 @@ static int gfs2_write_cache_jdata(struct address_space *mapping,
 		tag_pages_for_writeback(mapping, index, end);
 	done_index = index;
 	while (!done && (index <= end)) {
-		nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
-				tag);
-		if (nr_pages == 0)
+		nr_folios = filemap_get_folios_tag(mapping, &index, end,
+				tag, &fbatch);
+		if (nr_folios == 0)
 			break;
 
-		ret = gfs2_write_jdata_pagevec(mapping, wbc, &pvec, nr_pages, &done_index);
+		ret = gfs2_write_jdata_batch(mapping, wbc, &fbatch,
+				&done_index);
 		if (ret)
 			done = 1;
 		if (ret > 0)
 			ret = 0;
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
