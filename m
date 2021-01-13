Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A7B2F4395
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Jan 2021 06:23:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kzYcY-00017g-6W; Wed, 13 Jan 2021 05:23:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cgxu519@mykernel.net>) id 1kzYcU-00017O-LL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Jan 2021 05:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Fmx52W2L/JpetI0GpGYuLesSdIRKaJwJtjiIg7qgmQ=; b=CqXsuXKnLPZlSao7THeD7NXbo+
 df/SknY7bN+tafL0hE9yPWkgBfH5c0WDlfHCnLdkxujFsWLgsqgg+9XfWd7P3YZCi8BUasxzJ7RmH
 KTBOPzvTVO+IlVkrZKbybtEzd6Lrnlpya0saSvNU4ySIX7lkTCGy69F2tP7hOUh7g9cg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4Fmx52W2L/JpetI0GpGYuLesSdIRKaJwJtjiIg7qgmQ=; b=QMJ5o+Xe//T4w4ER/pnv7CRQke
 AMg/NfBEj18RjkgyMZ7vctRYW4vWA3a6S+GlqpU9Vef8/pQTbjJyxGmiEWbXZeyyZ+oPuuCFub1d9
 Q8kGr2TvbaT6GZdF0EO2/SeA+SH8CTrsrocGc/Jwz+ScaE3tlFmFK67QYSKEqAVBIxSc=;
Received: from sender2-pp-o92.zoho.com.cn ([163.53.93.251])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kzYcA-006ahI-QB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Jan 2021 05:22:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1610515329; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=WwhKXPDzQy+cX2B/4/WUgNQzCbzzp/JlDVQQJPbz8SL/s9q3lF0NJbW1utvXAod2aeQBaX8NNnkAphRFD0ozUlWYUuUI5n34oNi+ElSTT6a6Oy/oKLYqbziUDkf2Jeb1w1yAww9spfjxkcOuGxQuxt3PfLdOngNSnKcU6o4pnTA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; 
 t=1610515329; h=Cc:Date:From:Message-ID:Subject:To; 
 bh=4Fmx52W2L/JpetI0GpGYuLesSdIRKaJwJtjiIg7qgmQ=; 
 b=D7Al6cYbn5idf1BhBtM69YYhijF1JlpHsJvpiZdFNy9h3xWFarV4GUrtBwKUONX97lYpQlILwOkGdBohwLzfMK4XaVof9AT1j5kq9Zrq44rcF/0SHxlBSzJHY+bYDMt//xxhR+Umia0AZ8PddNG8g/TCLfWgd9GIodFUK39rXfk=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=mykernel.net;
 spf=pass  smtp.mailfrom=cgxu519@mykernel.net;
 dmarc=pass header.from=<cgxu519@mykernel.net>
 header.from=<cgxu519@mykernel.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1610515328; 
 s=zohomail; d=mykernel.net; i=cgxu519@mykernel.net;
 h=From:To:Cc:Subject:Date:Message-Id;
 bh=4Fmx52W2L/JpetI0GpGYuLesSdIRKaJwJtjiIg7qgmQ=;
 b=Cz1nAGrY5HSR6W7iIzip6Ud6RP7jahp1ZWjDimOXEbyvrjEGnXZt27xmIu4NSsvS
 DvATP7pLVZovyyCpJ7tcyM7c1mDUQemi+DJTPOixoreH2UUn1KiO8zaKBJT/Squn3eK
 plucLj3oqCt3tcJpEQ5TpZva0D42eYVFMAk59WV0=
Received: from VM-144-5-centos.localdomain (159.75.205.129 [159.75.205.129])
 by mx.zoho.com.cn with SMTPS id 161051532694932.612786905826056;
 Wed, 13 Jan 2021 13:22:06 +0800 (CST)
From: Chengguang Xu <cgxu519@mykernel.net>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 13 Jan 2021 13:21:54 +0800
Message-Id: <1610515314-28505-1-git-send-email-cgxu519@mykernel.net>
X-Mailer: git-send-email 1.8.3.1
X-ZohoCNMailClient: External
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mykernel.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kzYcA-006ahI-QB
Subject: [f2fs-dev] [PATCH] f2fs: fix to use per-inode maxbytes
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
Cc: Chengguang Xu <cgxu519@mykernel.net>,
 linux-f2fs-devel@lists.sourceforge.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

