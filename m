Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB8B5B6066
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Sep 2022 20:26:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oXo8C-0000t0-TD;
	Mon, 12 Sep 2022 18:26:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oXo8B-0000sJ-3a
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 18:26:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BDjCowA00FLyTw2IZ0c6KLYAlD0lJWdoqS+0xSa08wc=; b=RETO81tziL7L7LIhEdfr2mo+TO
 Nbvzj/quyxiFgSqS9lIqzVCBkya5CIEe6MhmhM4SwVMPkCqWBPktyaQJo62lGsydZ8yVAo/H6aYuu
 8rUbKWwvcsWz1cxHg3LorMkiht9BJli57CxzwpRkupGEiR517il8bzNjvVc3LPOlN+G4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BDjCowA00FLyTw2IZ0c6KLYAlD0lJWdoqS+0xSa08wc=; b=P8oxvFpEO9VevDM/PcOEXR2KN8
 2bwLtAdpLaJ0scUehTRYxqqO7lKeYq9YD359z/C7eR8dYvVvsA0H+GRL5B669DLDnLbqLUW4JlKWx
 TunG/i8kq0AVWdbIA5lftZDUcSgJTlfX/CGg9R6YbuIqSoBIb36HKzxRXaCC/Fay6QJY=;
Received: from mail-pj1-f42.google.com ([209.85.216.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oXo8A-0003nm-G2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 18:26:03 +0000
Received: by mail-pj1-f42.google.com with SMTP id
 i15-20020a17090a4b8f00b0020073b4ac27so8995573pjh.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Sep 2022 11:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=BDjCowA00FLyTw2IZ0c6KLYAlD0lJWdoqS+0xSa08wc=;
 b=YdCS4mb2VUuuI+vH3RFZFwtKJ7x4FizIRVDEtIMof7eBdc2xa204LEqFJKqjq36AD4
 wZaqM9AjOqNCZQbY6Fpfnt72m7ehsWxTnn4nx8xNUn+X9K9pUFZz4D5QM7Ts62mkjRKy
 pGraHvdMM1hijVJEZbFlxwdqS8JEfBLK9FvHhW23Z3E31ZL7pa+2eYT3UHNOfRSu+99q
 cjZnUPeaDQ9zelAE/mkEUSEU2Q1iW6YawaZ8vZOuo+tKw+WBDT7EcWDlSWJb6EvY/hcU
 EjmvnoT+9nJTwSHk1SyaClmJtJu89VKBjT7TP0Z55JrSAnflKDsBPRRkfILl/JjbkXEm
 WSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=BDjCowA00FLyTw2IZ0c6KLYAlD0lJWdoqS+0xSa08wc=;
 b=WjHL3w3MXnUApZIevKO2qwfvoxSb+XyjIQAkQ4hpiVu4kGXXEL89VKPPTOf/lxjJJw
 HTaipdwlvwqSPh0DS77u0+GYHbfDw62KBWkQ1s02i8aFydwYkrK2bJv6ZfZS4XjoPLYi
 liZFoxglCSiB5M90giwGptCH6p9+CUHHQxX0Gdy6cllnh+sAwDE18HaIWY2+BOHOqU6/
 WaYLoPb2ZS6Cg3joYGDTC4i8EfOtRsvzO9hYcRR2cEjG0aUuAy9Pe58/fEO1LL+6IjH1
 l/Xc6TXTjMDsn5PD84ZSRGl2h0RGxuai9UhN7h6jS19Lm4jT/V0p7cjxnuDWOg/1urdt
 hMIw==
X-Gm-Message-State: ACgBeo3Fh+dDGW+gc7A70/L1DKktYO2r2So+ycD3vruXCk4xKllDB0cT
 UNDNKJdHOT8ZYVZ2ZGJy9uU=
X-Google-Smtp-Source: AA6agR7UKj1n3Ku5QzSvYbuBiePM1904QkRm9obfKEPcnQW6FL+0WBcOg4ndj2Z3wIamBQ2w8m5PpA==
X-Received: by 2002:a17:90a:9f96:b0:1fa:b4fb:6297 with SMTP id
 o22-20020a17090a9f9600b001fab4fb6297mr25133060pjp.80.1663007156873; 
 Mon, 12 Sep 2022 11:25:56 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 x127-20020a626385000000b0053b2681b0e0sm5916894pfb.39.2022.09.12.11.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 11:25:56 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 12 Sep 2022 11:22:22 -0700
Message-Id: <20220912182224.514561-22-vishal.moola@gmail.com>
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
 Content preview: Convert function to use folios throughout. This is in
 preparation
 for the removal of find_get_pages_range_tag(). Signed-off-by: Vishal Moola
 (Oracle) Acked-by: Ryusuke Konishi --- fs/nilfs2/page.c | 39
 ++++++++++++++++++++
 1 file changed, 20 insertions(+), 19 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.42 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.42 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oXo8A-0003nm-G2
Subject: [f2fs-dev] [PATCH v2 21/23] nilfs2: Convert
 nilfs_copy_dirty_pages() to use filemap_get_folios_tag()
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
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert function to use folios throughout. This is in preparation for
the removal of find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
---
 fs/nilfs2/page.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/fs/nilfs2/page.c b/fs/nilfs2/page.c
index 3267e96c256c..5c96084e829f 100644
--- a/fs/nilfs2/page.c
+++ b/fs/nilfs2/page.c
@@ -240,42 +240,43 @@ static void nilfs_copy_page(struct page *dst, struct page *src, int copy_dirty)
 int nilfs_copy_dirty_pages(struct address_space *dmap,
 			   struct address_space *smap)
 {
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	unsigned int i;
 	pgoff_t index = 0;
 	int err = 0;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 repeat:
-	if (!pagevec_lookup_tag(&pvec, smap, &index, PAGECACHE_TAG_DIRTY))
+	if (!filemap_get_folios_tag(smap, &index, (pgoff_t)-1,
+				PAGECACHE_TAG_DIRTY, &fbatch))
 		return 0;
 
-	for (i = 0; i < pagevec_count(&pvec); i++) {
-		struct page *page = pvec.pages[i], *dpage;
+	for (i = 0; i < folio_batch_count(&fbatch); i++) {
+		struct folio *folio = fbatch.folios[i], *dfolio;
 
-		lock_page(page);
-		if (unlikely(!PageDirty(page)))
-			NILFS_PAGE_BUG(page, "inconsistent dirty state");
+		folio_lock(folio);
+		if (unlikely(!folio_test_dirty(folio)))
+			NILFS_PAGE_BUG(&folio->page, "inconsistent dirty state");
 
-		dpage = grab_cache_page(dmap, page->index);
-		if (unlikely(!dpage)) {
+		dfolio = filemap_grab_folio(dmap, folio->index);
+		if (unlikely(!dfolio)) {
 			/* No empty page is added to the page cache */
 			err = -ENOMEM;
-			unlock_page(page);
+			folio_unlock(folio);
 			break;
 		}
-		if (unlikely(!page_has_buffers(page)))
-			NILFS_PAGE_BUG(page,
+		if (unlikely(!folio_buffers(folio)))
+			NILFS_PAGE_BUG(&folio->page,
 				       "found empty page in dat page cache");
 
-		nilfs_copy_page(dpage, page, 1);
-		__set_page_dirty_nobuffers(dpage);
+		nilfs_copy_page(&dfolio->page, &folio->page, 1);
+		filemap_dirty_folio(folio_mapping(dfolio), dfolio);
 
-		unlock_page(dpage);
-		put_page(dpage);
-		unlock_page(page);
+		folio_unlock(dfolio);
+		folio_put(dfolio);
+		folio_unlock(folio);
 	}
-	pagevec_release(&pvec);
+	folio_batch_release(&fbatch);
 	cond_resched();
 
 	if (likely(!err))
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
