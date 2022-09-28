Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B17695EE0A9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Sep 2022 17:39:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1odZ9v-0007Ps-Tn;
	Wed, 28 Sep 2022 15:39:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1odZ9m-0007P9-3q
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Sep 2022 15:39:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hxQpks/CTXvUJyW4PeqRIwvp2W4Jwz27W/JtNUgTXX4=; b=PjCieG+SMCBxL8Fti2xELu/0hV
 VDA+y1rHCSRMIEA4zdra1MbxyZ5UT2YSf/wZCXdIGFMbiMUMojpjGfz/vQBQCfzV4xRqM3hrm22IT
 yb3qi/vDJ2B9FhxaPqAzLCqaGa3ToBtTMEEDXknqxaENpf4UDTi3z4jc+cfyw1jzUxwo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hxQpks/CTXvUJyW4PeqRIwvp2W4Jwz27W/JtNUgTXX4=; b=kTPt8renSwig9/dw2W/yW0fb7q
 rajmQXXblvtYbXcwr7+6KMCScRzO4jfWIMLEURVsFgRju5XrkVKwjWTJKSYIiHrdRpzdP3zoaCXHq
 t806lW2hW1tTerd8ZEWSYrZNCvPTk104akZ6eqJkCKNXcf8eSLqXVQRZ05WixzAcYhxw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1odZ9c-0003S3-4a for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Sep 2022 15:39:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3577661F05
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 Sep 2022 15:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7C5C43141;
 Wed, 28 Sep 2022 15:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664379550;
 bh=HnZJXUFZWpfHXDsX6LgEscJcyXgsd94yVeakHPrmcfQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sxWr7Q5iEPNFyG8SsAuswWdHZILHDBgT2G1vG7znMLIIDM5OCSghT3RRKbrPvgiL+
 FHzfzuyIPicfpDXfCyUgwwfAhF6VVUAqLsYdxpHV6FOmjCsgUeP5iPkRRwsvHHJMBe
 hfC/phd7d8artuG2cCvKqPIpQNSefytkTZspxgfiJE/aLk3WB2E0Y+mIOisIK2dI3m
 9GhZ/DP5iilVCYV7CBWIXug5mSCFtw1X4NixGIP7nPKjOE9O3zCJj30RZwSQrM1CO0
 UrAtyySokO4xZ4RqBZ1v7hrZ+9aKgVsySXqwEa0MWztG6vrZthWMmAda7wDO6Wkv28
 op7lr9xbYMCTg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 28 Sep 2022 23:38:54 +0800
Message-Id: <20220928153855.4634-2-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220928153855.4634-1-chao@kernel.org>
References: <20220928153855.4634-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch supports to record detail reason of FSCORRUPTED
 error into f2fs_super_block.s_errors[]. Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/compress.c | 2 ++ fs/f2fs/data.c | 24 +++++++++++++++++---
 fs/f2fs/dir.c
 | 1 + fs/f2fs/f2fs.h | 5 +++++ fs/f2fs/file.c | 12 ++++++++-- fs/f2fs/gc.c
 [...] Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1odZ9c-0003S3-4a
Subject: [f2fs-dev] [PATCH 2/3] f2fs: support recording errors into
 superblock
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

This patch supports to record detail reason of FSCORRUPTED error into
f2fs_super_block.s_errors[].

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c      |  2 ++
 fs/f2fs/data.c          | 24 +++++++++++++++++---
 fs/f2fs/dir.c           |  1 +
 fs/f2fs/f2fs.h          |  5 +++++
 fs/f2fs/file.c          | 12 ++++++++--
 fs/f2fs/gc.c            |  2 ++
 fs/f2fs/inline.c        |  2 ++
 fs/f2fs/inode.c         |  6 ++++-
 fs/f2fs/node.c          |  2 ++
 fs/f2fs/recovery.c      |  6 +++++
 fs/f2fs/segment.c       | 11 +++++++++
 fs/f2fs/segment.h       |  2 ++
 fs/f2fs/super.c         | 50 +++++++++++++++++++++++++++++++++++++++--
 fs/f2fs/verity.c        |  2 ++
 fs/f2fs/xattr.c         |  8 +++++++
 include/linux/f2fs_fs.h | 25 ++++++++++++++++++++-
 16 files changed, 151 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index c16bab5bd600..d315c2de136f 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -762,6 +762,7 @@ void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task)
 
 	if (dic->clen > PAGE_SIZE * dic->nr_cpages - COMPRESS_HEADER_SIZE) {
 		ret = -EFSCORRUPTED;
+		f2fs_handle_error(sbi, ERROR_FAIL_DECOMPRESSION);
 		goto out_release;
 	}
 
