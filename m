Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 479404A8845
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Feb 2022 17:04:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nFeaW-0006h1-25; Thu, 03 Feb 2022 16:03:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nFeaV-0006gv-3R
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Feb 2022 16:03:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8dvh6a2CMRWnHgQQO4QRv8mkjEyAoAK0czRsuK+9Txk=; b=AcymcHi6kgyYw1nT7nZ02v4FyW
 QvuttweLGJ7Ge66/cjiW9X+EKs1nAO7aa5C7sMiaqmI6ztxwBnsd1y+xNxc2eeKjujJNkY37BKuW2
 7YY24npjqm/TsgupWAhT//krLdENYO37fqlnkMyCKeENq05xRkVfzimMG1stGcbXfOKo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8dvh6a2CMRWnHgQQO4QRv8mkjEyAoAK0czRsuK+9Txk=; b=Q
 zuRzX706ZG9U02x6Voq9DquJZsng+LuEBz38iX8AMRIqww5f/ITZIWeDycstwHy3qZz/ugvYi1tgr
 lffIJuhESX5smCyX6g1y6AfiKOQ7OqriCAd0d9s1tFpK7fK6aNHRf0cf1gZvA7c8p3juhy91CH+VZ
 6f08+EWEn20LGMcs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nFeaS-0004gu-Q2
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Feb 2022 16:03:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97034B8347B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  3 Feb 2022 16:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38EA6C340E8;
 Thu,  3 Feb 2022 16:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643904224;
 bh=8V+zuFLUMkSUwS4VuIAfl+h5CeD1gnWra53+qgBpfIc=;
 h=From:To:Cc:Subject:Date:From;
 b=rLjQnHPAhzN8TtVhJAS4dR7m/w5Hprh53NGlUMn0gmnqt1vR2eyZ4z+x/s9n96Qba
 qFFqsJ6ZFHdtlfEoUc0fHJYbCcXz2Z9IOeBluf+uBTU4xPZglEEfZ35O6/WetzNmM8
 HMIhAhcLNXNFcoT6m41qt0tX7ZN2+Ct7M5193IulPXjAemz3kLk7wiSrP0Xcksg6M2
 oZm8zldGf9/Bj4bNQyrBusD6Sej+6HGvuWW030sRZyxj5odNbpgbCP//r1A2yYsN1o
 VsoBULe5oCu/op1DDSe5Nz+r4hEp90bO+mhLLwSQsnlpxA+lmIHLIbZleHjrZ3/7+q
 iDqIy3gd/1Hbg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri,  4 Feb 2022 00:03:37 +0800
Message-Id: <20220203160337.27152-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Once IPU policy is enabled in some cases: a) f2fs forces to
 use F2FS_IPU_FORCE in a small-sized volume b) user configures IPU policy
 via sysfs Then we may fail to defragment file via ioctl due to IPU policy
 check, it doesn't make sense, let's introduce a new IPU policy to allow OPU
 during file defragmentation, by default use IPU_DEFRAG inste [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nFeaS-0004gu-Q2
Subject: [f2fs-dev] [PATCH] f2fs: introduce F2FS_IPU_DEFRAG to allow file
 defragment in IPU mode
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

Once IPU policy is enabled in some cases:
a) f2fs forces to use F2FS_IPU_FORCE in a small-sized volume
b) user configures IPU policy via sysfs

Then we may fail to defragment file via ioctl due to IPU policy check,
it doesn't make sense, let's introduce a new IPU policy to allow OPU
during file defragmentation, by default use IPU_DEFRAG instead of
IPU_FORCE in small-sized volume for android device.

Ater this change, generic/018 of xfstests will pass.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  3 ++-
 fs/f2fs/data.c                          | 20 +++++++++++++++-----
 fs/f2fs/f2fs.h                          |  3 ++-
 fs/f2fs/file.c                          | 18 +++++++++++-------
 fs/f2fs/segment.h                       |  4 +++-
 fs/f2fs/super.c                         |  2 +-
 6 files changed, 34 insertions(+), 16 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index ce8103f522cb..d8abb674ee86 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -55,8 +55,9 @@ Description:	Controls the in-place-update policy.
 		0x04  F2FS_IPU_UTIL
 		0x08  F2FS_IPU_SSR_UTIL
 		0x10  F2FS_IPU_FSYNC
