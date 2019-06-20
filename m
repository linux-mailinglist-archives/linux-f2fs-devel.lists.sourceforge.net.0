Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7FB4C5DD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2019 05:37:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdntQ-0000s7-7N; Thu, 20 Jun 2019 03:37:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hdntP-0000ru-EW
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 03:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zNhD50wcuhF/iGupLiixsAH2zN1kVl04MJWfd+0KY/E=; b=d0J2UBRojCIl6rcybAWIBhKx40
 CIG9Qeune91ZTRcA4KNGlN4OHudbaKkxNymCUb1T/IeawIdO0RDdaRpPqNptQkcPxHtVaB7+RK9w0
 BS3/Uuo/OK/xtaMRHPGuWnJbFT2pgYB62BgOkwJq+AzMW5crXXjCzY8kniomlQBKmcL0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zNhD50wcuhF/iGupLiixsAH2zN1kVl04MJWfd+0KY/E=; b=D
 lKHxhRvQ59QsdgawXQ79Pd8GWdVLp/+mxljZ5YvYUWvsY2RjsPjpub/3iI3MspdUA1XSOCBi8Umyv
 EsckQZybXZHvqVIlVnmg2YGGZ9jE+dXK9XORkT+BQzO+B6uiJKkIqdElyPvENhRy13ZkYggN4Q33N
 A2rX61OJ9y1WsWvo=;
Received: from szxga08-in.huawei.com ([45.249.212.255] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hdntO-005agT-DC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 03:37:44 +0000
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id 79E42C6F506DCBE3CE4B;
 Thu, 20 Jun 2019 11:37:35 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 20 Jun 2019 11:37:34 +0800
Received: from szvp000201624.huawei.com (10.120.216.130) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 20 Jun 2019 11:37:25 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 20 Jun 2019 11:36:14 +0800
Message-ID: <20190620033615.32284-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: ucw.cz]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hdntO-005agT-DC
Subject: [f2fs-dev] [PATCH 1/2] f2fs: use generic EFSBADCRC/EFSCORRUPTED
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
Cc: linux-kernel@vger.kernel.org, pavel@ucw.cz,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs uses EFAULT as error number to indicate filesystem is corrupted
all the time, but generic filesystems use EUCLEAN for such condition,
we need to change to follow others.

This patch adds two new macros as below to wrap more generic error
code macros, and spread them in code.

EFSBADCRC	EBADMSG		/* Bad CRC detected */
EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */

Reported-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/checkpoint.c | 12 +++++++++---
 fs/f2fs/data.c       | 18 +++++++++---------
 fs/f2fs/dir.c        |  2 +-
 fs/f2fs/f2fs.h       |  3 +++
 fs/f2fs/file.c       |  2 +-
 fs/f2fs/gc.c         |  6 +++---
 fs/f2fs/inline.c     |  4 ++--
 fs/f2fs/inode.c      |  4 ++--
 fs/f2fs/node.c       |  6 +++---
 fs/f2fs/recovery.c   |  6 +++---
 fs/f2fs/segment.c    | 10 +++++-----
 fs/f2fs/segment.h    |  4 ++--
 fs/f2fs/super.c      |  2 +-
 fs/f2fs/xattr.c      |  4 ++--
 14 files changed, 46 insertions(+), 37 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 62c359c91668..a0eef95b9e0e 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -890,6 +890,7 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi)
 	unsigned int cp_blks = 1 + __cp_payload(sbi);
 	block_t cp_blk_no;
 	int i;
+	int err;
 
 	sbi->ckpt = f2fs_kzalloc(sbi, array_size(blk_size, cp_blks),
 				 GFP_KERNEL);
@@ -917,6 +918,7 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi)
 	} else if (cp2) {
 		cur_page = cp2;
 	} else {
+		err = -EFSCORRUPTED;
 		goto fail_no_cp;
 	}
 
@@ -929,8 +931,10 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi)
 		sbi->cur_cp_pack = 2;
 
 	/* Sanity checking of checkpoint */
-	if (f2fs_sanity_check_ckpt(sbi))
+	if (f2fs_sanity_check_ckpt(sbi)) {
+		err = -EFSCORRUPTED;
 		goto free_fail_no_cp;
+	}
 
 	if (cp_blks <= 1)
 		goto done;
