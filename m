Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9E563A492
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:16:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozaFK-000165-AU;
	Mon, 28 Nov 2022 09:16:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+7f5f7765a4bd65a1d96c+7036+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ozaFE-00014q-Eu for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JjIPB8OS2ZjH3/FD3xDCz5HuniRBrPuSgdJYbMn14HA=; b=hITmsZDuDn1YIc/aB51MNazI+1
 qFT0z9kf5vNhpMAdezvBiPcpXs+ZaeKjrtlg70bWFWZuVngHplhzSz/nj4Out0w7d61i5+LfD3NnA
 J8UD2bC96Q/+ikocVU09hTViRqS7PZTKZ9lMJx2S+uyV0b1Joo5p7zhEEmvFO57Cnxek=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JjIPB8OS2ZjH3/FD3xDCz5HuniRBrPuSgdJYbMn14HA=; b=gqFYqbRVHcSe5KjnSqKPJO9OeL
 xOwr0MV/mzAHzuxBDjPpuEpqD06B768EHLF07MXFhLDyDwCBenkJJ/PipKSda5Nptx5WFSa73iwQv
 9XAjWAht2pYsiWidfeMVL+14u9F6v0jDh6NlwuOYFdoIVS9S65uT6cnkpjeCGAczt3pI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozaF1-00057S-8Y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:15:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=JjIPB8OS2ZjH3/FD3xDCz5HuniRBrPuSgdJYbMn14HA=; b=bG848rcPSe90P8oN1OeCa9LZUo
 z6OyGg90KRiorNXDe+38paqjIg79eRYkfOSjTskmsLaV9ypqCTqnkUUxT1i8IagoRTw6F8EJF08Bc
 3zcF3YVvtQgl30VQgeV2g/JZ9PZlEtcPThAOVbGlzK73coA/njR3/mAb4g/SUnQVJ6mHcnxvybuKn
 zIDyU/Qb7At7pRcYyX/rKofzXZoRzIMZJCFK39s5nOjRpjQEHwKAtFcoj90kZrlr3h6k2YFby9og8
 1EZ1hCdhwyNMW9aimPj7r+VTyYQnqeuaXBFa1qW30aHwodnl+5O6nPJPZu5zdi3vK6pshuM1aLDV0
 xlg6AvgQ==;
Received: from [2001:4bb8:192:26e7:4739:fc09:43a5:2665] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ozaEv-000Yv4-EY; Mon, 28 Nov 2022 09:15:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 10:15:16 +0100
Message-Id: <20221128091523.1242584-9-hch@lst.de>
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
 Content preview: Split f2fs_do_map_lock into a lock and unlock helper to make
 the code using it easier to read. Signed-off-by: Christoph Hellwig
 <hch@lst.de>
 --- fs/f2fs/data.c | 46 +++++++++++++++++++++++ 1 file changed,
 23 insertions(+), 23 deletions(-) 
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
X-Headers-End: 1ozaF1-00057S-8Y
Subject: [f2fs-dev] [PATCH 08/15] f2fs: f2fs_do_map_lock
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

Split f2fs_do_map_lock into a lock and unlock helper to make the code
using it easier to read.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/data.c | 46 +++++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6df80a30df263c..b7c8e3e0113aff 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1427,19 +1427,20 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
 	return 0;
 }
 
-static void f2fs_do_map_lock(struct f2fs_sb_info *sbi, int flag, bool lock)
+static void f2fs_map_lock(struct f2fs_sb_info *sbi, int flag)
 {
-	if (flag == F2FS_GET_BLOCK_PRE_AIO) {
-		if (lock)
-			f2fs_down_read(&sbi->node_change);
-		else
-			f2fs_up_read(&sbi->node_change);
-	} else {
-		if (lock)
-			f2fs_lock_op(sbi);
-		else
-			f2fs_unlock_op(sbi);
-	}
+	if (flag == F2FS_GET_BLOCK_PRE_AIO)
+		f2fs_down_read(&sbi->node_change);
+	else
+		f2fs_lock_op(sbi);
+}
+
+static void f2fs_map_unlock(struct f2fs_sb_info *sbi, int flag)
+{
+	if (flag == F2FS_GET_BLOCK_PRE_AIO)
+		f2fs_up_read(&sbi->node_change);
+	else
+		f2fs_unlock_op(sbi);
 }
 
 int f2fs_get_block_locked(struct dnode_of_data *dn, pgoff_t index)
@@ -1447,9 +1448,9 @@ int f2fs_get_block_locked(struct dnode_of_data *dn, pgoff_t index)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
 	int err;
 
-	f2fs_do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, true);
+	f2fs_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO);
 	err = f2fs_get_block(dn, index);
-	f2fs_do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, false);
+	f2fs_map_unlock(sbi, F2FS_GET_BLOCK_PRE_AIO);
 
 	return err;
 }
@@ -1524,7 +1525,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 
 next_dnode:
 	if (map->m_may_create)
-		f2fs_do_map_lock(sbi, flag, true);
+		f2fs_map_lock(sbi, flag);
 
 	/* When reading holes, we need its node page */
 	set_new_dnode(&dn, inode, NULL, NULL, 0);
@@ -1708,7 +1709,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 	f2fs_put_dnode(&dn);
 
 	if (map->m_may_create) {
-		f2fs_do_map_lock(sbi, flag, false);
+		f2fs_map_unlock(sbi, flag);
 		f2fs_balance_fs(sbi, dn.node_changed);
 	}
 	goto next_dnode;
@@ -1754,7 +1755,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 	f2fs_put_dnode(&dn);
 unlock_out:
 	if (map->m_may_create) {
-		f2fs_do_map_lock(sbi, flag, false);
+		f2fs_map_unlock(sbi, flag);
 		f2fs_balance_fs(sbi, dn.node_changed);
 	}
 out:
@@ -3330,7 +3331,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 
 	if (f2fs_has_inline_data(inode) ||
 			(pos & PAGE_MASK) >= i_size_read(inode)) {
-		f2fs_do_map_lock(sbi, flag, true);
+		f2fs_map_lock(sbi, flag);
 		locked = true;
 	}
 
@@ -3366,8 +3367,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 			err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
 			if (err || dn.data_blkaddr == NULL_ADDR) {
 				f2fs_put_dnode(&dn);
-				f2fs_do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO,
-								true);
+				f2fs_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO);
 				WARN_ON(flag != F2FS_GET_BLOCK_PRE_AIO);
 				locked = true;
 				goto restart;
@@ -3382,7 +3382,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 	f2fs_put_dnode(&dn);
 unlock_out:
 	if (locked)
-		f2fs_do_map_lock(sbi, flag, false);
+		f2fs_map_unlock(sbi, flag);
 	return err;
 }
 
@@ -3420,7 +3420,7 @@ static int __reserve_data_block(struct inode *inode, pgoff_t index,
 	struct page *ipage;
 	int err = 0;
 
-	f2fs_do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, true);
+	f2fs_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO);
 
 	ipage = f2fs_get_node_page(sbi, inode->i_ino);
 	if (IS_ERR(ipage)) {
@@ -3436,7 +3436,7 @@ static int __reserve_data_block(struct inode *inode, pgoff_t index,
 	f2fs_put_dnode(&dn);
 
 unlock_out:
-	f2fs_do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, false);
+	f2fs_map_unlock(sbi, F2FS_GET_BLOCK_PRE_AIO);
 	return err;
 }
 
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