-		0x20  F2FS_IPU_ASYNC,
+		0x20  F2FS_IPU_ASYNC
 		0x40  F2FS_IPU_NOCACHE
+		0x80  F2FS_IPU_DEFRAG
 		====  =================
 
 		Refer segment.h for details.
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b3c152de4bba..94ebee413210 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2462,6 +2462,11 @@ static inline bool check_inplace_update_policy(struct inode *inode,
 
 	if (policy & (0x1 << F2FS_IPU_FORCE))
 		return true;
+	if (policy & (0x1 << F2FS_IPU_DEFRAG)) {
+		if (is_inode_flag_set(inode, FI_DEFRAG_PROCESS))
+			return false;
+		return true;
+	}
 	if (policy & (0x1 << F2FS_IPU_SSR) && f2fs_need_SSR(sbi))
 		return true;
 	if (policy & (0x1 << F2FS_IPU_UTIL) &&
@@ -2530,6 +2535,9 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
 	if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
 		return true;
 
+	if (is_inode_flag_set(inode, FI_DEFRAG_PROCESS))
+		return true;
+
 	if (fio) {
 		if (page_private_gcing(fio->page))
 			return true;
@@ -3154,8 +3162,8 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 			f2fs_available_free_memory(sbi, DIRTY_DENTS))
 		goto skip_write;
 
-	/* skip writing during file defragment */
-	if (is_inode_flag_set(inode, FI_DO_DEFRAG))
+	/* skip writing in file defragment preparing stage */
+	if (is_inode_flag_set(inode, FI_DEFRAG_PREPARE))
 		goto skip_write;
 
 	trace_f2fs_writepages(mapping->host, wbc, DATA);
@@ -3729,6 +3737,7 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
 	filemap_invalidate_lock(inode->i_mapping);
 
 	set_inode_flag(inode, FI_ALIGNED_WRITE);
+	set_inode_flag(inode, FI_DEFRAG_PROCESS);
 
 	for (; secidx < end_sec; secidx++) {
 		f2fs_down_write(&sbi->pin_sem);
@@ -3737,7 +3746,7 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
 		f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_PINNED, false);
 		f2fs_unlock_op(sbi);
 
-		set_inode_flag(inode, FI_DO_DEFRAG);
+		set_inode_flag(inode, FI_DEFRAG_PREPARE);
 
 		for (blkofs = 0; blkofs < blk_per_sec; blkofs++) {
 			struct page *page;
@@ -3754,7 +3763,7 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
 			f2fs_put_page(page, 1);
 		}
 
-		clear_inode_flag(inode, FI_DO_DEFRAG);
+		clear_inode_flag(inode, FI_DEFRAG_PREPARE);
 
 		ret = filemap_fdatawrite(inode->i_mapping);
 
@@ -3765,7 +3774,8 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
 	}
 
 done:
-	clear_inode_flag(inode, FI_DO_DEFRAG);
+	clear_inode_flag(inode, FI_DEFRAG_PREPARE);
+	clear_inode_flag(inode, FI_DEFRAG_PROCESS);
 	clear_inode_flag(inode, FI_ALIGNED_WRITE);
 
 	filemap_invalidate_unlock(inode->i_mapping);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6ddb98ff0b7c..5af415208488 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -737,7 +737,8 @@ enum {
 	FI_DROP_CACHE,		/* drop dirty page cache */
 	FI_DATA_EXIST,		/* indicate data exists */
 	FI_INLINE_DOTS,		/* indicate inline dot dentries */
-	FI_DO_DEFRAG,		/* indicate defragment is running */
+	FI_DEFRAG_PREPARE,	/* indicate defragment is preparing */
+	FI_DEFRAG_PROCESS,	/* indicate defragment is processing */
 	FI_DIRTY_FILE,		/* indicate regular/symlink has dirty pages */
 	FI_PREALLOCATED_ALL,	/* all blocks for write were preallocated */
 	FI_HOT_DATA,		/* indicate file is hot */
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6ccdd6e347e2..3a573125002b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2559,10 +2559,6 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 	bool fragmented = false;
 	int err;
 
-	/* if in-place-update policy is enabled, don't waste time here */
-	if (f2fs_should_update_inplace(inode, NULL))
-		return -EINVAL;
-
 	pg_start = range->start >> PAGE_SHIFT;
 	pg_end = (range->start + range->len) >> PAGE_SHIFT;
 
@@ -2570,6 +2566,13 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 
 	inode_lock(inode);
 
+	/* if in-place-update policy is enabled, don't waste time here */
+	set_inode_flag(inode, FI_DEFRAG_PROCESS);
+	if (f2fs_should_update_inplace(inode, NULL)) {
+		err = -EINVAL;
+		goto out;
+	}
+
 	/* writeback all dirty pages in the range */
 	err = filemap_write_and_wait_range(inode->i_mapping, range->start,
 						range->start + range->len - 1);
@@ -2651,7 +2654,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 			goto check;
 		}
 
-		set_inode_flag(inode, FI_DO_DEFRAG);
+		set_inode_flag(inode, FI_DEFRAG_PREPARE);
 
 		idx = map.m_lblk;
 		while (idx < map.m_lblk + map.m_len && cnt < blk_per_seg) {
@@ -2676,15 +2679,16 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 		if (map.m_lblk < pg_end && cnt < blk_per_seg)
 			goto do_map;
 
-		clear_inode_flag(inode, FI_DO_DEFRAG);
+		clear_inode_flag(inode, FI_DEFRAG_PREPARE);
 
 		err = filemap_fdatawrite(inode->i_mapping);
 		if (err)
 			goto out;
 	}
 clear_out:
-	clear_inode_flag(inode, FI_DO_DEFRAG);
+	clear_inode_flag(inode, FI_DEFRAG_PREPARE);
 out:
+	clear_inode_flag(inode, FI_DEFRAG_PROCESS);
 	inode_unlock(inode);
 	if (!err)
 		range->len = (u64)total << PAGE_SHIFT;
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 0291cd55cf09..9a45f9014dee 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -651,7 +651,8 @@ static inline int utilization(struct f2fs_sb_info *sbi)
  *                     pages over min_fsync_blocks. (=default option)
  * F2FS_IPU_ASYNC - do IPU given by asynchronous write requests.
  * F2FS_IPU_NOCACHE - disable IPU bio cache.
- * F2FS_IPUT_DISABLE - disable IPU. (=default option in LFS mode)
+ * F2FS_IPU_DEFRAG - do IPU except file defragment.
+ * F2FS_IPU_DISABLE - disable IPU. (=default option in LFS mode)
  */
 #define DEF_MIN_IPU_UTIL	70
 #define DEF_MIN_FSYNC_BLOCKS	8
@@ -667,6 +668,7 @@ enum {
 	F2FS_IPU_FSYNC,
 	F2FS_IPU_ASYNC,
 	F2FS_IPU_NOCACHE,
+	F2FS_IPU_DEFRAG,
 };
 
 static inline unsigned int curseg_segno(struct f2fs_sb_info *sbi,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9af6c20532ec..cc0429279b4c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3957,7 +3957,7 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
 		F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_REUSE;
 		if (f2fs_block_unit_discard(sbi))
 			sm_i->dcc_info->discard_granularity = 1;
-		sm_i->ipu_policy = 1 << F2FS_IPU_FORCE;
+		sm_i->ipu_policy = 1 << F2FS_IPU_DEFRAG;
 	}
 
 	sbi->readdir_ra = 1;
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
