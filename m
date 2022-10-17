Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C39C860197C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Oct 2022 22:25:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okWfh-0002aA-Ij;
	Mon, 17 Oct 2022 20:25:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1okWfg-0002Zd-1Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 20:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8lGvZhCn6w3m/u/axqUyJr4YJieOtwPL381iDrfRPJs=; b=h0F7s1v9zfyLKwLbnHfyk8X2Dw
 h5r8X/ij0cL/b6a8daa9mCqrCdTGjqmWZQxePYqA0B89E7fVU9S5iL+V8iae6AGGZKRanT48cUtdH
 LXNkFfSVFL6MXAgxkfS3kgww58joXqReyoitv1RKNjXIG07U8MwFIShBTyN5VsQUi9Ic=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8lGvZhCn6w3m/u/axqUyJr4YJieOtwPL381iDrfRPJs=; b=Ub9YOAEcCwuf1Bs5shy4sy2Bee
 IytL9W4xPAALLX1K2Plf5kN8hrywmJiPe1ysf/Qruxhp1Vnr5d6lV9Rjm9MiPcE0ZKhghkD6tFixq
 N8QTOeiKwLZ0hWYKqouRG/zsmCQWzDTVYZmHxSYhluUwW+iSW4YCSDKqFxCjPWW1w2DY=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1okWfa-0008Rg-B9 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 20:25:08 +0000
Received: by mail-pl1-f171.google.com with SMTP id i6so11787862pli.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Oct 2022 13:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8lGvZhCn6w3m/u/axqUyJr4YJieOtwPL381iDrfRPJs=;
 b=aG3SJg4qEEuUDtQxkrwRHnXHEwtEOL8oRmp1xZGekVyz7AhXflcPIT93FxZtSN7uZY
 lM5k52jpW2xqn/iYqreIVsJXVTqBXttefGdjlBnm2ZiWSVft3KopI5uWZCYYgnYlxzy0
 viM2Fwjf08wHoU6bQj5F92IKi7+a0IhEnJXK/52p8U2ZcybnkQqwj27LdYTfvezaVks8
 N0z1LL10X2PYU2LyW2qpNOXjfG1KLK+AtL0Xi5sghE+Ct+9vBqzo4iFRd67IECUeMCll
 RNVAWFX1G/NemRO5eE8fzhREY4K9flg9KP2L8wXVlgZh++Ne4D1TvU1k18grQa7QQvgO
 JZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8lGvZhCn6w3m/u/axqUyJr4YJieOtwPL381iDrfRPJs=;
 b=3dfhcTht8xDa5UDDdz7KrPiopVGQkuLR4MzflW0KPnTIQhfdY5lPZ+J9N6WKSfERiw
 CSEFqR941rev52WfWeZQ/Aab4yixVYkPhcaEkeud2mkHzf6xZZnCs1OcGcQfnuI3VHqc
 A2g+VLtI9pCjldi70KSmETUuE+3Mlf5deX2jeNNdYQn2FKGlHDbGIVSOuYMwZAWt+f15
 rIDEMKtJtWBp6l0TYMePHU4gZ/XdA/QjR69bBIqQjVVzy1h0/hlj2w5MlgUH/oqEN3NN
 a7BVAhFtcve5sM2BBIn85noe4jvOtSd5qR2lS2eVYlb4VerdP5ckL3CDxfCpqD/Grwt1
 3aJQ==
X-Gm-Message-State: ACrzQf2x09eo8KsK8vQrTuyb9IFiDeZKxeVHYl4gYckZ+d7DgJvziuq3
 6ZrDnMNrujSjeXe6DX5g8v8=
X-Google-Smtp-Source: AMsMyM6tfWH5JmHMjL9xEyHkw3me1mwVGQL1ChF52fOwc6dA9re9L7H8si5UZJCzP5DFRlN2udbDCA==
X-Received: by 2002:a17:902:f707:b0:184:e44f:88cc with SMTP id
 h7-20020a170902f70700b00184e44f88ccmr13721703plo.42.1666038301326; 
 Mon, 17 Oct 2022 13:25:01 -0700 (PDT)
Received: from vmfolio.. (c-76-102-73-225.hsd1.ca.comcast.net. [76.102.73.225])
 by smtp.googlemail.com with ESMTPSA id
 pj12-20020a17090b4f4c00b00200b12f2bf5sm145037pjb.1.2022.10.17.13.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 13:25:01 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Oct 2022 13:24:35 -0700
Message-Id: <20221017202451.4951-8-vishal.moola@gmail.com>
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.171 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1okWfa-0008Rg-B9
Subject: [f2fs-dev] [PATCH v3 07/23] btrfs: Convert
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
index 9ae75db4d55e..983dde83ba93 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -3088,8 +3088,8 @@ static int extent_write_cache_pages(struct address_space *mapping,
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
@@ -3109,7 +3109,7 @@ static int extent_write_cache_pages(struct address_space *mapping,
 	if (!igrab(inode))
 		return 0;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 	if (wbc->range_cyclic) {
 		index = mapping->writeback_index; /* Start from prev offset */
 		end = -1;
@@ -3147,14 +3147,14 @@ static int extent_write_cache_pages(struct address_space *mapping,
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
@@ -3162,29 +3162,29 @@ static int extent_write_cache_pages(struct address_space *mapping,
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
@@ -3197,7 +3197,7 @@ static int extent_write_cache_pages(struct address_space *mapping,
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
