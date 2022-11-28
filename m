Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE2063A495
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:16:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozaFN-00082H-Vu;
	Mon, 28 Nov 2022 09:16:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+7f5f7765a4bd65a1d96c+7036+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ozaEs-00080z-K5 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:15:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oNsahFLP6ZLdRPsKJMzTkFrcg4Ha2SdvX5yPiFkHY5Q=; b=NFRZv+FlKF4EB4pkPPmvrPKf9m
 g9FtnH25LWWBdPkb7EwXZ2xZ3f0qFCrjaz1qGm5hhlIsgQNVxyXgv2IRaXEV54tNH2/dzESf7R+tT
 NRqs0WLFcVUjzwxz2JdIHFx9nvIJvW+FDmDBUjJkbMM9eDVDLLHmnw1hJhcCYvCXM4nk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oNsahFLP6ZLdRPsKJMzTkFrcg4Ha2SdvX5yPiFkHY5Q=; b=M/SAhENvXuNebGiDyv8nh9q/v1
 Ffyecyg7K/Rdu5iQYM1cuOgWdLN3oRFWK3UMGclEOd70+Z7BiccWz1vxl8/FVtyq2z9FH3K5Gr5PO
 8/Ck3sF18+a5QBP5fBxze441kgeVt7DyqomM76GbPDXApwwju5eCXEx68akYzQg9roE4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozaEn-000567-Ey for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:15:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=oNsahFLP6ZLdRPsKJMzTkFrcg4Ha2SdvX5yPiFkHY5Q=; b=xwwV6uO4+bcOfcj8fMgj+0WKnu
 mXL6Yngm1T4Yg8O02PKT60tGoW37UxQY5M31LvPYBI5qL4WIkgbGUfyIhn1P7CRxJIsMnl0JHvlFv
 ttdDEbbfD2FO+q6g9p1yusIYqz0gM6L0FU1mQ+GKtMJki1sYn43E7zPebNeQ9o9pZR7z7VALg8DF8
 98P/crT/l3GPitNWlbooIfTQMLW7+91GGSrxgHCdBbb4CWFLJpowjPVfV/UpEtUx1j5E3aSISHfJr
 yFN0t85ee5cPgEqbnW4nX4SyT75w7eqcLP5Suy92sCxbZK8fUBvGncAHtexosMXYd8GWXDzk/jlg5
 kByuBGyg==;
Received: from [2001:4bb8:192:26e7:4739:fc09:43a5:2665] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ozaEb-000YiU-Tx; Mon, 28 Nov 2022 09:15:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 10:15:09 +0100
Message-Id: <20221128091523.1242584-2-hch@lst.de>
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
 Content preview: When testing with a mixed zoned / convention device
 combination, 
 there are regular but not 100% reproducible failures in xfstests generic/113
 where the __is_valid_data_blkaddr assert hits due to findi [...] 
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
X-Headers-End: 1ozaEn-000567-Ey
Subject: [f2fs-dev] [PATCH 01/15] f2fs: don't rely on F2FS_MAP_* in
 f2fs_iomap_begin
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

When testing with a mixed zoned / convention device combination, there
are regular but not 100% reproducible failures in xfstests generic/113
where the __is_valid_data_blkaddr assert hits due to finding a hole.

This seems to be because f2fs_map_blocks can set this flag on a hole
when it was found in the extent cache.

Rework f2fs_iomap_begin to just check the special block numbers directly.
This has the added benefits of the WARN_ON showing which invalid block
address we found, and being properly error out on delalloc blocks that
are confusingly called unwritten but not actually suitable for direct
I/O.

Fixes: 1517c1a7a445 ("f2fs: implement iomap operations")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/data.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a71e818cd67b43..541d625d94be42 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4134,20 +4134,24 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	 */
 	map.m_len = fscrypt_limit_io_blocks(inode, map.m_lblk, map.m_len);
 
-	if (map.m_flags & (F2FS_MAP_MAPPED | F2FS_MAP_UNWRITTEN)) {
-		iomap->length = blks_to_bytes(inode, map.m_len);
-		if (map.m_flags & F2FS_MAP_MAPPED) {
-			iomap->type = IOMAP_MAPPED;
-			iomap->flags |= IOMAP_F_MERGED;
-		} else {
-			iomap->type = IOMAP_UNWRITTEN;
-		}
-		if (WARN_ON_ONCE(!__is_valid_data_blkaddr(map.m_pblk)))
-			return -EINVAL;
+	/*
+	 * We should never see delalloc or compressed extents here based on
+	 * prior flushing and checks.
+	 */
+	if (WARN_ON_ONCE(map.m_pblk == NEW_ADDR))
+		return -EINVAL;
+	if (WARN_ON_ONCE(map.m_pblk == COMPRESS_ADDR))
+		return -EINVAL;
 
+	if (map.m_pblk != NULL_ADDR) {
+		iomap->length = blks_to_bytes(inode, map.m_len);
+		iomap->type = IOMAP_MAPPED;
+		iomap->flags |= IOMAP_F_MERGED;
 		iomap->bdev = map.m_bdev;
 		iomap->addr = blks_to_bytes(inode, map.m_pblk);
 	} else {
+		if (flags & IOMAP_WRITE)
+			return -ENOTBLK;
 		iomap->length = blks_to_bytes(inode, next_pgofs) -
 				iomap->offset;
 		iomap->type = IOMAP_HOLE;
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
