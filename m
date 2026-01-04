Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E93CF082B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 04 Jan 2026 03:08:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SClMQxl8cxjdrbV3hr4sM7YJ+ylp4YI3LZ4FB99yFc=; b=kMRMJp1OEgCN38NPTCNPFwzpW/
	j78SDapzOzkQdrXHSGmwqO1B6LiwUYR+xb2zP9qLRZ6QodDA2OwwqmVA/H/T/hJHQ19TXDRUJ6/yN
	XX5Pv4uGbBh8LlrMQjSmAuJEzrzQtEwWbtY4WOf+j4LjdSCH1zx1BiW2ebOn0cSU5c6s=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcDXe-0000JX-Tm;
	Sun, 04 Jan 2026 02:08:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vcDXc-0000JD-4V
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=99AOFW1f4x1i0POyeMXS5HGhb7tT49mljrZbCK4Ch2k=; b=nGAbRqfCO+g7dlmAZl1Y822DBN
 u4lHXQE3dAqp/ZVGcUyGFF/mpWn6RrfqXRcpnUR23KyLkzuWUm5Wj+MKxs+17+f69zCsSySdfj3Xl
 EtQoY/LW8tceSPJeDrUblH2Rbo+/pTtLPuWKpXbTlYb3SwbWlz6GWSqvzhM5sjnsRbOY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=99AOFW1f4x1i0POyeMXS5HGhb7tT49mljrZbCK4Ch2k=; b=TlCvr36ktOxp8/Ow0EnPeuq6lo
 kUgGJvtA6p0NdQisGBa37G7Q3viU152D6wMuDVPlhp5NE3LkJzz79WV5z4btu8+LIJqScpLfmE1/V
 J5Znj8hTtu/mv8b9beEH/31pnIWyGJuxIFQ1dNltZmeyaoYGQZIEhbM1xyuIGWdTg0y4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vcDXb-0005nr-Ge for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3C4E443445
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  4 Jan 2026 02:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C46C19422;
 Sun,  4 Jan 2026 02:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767492493;
 bh=cmX0eU7Hna/JIGPXeuFrU2LWYNyYFfDwo+zWezL5ALA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fz1qERJ1f4gzl7AEqs5rIuKuQXUEz2csc2JVEPMrOBkMNycvPgPwKtRr42ZMNvP+G
 2NGPrxuUnJAaVzlRTiktke39iVem4Yrk7mhjE/cWslWog718BT7te4WktAUc0O5x8u
 4TIT7eXitc+YwbShaJ1dlhviF/o8SqlVtnno+HftkShcr1eSGbl23tpmGK7ua12dJa
 TQVmO7EyvBP11BX2W2pK6a0Q9C7uFH+jgeVa00OMKcxUoR2kN5AaxE/Mv2P9LLZoly
 cloSEok8no+3VDRSbYnqbnGBrzaM76r6SegHDTEmY+PkQXXCa5Zj65tfXth1qCB3UU
 H0eUGoB3SmZRQ==
