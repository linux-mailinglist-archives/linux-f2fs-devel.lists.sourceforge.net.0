Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDC3601984
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Oct 2022 22:25:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okWfj-0007Zm-M9;
	Mon, 17 Oct 2022 20:25:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1okWfg-0007Yj-1U
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 20:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UKjWA6ZN/TheYqZsKVsDxcL9aYYtGwA1j96y5Q3bLg8=; b=gO77fr7ueIXXfvMX25iVc7Ss0C
 Wf6LENjBp4mOd/axDfNGTBIXImzNGT0joegF1ubNWy5nrN4PGPW2VdjGeWxtBTtD0QFpE+BFDKxZo
 3FtoPoSi7La5YUUYjIkzK1Tsb6Y2ulqz0NrW3/BHKmoekkUjEEOWdVSobgyZjc4UxjgY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UKjWA6ZN/TheYqZsKVsDxcL9aYYtGwA1j96y5Q3bLg8=; b=cborKJksAVKQL6xu8WLJR33R+0
 CG7Z/mygmWYw0AFQEv7n2XYgU7lilYqAWtmhWNekCTGTvVJX+p35fkZCr43HFwf0HEf0JMbrcFHIx
 m4jnt3V9TjISdM+IRvJOyB5Cr8to4WVG6wZRBE9vo/eyVkjPlciUb04l1PdtcyykvXlA=;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1okWfb-007LiQ-SX for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 20:25:09 +0000
Received: by mail-pl1-f174.google.com with SMTP id k9so11387615pll.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Oct 2022 13:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UKjWA6ZN/TheYqZsKVsDxcL9aYYtGwA1j96y5Q3bLg8=;
 b=bA5Qe50yNj5Q74nC8AoJWbqxD30sNHXDZRSZjLBU2ggQFOqnFMYZOUdCpT+mhZ+lq2
 faSlXwHIGonCA6fUpkF9TlvUtgw/q6Heb3/ZnncPeVsTRrFgCXZeF4p/xm3lRedvgw3W
 KKSZEuRHBFegZU8TkJCDKngUK1I8Usc/cY0HM7AG/2SXrG2rKfhT3xuYgfj86S9gbCSX
 IrGZrOKnzQR/yeV1HdzoBMkIs+Ea1Mg1RHmC0magT0MuqnjtiN78JLLz1516GfpIZ1AG
 tKmy+RCLo5bw3oF7LzYGH6a8yDVV4MfZAq+1BAkjHVnMGsbgv9qe4Ucppkoa20qwLXUS
 BCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UKjWA6ZN/TheYqZsKVsDxcL9aYYtGwA1j96y5Q3bLg8=;
 b=CUz6OJqaS78xY/NaDuKJhn5yr9NlAHw6XtzoVG5YL9KkfqUHOYEWEJvoK6vQ0lFA59
 V47Xtmx0sDb9tMdkDWQ0XU39a2FNLAnMr9ODa5mmENaZNBdnXCD36j8fwn2jON+cOSzD
 yHcNy5AqSxGdrICsXWx+waUIgYU/Qx+j0GWDHmuzmB/X8nK6YPiV0/Z9USgzndy0SLod
 vFHDgt06aqXeo6sZYr2s/nMlM32F+enxeSTAjd67PFFl1kAkuwnQqwC2ZvJwpDBD7pZq
 LKnnB14xGMvX7P2LyOabxCXjr39LCaqEo+d2PNQ0HzjkkokoQhzIOGwcVEj6FQWYzXud
 +FEg==
X-Gm-Message-State: ACrzQf2uIhRrpVVoOJNu7IRKMvcsvZDxpClgEz2sxqRC7NwCPQDHeqd8
 6yazFfcdgeR530SCaC2rueSxDYiU9QWXNw==
X-Google-Smtp-Source: AMsMyM7T++84mxbZ+S6Axgtou1K6GxjoZ8yxv2Hc81jVsuYtSM8telQutW2PdJYqi+2SID6n+qOt+Q==
X-Received: by 2002:a17:902:f08c:b0:183:9296:8b65 with SMTP id
 p12-20020a170902f08c00b0018392968b65mr14029611pla.59.1666038302223; 
 Mon, 17 Oct 2022 13:25:02 -0700 (PDT)
Received: from vmfolio.. (c-76-102-73-225.hsd1.ca.comcast.net. [76.102.73.225])
 by smtp.googlemail.com with ESMTPSA id
 pj12-20020a17090b4f4c00b00200b12f2bf5sm145037pjb.1.2022.10.17.13.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 13:25:01 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Oct 2022 13:24:36 -0700
Message-Id: <20221017202451.4951-9-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221017202451.4951-1-vishal.moola@gmail.com>
References: <20221017202451.4951-1-vishal.moola@gmail.com>
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
 --- fs/ceph/addr.c | 58 ++++++++++++++++++++++++++ 1 file changed,
 30 insertions(+), 28 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.174 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.174 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1okWfb-007LiQ-SX
Subject: [f2fs-dev] [PATCH v3 08/23] ceph: Convert ceph_writepages_start()
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

Convert function to use a folio_batch instead of pagevec. This is in
preparation for the removal of find_get_pages_range_tag().

Also some minor renaming for consistency.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/ceph/addr.c | 58 ++++++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index dcf701b05cc1..d2361d51db39 100644
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
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
