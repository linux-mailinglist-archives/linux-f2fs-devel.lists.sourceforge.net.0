Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5952F6DA8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Jan 2021 23:05:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l0AkX-0001ks-Lc; Thu, 14 Jan 2021 22:05:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1l0AkW-0001kl-8O
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Jan 2021 22:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aQpXTZIHA94YSn73HObKFgndmasvwp+Q3FyVe2rFAQA=; b=Igx0VLSLh75B9KV5jnlmLQ2333
 uEWolZCriL5CSg3AtlEJ+6AoivBTxyzn9Kgx+53+sQWeykjjTMJW4mK1inDKZ2pfeH5V4coGPDqA9
 vnfJPpFeqidk4cYSHOz8BSEWMr7x1Wb0/BbAFvODmrhZ/N0pnbHoNW8ZePEjj4kwYg1I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aQpXTZIHA94YSn73HObKFgndmasvwp+Q3FyVe2rFAQA=; b=G
 +J/wA7Ke9E2Dw8CoA7XyTMCO0JwmVdUXRNGhYlhi5leE6SMWcT9/gKkG5bJqW4jmV03CG1V+S++cC
 CKnvf/Ka97xArIDTfLy8mihU6MBVOSDmeN7Ix4tooR3Id5CkHg/8drqv5noqjlwwtejJjMyKxGq8/
 ulWzkIiBryfR0y+A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l0AkR-000azo-KH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Jan 2021 22:05:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3BE123A5E;
 Thu, 14 Jan 2021 22:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610661931;
 bh=9h71S9m51D7x16LwyqTgNWnIP2dLNEuJdjrfUDeCw6Y=;
 h=From:To:Cc:Subject:Date:From;
 b=V5eUhAaK3DPAsZrdYl2JUJg7jAcseCIzQn+lev4rWarDqn5OE8eDIZfKqtz7kQLep
 pNrZ97p327k4AkSZT66HNI/0RpaHmn35F7NwDCHN11gJv5otd8dCdRQls0nyOiKRJa
 1V/Ts1dozkxKqUUX8ln2qH0hP8uG+WHIKk6ANsqfmq18UnCHNVd0lpH72tylPVwDXf
 e25AwFsMLLWXK17ATEZxrgB/9hNkMHyya5Q5QCrAZtlMYYOcVUUVEjTG+Nh93GbT9y
 Kyjcl6L42cm82OSOJBdEu2chYd5KeCIypJpqWu2YXaglTfyB7C3yhNDMrCzzUDnduC
 IO79tZQcXz5Ww==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 14 Jan 2021 14:05:21 -0800
Message-Id: <20210114220521.3578185-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l0AkR-000azo-KH
Subject: [f2fs-dev] [PATCH] f2fs: deprecate f2fs_trace_io
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch deprecates f2fs_trace_io, since f2fs uses page->private more broadly,
resulting in more buggy cases.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/Kconfig      |  10 ---
 fs/f2fs/Makefile     |   1 -
 fs/f2fs/checkpoint.c |   3 -
 fs/f2fs/data.c       |   4 --
 fs/f2fs/file.c       |   2 -
 fs/f2fs/node.c       |   2 -
 fs/f2fs/segment.c    |   3 -
 fs/f2fs/super.c      |   6 --
 fs/f2fs/trace.c      | 165 -------------------------------------------
 fs/f2fs/trace.h      |  43 -----------
 10 files changed, 239 deletions(-)
 delete mode 100644 fs/f2fs/trace.c
 delete mode 100644 fs/f2fs/trace.h

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 63c1fc1a0e3b..62e638a49bbf 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -76,16 +76,6 @@ config F2FS_CHECK_FS
 
 	  If you want to improve the performance, say N.
 
-config F2FS_IO_TRACE
-	bool "F2FS IO tracer"
-	depends on F2FS_FS
-	depends on FUNCTION_TRACER
-	help
-	  F2FS IO trace is based on a function trace, which gathers process
-	  information and block IO patterns in the filesystem level.
-
-	  If unsure, say N.
-
 config F2FS_FAULT_INJECTION
 	bool "F2FS fault injection facility"
 	depends on F2FS_FS
