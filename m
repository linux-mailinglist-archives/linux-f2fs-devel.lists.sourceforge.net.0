Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 465B6C98D4E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Dec 2025 20:20:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXWLwc8d4si7/qjluW76DzytB3XcliOl2g3QhAV0PpM=; b=nAiKG3Ndu2uOBPRd91Ud2ksY14
	ho7A2OlUDF/4BDFOrkmYzX4/A2GWK1EMYXcqXDd4QyU5P59KQuP0GXwAdijIxAWr1E1rZi1t5Go5V
	Az5APHd72PJkWMQLsmzhu7sKlGW38dcB1U53w6gcITCssRxf8E4MrVpIH3mp7nE8aLDQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQ9RC-0000Hx-JC;
	Mon, 01 Dec 2025 19:19:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vQ9RB-0000Hf-02
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 19:19:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WyDD3BX1TUMGGI+UYY/MA3rQ1XH9PPPF16J2xXnpgys=; b=cpnibWlMuZE9WD5v8URd1ozRn9
 V8LpBfbfiYkwWKWf25YA9wJ/9T+nbf1DJ0qWp+SklhBmSdQ11E3uoLdWyisbdLDuq6/Urc15ODXuH
 PqM7MYoRSopAG1mlfMjpgnE8lae6GW60+qnkMrVuqy2CTNDlEzKEZoqVFz5LMmOeEr4o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WyDD3BX1TUMGGI+UYY/MA3rQ1XH9PPPF16J2xXnpgys=; b=mKOSJPmxxtr5ubc/zbTU+edsWw
 znrPo3l1jJ9QwnOSUh3ydmrCuuQX5aIW68YI1ksvu149wE/Tl8VAxZYiYZMd2EKfjj/Embu1r4jPw
 +MmN3avQHvGno3VPfK39WOosUpudm2Ispoalylan44aLlGUky5jfg1EdorFXhK+Xy8vk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQ9RA-0005oE-Qk for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 19:19:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3435B6014A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Dec 2025 19:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A98C4CEF1;
 Mon,  1 Dec 2025 19:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764616786;
 bh=SO/r1v05KSnDyaLwHJa1g/Jekz+lB9PhrclLWdtWnjo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gDZwOpI3jV+iaqgiMSTCzGNGvPDFIMKwMr7104bIwDV4v12JskWj70R6yj/bAxqgk
 Kz3QD+OgiAzOqf8YdUL8uK0c+ZzgVcL4OWDG8EqAFjsrRXoVRNDDSMAQsUAWGVyWsM
 OpZETwlgObpofA8tf8HYgK5w7442PmkgGfxTvCQna1ZoVop0Ug2Rs7bU6jQRPBizSX
 sEpr3E9J/onaUGY1puDsnbfRfwNS63agNNcujnia3QmNmPWEjML5vZ8SQKx1n7afWB
 dlisWT7qJfarpaIzfDXgBi3elOTudXvBzHt2joiRb4JlY4HwXrM62NPTIsitPdSyB7
 ox3D3nMcOfIQA==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  1 Dec 2025 19:16:13 +0000
Message-ID: <20251201191940.883657-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
In-Reply-To: <20251201191940.883657-1-jaegeuk@kernel.org>
References: <20251201191940.883657-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch fixes the broken readahead flow for
 POSIX_FADV_WILLNEED, 
 where the problem is, in force_page_cache_ra(nr_to_read), nr_to_read is cut
 by the below code. max_pages = max_t(unsigned long, bdi->io_pages,
 ra->ra_pages); 
 nr_to_read = min_t(unsigned long, nr_to_read, max_pages); 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQ9RA-0005oE-Qk
Subject: [f2fs-dev] [PATCH 1/4] mm/readahead: fix the broken readahead for
 POSIX_FADV_WILLNEED
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

This patch fixes the broken readahead flow for POSIX_FADV_WILLNEED, where
the problem is, in force_page_cache_ra(nr_to_read), nr_to_read is cut by
the below code.

     max_pages = max_t(unsigned long, bdi->io_pages, ra->ra_pages);
     nr_to_read = min_t(unsigned long, nr_to_read, max_pages);

