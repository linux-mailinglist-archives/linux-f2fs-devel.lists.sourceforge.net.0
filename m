Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79946391336
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 May 2021 10:59:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1llpNx-0002ay-Ph; Wed, 26 May 2021 08:59:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1llpNw-0002ai-FD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 08:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=26osIkXKaIPeYGAIHmXS21DaWZDtmuqlUZqgrRir7QE=; b=lRGbYhDCzUgLzcSv0bbokmtIFt
 lJuhQtVqltjs/mt1rUlAPPqP5Uvzthm0/B3lk1IXDzsLImyFNCM9uUBwECtT5X8S5jsP6lkANHQep
 TYYr1Lkb2683UZLi7E15tB8i8CU6dybjeW/tDBnTXokSyGMZYnJLSBDDa+LzPtpQU4X4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=26osIkXKaIPeYGAIHmXS21DaWZDtmuqlUZqgrRir7QE=; b=k
 SHuQW3rOvrWWwGIZo6IUsDoGUkqxQyLYSGS02jAyp1Xk5kM/KYqP4MpmIxveqdUkHUac2IecAKOjZ
 5vJ8Em5bLi5hmqkPWt0FbftJ+PpgB0lYcmTUxK9+RO9PgvHSXNXCNYjxQu9d/BS/G2L0swmaAaeqb
 YokwK6uAHU4TUkHE=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1llpNm-006Jg9-39
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 08:59:29 +0000
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FqlDJ5FX3zCx7k;
 Wed, 26 May 2021 16:56:16 +0800 (CST)
Received: from dggemx753-chm.china.huawei.com (10.0.44.37) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 26 May 2021 16:59:06 +0800
Received: from szvp000207684.huawei.com (10.120.216.130) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 26 May 2021 16:59:06 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 26 May 2021 16:59:04 +0800
Message-ID: <20210526085904.10380-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1llpNm-006Jg9-39
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: swap: support migrating swapfile in
 aligned write mode
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

This patch supports to migrate swapfile in aligned write mode during
swapon in order to keep swapfile being aligned to section as much as
possible, then pinned swapfile will locates fully filled section which
may not affected by GC.

However, for the case that swapfile's size is not aligned to section
size, it will still leave last extent in file's tail as unaligned due
to its size is smaller than section size, like case #2.

case #1
xfs_io -f /mnt/f2fs/file -c "pwrite 0 4M" -c "fsync"

Before swapon:
 EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
   0: [0..3047]:       1123352..1126399  3048 0x1000
   1: [3048..7143]:    237568..241663    4096 0x1000
   2: [7144..8191]:    245760..246807    1048 0x1001
After swapon:
 EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
   0: [0..8191]:       249856..258047    8192 0x1001
Kmsg:
F2FS-fs (zram0): Swapfile (2) is not align to section:
1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate(2097152 * n)

case #2
xfs_io -f /mnt/f2fs/file -c "pwrite 0 3M" -c "fsync"

Before swapon:
 EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
   0: [0..3047]:       246808..249855    3048 0x1000
   1: [3048..6143]:    237568..240663    3096 0x1001
After swapon:
 EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
   0: [0..4095]:       258048..262143    4096 0x1000
   1: [4096..6143]:    238616..240663    2048 0x1001
