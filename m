Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B74E37BA19
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 May 2021 12:11:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lglpw-00009y-6d; Wed, 12 May 2021 10:11:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lglpu-00009M-Ky
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 10:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fJGJ29ROC/bXshtjiW53ozcMjg1IgXQULuSBL2ispaY=; b=HTHLubE8+aU1OkuBKE8GWC790V
 IJYv9Q/JVo2GUwrRy5oGPh6pvIBRvx4wzzYNQZwL0iTq4cNHyU+iRD2dmR9WEnJgFyTsPlsr1hP1k
 fgNz/KDbqWmiKfwxP9q7MqB60CP5WOkkMi6HuJEERx+qJFFNhD4E4YtHrLXylMSvd1OE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fJGJ29ROC/bXshtjiW53ozcMjg1IgXQULuSBL2ispaY=; b=a
 XBb/czuGwqWcF/aM3bx6tTAVBGJHyNPhpV1ul/v00l7hC8czArYryWH42vg4WUXhTzNQL5zgLMEdr
 8ere6WRaZwJPSY9UOg65t/ydQrBAfJInA8sIk03xZb/TmbbMEQmiq9q8n1xs66GvjgoGhzvb9jQNv
 UjsaKVApNfVwl/4g=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lglpl-0008Sz-KJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 10:11:26 +0000
Received: from dggemx753-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fg9SH1gl8zWhw6;
 Wed, 12 May 2021 18:06:55 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 12 May 2021 18:11:10 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 12 May 2021 18:11:00 +0800
Message-ID: <20210512101100.101424-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lglpl-0008Sz-KJ
Subject: [f2fs-dev] [PATCH RFC] f2fs: support migrating swapfile in aligned
 write mode
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

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---