@@ -950,6 +951,7 @@ static int __f2fs_cluster_blocks(struct inode *inode,
 
 	if (f2fs_sanity_check_cluster(&dn)) {
 		ret = -EFSCORRUPTED;
+		f2fs_handle_error(F2FS_I_SB(inode), ERROR_CORRUPTED_CLUSTER);
 		goto fail;
 	}
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 20c8d835a87b..7fa23c5ec792 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -705,8 +705,10 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 
 	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
 			fio->is_por ? META_POR : (__is_meta_io(fio) ?
-			META_GENERIC : DATA_GENERIC_ENHANCE)))
+			META_GENERIC : DATA_GENERIC_ENHANCE))) {
+		f2fs_handle_error(fio->sbi, ERROR_INVALID_BLKADDR);
 		return -EFSCORRUPTED;
+	}
 
 	trace_f2fs_submit_page_bio(page, fio);
 
@@ -906,8 +908,10 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 			fio->encrypted_page : fio->page;
 
 	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
-			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC))
+			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC)) {
+		f2fs_handle_error(fio->sbi, ERROR_INVALID_BLKADDR);
 		return -EFSCORRUPTED;
+	}
 
 	trace_f2fs_submit_page_bio(page, fio);
 
@@ -1217,6 +1221,8 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 		if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), dn.data_blkaddr,
 						DATA_GENERIC_ENHANCE_READ)) {
 			err = -EFSCORRUPTED;
+			f2fs_handle_error(F2FS_I_SB(inode),
+						ERROR_INVALID_BLKADDR);
 			goto put_err;
 		}
 		goto got_it;
@@ -1237,6 +1243,8 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 						dn.data_blkaddr,
 						DATA_GENERIC_ENHANCE)) {
 		err = -EFSCORRUPTED;
+		f2fs_handle_error(F2FS_I_SB(inode),
+					ERROR_INVALID_BLKADDR);
 		goto put_err;
 	}
 got_it:
@@ -1550,6 +1558,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 	if (__is_valid_data_blkaddr(blkaddr) &&
 		!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE)) {
 		err = -EFSCORRUPTED;
+		f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 		goto sync_out;
 	}
 
@@ -1595,6 +1604,8 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 					(flag != F2FS_GET_BLOCK_FIEMAP ||
 					IS_ENABLED(CONFIG_F2FS_CHECK_FS))) {
 				err = -EFSCORRUPTED;
+				f2fs_handle_error(sbi,
+						ERROR_CORRUPTED_CLUSTER);
 				goto sync_out;
 			}
 			if (flag == F2FS_GET_BLOCK_BMAP) {
@@ -2076,6 +2087,8 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 		if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
 						DATA_GENERIC_ENHANCE_READ)) {
 			ret = -EFSCORRUPTED;
+			f2fs_handle_error(F2FS_I_SB(inode),
+						ERROR_INVALID_BLKADDR);
 			goto out;
 		}
 	} else {
@@ -2619,8 +2632,11 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		fio->old_blkaddr = ei.blk + page->index - ei.fofs;
 
 		if (!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
-						DATA_GENERIC_ENHANCE))
+						DATA_GENERIC_ENHANCE)) {
+			f2fs_handle_error(fio->sbi,
+						ERROR_INVALID_BLKADDR);
 			return -EFSCORRUPTED;
+		}
 
 		ipu_force = true;
 		fio->need_lock = LOCK_DONE;
