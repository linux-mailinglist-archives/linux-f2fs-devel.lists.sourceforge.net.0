Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 242AB65DE31
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 22:15:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pDB6R-00043R-Sq;
	Wed, 04 Jan 2023 21:15:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1pDB6Q-00043C-8i
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wfZkCFUzCyr5OXa7ytE85YOM9f5TCt/N2uJtwdJBiOM=; b=W3A6uJ43aDAKn61C3Em1IttCuK
 6fvC+nX/D6on2yi7eaKkZ3xZSx3Mt/V6axB/L8SofLyBn6fevU8uSDVi6Uy0sVaBMonPliGNGYoKJ
 qqso+LuY1SgH/M3mikOMbSNjUDs4meIz4kWwKR5Jd5k82OVm2KFuhUBFLTkVNjmXp8vw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wfZkCFUzCyr5OXa7ytE85YOM9f5TCt/N2uJtwdJBiOM=; b=LMIjgjSIkyIK6WA5JrOnNPpdKG
 lhv2AVqtd0HvxqmhUDxNPOBT2Ia0cewBzC24bWl6k//DTh7gZMv2NEonzyrFRCFzaVRmdIPJGA52l
 ZxQ6ItB7bJTKTn6EjKWSuutXAXqApVCpC6vwnIPwNQrJt7edIcvBpcSDOOK9KoOJyrI8=;
Received: from mail-pl1-f179.google.com ([209.85.214.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pDB6P-0050xV-F5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:14 +0000
Received: by mail-pl1-f179.google.com with SMTP id n4so37231153plp.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jan 2023 13:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wfZkCFUzCyr5OXa7ytE85YOM9f5TCt/N2uJtwdJBiOM=;
 b=ANmSn8BXHVDz0ywhmRcvLuF8DmLMxQ93lpCBxWPoHvl/LSFXfzY43Ai3sHGITPHyQv
 UGZzlKZDcI52wvQqJokP4vvvyYwFacbOTKHFKBLZTgqtGB7SlcKPR1/yEL1Rk/1RY7FV
 tlrzh6yP+L+Y3+ZGkeUhuel3RvMqL9274p714tcLuggAYT99ceFPsKAH/YBG+2giTF1e
 eyw4SncaR+Kt5OfkjfrFa7F9COcHovEDwjB/dlalyP7DZPUQV2SabwF4hhl1H5GEIbyF
 4m8vBFV3aeKB/xxOyyrXqMrlT7asP5ajHmmGEgqtrEunzP8BT+cK8xe4xARR13Gku/PW
 jpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wfZkCFUzCyr5OXa7ytE85YOM9f5TCt/N2uJtwdJBiOM=;
 b=5nkjAE7sk8Uu1Ob48EMW2tEruC526NcPwXNu7gq8nnnZrLq2LsudaeRTebqGWVVbMN
 0YVADRzP6CuztIe0fPmenCyFdCcDvbg4ZMEJThNU0NgsLfoEYMi61TYelcq2b0XSRb4S
 D/61In7mls3eTa+yczcJTVAexl37nhYWs1SIdT2zWk4JL3CDBiBjfx8qYXNYEcGB36Cr
 1losySEv2ubHpSozNb4E4EnpXHnI7PIZPz1m3cjLthn/ghDYtW68pabv8FBuEfLfMgWJ
 /n/T/yFWwWm49cJscsNwC0MHzaFr+vIgL1QbwlrEn5FipSoTPI1E8uQ653XNV0aXLBAz
 fZyw==
X-Gm-Message-State: AFqh2ko591FR3nDqlBDAyaLvZdcmiFxRh0Cx0yJOBwwNbi1AxdaqG3IG
 5HKdYxkDhgB/Z6SIYto10Dc=
X-Google-Smtp-Source: AMrXdXtAkt1PiXf89KpZT/PVVs6pHX6w2TYw+klecmBeo8HqViRecFRkPGwHQvT7jR7OxpCa8lhGxg==
X-Received: by 2002:a17:90a:5d08:b0:219:4578:6409 with SMTP id
 s8-20020a17090a5d0800b0021945786409mr52643871pji.41.1672866907758; 
 Wed, 04 Jan 2023 13:15:07 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::a55d])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm6408pja.21.2023.01.04.13.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 13:15:07 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  4 Jan 2023 13:14:33 -0800
Message-Id: <20230104211448.4804-9-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104211448.4804-1-vishal.moola@gmail.com>
References: <20230104211448.4804-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert function to use a folio_batch instead of pagevec.
 This is in preparation for the removal of find_get_pages_range_tag(). Also
 some minor renaming for consistency. Signed-off-by: Vishal Moola (Oracle)
 Acked-by: Jeff Layton --- fs/ceph/addr.c | 58 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+), 28 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.179 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.179 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pDB6P-0050xV-F5
Subject: [f2fs-dev] [PATCH v5 08/23] ceph: Convert ceph_writepages_start()
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
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert function to use a folio_batch instead of pagevec. This is in
preparation for the removal of find_get_pages_range_tag().

