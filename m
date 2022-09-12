Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CE95B603F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Sep 2022 20:25:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oXo7s-0005OL-3A;
	Mon, 12 Sep 2022 18:25:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oXo7o-0005Hy-Sk
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 18:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XBE5EAyurHlAAqUYTZRlJbn5nu+dgNY9++qJZC9HEP4=; b=H+3YUY/1R70Sv54Nwl3fvwBc7l
 /NlVHHfyUDpBb9Vl/o5EpnfATbF2WDgHwsIQFgwqcWWOoTUXPn2fn4DvrRohvrthPHwS9ybv4sbe7
 Rl1jr7i58P24Je9QCqRt3KrYQ3syXM8+ObYEMCCzbtwuZzQJJyLMJo7DgJail4Dpq9a8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XBE5EAyurHlAAqUYTZRlJbn5nu+dgNY9++qJZC9HEP4=; b=lBr15ovjoykgJkk2ZS1Z0QE6DH
 65ADq0gR3xgC78oOGqbsjZPiGbd2d+QLn7viQpQ23UH9rxlwzMIU85Ij+c/ktn8k0sOtifBZOw+TP
 9x/8kf+9a68hbH2lL4RtK4s9v2QGifYLTPhnIB1UicJOSSTdGG8xHpC2yVdV5UkbuFT0=;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oXo7k-0065R3-Mp for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 18:25:40 +0000
Received: by mail-pl1-f174.google.com with SMTP id v1so9376012plo.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Sep 2022 11:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=XBE5EAyurHlAAqUYTZRlJbn5nu+dgNY9++qJZC9HEP4=;
 b=ITM5iBctmKc+MCt2XrAt1/9sycCT8ZGtclTNNKSvX7cl27aimROEhwq8Yzjz9XtpFt
 F2M3x8FASHt0eghDrVD90g/LIDZl93/2UFcDto6MVoedm54lNnyvI6kXC5h0smVTph3X
 dkL4YrtLbtJIMDobW3mrXpv5RNC6a98F1m8Tv57EiXsmQY+gCrYPHWc6nFr9o7H2vsPz
 OJ4DI7g9bIkI2oG7scKkzWSsxJSsLP0a6JWX4LP8CLLcvHCi4kyX7omubZIXnYjxJrU+
 ndMeoUF7cNaG6gZOtcYhi1+dl/xzHLRjSSAjpOSJNWBqxTK1RhhwLMylxwORW+ARK7Fg
 HVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=XBE5EAyurHlAAqUYTZRlJbn5nu+dgNY9++qJZC9HEP4=;
 b=mVBJKaZtDi4/f+8okuBLOYVRwpM3HTIgTf5gN+qrhLQqo38V2+b1ImmBCWgPjveb9g
 VQYZ2YkU8kPZCtWC0XmMWYvNTreA5mHYz3DDV7VBqArFkNgY2+x3RPao72AHE2g/1PeM
 WYDo7uXWEcmKe8+bZRwpPQ84JnLvB8FYVoyzhsUmdRaTQsbDr6xK6V1rbtXgaFmv/Yyb
 gz3D+T8nCkwrKZROyCcHYXaRvogB9rXRhE9wYyiR/A5Lku0qDmJvQTs3a7vXtFEsPz0W
 m8JHz7WjSOQmev8rYbFVXAFl58haW1vmCWhKWFsUDeLkQF1c+/t9YQBNNqeV9IIH/DX3
 2Y2Q==
X-Gm-Message-State: ACgBeo2wyDqK5IA7FX4BHWj2fNiDhvHT869jgxjYOYMsd7yalb8X+I+t
 rc+gACKobBeM58jodDqFV7c=
X-Google-Smtp-Source: AA6agR5X97vcfNFGGVg/nuGpWsvVdpfUDmyvHgihCl2mmP8A/id5SOD27XkWcIF/Iv88lkmHeMJK7w==
X-Received: by 2002:a17:90a:a097:b0:1fb:5bc:7778 with SMTP id
 r23-20020a17090aa09700b001fb05bc7778mr25392630pjp.209.1663007131161; 
 Mon, 12 Sep 2022 11:25:31 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 x127-20020a626385000000b0053b2681b0e0sm5916894pfb.39.2022.09.12.11.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 11:25:30 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 12 Sep 2022 11:22:07 -0700
Message-Id: <20220912182224.514561-7-vishal.moola@gmail.com>
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
 for the removal of find_get_pages_range_tag(). Signed-off-by: Vishal Moola
 (Oracle) Acked-by: David Sterba --- fs/btrfs/extent_io.c | 19
 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-) 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oXo7k-0065R3-Mp
Subject: [f2fs-dev] [PATCH v2 06/23] btrfs: Convert
 btree_write_cache_pages() to use filemap_get_folio_tag()
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
the removal of find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: David Sterba <dsterba@suse.com>
---
 fs/btrfs/extent_io.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index cf4f19e80e2f..d1fa072bfdd0 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -4844,14 +4844,14 @@ int btree_write_cache_pages(struct address_space *mapping,
 	int ret = 0;
 	int done = 0;
 	int nr_to_write_done = 0;
-	struct pagevec pvec;
-	int nr_pages;
+	struct folio_batch fbatch;
+	unsigned int nr_folios;
 	pgoff_t index;
 	pgoff_t end;		/* Inclusive */
 	int scanned = 0;
 	xa_mark_t tag;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 	if (wbc->range_cyclic) {
 		index = mapping->writeback_index; /* Start from prev offset */
 		end = -1;
@@ -4874,14 +4874,15 @@ int btree_write_cache_pages(struct address_space *mapping,
 	if (wbc->sync_mode == WB_SYNC_ALL)
 		tag_pages_for_writeback(mapping, index, end);
 	while (!done && !nr_to_write_done && (index <= end) &&
-	       (nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
-			tag))) {
+	       (nr_folios = filemap_get_folios_tag(mapping, &index, end,
+					    tag, &fbatch))) {
 		unsigned i;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct folio *folio = fbatch.folios[i];
 
-			ret = submit_eb_page(page, wbc, &epd, &eb_context);
+			ret = submit_eb_page(&folio->page, wbc, &epd,
+					&eb_context);
 			if (ret == 0)
 				continue;
 			if (ret < 0) {
@@ -4896,7 +4897,7 @@ int btree_write_cache_pages(struct address_space *mapping,
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
