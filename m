Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE49A9A3556
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Oct 2024 08:27:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t1gS0-0004oc-PU;
	Fri, 18 Oct 2024 06:27:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t1gRz-0004oN-6F
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Oct 2024 06:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8YjYESIMS6XMxcRca6Cis41SnqwSzqx+lIWmY2qaneM=; b=HAoG+c8xUgpvvXmiowmi8KDOh5
 Dh8UctCLoUYUwf2A46IFnx1m5jUtMsfYc/hBnHT+mrMzfwH/AUpZJTc/fjLUB0U+eR8MsJftjZziZ
 Hx2tGKue811se4mxYFChC50UtgNgM/arptIpRnp3T/dTXOqU7Inilb/ibMM6Rfq5fNTs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8YjYESIMS6XMxcRca6Cis41SnqwSzqx+lIWmY2qaneM=; b=f5dp0R2ni+XnUziKKVCWfISeyl
 w1/svWFSwH3TCJun4ryMZIEUixF01OofW5nhaKueuTPFbN3hIHcWEf0BygUUa7xBXO6Fp3nUV7fqH
 V2bYjxqt+PeQgDttfSmO+wbPj3iI/+1T11GP82PH+GFN8JJo9pMZ8HP1GgvpN+6VkOsQ=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t1gRy-0005M2-4f for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Oct 2024 06:27:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6AD0CA44527
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 18 Oct 2024 06:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDDDC4CEC3;
 Fri, 18 Oct 2024 06:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729232811;
 bh=29xKPT2f4WvFDNlKwJOT/T2nkzhUujZxCZronc8t5Ho=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JZP60lHEiUTNb7iX8ezSHM9FSIeRrDbnSWPX8dm782ij56p1n0Iy/7OoyWbYsooyg
 U1bv7Tn5RRMxtIh19vCOBXdLek2KO02QXl9MmhT5DVyyNWkWcWnD2Nea9uMiCMkSWj
 Wqhu2KUy/lhWUGqaVdzj28XNugMtwqrQSgtFhKugwBdVsh4qf2lqUb/V3seD2Vdkvb
 MEuM/SWDbGQVfJ+EoR3uBDW8U/wRsP7UD64wyGwB4F/R6gZTnAdiYp2CFx+kgyy8Fc
 JpWgoikS/1jFGNVue9cnGLryy4W3PWtaLcPffIAPXmsLs0YU6FaRE0/eMH9xP9gEAO
 i65PK8JSYDEoQ==
To: jaegeuk@kernel.org
Date: Fri, 18 Oct 2024 14:26:38 +0800
Message-Id: <20241018062638.2619214-3-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241018062638.2619214-1-chao@kernel.org>
References: <20241018062638.2619214-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Overhead of pinfile is heavy due to: 1) GC tries to skip
 migrating
 section which contains pinfile's data block, it will cost more time during
 GC, 2) and also it will take high risk when GC unpins file [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t1gRy-0005M2-4f
Subject: [f2fs-dev] [PATCH 3/3] f2fs: support NOCoW flag
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Overhead of pinfile is heavy due to:
1) GC tries to skip migrating section which contains pinfile's data
block, it will cost more time during GC,
2) and also it will take high risk when GC unpins file and migrates
it's data block once inode.i_gc_failure exceeds threshold.

This patch proposes to support NOCoW flag on inode, which has similar
semantics to pinfile:

			Pinfile			NOCoW
[Enable]
only regular		yes			yes
only empty file		yes			no
blkzoned=on,mode=lfs	Support			Support
blkzoned=off,mode=lfs	Not support		Not support

[fsync/wb/dio IO behavior]
block in regular device	IPU			IPU
block in zoned device	N/A			OPU

[Misc IO behavior]
GC			skip/OPU		OPU
defrag ioc/swapon	Not support		Support