diff --git a/fs/f2fs/Makefile b/fs/f2fs/Makefile
index ee7316b42f69..e5295746208b 100644
--- a/fs/f2fs/Makefile
+++ b/fs/f2fs/Makefile
@@ -7,6 +7,5 @@ f2fs-y		+= shrinker.o extent_cache.o sysfs.o
 f2fs-$(CONFIG_F2FS_STAT_FS) += debug.o
 f2fs-$(CONFIG_F2FS_FS_XATTR) += xattr.o
 f2fs-$(CONFIG_F2FS_FS_POSIX_ACL) += acl.o
-f2fs-$(CONFIG_F2FS_IO_TRACE) += trace.o
 f2fs-$(CONFIG_FS_VERITY) += verity.o
 f2fs-$(CONFIG_F2FS_FS_COMPRESSION) += compress.o
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 897edb7c951a..8c79ba0566b1 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -17,7 +17,6 @@
 #include "f2fs.h"
 #include "node.h"
 #include "segment.h"
-#include "trace.h"
 #include <trace/events/f2fs.h>
 
 static struct kmem_cache *ino_entry_slab;
@@ -443,7 +442,6 @@ static int f2fs_set_meta_page_dirty(struct page *page)
 		__set_page_dirty_nobuffers(page);
 		inc_page_count(F2FS_P_SB(page), F2FS_DIRTY_META);
 		f2fs_set_page_private(page, 0);
-		f2fs_trace_pid(page);
 		return 1;
 	}
 	return 0;
@@ -1017,7 +1015,6 @@ void f2fs_update_dirty_page(struct inode *inode, struct page *page)
 	spin_unlock(&sbi->inode_lock[type]);
 
 	f2fs_set_page_private(page, 0);
-	f2fs_trace_pid(page);
 }
 
 void f2fs_remove_dirty_inode(struct inode *inode)
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d9a063d8a63d..38476d0d3916 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -25,7 +25,6 @@
 #include "f2fs.h"
 #include "node.h"
 #include "segment.h"
-#include "trace.h"
 #include <trace/events/f2fs.h>
 
 #define NUM_PREALLOC_POST_READ_CTXS	128
@@ -679,7 +678,6 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 		return -EFSCORRUPTED;
 
 	trace_f2fs_submit_page_bio(page, fio);
-	f2fs_trace_ios(fio, 0);
 
 	/* Allocate a new bio */
 	bio = __bio_alloc(fio, 1);
@@ -884,7 +882,6 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 		return -EFSCORRUPTED;
 
 	trace_f2fs_submit_page_bio(page, fio);
-	f2fs_trace_ios(fio, 0);
 
 	if (bio && !page_is_mergeable(fio->sbi, bio, *fio->last_block,
 						fio->new_blkaddr))
@@ -981,7 +978,6 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 		wbc_account_cgroup_owner(fio->io_wbc, bio_page, PAGE_SIZE);
 
 	io->last_block_in_bio = fio->new_blkaddr;
-	f2fs_trace_ios(fio, 0);
 
 	trace_f2fs_submit_page_write(fio->page, fio);
 skip:
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e768371c6575..7db27c81d034 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -29,7 +29,6 @@
 #include "xattr.h"
 #include "acl.h"
 #include "gc.h"
-#include "trace.h"
 #include <trace/events/f2fs.h>
 #include <uapi/linux/f2fs.h>
 
@@ -369,7 +368,6 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 	f2fs_update_time(sbi, REQ_TIME);
 out:
 	trace_f2fs_sync_file_exit(inode, cp_reason, datasync, ret);
-	f2fs_trace_ios(NULL, 1);
 	return ret;
 }
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 5e3fabacefb5..a8a0fb890e8d 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -17,7 +17,6 @@
 #include "node.h"
 #include "segment.h"
 #include "xattr.h"
-#include "trace.h"
 #include <trace/events/f2fs.h>
 
 #define on_f2fs_build_free_nids(nmi) mutex_is_locked(&(nm_i)->build_lock)
@@ -2089,7 +2088,6 @@ static int f2fs_set_node_page_dirty(struct page *page)
 		__set_page_dirty_nobuffers(page);
 		inc_page_count(F2FS_P_SB(page), F2FS_DIRTY_NODES);
 		f2fs_set_page_private(page, 0);
-		f2fs_trace_pid(page);
 		return 1;
 	}
 	return 0;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index deca74cb17df..7d34f1cacdee 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -20,7 +20,6 @@
 #include "segment.h"
 #include "node.h"
 #include "gc.h"