@@ -944,8 +948,10 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi)
 		unsigned char *ckpt = (unsigned char *)sbi->ckpt;
 
 		cur_page = f2fs_get_meta_page(sbi, cp_blk_no + i);
-		if (IS_ERR(cur_page))
+		if (IS_ERR(cur_page)) {
+			err = PTR_ERR(cur_page);
 			goto free_fail_no_cp;
+		}
 		sit_bitmap_ptr = page_address(cur_page);
 		memcpy(ckpt + i * blk_size, sit_bitmap_ptr, blk_size);
 		f2fs_put_page(cur_page, 1);
@@ -960,7 +966,7 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi)
 	f2fs_put_page(cp2, 1);
 fail_no_cp:
 	kvfree(sbi->ckpt);
-	return -EINVAL;
+	return err;
 }
 
 static void __add_dirty_inode(struct inode *inode, enum inode_type type)
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f4e1672bd96e..1e2d924e2ea7 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -455,7 +455,7 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
 			fio->is_por ? META_POR : (__is_meta_io(fio) ?
 			META_GENERIC : DATA_GENERIC_ENHANCE)))
-		return -EFAULT;
+		return -EFSCORRUPTED;
 
 	trace_f2fs_submit_page_bio(page, fio);
 	f2fs_trace_ios(fio, 0);
@@ -489,7 +489,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 
 	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
 			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC))
-		return -EFAULT;
+		return -EFSCORRUPTED;
 
 	trace_f2fs_submit_page_bio(page, fio);
 	f2fs_trace_ios(fio, 0);
@@ -789,7 +789,7 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 		dn.data_blkaddr = ei.blk + index - ei.fofs;
 		if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), dn.data_blkaddr,
 						DATA_GENERIC_ENHANCE_READ)) {
-			err = -EFAULT;
+			err = -EFSCORRUPTED;
 			goto put_err;
 		}
 		goto got_it;
@@ -809,7 +809,7 @@ struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 			!f2fs_is_valid_blkaddr(F2FS_I_SB(inode),
 						dn.data_blkaddr,
 						DATA_GENERIC_ENHANCE)) {
-		err = -EFAULT;
+		err = -EFSCORRUPTED;
 		goto put_err;
 	}
 got_it:
@@ -1155,7 +1155,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 
 	if (__is_valid_data_blkaddr(blkaddr) &&
 		!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE)) {
-		err = -EFAULT;
+		err = -EFSCORRUPTED;
 		goto sync_out;
 	}
 
@@ -1625,7 +1625,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 
 		if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode), block_nr,
 						DATA_GENERIC_ENHANCE_READ)) {
-			ret = -EFAULT;
+			ret = -EFSCORRUPTED;
 			goto out;
 		}
 	} else {
@@ -1906,7 +1906,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 
 		if (!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
 						DATA_GENERIC_ENHANCE))
-			return -EFAULT;
+			return -EFSCORRUPTED;
 
 		ipu_force = true;
 		fio->need_lock = LOCK_DONE;
@@ -1933,7 +1933,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	if (__is_valid_data_blkaddr(fio->old_blkaddr) &&
 		!f2fs_is_valid_blkaddr(fio->sbi, fio->old_blkaddr,
 						DATA_GENERIC_ENHANCE)) {
-		err = -EFAULT;
+		err = -EFSCORRUPTED;
 		goto out_writepage;
 	}
 	/*
@@ -2606,7 +2606,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 	} else {
 		if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
 				DATA_GENERIC_ENHANCE_READ)) {
-			err = -EFAULT;
+			err = -EFSCORRUPTED;
 			goto fail;
 		}
 		err = f2fs_submit_page_read(inode, page, blkaddr);
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 0e78edbb8e16..85a1528f319f 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -818,7 +818,7 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
 			f2fs_warn(sbi, "%s: corrupted namelen=%d, run fsck to fix.",
 				  __func__, le16_to_cpu(de->name_len));
 			set_sbi_flag(sbi, SBI_NEED_FSCK);
-			err = -EINVAL;
+			err = -EFSCORRUPTED;
 			goto out;
 		}
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9afe15675dbb..d6c2aaae6cb2 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3709,4 +3709,7 @@ static inline bool is_journalled_quota(struct f2fs_sb_info *sbi)
 	return false;
 }
 
+#define EFSBADCRC	EBADMSG		/* Bad CRC detected */
+#define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
+
 #endif /* _LINUX_F2FS_H */
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 1180eca87933..ef64eba42a42 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1023,7 +1023,7 @@ static int __read_out_blkaddrs(struct inode *inode, block_t *blkaddr,
 			!f2fs_is_valid_blkaddr(sbi, *blkaddr,
 					DATA_GENERIC_ENHANCE)) {
 			f2fs_put_dnode(&dn);
-			return -EFAULT;
+			return -EFSCORRUPTED;
 		}
 
 		if (!f2fs_is_checkpointed_data(sbi, *blkaddr)) {
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 5b1076505ade..44b770143b51 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -660,7 +660,7 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 		dn.data_blkaddr = ei.blk + index - ei.fofs;
 		if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
 						DATA_GENERIC_ENHANCE_READ))) {
-			err = -EFAULT;
+			err = -EFSCORRUPTED;
 			goto put_page;
 		}
 		goto got_it;