@@ -2648,6 +2664,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
 						DATA_GENERIC_ENHANCE)) {
 		err = -EFSCORRUPTED;
+		f2fs_handle_error(fio->sbi, ERROR_INVALID_BLKADDR);
 		goto out_writepage;
 	}
 
@@ -3564,6 +3581,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 		if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
 				DATA_GENERIC_ENHANCE_READ)) {
 			err = -EFSCORRUPTED;
+			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 			goto fail;
 		}
 		err = f2fs_submit_page_read(inode, page, blkaddr, 0, true);
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index d5bd7932fb64..21960a899b6a 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -1041,6 +1041,7 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 				  __func__, le16_to_cpu(de->name_len));
 			set_sbi_flag(sbi, SBI_NEED_FSCK);
 			err = -EFSCORRUPTED;
+			f2fs_handle_error(sbi, ERROR_CORRUPTED_DIRENT);
 			goto out;
 		}
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 30ddd77115e6..2ed00111a399 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1818,6 +1818,10 @@ struct f2fs_sb_info {
 
 	struct workqueue_struct *post_read_wq;	/* post read workqueue */
 
+	unsigned char errors[MAX_F2FS_ERRORS];	/* error flags */
+	spinlock_t error_lock;			/* protect errors array */
+	bool error_dirty;			/* errors of sb is dirty */
+
 	struct kmem_cache *inline_xattr_slab;	/* inline xattr entry */
 	unsigned int inline_xattr_slab_size;	/* default inline xattr slab size */
 
@@ -3560,6 +3564,7 @@ int f2fs_quota_sync(struct super_block *sb, int type);
 loff_t max_file_blocks(struct inode *inode);
 void f2fs_quota_off_umount(struct super_block *sb);
 void f2fs_handle_stop(struct f2fs_sb_info *sbi, unsigned char reason);
+void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error);
 int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
 int f2fs_sync_fs(struct super_block *sb, int sync);
 int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index da45798d7fe5..df5e7ad80096 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1156,6 +1156,7 @@ static int __read_out_blkaddrs(struct inode *inode, block_t *blkaddr,
 			!f2fs_is_valid_blkaddr(sbi, *blkaddr,
 					DATA_GENERIC_ENHANCE)) {
 			f2fs_put_dnode(&dn);
+			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 			return -EFSCORRUPTED;
 		}
 
@@ -1440,6 +1441,7 @@ static int f2fs_do_zero_range(struct dnode_of_data *dn, pgoff_t start,
 		if (!f2fs_is_valid_blkaddr(sbi, dn->data_blkaddr,
 					DATA_GENERIC_ENHANCE)) {
 			ret = -EFSCORRUPTED;
+			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 			break;
 		}
 
@@ -3331,8 +3333,10 @@ static int release_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 		if (!__is_valid_data_blkaddr(blkaddr))
 			continue;
 		if (unlikely(!f2fs_is_valid_blkaddr(sbi, blkaddr,
-					DATA_GENERIC_ENHANCE)))
+					DATA_GENERIC_ENHANCE))) {
+			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 			return -EFSCORRUPTED;
+		}
 	}
 
 	while (count) {
@@ -3493,8 +3497,10 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 		if (!__is_valid_data_blkaddr(blkaddr))
 			continue;
 		if (unlikely(!f2fs_is_valid_blkaddr(sbi, blkaddr,
-					DATA_GENERIC_ENHANCE)))
+					DATA_GENERIC_ENHANCE))) {
+			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 			return -EFSCORRUPTED;
+		}
 	}
 
 	while (count) {
@@ -3766,6 +3772,8 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 						DATA_GENERIC_ENHANCE)) {
 				ret = -EFSCORRUPTED;
 				f2fs_put_dnode(&dn);
+				f2fs_handle_error(sbi,
+						ERROR_INVALID_BLKADDR);
 				goto out;
 			}
 
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6e42dad0ac2d..d36bcb23ccfe 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1164,6 +1164,7 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 		if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
 						DATA_GENERIC_ENHANCE_READ))) {
 			err = -EFSCORRUPTED;
+			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 			goto put_page;
 		}
 		goto got_it;
