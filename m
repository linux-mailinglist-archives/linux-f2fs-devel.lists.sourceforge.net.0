Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5234F63A490
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:16:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozaFK-0005TM-0y;
	Mon, 28 Nov 2022 09:16:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+7f5f7765a4bd65a1d96c+7036+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ozaFE-0005RC-Es for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dtCCzHx/c0oUdOA5cXbXNMtaaYWRPB+/FOsUkUcZjxs=; b=MjXQMOMZyk//aSPXo52OZLzm8M
 QFuUI9ORESzoq6ZYoFhWq+BPeFvx+KcqmLtStKzhouGU6iPbvz9vZxWE/bqB/LPLRl5mdUvMkgNUI
 qKABexDiyfztBOiksujSR77buYnD9WoJJjkLwp/R8ByqXN3VqudDn5RUsuuXYjsJjPwI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dtCCzHx/c0oUdOA5cXbXNMtaaYWRPB+/FOsUkUcZjxs=; b=I67pok/7+5Pr85OPdGDf+AKHcp
 7Iyv8MDgtt/qtFCi0FGBr+1riGH0R5Yg5WpyP7ZnN0nDsxroqPrcrLPJaqB5I3anlisxibD4Txpj/
 rwT2i8DhX1C8T+a4ESfrJcu7exHfH9wDIcO4pCxiRzHkEGjWd2Pr+2eYwNCmAKiw3kww=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozaF9-00GRSC-A4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=dtCCzHx/c0oUdOA5cXbXNMtaaYWRPB+/FOsUkUcZjxs=; b=0h6XVBmutpR2Boui+xJQcur29U
 BOdO6hd7LI/GeyAUIii9ofXGiQcUuCTApKeKbaaHvdtREAX/2ZDYOA3rvrInp1U2ioDs03uoJ40XV
 93V+5J9OO9yZwuqAAyGSBwmivPCu02CZb3TYKrVE58jd8mRXbMvf28oh94qTwyuSGsRo7bietOP+9
 QkvRX9pGPguTprPE7FZzIeCc57zYzMIezfS7ALTj35fCpWWdIw/TVZ/R53rSDmkdJ33/O0AO46dKi
 /YSD5mGqdz6oo5Xy6ECwEQooDngt+dyI7K6PrNWoayMa013g4iNZxHbQhncWzUgAf3mjb1kEtdOrh
 4pw+DtWg==;
Received: from [2001:4bb8:192:26e7:4739:fc09:43a5:2665] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ozaF3-000Yzm-Fq; Mon, 28 Nov 2022 09:15:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 10:15:19 +0100
Message-Id: <20221128091523.1242584-12-hch@lst.de>
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
 Content preview: Fold f2fs_get_block into the two remaining callers to
 simplify
 the call chain a bit. Signed-off-by: Christoph Hellwig <hch@lst.de> ---
 fs/f2fs/data.c
 | 16 ++++++ 1 file changed, 6 insertions(+), 10 deletions(-) 
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
X-Headers-End: 1ozaF9-00GRSC-A4
Subject: [f2fs-dev] [PATCH 11/15] f2fs: remove f2fs_get_block
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

Fold f2fs_get_block into the two remaining callers to simplify the
call chain a bit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/data.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 87c17602a3fdd4..2ae8fcf7cf49f4 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1197,13 +1197,6 @@ int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index)
 	return err;
 }
 
-static int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index)
-{
-	if (f2fs_lookup_extent_cache_block(dn->inode, index, &dn->data_blkaddr))
-		return 0;
-	return f2fs_reserve_block(dn, index);
-}
-
 struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 				     blk_opf_t op_flags, bool for_write)
 {
@@ -1445,10 +1438,12 @@ static void f2fs_map_unlock(struct f2fs_sb_info *sbi, int flag)
 int f2fs_get_block_locked(struct dnode_of_data *dn, pgoff_t index)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
-	int err;
+	int err = 0;
 
 	f2fs_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO);
-	err = f2fs_get_block(dn, index);
+	if (!f2fs_lookup_extent_cache_block(dn->inode, index,
+					    &dn->data_blkaddr))
+		err = f2fs_reserve_block(dn, index);
 	f2fs_map_unlock(sbi, F2FS_GET_BLOCK_PRE_AIO);
 
 	return err;
@@ -3427,7 +3422,8 @@ static int __reserve_data_block(struct inode *inode, pgoff_t index,
 	}
 	set_new_dnode(&dn, inode, ipage, ipage, 0);
 
-	err = f2fs_get_block(&dn, index);
+	if (!f2fs_lookup_extent_cache_block(inode, index, &dn.data_blkaddr))
+		err = f2fs_reserve_block(&dn, index);
 
 	*blk_addr = dn.data_blkaddr;
 	*node_changed = dn.node_changed;
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