IOWs, we are not able to read ahead larger than the above max_pages which
is most likely the range of 2MB and 16MB. Note, it doesn't make sense
to set ra->ra_pages to the entire file size. Instead, let's fix this logic.

Before:
f2fs_fadvise: dev = (252,16), ino = 14, i_size = 4294967296 offset:0, len:4294967296, advise:3
page_cache_ra_unbounded: dev=252:16 ino=e index=0 nr_to_read=512 lookahead_size=0
page_cache_ra_unbounded: dev=252:16 ino=e index=512 nr_to_read=512 lookahead_size=0
page_cache_ra_unbounded: dev=252:16 ino=e index=1024 nr_to_read=512 lookahead_size=0
page_cache_ra_unbounded: dev=252:16 ino=e index=1536 nr_to_read=512 lookahead_size=0

After:
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
page_cache_ra_unbounded: dev=252:16 ino=e index=1044480 nr_to_read=2048 lookahead_size=0
page_cache_ra_unbounded: dev=252:16 ino=e index=1046528 nr_to_read=2048 lookahead_size=0

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 mm/readahead.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 3a4b5d58eeb6..c0db049a5b7b 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -311,7 +311,7 @@ EXPORT_SYMBOL_GPL(page_cache_ra_unbounded);
  * behaviour which would occur if page allocations are causing VM writeback.
  * We really don't want to intermingle reads and writes like that.
  */
-static void do_page_cache_ra(struct readahead_control *ractl,
+static int do_page_cache_ra(struct readahead_control *ractl,
 		unsigned long nr_to_read, unsigned long lookahead_size)
 {
 	struct inode *inode = ractl->mapping->host;
@@ -320,45 +320,42 @@ static void do_page_cache_ra(struct readahead_control *ractl,
 	pgoff_t end_index;	/* The last page we want to read */
 
 	if (isize == 0)
-		return;
+		return -EINVAL;
 
 	end_index = (isize - 1) >> PAGE_SHIFT;
 	if (index > end_index)
-		return;
+		return -EINVAL;
 	/* Don't read past the page containing the last byte of the file */
 	if (nr_to_read > end_index - index)
 		nr_to_read = end_index - index + 1;
 
 	page_cache_ra_unbounded(ractl, nr_to_read, lookahead_size);
+	return 0;
 }
 
 /*
- * Chunk the readahead into 2 megabyte units, so that we don't pin too much
- * memory at once.
+ * Chunk the readahead per the block device capacity, and read all nr_to_read.
  */
 void force_page_cache_ra(struct readahead_control *ractl,
 		unsigned long nr_to_read)
 {
 	struct address_space *mapping = ractl->mapping;
-	struct file_ra_state *ra = ractl->ra;
 	struct backing_dev_info *bdi = inode_to_bdi(mapping->host);
-	unsigned long max_pages;
+	unsigned long this_chunk;
 
 	if (unlikely(!mapping->a_ops->read_folio && !mapping->a_ops->readahead))
 		return;
 
 	/*
-	 * If the request exceeds the readahead window, allow the read to
-	 * be up to the optimal hardware IO size
+	 * Consier the optimal hardware IO size for readahead chunk.
 	 */
-	max_pages = max_t(unsigned long, bdi->io_pages, ra->ra_pages);
-	nr_to_read = min_t(unsigned long, nr_to_read, max_pages);
+	this_chunk = max_t(unsigned long, bdi->io_pages, ractl->ra->ra_pages);
+
 	while (nr_to_read) {
-		unsigned long this_chunk = (2 * 1024 * 1024) / PAGE_SIZE;
+		this_chunk = min_t(unsigned long, this_chunk, nr_to_read);
 
-		if (this_chunk > nr_to_read)
-			this_chunk = nr_to_read;
-		do_page_cache_ra(ractl, this_chunk, 0);
+		if (do_page_cache_ra(ractl, this_chunk, 0))
+			break;
 
 		nr_to_read -= this_chunk;
 	}
-- 
2.52.0.107.ga0afd4fd5b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