-#include "trace.h"
 #include <trace/events/f2fs.h>
 
 #define __reverse_ffz(x) __reverse_ffs(~(x))
@@ -187,8 +186,6 @@ void f2fs_register_inmem_page(struct inode *inode, struct page *page)
 {
 	struct inmem_pages *new;
 
-	f2fs_trace_pid(page);
-
 	f2fs_set_page_private(page, ATOMIC_WRITTEN_PAGE);
 
 	new = f2fs_kmem_cache_alloc(inmem_entry_slab, GFP_NOFS);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index eaaa8d0f3903..1d1e356d1165 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -33,7 +33,6 @@
 #include "segment.h"
 #include "xattr.h"
 #include "gc.h"
-#include "trace.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/f2fs.h>
@@ -1430,8 +1429,6 @@ int f2fs_sync_fs(struct super_block *sb, int sync)
 		err = f2fs_write_checkpoint(sbi, &cpc);
 		up_write(&sbi->gc_lock);
 	}
-	f2fs_trace_ios(NULL, 1);
-
 	return err;
 }
 
@@ -4109,8 +4106,6 @@ static int __init init_f2fs_fs(void)
 		return -EINVAL;
 	}
 
-	f2fs_build_trace_ios();
-
 	err = init_inodecache();
 	if (err)
 		goto fail;
@@ -4203,7 +4198,6 @@ static void __exit exit_f2fs_fs(void)
 	f2fs_destroy_segment_manager_caches();
 	f2fs_destroy_node_manager_caches();
 	destroy_inodecache();
-	f2fs_destroy_trace_ios();
 }
 
 module_init(init_f2fs_fs)