If userspace doesn't need pinned physical block address for following
direct access, we can tag file w/ NOCoW flag instead of pinfile flag,
we will be benefit from it for below cases:
1) user's write won't fragment NOCoW file's data block due to IPU
2) GC/defrag/swapon won't fail on NOCoW file.

Please note that, this patch changes to not show NOCoW flag for a
pinned file, the logic is as below:

Before
			Pinned file
lsattr			C
f2fs_io pinfile get	pinned

After
			Pinned file		NOCoW file
lsattr			-			C
f2fs_io pinfile get	pinned			un-pinned

So, to consider backward compatibility, if NOCoW flag shown on a
target inode, we need to check pinned flag to see whether NOCoW
flag was really tagged or not.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 21 ++++++++++++++++++++-
 fs/f2fs/f2fs.h | 10 ++++++++--
 fs/f2fs/file.c | 22 ++++++++++++++++++----
 3 files changed, 46 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c6d0e4aa12e3..b8ba97b2c11f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1636,7 +1636,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 	/* use out-place-update for direct IO under LFS mode */
 	if (map->m_may_create && (is_hole ||
 		(flag == F2FS_GET_BLOCK_DIO && f2fs_lfs_mode(sbi) &&
-		!f2fs_is_pinned_file(inode)))) {
+		!f2fs_is_pinned_file(inode) && !f2fs_is_nocow_file(inode)))) {
 		if (unlikely(f2fs_cp_error(sbi))) {
 			err = -EIO;
 			goto sync_out;
@@ -2636,6 +2636,11 @@ bool f2fs_should_update_inplace(struct inode *inode, struct f2fs_io_info *fio)
 	if (file_is_cold(inode) && !is_inode_flag_set(inode, FI_OPU_WRITE))
 		return true;
 
+	/* allows NOCoW file to be migrated during defragmentation and swapon */
+	if (f2fs_is_nocow_file(inode) &&
+		!is_inode_flag_set(inode, FI_OPU_WRITE))
+		return true;
+
 	return check_inplace_update_policy(inode, fio);
 }
 
@@ -2658,6 +2663,9 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
 					sbi->first_zoned_segno)
 			return true;
 	}
+	/* should check NOCoW flag after lfs_mode check condition */
+	if (f2fs_is_nocow_file(inode))
+		return false;
 	if (S_ISDIR(inode->i_mode))
 		return true;
 	if (IS_NOQUOTA(inode))
@@ -2722,11 +2730,22 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 						DATA_GENERIC_ENHANCE))
 			return -EFSCORRUPTED;
 
+		/*
+		 * if data block of NOCoW inode locates in sequential-zone,
+		 * let's trigger OPU.
+		 */
+		if (f2fs_is_nocow_file(inode) &&
+			f2fs_blkzoned_has_regular_section(fio->sbi) &&
+			GET_SEGNO(fio->sbi, fio->old_blkaddr) >=
+					fio->sbi->first_zoned_segno)
+			goto get_dnode;
+
 		ipu_force = true;
 		fio->need_lock = LOCK_DONE;
 		goto got_it;
 	}
 
+get_dnode:
 	/* Deadlock due to between page->lock and f2fs_lock_op */
 	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi))
 		return -EAGAIN;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6781b4fab43f..9b7fa960cd8b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3047,6 +3047,7 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
 #define F2FS_NOCOMP_FL			0x00000400 /* Don't compress */
 #define F2FS_INDEX_FL			0x00001000 /* hash-indexed directory */
 #define F2FS_DIRSYNC_FL			0x00010000 /* dirsync behaviour (directories only) */
+#define F2FS_NOCOW_FL			0x00800000 /* Do not cow file */
 #define F2FS_PROJINHERIT_FL		0x20000000 /* Create with parents projid */
 #define F2FS_CASEFOLD_FL		0x40000000 /* Casefolded file */
 #define F2FS_DEVICE_ALIAS_FL		0x80000000 /* File for aliasing a device */