F2FS inode may have different max size, e.g. compressed file have
less blkaddr entries in all its direct-node blocks, result in being
with less max filesize. So change to use per-inode maxbytes.

Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
---
 fs/f2fs/data.c  |  2 +-
 fs/f2fs/f2fs.h  |  2 +-
 fs/f2fs/file.c  |  9 ++++++---
 fs/f2fs/super.c | 12 ++++++++----
 4 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index aa34d62..56badcb 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3831,7 +3831,7 @@ static sector_t f2fs_bmap(struct address_space *mapping, sector_t block)
 		filemap_write_and_wait(mapping);
 
 	/* Block number less than F2FS MAX BLOCKS */
-	if (unlikely(block >= F2FS_I_SB(inode)->max_file_blocks))
+	if (unlikely(block >= max_file_blocks(inode)))
 		goto out;
 
 	if (f2fs_compressed_file(inode)) {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bb11759..4328b98 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1444,7 +1444,6 @@ struct f2fs_sb_info {
 	unsigned int total_sections;		/* total section count */
 	unsigned int total_node_count;		/* total node block count */
 	unsigned int total_valid_node_count;	/* valid node block count */
-	loff_t max_file_blocks;			/* max block index of file */
 	int dir_level;				/* directory level */
 	int readdir_ra;				/* readahead inode in readdir */
 	u64 max_io_bytes;			/* max io bytes to merge IOs */
@@ -3232,6 +3231,7 @@ static inline int f2fs_add_link(struct dentry *dentry, struct inode *inode)
 void f2fs_inode_synced(struct inode *inode);
 int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
 int f2fs_quota_sync(struct super_block *sb, int type);
+loff_t max_file_blocks(struct inode *inode);
 void f2fs_quota_off_umount(struct super_block *sb);
 int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
 int f2fs_sync_fs(struct super_block *sb, int sync);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f585545..5cddd23 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -483,6 +483,9 @@ static loff_t f2fs_llseek(struct file *file, loff_t offset, int whence)
 	struct inode *inode = file->f_mapping->host;
 	loff_t maxbytes = inode->i_sb->s_maxbytes;
 
+	if (f2fs_compressed_file(inode))
+		maxbytes = max_file_blocks(inode) << F2FS_BLKSIZE_BITS;
+
 	switch (whence) {
 	case SEEK_SET:
 	case SEEK_CUR:
@@ -667,7 +670,7 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 
 	free_from = (pgoff_t)F2FS_BLK_ALIGN(from);
 
-	if (free_from >= sbi->max_file_blocks)
+	if (free_from >= max_file_blocks(inode))
 		goto free_partial;
 
 	if (lock)
@@ -2730,7 +2733,7 @@ static int f2fs_ioc_defragment(struct file *filp, unsigned long arg)
 		return -EINVAL;
 
 	if (unlikely((range.start + range.len) >> PAGE_SHIFT >
-					sbi->max_file_blocks))
+					max_file_blocks(inode)))
 		return -EINVAL;
 
 	err = mnt_want_write_file(filp);
@@ -3293,7 +3296,7 @@ int f2fs_precache_extents(struct inode *inode)
 	map.m_next_extent = &m_next_extent;
 	map.m_seg_type = NO_CHECK_TYPE;
 	map.m_may_create = false;
-	end = F2FS_I_SB(inode)->max_file_blocks;
+	end = max_file_blocks(inode);
 
 	while (map.m_lblk < end) {
 		map.m_len = end - map.m_lblk;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b4a07fe..9132c39 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2638,10 +2638,10 @@ static struct dentry *f2fs_fh_to_parent(struct super_block *sb, struct fid *fid,
 	.get_parent = f2fs_get_parent,
 };
 
-static loff_t max_file_blocks(void)
+loff_t max_file_blocks(struct inode *inode)
 {
 	loff_t result = 0;
-	loff_t leaf_count = DEF_ADDRS_PER_BLOCK;
+	loff_t leaf_count;
 
 	/*
 	 * note: previously, result is equal to (DEF_ADDRS_PER_INODE -
@@ -2650,6 +2650,11 @@ static loff_t max_file_blocks(void)
 	 * result as zero.
 	 */
 
+	if (inode && f2fs_compressed_file(inode))
+		leaf_count = ADDRS_PER_BLOCK(inode);
+	else
+		leaf_count = DEF_ADDRS_PER_BLOCK;
+
 	/* two direct node blocks */
 	result += (leaf_count * 2);
 
@@ -3533,8 +3538,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	if (err)
 		goto free_options;
 
-	sbi->max_file_blocks = max_file_blocks();
-	sb->s_maxbytes = sbi->max_file_blocks <<
+	sb->s_maxbytes = max_file_blocks(NULL) <<
 				le32_to_cpu(raw_super->log_blocksize);
 	sb->s_max_links = F2FS_LINK_MAX;
 
-- 
1.8.3.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
