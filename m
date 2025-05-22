Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF630AC024E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 May 2025 04:09:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TIBwF+ZLYI2V1F2zdKzFUWMmKej6r3XU/u8YEbvlfto=; b=drrlktFdE/EqOp8Vv0bnceIIbK
	8NF1wCsh041N54Ue2ZuIeAslomCO+JElG2XmQSOPXdfmfpM+x+9wv/81qGvFigzJNZqFXBMciyXqC
	rgzGMeyzGEwwT8iL1sYkeqoWxyGWNKbUDSg4TcdA92RISCOn/sk55YGNE/4xEQWcUQv0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uHvMg-0006aT-Do;
	Thu, 22 May 2025 02:08:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uHvMe-0006aK-IC
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 May 2025 02:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fnrQB3B5+f7nDP+guLxr8tL6FKBe774qoG3B7QM4DXI=; b=epclNx6xi6rkZlYJU6aTnKdXjl
 xw3XMXs11JA07RTFdWFwzarL8D+pQSkzdvW0KC3IjyZAy3xU6XPIYl8BHGJ6TewyFEgoR13oR1KqB
 b2hNdclWkWJ2So+sZ9bIcK62vTwKUldZ4RZG/Jd2ZmgYOofL8J6M/SyQYknfouXq4ONs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fnrQB3B5+f7nDP+guLxr8tL6FKBe774qoG3B7QM4DXI=; b=N
 eiOcSoloYsXHwnaZwGnBCFriMcIntInIJ6QvZy1DNQplfVK/q09RkkVE3aWkbxEgbCfTnPdqd4Rxw
 srozclR91EgntzUOI2LS/89WZD9vQYVbB5S4dEnAhD4AiYINscQAhZoU4SjNtlodMM7h1rhIWKg+r
 rXPKlvIB/g3ds0mE=;