@@ -1182,6 +1183,7 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 	if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
 						DATA_GENERIC_ENHANCE))) {
 		err = -EFSCORRUPTED;
+		f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 		goto put_page;
 	}
 got_it:
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 73da93318036..21a495234ffd 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -160,6 +160,7 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
 		set_sbi_flag(fio.sbi, SBI_NEED_FSCK);
 		f2fs_warn(fio.sbi, "%s: corrupted inline inode ino=%lx, i_addr[0]:0x%x, run fsck to fix.",
 			  __func__, dn->inode->i_ino, dn->data_blkaddr);
+		f2fs_handle_error(fio.sbi, ERROR_INVALID_BLKADDR);
 		return -EFSCORRUPTED;
 	}
 
@@ -412,6 +413,7 @@ static int f2fs_move_inline_dirents(struct inode *dir, struct page *ipage,
 		set_sbi_flag(F2FS_P_SB(page), SBI_NEED_FSCK);
 		f2fs_warn(F2FS_P_SB(page), "%s: corrupted inline inode ino=%lx, i_addr[0]:0x%x, run fsck to fix.",
 			  __func__, dir->i_ino, dn.data_blkaddr);
+		f2fs_handle_error(F2FS_P_SB(page), ERROR_INVALID_BLKADDR);
 		err = -EFSCORRUPTED;
 		goto out;
 	}
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 7880596b51ee..3ab3577d87b3 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -84,8 +84,10 @@ static int __written_first_block(struct f2fs_sb_info *sbi,
 
 	if (!__is_valid_data_blkaddr(addr))
 		return 1;
-	if (!f2fs_is_valid_blkaddr(sbi, addr, DATA_GENERIC_ENHANCE))
+	if (!f2fs_is_valid_blkaddr(sbi, addr, DATA_GENERIC_ENHANCE)) {
+		f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 		return -EFSCORRUPTED;
+	}
 	return 0;
 }
 
@@ -418,6 +420,7 @@ static int do_read_inode(struct inode *inode)
 
 	if (!sanity_check_inode(inode, node_page)) {
 		f2fs_put_page(node_page, 1);
+		f2fs_handle_error(sbi, ERROR_CORRUPTED_INODE);
 		return -EFSCORRUPTED;
 	}
 
@@ -513,6 +516,7 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 			ret = -EFSCORRUPTED;
 			trace_f2fs_iget_exit(inode, ret);
 			iput(inode);
+			f2fs_handle_error(sbi, ERROR_CORRUPTED_INODE);
 			return ERR_PTR(ret);
 		}
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 9263bf5f10d3..983572f23896 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -36,6 +36,7 @@ int f2fs_check_nid_range(struct f2fs_sb_info *sbi, nid_t nid)
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: out-of-range nid=%x, run fsck to fix.",
 			  __func__, nid);
+		f2fs_handle_error(sbi, ERROR_CORRUPTED_INODE);
 		return -EFSCORRUPTED;
 	}
 	return 0;
@@ -1295,6 +1296,7 @@ struct page *f2fs_new_node_page(struct dnode_of_data *dn, unsigned int ofs)
 	if (unlikely(new_ni.blk_addr != NULL_ADDR)) {
 		err = -EFSCORRUPTED;
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 		goto fail;
 	}
 #endif
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 5c9facec98f6..dea95b48b647 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -507,6 +507,7 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 	if (ofs_in_node >= max_addrs) {
 		f2fs_err(sbi, "Inconsistent ofs_in_node:%u in summary, ino:%lu, nid:%u, max:%u",
 			ofs_in_node, dn->inode->i_ino, nid, max_addrs);
+		f2fs_handle_error(sbi, ERROR_INCONSISTENT_SUMMARY);
 		return -EFSCORRUPTED;
 	}
 
