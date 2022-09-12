Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9365B6036
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Sep 2022 20:25:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oXo7c-0002lr-Ku;
	Mon, 12 Sep 2022 18:25:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oXo7b-0002lc-Lc
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 18:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KoXD1n4O8ij6+vaDqAsDjDA1z1eTfTDWEfPJ9QSCW/M=; b=aj5PuCOgIw8HjjRAgJxpwVQD/7
 UTeF0T8o/uaqJfFerm1ncifAK0ArS1Nq1rU63KJNi9fXx41SCQwPJKawWRgLn/LhdIa7PK32Ht1RR
 Fa21IlClb+JZ+OTN1ujGg0milZYLXlg1YXQxi2Ej2STZrTCgJ5u9L4P2jo8I9949WuJU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KoXD1n4O8ij6+vaDqAsDjDA1z1eTfTDWEfPJ9QSCW/M=; b=VhYGnsxS5Z6TZ86lUWRsJXG58z
 PXYRIYcgDMFmzt1fEYhr73UiYHDq5ySo+QaVPFXrwNkVt6XLR+5ZSBIc7DLBAyDrB5p1HOiEdvBkN
 dmf5Uqs8WATEWO3vvkfdQSOHYwS54oDEmnnvP5xJwTDuS1V/3KmKBMp+Y1bhMXkyD5jI=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oXo7m-0065R9-I8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 18:25:40 +0000
Received: by mail-pf1-f179.google.com with SMTP id y136so9451128pfb.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Sep 2022 11:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=KoXD1n4O8ij6+vaDqAsDjDA1z1eTfTDWEfPJ9QSCW/M=;
 b=BZPYTfKKJ2IeGMWsAm7r5I0nQB4gclz+jy6EiITDppW6LssmKcSmGL+zkMGzIjf98J
 Q3BASOV6PEAfmE68/qZUmNU+ToR1Rwqc0faNQ8jDOn7kQ+r7lr+aPhsgOnMbpqRcDM2q
 5NYfTIsAyd9Th1n/L/TbbN3vetw/ZO4rITCeD3wkLYNjZFz3gI1ars7ee7f7W3JdkKBy
 aPnrjXNnzFtLErLace4ESBOS/R7qEYB2MaD2vqFA0/AlV9HezcEeR5NRqn30wevEveTR
 bGDRTu8iaWmVvnqe/dXNAI6iA31yI+10bgpY9gd7za2p7wzO3beyLUxFMZoM2A6weUU1
 dwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=KoXD1n4O8ij6+vaDqAsDjDA1z1eTfTDWEfPJ9QSCW/M=;
 b=fRVVYKAxDTvLDG0F5L7D1h5e85UIVPfcA2VOb1vChDaWRlHmPcE6kOJx71r3kzmK4v
 vVXMHBPEkDLdd0cA5O5+vFlLxZc6DRwH4N1sdVd8hdSbURAbrUYklck4e9QJkbGCUrI3
 u5Z3cFrDqCQ/4AOQyKTsS3PaTwk06M9nphp5JtWqzAB0/jjMTLHl0A5kQZLPL/8apg57
 Cqi9mjYM/CHzWEoTotvzpaNYTts+/3e/ad5JZvhP6ja2PNQ2rBUTXuN5SKiTaEDqFO/L
 DfraP1fk7hwFfRe3dGUJhy4S/0DiryMHJLY/DCTN49wfDIhTEwCyDMsRCGoPKftx2ddm
 l1cw==
X-Gm-Message-State: ACgBeo1NTHBxeQ6hRch3pm6vA/Vor560iBAK+JD+xKF7d5QUEwlN/S3V
 vYYVqquHKlus6h/iDTmJu80=
X-Google-Smtp-Source: AA6agR4kc218OTkByNvMFvG40KB25np+dV2H9QdbTpPY0UgJwFep6+zCtMG38JLWYBwE1M9+1Fbrug==
X-Received: by 2002:a63:1a53:0:b0:41f:5298:9b5f with SMTP id
 a19-20020a631a53000000b0041f52989b5fmr24051599pgm.244.1663007132921; 
 Mon, 12 Sep 2022 11:25:32 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 x127-20020a626385000000b0053b2681b0e0sm5916894pfb.39.2022.09.12.11.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 11:25:32 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 12 Sep 2022 11:22:08 -0700