Received: from mta20.honor.com ([81.70.206.69] helo=mta20.hihonor.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uHvMd-00084t-1x for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 May 2025 02:08:56 +0000
Received: from w012.hihonor.com (unknown [10.68.27.189])
 by mta20.hihonor.com (SkyGuard) with ESMTPS id 4b2rpj6YyCzYlnfw;
 Thu, 22 May 2025 09:50:37 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w012.hihonor.com
 (10.68.27.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 22 May
 2025 09:52:46 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 22 May
 2025 09:52:46 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 22 May 2025 09:52:44 +0800
Message-ID: <20250522015244.4132723-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w012.hihonor.com (10.68.27.189) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch add a ioctl to estimate compression gain. In user
 mode compression, users can define the interval between clusters for estimation
 sampling before compress and release ioctl to a file. This [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [81.70.206.69 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [81.70.206.69 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1uHvMd-00084t-1x
Subject: [f2fs-dev] [PATCH] f2fs : add a ioctl to estimate compression gain
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
Cc: feng.han@honor.com, linux-kernel@vger.kernel.org, tao.wangtao@honor.com,
 wangzijie <wangzijie1@honor.com>, linux-f2fs-devel@lists.sourceforge.net,
 wangqi13@honor.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch add a ioctl to estimate compression gain. In user mode compression, users can define 
the interval between clusters for estimation sampling before compress and release ioctl to a file.
This can help users to decide whether to do compress in a fast way, especially for some large files.

Signed-off-by: wangqi <wangqi13@honor.com>
Signed-off-by: wangzijie <wangzijie1@honor.com>
---
 fs/f2fs/compress.c        | 107 ++++++++++++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h            |   5 ++
 fs/f2fs/file.c            |  38 +++++++++++++-
 include/uapi/linux/f2fs.h |   8 +++
 4 files changed, 157 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 9b9481067..3fe160245 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1621,6 +1621,113 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
 	return err;
 }
 
+int f2fs_estimate_compress(struct inode *inode,
+					struct f2fs_comp_estimate *estimate)
+{
+	unsigned long step, cluster_idx, nr_cluster;
+	block_t i, k;
+	pgoff_t page_idx;
+	int ret = 0;
+	__u64 saved_blocks = 0, compressible_clusters = 0;
+	struct page *page;
+	DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, 0);
+	struct compress_ctx cc = {
+		.inode = inode,
+		.log_cluster_size = 0,
+		.cluster_size = 0,
+		.cluster_idx = NULL_CLUSTER,
+		.rpages = NULL,
+		.nr_rpages = 0,
+		.cpages = NULL,
+		.rbuf = NULL,
+		.cbuf = NULL,
+		.rlen = 0,
+		.private = NULL,
+	};
+
+	inode_lock_shared(inode);
+
+	cc.log_cluster_size = F2FS_I(inode)->i_log_cluster_size;
+	cc.cluster_size = F2FS_I(inode)->i_cluster_size;
+	cc.rlen = PAGE_SIZE * F2FS_I(inode)->i_cluster_size;
+
+	nr_cluster = (i_size_read(inode) + F2FS_BLKSIZE - 1) >>
+			(F2FS_BLKSIZE_BITS + cc.log_cluster_size);
+
+	if (!(nr_cluster >> (1 + estimate->log_sample_density))) {
+		ret = -EINVAL;
+		goto unlock_out;
+	}
+
+	if (f2fs_init_compress_ctx(&cc)) {
+		ret = -ENOMEM;
+		goto unlock_out;
+	}
+
+	step = nr_cluster >> estimate->log_sample_density;
+
+	for (cluster_idx = 0; cluster_idx < nr_cluster;
+		cluster_idx += step) {
+		page_idx = cluster_idx << F2FS_I(inode)->i_log_cluster_size;
+
+		if (f2fs_is_compressed_cluster(inode, page_idx))
+			continue;
+
+		ractl._index = page_idx;
+		page_cache_ra_unbounded(&ractl, cc.cluster_size, 0);
+
+		for (i = 0; i < cc.cluster_size; ++i) {
+			page = read_cache_page(inode->i_mapping, page_idx + i, NULL, NULL);
+			if (IS_ERR(page)) {
+				ret = PTR_ERR(page);
+				goto err_out;
+			}
+			f2fs_compress_ctx_add_page(&cc, page_folio(page));
+		}
+
+		ret = f2fs_compress_pages(&cc);
+		if (ret) {
+			if (ret == -EAGAIN)
+				goto free_rpages;
+			else
+				goto err_out;
+		}
+
+		saved_blocks += cc.cluster_size - cc.valid_nr_cpages;
+		compressible_clusters++;
+
+		for (k = 0; k < cc.nr_cpages; ++k) {
+			f2fs_compress_free_page(cc.cpages[k]);
+			cc.cpages[k] = NULL;
+		}
+
+		page_array_free(cc.inode, cc.cpages, cc.nr_cpages);
+free_rpages:
+		f2fs_put_rpages(&cc);
+		cc.nr_rpages = 0;
+		cc.cluster_idx = NULL_CLUSTER;
+	}
+
+	f2fs_destroy_compress_ctx(&cc, false);
+	inode_unlock_shared(inode);
+
+	estimate->saved_blocks = saved_blocks;
+	estimate->compressible_clusters = compressible_clusters;
+
+	if (ret == -EAGAIN)
+		ret = 0;
+
+	return ret;
+
+err_out:
+	f2fs_drop_rpages(&cc, i, 0);
+	f2fs_destroy_compress_ctx(&cc, false);
+
+unlock_out:
+	inode_unlock_shared(inode);
+	return ret;
+}
+
 static inline bool allow_memalloc_for_decomp(struct f2fs_sb_info *sbi,
 		bool pre_alloc)
 {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f1576dc6e..c0d3bd051 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -24,6 +24,7 @@
 #include <linux/quotaops.h>
 #include <linux/part_stat.h>
 #include <linux/rw_hint.h>
+#include <uapi/linux/f2fs.h>
 
 #include <linux/fscrypt.h>
 #include <linux/fsverity.h>
@@ -4448,6 +4449,7 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
 						struct writeback_control *wbc,
 						enum iostat_type io_type);
 int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index);
+int f2fs_estimate_compress(struct inode *inode, struct f2fs_comp_estimate *estimate);
 bool f2fs_is_sparse_cluster(struct inode *inode, pgoff_t index);
 void f2fs_update_read_extent_tree_range_compressed(struct inode *inode,
 				pgoff_t fofs, block_t blkaddr,
@@ -4539,6 +4541,9 @@ static inline void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi,
 static inline int f2fs_is_compressed_cluster(
 				struct inode *inode,
 				pgoff_t index) { return 0; }
+static inline int f2fs_estimate_compress(
+				struct inode *inode,
+				struct f2fs_comp_estimate *estimate) { return 0; }
 static inline bool f2fs_is_sparse_cluster(
 				struct inode *inode,
 				pgoff_t index) { return true; }
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index abbcbb586..befd58c70 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -33,7 +33,6 @@
 #include "gc.h"
 #include "iostat.h"
 #include <trace/events/f2fs.h>
-#include <uapi/linux/f2fs.h>
 
 static vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
 {
@@ -3525,6 +3524,40 @@ static int f2fs_ioc_io_prio(struct file *filp, unsigned long arg)
 	return 0;
 }
 
+static int f2fs_ioc_estimate_compress(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_comp_estimate estimate;
+	int ret = 0;
+
+	if (!f2fs_sb_has_compression(sbi) ||
+			F2FS_OPTION(sbi).compress_mode != COMPR_MODE_USER)
+		return -EOPNOTSUPP;
+
+	if (!f2fs_is_compress_backend_ready(inode))
+		return -EOPNOTSUPP;
+
+	if (!f2fs_compressed_file(inode) ||
+		is_inode_flag_set(inode, FI_COMPRESS_RELEASED))
+		return -EINVAL;
+
+	if (copy_from_user(&estimate, (struct f2fs_comp_estimate __user *)arg,
+		sizeof(struct f2fs_comp_estimate)))
+		return -EFAULT;
+
+	ret = f2fs_estimate_compress(inode, &estimate);
+
+	if (ret < 0)
+		return ret;
+
+	if (copy_to_user((struct f2fs_comp_estimate __user *)arg, &estimate,
+		sizeof(struct f2fs_comp_estimate)))
+		return -EFAULT;
+
+	return 0;
+}
+
 int f2fs_precache_extents(struct inode *inode)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
@@ -4628,6 +4661,8 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_ioc_get_dev_alias_file(filp, arg);
 	case F2FS_IOC_IO_PRIO:
 		return f2fs_ioc_io_prio(filp, arg);
+	case F2FS_IOC_ESTIMATE_COMPRESS:
+		return f2fs_ioc_estimate_compress(filp, arg);
 	default:
 		return -ENOTTY;
 	}
@@ -5347,6 +5382,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_COMPRESS_FILE:
 	case F2FS_IOC_GET_DEV_ALIAS_FILE:
 	case F2FS_IOC_IO_PRIO:
+	case F2FS_IOC_ESTIMATE_COMPRESS:
 		break;
 	default:
 		return -ENOIOCTLCMD;
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index 795e26258..07c98985d 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -45,6 +45,8 @@
 #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
 #define F2FS_IOC_GET_DEV_ALIAS_FILE	_IOR(F2FS_IOCTL_MAGIC, 26, __u32)
 #define F2FS_IOC_IO_PRIO		_IOW(F2FS_IOCTL_MAGIC, 27, __u32)
+#define F2FS_IOC_ESTIMATE_COMPRESS	_IOR(F2FS_IOCTL_MAGIC, 28,	\
+						struct f2fs_comp_estimate)
 
 /*
  * should be same as XFS_IOC_GOINGDOWN.
@@ -104,4 +106,10 @@ struct f2fs_comp_option {
 	__u8 log_cluster_size;
 };
 
+struct f2fs_comp_estimate {
+	__u16 log_sample_density;
+	__u64 compressible_clusters;
+	__u64 saved_blocks;
+};
+
 #endif /* _UAPI_LINUX_F2FS_H */
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