@@ -637,6 +638,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 			  inode->i_ino, ofs_of_node(dn.node_page),
 			  ofs_of_node(page));
 		err = -EFSCORRUPTED;
+		f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
 		goto err;
 	}
 
@@ -649,12 +651,14 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 		if (__is_valid_data_blkaddr(src) &&
 			!f2fs_is_valid_blkaddr(sbi, src, META_POR)) {
 			err = -EFSCORRUPTED;
+			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 			goto err;
 		}
 
 		if (__is_valid_data_blkaddr(dest) &&
 			!f2fs_is_valid_blkaddr(sbi, dest, META_POR)) {
 			err = -EFSCORRUPTED;
+			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
 			goto err;
 		}
 
@@ -712,6 +716,8 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 				f2fs_err(sbi, "Inconsistent dest blkaddr:%u, ino:%lu, ofs:%u",
 					dest, inode->i_ino, dn.ofs_in_node);
 				err = -EFSCORRUPTED;
+				f2fs_handle_error(sbi,
+						ERROR_INVALID_BLKADDR);
 				goto err;
 			}
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 4ed84510f195..5619f2916335 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -326,6 +326,8 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
 					DATA_GENERIC_ENHANCE)) {
 				f2fs_put_dnode(&dn);
 				ret = -EFSCORRUPTED;
+				f2fs_handle_error(sbi,
+						ERROR_INVALID_BLKADDR);
 				goto out;
 			}
 
@@ -3447,6 +3449,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 		f2fs_warn(sbi, "%s: incorrect segment(%u) type, run fsck to fix.",
 			  __func__, segno);
 		err = -EFSCORRUPTED;
+		f2fs_handle_error(sbi, ERROR_INCONSISTENT_SUM_TYPE);
 		goto drop_bio;
 	}
 
@@ -4395,6 +4398,8 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 			if (se->type >= NR_PERSISTENT_LOG) {
 				f2fs_err(sbi, "Invalid segment type: %u, segno: %u",
 							se->type, start);
+				f2fs_handle_error(sbi,
+						ERROR_INCONSISTENT_SUM_TYPE);
 				return -EFSCORRUPTED;
 			}
 
@@ -4431,6 +4436,7 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 			f2fs_err(sbi, "Wrong journal entry on segno %u",
 				 start);
 			err = -EFSCORRUPTED;
+			f2fs_handle_error(sbi, ERROR_CORRUPTED_JOURNAL);
 			break;
 		}
 
@@ -4450,6 +4456,7 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 			f2fs_err(sbi, "Invalid segment type: %u, segno: %u",
 							se->type, start);
 			err = -EFSCORRUPTED;
+			f2fs_handle_error(sbi, ERROR_INCONSISTENT_SUM_TYPE);
 			break;
 		}
 
@@ -4481,6 +4488,7 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 	if (sit_valid_blocks[NODE] != valid_node_count(sbi)) {
 		f2fs_err(sbi, "SIT is corrupted node# %u vs %u",
 			 sit_valid_blocks[NODE], valid_node_count(sbi));
+		f2fs_handle_error(sbi, ERROR_INCONSISTENT_NODE_COUNT);
 		return -EFSCORRUPTED;
 	}
 
@@ -4489,6 +4497,7 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 		f2fs_err(sbi, "SIT is corrupted data# %u %u vs %u",
 			 sit_valid_blocks[DATA], sit_valid_blocks[NODE],
 			 valid_user_blocks(sbi));
+		f2fs_handle_error(sbi, ERROR_INCONSISTENT_BLOCK_COUNT);
 		return -EFSCORRUPTED;
 	}
 
@@ -4639,6 +4648,7 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
 			f2fs_err(sbi,
 				 "Current segment has invalid alloc_type:%d",
 				 curseg->alloc_type);
