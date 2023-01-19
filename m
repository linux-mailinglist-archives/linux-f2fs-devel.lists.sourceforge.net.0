Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A17B46731DA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Jan 2023 07:36:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIOXj-0000zy-79;
	Thu, 19 Jan 2023 06:36:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+d6c99cb0ec1a2cfa7d20+7088+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pIOXi-0000zq-08 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 06:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DKCT1WdWWcozfWmEkEsG0Gw3gxiMmitAN1Tyuop0nBM=; b=N/E4t8B4z6qVkjjR0od/97IbuJ
 9V6xrZZmZJABu4qrrSkGdSL6IgG1g0IlPCr7VUrjwMLbWMQrIxo+h0dg0kLPkdDrBNMzKPbYdc2bd
 eYujNbHmyjLPNomJM5m/pt4QaC/A21FHI1UqBJ5pOvT+dSYL42OT0zd0kpBkZ5umpW/E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DKCT1WdWWcozfWmEkEsG0Gw3gxiMmitAN1Tyuop0nBM=; b=IMZmbOC0fl6IH7ystG1rx2Gjvz
 BEh3svc3YT1BfCPod3l/Yo2BDeOKI/NvYqvCKdgm0XMzn9YGPCdxbhAjSE/hdeByQKHxfXmLOmV90
 8hZ7ORnJZ1u2jWXpjzRZghqQ90N4xiK0afy052vnmtelA/dWiyhCTqvz5Jap/Z+cjMZo=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pIOXg-008fSc-KB for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 06:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=DKCT1WdWWcozfWmEkEsG0Gw3gxiMmitAN1Tyuop0nBM=; b=CZoIsrBNPFOjRJAaG43j9Ta7m2
 3HgMax3vv/u0oOn/yLAFxxAzHOIAE/Y24zlmVmAJlLO7ZON3+57qIFNs83DSoh+VkLP3Yb9U+IBGB
 +TCcy9xpll3jFu8qCrqDKiQ0gO1weRgMR5++RrnFonzqB4AlQidU4dZgEijoG1r7em0JbrthFBiFC
 FnqhLylMrvIgKMESOBctnQvVo933Lvc1jsxg3KL/E6kWyCqwM403B6FzTP1OyBidP5LJlEvTiKekN
 skKJ7R+ruzMBEJSS1/MIV9MWLBV4IYKpll3ICCPbTQz9KkEAPN37CmcUZOafdVykaE3YfwgFQCiNq
 Q7CNI9Xg==;
Received: from [2001:4bb8:19a:2039:96fe:c1ec:dda2:41a3] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pIOXa-003kdF-LB; Thu, 19 Jan 2023 06:36:51 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 19 Jan 2023 07:36:24 +0100
Message-Id: <20230119063625.466485-8-hch@lst.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119063625.466485-1-hch@lst.de>
References: <20230119063625.466485-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Remove __refresh_next_blkoff by opencoding the SSR vs LFS
 segment check in the only caller, and then add helpers for SSR block selection
 and blkoff randomization instead. Signed-off-by: Christoph Hellwig
 <hch@lst.de>
 --- fs/f2fs/segment.c | 48 +++++++++++++++++++++++ 1 file changed,
 23 insertions(+), 25 deletions(-) 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pIOXg-008fSc-KB
Subject: [f2fs-dev] [PATCH 7/8] f2fs: refactor next blk selection
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Remove __refresh_next_blkoff by opencoding the SSR vs LFS segment check
in the only caller, and then add helpers for SSR block selection and
blkoff randomization instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/segment.c | 48 +++++++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index f889f623a59fd6..6f588e440c7575 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2616,30 +2616,10 @@ static int __next_free_blkoff(struct f2fs_sb_info *sbi,
 	return __find_rev_next_zero_bit(target_map, sbi->blocks_per_seg, start);
 }
 
-/*
- * If a segment is written by LFS manner, next block offset is just obtained
- * by increasing the current block offset. However, if a segment is written by
- * SSR manner, next block offset obtained by calling __next_free_blkoff
- */
-static void __refresh_next_blkoff(struct f2fs_sb_info *sbi,
-				struct curseg_info *seg)
+static int f2fs_find_next_ssr_block(struct f2fs_sb_info *sbi,
+		struct curseg_info *seg)
 {
-	if (seg->alloc_type == SSR) {
-		seg->next_blkoff =
-			__next_free_blkoff(sbi, seg->segno,
-						seg->next_blkoff + 1);
-	} else {
-		seg->next_blkoff++;
-		if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK) {
-			/* To allocate block chunks in different sizes, use random number */
-			if (--seg->fragment_remained_chunk <= 0) {
-				seg->fragment_remained_chunk =
-				   get_random_u32_inclusive(1, sbi->max_fragment_chunk);
-				seg->next_blkoff +=
-				   get_random_u32_inclusive(1, sbi->max_fragment_hole);
-			}
-		}
-	}
+	return __next_free_blkoff(sbi, seg->segno, seg->next_blkoff + 1);
 }
 
 bool f2fs_segment_has_free_slot(struct f2fs_sb_info *sbi, int segno)
@@ -3216,6 +3196,19 @@ static int __get_segment_type(struct f2fs_io_info *fio)
 	return type;
 }
 
+static void f2fs_randomize_chunk(struct f2fs_sb_info *sbi,
+		struct curseg_info *seg)
+{
+	/* To allocate block chunks in different sizes, use random number */
+	if (--seg->fragment_remained_chunk > 0)
+		return;
+
+	seg->fragment_remained_chunk =
+		get_random_u32_inclusive(1, sbi->max_fragment_chunk);
+	seg->next_blkoff +=
+		get_random_u32_inclusive(1, sbi->max_fragment_hole);
+}
+
 void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 		block_t old_blkaddr, block_t *new_blkaddr,
 		struct f2fs_summary *sum, int type,
@@ -3245,8 +3238,13 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 	f2fs_wait_discard_bio(sbi, *new_blkaddr);
 
 	curseg->sum_blk->entries[curseg->next_blkoff] = *sum;
-	__refresh_next_blkoff(sbi, curseg);
-
+	if (curseg->alloc_type == SSR) {
+		curseg->next_blkoff = f2fs_find_next_ssr_block(sbi, curseg);
+	} else {
+		curseg->next_blkoff++;
+		if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK)
+			f2fs_randomize_chunk(sbi, curseg);
+	}
 	stat_inc_block_count(sbi, curseg);
 
 	if (from_gc) {
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