*do not merge this patch*, I haven't tested this patch yet, just send this
out for comments.

 fs/f2fs/data.c    | 117 +++++++++++++++++++++++++++++++++-------------
 fs/f2fs/f2fs.h    |   1 +
 fs/f2fs/node.h    |   3 ++
 fs/f2fs/segment.c |   3 ++
 4 files changed, 92 insertions(+), 32 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 258c5d7a3bfa..ea47d301ccb0 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2472,6 +2472,10 @@ static inline bool check_inplace_update_policy(struct inode *inode,
 
 bool f2fs_should_update_inplace(struct inode *inode, struct f2fs_io_info *fio)
 {
+	/* swap file is migrating in algined write mode */
+	if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
+		return false;
+
 	if (f2fs_is_pinned_file(inode))
 		return true;
 
@@ -3832,6 +3836,70 @@ int f2fs_migrate_page(struct address_space *mapping,
 #endif
 
 #ifdef CONFIG_SWAP
+static int f2fs_migrate_blocks(struct inode *inode)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	unsigned int secidx, blkofs;
+	unsigned int blk_per_sec = BLKS_PER_SEC(sbi);
+	unsigned int total_secs = DIV_ROUND_UP(i_size_read(inode),
+					blk_per_sec << F2FS_BLKSIZE_BITS);
+	unsigned int last_blkidx = DIV_ROUND_UP(i_size_read(inode),
+							F2FS_BLKSIZE);
+	int ret = 0;
+
+	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+	down_write(&F2FS_I(inode)->i_mmap_sem);
+
+	for (secidx = 0; secidx < total_secs; secidx++) {
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
+			if (blkidx >= last_blkidx) {
+				up_write(&sbi->pin_sem);
+				goto done;
+			}
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
+		set_inode_flag(inode, FI_ALIGNED_WRITE);
+		ret = filemap_fdatawrite(inode->i_mapping);
+		clear_inode_flag(inode, FI_ALIGNED_WRITE);
+
+		up_write(&sbi->pin_sem);
+
+		if (ret)
+			break;
+	}
+
+done:
+	clear_inode_flag(inode, FI_DO_DEFRAG);
+
+	up_write(&F2FS_I(inode)->i_mmap_sem);
+	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+
+	return ret;
+}
+
 static int f2fs_is_file_aligned(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
@@ -3841,7 +3909,6 @@ static int f2fs_is_file_aligned(struct inode *inode)
 	block_t pblock;
 	unsigned long nr_pblocks;
 	unsigned int blocks_per_sec = BLKS_PER_SEC(sbi);
-	unsigned int not_aligned = 0;
 	int ret = 0;
 
 	cur_lblock = 0;
@@ -3874,20 +3941,12 @@ static int f2fs_is_file_aligned(struct inode *inode)
 
 		if ((pblock - main_blkaddr) & (blocks_per_sec - 1) ||
 			nr_pblocks & (blocks_per_sec - 1)) {
-			if (f2fs_is_pinned_file(inode)) {
-				f2fs_err(sbi, "Swapfile does not align to section");
-				ret = -EINVAL;
-				goto out;
-			}
-			not_aligned++;
+			ret = FILE_NOT_ALIGNED;
+			goto out;
 		}
 
 		cur_lblock += nr_pblocks;
 	}
-	if (not_aligned)
-		f2fs_warn(sbi, "Swapfile (%u) is not align to section: \n"
-			"\t1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate()",
-			not_aligned);
 out:
 	return ret;
 }
@@ -3905,8 +3964,6 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
 	sector_t highest_pblock = 0;
 	int nr_extents = 0;
 	unsigned long nr_pblocks;
-	unsigned int blocks_per_sec = BLKS_PER_SEC(sbi);
-	unsigned int not_aligned = 0;
 	int ret = 0;
 
 	/*
@@ -3943,16 +4000,6 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
 		pblock = map.m_pblk;
 		nr_pblocks = map.m_len;
 
-		if ((pblock - SM_I(sbi)->main_blkaddr) & (blocks_per_sec - 1) ||
-				nr_pblocks & (blocks_per_sec - 1)) {
-			if (f2fs_is_pinned_file(inode)) {
-				f2fs_err(sbi, "Swapfile does not align to section");
-				ret = -EINVAL;
-				goto out;
-			}
-			not_aligned++;
-		}
-
 		if (cur_lblock + nr_pblocks >= sis->max)
 			nr_pblocks = sis->max - cur_lblock;
 
@@ -3979,11 +4026,6 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
 	sis->max = cur_lblock;
 	sis->pages = cur_lblock - 1;
 	sis->highest_bit = cur_lblock - 1;
-
-	if (not_aligned)
-		f2fs_warn(sbi, "Swapfile (%u) is not align to section: \n"
-			"\t1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate()",
-			not_aligned);
 out:
 	return ret;
 }
@@ -4003,13 +4045,24 @@ static int check_swap_activate(struct swap_info_struct *sis,
 	sector_t highest_block = 0;
 	int nr_extents = 0;
 	int ret = 0;
+	bool migrated = false;
 
-	if (PAGE_SIZE == F2FS_BLKSIZE)
-		return check_swap_activate_fast(sis, swap_file, span);
-
+recheck:
 	ret = f2fs_is_file_aligned(inode);
-	if (ret)
+	if (ret < 0)
 		goto out;
+	else if (ret == FILE_NOT_ALIGNED) {
+		if (migrated)
+			return -EINVAL;
+		ret = f2fs_migrate_blocks(inode);
+		if (ret)
+			return ret;
+		migrated = true;
+		goto recheck;
+	}
+
+	if (PAGE_SIZE == F2FS_BLKSIZE)
+		return check_swap_activate_fast(sis, swap_file, span);
 
 	blocks_per_page = bytes_to_blks(inode, PAGE_SIZE);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 70c0bd563732..570ffdf068ee 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -707,6 +707,7 @@ enum {
 	FI_COMPRESS_CORRUPT,	/* indicate compressed cluster is corrupted */
 	FI_MMAP_FILE,		/* indicate file was mmapped */
 	FI_ENABLE_COMPRESS,	/* enable compression in "user" compression mode */
+	FI_ALIGNED_WRITE,	/* enable aligned write */
 	FI_MAX,			/* max flag, never be used */
 };
 
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index d85e8659cfda..e5235dfe4670 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -38,6 +38,9 @@
 /* return value for read_node_page */
 #define LOCKED_PAGE	1
 
+/* check pinned file's alignment status of physical blocks */
+#define FILE_NOT_ALIGNED	1
+
 /* For flag in struct node_info */
 enum {
 	IS_CHECKPOINTED,	/* is it checkpointed before? */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 72c75694c9c5..edc3a28970a4 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3292,6 +3292,9 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
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
