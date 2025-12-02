Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A545C99C09
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 02 Dec 2025 02:32:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vEzxDSeUwYJ0EByqX0gmRGQAyydggOo+mnHmJfsQAQ=; b=JYHB1dMZGOX0lH9F907f31cjmg
	2R/lWFHLZT3GivvesyQLvOHZelsBFnvq6LQMxOi4NZFelwQYglDhRgJWlqLRLx4axThFUVr9qZyrP
	XIyEKcKpI/jTIlTFTetFLWpziP28ddE/rK9gFozLsQYnA92fdIbrX+C2xkl1gEQHM78w=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQFFl-0003xe-Jk;
	Tue, 02 Dec 2025 01:32:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vQFFk-0003xS-Ia
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 01:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aE0HwMs18Vm+zeitaHi8xyIfgDHcAH908O8Y2KqWKvc=; b=a0Mo2q0XfAjwi2H1GKm6Uk1uod
 T+pg7EIBNRFG8tx7ksfYwSSJyM2WL75jsxpJripMo83NvCGEYIaLq8Btu8QxFs0TQ8fsYFRcdGtpj
 rpVsywpEImuHzJAf1P0v9Sq0B0ga0BdEFXjM44hRd3JJPj7N/3DzcrTOm2MQNbUxeyog=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aE0HwMs18Vm+zeitaHi8xyIfgDHcAH908O8Y2KqWKvc=; b=TIXNBgwNsMH580CY6lJyqHq6gI
 eEHryooVuBbe2JVZHrYc1BsdhATTBDdyYk6ej1aZy645ob3jrPxS1Tw4q/ZSNrj3LZObLgZLMrAfJ
 QaADyX5BtLJJq6pv2jjJCEngSj672S2ep2JMR9/y/8WNmaHsmSf4Jc0mOlfnTyppd4pU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQFFk-0006Fp-M8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 01:32:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1EE046018C;
 Tue,  2 Dec 2025 01:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7560C19421;
 Tue,  2 Dec 2025 01:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764639137;
 bh=BpU3vRCEK3UYtGGHaZpkgnwj8upX/nDTSQm3S16WZKw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ITwt/47d5odXjPpW5XsmIr+DppcqY0pR7w2OmyMxX/v9Vx+G5bblrfvU+3LW1uPv+
 W+yq4wTfC97UROaid0R1bZ9j1N80QXn5A+jKF2SlL96b/I4oGr8gCEOcjFfEnBOiHv
 PCPHEM8/Pf1yit1bd1W48L5cGbhjX9vty78//0ezC86uRWVYhR9mo2fyD4gFVlDmNU
 ZyU4n2fPng8NyawGr8oc76ZyYOoO07QsBYQjMgL7nb5oUCR8TNrLSTkOrNcY564dH5
 qiQuLPh50ysMiu+tjCCv3z2MzK4f5kTtuzYnB8RYzg+yxjUd+wF32DWNLXSDr1vZ17
 F0GD94JUSw90Q==
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
Date: Tue,  2 Dec 2025 01:30:12 +0000
Message-ID: <20251202013212.964298-3-jaegeuk@kernel.org>
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
 Content preview: This patch replaces page_cache_ra_unbounded() with
 page_cache_sync_ra()
 in fadvise(FADVISE_FAV_WILLNEED) to support the large folio. Before:
 f2fs_fadvise:
 dev = (252, 16), ino = 14, i_size = 4294967296 offset:0, len:4294967296,
 advise:3
 page_cache_ra_unbounded: dev=252:16 ino=e index=0 nr_to_read=2048
 lookahead_size=0 page_cache_ra_ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
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
X-Headers-End: 1vQFFk-0006Fp-M8
Subject: [f2fs-dev] [PATCH 2/3] mm/readahead: use page_cache_sync_ra for
 FADVISE_FAV_WILLNEED
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

This patch replaces page_cache_ra_unbounded() with page_cache_sync_ra() in
fadvise(FADVISE_FAV_WILLNEED) to support the large folio.

Before:
 f2fs_fadvise: dev = (252,16), ino = 14, i_size = 4294967296 offset:0, len:4294967296, advise:3
 page_cache_ra_unbounded: dev=252:16 ino=e index=0 nr_to_read=2048 lookahead_size=0
 page_cache_ra_unbounded: dev=252:16 ino=e index=2048 nr_to_read=2048 lookahead_size=0
 page_cache_ra_unbounded: dev=252:16 ino=e index=4096 nr_to_read=2048 lookahead_size=0
 page_cache_ra_unbounded: dev=252:16 ino=e index=6144 nr_to_read=2048 lookahead_size=0
 page_cache_ra_unbounded: dev=252:16 ino=e index=8192 nr_to_read=2048 lookahead_size=0
 page_cache_ra_unbounded: dev=252:16 ino=e index=10240 nr_to_read=2048 lookahead_size=0
 page_cache_ra_unbounded: dev=252:16 ino=e index=12288 nr_to_read=2048 lookahead_size=0
 page_cache_ra_unbounded: dev=252:16 ino=e index=14336 nr_to_read=2048 lookahead_size=0
 page_cache_ra_unbounded: dev=252:16 ino=e index=16384 nr_to_read=2048 lookahead_size=0
 page_cache_ra_unbounded: dev=252:16 ino=e index=18432 nr_to_read=2048 lookahead_size=0
 page_cache_ra_unbounded: dev=252:16 ino=e index=20480 nr_to_read=2048 lookahead_size=0
 page_cache_ra_unbounded: dev=252:16 ino=e index=22528 nr_to_read=2048 lookahead_size=0
 page_cache_ra_unbounded: dev=252:16 ino=e index=24576 nr_to_read=2048 lookahead_size=0
 ...
 page_cache_ra_unbounded: dev=252:16 ino=e index=1042432 nr_to_read=2048 lookahead_size=0

Note, this is all order-zero page allocation.

After:
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

Cc: linux-mm@kvack.org
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 mm/readahead.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index e88425ce06f7..54c78f8276fe 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -340,6 +340,7 @@ void force_page_cache_ra(struct readahead_control *ractl,
 		unsigned long nr_to_read)
 {
 	struct address_space *mapping = ractl->mapping;
+	struct inode *inode = mapping->host;
 	struct backing_dev_info *bdi = inode_to_bdi(mapping->host);
 	unsigned long this_chunk;
 
@@ -352,11 +353,19 @@ void force_page_cache_ra(struct readahead_control *ractl,
 	this_chunk = max_t(unsigned long, bdi->io_pages, ractl->ra->ra_pages);
 
 	while (nr_to_read) {
-		this_chunk = min_t(unsigned long, this_chunk, nr_to_read);
+		unsigned long index = readahead_index(ractl);
+		pgoff_t end_index = (i_size_read(inode) - 1) >> PAGE_SHIFT;
 
-		if (do_page_cache_ra(ractl, this_chunk, 0))
+		if (index > end_index)
 			break;
 
+		if (nr_to_read > end_index - index)
+			nr_to_read = end_index - index + 1;
+
+		this_chunk = min_t(unsigned long, this_chunk, nr_to_read);
+
+		page_cache_sync_ra(ractl, this_chunk);
+
 		nr_to_read -= this_chunk;
 	}
 }
@@ -573,7 +582,7 @@ void page_cache_sync_ra(struct readahead_control *ractl,
 
 	/* be dumb */
 	if (do_forced_ra) {
-		force_page_cache_ra(ractl, req_count);
+		do_page_cache_ra(ractl, req_count, 0);
 		return;
 	}
 
-- 
2.52.0.107.ga0afd4fd5b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
