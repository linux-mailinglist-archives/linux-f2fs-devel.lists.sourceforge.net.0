Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C31D1A9CA0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 13:37:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOgLr-0003DJ-4s; Wed, 15 Apr 2020 11:37:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1jOgLb-0003BX-65
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TS1JB7dr1SwnB6X3RDgecYGQtTza7oY7w1Kl7cYrGIc=; b=AQBb3uLsDHxrYqkUAiLZBws4OM
 KBMDZ9OUtLz7XMe4AYfeXNkqWof+sTxH2xiQRAg+/4w/9ykNeFPd4DfsJ+I7n965lEjYQF14L/3dZ
 6hIR7W/Bgc171EZgF1dGF9BzbQeRF2DR/vndBeyXZV+hfjyXUTtsRawibvnoR6mcirmw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TS1JB7dr1SwnB6X3RDgecYGQtTza7oY7w1Kl7cYrGIc=; b=egDBDuEi249wMC5TVF5RcWfpIl
 nWUEaTDeFfrmjdiyr9XkMs2FtKnGSYK6zrtTOUUOm0OHLJtXvpvl5S3oZZPIYj+II/pcjUKcqtckU
 ekcS9duEyKP6tG9iFVnYmkBC5i/eS2jAEffTx9Ia4LjFkM5pEadg5+fRvgPSc8wQmNX0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOgLX-00GSjU-Cz
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:36:51 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2031A20768;
 Wed, 15 Apr 2020 11:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586950601;
 bh=W3JfxGtuYZ3e4P6WQe47wolTMldvgQkjlDJEiIf6qR8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YKCF3yiXIU73mMRcpdO3nCXtsbmvMuI2s9j1qUcHaMgZvK2YfyXgDMvI6DKx8wJ8b
 /1t3QP29G25vbqzEcnrUEf1kmPchwuT4sUVZvGOCvjjclC/KDORu7aCc237YpLT8ZC
 HDZVxI6PNR1tLf4HD3PdRSMlCCupOXuyfEGbW6q4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 15 Apr 2020 07:34:12 -0400
Message-Id: <20200415113445.11881-97-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415113445.11881-1-sashal@kernel.org>
References: <20200415113445.11881-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jOgLX-00GSjU-Cz
Subject: [f2fs-dev] [PATCH AUTOSEL 5.6 097/129] f2fs: fix potential .flags
 overflow on 32bit architecture
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
Cc: Ondrej Jirman <megous@megous.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit 7653b9d87516ed65e112d2273c65eca6f97d0a27 ]

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
Tested-by: Ondrej Jirman <megous@megous.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/f2fs.h  | 99 ++++++++++++++++++++++++-------------------------
 fs/f2fs/inode.c |  2 +-
 2 files changed, 50 insertions(+), 51 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 64caa46f0c8bd..71801a1709f0f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -676,6 +676,44 @@ enum {
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
 struct f2fs_inode_info {
 	struct inode vfs_inode;		/* serve a vfs inode */
 	unsigned long i_flags;		/* keep an inode flags for ioctl */
@@ -688,7 +726,7 @@ struct f2fs_inode_info {
 	umode_t i_acl_mode;		/* keep file acl mode temporarily */
 
 	/* Use below internally in f2fs*/
-	unsigned long flags;		/* use to pass per-file flags */
+	unsigned long flags[BITS_TO_LONGS(FI_MAX)];	/* use to pass per-file flags */
 	struct rw_semaphore i_sem;	/* protect fi info */
 	atomic_t dirty_pages;		/* # of dirty pages */
 	f2fs_hash_t chash;		/* hash value of given file name */
@@ -2498,43 +2536,6 @@ static inline __u32 f2fs_mask_flags(umode_t mode, __u32 flags)
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
@@ -2556,20 +2557,18 @@ static inline void __mark_inode_dirty_flag(struct inode *inode,
 
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
 
@@ -2660,19 +2659,19 @@ static inline void get_inline_info(struct inode *inode, struct f2fs_inode *ri)
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
index 78c3f1d70f1dc..901e9f4ce12b5 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -345,7 +345,7 @@ static int do_read_inode(struct inode *inode)
 	fi->i_flags = le32_to_cpu(ri->i_flags);
 	if (S_ISREG(inode->i_mode))
 		fi->i_flags &= ~F2FS_PROJINHERIT_FL;
-	fi->flags = 0;
+	bitmap_zero(fi->flags, FI_MAX);
 	fi->i_advise = ri->i_advise;
 	fi->i_pino = le32_to_cpu(ri->i_pino);
 	fi->i_dir_level = ri->i_dir_level;
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