+			f2fs_handle_error(sbi, ERROR_INVALID_CURSEG);
 			return -EFSCORRUPTED;
 		}
 
@@ -4656,6 +4666,7 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
 				 "Current segment's next free block offset is inconsistent with bitmap, logtype:%u, segno:%u, type:%u, next_blkoff:%u, blkofs:%u",
 				 i, curseg->segno, curseg->alloc_type,
 				 curseg->next_blkoff, blkofs);
+			f2fs_handle_error(sbi, ERROR_INVALID_CURSEG);
 			return -EFSCORRUPTED;
 		}
 	}
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index d1d63766f2c7..be8f2d7d007b 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -753,6 +753,7 @@ static inline int check_block_count(struct f2fs_sb_info *sbi,
 		f2fs_err(sbi, "Mismatch valid blocks %d vs. %d",
 			 GET_SIT_VBLOCKS(raw_sit), valid_blocks);
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_handle_error(sbi, ERROR_INCONSISTENT_SIT);
 		return -EFSCORRUPTED;
 	}
 
@@ -767,6 +768,7 @@ static inline int check_block_count(struct f2fs_sb_info *sbi,
 		f2fs_err(sbi, "Wrong valid blocks %d or segno %u",
 			 GET_SIT_VBLOCKS(raw_sit), segno);
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_handle_error(sbi, ERROR_INCONSISTENT_SIT);
 		return -EFSCORRUPTED;
 	}
 	return 0;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 2533d309a924..ee0a5a17ba39 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3847,12 +3847,11 @@ int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
 }
 
 void f2fs_handle_stop(struct f2fs_sb_info *sbi, unsigned char reason)
+
 {
 	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
 	int err;
 
-	f2fs_bug_on(sbi, reason >= MAX_STOP_REASON);
-
 	f2fs_down_write(&sbi->sb_lock);
 
 	if (raw_super->s_stop_reason[reason] < ((1 << BITS_PER_BYTE) - 1))
@@ -3862,7 +3861,51 @@ void f2fs_handle_stop(struct f2fs_sb_info *sbi, unsigned char reason)
 	if (err)
 		f2fs_err(sbi, "f2fs_commit_super fails to record reason:%u err:%d",
 								reason, err);
+	f2fs_up_write(&sbi->sb_lock);
+}
+
+static void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag)
+{
+	spin_lock(&sbi->error_lock);
+	if (!test_bit(flag, (unsigned long *)sbi->errors)) {
+		set_bit(flag, (unsigned long *)sbi->errors);
+		sbi->error_dirty = true;
+	}
+	spin_unlock(&sbi->error_lock);
+}
+
+static bool f2fs_update_errors(struct f2fs_sb_info *sbi)
+{
+	bool need_update = false;
+
+	spin_lock(&sbi->error_lock);
+	if (sbi->error_dirty) {
+		memcpy(F2FS_RAW_SUPER(sbi)->s_errors, sbi->errors,
+							MAX_F2FS_ERRORS);
+		sbi->error_dirty = false;
+		need_update = true;
+	}
+	spin_unlock(&sbi->error_lock);
+
+	return need_update;
+}
+
+void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error)
+{
+	int err;
+
+	f2fs_save_errors(sbi, error);
+
+	f2fs_down_write(&sbi->sb_lock);
 
+	if (!f2fs_update_errors(sbi))
+		goto out_unlock;
+
+	err = f2fs_commit_super(sbi, false);
+	if (err)
+		f2fs_err(sbi, "f2fs_commit_super fails to record errors:%u, err:%d",
+								error, err);
+out_unlock:
 	f2fs_up_write(&sbi->sb_lock);
 }
 
@@ -4213,6 +4256,9 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		goto free_devices;
 	}
 