To: jaegeuk@kernel.org
Date: Sun,  4 Jan 2026 10:07:22 +0800
Message-ID: <20260104020729.1064529-7-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.358.g0dd7633a29-goog
In-Reply-To: <20260104020729.1064529-1-chao@kernel.org>
References: <20260104020729.1064529-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Use f2fs_{down,up}_write_trace for cp_global_sem to trace
 lock elapsed time. Signed-off-by: Chao Yu <chao@kernel.org> ---
 fs/f2fs/checkpoint.c
 | 10 ++++++---- fs/f2fs/f2fs.h | 1 + fs/f2fs/gc.c | 5 +++-- fs/f2fs/recovery.c
 | 5 +++-- fs/f2fs/super.c | 2 +- include/trace/events/f [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vcDXb-0005nr-Ge
Subject: [f2fs-dev] [PATCH 07/14] f2fs: trace elapsed time for cp_global_sem
 lock
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

Use f2fs_{down,up}_write_trace for cp_global_sem to trace lock elapsed time.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c        | 10 ++++++----
 fs/f2fs/f2fs.h              |  1 +
 fs/f2fs/gc.c                |  5 +++--
 fs/f2fs/recovery.c          |  5 +++--
 fs/f2fs/super.c             |  2 +-
 include/trace/events/f2fs.h |  3 ++-
 6 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index da7bcfa2a178..86656231ce83 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -513,6 +513,7 @@ static int f2fs_write_meta_pages(struct address_space *mapping,
 				struct writeback_control *wbc)
 {
 	struct f2fs_sb_info *sbi = F2FS_M_SB(mapping);
+	struct f2fs_lock_context lc;
 	long diff, written;
 
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
@@ -525,13 +526,13 @@ static int f2fs_write_meta_pages(struct address_space *mapping,
 		goto skip_write;
 
 	/* if locked failed, cp will flush dirty pages instead */
-	if (!f2fs_down_write_trylock(&sbi->cp_global_sem))
+	if (!f2fs_down_write_trylock_trace(&sbi->cp_global_sem, &lc))
 		goto skip_write;
 
 	trace_f2fs_writepages(mapping->host, wbc, META);
 	diff = nr_pages_to_write(sbi, META, wbc);
 	written = f2fs_sync_meta_pages(sbi, META, wbc->nr_to_write, FS_META_IO);
-	f2fs_up_write(&sbi->cp_global_sem);
+	f2fs_up_write_trace(&sbi->cp_global_sem, &lc);
 	wbc->nr_to_write = max((long)0, wbc->nr_to_write - written - diff);
 	return 0;
 
@@ -1780,6 +1781,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 {
 	struct f2fs_checkpoint *ckpt = F2FS_CKPT(sbi);
+	struct f2fs_lock_context lc;
 	unsigned long long ckpt_ver;
 	int err = 0;
 
@@ -1794,7 +1796,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 		f2fs_warn(sbi, "Start checkpoint disabled!");
 	}
 	if (cpc->reason != CP_RESIZE)
-		f2fs_down_write(&sbi->cp_global_sem);
+		f2fs_down_write_trace(&sbi->cp_global_sem, &lc);
 
 	stat_cp_time(cpc, CP_TIME_LOCK);
 
@@ -1884,7 +1886,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	trace_f2fs_write_checkpoint(sbi->sb, cpc->reason, CP_PHASE_FINISH_CHECKPOINT);
 out:
 	if (cpc->reason != CP_RESIZE)
-		f2fs_up_write(&sbi->cp_global_sem);
+		f2fs_up_write_trace(&sbi->cp_global_sem, &lc);
 	return err;
 }
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5b6e632b37a9..baaae854c74f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -179,6 +179,7 @@ enum f2fs_lock_name {
 	LOCK_NAME_NODE_CHANGE,
 	LOCK_NAME_NODE_WRITE,
 	LOCK_NAME_GC_LOCK,
+	LOCK_NAME_CP_GLOBAL,
 };
 
 /*
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 391e66064c7e..1538f5b0a644 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2267,6 +2267,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 	struct cp_control cpc = { CP_RESIZE, 0, 0, 0 };
 	struct f2fs_lock_context lc;
 	struct f2fs_lock_context glc;
+	struct f2fs_lock_context clc;
 	unsigned int secs;
 	int err = 0;
 	__u32 rem;
@@ -2350,7 +2351,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 	}
 
 	f2fs_down_write_trace(&sbi->gc_lock, &glc);
-	f2fs_down_write(&sbi->cp_global_sem);
+	f2fs_down_write_trace(&sbi->cp_global_sem, &clc);
 
 	spin_lock(&sbi->stat_lock);
 	if (shrunk_blocks + valid_user_blocks(sbi) +
@@ -2398,7 +2399,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 		spin_unlock(&sbi->stat_lock);
 	}
 out_err:
-	f2fs_up_write(&sbi->cp_global_sem);
+	f2fs_up_write_trace(&sbi->cp_global_sem, &clc);
 	f2fs_up_write_trace(&sbi->gc_lock, &glc);
 	thaw_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
 	return err;
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index c3415ebb9f50..39f6e9830a9c 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -875,6 +875,7 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	LIST_HEAD(inode_list);
 	LIST_HEAD(tmp_inode_list);
 	LIST_HEAD(dir_list);
+	struct f2fs_lock_context lc;
 	int err;
 	int ret = 0;
 	unsigned long s_flags = sbi->sb->s_flags;
@@ -888,7 +889,7 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 		f2fs_info(sbi, "recover fsync data on readonly fs");
 
 	/* prevent checkpoint */
-	f2fs_down_write(&sbi->cp_global_sem);
+	f2fs_down_write_trace(&sbi->cp_global_sem, &lc);
 
 	/* step #1: find fsynced inode numbers */
 	err = find_fsync_dnodes(sbi, &inode_list, check_only, &new_inode);
@@ -932,7 +933,7 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	if (!err)
 		clear_sbi_flag(sbi, SBI_POR_DOING);
 
-	f2fs_up_write(&sbi->cp_global_sem);
+	f2fs_up_write_trace(&sbi->cp_global_sem, &lc);
 
 	/* let's drop all the directory inodes for clean checkpoint */
 	destroy_fsync_dnodes(&dir_list, err);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index abb468eb4394..3583a640e614 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4898,7 +4898,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	/* initialize locks within allocated memory */
 	init_f2fs_rwsem_trace(&sbi->gc_lock, sbi, LOCK_NAME_GC_LOCK);
 	mutex_init(&sbi->writepages);
-	init_f2fs_rwsem(&sbi->cp_global_sem);
+	init_f2fs_rwsem_trace(&sbi->cp_global_sem, sbi, LOCK_NAME_CP_GLOBAL);
 	init_f2fs_rwsem_trace(&sbi->node_write, sbi, LOCK_NAME_NODE_WRITE);
 	init_f2fs_rwsem_trace(&sbi->node_change, sbi, LOCK_NAME_NODE_CHANGE);
 	spin_lock_init(&sbi->stat_lock);
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index bf353e7e024d..859de7c8d1c7 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -189,7 +189,8 @@ TRACE_DEFINE_ENUM(CP_PHASE_FINISH_CHECKPOINT);
 		{ LOCK_NAME_CP_RWSEM,		"cp_rwsem" },		\
 		{ LOCK_NAME_NODE_CHANGE,	"node_change" },	\
 		{ LOCK_NAME_NODE_WRITE,		"node_write" },		\
-		{ LOCK_NAME_GC_LOCK,		"gc_lock" })
+		{ LOCK_NAME_GC_LOCK,		"gc_lock" },		\
+		{ LOCK_NAME_CP_GLOBAL,		"cp_global" })
 
 struct f2fs_sb_info;
 struct f2fs_io_info;
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