@@ -678,7 +678,7 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 	}
 	if (unlikely(!f2fs_is_valid_blkaddr(sbi, dn.data_blkaddr,
 						DATA_GENERIC_ENHANCE))) {
-		err = -EFAULT;
+		err = -EFSCORRUPTED;
 		goto put_page;
 	}
 got_it:
@@ -1452,7 +1452,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
 
 	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK)) {
 		f2fs_err(sbi, "Should run fsck to repair first.");
-		return -EINVAL;
+		return -EFSCORRUPTED;
 	}
 
 	if (test_opt(sbi, DISABLE_CHECKPOINT)) {
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 0d2764c9912d..3613efca8c00 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -142,7 +142,7 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
 		set_sbi_flag(fio.sbi, SBI_NEED_FSCK);
 		f2fs_warn(fio.sbi, "%s: corrupted inline inode ino=%lx, i_addr[0]:0x%x, run fsck to fix.",
 			  __func__, dn->inode->i_ino, dn->data_blkaddr);
-		return -EINVAL;
+		return -EFSCORRUPTED;
 	}
 
 	f2fs_bug_on(F2FS_P_SB(page), PageWriteback(page));
@@ -383,7 +383,7 @@ static int f2fs_move_inline_dirents(struct inode *dir, struct page *ipage,
 		set_sbi_flag(F2FS_P_SB(page), SBI_NEED_FSCK);
 		f2fs_warn(F2FS_P_SB(page), "%s: corrupted inline inode ino=%lx, i_addr[0]:0x%x, run fsck to fix.",
 			  __func__, dir->i_ino, dn.data_blkaddr);
-		err = -EINVAL;
+		err = -EFSCORRUPTED;
 		goto out;
 	}
 
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 9ea3aedb8213..a33d7a849b2d 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -74,7 +74,7 @@ static int __written_first_block(struct f2fs_sb_info *sbi,
 	if (!__is_valid_data_blkaddr(addr))
 		return 1;
 	if (!f2fs_is_valid_blkaddr(sbi, addr, DATA_GENERIC_ENHANCE))
-		return -EFAULT;
+		return -EFSCORRUPTED;
 	return 0;
 }
 
@@ -358,7 +358,7 @@ static int do_read_inode(struct inode *inode)
 
 	if (!sanity_check_inode(inode, node_page)) {
 		f2fs_put_page(node_page, 1);
-		return -EINVAL;
+		return -EFSCORRUPTED;
 	}
 
 	/* check data exist */
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 4d9b4c58d8a9..a18b2a895771 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -36,7 +36,7 @@ int f2fs_check_nid_range(struct f2fs_sb_info *sbi, nid_t nid)
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: out-of-range nid=%x, run fsck to fix.",
 			  __func__, nid);
-		return -EINVAL;
+		return -EFSCORRUPTED;
 	}
 	return 0;
 }
@@ -1288,7 +1288,7 @@ static int read_node_page(struct page *page, int op_flags)
 	if (PageUptodate(page)) {
 		if (!f2fs_inode_chksum_verify(sbi, page)) {
 			ClearPageUptodate(page);
-			return -EBADMSG;
+			return -EFSBADCRC;
 		}
 		return LOCKED_PAGE;
 	}
@@ -1372,7 +1372,7 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
 	}
 
 	if (!f2fs_inode_chksum_verify(sbi, page)) {
-		err = -EBADMSG;
+		err = -EFSBADCRC;
 		goto out_err;
 	}
 page_hit:
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 72c2c4ba795f..783773e4560d 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -553,7 +553,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 		f2fs_warn(sbi, "Inconsistent ofs_of_node, ino:%lu, ofs:%u, %u",
 			  inode->i_ino, ofs_of_node(dn.node_page),
 			  ofs_of_node(page));
