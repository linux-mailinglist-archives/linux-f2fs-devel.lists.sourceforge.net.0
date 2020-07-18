Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BB8224930
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 Jul 2020 08:15:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jwg7x-0001N2-IC; Sat, 18 Jul 2020 06:15:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jwg7w-0001Mw-Sv
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Jul 2020 06:15:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2dolGngO6Ica6LcAK4ykuAyAcyxMSqfgCUjBqlz8DIM=; b=e7mQ/lp5T4jm2Y3xOoJ3wa1aU6
 gwEJJ5DG1nwHmrcbO5dROamoPMQOs6U3dIH/0le1oxCA4toozEhNWPvBTYxAfQDD8lVh9b+A//IOk
 907fIsVUTCZOg+x0RKjK8/MX80wMdpk/h3EzNXfcAQwSyJMJjm9mh7kVohgYC17hmuQk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2dolGngO6Ica6LcAK4ykuAyAcyxMSqfgCUjBqlz8DIM=; b=n
 DCCR4BQMC3jwYPknx/4tI8eEbZGd1GVHd70+Et8CCyaGST9WJduhsOLwk0W/+MzQ5+8xBPyFYJTPz
 sLr8qjFnCOOtTVVqwN7CGC0VEqvXxiH6Mfn3reehq0wSK6JwJk9xAjhbjkKyfTe/5jdr8qJQvVwb2
 2Hfi+8Q9fEz/TbsI=;
Received: from mail-pl1-f195.google.com ([209.85.214.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jwg7t-005LF1-30
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Jul 2020 06:15:16 +0000
Received: by mail-pl1-f195.google.com with SMTP id q17so6308397pls.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Jul 2020 23:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2dolGngO6Ica6LcAK4ykuAyAcyxMSqfgCUjBqlz8DIM=;
 b=ngvgMUQgSoVPAOEJyXApTHVTGN3lXobD+2km/b1nVQbuaUvFn10uc3SZy2M4UuMupv
 VNmfQKnzXMSd5SqjvaZmO6MES6HJzZTOTKuZUwbcK4Xb8Ahkoyu43CuqWNzBUW5y2Ntn
 TXpj42+qY+ZNajuueZstnkxrba6jRGHU0QgJ2XVwSLlSdqiPKvvdQtGf2tohb7Sf2Wm6
 RABL2VqgBsA0ncgT3k8qPNT/xt4WZW1ATXxfuzQhioRsQNKc1LRb8FGpVcqjYs3doNzp
 Zq9iT0dZbaSV1tCvUKmg/LcRVesoT8WIvnS2nfUso47k0TZG1iCJsjtMKhF1ut1veIIJ
 bvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2dolGngO6Ica6LcAK4ykuAyAcyxMSqfgCUjBqlz8DIM=;
 b=qhRJmFLCqskz155UHelRVEEMC70minLPgOGtEAwzxsZ/GpMwfLf6wxGhy+15I1Ei85
 st4ITQI8T2fBvv+M5c5YpGrZd/gtb4WXMEXVXOvB5XfgTPo1syatWELfmANWRYbldkPI
 4LueLLPLBE8WMvMUXQUqsYODcnmg9XVcIge1jsJGQKOnTRYpy67wXDlMLKjmAvYzzR4y
 9/kxNyC1FqOl6anxMt3OsOyi1y6+s5u3Obu+UTBSwk+0WTm4VsyStpQaqdVe4IVRJ97y
 59kNvdbCkCDP9yYLnfMkN90n+rqKgfTu8ObvVb8i7JpY5cbBpM91nhCH3xSjGmElAJYm
 H4Kw==
X-Gm-Message-State: AOAM530NyF9SBJTWrdbNzv82fqDjWZYuBMqZbkfzhp0+I7SArgopUOaG
 L9aJoEqlaiZZI7zq8RecEB0=
X-Google-Smtp-Source: ABdhPJzuSC1Zs7tJXjkemq5GuaDsSsiKrZbmPdgzcAIt/GzddBMo4noccd36CZMHH1mOupuwtxroxQ==
X-Received: by 2002:a17:902:b683:: with SMTP id
 c3mr3148622pls.188.1595052907271; 
 Fri, 17 Jul 2020 23:15:07 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id r70sm9775798pfc.109.2020.07.17.23.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 23:15:06 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Sat, 18 Jul 2020 15:15:00 +0900
Message-Id: <20200718061500.3542710-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.195 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jwg7t-005LF1-30
Subject: [f2fs-dev] [PATCH v2] f2fs: add F2FS_IOC_SEC_TRIM_FILE ioctl
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Added a new ioctl to send discard commands or/and zero out
to selected data area of a regular file for security reason.

The way of handling range.len of F2FS_IOC_SEC_TRIM_FILE:
1. Added -1 value support for range.len to secure trim the whole blocks
   starting from range.start regardless of i_size.
2. If the end of the range passes over the end of file, it means until
   the end of file (i_size).
3. ignored the case of that range.len is zero to prevent the function
   from making end_addr zero and triggering different behaviour of
   the function.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
Changes in v2:
 - Support zeroout for encrypted files
---
 fs/f2fs/f2fs.h |  15 ++++
 fs/f2fs/file.c | 195 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 210 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f29eb1f94f57..bdfb331b6519 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -434,6 +434,8 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
 					_IOR(F2FS_IOCTL_MAGIC, 18, __u64)
 #define F2FS_IOC_RESERVE_COMPRESS_BLOCKS				\
 					_IOR(F2FS_IOCTL_MAGIC, 19, __u64)
+#define F2FS_IOC_SEC_TRIM_FILE		_IOW(F2FS_IOCTL_MAGIC, 20,	\
+						struct f2fs_sectrim_range)
 
 #define F2FS_IOC_GET_VOLUME_NAME	FS_IOC_GETFSLABEL
 #define F2FS_IOC_SET_VOLUME_NAME	FS_IOC_SETFSLABEL
@@ -453,6 +455,13 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
 #define F2FS_GOING_DOWN_METAFLUSH	0x3	/* going down with meta flush */
 #define F2FS_GOING_DOWN_NEED_FSCK	0x4	/* going down to trigger fsck */
 
+/*
+ * Flags used by F2FS_IOC_SEC_TRIM_FILE
+ */
+#define F2FS_TRIM_FILE_DISCARD		0x1	/* send discard command */
+#define F2FS_TRIM_FILE_ZEROOUT		0x2	/* zero out */
+#define F2FS_TRIM_FILE_MASK		0x3
+
 #if defined(__KERNEL__) && defined(CONFIG_COMPAT)
 /*
  * ioctl commands in 32 bit emulation
@@ -488,6 +497,12 @@ struct f2fs_flush_device {
 	u32 segments;		/* # of segments to flush */
 };
 
