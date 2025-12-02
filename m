Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80176C99C0F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 02 Dec 2025 02:32:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrieRhNj0QdWIyHm2UxjMkzkCyvPu1AY38HpM4vuHok=; b=fHH90s+9BWloEMjJUU7IiMYOR7
	4lvsmQYGSuSgw8fCuvAkMZs0/VlsB6Yxkc6P0a6HkMTzQUji6Ao/IRIVZ17BNGkb+byrRXvhaAkyV
	JrVVAEF8da6vdY4JQiDTqjQ3JmVN+R9BHCA0kj1Fsw6KqMKLk6HGspxOdHXYTOc8/2AA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQFFo-0004gs-8b;
	Tue, 02 Dec 2025 01:32:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vQFFm-0004gj-LO
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 01:32:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V8E4pp1IsjSSPKJuplYD2tkMc9UabvLY5N6Rx9zkfNQ=; b=DKaySH5RB9jD04PK+V3TM/XJRY
 O1gn2o2taKa4eCy3Qa3rfGOHYBEFLxTaXt26JPRHGgFwdTpru3pcfGSB4Fe0YNd7IyJzmlAVuJtg2
 k4Ku4SlN6Nl57GxOZVEVcaK2fAyiWO+TCjjQogmG7IeEk0pXc+HmnLhPicTEArwxOQC0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V8E4pp1IsjSSPKJuplYD2tkMc9UabvLY5N6Rx9zkfNQ=; b=D7rbSpCVxSPVfhifBKOpZaFT2y
 VpQwRZTMua98x6MYZEROc84VOk5wsaDsFL/KMC+S/91gxLUNToh5+eAqqfUKEhljgVVzwpj4qrlb3
 aeb4qbne8swTqNYase+GgB+FA8lOupEMYiBnbKQCLEA8WnipcGEF26BpHqIA/noD17QU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQFFl-0006G1-Iq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 01:32:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EED546018E;
 Tue,  2 Dec 2025 01:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95EA2C19421;
 Tue,  2 Dec 2025 01:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764639138;
 bh=maaJ53Q77+6gbWSVaFF16EdbEzSFEsMDPs9d8wMR348=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TfesHhulAARCaWEEvqR2qBeDi+/eGQMLEd12rY/IidihHRipCxAdGhr43Es2/8WMw
 IdLD3ArmUQUi/qIeiGFEphbbmsunT7Y0hyTuZ7i66G0BcXblNmbXrZcPMAPot5l8YM
 bN0cKs9rturzc9J48Tw3LU+vlHpbMe1EAEKnQBYdqripsG7b/4Q0qEqkRJakIG9X5V
 T0NbjEFNCj50PGkZAa+vYW6AUiaANPkyAA5+d2l53doAEUrhW4DtNHoWpDQN7fo3LI
 Gtgid7jx7APSgCErY9GZto9uE0epdw+zOOQVHPnggR6ECI2xvM6yxhrOGKhVeEKFj+
 F4H3rf91kwZbA==
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
Date: Tue,  2 Dec 2025 01:30:13 +0000
Message-ID: <20251202013212.964298-4-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
In-Reply-To: <20251202013212.964298-1-jaegeuk@kernel.org>
References: <20251202013212.964298-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch assigns the max folio order for readahead. After
 applying this patch, it starts with high-order page allocation successfully
 as shown in the below traces. Before: f2fs_fadvise: dev = (252,16), ino =
 14, i_size = 4294967296 offset:0, len:536870912, advise:3 page_cache_sync_ra:
 dev=252:16 ino=e index=0 req_count=2048 order=0 size=0 async_size=0 ra_pages=2
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQFFl-0006G1-Iq
Subject: [f2fs-dev] [PATCH 3/3] mm/readahead: try to allocate high order
 pages for FADVISE_FAV_WILLNEED
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch assigns the max folio order for readahead. After applying this patch,
it starts with high-order page allocation successfully as shown in the below
traces.

Before:
 f2fs_fadvise: dev = (252,16), ino = 14, i_size = 4294967296 offset:0, len:536870912, advise:3
 page_cache_sync_ra: dev=252:16 ino=e index=0 req_count=2048 order=0 size=0 async_size=0 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=0 order=0 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=2048 req_count=2048 order=0 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_unbounded: dev=252:16 ino=e index=2048 nr_to_read=2048 lookahead_size=0
 page_cache_sync_ra: dev=252:16 ino=e index=4096 req_count=2048 order=0 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_unbounded: dev=252:16 ino=e index=4096 nr_to_read=2048 lookahead_size=0
 page_cache_sync_ra: dev=252:16 ino=e index=6144 req_count=2048 order=0 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_unbounded: dev=252:16 ino=e index=6144 nr_to_read=2048 lookahead_size=0
...
 page_cache_sync_ra: dev=252:16 ino=e index=129024 req_count=2048 order=0 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_unbounded: dev=252:16 ino=e index=129024 nr_to_read=2048 lookahead_size=0

After:
 f2fs_fadvise: dev = (252,16), ino = 14, i_size = 4294967296 offset:0, len:536870912, advise:3
 page_cache_sync_ra: dev=252:16 ino=e index=0 req_count=2048 order=0 size=0 async_size=0 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=0 order=9 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=2048 req_count=2048 order=9 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=2048 order=9 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=4096 req_count=2048 order=9 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=4096 order=9 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=6144 req_count=2048 order=9 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=6144 order=9 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=8192 req_count=2048 order=9 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
...
 page_cache_sync_ra: dev=252:16 ino=e index=129024 req_count=2048 order=9 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=129024 order=9 size=2048 async_size=1024 ra_pages=2048

Cc: linux-mm@kvack.org
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 mm/readahead.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 54c78f8276fe..cfc63f7d5e81 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -593,7 +593,8 @@ void page_cache_sync_ra(struct readahead_control *ractl,
 	 * trivial case: (index - prev_index) == 1
 	 * unaligned reads: (index - prev_index) == 0
 	 */
-	if (!index || req_count > max_pages || index - prev_index <= 1UL) {
+	if (!index || req_count > max_pages || index - prev_index <= 1UL ||
+	    mapping_large_folio_support(ractl->mapping)) {
 		ra->start = index;
 		ra->size = get_init_ra_size(req_count, max_pages);
 		ra->async_size = ra->size > req_count ? ra->size - req_count :
@@ -627,7 +628,7 @@ void page_cache_sync_ra(struct readahead_control *ractl,
 	ra->size = min(contig_count + req_count, max_pages);
 	ra->async_size = 1;
 readit:
-	ra->order = 0;
+	ra->order = mapping_max_folio_order(ractl->mapping);
 	ractl->_index = ra->start;
 	page_cache_ra_order(ractl, ra);
 }
-- 
2.52.0.107.ga0afd4fd5b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
