Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93438CA1EF5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 04 Dec 2025 00:25:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4O0KQqZFwWeD/DkeRLsdaee1ywB3X4gIwwOAH+24IPc=; b=ljU7DG8DE9nnVBq8/svYW5gusV
	EYkuAZH/U55yAcwDA1l6ajVzm7MU9sVRhAJJzrETdM+2jcWQFOaa2vmRYf+EGtzkdtGJZbqEG8LPF
	qVu+DgCLkFoaU/hybVDEtlV/nm44NMFp1R/qR0qRwFutNCees2tdL9BOT6Q+OT1V0IcQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQwE3-0000rj-FX;
	Wed, 03 Dec 2025 23:25:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vQwE2-0000rd-AH
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Dec 2025 23:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z498MzxAZteo/xwTRoG99m7sj4E0YFpbb9L3gGPbL58=; b=HRawgMgJq5jX4sfSHzwykmpcac
 pMbN8BttQ0/njipaJYXXJafsgGxk10/V+anOfIfl99BEJsY+eXuT7li87iaDAIKYSTCSmLJtMLHTC
 SH2E7fxeaNfZrc7cLIBuNCkH+KEO6S8lrIPkwHw384n316QpwWXd7J1Wz1htzBryg6fo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z498MzxAZteo/xwTRoG99m7sj4E0YFpbb9L3gGPbL58=; b=CArsH+HMaBPFItToVRsFEXNdpG
 LeBSvIpZqgIXEwIOE90qOlqGJdbc7Tg8BllYb3kRG5f7vHGNuK0FX3/jdULg+g2lH4tiUwdwG9Qh/
 mRZ19XlaNBGGdYTWkW0GJEWq4vU6HntnHNYbY9hkRBD+eirUVmJ1185U2l19tPuDEG88=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQwE1-00077b-HN for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Dec 2025 23:25:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B9A7A60176;
 Wed,  3 Dec 2025 23:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 430AEC19424;
 Wed,  3 Dec 2025 23:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764804327;
 bh=sAJej4HZTiYDfV7VEYcwaKg9Xwk914WW6wlk1yPGQEk=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=pQzPjEFPD8N74U1fP1gOFDJDMKcIZviYG5+wt0HlBqPGc0RIFUQQW6xd4cnrlyWMq
 P+Mddndf3V5rcRbC1NkvnFKPsD5HVrspRuDuRkMuJ9YYxbmFpBdRpD5cOfet1H0e+F
 vD4Ikj+8E/yma5BlgCY/ipAKL46xBGTnuFDdnTI0H1jem5Y1DOlRFu4MWybtgZbb8G
 +mxx1ZViFrEiDfRwRcCTUIjWRvSOEfqBF9wlB+fLW9LQyTJBphmKyGONFOc72r6nQq
 kaOwqWlPK8LxWDOTkff6xuvGUAO0mEnPQAibAZRi8BipuaVQ5TAHTH1A9qX7jqJVJ9
 424U5byWd05LQ==
Date: Wed, 3 Dec 2025 23:25:25 +0000
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
Message-ID: <aTDG5RVirKFisCGT@google.com>
References: <20251202013212.964298-1-jaegeuk@kernel.org>
 <20251202013212.964298-4-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251202013212.964298-4-jaegeuk@kernel.org>
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQwE1-00077b-HN
Subject: Re: [f2fs-dev] [PATCH 3/3 v2] mm/readahead: try to allocate high
 order pages for FADVISE_FAV_WILLNEED
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
 page_cache_ra_order: dev=252:16 ino=e index=0 order=2 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=2048 req_count=2048 order=2 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=2048 order=4 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=4096 req_count=2048 order=4 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=4096 order=6 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=6144 req_count=2048 order=6 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=6144 order=8 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=8192 req_count=2048 order=8 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=8192 order=10 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=10240 req_count=2048 order=9 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=10240 order=11 size=2048 async_size=1024 ra_pages=2048
