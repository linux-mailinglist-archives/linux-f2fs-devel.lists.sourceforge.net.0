Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8B8616795
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Nov 2022 17:11:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqGLI-0007eb-Hb;
	Wed, 02 Nov 2022 16:11:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oqGL0-0007cS-Mg
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 16:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gop7swXAAJ8sgYyasjeCim+2hgvZWCX0xP2gQPQAoN4=; b=JtWJTlwLhwVPTl+fhZJUkMOrdJ
 QkMdZYwmc0KrzNtrVrFNJx464QgkO4bRqS5yflPQem2CEp5WH8yz4DAztclG05TOwnUOLaKQXrVSC
 KOGZCrPXwHlVqreSx5fVopBhecfI8Ysec93v136KAAiHc5D202oxLaJQv2FRsabjhs9c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gop7swXAAJ8sgYyasjeCim+2hgvZWCX0xP2gQPQAoN4=; b=CXbH5M1DuQ9LQ14QyP3clwM18R
 PpEyjhBbNmyZZgbTt60y6y53nPAstiht9TWQVBQ4ZYQ0purpvvbMNXAjCyOlOUlmR7KfZ29mheqq7
 4/QmOeOYXgLFFQT/NkWw2RGBOSSJY1T65q95C0JVs6wn/LE+RdpYFWJtqXD/NRuO8nkw=;
Received: from mail-pj1-f41.google.com ([209.85.216.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oqGKz-009aA8-Sf for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 16:11:34 +0000
Received: by mail-pj1-f41.google.com with SMTP id
 p15-20020a17090a348f00b002141615576dso2530837pjb.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Nov 2022 09:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gop7swXAAJ8sgYyasjeCim+2hgvZWCX0xP2gQPQAoN4=;
 b=CYG7zu+QxCPI4y/4OmUZ6lM2JjETOTsDWuWnK+gbIF/bo8LwhHwDiP6kyfIdUbpyX8
 ab9PRWMdaUYGWhq7nY4kTV0jG0utHkrf1BbP7dErm+mKDb0+A4TEESQqpmkxzFQT+DtN
 JlhOn+4S24OwuKkrVD0sPxqkQVGmn/run6/9tIdNBUZ2ufh5mY9r9vOsWyRs6O01IxY5
 jAHXvzsRSva4MguNXkmSvlrLJxwuOGefxKTQZM10Odu+C4tDWapwK5UUuivkGmwCYD8n
 SKYn5/mySUl+qAWnJeuU5HhpDCL1/6/iG5Yn4Ie4dHT4sJqWWgvPDGxn9z17ZG2JtxX9
 QX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gop7swXAAJ8sgYyasjeCim+2hgvZWCX0xP2gQPQAoN4=;
 b=Hdrlbr88oma71AO9H2YswmAcsed6sVDYkcKBwnb2ESdQLRLDWc4W6+DexpkQJ9lTEW
 V5LWZ0kA3Gb8Olvi9L88J1vbxY+LUhcBHWhKPETsTMmRpg8XXDcGCjE7FUAvMTMsVjci
 QYxGNeu9F1wnlvh3CswJqUUlyKNXaWeiF4+udhheAih0iBZWRnM3g2PqsVh7/agFX28w
 cqV+5syTbOArXVY0LghC5QTp+BwQytdrWyM6pc5h7zoi30GWy3FUGHTID5yrtVls8byt
 uY/kKzoWTvaN7kKEO30sfdW050M/FfJrXkq5CrmcuTvGO6K6CgbiyiTLXNLbfnQpss1H
 CbRQ==
X-Gm-Message-State: ACrzQf1qZXPkwWrm1UG0uH4LFToU2F+cpDLhfWK7655JratpUfG4ma7X
 vi1ciKEtNMg6cO8SgLWtShQ=
X-Google-Smtp-Source: AMsMyM6I1DPKwfoeXRZ0zpmiqcREQFJWEBekvCZledBpKCLwMg84o0uKiw8tB7975QpgvsZe2RH2ig==
X-Received: by 2002:a17:90a:b10b:b0:212:fbc3:e623 with SMTP id
 z11-20020a17090ab10b00b00212fbc3e623mr26873993pjq.5.1667405488224; 
 Wed, 02 Nov 2022 09:11:28 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::8080])
 by smtp.googlemail.com with ESMTPSA id
 ms4-20020a17090b234400b00210c84b8ae5sm1632101pjb.35.2022.11.02.09.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:27 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  2 Nov 2022 09:10:22 -0700