+struct f2fs_sectrim_range {
+	u64 start;
+	u64 len;
+	u64 flags;
+};
+
 /* for inline stuff */
 #define DEF_INLINE_RESERVED_SIZE	1
 static inline int get_extra_isize(struct inode *inode);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 1af37f3b3309..e0a4a95fbad7 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -21,6 +21,7 @@
 #include <linux/uuid.h>
 #include <linux/file.h>
 #include <linux/nls.h>
+#include <linux/sched/signal.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -3759,6 +3760,197 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	return ret;
 }
 
+static int f2fs_secure_erase(struct block_device *bdev, struct inode *inode,
+		pgoff_t off, block_t block, block_t len, u32 flags)
+{
+	struct request_queue *q = bdev_get_queue(bdev);
+	sector_t sector = SECTOR_FROM_BLOCK(block);
+	sector_t nr_sects = SECTOR_FROM_BLOCK(len);
+	int ret = 0;
+
+	if (!q)
+		return -ENXIO;
+
+	if (flags & F2FS_TRIM_FILE_DISCARD)
+		ret = blkdev_issue_discard(bdev, sector, nr_sects, GFP_NOFS,
+						blk_queue_secure_erase(q) ?
+						BLKDEV_DISCARD_SECURE : 0);
+
+	if (!ret && (flags & F2FS_TRIM_FILE_ZEROOUT)) {
+		if (IS_ENCRYPTED(inode))
+			ret = fscrypt_zeroout_range(inode, off, block, len);
+		else
+			ret = blkdev_issue_zeroout(bdev, sector, nr_sects,
+					GFP_NOFS, 0);
+	}
+
+	return ret;
+}
+
+static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct address_space *mapping = inode->i_mapping;
+	struct block_device *prev_bdev = NULL;
+	struct f2fs_sectrim_range range;
+	pgoff_t index, pg_end, prev_index = 0;
+	block_t prev_block = 0, len = 0;
+	loff_t end_addr;
+	bool to_end = false;
+	int ret = 0;
+
+	if (!(filp->f_mode & FMODE_WRITE))
+		return -EBADF;
+
+	if (copy_from_user(&range, (struct f2fs_sectrim_range __user *)arg,
+				sizeof(range)))
+		return -EFAULT;
+
+	if (range.flags == 0 || (range.flags & ~F2FS_TRIM_FILE_MASK) ||
+			!S_ISREG(inode->i_mode))
+		return -EINVAL;
+
+	if ((range.flags & F2FS_TRIM_FILE_DISCARD) &&
+			!f2fs_hw_support_discard(sbi))
+		return -EOPNOTSUPP;
+
+	file_start_write(filp);
+	inode_lock(inode);
+
+	if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode) ||
+			range.start >= inode->i_size) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	if ((range.flags & F2FS_TRIM_FILE_ZEROOUT) &&
+			IS_ENCRYPTED(inode) && f2fs_is_multi_device(sbi)) {
+		ret = -EOPNOTSUPP;
+		goto err;
+	}
+
+	if (range.len == 0)
+		goto err;
+
+	if (inode->i_size - range.start > range.len) {
+		end_addr = range.start + range.len;
+	} else {
+		end_addr = range.len == (u64)-1 ?
+			sbi->sb->s_maxbytes : inode->i_size;
+		to_end = true;
+	}
+
+	if (!IS_ALIGNED(range.start, F2FS_BLKSIZE) ||
+			(!to_end && !IS_ALIGNED(end_addr, F2FS_BLKSIZE))) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	index = F2FS_BYTES_TO_BLK(range.start);
+	pg_end = DIV_ROUND_UP(end_addr, F2FS_BLKSIZE);
+
+	ret = f2fs_convert_inline_inode(inode);
+	if (ret)
+		goto err;
+
+	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+	down_write(&F2FS_I(inode)->i_mmap_sem);
+
+	ret = filemap_write_and_wait_range(mapping, range.start,
+			to_end ? LLONG_MAX : end_addr - 1);
+	if (ret)
+		goto out;
+
+	truncate_inode_pages_range(mapping, range.start,
+			to_end ? -1 : end_addr - 1);
+
+	while (index < pg_end) {
+		struct dnode_of_data dn;
+		pgoff_t end_offset, count;
+		int i;
+
+		set_new_dnode(&dn, inode, NULL, NULL, 0);
+		ret = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
+		if (ret) {
+			if (ret == -ENOENT) {
+				index = f2fs_get_next_page_offset(&dn, index);
+				continue;
+			}
+			goto out;
+		}
+
+		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
+		count = min(end_offset - dn.ofs_in_node, pg_end - index);
+		for (i = 0; i < count; i++, index++, dn.ofs_in_node++) {
+			struct block_device *cur_bdev;
+			block_t blkaddr = f2fs_data_blkaddr(&dn);
+
+			if (!__is_valid_data_blkaddr(blkaddr))
+				continue;
+
+			if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
+						DATA_GENERIC_ENHANCE)) {
+				ret = -EFSCORRUPTED;
+				f2fs_put_dnode(&dn);
+				goto out;
+			}
+
+			cur_bdev = f2fs_target_device(sbi, blkaddr, NULL);
+			if (f2fs_is_multi_device(sbi)) {
+				int di = f2fs_target_device_index(sbi, blkaddr);
+
+				blkaddr -= FDEV(di).start_blk;
+			}
+
+			if (len) {
+				if (prev_bdev == cur_bdev &&
+						index == prev_index + len &&
+						blkaddr == prev_block + len) {
+					len++;
+				} else {
+					ret = f2fs_secure_erase(prev_bdev,
+						inode, prev_index, prev_block,
+						len, range.flags);
+					if (ret) {
+						f2fs_put_dnode(&dn);
+						goto out;
+					}
+
+					len = 0;
+				}
+			}
+
+			if (!len) {
+				prev_bdev = cur_bdev;
+				prev_index = index;
+				prev_block = blkaddr;
+				len = 1;
+			}
+		}
+
+		f2fs_put_dnode(&dn);
+
+		if (fatal_signal_pending(current)) {
+			ret = -EINTR;
+			goto out;
+		}
+		cond_resched();
+	}
+
+	if (len)
+		ret = f2fs_secure_erase(prev_bdev, inode, prev_index,
+				prev_block, len, range.flags);
+out:
+	up_write(&F2FS_I(inode)->i_mmap_sem);
+	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+err:
+	inode_unlock(inode);
+	file_end_write(filp);
+
+	return ret;
+}
+
 long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
@@ -3845,6 +4037,8 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_release_compress_blocks(filp, arg);
 	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
 		return f2fs_reserve_compress_blocks(filp, arg);
+	case F2FS_IOC_SEC_TRIM_FILE:
+		return f2fs_sec_trim_file(filp, arg);
 	default:
 		return -ENOTTY;
 	}
@@ -4014,6 +4208,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_GET_COMPRESS_BLOCKS:
 	case F2FS_IOC_RELEASE_COMPRESS_BLOCKS:
 	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
+	case F2FS_IOC_SEC_TRIM_FILE:
 		break;
 	default:
 		return -ENOIOCTLCMD;
-- 
2.28.0.rc0.105.gf9edc3c819-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