-		err = -EFAULT;
+		err = -EFSCORRUPTED;
 		goto err;
 	}
 
@@ -565,13 +565,13 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 
 		if (__is_valid_data_blkaddr(src) &&
 			!f2fs_is_valid_blkaddr(sbi, src, META_POR)) {
-			err = -EFAULT;
+			err = -EFSCORRUPTED;
 			goto err;
 		}
 
 		if (__is_valid_data_blkaddr(dest) &&
 			!f2fs_is_valid_blkaddr(sbi, dest, META_POR)) {
-			err = -EFAULT;
+			err = -EFSCORRUPTED;
 			goto err;
 		}
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index ee96e6fb1a50..478284db3065 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2819,7 +2819,7 @@ int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
 
 	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK)) {
 		f2fs_warn(sbi, "Found FS corruption, run fsck to fix.");
-		return -EIO;
+		return -EFSCORRUPTED;
 	}
 
 	/* start/end segment number in main_area */
@@ -3244,7 +3244,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: incorrect segment(%u) type, run fsck to fix.",
 			  __func__, segno);
-		return -EFAULT;
+		return -EFSCORRUPTED;
 	}
 
 	stat_inc_inplace_blocks(fio->sbi);
@@ -4153,7 +4153,7 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 			f2fs_err(sbi, "Wrong journal entry on segno %u",
 				 start);
 			set_sbi_flag(sbi, SBI_NEED_FSCK);
-			err = -EINVAL;
+			err = -EFSCORRUPTED;
 			break;
 		}
 
@@ -4193,7 +4193,7 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 		f2fs_err(sbi, "SIT is corrupted node# %u vs %u",
 			 total_node_blocks, valid_node_count(sbi));
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
-		err = -EINVAL;
+		err = -EFSCORRUPTED;
 	}
 
 	return err;
@@ -4311,7 +4311,7 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
 				 "Current segment's next free block offset is inconsistent with bitmap, logtype:%u, segno:%u, type:%u, next_blkoff:%u, blkofs:%u",
 				 i, curseg->segno, curseg->alloc_type,
 				 curseg->next_blkoff, blkofs);
-			return -EINVAL;
+			return -EFSCORRUPTED;
 		}
 	}
 	return 0;
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 166ac0f07a4e..2263c3fa6630 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -696,7 +696,7 @@ static inline int check_block_count(struct f2fs_sb_info *sbi,
 		f2fs_err(sbi, "Mismatch valid blocks %d vs. %d",
 			 GET_SIT_VBLOCKS(raw_sit), valid_blocks);
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
-		return -EINVAL;
+		return -EFSCORRUPTED;
 	}
 
 	/* check segment usage, and check boundary of a given segment number */
@@ -705,7 +705,7 @@ static inline int check_block_count(struct f2fs_sb_info *sbi,
 		f2fs_err(sbi, "Wrong valid blocks %d or segno %u",
 			 GET_SIT_VBLOCKS(raw_sit), segno);
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
-		return -EINVAL;
+		return -EFSCORRUPTED;
 	}
 	return 0;
 }
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 25eca9f14554..7f2829b1192e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2861,7 +2861,7 @@ static int read_raw_super_block(struct f2fs_sb_info *sbi,
 		if (sanity_check_raw_super(sbi, bh)) {
 			f2fs_err(sbi, "Can't find valid F2FS filesystem in %dth superblock",
 				 block + 1);
-			err = -EINVAL;
+			err = -EFSCORRUPTED;
 			brelse(bh);
 			continue;
 		}
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index e791741d193b..963242018663 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -346,7 +346,7 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
 
 	*xe = __find_xattr(cur_addr, last_txattr_addr, index, len, name);
 	if (!*xe) {
-		err = -EFAULT;
+		err = -EFSCORRUPTED;
 		goto out;
 	}
 check:
@@ -622,7 +622,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 	/* find entry with wanted name. */
 	here = __find_xattr(base_addr, last_base_addr, index, len, name);
 	if (!here) {
-		error = -EFAULT;
+		error = -EFSCORRUPTED;
 		goto exit;
 	}
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
