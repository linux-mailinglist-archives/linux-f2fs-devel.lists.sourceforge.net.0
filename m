Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E71DE63A494
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:16:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozaFM-0005V4-Lu;
	Mon, 28 Nov 2022 09:16:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+7f5f7765a4bd65a1d96c+7036+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ozaFH-0005SR-VD for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T1+WexSPAThEq+r2pi4MJLHBKqvu2sSgqCXKpDR6P1I=; b=mh/zHYluAlV1GA9fjX9uRgKuZg
 8wlUrJOyTLeobu+ddwiXbSwEGa9ILKQdKvO+QE7cb9FrEKeZ70nvB6g/9oY2h8hWHZELg5ROC589X
 GK2PBtc74Zf7NJoaHbAw4lo9mdrHHHBSrV0WbMZIvNYgu7jCPy5r/jQ5WCPb7+q75zEU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T1+WexSPAThEq+r2pi4MJLHBKqvu2sSgqCXKpDR6P1I=; b=fQEoNYFpuOtiFnBQnpmCeViPlL
 BnWTHf+8wRjye0ph040kQBMVTWwSBZofZb5aTSNEcUoibmDghq9QOlq2/4r/v4KD3vDEEaEKjNmsV
 o2cRs7mg0ixdZ2IAtYrxE8kAUrmIm7K2G/PmRixAJhwl2lPZWyBOmCyfv4vJyTPFGWec=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozaFH-00058m-Dv for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=T1+WexSPAThEq+r2pi4MJLHBKqvu2sSgqCXKpDR6P1I=; b=CoSBxyX9ZP1gVyL55PvCYRDkKJ
 Kfo960LTOdaTRX3NKXxqfEllgmeVD8oAEa/DzGdd7uQJ6hBYDvKD+PQBtRUWK7r0CbTm/HJ8F0VB1
 Fvvhu6j5mKdLN0WWLrDbredfrW8dRWV3Ahql8EVhXaOpjUfC9qiwckMSlxfz0RFhPRo/LMV4OtVxt
 jDDuwUDEox2E/PCDxMV7rpY2zaiJjRPRdphvV08v7HaQYj9hcTFFuWRuPtxhmkENpngdWKPa4tbCO
 z3kaeLOKAZKmMywF/8+1cIfVtBMiPct0lUdoFpmwBw4vH4jjwys2xrQEH8ba89gzCQpjwjzGvSxRY
 TtAgYc0g==;
Received: from [2001:4bb8:192:26e7:4739:fc09:43a5:2665] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ozaFB-000Z3D-KE; Mon, 28 Nov 2022 09:16:06 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 10:15:22 +0100
Message-Id: <20221128091523.1242584-15-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221128091523.1242584-1-hch@lst.de>
References: <20221128091523.1242584-1-hch@lst.de>
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
 Content preview: Factor out a helper to return a hole when no dnode was found.
 Signed-off-by: Christoph Hellwig <hch@lst.de> --- fs/f2fs/data.c | 47
 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+), 23 deletions(-) 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1ozaFH-00058m-Dv
Subject: [f2fs-dev] [PATCH 14/15] f2fs: factor out a f2fs_map_no_dnode
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

Factor out a helper to return a hole when no dnode was found.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/data.c | 47 ++++++++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f6124cedd121a2..3c802ce397de52 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1449,6 +1449,28 @@ int f2fs_get_block_locked(struct dnode_of_data *dn, pgoff_t index)
 	return err;
 }
 
+static int f2fs_map_no_dnode(struct inode *inode,
+		struct f2fs_map_blocks *map, struct dnode_of_data *dn,
+		pgoff_t pgoff)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+
+	/*
+	 * There is one exceptional case that read_node_page() may return
+	 * -ENOENT due to filesystem has been shutdown or cp_error, return
+	 * -EIO in that case.
+	 */
+	if (map->m_may_create &&
+	    (is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN) || f2fs_cp_error(sbi)))
+		return -EIO;
+
+	if (map->m_next_pgofs)
+		*map->m_next_pgofs = f2fs_get_next_page_offset(dn, pgoff);
+	if (map->m_next_extent)
+		*map->m_next_extent = f2fs_get_next_page_offset(dn, pgoff);
+	return 0;
+}
+
 static bool f2fs_map_blocks_cached(struct inode *inode,
 		struct f2fs_map_blocks *map, int flag)
 {
@@ -1530,29 +1552,8 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	if (err) {
 		if (flag == F2FS_GET_BLOCK_BMAP)
 			map->m_pblk = 0;
-
-		if (err == -ENOENT) {
-			/*
-			 * There is one exceptional case that read_node_page()
-			 * may return -ENOENT due to filesystem has been
-			 * shutdown or cp_error, so force to convert error
-			 * number to EIO for such case.
-			 */
-			if (map->m_may_create &&
-				(is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN) ||
-				f2fs_cp_error(sbi))) {
-				err = -EIO;
-				goto unlock_out;
-			}
-
-			err = 0;
-			if (map->m_next_pgofs)
-				*map->m_next_pgofs =
-					f2fs_get_next_page_offset(&dn, pgofs);
-			if (map->m_next_extent)
-				*map->m_next_extent =
-					f2fs_get_next_page_offset(&dn, pgofs);
-		}
+		if (err == -ENOENT)
+			err = f2fs_map_no_dnode(inode, map, &dn, pgofs);
 		goto unlock_out;
 	}
 
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
