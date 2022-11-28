Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE8F63A496
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:16:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozaFO-00082U-ED;
	Mon, 28 Nov 2022 09:16:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+7f5f7765a4bd65a1d96c+7036+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ozaF8-00081B-HF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:16:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mo35tAxXmMMRiAoVdJV0xt8CeHxRi5H5ytU1aFMmHN8=; b=ICgDlMzZ+JjOSNkEtVDDSLs7Ct
 tg0KRON+TeGbnHkErsJNS9VIn1w/mARGqEpUB1JVmDj8sKHHxn9lxa4ze806TxbWnf61wWcTGII9T
 X0v16vR25ehVDE1mN/eiw+FHHj1bPGl3A0Uc1AF3wi39dC+W0no2GBeRex1tOahYr6aY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mo35tAxXmMMRiAoVdJV0xt8CeHxRi5H5ytU1aFMmHN8=; b=WhfDuNZm/OQ3ml45Upr4Jlh13v
 cfISlD75rmQYTL9nv8mxUsfWrBq72r15VFzWfFTe3lkW/LFkxmjXR5/gZ6myEJkz9wQiaGuUYM7Jj
 P/bMazMsmfymRjjXdJzVaGDiF9iDo9b0TJ67aIgHvSxfxjZBRizdYpM+DtEdn5Yzcg00=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozaEy-00057O-JY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=mo35tAxXmMMRiAoVdJV0xt8CeHxRi5H5ytU1aFMmHN8=; b=SmPeLFcY8KJlsJib1Qw5v8098G
 fpiLus8UjYALYTs6NsMFFL6FMnQjjp5gqVBZ1leH4aCYY/lF6A/tqQMPOv9dlTWgnBSk7f/Xt5Tfn
 9rAc983QHeAWrRbLaR77QO1OBcvq8zDe1VXpKvzZiWmzaSifvi0rGvyrYpcuJ0msXQP3xzvgHyrzp
 mDrL1yhIEXuOLP3zXl8DdmvQo6MTndfpnuurESl/9zyWakZJZPWbdi08kjH0xDmjECLelaFxiSRlE
 bfs/2jk3u0bb9BrmHpQBHfxt7im8UkMN2SzZqN9C6uEyF+sCN9rIcHfKII7GcMC6JvrLNQpNoz1Yt
 cFDh+oYg==;
Received: from [2001:4bb8:192:26e7:4739:fc09:43a5:2665] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ozaEs-000Ytu-NS; Mon, 28 Nov 2022 09:15:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 10:15:15 +0100
Message-Id: <20221128091523.1242584-8-hch@lst.de>
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
 Content preview: This allows to keep the f2fs_do_map_lock based locking scheme
 private to data.c. Signed-off-by: Christoph Hellwig <hch@lst.de> ---
 fs/f2fs/data.c
 | 16 ++++++++++++++-- fs/f2fs/f2fs.h | 3 +-- fs/f2fs/file.c | 4 +--- 3 files
 changed, 16 insertions(+), 7 deletions(-) 
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
X-Headers-End: 1ozaEy-00057O-JY
Subject: [f2fs-dev] [PATCH 07/15] f2fs: add a f2fs_get_block_locked helper
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

This allows to keep the f2fs_do_map_lock based locking scheme
private to data.c.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/data.c | 16 ++++++++++++++--
 fs/f2fs/f2fs.h |  3 +--
 fs/f2fs/file.c |  4 +---
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a294a589ba1a91..6df80a30df263c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1197,7 +1197,7 @@ int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index)
 	return err;
 }
 
-int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index)
+static int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index)
 {
 	if (f2fs_lookup_extent_cache_block(dn->inode, index, &dn->data_blkaddr))
 		return 0;
@@ -1427,7 +1427,7 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
 	return 0;
 }
 
-void f2fs_do_map_lock(struct f2fs_sb_info *sbi, int flag, bool lock)
+static void f2fs_do_map_lock(struct f2fs_sb_info *sbi, int flag, bool lock)
 {
 	if (flag == F2FS_GET_BLOCK_PRE_AIO) {
 		if (lock)
@@ -1442,6 +1442,18 @@ void f2fs_do_map_lock(struct f2fs_sb_info *sbi, int flag, bool lock)
 	}
 }
 
+int f2fs_get_block_locked(struct dnode_of_data *dn, pgoff_t index)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
+	int err;
+
+	f2fs_do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, true);
+	err = f2fs_get_block(dn, index);
+	f2fs_do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, false);
+
+	return err;
+}
+
 /*
  * f2fs_map_blocks() tries to find or build mapping relationship which
  * maps continuous logical blocks to physical blocks, and return such
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c0a1a987889167..a3789dab0aade9 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3791,7 +3791,7 @@ void f2fs_set_data_blkaddr(struct dnode_of_data *dn);
 void f2fs_update_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
 int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count);
 int f2fs_reserve_new_block(struct dnode_of_data *dn);
-int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index);
+int f2fs_get_block_locked(struct dnode_of_data *dn, pgoff_t index);
 int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index);
 struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 			blk_opf_t op_flags, bool for_write);
@@ -3801,7 +3801,6 @@ struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
 struct page *f2fs_get_new_data_page(struct inode *inode,
 			struct page *ipage, pgoff_t index, bool new_i_size);
 int f2fs_do_write_data_page(struct f2fs_io_info *fio);
-void f2fs_do_map_lock(struct f2fs_sb_info *sbi, int flag, bool lock);
 int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 			int create, int flag);
 int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 82cda12582272a..cbeb7bd880046e 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -113,10 +113,8 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 
 	if (need_alloc) {
 		/* block allocation */
-		f2fs_do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, true);
 		set_new_dnode(&dn, inode, NULL, NULL, 0);
-		err = f2fs_get_block(&dn, page->index);
-		f2fs_do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, false);
+		err = f2fs_get_block_locked(&dn, page->index);
 	}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
