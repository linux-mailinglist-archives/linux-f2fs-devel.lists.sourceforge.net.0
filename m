Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8E73C7B2F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jul 2021 03:54:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m3U6q-0007Ry-8r; Wed, 14 Jul 2021 01:54:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <wangxiaojun11@huawei.com>) id 1m3U6n-0007Rq-Ra
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Jul 2021 01:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9A8O7kSwzWgkQDp/51H7LNw8BxQpwTn3sqx9Anw6psQ=; b=Ga3qOjZuoQYcihp3lzRAi+dXkP
 6FfXRYZt9TZ5QIHdOA7l+BIjY4D6KVnwd5CKqOEyrvQQgzHefXXg9/nLum0dymCuXPgtadT/BoTPa
 B6zUnlyz/z91zIi63t2CaLsu4Ipt7h+6aNa5mMULzGrhr7q7y0gcUT1enhkbWKLDfIb8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9A8O7kSwzWgkQDp/51H7LNw8BxQpwTn3sqx9Anw6psQ=; b=R
 YUFT/ULm7617yb+u++KvDTwRkXJLifyOoVTLxl4DVNuo7KodqaQHN5bEl3BD8jpQb9dn3tUS8BtRv
 fGE/+BhaVvvY1JAtLRXMjyKV0FJoYJGR30FOD6WPy6A4l4QMRmANfNUi5z7VKRUm+VTYaFE/htk1q
 wJN+7kOGFQ9E6PrE=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m3U6i-007Xze-QU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Jul 2021 01:54:45 +0000
Received: from dggeml756-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GPgRt4zfGz8sd0;
 Wed, 14 Jul 2021 09:50:02 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggeml756-chm.china.huawei.com
 (10.1.199.158) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 14
 Jul 2021 09:54:30 +0800
From: Wang Xiaojun <wangxiaojun11@huawei.com>
To: <chao@kernel.org>, <jaegeuk@kernel.org>
Date: Wed, 14 Jul 2021 10:00:20 +0800
Message-ID: <20210714020020.208502-1-wangxiaojun11@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggeml756-chm.china.huawei.com (10.1.199.158)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.189 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1m3U6i-007Xze-QU
Subject: [f2fs-dev] [PATCH] f2fs-tools: rebuild the quota inode if it is
 corrupted
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

If the following process returns an error,
the quota inode, not the quota file, is damaged.
(fsck_chk_quota_node-->fsck_chk_node_blk-->sanity_check_nid)
The fsck does not have a process to rebuild the quota inode.

Because sanity_check_nid is not passed, fsck->nat_area_bitmap
can not be cleared, and then the NAT of quota will be nullify
during fix_nat_entries.

During the next fsck check, the quota inode check fails
because the address of the quota inode changes to 0.
In addition, in fsck_chk_quota_files-->f2fs_filesize_update,
data is written to address 0.

Therefore, when the quota inode is corrupted, we need to rebuild it.

Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
---
 fsck/fsck.c        |  2 ++
 fsck/fsck.h        |  1 +
 fsck/node.c        | 38 ++++++++++++++++++++++++++++++++++++++
 include/f2fs_fs.h  | 40 ++++++++++++++++++++++++++++++++++++++++
 mkfs/f2fs_format.c | 31 +------------------------------
 5 files changed, 82 insertions(+), 30 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 6ca85f0..af6d332 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1899,6 +1899,8 @@ int fsck_chk_quota_node(struct f2fs_sb_info *sbi)
 			ASSERT_MSG("wrong quota inode, qtype [%d] ino [0x%x]",
 								qtype, ino);
 			qf_szchk_type[qtype] = QF_SZCHK_ERR;
+			if (c.fix_on)
+				f2fs_rebuild_qf_inode(sbi, qtype);
 		}
 	}
 	cur_qtype = -1;
diff --git a/fsck/fsck.h b/fsck/fsck.h
index d79afef..67390f0 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -286,6 +286,7 @@ void f2fs_alloc_nid(struct f2fs_sb_info *, nid_t *);
 void set_data_blkaddr(struct dnode_of_data *);
 block_t new_node_block(struct f2fs_sb_info *,
 					struct dnode_of_data *, unsigned int);
