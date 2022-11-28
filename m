Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E89DD63A491
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:16:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozaFK-00016O-Lv;
	Mon, 28 Nov 2022 09:16:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+7f5f7765a4bd65a1d96c+7036+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ozaFF-00015U-Id for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:16:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wncb9XySw5yox+wPe4xShlxIz5ToZSv81+OAy6HrZ/I=; b=Gqsom1p2NA/c79xbeYwZ+bosWF
 lW67JQXEjoNlqICwjqEWNaCcBqwwROLrMDQgYP0fCVDo+XeY5HDoO3q8CORvRkYWrKLfPUkAQYYBd
 wOcMBLdTpT6j+wDH2PfANYW51pj87q36oXXbFNjrQrfeF1MFK1oBBqaK9W2JHWLI3d+I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wncb9XySw5yox+wPe4xShlxIz5ToZSv81+OAy6HrZ/I=; b=ex7p+pgpev2LaamAsXihdbQYsY
 DYOO2AZT4o8Mq2q4Fl9D9mAvdNAnhAsS+gKhsHIqw7S1xHfleC9tGjr8XPmJ/gJxq4KtP/QNw+pcG
 8mN7uzKqhuqWXymnwQFWpf6UuqICKD+wy+xTpIuPb7L4EZapycNskSWjzW7hP9wyjQVU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozaFE-00058i-ON for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:16:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=wncb9XySw5yox+wPe4xShlxIz5ToZSv81+OAy6HrZ/I=; b=F5uw5sCexBhaq4U5t85AkGaS+P
 2Xi3J1/EaH3H8A3wek7KF3VcqvPHvG90W+YtV165WH/zk0dli02hFJK4iBiZOoFA6X55wl2+ljLlz
 a6rZhvASXhZXdKWGJdiQAlXms2VFi+K4ccIqowWR5+/bdGM3Qm12VZVOPgdFJj0Tlw2yLWCzM2Ewm
 SPXIjlpOwrpch8XF+KqconzKsQldg5LwrqMSPkJ6mGDz4z2Q6c5eI0x5QfyEbteVKlq5FZhAvZUqp
 b9DeG/J6N+Ufe0JA1W/CaPYgClwIU4JopuBoLQy8+m+YwTpD5XL+rvhhRYczabxLlo2htordc6Obo
 27kp8n6g==;
Received: from [2001:4bb8:192:26e7:4739:fc09:43a5:2665] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ozaF8-000Z29-TJ; Mon, 28 Nov 2022 09:16:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 10:15:21 +0100
Message-Id: <20221128091523.1242584-14-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221128091523.1242584-1-hch@lst.de>
References: <20221128091523.1242584-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add a helper to deal with everything needed to return a
 f2fs_map_blocks
 structure based on a lookup in the extent cache. Signed-off-by: Christoph
 Hellwig <hch@lst.de> --- fs/f2fs/data.c | 62 +++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+), 24 deletions(-) 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ozaFE-00058i-ON
Subject: [f2fs-dev] [PATCH 13/15] f2fs: factor a f2f_map_blocks_cached helper
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

Add a helper to deal with everything needed to return a f2fs_map_blocks
structure based on a lookup in the extent cache.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/data.c | 62 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 24 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 730b58ba97c0ae..f6124cedd121a2 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1449,6 +1449,41 @@ int f2fs_get_block_locked(struct dnode_of_data *dn, pgoff_t index)
 	return err;
 }
 
+static bool f2fs_map_blocks_cached(struct inode *inode,
+		struct f2fs_map_blocks *map, int flag)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	unsigned int maxblocks = map->m_len;
+	pgoff_t pgoff = (pgoff_t)map->m_lblk;
+	struct extent_info ei = {};
+
+	if (!f2fs_lookup_extent_cache(inode, pgoff, &ei))
+		return false;
+
+	map->m_pblk = ei.blk + pgoff - ei.fofs;
+	map->m_len = min((pgoff_t)maxblocks, ei.fofs + ei.len - pgoff);
+	map->m_flags = F2FS_MAP_MAPPED;
+	if (map->m_next_extent)
+		*map->m_next_extent = pgoff + map->m_len;
+
+	/* for hardware encryption, but to avoid potential issue in future */
+	if (flag == F2FS_GET_BLOCK_DIO)
+		f2fs_wait_on_block_writeback_range(inode,
+					map->m_pblk, map->m_len);
+
+	if (f2fs_allow_multi_device_dio(sbi, flag)) {
+		int bidx = f2fs_target_device_index(sbi, map->m_pblk);
+		struct f2fs_dev_info *dev = &sbi->devs[bidx];
+
+		map->m_bdev = dev->bdev;
+		map->m_pblk -= dev->start_blk;
+		map->m_len = min(map->m_len, dev->end_blk + 1 - map->m_pblk);
+	} else {
+		map->m_bdev = inode->i_sb->s_bdev;
+	}
+	return true;
+}
+
 /*
  * f2fs_map_blocks() tries to find or build mapping relationship which
  * maps continuous logical blocks to physical blocks, and return such
@@ -1464,7 +1499,6 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	int err = 0, ofs = 1;
 	unsigned int ofs_in_node, last_ofs_in_node;
 	blkcnt_t prealloc;
-	struct extent_info ei = {0, };
 	block_t blkaddr;
 	unsigned int start_pgofs;
 	int bidx = 0;
@@ -1472,6 +1506,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	if (!maxblocks)
 		return 0;
 
+	if (!map->m_may_create && f2fs_map_blocks_cached(inode, map, flag))
+		goto out;
+
 	map->m_bdev = inode->i_sb->s_bdev;
 	map->m_multidev_dio =
 		f2fs_allow_multi_device_dio(F2FS_I_SB(inode), flag);
@@ -1483,29 +1520,6 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	pgofs =	(pgoff_t)map->m_lblk;
 	end = pgofs + maxblocks;
 
-	if (!map->m_may_create && f2fs_lookup_extent_cache(inode, pgofs, &ei)) {
-		map->m_pblk = ei.blk + pgofs - ei.fofs;
-		map->m_len = min((pgoff_t)maxblocks, ei.fofs + ei.len - pgofs);
-		map->m_flags = F2FS_MAP_MAPPED;
-		if (map->m_next_extent)
-			*map->m_next_extent = pgofs + map->m_len;
-
-		/* for hardware encryption, but to avoid potential issue in future */
-		if (flag == F2FS_GET_BLOCK_DIO)
-			f2fs_wait_on_block_writeback_range(inode,
-						map->m_pblk, map->m_len);
-
-		if (map->m_multidev_dio) {
-			bidx = f2fs_target_device_index(sbi, map->m_pblk);
-
-			map->m_bdev = FDEV(bidx).bdev;
-			map->m_pblk -= FDEV(bidx).start_blk;
-			map->m_len = min(map->m_len,
-				FDEV(bidx).end_blk + 1 - map->m_pblk);
-		}
-		goto out;
-	}
-
 next_dnode:
 	if (map->m_may_create)
 		f2fs_map_lock(sbi, flag);
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