Also some minor renaming for consistency.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/addr.c | 58 ++++++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 8c74871e37c9..905268bf9741 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -792,7 +792,7 @@ static int ceph_writepages_start(struct address_space *mapping,
 	struct ceph_vino vino = ceph_vino(inode);
 	pgoff_t index, start_index, end = -1;
 	struct ceph_snap_context *snapc = NULL, *last_snapc = NULL, *pgsnapc;
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	int rc = 0;
 	unsigned int wsize = i_blocksize(inode);
 	struct ceph_osd_request *req = NULL;
@@ -821,7 +821,7 @@ static int ceph_writepages_start(struct address_space *mapping,
 	if (fsc->mount_options->wsize < wsize)
 		wsize = fsc->mount_options->wsize;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 
 	start_index = wbc->range_cyclic ? mapping->writeback_index : 0;
 	index = start_index;
@@ -869,7 +869,7 @@ static int ceph_writepages_start(struct address_space *mapping,
 
 	while (!done && index <= end) {
 		int num_ops = 0, op_idx;
-		unsigned i, pvec_pages, max_pages, locked_pages = 0;
+		unsigned i, nr_folios, max_pages, locked_pages = 0;
 		struct page **pages = NULL, **data_pages;
 		struct page *page;
 		pgoff_t strip_unit_end = 0;
@@ -879,13 +879,13 @@ static int ceph_writepages_start(struct address_space *mapping,
 		max_pages = wsize >> PAGE_SHIFT;
 
 get_more_pages:
-		pvec_pages = pagevec_lookup_range_tag(&pvec, mapping, &index,
-						end, PAGECACHE_TAG_DIRTY);
-		dout("pagevec_lookup_range_tag got %d\n", pvec_pages);
-		if (!pvec_pages && !locked_pages)
+		nr_folios = filemap_get_folios_tag(mapping, &index,
+				end, PAGECACHE_TAG_DIRTY, &fbatch);
+		dout("pagevec_lookup_range_tag got %d\n", nr_folios);
+		if (!nr_folios && !locked_pages)
 			break;
-		for (i = 0; i < pvec_pages && locked_pages < max_pages; i++) {
-			page = pvec.pages[i];
+		for (i = 0; i < nr_folios && locked_pages < max_pages; i++) {
+			page = &fbatch.folios[i]->page;
 			dout("? %p idx %lu\n", page, page->index);
 			if (locked_pages == 0)
 				lock_page(page);  /* first page */
@@ -995,7 +995,7 @@ static int ceph_writepages_start(struct address_space *mapping,
 				len = 0;
 			}
 
-			/* note position of first page in pvec */
+			/* note position of first page in fbatch */
 			dout("%p will write page %p idx %lu\n",
 			     inode, page, page->index);
 
@@ -1005,30 +1005,30 @@ static int ceph_writepages_start(struct address_space *mapping,
 				fsc->write_congested = true;
 
 			pages[locked_pages++] = page;
-			pvec.pages[i] = NULL;
+			fbatch.folios[i] = NULL;
 
 			len += thp_size(page);
 		}
 
 		/* did we get anything? */
 		if (!locked_pages)
-			goto release_pvec_pages;
+			goto release_folios;
 		if (i) {
 			unsigned j, n = 0;
-			/* shift unused page to beginning of pvec */
-			for (j = 0; j < pvec_pages; j++) {
-				if (!pvec.pages[j])
+			/* shift unused page to beginning of fbatch */
+			for (j = 0; j < nr_folios; j++) {
+				if (!fbatch.folios[j])
 					continue;
 				if (n < j)
-					pvec.pages[n] = pvec.pages[j];
+					fbatch.folios[n] = fbatch.folios[j];
 				n++;
 			}
-			pvec.nr = n;
+			fbatch.nr = n;
 
-			if (pvec_pages && i == pvec_pages &&
+			if (nr_folios && i == nr_folios &&
 			    locked_pages < max_pages) {
-				dout("reached end pvec, trying for more\n");
-				pagevec_release(&pvec);
+				dout("reached end fbatch, trying for more\n");
+				folio_batch_release(&fbatch);
 				goto get_more_pages;
 			}
 		}
@@ -1164,10 +1164,10 @@ static int ceph_writepages_start(struct address_space *mapping,
 		if (wbc->nr_to_write <= 0 && wbc->sync_mode == WB_SYNC_NONE)
 			done = true;
 
-release_pvec_pages:
-		dout("pagevec_release on %d pages (%p)\n", (int)pvec.nr,
-		     pvec.nr ? pvec.pages[0] : NULL);
-		pagevec_release(&pvec);
+release_folios:
+		dout("folio_batch release on %d folios (%p)\n", (int)fbatch.nr,
+		     fbatch.nr ? fbatch.folios[0] : NULL);
+		folio_batch_release(&fbatch);
 	}
 
 	if (should_loop && !done) {
@@ -1184,15 +1184,17 @@ static int ceph_writepages_start(struct address_space *mapping,
 			unsigned i, nr;
 			index = 0;
 			while ((index <= end) &&
-			       (nr = pagevec_lookup_tag(&pvec, mapping, &index,
-						PAGECACHE_TAG_WRITEBACK))) {
+			       (nr = filemap_get_folios_tag(mapping, &index,
+						(pgoff_t)-1,
+						PAGECACHE_TAG_WRITEBACK,
+						&fbatch))) {
 				for (i = 0; i < nr; i++) {
-					page = pvec.pages[i];
+					page = &fbatch.folios[i]->page;
 					if (page_snap_context(page) != snapc)
 						continue;
 					wait_on_page_writeback(page);
 				}
-				pagevec_release(&pvec);
+				folio_batch_release(&fbatch);
 				cond_resched();
 			}
 		}
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
