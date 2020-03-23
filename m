Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE1D18EE0B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 03:41:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGD26-0001e6-1v; Mon, 23 Mar 2020 02:41:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jGD24-0001do-3N
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 02:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o08DRIahvM2g3LjH3p5t9I/cTv4GOt4qv0U84Wxyr0I=; b=Dv5EXEXTPWtqFXs+q7t6tn2pg3
 rMd+BedBmuJ3ygep5UbQYIDPnaozxCeNofriN50eGJMiDl833S4/8Yix9ebW4EwHe6w1lEdgKoDQE
 +SLwrsWCe551RuZU402wc5NK6nLQMUnKLv/ZLvUnOz0syJtIAi01mb5V0BslB4ijhN7s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=o08DRIahvM2g3LjH3p5t9I/cTv4GOt4qv0U84Wxyr0I=; b=c
 WPg1IhJhQQbvnqVRu2L4DleuOeYoOWePX+w/9NHNOqPcJ6hZlJXln3nhZvuwKiAYn2sdKTC1up6yB
 ReuaCFlaKM07ZaIHdZxoJE6vw75ShoNv9dh9skN+IUnwEbALTGIJR/Lit2X8GzrRUg+NLt74wPe30
 BS64N4KZH65PA8Uk=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGD1z-0047bP-81
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 02:41:40 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 906DFA95CF0F26075FF3;
 Mon, 23 Mar 2020 10:41:26 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Mon, 23 Mar 2020 10:41:17 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 23 Mar 2020 10:41:09 +0800
Message-ID: <20200323024109.60967-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jGD1z-0047bP-81
Subject: [f2fs-dev] [PATCH v4] f2fs: fix potential .flags overflow on 32bit
 architecture
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

f2fs_inode_info.flags is unsigned long variable, it has 32 bits
in 32bit architecture, since we introduced FI_MMAP_FILE flag
when we support data compression, we may access memory cross
the border of .flags field, corrupting .i_sem field, result in
below deadlock.

To fix this issue, let's expand .flags as an array to grab enough
space to store new flags.

Call Trace:
 __schedule+0x8d0/0x13fc
 ? mark_held_locks+0xac/0x100
 schedule+0xcc/0x260
 rwsem_down_write_slowpath+0x3ab/0x65d
 down_write+0xc7/0xe0
 f2fs_drop_nlink+0x3d/0x600 [f2fs]
 f2fs_delete_inline_entry+0x300/0x440 [f2fs]
 f2fs_delete_entry+0x3a1/0x7f0 [f2fs]
 f2fs_unlink+0x500/0x790 [f2fs]
 vfs_unlink+0x211/0x490
 do_unlinkat+0x483/0x520
 sys_unlink+0x4a/0x70
 do_fast_syscall_32+0x12b/0x683
 entry_SYSENTER_32+0xaa/0x102

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v4:
- clean up codes when using bit operation functions.
 fs/f2fs/f2fs.h  | 102 ++++++++++++++++++++++++------------------------
 fs/f2fs/inode.c |   4 +-
 2 files changed, 55 insertions(+), 51 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index fcafa68212eb..b0dc7bf44a54 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -682,6 +682,47 @@ enum {
 	MAX_GC_FAILURE
 };
 