+int f2fs_rebuild_qf_inode(struct f2fs_sb_info *sbi, int qtype);
 
 /* segment.c */
 struct quota_file;
diff --git a/fsck/node.c b/fsck/node.c
index c7988cb..d8d01db 100644
--- a/fsck/node.c
+++ b/fsck/node.c
@@ -40,6 +40,44 @@ void f2fs_release_nid(struct f2fs_sb_info *sbi, nid_t nid)
 	f2fs_clear_bit(nid, nm_i->nid_bitmap);
 }
 
+int f2fs_rebuild_qf_inode(struct f2fs_sb_info *sbi, int qtype)
+{
+	struct f2fs_node *raw_node = NULL;
+	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
+	struct f2fs_summary sum;
+	struct node_info ni;
+	nid_t ino = QUOTA_INO(sb, qtype);
+	block_t blkaddr = NULL_ADDR;
+	int ret = 0;
+
+	raw_node = calloc(F2FS_BLKSIZE, 1);
+	if (raw_node == NULL) {
+		MSG(1, "\tError: Calloc Failed for raw_node!!!\n");
+		return -ENOMEM;
+	}
+	f2fs_init_qf_inode(sb, raw_node, qtype);
+	raw_node->footer.cp_ver = F2FS_CKPT(sbi)->checkpoint_ver;
+
+	get_node_info(sbi, ino, &ni);
+	set_summary(&sum, ino, 0, ni.version);
+	ret = reserve_new_block(sbi, &blkaddr, &sum, CURSEG_HOT_NODE, 1);
+	if (ret)
+		goto err_out;
+
+	ret = write_inode(raw_node, blkaddr);
+	if (ret < 0) {
+		MSG(1, "\tError: While rebuilding the quota inode to disk!\n");
+		goto err_out;
+	}
+	update_nat_blkaddr(sbi, ino, ino, blkaddr);
+
+	f2fs_clear_bit(ino, F2FS_FSCK(sbi)->nat_area_bitmap);
+	f2fs_set_bit(ino, NM_I(sbi)->nid_bitmap);
+err_out:
+	free(raw_node);
+	return ret;
+}
+
 void set_data_blkaddr(struct dnode_of_data *dn)
 {
 	__le32 *addr_array;
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 45f7257..87bbd3c 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -20,6 +20,7 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
+#include <time.h>
 #ifdef HAVE_CONFIG_H
 #include <config.h>
 #endif
@@ -1554,6 +1555,45 @@ static inline void show_version(const char *prog)
 #endif
 }
 
+static inline void f2fs_init_qf_inode(struct f2fs_super_block *sb,
+		struct f2fs_node *raw_node, int qtype)
+{
+	raw_node->footer.nid = sb->qf_ino[qtype];
+	raw_node->footer.ino = sb->qf_ino[qtype];
+	raw_node->footer.cp_ver = cpu_to_le64(1);
+	raw_node->i.i_mode = cpu_to_le16(0x8180);
+	raw_node->i.i_links = cpu_to_le32(1);
+	raw_node->i.i_uid = cpu_to_le32(c.root_uid);
+	raw_node->i.i_gid = cpu_to_le32(c.root_gid);
+
+	raw_node->i.i_size = cpu_to_le64(1024 * 6); /* Hard coded */
+	raw_node->i.i_blocks = cpu_to_le64(1);
+
+	raw_node->i.i_atime = cpu_to_le32(time(NULL));
+	raw_node->i.i_atime_nsec = 0;
+	raw_node->i.i_ctime = cpu_to_le32(time(NULL));
+	raw_node->i.i_ctime_nsec = 0;
+	raw_node->i.i_mtime = cpu_to_le32(time(NULL));
+	raw_node->i.i_mtime_nsec = 0;
+	raw_node->i.i_generation = 0;
+	raw_node->i.i_xattr_nid = 0;
+	raw_node->i.i_flags = FS_IMMUTABLE_FL;
+	raw_node->i.i_current_depth = cpu_to_le32(0);
+	raw_node->i.i_dir_level = DEF_DIR_LEVEL;
+
+	if (c.feature & cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR)) {
+		raw_node->i.i_inline = F2FS_EXTRA_ATTR;
+		raw_node->i.i_extra_isize = cpu_to_le16(calc_extra_isize());
+	}
+
+	if (c.feature & cpu_to_le32(F2FS_FEATURE_PRJQUOTA))
+		raw_node->i.i_projid = cpu_to_le32(F2FS_DEF_PROJID);
+
+	raw_node->i.i_ext.fofs = 0;
+	raw_node->i.i_ext.blk_addr = 0;
+	raw_node->i.i_ext.len = 0;
+}
+
 struct feature {
 	char *name;
 	u32  mask;
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 2132852..f8d0bce 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -1373,42 +1373,16 @@ static int f2fs_write_qf_inode(int qtype)
 		MSG(1, "\tError: Calloc Failed for raw_node!!!\n");
 		return -1;
 	}