Message-Id: <20221102161031.5820-15-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102161031.5820-1-vishal.moola@gmail.com>
References: <20221102161031.5820-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Converted the function to use a folio_batch instead of
 pagevec.
 This is in preparation for the removal of find_get_pages_range_tag(). This
 change removes 7 calls to compound_head(). Also modified
 f2fs_all_cluster_page_ready
 to take in a folio_batch instead of pagevec. This does NOT support large
 folios. The function currently only utilizes folios of size 1 so this
 shouldn't cause [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.41 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.41 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oqGKz-009aA8-Sf
Subject: [f2fs-dev] [PATCH v4 14/23] f2fs: Convert f2fs_write_cache_pages()
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

Converted the function to use a folio_batch instead of pagevec. This is in
preparation for the removal of find_get_pages_range_tag(). This change
removes 7 calls to compound_head().

Also modified f2fs_all_cluster_page_ready to take in a folio_batch instead
of pagevec. This does NOT support large folios. The function currently
only utilizes folios of size 1 so this shouldn't cause any issues right
now.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 fs/f2fs/compress.c | 13 +++++----
 fs/f2fs/data.c     | 69 +++++++++++++++++++++++++---------------------
 fs/f2fs/f2fs.h     |  5 ++--
 3 files changed, 47 insertions(+), 40 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index d315c2de136f..7af6c923e0aa 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -842,10 +842,11 @@ bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index)
 	return is_page_in_cluster(cc, index);
 }
 
-bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct page **pages,
-				int index, int nr_pages, bool uptodate)
+bool f2fs_all_cluster_page_ready(struct compress_ctx *cc,
+				struct folio_batch *fbatch,
+				int index, int nr_folios, bool uptodate)
 {
-	unsigned long pgidx = pages[index]->index;
+	unsigned long pgidx = fbatch->folios[index]->index;
 	int i = uptodate ? 0 : 1;
 
 	/*
@@ -855,13 +856,13 @@ bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct page **pages,
 	if (uptodate && (pgidx % cc->cluster_size))
 		return false;
 
-	if (nr_pages - index < cc->cluster_size)
+	if (nr_folios - index < cc->cluster_size)
 		return false;
 
 	for (; i < cc->cluster_size; i++) {
-		if (pages[index + i]->index != pgidx + i)
+		if (fbatch->folios[index + i]->index != pgidx + i)
 			return false;
-		if (uptodate && !PageUptodate(pages[index + i]))
+		if (uptodate && !folio_test_uptodate(fbatch->folios[index + i]))
 			return false;
 	}
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a71e818cd67b..7511578b73c3 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2938,7 +2938,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 {
 	int ret = 0;
 	int done = 0, retry = 0;
-	struct page *pages[F2FS_ONSTACK_PAGES];
+	struct folio_batch fbatch;
 	struct f2fs_sb_info *sbi = F2FS_M_SB(mapping);
 	struct bio *bio = NULL;
 	sector_t last_block;
@@ -2959,7 +2959,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 		.private = NULL,
 	};
 #endif
-	int nr_pages;
+	int nr_folios;
 	pgoff_t index;
 	pgoff_t end;		/* Inclusive */
 	pgoff_t done_index;
@@ -2969,6 +2969,8 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	int submitted = 0;
 	int i;
 
+	folio_batch_init(&fbatch);
+
 	if (get_dirty_pages(mapping->host) <=
 				SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
 		set_inode_flag(mapping->host, FI_HOT_DATA);
@@ -2994,13 +2996,13 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 		tag_pages_for_writeback(mapping, index, end);
 	done_index = index;
 	while (!done && !retry && (index <= end)) {
-		nr_pages = find_get_pages_range_tag(mapping, &index, end,
-				tag, F2FS_ONSTACK_PAGES, pages);
-		if (nr_pages == 0)
+		nr_folios = filemap_get_folios_tag(mapping, &index, end,
+				tag, &fbatch);
+		if (nr_folios == 0)
 			break;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct folio *folio = fbatch.folios[i];
 			bool need_readd;
 readd:
 			need_readd = false;
@@ -3017,7 +3019,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 				}
 
 				if (!f2fs_cluster_can_merge_page(&cc,
-								page->index)) {
+								folio->index)) {
 					ret = f2fs_write_multi_pages(&cc,
 						&submitted, wbc, io_type);
 					if (!ret)
@@ -3026,27 +3028,28 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 				}
 
 				if (unlikely(f2fs_cp_error(sbi)))
-					goto lock_page;
+					goto lock_folio;
 
 				if (!f2fs_cluster_is_empty(&cc))
-					goto lock_page;
+					goto lock_folio;
 
 				if (f2fs_all_cluster_page_ready(&cc,
-					pages, i, nr_pages, true))
-					goto lock_page;
+					&fbatch, i, nr_folios, true))
+					goto lock_folio;
 
 				ret2 = f2fs_prepare_compress_overwrite(
 							inode, &pagep,
-							page->index, &fsdata);
+							folio->index, &fsdata);
 				if (ret2 < 0) {
 					ret = ret2;
 					done = 1;
 					break;
 				} else if (ret2 &&
 					(!f2fs_compress_write_end(inode,
-						fsdata, page->index, 1) ||
+						fsdata, folio->index, 1) ||
 					 !f2fs_all_cluster_page_ready(&cc,
-						pages, i, nr_pages, false))) {
+						&fbatch, i, nr_folios,
+						false))) {
 					retry = 1;
 					break;
 				}
