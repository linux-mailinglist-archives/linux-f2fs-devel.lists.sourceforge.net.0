Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E2465DE3A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 22:15:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pDB6X-0002Nk-VN;
	Wed, 04 Jan 2023 21:15:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1pDB6W-0002NO-Ui
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bHssniIq+RlTj6I0G4i7GbLR9EaGoRL5pu7+dnl0w2w=; b=EI7xWos+vGJy1tLShgLep71XoD
 HQB73cHoCAgPZsM+/pz8+/R05FqJ8lJ5stJZpnSmrtXxljFePdAFND9QuOHXzHVFGCrH1srvgamHC
 CVsENmfLbxaymmVnjWw0fl3PcHhPn6z565XDgRthatVGuya60TrvpJqZaDSDdH82bUs4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bHssniIq+RlTj6I0G4i7GbLR9EaGoRL5pu7+dnl0w2w=; b=T9FCLgYb6fMdqZi5Fv4IqGABma
 F8uePNEWu/D46b2FARGJihwMrp8R4fqBLqgLMyVMGgl6w5EYRGW6My8UwzqONmSTCMCeUwYkeQczF
 T0nPyyM4TYnoSXkhM205iXxJmKI5rKwIAIswHURvewj1/HMFgXuYz87I1v1/AbURaWTY=;
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pDB6S-0050xb-7b for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 21:15:20 +0000
Received: by mail-pl1-f169.google.com with SMTP id d15so37215193pls.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jan 2023 13:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bHssniIq+RlTj6I0G4i7GbLR9EaGoRL5pu7+dnl0w2w=;
 b=O/D+NyPTy4M1sTh+3k/lC1rj/VKJWtCGwMlhTfn6qpBhtlxCb9k3sWDk9Z0oOhWhza
 3YwunlQmpmQxHIwc3slP5cWFOfArgatFhNuDOerJW0qUBaI5Zgn5t2tO2YQmHBKWt0/g
 MFSh/uQIxzlLLmgNa+OoXc3BzfvnfBPdtpNgXKui16mDPVeraZQtRKVUTS73rT71TPkz
 aIA4qX4NfhLb32N2QF9lXy9drDX9/rkV28NsYpAoVy0G5yfIgIIv+sWh1wOSNzvEDIG6
 wJ4oTDHW5KSfgFq7up1/6mIHSjyF7qj/i6841phIxUGWM6AsJ76lWkCXX+vMLrxxAo9V
 fPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bHssniIq+RlTj6I0G4i7GbLR9EaGoRL5pu7+dnl0w2w=;
 b=vZcctrq6JZtqcWI5ir8l91XE35detLlGbNWGQbR9sjyTuDPedMhFupevRc8755gnUJ
 YOYlLD0gfW1vRkJQ+ri0lL1ejGy+xUKSaTU2bETlNbZOvyNQu8Ass9DEpiOkpAa1BRLg
 yfP9jBxQ4niFDKinEpqgpvDR5GNNjQ773aFq0OgDpJ8QoQivN/BMr/ZT4y7Yf9gCgGNC
 QQoh3XrEZyCwt14KbUzuZ8gd5MMXnbu9RnHoNBxkK8vaDUd8ImdPMJmhlIa5ROinN/RY
 3qNiJ8P219AOJmZADa1j1Lx+m1zG5Vsxm9sHMblkqeOKf0z+YURgqU58l+RY7GxbNb2P
 Adkw==
X-Gm-Message-State: AFqh2kosHCguE0tXQEG8QI5qu0Hod87kA9++aRZO/VXAtxK7ehIlaBOA
 ITLe771njGf9rdnCPi/Wz0M=
X-Google-Smtp-Source: AMrXdXvz9PRTiN1Iw35FsCYmgqPK+8WXm1LuX9COnFA/dLcxFRJCp85h7YOKjNSg0G/oIOwdsOogTA==
X-Received: by 2002:a17:90b:3793:b0:226:744:d46a with SMTP id
 mz19-20020a17090b379300b002260744d46amr31270463pjb.41.1672866910524; 
 Wed, 04 Jan 2023 13:15:10 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::a55d])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm6408pja.21.2023.01.04.13.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 13:15:10 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  4 Jan 2023 13:14:35 -0800
Message-Id: <20230104211448.4804-11-vishal.moola@gmail.com>
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
 Content preview: Converted the function to use folios throughout. This is in
 preparation for the removal of find_get_pages_range_tag(). Now supports large
 folios. This change removes 11 calls to compound_head(). Signed-off-by: Vishal
 Moola (Oracle) --- fs/ext4/inode.c | 65 ++++++++++++++++++++++++ 1 file
 changed, 32 insertions(+), 33 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.169 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.169 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pDB6S-0050xb-7b
Subject: [f2fs-dev] [PATCH v5 10/23] ext4: Convert
 mpage_prepare_extent_to_map() to use filemap_get_folios_tag()
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