+	f2fs_init_qf_inode(sb, raw_node, qtype);
 
-	raw_node->footer.nid = sb->qf_ino[qtype];
-	raw_node->footer.ino = sb->qf_ino[qtype];
-	raw_node->footer.cp_ver = cpu_to_le64(1);
 	raw_node->footer.next_blkaddr = cpu_to_le32(
 			get_sb(main_blkaddr) +
 			c.cur_seg[CURSEG_HOT_NODE] *
 			c.blks_per_seg + 1 + qtype + 1);
-
-	raw_node->i.i_mode = cpu_to_le16(0x8180);
-	raw_node->i.i_links = cpu_to_le32(1);
-	raw_node->i.i_uid = cpu_to_le32(c.root_uid);
-	raw_node->i.i_gid = cpu_to_le32(c.root_gid);
-
-	raw_node->i.i_size = cpu_to_le64(1024 * 6); /* Hard coded */
 	raw_node->i.i_blocks = cpu_to_le64(1 + QUOTA_DATA(qtype));
-
 	raw_node->i.i_atime = cpu_to_le32(mkfs_time);
-	raw_node->i.i_atime_nsec = 0;
 	raw_node->i.i_ctime = cpu_to_le32(mkfs_time);
-	raw_node->i.i_ctime_nsec = 0;
 	raw_node->i.i_mtime = cpu_to_le32(mkfs_time);
-	raw_node->i.i_mtime_nsec = 0;
-	raw_node->i.i_generation = 0;
-	raw_node->i.i_xattr_nid = 0;
-	raw_node->i.i_flags = FS_IMMUTABLE_FL;
-	raw_node->i.i_current_depth = cpu_to_le32(0);
-	raw_node->i.i_dir_level = DEF_DIR_LEVEL;
-
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR)) {
-		raw_node->i.i_inline = F2FS_EXTRA_ATTR;
-		raw_node->i.i_extra_isize = cpu_to_le16(calc_extra_isize());
-	}
-
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_PRJQUOTA))
-		raw_node->i.i_projid = cpu_to_le32(F2FS_DEF_PROJID);
 
 	data_blk_nor = get_sb(main_blkaddr) +
 		c.cur_seg[CURSEG_HOT_DATA] * c.blks_per_seg + 1;
@@ -1434,9 +1408,6 @@ static int f2fs_write_qf_inode(int qtype)
 	for (i = 0; i < QUOTA_DATA(qtype); i++)
 		raw_node->i.i_addr[get_extra_isize(raw_node) + i] =
 					cpu_to_le32(data_blk_nor + i);
-	raw_node->i.i_ext.fofs = 0;
-	raw_node->i.i_ext.blk_addr = 0;
-	raw_node->i.i_ext.len = 0;
 
 	main_area_node_seg_blk_offset = get_sb(main_blkaddr);
 	main_area_node_seg_blk_offset += c.cur_seg[CURSEG_HOT_NODE] *
-- 
2.25.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