Message-Id: <20220912182224.514561-8-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220912182224.514561-1-vishal.moola@gmail.com>
References: <20220912182224.514561-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Converted function to use folios throughout. This is in
 preparation
 for the removal of find_get_pages_range_tag(). Now also supports large folios.
 Signed-off-by: Vishal Moola (Oracle) Acked-by: David Sterba ---
 fs/btrfs/extent_io.c
 | 38 +++++++++++++++++++ 1 file changed, 19 insertions(+), 19 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.179 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.179 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oXo7m-0065R9-I8
Subject: [f2fs-dev] [PATCH v2 07/23] btrfs: Convert
 extent_write_cache_pages() to use filemap_get_folios_tag()
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
 cluster-devel@redhat.com, linux-mm@kvack.org, David Sterba <dsterba@suse.com>,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Converted function to use folios throughout. This is in preparation for
the removal of find_get_pages_range_tag(). Now also supports large
folios.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: David Sterba <dsterba@suse.com>
---
 fs/btrfs/extent_io.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index d1fa072bfdd0..80fe313f8461 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -4972,8 +4972,8 @@ static int extent_write_cache_pages(struct address_space *mapping,
 	int ret = 0;
 	int done = 0;
 	int nr_to_write_done = 0;
-	struct pagevec pvec;
-	int nr_pages;
+	struct folio_batch fbatch;
+	unsigned int nr_folios;
 	pgoff_t index;
 	pgoff_t end;		/* Inclusive */
 	pgoff_t done_index;
@@ -4993,7 +4993,7 @@ static int extent_write_cache_pages(struct address_space *mapping,
 	if (!igrab(inode))
 		return 0;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 	if (wbc->range_cyclic) {
 		index = mapping->writeback_index; /* Start from prev offset */
 		end = -1;
@@ -5031,14 +5031,14 @@ static int extent_write_cache_pages(struct address_space *mapping,
 		tag_pages_for_writeback(mapping, index, end);
 	done_index = index;
 	while (!done && !nr_to_write_done && (index <= end) &&
-			(nr_pages = pagevec_lookup_range_tag(&pvec, mapping,
-						&index, end, tag))) {
+			(nr_folios = filemap_get_folios_tag(mapping, &index,
+							end, tag, &fbatch))) {
 		unsigned i;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct folio *folio = fbatch.folios[i];
 
-			done_index = page->index + 1;
+			done_index = folio->index + folio_nr_pages(folio);
 			/*
 			 * At this point we hold neither the i_pages lock nor
 			 * the page lock: the page may be truncated or
@@ -5046,29 +5046,29 @@ static int extent_write_cache_pages(struct address_space *mapping,
 			 * or even swizzled back from swapper_space to
 			 * tmpfs file mapping
 			 */
-			if (!trylock_page(page)) {
+			if (!folio_trylock(folio)) {
 				submit_write_bio(epd, 0);
-				lock_page(page);
+				folio_lock(folio);
 			}
 
-			if (unlikely(page->mapping != mapping)) {
-				unlock_page(page);
+			if (unlikely(folio->mapping != mapping)) {
+				folio_unlock(folio);
 				continue;
 			}
 
 			if (wbc->sync_mode != WB_SYNC_NONE) {
-				if (PageWriteback(page))
+				if (folio_test_writeback(folio))
 					submit_write_bio(epd, 0);
-				wait_on_page_writeback(page);
+				folio_wait_writeback(folio);
 			}
 
-			if (PageWriteback(page) ||
-			    !clear_page_dirty_for_io(page)) {
-				unlock_page(page);
+			if (folio_test_writeback(folio) ||
+			    !folio_clear_dirty_for_io(folio)) {
+				folio_unlock(folio);
 				continue;
 			}
 
-			ret = __extent_writepage(page, wbc, epd);
+			ret = __extent_writepage(&folio->page, wbc, epd);
 			if (ret < 0) {
 				done = 1;
 				break;
@@ -5081,7 +5081,7 @@ static int extent_write_cache_pages(struct address_space *mapping,
 			 */
 			nr_to_write_done = wbc->nr_to_write <= 0;
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 	if (!scanned && !done) {
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
