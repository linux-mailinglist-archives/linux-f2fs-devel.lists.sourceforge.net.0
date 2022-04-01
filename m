Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6934EE8BF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Apr 2022 09:04:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1naBKw-0003Og-G3; Fri, 01 Apr 2022 07:04:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <yuyufen@huawei.com>) id 1naBKt-0003OC-5H
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Apr 2022 07:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1DjQZkbQaUBjY+dwAxxxjoACZuGKAfEq8a95eKBAXQI=; b=Hi510FQqXuSbwgxpwHKnhxWre4
 48hLSGheCGYnfw0rMhDP53Qm71f09irDrazP3ocTwmUaPfRbS6NY7D7fiQv1JMwPgjHj0skHqgjCq
 O0dN3t/WJK9dvEPPnHJZy7QEoK+SwXKnUeWX1iwTJxaT5VCKJwpZP2cvnNiaAhWSdmxs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1DjQZkbQaUBjY+dwAxxxjoACZuGKAfEq8a95eKBAXQI=; b=WoIXXfCfLhKBH5cSC65Pkozgj7
 AgyvbVv0eGXRKgTJi240HomPqHuqG+40YGD3W58U6V9/hqKU9L8JZMk8DSqJxuhb3R290sxVHWXFH
 9r3JDCNZvLMOWE7GsnmBCO0ZVEJRTdRDa34Xs2QriAMO3h2+DgsNJsCBd13ZWQrACzqw=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1naBKn-001YrX-Pf
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Apr 2022 07:04:41 +0000
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KVB1c0zj7zDq6P;
 Fri,  1 Apr 2022 15:02:12 +0800 (CST)
Received: from dggpeml500009.china.huawei.com (7.185.36.209) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 1 Apr 2022 15:04:26 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500009.china.huawei.com
 (7.185.36.209) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 1 Apr
 2022 15:04:26 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Fri, 1 Apr 2022 15:19:07 +0800
