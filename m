Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EAFC98D48
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Dec 2025 20:20:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WI+s88zhSoBXZ65meD/PqJ2ro2MwjPyWr0PcvqKZSXY=; b=EnjzOfKTqI0tm37L7+wyC8JfwJ
	upO5ezSC5MberWvxNGhPNFVwJWT369fNBANEkOX1Ms/eOngjqdYjtxGl2i4g4zcIsqQ2OU4JLhhTJ
	zSYuK0+LucL1mi9D+5wtXs2WKmn/unhw9UxL2VkC8h600u2iJaayfoMZMxnBogqwOYx0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQ9RD-0005LH-0U;
	Mon, 01 Dec 2025 19:19:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vQ9RC-0005LA-BD
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 19:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b/n5yTPKOKix31zNLLukMUFvshf0RsB1ufJiH5DP8+c=; b=O/efDVC8e6+5e/UDryKzvAkNAF
 hN0siZgzbkptjAQ3k1nx8viiWmfWOV4TUrbeQK99D/y3CLS9jYOnCPsGjed6ByS0FjN5QFT174WV9
 Q1JfSep0BgO+nDi4X1+9bizV7rHgpWL9kGx417PBu813ram68rYzuminU2YzOQJN7sH8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b/n5yTPKOKix31zNLLukMUFvshf0RsB1ufJiH5DP8+c=; b=cPwmI4HZ/9mnjFZPz0SKoA7ODc
 G/jT/p+NOCAKKTsyMse5u76IqRBknwc/Xasrm9gpqslWq28vJiXwMVxDDpYTQDCNuj5wIMYtK5kE3
 ZUd/xTG61y21Hh+Tlv4aAs0QuH+hkXd3AZxBxFR4qdG+CMo6inH0eOYYShMYnFRtK5Ts=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQ9RB-0005oJ-N9 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 19:19:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2885B60190
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Dec 2025 19:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB5CC19422;
 Mon,  1 Dec 2025 19:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764616787;
 bh=qPAgh3J2+RQx0JuEOkYRh0szxr3XonhjB1XnpF8XRmE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FxJaniuqA9QxNGSqyD2DrWMHT6htzxZK4J2vWD4y+hGzmr7vAu75sPgGC8O9481WJ
 jK7t09I0XMT5GwYWRM0+yqcJQvFWV+IzvLVtsOhRV8ZYHSYHPGvmw6UvW5/vlBNa5L
 6Nwvlo31jCzHIhNDoHaWls+scv50p/bvE6qb0y1/iwyFQwEajSuYGYsLSQ9TVzf6du
 iOFft850BkTsn+XY/qm5fydvCZmpOnrXW98M33HjwC1zm45OBLKHQMqm1jlXPyyfP9
 keLhAHbwqG7Iz5oAiZRCXFTHPpfjkUG+CeLuA91FopZlUcO9bDB6Cn4S1D892CBo6a
 x7TFfM6+sM/xA==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  1 Dec 2025 19:16:14 +0000
Message-ID: <20251201191940.883657-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
In-Reply-To: <20251201191940.883657-1-jaegeuk@kernel.org>
References: <20251201191940.883657-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Given we have a_ops->folio_order which passes the desired
 folio order, let's use page_cache_sync_ra in fadvise(FADVISE_FAV_WILLNEED)
 to get large folios. Before: f2fs_fadvise: dev = (252,16), ino = 14, i_size
 = 4294967296 offset:0, len:4294967296, advise:3 page_cache_ra_unbounded:
 dev=252:16 ino=e index=0 nr_to_read=2048 lookahead_size=0 page_cache_ra_ [...]
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
X-Headers-End: 1vQ9RB-0005oJ-N9
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

Given we have a_ops->folio_order which passes the desired folio order, let's use
page_cache_sync_ra in fadvise(FADVISE_FAV_WILLNEED) to get large folios.

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
