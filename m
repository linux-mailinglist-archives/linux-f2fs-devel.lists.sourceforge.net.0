Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE705B602B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Sep 2022 20:25:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oXo7Z-0002l8-Ja;
	Mon, 12 Sep 2022 18:25:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oXo7X-0002ks-76
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 18:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NOXLTO79qhrJOlYyxIYm/ZYJYsfR2nEvKsGqG4l5Qvs=; b=Zlr1U/OIyIvM1WzVRvm9+JuqKc
 xJsrsnyEJbP90fuBzK4Y/XAyxbsvYm/TGlZDGtHCvDVD4JczRkZ+SxCG6/T9EQ3uiFns1XVCktsKW
 9i6rQkaNaEW1P2q0l+7nM9FtxX7s2nsoxVM8H4hrMbIIY26GDAJ+j2409DUkb95UOSww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NOXLTO79qhrJOlYyxIYm/ZYJYsfR2nEvKsGqG4l5Qvs=; b=h2sBEOZ3rGuOM3VYLCpqAx0nYc
 AEZq4B2MviAkO1bOFAK2/ORxw/4618Wd3RwbBOdiiCHCZP+ENhPgpAW7nmdLfLS5j1DoqgQ9ICg3E
 dpz0d0RbczA2u9YlrBFM5toXAHTSs+xFxIk7aO4thAnb/PhkjerO30CgojmLAPg/y24A=;
