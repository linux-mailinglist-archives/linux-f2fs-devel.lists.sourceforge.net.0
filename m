Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F2CC99C0A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 02 Dec 2025 02:32:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3cxk8iUj1580fR6CrCKSYJP1X7GXVUhq2YEfEwW/0KU=; b=A4dOpdJDZtJYpdaqjqmxOBMOb0
	hd8gn4qJBJdTFA2gaT+oAH/8cQNd5wQD/XAJ6OCfyy5tlsD8mHkHV+t/1RJbcOoGIhCbK4XETc0ME
	KWlosO0lE1LSzmSvs+xqZOPKjbDUVA2QOAZY3CxClFt0F6Yjmo1oddGEeuXmRZkJ8Wj4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQFFg-0000lM-NH;
	Tue, 02 Dec 2025 01:32:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vQFFe-0000lG-UW
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 01:32:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AaBQAyD3scJHzdwp7Z7vsEt/q+jdM2FxcSbIvG0ArPg=; b=ljyC9LUtRYfBpioKYY+5aCfmZB
 fGjwFPmpudvE0BXEnKtNrmpNhuuZ7C1hIkihSEfFc0CRAWFOS2ky61Mwl3zz9olK63+dZmOalsDm9
 X55CcF+DY0DrvRt0/Ppgrktz7mhks5IYZ20K9MBJvNVXisbbgN+7tbdf0Tx7222ASCz8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AaBQAyD3scJHzdwp7Z7vsEt/q+jdM2FxcSbIvG0ArPg=; b=kLS5KitrUsxkIhDOQA4VoMJ1Zl
 71gZX4AiifjzvlMUu6gIJDWYmaS9iOqygrFX5HQ9Y7fm2Sjmo4KktDSkx13VvesTZqvHk8wqS1V1u
 EGf6CrWsIXhzi0btawYnLlLp4JSxYLr/UDvmiuF+bQSZLPRVnIdoihhK5uyn6HMy5zPk=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQFFe-0006EK-Bn for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 01:32:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EBADD4424C;
 Tue,  2 Dec 2025 01:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BEEC4CEF1;
 Tue,  2 Dec 2025 01:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764639136;
 bh=z6z126FwDohXSBIi//EiTH/Ua9V8Bx+8xe2h++oSC/M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BMdF5NvqRQkK+ZJ0ZjCy1m6t6TvoYZOVzc4ugrFnriNRhJSKdHn487GhC1afnkTVw
 IBcD2j8tohMqJnyCo+2V443u+tIACDE5iGt9sos1gYQBwGnzQQaGEKMz0eowUIacyx
 vREAcGpa3Zge8LmKIeQDw9BRV+ORe6IVaHkwzGu/+BAPnXjSB5cD2Qw49LGMcACSJs
 SUBV3IfHXWUxQOruHghEareLoVTbBN3Iwg2nrfe/jeeP4lpXFJFla3OkEmGTToqivj
 TWwsSeYa/0inI9n1Hp0eVmBx/2el8JNXDmXyC3jgvQjetbnGueVQKyclGbJvp0URzM
 KrA99eL5jxlSA==
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
Date: Tue,  2 Dec 2025 01:30:11 +0000
Message-ID: <20251202013212.964298-2-jaegeuk@kernel.org>
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
 Content preview: This patch fixes the broken readahead flow for
 POSIX_FADV_WILLNEED, 
 where the problem is, in force_page_cache_ra(nr_to_read), nr_to_read is cut
 by the below code. max_pages = max_t(unsigned long, bdi->io_pages,
 ra->ra_pages); 
 nr_to_read = min_t(unsigned long, nr_to_read, max_pages); 
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
X-Headers-End: 1vQFFe-0006EK-Bn
Subject: [f2fs-dev] [PATCH 1/3] mm/readahead: fix the broken readahead for
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

Cc: linux-mm@kvack.org
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 mm/readahead.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 3a4b5d58eeb6..e88425ce06f7 100644
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
+	 * Consider the optimal hardware IO size for readahead chunk.
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