Converted the function to use folios throughout. This is in preparation
for the removal of find_get_pages_range_tag(). Now supports large
folios. This change removes 11 calls to compound_head().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/ext4/inode.c | 65 ++++++++++++++++++++++++-------------------------
 1 file changed, 32 insertions(+), 33 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 9d9f414f99fe..fb6cd994e59a 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -2595,8 +2595,8 @@ static bool ext4_page_nomap_can_writeout(struct page *page)
 static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
 {
 	struct address_space *mapping = mpd->inode->i_mapping;
-	struct pagevec pvec;
-	unsigned int nr_pages;
+	struct folio_batch fbatch;
+	unsigned int nr_folios;
 	long left = mpd->wbc->nr_to_write;
 	pgoff_t index = mpd->first_page;
 	pgoff_t end = mpd->last_page;
@@ -2610,18 +2610,17 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
 		tag = PAGECACHE_TAG_TOWRITE;
 	else
 		tag = PAGECACHE_TAG_DIRTY;
-
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 	mpd->map.m_len = 0;
 	mpd->next_page = index;
 	while (index <= end) {
-		nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
-				tag);
-		if (nr_pages == 0)
+		nr_folios = filemap_get_folios_tag(mapping, &index, end,
+				tag, &fbatch);
+		if (nr_folios == 0)
 			break;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct folio *folio = fbatch.folios[i];
 
 			/*
 			 * Accumulated enough dirty pages? This doesn't apply
@@ -2635,10 +2634,10 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
 				goto out;
 
 			/* If we can't merge this page, we are done. */
-			if (mpd->map.m_len > 0 && mpd->next_page != page->index)
+			if (mpd->map.m_len > 0 && mpd->next_page != folio->index)
 				goto out;
 
-			lock_page(page);
+			folio_lock(folio);
 			/*
 			 * If the page is no longer dirty, or its mapping no
 			 * longer corresponds to inode we are writing (which
@@ -2646,16 +2645,16 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
 			 * page is already under writeback and we are not doing
 			 * a data integrity writeback, skip the page
 			 */
-			if (!PageDirty(page) ||
-			    (PageWriteback(page) &&
+			if (!folio_test_dirty(folio) ||
+			    (folio_test_writeback(folio) &&
 			     (mpd->wbc->sync_mode == WB_SYNC_NONE)) ||
-			    unlikely(page->mapping != mapping)) {
-				unlock_page(page);
+			    unlikely(folio->mapping != mapping)) {
+				folio_unlock(folio);
 				continue;
 			}
 
-			wait_on_page_writeback(page);
-			BUG_ON(PageWriteback(page));
+			folio_wait_writeback(folio);
+			BUG_ON(folio_test_writeback(folio));
 
 			/*
 			 * Should never happen but for buggy code in
@@ -2666,49 +2665,49 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
 			 *
 			 * [1] https://lore.kernel.org/linux-mm/20180103100430.GE4911@quack2.suse.cz
 			 */
-			if (!page_has_buffers(page)) {
-				ext4_warning_inode(mpd->inode, "page %lu does not have buffers attached", page->index);
-				ClearPageDirty(page);
-				unlock_page(page);
+			if (!folio_buffers(folio)) {
+				ext4_warning_inode(mpd->inode, "page %lu does not have buffers attached", folio->index);
+				folio_clear_dirty(folio);
+				folio_unlock(folio);
 				continue;
 			}
 
 			if (mpd->map.m_len == 0)
-				mpd->first_page = page->index;
-			mpd->next_page = page->index + 1;
+				mpd->first_page = folio->index;
+			mpd->next_page = folio->index + folio_nr_pages(folio);
 			/*
 			 * Writeout for transaction commit where we cannot
 			 * modify metadata is simple. Just submit the page.
 			 */
 			if (!mpd->can_map) {
-				if (ext4_page_nomap_can_writeout(page)) {
-					err = mpage_submit_page(mpd, page);
+				if (ext4_page_nomap_can_writeout(&folio->page)) {
+					err = mpage_submit_page(mpd, &folio->page);
 					if (err < 0)
 						goto out;
 				} else {
-					unlock_page(page);
-					mpd->first_page++;
+					folio_unlock(folio);
+					mpd->first_page += folio_nr_pages(folio);
 				}
 			} else {
 				/* Add all dirty buffers to mpd */
-				lblk = ((ext4_lblk_t)page->index) <<
+				lblk = ((ext4_lblk_t)folio->index) <<
 					(PAGE_SHIFT - blkbits);
-				head = page_buffers(page);
+				head = folio_buffers(folio);
 				err = mpage_process_page_bufs(mpd, head, head,
-							      lblk);
+						lblk);
 				if (err <= 0)
 					goto out;
 				err = 0;
 			}
-			left--;
+			left -= folio_nr_pages(folio);
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 	mpd->scanned_until_end = 1;
 	return 0;
 out:
-	pagevec_release(&pvec);
+	folio_batch_release(&fbatch);
 	return err;
 }
 
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