Message-ID: <20220401071909.505086-4-yuyufen@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220401071909.505086-1-yuyufen@huawei.com>
References: <20220401071909.505086-1-yuyufen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500009.china.huawei.com (7.185.36.209)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Replace all time_to_inject by f2fs_should_fail to apply new
 fault inject. Signed-off-by: Yufen Yu <yuyufen@huawei.com> ---
 fs/f2fs/checkpoint.c
 | 2 +- fs/f2fs/data.c | 4 ++-- fs/f2fs/dir.c | 2 +- fs/f2fs/f2fs.h | 16
 ++++++++--------
 fs/f2fs/file.c | 2 +- fs/f2fs/gc.c | 2 +- [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [45.249.212.188 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1naBKn-001YrX-Pf
Subject: [f2fs-dev] [PATCH 3/5] f2fs: replace function time_to_inject by
 f2fs_should_fail
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
From: Yufen Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yufen Yu <yuyufen@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Replace all time_to_inject by f2fs_should_fail to apply new
fault inject.

Signed-off-by: Yufen Yu <yuyufen@huawei.com>
---
 fs/f2fs/checkpoint.c |  2 +-
 fs/f2fs/data.c       |  4 ++--
 fs/f2fs/dir.c        |  2 +-
 fs/f2fs/f2fs.h       | 16 ++++++++--------
 fs/f2fs/file.c       |  2 +-
 fs/f2fs/gc.c         |  2 +-
 fs/f2fs/inode.c      |  2 +-
 fs/f2fs/node.c       |  2 +-
 fs/f2fs/segment.c    |  4 ++--
 fs/f2fs/super.c      |  4 ++--
 10 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index a8fc4fa511a8..820eb95b08f1 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -611,7 +611,7 @@ int f2fs_acquire_orphan_inode(struct f2fs_sb_info *sbi)
 
 	spin_lock(&im->ino_lock);
 
-	if (time_to_inject(sbi, FAULT_ORPHAN)) {
+	if (f2fs_should_fail(sbi, FAULT_ORPHAN)) {
 		spin_unlock(&im->ino_lock);
 		f2fs_show_injection_info(sbi, FAULT_ORPHAN);
 		return -ENOSPC;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f8fcbe91059b..c070d64504d6 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -276,7 +276,7 @@ static void f2fs_read_end_io(struct bio *bio)
 	iostat_update_and_unbind_ctx(bio, 0);
 	ctx = bio->bi_private;
 
-	if (time_to_inject(sbi, FAULT_READ_IO)) {
+	if (f2fs_should_fail(sbi, FAULT_READ_IO)) {
 		f2fs_show_injection_info(sbi, FAULT_READ_IO);
 		bio->bi_status = BLK_STS_IOERR;
 	}
@@ -303,7 +303,7 @@ static void f2fs_write_end_io(struct bio *bio)
 	iostat_update_and_unbind_ctx(bio, 1);
 	sbi = bio->bi_private;
 
-	if (time_to_inject(sbi, FAULT_WRITE_IO)) {
+	if (f2fs_should_fail(sbi, FAULT_WRITE_IO)) {
 		f2fs_show_injection_info(sbi, FAULT_WRITE_IO);
 		bio->bi_status = BLK_STS_IOERR;
 	}
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index a0e51937d92e..ab50f8f3597b 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -727,7 +727,7 @@ int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
 	}
 
 start:
-	if (time_to_inject(F2FS_I_SB(dir), FAULT_DIR_DEPTH)) {
+	if (f2fs_should_fail(F2FS_I_SB(dir), FAULT_DIR_DEPTH)) {
 		f2fs_show_injection_info(F2FS_I_SB(dir), FAULT_DIR_DEPTH);
 		return -ENOSPC;
 	}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 50077b0388d1..beb935f807d6 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2231,7 +2231,7 @@ static inline void f2fs_lock_op(struct f2fs_sb_info *sbi)
 
 static inline int f2fs_trylock_op(struct f2fs_sb_info *sbi)
 {
-	if (time_to_inject(sbi, FAULT_LOCK_OP)) {
+	if (f2fs_should_fail(sbi, FAULT_LOCK_OP)) {
 		f2fs_show_injection_info(sbi, FAULT_LOCK_OP);
 		return 0;
 	}
@@ -2321,7 +2321,7 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 	if (ret)
 		return ret;
 
-	if (time_to_inject(sbi, FAULT_BLOCK)) {
+	if (f2fs_should_fail(sbi, FAULT_BLOCK)) {
 		f2fs_show_injection_info(sbi, FAULT_BLOCK);
 		release = *count;
 		goto release_quota;
@@ -2579,7 +2579,7 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
 			return err;
 	}
 
-	if (time_to_inject(sbi, FAULT_BLOCK)) {
+	if (f2fs_should_fail(sbi, FAULT_BLOCK)) {
 		f2fs_show_injection_info(sbi, FAULT_BLOCK);
 		goto enospc;
 	}
@@ -2699,7 +2699,7 @@ static inline struct page *f2fs_grab_cache_page(struct address_space *mapping,
 		if (page)
 			return page;
 
-		if (time_to_inject(F2FS_M_SB(mapping), FAULT_PAGE_ALLOC)) {
+		if (f2fs_should_fail(F2FS_M_SB(mapping), FAULT_PAGE_ALLOC)) {
 			f2fs_show_injection_info(F2FS_M_SB(mapping),
 							FAULT_PAGE_ALLOC);
 			return NULL;
@@ -2715,7 +2715,7 @@ static inline struct page *f2fs_pagecache_get_page(
 				struct address_space *mapping, pgoff_t index,
 				int fgp_flags, gfp_t gfp_mask)
 {
-	if (time_to_inject(F2FS_M_SB(mapping), FAULT_PAGE_GET)) {
+	if (f2fs_should_fail(F2FS_M_SB(mapping), FAULT_PAGE_GET)) {
 		f2fs_show_injection_info(F2FS_M_SB(mapping), FAULT_PAGE_GET);
 		return NULL;
 	}
@@ -2778,7 +2778,7 @@ static inline void *f2fs_kmem_cache_alloc(struct kmem_cache *cachep,
 	if (nofail)
 		return f2fs_kmem_cache_alloc_nofail(cachep, flags);
 
-	if (time_to_inject(sbi, FAULT_SLAB_ALLOC)) {
+	if (f2fs_should_fail(sbi, FAULT_SLAB_ALLOC)) {
 		f2fs_show_injection_info(sbi, FAULT_SLAB_ALLOC);
 		return NULL;
 	}
@@ -3350,7 +3350,7 @@ static inline bool is_dot_dotdot(const u8 *name, size_t len)
 static inline void *f2fs_kmalloc(struct f2fs_sb_info *sbi,
 					size_t size, gfp_t flags)
 {
-	if (time_to_inject(sbi, FAULT_KMALLOC)) {
+	if (f2fs_should_fail(sbi, FAULT_KMALLOC)) {
 		f2fs_show_injection_info(sbi, FAULT_KMALLOC);
 		return NULL;
 	}
@@ -3367,7 +3367,7 @@ static inline void *f2fs_kzalloc(struct f2fs_sb_info *sbi,
 static inline void *f2fs_kvmalloc(struct f2fs_sb_info *sbi,
 					size_t size, gfp_t flags)
 {
-	if (time_to_inject(sbi, FAULT_KVMALLOC)) {
+	if (f2fs_should_fail(sbi, FAULT_KVMALLOC)) {
 		f2fs_show_injection_info(sbi, FAULT_KVMALLOC);
 		return NULL;
 	}
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index d3f39a704b8b..b73729c111bd 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -782,7 +782,7 @@ int f2fs_truncate(struct inode *inode)
 
 	trace_f2fs_truncate(inode);
 
-	if (time_to_inject(F2FS_I_SB(inode), FAULT_TRUNCATE)) {
+	if (f2fs_should_fail(F2FS_I_SB(inode), FAULT_TRUNCATE)) {
 		f2fs_show_injection_info(F2FS_I_SB(inode), FAULT_TRUNCATE);
 		return -EIO;
 	}
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index ea5b93b689cd..0a513c5e6b1e 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -68,7 +68,7 @@ static int gc_thread_func(void *data)
 			continue;
 		}
 
-		if (time_to_inject(sbi, FAULT_CHECKPOINT)) {
+		if (f2fs_should_fail(sbi, FAULT_CHECKPOINT)) {
 			f2fs_show_injection_info(sbi, FAULT_CHECKPOINT);
 			f2fs_stop_checkpoint(sbi, false);
 		}
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 71f232dcf3c2..036e40fca681 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -786,7 +786,7 @@ void f2fs_evict_inode(struct inode *inode)
 	if (F2FS_HAS_BLOCKS(inode))
 		err = f2fs_truncate(inode);
 
-	if (time_to_inject(sbi, FAULT_EVICT_INODE)) {
+	if (f2fs_should_fail(sbi, FAULT_EVICT_INODE)) {
 		f2fs_show_injection_info(sbi, FAULT_EVICT_INODE);
 		err = -EIO;
 	}
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 0b6e741e94a0..ee9ddbe5630e 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2543,7 +2543,7 @@ bool f2fs_alloc_nid(struct f2fs_sb_info *sbi, nid_t *nid)
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
 	struct free_nid *i = NULL;
 retry:
-	if (time_to_inject(sbi, FAULT_ALLOC_NID)) {
+	if (f2fs_should_fail(sbi, FAULT_ALLOC_NID)) {
 		f2fs_show_injection_info(sbi, FAULT_ALLOC_NID);
 		return false;
 	}
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 22dfeb991529..1e1436b8c125 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -493,7 +493,7 @@ int f2fs_commit_inmem_pages(struct inode *inode)
  */
 void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 {
-	if (time_to_inject(sbi, FAULT_CHECKPOINT)) {
+	if (f2fs_should_fail(sbi, FAULT_CHECKPOINT)) {
 		f2fs_show_injection_info(sbi, FAULT_CHECKPOINT);
 		f2fs_stop_checkpoint(sbi, false);
 	}
@@ -1237,7 +1237,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 
 		dc->len += len;
 
-		if (time_to_inject(sbi, FAULT_DISCARD)) {
+		if (f2fs_should_fail(sbi, FAULT_DISCARD)) {
 			f2fs_show_injection_info(sbi, FAULT_DISCARD);
 			err = -EIO;
 			goto submit;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 4366469aae80..e18f60165f44 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1347,7 +1347,7 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
 {
 	struct f2fs_inode_info *fi;
 
-	if (time_to_inject(F2FS_SB(sb), FAULT_SLAB_ALLOC)) {
+	if (f2fs_should_fail(F2FS_SB(sb), FAULT_SLAB_ALLOC)) {
 		f2fs_show_injection_info(F2FS_SB(sb), FAULT_SLAB_ALLOC);
 		return NULL;
 	}
@@ -2551,7 +2551,7 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
 
 int f2fs_dquot_initialize(struct inode *inode)
 {
-	if (time_to_inject(F2FS_I_SB(inode), FAULT_DQUOT_INIT)) {
+	if (f2fs_should_fail(F2FS_I_SB(inode), FAULT_DQUOT_INIT)) {
 		f2fs_show_injection_info(F2FS_I_SB(inode), FAULT_DQUOT_INIT);
 		return -ESRCH;
 	}
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