Received: from mail-pj1-f41.google.com ([209.85.216.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oXo7j-0003lv-5E for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 18:25:35 +0000
Received: by mail-pj1-f41.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so9022255pjl.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Sep 2022 11:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=NOXLTO79qhrJOlYyxIYm/ZYJYsfR2nEvKsGqG4l5Qvs=;
 b=TKoON7XEdQbhdR1GUvT7lYy6ZpS3TOeLzaCcico3JqmJaC0jaaAcG4xgkX47FR/Gcq
 XX40MpBHXREv/DQAUVdcuy93ibdaDCJvNauhPyO5v0OFR1W5dryjz/r2uU4oH4eQOlIj
 DLmy9vSUBGJRqrhqDMNRt3SI5RNKYa322JwA43pIIVOr2KRi7a1FA6GeJusHnTgixyon
 8aEP3J03oVtav/FPktLDx7TNC4fjhGerRxvd2zpzNics/uVkDgUMJPBLQksqdZv3P2FA
 jwPzYfYKsGPO55KpnR7NKJCCo8LoEWfzOB64KGxDZ/JV7nWmwj/oWo2uRPchvXBY/wva
 DA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NOXLTO79qhrJOlYyxIYm/ZYJYsfR2nEvKsGqG4l5Qvs=;
 b=Y3vARGNwhyrUmlRcmRgxRcsQV8A7qnvWvVPh/9F9klLfHl3oUphxvJDW04ttrcG5fh
 2zt4pNAC8rYXJXd0pJIXr7Z55/JvaLuB06yiNwSr3NS9C9UWtYdylrZGScpe02447smI
 e1rmRXLuQprdIX7FZWBebKzPIuz0b5hzu6ZMdA9pNqLoj8v1J1AfoPnEiMIBxTJUfBpk
 lX+iWUysAKGzjs7CWEiFNFfUEqO6dgdTaUCSqU+FjHhWauHVxUFhG32Fp07m5nf6By36
 32pNDm7YX3Y2KvYUdzVPmWcjBgMm2kBj7EdX4ra3mAz3TRa9kBm79wLBTMzWEM20HVZh
 w55Q==
X-Gm-Message-State: ACgBeo30SkB/2TFSfTV74aeIMSh9UWsScO3ZyeJisvAlrs6ss5KQUKpL
 lR8Tg+gOK2LvLISlODYLqX0=
X-Google-Smtp-Source: AA6agR7oBA84FcFLVwiJlcDGKQJ0PL80mhSv7YLC/veOnvMzQRjCTeiSFvyu0+A81Qv+5ycbauOlgw==
X-Received: by 2002:a17:902:d2d0:b0:178:329d:a5ed with SMTP id
 n16-20020a170902d2d000b00178329da5edmr6167935plc.142.1663007129548; 
 Mon, 12 Sep 2022 11:25:29 -0700 (PDT)
Received: from vmfolio.. (c-73-189-111-8.hsd1.ca.comcast.net. [73.189.111.8])
 by smtp.googlemail.com with ESMTPSA id
 x127-20020a626385000000b0053b2681b0e0sm5916894pfb.39.2022.09.12.11.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 11:25:29 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 12 Sep 2022 11:22:06 -0700
Message-Id: <20220912182224.514561-6-vishal.moola@gmail.com>
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
 Content preview: Convert to use folios throughout. This function is in
 preparation
 to remove find_get_pages_range_tag(). Also modified this function to write
 the whole batch one at a time, rather than calling for a new set every single
 write. Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.41 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.41 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oXo7j-0003lv-5E
Subject: [f2fs-dev] [PATCH v2 05/23] afs: Convert afs_writepages_region() to
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

Convert to use folios throughout. This function is in preparation to
remove find_get_pages_range_tag().

Also modified this function to write the whole batch one at a time,
rather than calling for a new set every single write.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/afs/write.c | 114 +++++++++++++++++++++++++------------------------
 1 file changed, 59 insertions(+), 55 deletions(-)

diff --git a/fs/afs/write.c b/fs/afs/write.c
index 9ebdd36eaf2f..c17dbd82a38c 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -699,82 +699,86 @@ static int afs_writepages_region(struct address_space *mapping,
 				 loff_t start, loff_t end, loff_t *_next)
 {
 	struct folio *folio;
-	struct page *head_page;
+	struct folio_batch fbatch;
 	ssize_t ret;
+	unsigned int i;
 	int n, skips = 0;
 
 	_enter("%llx,%llx,", start, end);
+	folio_batch_init(&fbatch);
 
 	do {
 		pgoff_t index = start / PAGE_SIZE;
 
-		n = find_get_pages_range_tag(mapping, &index, end / PAGE_SIZE,
-					     PAGECACHE_TAG_DIRTY, 1, &head_page);
+		n = filemap_get_folios_tag(mapping, &index, end / PAGE_SIZE,
+					PAGECACHE_TAG_DIRTY, &fbatch);
+
 		if (!n)
 			break;
+		for (i = 0; i < n; i++) {
+			folio = fbatch.folios[i];
+			start = folio_pos(folio); /* May regress with THPs */
 
-		folio = page_folio(head_page);
-		start = folio_pos(folio); /* May regress with THPs */
-
-		_debug("wback %lx", folio_index(folio));
+			_debug("wback %lx", folio_index(folio));
 
-		/* At this point we hold neither the i_pages lock nor the
-		 * page lock: the page may be truncated or invalidated
-		 * (changing page->mapping to NULL), or even swizzled
-		 * back from swapper_space to tmpfs file mapping
-		 */
-		if (wbc->sync_mode != WB_SYNC_NONE) {
-			ret = folio_lock_killable(folio);
-			if (ret < 0) {
-				folio_put(folio);
-				return ret;
-			}
-		} else {
-			if (!folio_trylock(folio)) {
-				folio_put(folio);
-				return 0;
+			/* At this point we hold neither the i_pages lock nor the
+			 * page lock: the page may be truncated or invalidated
+			 * (changing page->mapping to NULL), or even swizzled
+			 * back from swapper_space to tmpfs file mapping
+			 */
+			if (wbc->sync_mode != WB_SYNC_NONE) {
+				ret = folio_lock_killable(folio);
+				if (ret < 0) {
+					folio_batch_release(&fbatch);
+					return ret;
+				}
+			} else {
+				if (!folio_trylock(folio))
+					continue;
 			}
-		}
 
-		if (folio_mapping(folio) != mapping ||
-		    !folio_test_dirty(folio)) {
-			start += folio_size(folio);
-			folio_unlock(folio);
-			folio_put(folio);
-			continue;
-		}
+			if (folio->mapping != mapping ||
+			    !folio_test_dirty(folio)) {
+				start += folio_size(folio);
+				folio_unlock(folio);
+				continue;
+			}
 
-		if (folio_test_writeback(folio) ||
-		    folio_test_fscache(folio)) {
-			folio_unlock(folio);
-			if (wbc->sync_mode != WB_SYNC_NONE) {
-				folio_wait_writeback(folio);
+			if (folio_test_writeback(folio) ||
+			    folio_test_fscache(folio)) {
+				folio_unlock(folio);
+				if (wbc->sync_mode != WB_SYNC_NONE) {
+					folio_wait_writeback(folio);
 #ifdef CONFIG_AFS_FSCACHE
-				folio_wait_fscache(folio);
+					folio_wait_fscache(folio);
 #endif
-			} else {
-				start += folio_size(folio);
+				} else {
+					start += folio_size(folio);
+				}
+				if (wbc->sync_mode == WB_SYNC_NONE) {
+					if (skips >= 5 || need_resched()) {
+						*_next = start;
+						_leave(" = 0 [%llx]", *_next);
+						return 0;
+					}
+					skips++;
+				}
+				continue;
 			}
-			folio_put(folio);
-			if (wbc->sync_mode == WB_SYNC_NONE) {
-				if (skips >= 5 || need_resched())
-					break;
-				skips++;
+
+			if (!folio_clear_dirty_for_io(folio))
+				BUG();
+			ret = afs_write_back_from_locked_folio(mapping, wbc,
+					folio, start, end);
+			if (ret < 0) {
+				_leave(" = %zd", ret);
+				folio_batch_release(&fbatch);
+				return ret;
 			}
-			continue;
-		}
 
-		if (!folio_clear_dirty_for_io(folio))
-			BUG();
-		ret = afs_write_back_from_locked_folio(mapping, wbc, folio, start, end);
-		folio_put(folio);
-		if (ret < 0) {
-			_leave(" = %zd", ret);
-			return ret;
+			start += ret;
 		}
-
-		start += ret;
-
+		folio_batch_release(&fbatch);
 		cond_resched();
 	} while (wbc->nr_to_write > 0);
 
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
