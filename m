Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 205485B605E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Sep 2022 20:26:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oXo87-0000qy-0I;
	Mon, 12 Sep 2022 18:25:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oXo84-0000qU-RH
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 18:25:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vLd5VxDvs/Hufc5GkPRPWmylC7gs4hvMBc2dqzKoD6A=; b=E/rsckV+5zr7AE/MNcuGE5PxPl
 C7tGyQ6Qg6W2MAARK0W62YY2aeIdNS3E/dwoyjP3vqHaGM8ooHwh0VeoHh4XDn6Jo75e43+OmnYDe
 1EDieVQiUpKAhyInV/MQVorKu5w+hmYgItnnk8Am6XPZOWh+KSHUaJRniH1h9Q2fwzgg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vLd5VxDvs/Hufc5GkPRPWmylC7gs4hvMBc2dqzKoD6A=; b=Dl+MqNgJE/ufQCxkofX5SSfWCg
 CpW0sd72KLRpgd0plP/s7+F/c3PH3Kmwkxy8P+3yRc764hAEvhxADuXhUzUCIE6pHpx096wtNvOFL
 kVastAsDlY9q9EuXUS+2w1h3FOZMJWD6hTXKFSgzSpzGMwelncFmrKbmhzRse8g/GAt4=;
Received: from mail-pl1-f172.google.com ([209.85.214.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oXo81-0065Rz-EB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 18:25:56 +0000
Received: by mail-pl1-f172.google.com with SMTP id d12so9375805plr.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Sep 2022 11:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=vLd5VxDvs/Hufc5GkPRPWmylC7gs4hvMBc2dqzKoD6A=;
 b=WNJCwZID7CkpmvEX4T+7USbTmGXoHffHzo+rEl63koqVWcf7eY6LSJiv6m4DzXWKju
 Q3VVtg18aweL3nEBz278LZM+K1LQ0FZEFIDzjLvQKFb7FguYNR1WqVRGMFm6PTskTT9X
 cEjNqo5gk/BCu4LgGzkBaBxJzZWQTOfSyfBANKkpxFGesnbd50kz8TnxVCK4uS9iX0Ek
 tBosUTXNGu8omozjBO0YgXnWIyOBIWToBExHSD2T0R/ap4VScRAArQh3ERiIiH2Hp0pj
 JcxSsb6b0w+coJV60XwT9oKrxLVB5YeMg+hJr0EV1w0uFJzfQneIGM4uv/EUr07UOjux
 aRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=vLd5VxDvs/Hufc5GkPRPWmylC7gs4hvMBc2dqzKoD6A=;
 b=A7Gh21GDRNQ2tgj5LcDBoMg/QUlHLuq0JwiRzkpI5xDj7u7Toj9ff2Kj7AuOY2C3WR
 l3lYvux55oi4Nj1HGWmGSlJFHD975zsNz/hExiz1cI06NUUEqJ3XPV/dymZ0VhLNVOVN
 8uJBXSp0jprD7wO66Z396z30+PxW0mozu8h/oB8JaAmsI7T+E6DGPFMoHdRDJyC+Cdh9
 14FRy1zr2H1G3qBbh6Ydr86bvs0En0BeTnsdYhF7n2WYc60nN7cUn/c6WYlG4KsZ7c3t
 y2M8QvSD9nkSVj70G3sXcpO9aWoiObksW5th7/7xcoP7uzx/0GrLavZJy7hnOS4mDzMx
 SH0Q==
X-Gm-Message-State: ACgBeo3elaOe2cCFSlhvCn2C1TfUbGqxR6XLK3yqwGyRGWRcWP1OZ43n
 DH3q0AQAJL1oe8W4fAkfruA=
X-Google-Smtp-Source: AA6agR7iDlj9L6+RcerHeiF3O8KlHHxg60Q8EuLWPkI0PI6FFqq4ogQKOParnfoCjUzfF4ngvFwvrg==
X-Received: by 2002:a17:90a:31c5:b0:200:a749:4857 with SMTP id
 j5-20020a17090a31c500b00200a7494857mr26059975pjf.148.1663007147823; 
 Mon, 12 Sep 2022 11:25:47 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 x127-20020a626385000000b0053b2681b0e0sm5916894pfb.39.2022.09.12.11.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 11:25:47 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 12 Sep 2022 11:22:17 -0700
Message-Id: <20220912182224.514561-17-vishal.moola@gmail.com>
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
 Content preview:  Convert function to use folios. This is in preparation for
 the removal of find_get_pages_range_tag(). Initially the function was checking
 if the previous page index is truly the previous page i.e. 1 index behind
 the current page. To convert to folios and maintain this check we need to
 make the check f [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.172 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oXo81-0065Rz-EB
Subject: [f2fs-dev] [PATCH v2 16/23] f2fs: Convert f2fs_sync_meta_pages() to
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

Convert function to use folios. This is in preparation for the removal
of find_get_pages_range_tag().

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
index 8259e0fa97e1..9f6694f7d723 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -377,59 +377,62 @@ long f2fs_sync_meta_pages(struct f2fs_sb_info *sbi, enum page_type type,
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
@@ -1381,7 +1384,7 @@ static void commit_checkpoint(struct f2fs_sb_info *sbi,
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
