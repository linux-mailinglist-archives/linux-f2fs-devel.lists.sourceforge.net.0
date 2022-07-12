Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CBF571F18
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Jul 2022 17:27:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oBHmx-0004tu-EP; Tue, 12 Jul 2022 15:27:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oBHmw-0004to-Ap
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jul 2022 15:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i67mJ2Jn8nRjzTYSJX8Chvh2Qlv30ugkXF4dZMbWlz8=; b=jQ0+HjxTPL9IdJnvDlkl5SxgW8
 AAFZhdS5AMmNbRVEjBtGQosSBvdtHsc2ytU5sfQT32oUMUst9yd+o9vG99G8mfCBAqWHfRzzIQCZd
 oQNbOdbxMHP1t9fSheSegRGBl7otvS+4g5lzQFgZ3RjUUBZatbwixCPBFVksTGHOW7N4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=i67mJ2Jn8nRjzTYSJX8Chvh2Qlv30ugkXF4dZMbWlz8=; b=K
 ulRXoXfHCbN2CVtH0DLjBmLW4TtzK1T/Wj0sYjwKLVqLbZSiV3guB+ToZ78iT48Eap/3oQn8TTdp8
 GdOKMAAL1nMipXKIonNxCMLFOL82yWW9y/BdRkfemqF0JZTCOCtMlvhkyMnHz1LZtLIsQU2zFHohk
 5SqefvIsMl393S3E=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oBHmw-00011z-CL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jul 2022 15:27:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 30B6E616D1;
 Tue, 12 Jul 2022 15:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B5C8C3411C;
 Tue, 12 Jul 2022 15:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657639611;
 bh=47AE1yhhBTrAxEd2qCdPE3/6spXztbOG8ZtTMXmH9FY=;
 h=From:To:Cc:Subject:Date:From;
 b=dOjZ3+ralCttvgDSBN9svWCIhPUiwYEf92ook7K+/VCDdDqVlccOuxGrNBLK4wbWY
 E36W10FplCKhJX33rn0Pd1RGoa1Hyup6UpXZOyI6C3BNz42go+ypcUt+wnskBIsKcX
 NPR7duHOvitSk4Fqbigkfshf0wa0V3hsr9alMGvSTXWhBVEptqddkNK3bXI2z1MXHd
 lEig/gTbjXIcjzMv17tsQtkbaMZWRaRh7IyB+bWJ5xy/x+/oFM4ytiPc6Ikefs3Jql
 0H/11ar8R2MILvTUVvzVkJZEfoVH2LVcTHPSSQn9mr3HtHnT/7zLK/VQmou+Wxsy2z
 37TW1KvkVOi4A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 12 Jul 2022 23:26:43 +0800
Message-Id: <20220712152643.4018-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  After commit e3b49ea36802 ("f2fs: invalidate META_MAPPING
 before IPU/DIO write"), invalidate_mapping_pages() will be called to avoid
 race condition in between IPU/DIO and readahead for GC. However, readahead
 flow is only used for post_read required inode, so this patch adds check
 condition to avoids unnecessary page cache invalidating for non-post_read
 inode. Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oBHmw-00011z-CL
Subject: [f2fs-dev] [PATCH] f2fs: invalidate meta pages only for post_read
 required inode
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

After commit e3b49ea36802 ("f2fs: invalidate META_MAPPING before
IPU/DIO write"), invalidate_mapping_pages() will be called to
avoid race condition in between IPU/DIO and readahead for GC.

However, readahead flow is only used for post_read required inode,
so this patch adds check condition to avoids unnecessary page cache
invalidating for non-post_read inode.

Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
 fs/f2fs/data.c    | 8 ++------
 fs/f2fs/f2fs.h    | 1 +
 fs/f2fs/segment.c | 9 ++++++++-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 2d027505d5f6..a54b91b3a8d4 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1479,12 +1479,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 			*map->m_next_extent = pgofs + map->m_len;
 
 		/* for hardware encryption, but to avoid potential issue in future */
-		if (flag == F2FS_GET_BLOCK_DIO) {
+		if (flag == F2FS_GET_BLOCK_DIO)
 			f2fs_wait_on_block_writeback_range(inode,
 						map->m_pblk, map->m_len);
-			invalidate_mapping_pages(META_MAPPING(sbi),
-				map->m_pblk, map->m_pblk + map->m_len - 1);
-		}
 
 		if (map->m_multidev_dio) {
 			block_t blk_addr = map->m_pblk;
@@ -1700,8 +1697,6 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 		 */
 		f2fs_wait_on_block_writeback_range(inode,
 						map->m_pblk, map->m_len);
-		invalidate_mapping_pages(META_MAPPING(sbi),
-				map->m_pblk, map->m_pblk + map->m_len - 1);
 
 		if (map->m_multidev_dio) {
 			block_t blk_addr = map->m_pblk;
@@ -2749,6 +2744,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 		.submitted = false,
 		.compr_blocks = compr_blocks,
 		.need_lock = LOCK_RETRY,
+		.post_read = f2fs_post_read_required(inode),
 		.io_type = io_type,
 		.io_wbc = wbc,
 		.bio = bio,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1d97d06e0d87..87e96f612582 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1199,6 +1199,7 @@ struct f2fs_io_info {
 	bool retry;		/* need to reallocate block address */
 	int compr_blocks;	/* # of compressed block addresses */
 	bool encrypted;		/* indicate file is encrypted */
+	bool post_read;		/* require post read */
 	enum iostat_type io_type;	/* io type */
 	struct writeback_control *io_wbc; /* writeback control */
 	struct bio **bio;		/* bio for ipu */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index ce571c0d7126..12b0edc48f7b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3433,7 +3433,8 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 		goto drop_bio;
 	}
 
-	invalidate_mapping_pages(META_MAPPING(sbi),
+	if (fio->post_read)
+		invalidate_mapping_pages(META_MAPPING(sbi),
 				fio->new_blkaddr, fio->new_blkaddr);
 
 	stat_inc_inplace_blocks(fio->sbi);
@@ -3616,10 +3617,16 @@ void f2fs_wait_on_block_writeback(struct inode *inode, block_t blkaddr)
 void f2fs_wait_on_block_writeback_range(struct inode *inode, block_t blkaddr,
 								block_t len)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	block_t i;
 
+	if (!f2fs_post_read_required(inode))
+		return;
+
 	for (i = 0; i < len; i++)
 		f2fs_wait_on_block_writeback(inode, blkaddr + i);
+
+	invalidate_mapping_pages(META_MAPPING(sbi), blkaddr, blkaddr + len - 1);
 }
 
 static int read_compacted_summaries(struct f2fs_sb_info *sbi)
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