...
 page_cache_ra_order: dev=252:16 ino=e index=126976 order=11 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=129024 req_count=2048 order=9 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=129024 order=11 size=2048 async_size=1024 ra_pages=2048
 page_cache_async_ra: dev=252:16 ino=e index=1024 req_count=2048 order=9 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1

For comparion, this is the trace of madvise(MADV_POPULATE_READ) which bumps up the order by 2.
 page_cache_ra_order: dev=252:16 ino=e index=0 order=0 size=2048 async_size=512 ra_pages=2048
 f2fs_filemap_fault: dev = (252,16), ino = 14, index = 0, flags: WRITE|KILLABLE|USER|REMOTE|0x8082000, ret: MAJOR|RETRY
 page_cache_async_ra: dev=252:16 ino=e index=1536 req_count=2048 order=0 size=2048 async_size=512 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=2048 order=2 size=2048 async_size=2048 ra_pages=2048
 f2fs_filemap_fault: dev = (252,16), ino = 14, index = 1536, flags: WRITE|KILLABLE|USER|REMOTE|0x8082000, ret: RETRY
 page_cache_async_ra: dev=252:16 ino=e index=2048 req_count=2048 order=2 size=2048 async_size=2048 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=4096 order=4 size=2048 async_size=2048 ra_pages=2048
 f2fs_filemap_fault: dev = (252,16), ino = 14, index = 2048, flags: WRITE|KILLABLE|USER|REMOTE|0x8082000, ret: RETRY
 page_cache_async_ra: dev=252:16 ino=e index=4096 req_count=2048 order=4 size=2048 async_size=2048 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=6144 order=6 size=2048 async_size=2048 ra_pages=2048
 f2fs_filemap_fault: dev = (252,16), ino = 14, index = 4096, flags: WRITE|KILLABLE|USER|REMOTE|0x8082000, ret: RETRY
 page_cache_async_ra: dev=252:16 ino=e index=6144 req_count=2048 order=6 size=2048 async_size=2048 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=8192 order=8 size=2048 async_size=2048 ra_pages=2048
 f2fs_filemap_fault: dev = (252,16), ino = 14, index = 6144, flags: WRITE|KILLABLE|USER|REMOTE|0x8082000, ret: RETRY
 page_cache_async_ra: dev=252:16 ino=e index=8192 req_count=2048 order=8 size=2048 async_size=2048 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=10240 order=10 size=2048 async_size=2048 ra_pages=2048
 f2fs_filemap_fault: dev = (252,16), ino = 14, index = 8192, flags: WRITE|KILLABLE|USER|REMOTE|0x8082000, ret: RETRY
 page_cache_async_ra: dev=252:16 ino=e index=10240 req_count=2048 order=9 size=2048 async_size=2048 ra_pages=2048 mmap_miss=0 prev_pos=-1
...
 f2fs_filemap_fault: dev = (252,16), ino = 14, index = 518144, flags: WRITE|KILLABLE|USER|REMOTE|0x8082000, ret: RETRY
 page_cache_async_ra: dev=252:16 ino=e index=520192 req_count=2048 order=9 size=2048 async_size=2048 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=522240 order=11 size=2048 async_size=2048 ra_pages=2048
 f2fs_filemap_fault: dev = (252,16), ino = 14, index = 520192, flags: WRITE|KILLABLE|USER|REMOTE|0x8082000, ret: RETRY
 page_cache_async_ra: dev=252:16 ino=e index=522240 req_count=2048 order=9 size=2048 async_size=2048 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=524288 order=11 size=2048 async_size=2048 ra_pages=2048
 f2fs_filemap_fault: dev = (252,16), ino = 14, index = 522240, flags: WRITE|KILLABLE|USER|REMOTE|0x8082000, ret: RETRY

Cc: linux-mm@kvack.org
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 Change log from v1:
  - take the same madvise() behavior which bumps up ra->order by 2.

 mm/readahead.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 54c78f8276fe..61a469117209 100644
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
+	ra->order += 2;
 	ractl->_index = ra->start;
 	page_cache_ra_order(ractl, ra);
 }
-- 
2.52.0.223.gf5cc29aaa4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
