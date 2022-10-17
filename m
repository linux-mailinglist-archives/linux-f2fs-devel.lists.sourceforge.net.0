Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C7960198C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Oct 2022 22:25:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okWfn-0002cD-37;
	Mon, 17 Oct 2022 20:25:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1okWfl-0002bg-Il
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 20:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pCDfC9IuoCSNDVn7a45aZdbsaBOFv8BIjFg1qCCcT9Q=; b=DGpjSlS6Qdr4kB6nHNO7g5R9SD
 pnZ9YCbjrPnEitpw906uXa+0Ce4810C7EuyHO172/5op1cIj7TMfPJPMUUNnDgfl+opYaReQXQ6tw
 ZXhI+ek/h655I7ffyCq1ZoLk5anlagLuvAvtr9fAEF5XxyhRJHkpUIAmtd5eGE1W143o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pCDfC9IuoCSNDVn7a45aZdbsaBOFv8BIjFg1qCCcT9Q=; b=Ztzfm/Rk2/byjHqQbejL4s6Fci
 0oECUS4bc3vaIGlSBOe7E+Wbj22HrR00XGTmYjILYMfAnn1rHW0xIEWfk9OPllmWq8kIZtFf3pf8i
 plAbLv7js6EJ2LaYE05zhEyrDOOePb/2Z//xmLOAjBLslimXhn6e7jtSWJ4F+Zkj82Z0=;