+/* used for f2fs_inode_info->flags */
+enum {
+	FI_NEW_INODE,		/* indicate newly allocated inode */
+	FI_DIRTY_INODE,		/* indicate inode is dirty or not */
+	FI_AUTO_RECOVER,	/* indicate inode is recoverable */
+	FI_DIRTY_DIR,		/* indicate directory has dirty pages */
+	FI_INC_LINK,		/* need to increment i_nlink */
+	FI_ACL_MODE,		/* indicate acl mode */
+	FI_NO_ALLOC,		/* should not allocate any blocks */
+	FI_FREE_NID,		/* free allocated nide */
+	FI_NO_EXTENT,		/* not to use the extent cache */
+	FI_INLINE_XATTR,	/* used for inline xattr */
+	FI_INLINE_DATA,		/* used for inline data*/
+	FI_INLINE_DENTRY,	/* used for inline dentry */
+	FI_APPEND_WRITE,	/* inode has appended data */
+	FI_UPDATE_WRITE,	/* inode has in-place-update data */
+	FI_NEED_IPU,		/* used for ipu per file */
+	FI_ATOMIC_FILE,		/* indicate atomic file */
+	FI_ATOMIC_COMMIT,	/* indicate the state of atomical committing */
+	FI_VOLATILE_FILE,	/* indicate volatile file */
+	FI_FIRST_BLOCK_WRITTEN,	/* indicate #0 data block was written */
+	FI_DROP_CACHE,		/* drop dirty page cache */
+	FI_DATA_EXIST,		/* indicate data exists */
+	FI_INLINE_DOTS,		/* indicate inline dot dentries */
+	FI_DO_DEFRAG,		/* indicate defragment is running */
+	FI_DIRTY_FILE,		/* indicate regular/symlink has dirty pages */
+	FI_NO_PREALLOC,		/* indicate skipped preallocated blocks */
+	FI_HOT_DATA,		/* indicate file is hot */
+	FI_EXTRA_ATTR,		/* indicate file has extra attribute */
+	FI_PROJ_INHERIT,	/* indicate file inherits projectid */
+	FI_PIN_FILE,		/* indicate file should not be gced */
+	FI_ATOMIC_REVOKE_REQUEST, /* request to drop atomic data */
+	FI_VERITY_IN_PROGRESS,	/* building fs-verity Merkle tree */
+	FI_COMPRESSED_FILE,	/* indicate file's data can be compressed */
+	FI_MMAP_FILE,		/* indicate file was mmapped */
+	FI_MAX,			/* max flag, never be used */
+};
+
+/* f2fs_inode_info.flags array size */
+#define FI_ARRAY_SIZE		(BITS_TO_LONGS(FI_MAX))
+
 struct f2fs_inode_info {
 	struct inode vfs_inode;		/* serve a vfs inode */
 	unsigned long i_flags;		/* keep an inode flags for ioctl */
@@ -694,7 +735,7 @@ struct f2fs_inode_info {
 	umode_t i_acl_mode;		/* keep file acl mode temporarily */
 
 	/* Use below internally in f2fs*/
-	unsigned long flags;		/* use to pass per-file flags */
+	unsigned long flags[FI_ARRAY_SIZE];	/* use to pass per-file flags */
 	struct rw_semaphore i_sem;	/* protect fi info */
 	atomic_t dirty_pages;		/* # of dirty pages */
 	f2fs_hash_t chash;		/* hash value of given file name */
@@ -2531,43 +2572,6 @@ static inline __u32 f2fs_mask_flags(umode_t mode, __u32 flags)
 		return flags & F2FS_OTHER_FLMASK;
 }
 
-/* used for f2fs_inode_info->flags */
-enum {
-	FI_NEW_INODE,		/* indicate newly allocated inode */
-	FI_DIRTY_INODE,		/* indicate inode is dirty or not */
-	FI_AUTO_RECOVER,	/* indicate inode is recoverable */
-	FI_DIRTY_DIR,		/* indicate directory has dirty pages */
-	FI_INC_LINK,		/* need to increment i_nlink */
-	FI_ACL_MODE,		/* indicate acl mode */
-	FI_NO_ALLOC,		/* should not allocate any blocks */
-	FI_FREE_NID,		/* free allocated nide */
-	FI_NO_EXTENT,		/* not to use the extent cache */
-	FI_INLINE_XATTR,	/* used for inline xattr */
-	FI_INLINE_DATA,		/* used for inline data*/
-	FI_INLINE_DENTRY,	/* used for inline dentry */
-	FI_APPEND_WRITE,	/* inode has appended data */
-	FI_UPDATE_WRITE,	/* inode has in-place-update data */
-	FI_NEED_IPU,		/* used for ipu per file */
-	FI_ATOMIC_FILE,		/* indicate atomic file */
-	FI_ATOMIC_COMMIT,	/* indicate the state of atomical committing */
-	FI_VOLATILE_FILE,	/* indicate volatile file */
-	FI_FIRST_BLOCK_WRITTEN,	/* indicate #0 data block was written */
-	FI_DROP_CACHE,		/* drop dirty page cache */
-	FI_DATA_EXIST,		/* indicate data exists */
-	FI_INLINE_DOTS,		/* indicate inline dot dentries */
-	FI_DO_DEFRAG,		/* indicate defragment is running */
-	FI_DIRTY_FILE,		/* indicate regular/symlink has dirty pages */
-	FI_NO_PREALLOC,		/* indicate skipped preallocated blocks */
-	FI_HOT_DATA,		/* indicate file is hot */
-	FI_EXTRA_ATTR,		/* indicate file has extra attribute */
-	FI_PROJ_INHERIT,	/* indicate file inherits projectid */
-	FI_PIN_FILE,		/* indicate file should not be gced */
-	FI_ATOMIC_REVOKE_REQUEST, /* request to drop atomic data */
-	FI_VERITY_IN_PROGRESS,	/* building fs-verity Merkle tree */
-	FI_COMPRESSED_FILE,	/* indicate file's data can be compressed */
-	FI_MMAP_FILE,		/* indicate file was mmapped */
-};
-
 static inline void __mark_inode_dirty_flag(struct inode *inode,
 						int flag, bool set)
 {
@@ -2588,20 +2592,18 @@ static inline void __mark_inode_dirty_flag(struct inode *inode,
 
 static inline void set_inode_flag(struct inode *inode, int flag)
 {
-	if (!test_bit(flag, &F2FS_I(inode)->flags))
-		set_bit(flag, &F2FS_I(inode)->flags);
+	test_and_set_bit(flag, F2FS_I(inode)->flags);
 	__mark_inode_dirty_flag(inode, flag, true);
 }
 
 static inline int is_inode_flag_set(struct inode *inode, int flag)
 {
-	return test_bit(flag, &F2FS_I(inode)->flags);
+	return test_bit(flag, F2FS_I(inode)->flags);
 }
 
 static inline void clear_inode_flag(struct inode *inode, int flag)
 {
-	if (test_bit(flag, &F2FS_I(inode)->flags))
-		clear_bit(flag, &F2FS_I(inode)->flags);
+	test_and_clear_bit(flag, F2FS_I(inode)->flags);
 	__mark_inode_dirty_flag(inode, flag, false);
 }
 
@@ -2692,19 +2694,19 @@ static inline void get_inline_info(struct inode *inode, struct f2fs_inode *ri)
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 
 	if (ri->i_inline & F2FS_INLINE_XATTR)
-		set_bit(FI_INLINE_XATTR, &fi->flags);
+		set_bit(FI_INLINE_XATTR, fi->flags);
 	if (ri->i_inline & F2FS_INLINE_DATA)
-		set_bit(FI_INLINE_DATA, &fi->flags);
+		set_bit(FI_INLINE_DATA, fi->flags);
 	if (ri->i_inline & F2FS_INLINE_DENTRY)
-		set_bit(FI_INLINE_DENTRY, &fi->flags);
+		set_bit(FI_INLINE_DENTRY, fi->flags);
 	if (ri->i_inline & F2FS_DATA_EXIST)
-		set_bit(FI_DATA_EXIST, &fi->flags);
+		set_bit(FI_DATA_EXIST, fi->flags);
 	if (ri->i_inline & F2FS_INLINE_DOTS)
-		set_bit(FI_INLINE_DOTS, &fi->flags);
+		set_bit(FI_INLINE_DOTS, fi->flags);
 	if (ri->i_inline & F2FS_EXTRA_ATTR)
-		set_bit(FI_EXTRA_ATTR, &fi->flags);
+		set_bit(FI_EXTRA_ATTR, fi->flags);
 	if (ri->i_inline & F2FS_PIN_FILE)
-		set_bit(FI_PIN_FILE, &fi->flags);
+		set_bit(FI_PIN_FILE, fi->flags);
 }
 
 static inline void set_raw_inline(struct inode *inode, struct f2fs_inode *ri)
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 44e08bf2e2b4..5e441fdd4858 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -328,6 +328,7 @@ static int do_read_inode(struct inode *inode)
 	struct f2fs_inode *ri;
 	projid_t i_projid;
 	int err;
+	int i;
 
 	/* Check if ino is within scope */
 	if (f2fs_check_nid_range(sbi, inode->i_ino))
@@ -362,7 +363,8 @@ static int do_read_inode(struct inode *inode)
 	fi->i_flags = le32_to_cpu(ri->i_flags);
 	if (S_ISREG(inode->i_mode))
 		fi->i_flags &= ~F2FS_PROJINHERIT_FL;
-	fi->flags = 0;
+	for (i = 0; i < FI_ARRAY_SIZE; i++)
+		fi->flags[i] = 0;
 	fi->i_advise = ri->i_advise;
 	fi->i_pino = le32_to_cpu(ri->i_pino);
 	fi->i_dir_level = ri->i_dir_level;
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