@@ -3332,6 +3333,11 @@ static inline bool f2fs_is_cow_file(struct inode *inode)
 	return is_inode_flag_set(inode, FI_COW_FILE);
 }
 
+static inline bool f2fs_is_nocow_file(struct inode *inode)
+{
+	return F2FS_I(inode)->i_flags & F2FS_NOCOW_FL;
+}
+
 static inline void *inline_data_addr(struct inode *inode, struct page *page)
 {
 	__le32 *addr = get_dnode_addr(inode, page);
@@ -4658,8 +4664,8 @@ static inline bool f2fs_low_mem_mode(struct f2fs_sb_info *sbi)
 static inline bool f2fs_may_compress(struct inode *inode)
 {
 	if (IS_SWAPFILE(inode) || f2fs_is_pinned_file(inode) ||
-		f2fs_is_atomic_file(inode) || f2fs_has_inline_data(inode) ||
-		f2fs_is_mmap_file(inode))
+		f2fs_is_nocow_file(inode) || f2fs_is_atomic_file(inode) ||
+		f2fs_has_inline_data(inode) || f2fs_is_mmap_file(inode))
 		return false;
 	return S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode);
 }
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 92d7c62eba29..580609223799 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1998,6 +1998,20 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 	if (IS_NOQUOTA(inode))
 		return -EPERM;
 
+	if ((iflags ^ masked_flags) & F2FS_NOCOW_FL) {
+		if (iflags & F2FS_NOCOW_FL) {
+			int ret;
+
+			if (!S_ISREG(inode->i_mode))
+				return -EINVAL;
+			if (f2fs_should_update_outplace(inode, NULL))
+				return -EINVAL;
+			ret = f2fs_convert_inline_inode(inode);
+			if (ret)
+				return ret;
+		}
+	}
+
 	if ((iflags ^ masked_flags) & F2FS_CASEFOLD_FL) {
 		if (!f2fs_sb_has_casefold(F2FS_I_SB(inode)))
 			return -EOPNOTSUPP;
@@ -2077,6 +2091,7 @@ static const struct {
 	{ F2FS_NOCOMP_FL,	FS_NOCOMP_FL },
 	{ F2FS_INDEX_FL,	FS_INDEX_FL },
 	{ F2FS_DIRSYNC_FL,	FS_DIRSYNC_FL },
+	{ F2FS_NOCOW_FL,	FS_NOCOW_FL },
 	{ F2FS_PROJINHERIT_FL,	FS_PROJINHERIT_FL },
 	{ F2FS_CASEFOLD_FL,	FS_CASEFOLD_FL },
 };
@@ -2108,7 +2123,8 @@ static const struct {
 		FS_NOCOMP_FL |		\
 		FS_DIRSYNC_FL |		\
 		FS_PROJINHERIT_FL |	\
-		FS_CASEFOLD_FL)
+		FS_CASEFOLD_FL |	\
+		FS_NOCOW_FL)
 
 /* Convert f2fs on-disk i_flags to FS_IOC_{GET,SET}FLAGS flags */
 static inline u32 f2fs_iflags_to_fsflags(u32 iflags)
@@ -2171,7 +2187,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 	inode_lock(inode);
 
 	if (!f2fs_disable_compressed_file(inode) ||
-			f2fs_is_pinned_file(inode)) {
+		f2fs_is_pinned_file(inode) || f2fs_is_nocow_file(inode)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -3273,8 +3289,6 @@ int f2fs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
 		fsflags |= FS_VERITY_FL;
 	if (f2fs_has_inline_data(inode) || f2fs_has_inline_dentry(inode))
 		fsflags |= FS_INLINE_DATA_FL;
-	if (is_inode_flag_set(inode, FI_PIN_FILE))
-		fsflags |= FS_NOCOW_FL;
 
 	fileattr_fill_flags(fa, fsflags & F2FS_GETTABLE_FS_FL);
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