+	spin_lock_init(&sbi->error_lock);
+	memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
+
 	sbi->total_valid_node_count =
 				le32_to_cpu(sbi->ckpt->valid_node_count);
 	percpu_counter_set(&sbi->total_valid_inode_count,
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 97ec60f39d69..f0805e51b3fe 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -240,6 +240,8 @@ static int f2fs_get_verity_descriptor(struct inode *inode, void *buf,
 	if (pos + size < pos || pos + size > inode->i_sb->s_maxbytes ||
 	    pos < f2fs_verity_metadata_pos(inode) || size > INT_MAX) {
 		f2fs_warn(F2FS_I_SB(inode), "invalid verity xattr");
+		f2fs_handle_error(F2FS_I_SB(inode),
+				ERROR_CORRUPTED_VERITY_XATTR);
 		return -EFSCORRUPTED;
 	}
 	if (buf_size) {
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index c76c15086e5f..dc2e8637189e 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -367,6 +367,8 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
 								inode->i_ino);
 		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
 		err = -EFSCORRUPTED;
+		f2fs_handle_error(F2FS_I_SB(inode),
+					ERROR_CORRUPTED_XATTR);
 		goto out;
 	}
 check:
@@ -583,6 +585,8 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
 						inode->i_ino);
 			set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
 			error = -EFSCORRUPTED;
+			f2fs_handle_error(F2FS_I_SB(inode),
+						ERROR_CORRUPTED_XATTR);
 			goto cleanup;
 		}
 
@@ -658,6 +662,8 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 								inode->i_ino);
 		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
 		error = -EFSCORRUPTED;
+		f2fs_handle_error(F2FS_I_SB(inode),
+					ERROR_CORRUPTED_XATTR);
 		goto exit;
 	}
 
@@ -684,6 +690,8 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 					inode->i_ino, ENTRY_SIZE(last));
 			set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_FSCK);
 			error = -EFSCORRUPTED;
+			f2fs_handle_error(F2FS_I_SB(inode),
+						ERROR_CORRUPTED_XATTR);
 			goto exit;
 		}
 		last = XATTR_NEXT_ENTRY(last);
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 5dd1e52b8997..ee0d75d9a302 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -87,6 +87,28 @@ enum stop_cp_reason {
 
 #define	MAX_STOP_REASON			32
 
+/* detail reason for EFSCORRUPTED */
+enum f2fs_error {
+	ERROR_CORRUPTED_CLUSTER,
+	ERROR_FAIL_DECOMPRESSION,
+	ERROR_INVALID_BLKADDR,
+	ERROR_CORRUPTED_DIRENT,
+	ERROR_CORRUPTED_INODE,
+	ERROR_INCONSISTENT_SUMMARY,
+	ERROR_INCONSISTENT_FOOTER,
+	ERROR_INCONSISTENT_SUM_TYPE,
+	ERROR_CORRUPTED_JOURNAL,
+	ERROR_INCONSISTENT_NODE_COUNT,
+	ERROR_INCONSISTENT_BLOCK_COUNT,
+	ERROR_INVALID_CURSEG,
+	ERROR_INCONSISTENT_SIT,
+	ERROR_CORRUPTED_VERITY_XATTR,
+	ERROR_CORRUPTED_XATTR,
+	ERROR_MAX,
+};
+
+#define MAX_F2FS_ERRORS			16
+
 struct f2fs_super_block {
 	__le32 magic;			/* Magic Number */
 	__le16 major_ver;		/* Major Version */
@@ -131,7 +153,8 @@ struct f2fs_super_block {
 	__le16  s_encoding;		/* Filename charset encoding */
 	__le16  s_encoding_flags;	/* Filename charset encoding flags */
 	__u8 s_stop_reason[MAX_STOP_REASON];	/* stop checkpoint reason */
-	__u8 reserved[274];		/* valid reserved region */
+	__u8 s_errors[MAX_F2FS_ERRORS];		/* reason of image corrupts */
+	__u8 reserved[258];		/* valid reserved region */
 	__le32 crc;			/* checksum of superblock */
 } __packed;
 
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
