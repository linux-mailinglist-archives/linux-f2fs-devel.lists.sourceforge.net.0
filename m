Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09175AFD470
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:05:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGQ0GHSoz0rOyO9tCiSJzroNs7qn6sv53LD+ZCjZgmY=; b=LaxRzOyUh5bpbv8HHfdOS6NtBs
	gSsOm4zmQnFT5UZPL9+4lHbwzXdfVy8qrw9xQ7xYfBMyKj5ynZn20klMMsw1OkwGZZ/YJTkD0l2P0
	DoxWtYMuLB6YECZ/X9LD7r54ztx7g6g4ng/hTsH8lm6x8csKB0Wt9vawM9HtN0+9NUdw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBl2-0007j7-Sv;
	Tue, 08 Jul 2025 17:05:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjy-0007PH-L9
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tRF3/TMO4xNfxNSHPTpPHlkc7sUHE57QGGtwZAb+MVc=; b=aJKsnvghdOXWYAcGo0TJ/MYbBB
 3UwyhRBROQ+qk+7IUaqcH05s/DC+dGD9yj4wcPBH+wSUA1GPKpL0wfNMmFT9WCmkHZ6r/VFNKTMwS
 RGsyV1jKnqL8DjSAD1J0ga5yCNWm441pUPbtZXDSbdIgRmDcCjuJmwLJ28sQZ5vRWobg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tRF3/TMO4xNfxNSHPTpPHlkc7sUHE57QGGtwZAb+MVc=; b=MT3/TJxlJbZ+ZmBfDZkLpLPxDZ
 bDnL9IB+tRFi+eDQu3GAaLx1bwU9tOo6YBC9cNKJmcyo+ttAIWkAmdRTCg6m4RAIVn62YPGzeW2Ph
 aMjOr5RNXc5uuhy33a73zNW4+uCONZacgRLVEbtSd/qBUhDQVzqkAhSmcud76TFDC7ig=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjv-0006Fz-5E for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=tRF3/TMO4xNfxNSHPTpPHlkc7sUHE57QGGtwZAb+MVc=; b=aYrnxRVnI1H2LjQ2XkYy+iALTF
 Oikl+M05jKuHuNUvfetz0Ne9mm3MFke578dDvYLe36vNOTQ45SSv6zLIL2j9ByzUA32dtW1JTRpXh
 i+PUkPEHAlogQ+aoQrkTejrkvjN0SSq+AwcreJlKZBu5VM0ONMMn60Tsil5l2QokyK2k+yLT1IR91
 eryNA6mbXYtN6msU5OJKjozHnmQU/KlhlgYLVzg/sKDgiioj3AUvTj+3si7Gk4TGTcu+7dMHvQDqY
 D4TiRpp132AJK9OoqOzJzzGbcAbrVa+OjE9SMvNgNWm5VcxjYsKrS1VaMezq0UH5/lJVMSxLtDrZZ
 J8UBL1dA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjj-00000000T7Y-2QoH;
 Tue, 08 Jul 2025 17:04:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:39 +0100
Message-ID: <20250708170359.111653-43-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The only caller has a folio so pass it in. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/compress.c | 6
 +++---
 fs/f2fs/data.c | 2 +- fs/f2fs/f2fs.h | 2 +- 3 files changed, 5 insertions(+), 
 5 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZBjv-0006Fz-5E
Subject: [f2fs-dev] [PATCH 42/60] f2fs: Pass a folio to
 f2fs_compress_write_end_io()
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The only caller has a folio so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/compress.c | 6 +++---
 fs/f2fs/data.c     | 2 +-
 fs/f2fs/f2fs.h     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 4e432df2431f..c1334e61823c 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1473,11 +1473,11 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	return -EAGAIN;
 }
 
-void f2fs_compress_write_end_io(struct bio *bio, struct page *page)
+void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio)
 {
+	struct page *page = &folio->page;
 	struct f2fs_sb_info *sbi = bio->bi_private;
-	struct compress_io_ctx *cic =
-			(struct compress_io_ctx *)page_private(page);
+	struct compress_io_ctx *cic = folio->private;
 	enum count_type type = WB_DATA_TYPE(page,
 				f2fs_is_compressed_page(page));
 	int i;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 20add6761d81..7ea37ff517c6 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -341,7 +341,7 @@ static void f2fs_write_end_io(struct bio *bio)
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 		if (f2fs_is_compressed_page(&folio->page)) {
-			f2fs_compress_write_end_io(bio, &folio->page);
+			f2fs_compress_write_end_io(bio, folio);
 			continue;
 		}
 #endif
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1cf3063d2170..f86c89a9dd99 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4481,7 +4481,7 @@ int f2fs_prepare_compress_overwrite(struct inode *inode,
 bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
 					pgoff_t index, unsigned copied);
 int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock);
-void f2fs_compress_write_end_io(struct bio *bio, struct page *page);
+void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio);
 bool f2fs_is_compress_backend_ready(struct inode *inode);
 bool f2fs_is_compress_level_valid(int alg, int lvl);
 int __init f2fs_init_compress_mempool(void);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