Kmsg:
F2FS-fs (zram0): Swapfile: last extent is not aligned to section
F2FS-fs (zram0): Swapfile (2) is not align to section:
1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate(2097152 * n)

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- remove unneeded FILE_NOT_ALIGNED macro definition.
 fs/f2fs/data.c    | 107 ++++++++++++++++++++++++++++++++++++++++------
 fs/f2fs/f2fs.h    |   1 +
 fs/f2fs/segment.c |   3 ++
 3 files changed, 98 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9c23fde93b76..348d88c4a8df 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2472,6 +2472,10 @@ static inline bool check_inplace_update_policy(struct inode *inode,
 
 bool f2fs_should_update_inplace(struct inode *inode, struct f2fs_io_info *fio)
 {
+	/* swap file is migrating in aligned write mode */
+	if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
+		return false;
+
 	if (f2fs_is_pinned_file(inode))
 		return true;
 
@@ -2494,6 +2498,11 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
 		return true;
 	if (f2fs_is_atomic_file(inode))
 		return true;
+
+	/* swap file is migrating in aligned write mode */
+	if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
+		return true;
+
 	if (fio) {
 		if (page_private_gcing(fio->page))
 			return true;
@@ -3830,6 +3839,65 @@ int f2fs_migrate_page(struct address_space *mapping,
 #endif
 
 #ifdef CONFIG_SWAP
+static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
+							unsigned int blkcnt)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	unsigned int blkofs;
+	unsigned int blk_per_sec = BLKS_PER_SEC(sbi);
+	unsigned int secidx = start_blk / blk_per_sec;
+	unsigned int end_sec = secidx + blkcnt / blk_per_sec;
+	int ret = 0;
+
+	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+	down_write(&F2FS_I(inode)->i_mmap_sem);
+
+	set_inode_flag(inode, FI_ALIGNED_WRITE);
+
+	for (; secidx < end_sec; secidx++) {
+		down_write(&sbi->pin_sem);
+
+		f2fs_lock_op(sbi);
+		f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_PINNED, false);
+		f2fs_unlock_op(sbi);
+
+		set_inode_flag(inode, FI_DO_DEFRAG);
+
+		for (blkofs = 0; blkofs < blk_per_sec; blkofs++) {
+			struct page *page;
+			unsigned int blkidx = secidx * blk_per_sec + blkofs;
+
+			page = f2fs_get_lock_data_page(inode, blkidx, true);
+			if (IS_ERR(page)) {
+				up_write(&sbi->pin_sem);
+				ret = PTR_ERR(page);
+				goto done;
+			}
+
+			set_page_dirty(page);
+			f2fs_put_page(page, 1);
+		}
+
+		clear_inode_flag(inode, FI_DO_DEFRAG);
+
+		ret = filemap_fdatawrite(inode->i_mapping);
+
+		up_write(&sbi->pin_sem);
+
+		if (ret)
+			break;
+	}
+
+done:
+	clear_inode_flag(inode, FI_DO_DEFRAG);
+	clear_inode_flag(inode, FI_ALIGNED_WRITE);
+
+	up_write(&F2FS_I(inode)->i_mmap_sem);
+	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+
+	return ret;
+}
+
 static int check_swap_activate(struct swap_info_struct *sis,
 				struct file *swap_file, sector_t *span)
 {
@@ -3843,7 +3911,8 @@ static int check_swap_activate(struct swap_info_struct *sis,
 	sector_t highest_pblock = 0;
 	int nr_extents = 0;
 	unsigned long nr_pblocks;
-	unsigned int blocks_per_sec = BLKS_PER_SEC(sbi);
+	unsigned int blks_per_sec = BLKS_PER_SEC(sbi);
+	unsigned int sec_blks_mask = BLKS_PER_SEC(sbi) - 1;
 	unsigned int not_aligned = 0;
 	int ret = 0;
 
@@ -3858,7 +3927,7 @@ static int check_swap_activate(struct swap_info_struct *sis,
 
 	while (cur_lblock < last_lblock && cur_lblock < sis->max) {
 		struct f2fs_map_blocks map;
-
+retry:
 		cond_resched();
 
 		memset(&map, 0, sizeof(map));
@@ -3883,16 +3952,28 @@ static int check_swap_activate(struct swap_info_struct *sis,
 		pblock = map.m_pblk;
 		nr_pblocks = map.m_len;
 
-		if ((pblock - SM_I(sbi)->main_blkaddr) & (blocks_per_sec - 1) ||
-				nr_pblocks & (blocks_per_sec - 1)) {
-			if (f2fs_is_pinned_file(inode)) {
-				f2fs_err(sbi, "Swapfile does not align to section");
-				ret = -EINVAL;
-				goto out;
-			}
+		if ((pblock - SM_I(sbi)->main_blkaddr) & sec_blks_mask ||
+				nr_pblocks & sec_blks_mask) {
 			not_aligned++;
-		}
 
+			nr_pblocks = roundup(nr_pblocks, blks_per_sec);
+			if (cur_lblock + nr_pblocks > sis->max)
+				nr_pblocks -= blks_per_sec;
+
+			if (!nr_pblocks) {
+				/* this extent is last one */
+				nr_pblocks = map.m_len;
+				f2fs_warn(sbi, "Swapfile: last extent is not aligned to section");
+				goto next;
+			}
+
+			ret = f2fs_migrate_blocks(inode, cur_lblock,
+							nr_pblocks);
+			if (ret)
+				goto out;
+			goto retry;
+		}
+next:
 		if (cur_lblock + nr_pblocks >= sis->max)
 			nr_pblocks = sis->max - cur_lblock;
 
@@ -3920,11 +4001,11 @@ static int check_swap_activate(struct swap_info_struct *sis,
 	sis->pages = cur_lblock - 1;
 	sis->highest_bit = cur_lblock - 1;
 
+out:
 	if (not_aligned)
 		f2fs_warn(sbi, "Swapfile (%u) is not align to section: \n"
-			"\t1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate()",
-			not_aligned);
-out:
+			"\t1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate(%u * n)",
+			not_aligned, blks_per_sec * F2FS_BLKSIZE);
 	return ret;
 }
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 7798fb842847..de672c8239bf 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -708,6 +708,7 @@ enum {
 	FI_COMPRESS_CORRUPT,	/* indicate compressed cluster is corrupted */
 	FI_MMAP_FILE,		/* indicate file was mmapped */
 	FI_ENABLE_COMPRESS,	/* enable compression in "user" compression mode */
+	FI_ALIGNED_WRITE,	/* enable aligned write */
 	FI_MAX,			/* max flag, never be used */
 };
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 19b86bea0dbc..1cc7a555763b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3291,6 +3291,9 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 	if (fio->type == DATA) {
 		struct inode *inode = fio->page->mapping->host;
 
+		if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
+			return CURSEG_COLD_DATA_PINNED;
+
 		if (page_private_gcing(fio->page)) {
 			if (fio->sbi->am.atgc_enabled &&
 				(fio->io_type == FS_DATA_IO) &&
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
