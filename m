Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F20B265DE3F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 22:15:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pDB6f-00046q-O7;
	Wed, 04 Jan 2023 21:15:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1pDB6d-000462-Qw
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+xmszoMF+zXuajEbDNQtanZkcgOmS+CJpLcEGks1cJg=; b=kBEJl26/d7rrp9j604mD5PnoYc
 qimi2Lw5ptE9zAMeN2YA2SRbWLam3SejTijfwpegju19sUGDDYo0P1sAkVXbhrEnJDbpAYLVQrKvn
 9dmHW6/8fCEtGdzBNtbyCMAl030e84ITxZXc/14MAEPqSUWzNHZAIwhxnkz0AjuWkb7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+xmszoMF+zXuajEbDNQtanZkcgOmS+CJpLcEGks1cJg=; b=GLtMj1DoXc5c7atpE67SXcHf3P
 AC63WLdvrInjbPHWrmNTascEQhgUgY+zvWtEa3AWuq6gzhZB+Z1VEojs7nBokjLwSLF7u15gzu12X
 9UnSJknLcEstbElfSg7yh1AUzGqhfFKEDFBQJ1iwZxGban4Fxkdpe/K5pZYeS32lVVtE=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pDB6c-00055m-3g for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:27 +0000
Received: by mail-pj1-f46.google.com with SMTP id
 c8-20020a17090a4d0800b00225c3614161so33095608pjg.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jan 2023 13:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+xmszoMF+zXuajEbDNQtanZkcgOmS+CJpLcEGks1cJg=;
 b=OncBz9F5gBo7cV1EReOGwL58RLiuGeHUNG9zdhd9I0bXKATJ5Zhy+0GmzcSRHZkGqe
 GWyLzbZvdJd/L2NfcZcScrFyPQDUeVa3ZPsrKxfcBXxNsTmcxuJGYX6Si9XAN/vN44PO
 JWIeuxKk4kEu/XBQv7tTuvTs0ONLCiFiszBqZ22kD1lrenj6LzRTGJaJ35L4UabDI4X9
 oDH4s+R9oGwf42PnMqbTSeqPtDYmsw6Hy03fA74G24fm2HmtysF71GUVxhIByHu1D1Re
 mLiVQ//u9upm+YXU62JZZsO92EKHd72eQkKl2tPz+jR9e+206/W8Bdj6AulQvLoDfNUZ
 B5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+xmszoMF+zXuajEbDNQtanZkcgOmS+CJpLcEGks1cJg=;
 b=yFOb/egF8OvEQO97T0BMVhVasz9e3TyAEAAJoGesiGStjYruVpuRB1IvdryXNkqlGu
 ijM9ZUGQvM20EE4BV16fMMp23uFL7Dub7zk+JxHL/FRh1bWZr7u6F1S6LkXVAZYzd7Sn
 zxUp0ItAhcFx7coRG3nEGVmu/G21pO+NPHWTJ+7EsAtTtLDRfjoS8d+ipQ75KQ63m6YR
 BY+ArxemV5Mord+TVDD+tIs2acntwDjo+LdkxAtVqIZlU/wr5M01ZSII3afL8JuT9Q56
 W1WKcnqc2ZO7lQQnAzlqd8t0Yldg17TxhRHA1lFbncaqFBcp2HvXCR5rxmHG3DtJNCls
 gM4w==
X-Gm-Message-State: AFqh2koAoJtncl6gaPi/vfg5d3NZyAI77eX2/FRIXAZqvOeWVZ2zYns4
 x2OAvMUatBpP+dHZFjV98SpqkERxcsC+hA==
X-Google-Smtp-Source: AMrXdXvHnTnnPFQftwDqWW79TZxt6Ds+PTbYHXL3GxE41AK61UcPUBYk4efjU/wb+K+ueTETX1yb+w==
X-Received: by 2002:a17:90a:b296:b0:225:d9e7:2728 with SMTP id
 c22-20020a17090ab29600b00225d9e72728mr40013660pjr.33.1672866920523; 
 Wed, 04 Jan 2023 13:15:20 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::a55d])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm6408pja.21.2023.01.04.13.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 13:15:20 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  4 Jan 2023 13:14:42 -0800
Message-Id: <20230104211448.4804-18-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104211448.4804-1-vishal.moola@gmail.com>
References: <20230104211448.4804-1-vishal.moola@gmail.com>
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
 for the removal of find_get_pgaes_range_tag(). This change removes 8 calls
 to compound_head(). Also had to modify and rename gfs2_write_jdata_pagevec()
 to take in and utilize folio_batch rather than pagevec and use folios rather
 than pages. gfs2_write_jdata_batch() now supports large folios. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.46 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pDB6c-00055m-3g
Subject: [f2fs-dev] [PATCH v5 17/23] gfs2: Convert gfs2_write_cache_jdata()
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
the removal of find_get_pgaes_range_tag(). This change removes 8 calls
to compound_head().

Also had to modify and rename gfs2_write_jdata_pagevec() to take in
and utilize folio_batch rather than pagevec and use folios rather
than pages. gfs2_write_jdata_batch() now supports large folios.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/gfs2/aops.c | 64 +++++++++++++++++++++++++++-----------------------
 1 file changed, 35 insertions(+), 29 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index e782b4f1d104..0a47068f9acc 100644
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
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