Received: from mail-pg1-f182.google.com ([209.85.215.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1okWfi-0008SQ-U8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 20:25:17 +0000
Received: by mail-pg1-f182.google.com with SMTP id e129so11441522pgc.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Oct 2022 13:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pCDfC9IuoCSNDVn7a45aZdbsaBOFv8BIjFg1qCCcT9Q=;
 b=FR1LNYFng+AQCvWuGo7pKycSGzlM+nOufT5OULgoUpv7TxwUKFLoFGQ1PBu1TUboxQ
 cKfMi+XZCuXEiUYJYRkC+CRHS8K5My5bnBXcRnb8ADcQTVvNtlgrocyyxBeiv/bbURiD
 gKbQaae0HWZ7285WScdLoBRWOoDW+sGW/gTcN6/SSYtkeZQC/H5+0x037jkvDQPxscrX
 MVFh6LXIiYO+p3FoJ026Ixc6pWx3h4mx0Mo3qQon0W01P/7wO34ZuTABZPCG9dBvRZZd
 iERh6fCFGKCImdQZheraz9vYGFwmFIvIf+Y3XvzAKGcqVF3uvHE0V2j8rOq5X+V8Ls7b
 Wylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pCDfC9IuoCSNDVn7a45aZdbsaBOFv8BIjFg1qCCcT9Q=;
 b=cyP8QVqREV9WJ4WjLxbNjiAZFoerRdSZ5UnU+qEPbbcEYGn7gbeIkPFikLInxIW2KC
 +U9FADBnkzFpP6WEoqHkGW/amBQ3/XGzC6b8c3iJU3Cl4wK8ZKWapKaOavb16s2WU/o0
 ujr2VtqIRFiNqIYfqgqZRmYiP65ICFUTAyfQz4oixeDt13kQL2AHuNT2oB2E3a9hhR0C
 7qZZos04agiO+s60gDzMeh0JsmoDOf4y93dUufDdxiCSM5eTGD+sJEi3a5lV95GMi5Fe
 9HvTf4jbOCeHY4lw2tIjJNVd1mFF5fUTMeEAOm5VXORwpFo22r1aBlfzT9qPIW3FWLoi
 FxoQ==
X-Gm-Message-State: ACrzQf1rgCMpaAvsiUfzVUhQWMC2ffAxBI7FGT6kXn/Z6FZzptGX38Mr
 nnX13M2dY9hlSYOJOBvaHtxmJeR6OMP4fA==
X-Google-Smtp-Source: AMsMyM75mWNCwH6xLqwFy6Q/h5SKfRXVt/szvyv+oC5xzV7T9TpQD6u0jw2wAsDUwP0ETMMBcacUKg==
X-Received: by 2002:a05:6a00:4214:b0:562:67d0:77e7 with SMTP id
 cd20-20020a056a00421400b0056267d077e7mr14789856pfb.62.1666038309877; 
 Mon, 17 Oct 2022 13:25:09 -0700 (PDT)
Received: from vmfolio.. (c-76-102-73-225.hsd1.ca.comcast.net. [76.102.73.225])
 by smtp.googlemail.com with ESMTPSA id
 pj12-20020a17090b4f4c00b00200b12f2bf5sm145037pjb.1.2022.10.17.13.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 13:25:09 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Oct 2022 13:24:44 -0700
Message-Id: <20221017202451.4951-17-vishal.moola@gmail.com>
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
 Content preview: Convert function to use folios throughout. This is in
 preparation
 for the removal of find_get_pages_range_tag(). Initially the function was
 checking if the previous page index is truly the previous page i.e. 1 index
 behind the current page. To convert to folios and maintain this check we
 need to make the check f [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.182 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.182 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1okWfi-0008SQ-U8
Subject: [f2fs-dev] [PATCH v3 16/23] f2fs: Convert f2fs_sync_meta_pages() to
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert function to use folios throughout. This is in preparation for the
removal of find_get_pages_range_tag().

Initially the function was checking if the previous page index is truly the
previous page i.e. 1 index behind the current page. To convert to folios and
maintain this check we need to make the check
folio->index != prev + folio_nr_pages(previous folio) since we don't know
how many pages are in a folio.

At index i == 0 the check is guaranteed to succeed, so to workaround indexing
bounds we can simply ignore the check for that specific index. This makes the
initial assignment of prev trivial, so I removed that as well.

Also modified a comment in commit_checkpoint for consistency.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/f2fs/checkpoint.c | 49 +++++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 0c82dae082aa..82eb26f471c5 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -390,59 +390,62 @@ long f2fs_sync_meta_pages(struct f2fs_sb_info *sbi, enum page_type type,
 {
 	struct address_space *mapping = META_MAPPING(sbi);
 	pgoff_t index = 0, prev = ULONG_MAX;
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	long nwritten = 0;
-	int nr_pages;
+	int nr_folios;
 	struct writeback_control wbc = {
 		.for_reclaim = 0,
 	};
 	struct blk_plug plug;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 
 	blk_start_plug(&plug);
 
-	while ((nr_pages = pagevec_lookup_tag(&pvec, mapping, &index,
-				PAGECACHE_TAG_DIRTY))) {
+	while ((nr_folios = filemap_get_folios_tag(mapping, &index,
+					(pgoff_t)-1,
+					PAGECACHE_TAG_DIRTY, &fbatch))) {
 		int i;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct folio *folio = fbatch.folios[i];
 
-			if (prev == ULONG_MAX)
-				prev = page->index - 1;
-			if (nr_to_write != LONG_MAX && page->index != prev + 1) {
-				pagevec_release(&pvec);
+			if (nr_to_write != LONG_MAX && i != 0 &&
+					folio->index != prev +
+					folio_nr_pages(fbatch.folios[i-1])) {
+				folio_batch_release(&fbatch);
 				goto stop;
 			}
 
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
 
-			f2fs_wait_on_page_writeback(page, META, true, true);
+			f2fs_wait_on_page_writeback(&folio->page, META,
+					true, true);
 
-			if (!clear_page_dirty_for_io(page))
+			if (!folio_clear_dirty_for_io(folio))
 				goto continue_unlock;
 
-			if (__f2fs_write_meta_page(page, &wbc, io_type)) {
-				unlock_page(page);
+			if (__f2fs_write_meta_page(&folio->page, &wbc,
+						io_type)) {
+				folio_unlock(folio);
 				break;
 			}
-			nwritten++;
-			prev = page->index;
+			nwritten += folio_nr_pages(folio);
+			prev = folio->index;
 			if (unlikely(nwritten >= nr_to_write))
 				break;
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 stop:
@@ -1398,7 +1401,7 @@ static void commit_checkpoint(struct f2fs_sb_info *sbi,
 	};
 
 	/*
-	 * pagevec_lookup_tag and lock_page again will take
+	 * filemap_get_folios_tag and lock_page again will take
 	 * some extra time. Therefore, f2fs_update_meta_pages and
 	 * f2fs_sync_meta_pages are combined in this function.
 	 */
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
