Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD6AC991F2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Dec 2025 22:02:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T//7Jjob3WdXhQzUObwnfcgVPqLnbfjACiYE8ItAs4M=; b=Mru/Guenj6rDmPnCAO3CIeyoOf
	5AYp+JDa13QvG1ctvWWT79WXgypXuvJ2yRH+C0oKbXlp44hIoSXo9h6vZHM65gPO9L2Th2nTu9L/7
	641qX/ScS2qQItTilfAIIdXbrIxuPo1UwT1xxlsCo9oQzfzJy3o1RW6eveQLlnZV6nNE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQB25-0007bf-Bv;
	Mon, 01 Dec 2025 21:02:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vQB24-0007bZ-Mh
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CBBkS70aNOWzOmLRBcx2jU7eZG4brn/wTwZeRfMvNMM=; b=C1cOC9YtZNeeIl3/DLF827UQC1
 YeIPLWRyokPWYn4R1vXxbpyLi5hWqn+JpJ6V8AyZ6+37aJlMCvoU6mtuWj+0wZYcCEPpYxw3+eATZ
 C15PMOABpbi4BtSEd4fLP31R5yXsB5i5AmX2ZodtXwb+lyMLaDgMbxkFCe1w9zOEvzko=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CBBkS70aNOWzOmLRBcx2jU7eZG4brn/wTwZeRfMvNMM=; b=XfEVrOUb/57unEQx3dfchKAqjX
 JZRwa1F+bTGYt+Q8QKBVIQDMhYhP48SoBo/B5xhlf9MYFRXrl7bZxFVddt3wgzbJbSi0T6Xt+4ONq
 jL03QTSbjlrxyF2+n5SFN2cB9Ua5hfiRSTBW//Gi2yejJ22zWFTTeJvvMWBNntbc1KiE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQB24-0001iE-0c for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:02:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6F2F860159;
 Mon,  1 Dec 2025 21:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11722C4CEF1;
 Mon,  1 Dec 2025 21:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764622918;
 bh=ymCaVvYBxLZ105+ok6O11I72/6m8odE5XYgiapzJKeg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OJzhg7L0deFEQE7KVhFIIkZcgXrvIaEEh6AyeUPb6Ol1+OxV6f0hfF+BLEK+i2nld
 jp7DZsh7aWmrzp+W3v9ReOgv7nCjzjz9kRREFnqbw0CQQvQ3Tg1Ao8DHMKcm/HTNQY
 eKUuTZlxxua436Lk6mP+nowy93oxot6Jo6ihn+04s9E/860ao/1Z0I12B6TCJL5veW
 0vLVbgz7Cag+Ew2DqacqmbgXpMY6Znb5gxZsNb60YkByr5z5BWFMwt7mgUGJeg/0lS
 8P5JQ86CytVCJEQJltAtbjBFnbM5zj6uK7H5mnBMZk6SjSlD4u4lM57qzUSxtaa58E
 elvpFPYXsdnhA==
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
Date: Mon,  1 Dec 2025 21:01:25 +0000
Message-ID: <20251201210152.909339-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
In-Reply-To: <20251201210152.909339-1-jaegeuk@kernel.org>
References: <20251201210152.909339-1-jaegeuk@kernel.org>
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
X-Headers-End: 1vQB24-0001iE-0c
Subject: [f2fs-dev] [PATCH 2/4] mm/readahead: use page_cache_sync_ra for
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

This is all zero-order page allocation.

After (order=0 by default):
 f2fs_fadvise: dev = (252,16), ino = 14, i_size = 4294967296 offset:0, len:4294967296, advise:3
 page_cache_sync_ra: dev=252:16 ino=e index=0 req_count=2048 order=0 size=0 async_size=0 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=0 order=0 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=2048 req_count=2048 order=0 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_unbounded: dev=252:16 ino=e index=2048 nr_to_read=2048 lookahead_size=0
 page_cache_sync_ra: dev=252:16 ino=e index=4096 req_count=2048 order=0 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_unbounded: dev=252:16 ino=e index=4096 nr_to_read=2048 lookahead_size=0
 page_cache_sync_ra: dev=252:16 ino=e index=6144 req_count=2048 order=0 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_unbounded: dev=252:16 ino=e index=6144 nr_to_read=2048 lookahead_size=0
 page_cache_sync_ra: dev=252:16 ino=e index=8192 req_count=2048 order=0 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_unbounded: dev=252:16 ino=e index=8192 nr_to_read=2048 lookahead_size=0
 page_cache_sync_ra: dev=252:16 ino=e index=10240 req_count=2048 order=0 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_unbounded: dev=252:16 ino=e index=10240 nr_to_read=2048 lookahead_size=0
 ...
 page_cache_ra_unbounded: dev=252:16 ino=e index=1042432 nr_to_read=2048 lookahead_size=0
 page_cache_sync_ra: dev=252:16 ino=e index=1044480 req_count=2048 order=0 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_unbounded: dev=252:16 ino=e index=1044480 nr_to_read=2048 lookahead_size=0
 page_cache_sync_ra: dev=252:16 ino=e index=1046528 req_count=2048 order=0 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_unbounded: dev=252:16 ino=e index=1046528 nr_to_read=2048 lookahead_size=0

Cc: linux-mm@kvack.org
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 mm/readahead.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index c0db049a5b7b..5beaf7803554 100644
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