diff --git a/fs/f2fs/trace.c b/fs/f2fs/trace.c
deleted file mode 100644
index d0ab533a9ce8..000000000000
--- a/fs/f2fs/trace.c
+++ /dev/null
@@ -1,165 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * f2fs IO tracer
- *
- * Copyright (c) 2014 Motorola Mobility
- * Copyright (c) 2014 Jaegeuk Kim <jaegeuk@kernel.org>
- */
-#include <linux/fs.h>
-#include <linux/f2fs_fs.h>
-#include <linux/sched.h>
-#include <linux/radix-tree.h>
-
-#include "f2fs.h"
-#include "trace.h"
-
-static RADIX_TREE(pids, GFP_ATOMIC);
-static spinlock_t pids_lock;
-static struct last_io_info last_io;
-
-static inline void __print_last_io(void)
-{
-	if (!last_io.len)
-		return;
-
-	trace_printk("%3x:%3x %4x %-16s %2x %5x %5x %12x %4x\n",
-			last_io.major, last_io.minor,
-			last_io.pid, "----------------",
-			last_io.type,
-			last_io.fio.op, last_io.fio.op_flags,
-			last_io.fio.new_blkaddr,
-			last_io.len);
-	memset(&last_io, 0, sizeof(last_io));
-}
-
-static int __file_type(struct inode *inode, pid_t pid)
-{
-	if (f2fs_is_atomic_file(inode))
-		return __ATOMIC_FILE;
-	else if (f2fs_is_volatile_file(inode))
-		return __VOLATILE_FILE;
-	else if (S_ISDIR(inode->i_mode))
-		return __DIR_FILE;
-	else if (inode->i_ino == F2FS_NODE_INO(F2FS_I_SB(inode)))
-		return __NODE_FILE;
-	else if (inode->i_ino == F2FS_META_INO(F2FS_I_SB(inode)))
-		return __META_FILE;
-	else if (pid)
-		return __NORMAL_FILE;
-	else
-		return __MISC_FILE;
-}
-
-void f2fs_trace_pid(struct page *page)
-{
-	struct inode *inode = page->mapping->host;
-	pid_t pid = task_pid_nr(current);
-	void *p;
-
-	set_page_private(page, (unsigned long)pid);
-
-retry:
-	if (radix_tree_preload(GFP_NOFS))
-		return;
-
-	spin_lock(&pids_lock);
-	p = radix_tree_lookup(&pids, pid);
-	if (p == current)
-		goto out;
-	if (p)
-		radix_tree_delete(&pids, pid);
-
-	if (radix_tree_insert(&pids, pid, current)) {
-		spin_unlock(&pids_lock);
-		radix_tree_preload_end();
-		cond_resched();
-		goto retry;
-	}
-
-	trace_printk("%3x:%3x %4x %-16s\n",
-			MAJOR(inode->i_sb->s_dev), MINOR(inode->i_sb->s_dev),
-			pid, current->comm);
-out:
-	spin_unlock(&pids_lock);
-	radix_tree_preload_end();
-}
-
-void f2fs_trace_ios(struct f2fs_io_info *fio, int flush)
-{
-	struct inode *inode;
-	pid_t pid;
-	int major, minor;
-
-	if (flush) {
-		__print_last_io();
-		return;
-	}
-
-	inode = fio->page->mapping->host;
-	pid = page_private(fio->page);
-
-	major = MAJOR(inode->i_sb->s_dev);
-	minor = MINOR(inode->i_sb->s_dev);
-
-	if (last_io.major == major && last_io.minor == minor &&
-			last_io.pid == pid &&
-			last_io.type == __file_type(inode, pid) &&
-			last_io.fio.op == fio->op &&
-			last_io.fio.op_flags == fio->op_flags &&
-			last_io.fio.new_blkaddr + last_io.len ==
-							fio->new_blkaddr) {
-		last_io.len++;
-		return;
-	}
-
-	__print_last_io();
-
-	last_io.major = major;
-	last_io.minor = minor;
-	last_io.pid = pid;
-	last_io.type = __file_type(inode, pid);
-	last_io.fio = *fio;
-	last_io.len = 1;
-	return;
-}
-
-void f2fs_build_trace_ios(void)
-{
-	spin_lock_init(&pids_lock);
-}
-
-#define PIDVEC_SIZE	128
-static unsigned int gang_lookup_pids(pid_t *results, unsigned long first_index,
-							unsigned int max_items)
-{
-	struct radix_tree_iter iter;
-	void **slot;
-	unsigned int ret = 0;
-
-	if (unlikely(!max_items))
-		return 0;
-
-	radix_tree_for_each_slot(slot, &pids, &iter, first_index) {
-		results[ret] = iter.index;
-		if (++ret == max_items)
-			break;
-	}
-	return ret;
-}
-
-void f2fs_destroy_trace_ios(void)
-{
-	pid_t pid[PIDVEC_SIZE];
-	pid_t next_pid = 0;
-	unsigned int found;
-
-	spin_lock(&pids_lock);
-	while ((found = gang_lookup_pids(pid, next_pid, PIDVEC_SIZE))) {
-		unsigned idx;
-
-		next_pid = pid[found - 1] + 1;
-		for (idx = 0; idx < found; idx++)
-			radix_tree_delete(&pids, pid[idx]);
-	}
-	spin_unlock(&pids_lock);
-}
diff --git a/fs/f2fs/trace.h b/fs/f2fs/trace.h
deleted file mode 100644
index 789f6aa727fc..000000000000
--- a/fs/f2fs/trace.h
+++ /dev/null
@@ -1,43 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * f2fs IO tracer
- *
- * Copyright (c) 2014 Motorola Mobility
- * Copyright (c) 2014 Jaegeuk Kim <jaegeuk@kernel.org>
- */
-#ifndef __F2FS_TRACE_H__
-#define __F2FS_TRACE_H__
-
-#ifdef CONFIG_F2FS_IO_TRACE
-#include <trace/events/f2fs.h>
-
-enum file_type {
-	__NORMAL_FILE,
-	__DIR_FILE,
-	__NODE_FILE,
-	__META_FILE,
-	__ATOMIC_FILE,
-	__VOLATILE_FILE,
-	__MISC_FILE,
-};
-
-struct last_io_info {
-	int major, minor;
-	pid_t pid;
-	enum file_type type;
-	struct f2fs_io_info fio;
-	block_t len;
-};
-
-extern void f2fs_trace_pid(struct page *);
-extern void f2fs_trace_ios(struct f2fs_io_info *, int);
-extern void f2fs_build_trace_ios(void);
-extern void f2fs_destroy_trace_ios(void);
-#else
-#define f2fs_trace_pid(p)
-#define f2fs_trace_ios(i, n)
-#define f2fs_build_trace_ios()
-#define f2fs_destroy_trace_ios()
-
-#endif
-#endif /* __F2FS_TRACE_H__ */
-- 
2.30.0.284.gd98b1dd5eaa7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