@@ -3059,46 +3062,47 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 				break;
 			}
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-lock_page:
+lock_folio:
 #endif
-			done_index = page->index;
+			done_index = folio->index;
 retry_write:
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
 
-			if (PageWriteback(page)) {
+			if (folio_test_writeback(folio)) {
 				if (wbc->sync_mode != WB_SYNC_NONE)
-					f2fs_wait_on_page_writeback(page,
+					f2fs_wait_on_page_writeback(
+							&folio->page,
 							DATA, true, true);
 				else
 					goto continue_unlock;
 			}
 
-			if (!clear_page_dirty_for_io(page))
+			if (!folio_clear_dirty_for_io(folio))
 				goto continue_unlock;
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 			if (f2fs_compressed_file(inode)) {
-				get_page(page);
-				f2fs_compress_ctx_add_page(&cc, page);
+				folio_get(folio);
+				f2fs_compress_ctx_add_page(&cc, &folio->page);
 				continue;
 			}
 #endif
-			ret = f2fs_write_single_data_page(page, &submitted,
-					&bio, &last_block, wbc, io_type,
-					0, true);
+			ret = f2fs_write_single_data_page(&folio->page,
+					&submitted, &bio, &last_block,
+					wbc, io_type, 0, true);
 			if (ret == AOP_WRITEPAGE_ACTIVATE)
-				unlock_page(page);
+				folio_unlock(folio);
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 result:
 #endif
@@ -3122,7 +3126,8 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 					}
 					goto next;
 				}
-				done_index = page->index + 1;
+				done_index = folio->index +
+					folio_nr_pages(folio);
 				done = 1;
 				break;
 			}
@@ -3136,7 +3141,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 			if (need_readd)
 				goto readd;
 		}
-		release_pages(pages, nr_pages);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 #ifdef CONFIG_F2FS_FS_COMPRESSION
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e6355a5683b7..d7bfb88fa341 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4226,8 +4226,9 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
 				block_t blkaddr, bool in_task);
 bool f2fs_cluster_is_empty(struct compress_ctx *cc);
 bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
-bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct page **pages,
-				int index, int nr_pages, bool uptodate);
+bool f2fs_all_cluster_page_ready(struct compress_ctx *cc,
+		struct folio_batch *fbatch, int index, int nr_folios,
+		bool uptodate);
 bool f2fs_sanity_check_cluster(struct dnode_of_data *dn);
 void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page);
 int f2fs_write_multi_pages(struct compress_ctx *cc,
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
