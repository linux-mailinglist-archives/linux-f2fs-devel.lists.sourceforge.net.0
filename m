Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4683C3778
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Jul 2021 01:49:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m2Mj2-0003wI-88; Sat, 10 Jul 2021 23:49:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <sashal@kernel.org>) id 1m2Mj1-0003w9-0Z
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 10 Jul 2021 23:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WKPy7FhFTmNS0IQjHB7vrJDPtxUozBL8RCBBpoGR7n0=; b=BL1rENUZ5uA74Elwv68IisDOY9
 k3A+sgZpc3CKySWHFWxN30CmIeolOXojB8e30Fww87yDQBXT2gTAB42yXvXLlJIvAgZ69oetvK0+t
 30Yrh9AKQnNdeA6ER+bFwE8U4qRhI0sF1g2jLTYHOciQnJMhP/RK2agAKJTLJ5iZVPYo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WKPy7FhFTmNS0IQjHB7vrJDPtxUozBL8RCBBpoGR7n0=; b=mCoz0t6dF9fqMvvpRQFMIbO3XI
 /wn9rfsS1zoElnkoQPVNCvwh9wJgWVhOalkGPr+oJ5uVV730pOneWDYaByQoIYZtSXNS8nDXbvocD
 EntWWTOZz9zg8LcXY7sK0JLKGFDr4m6SZQt0F33hvWS+segdTooIXoraCfCOaDp116aE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m2Mix-0006iS-Qq
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 10 Jul 2021 23:49:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E15E6135E;
 Sat, 10 Jul 2021 23:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625960961;
 bh=sjqpwY73C92VDCDjMUL/DRn6gBYIIH+bFVYETNWMmt4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qu4j7/Dv3dcJtTlYL52PMpSFdBL61iaFxncKG1olRT8zoVnz13qDNuFqYCSKfrawq
 XgbLXxODfd+Xo6o9Lilwhu/lLoZyqc053LNPxJ+yAB8Ou7t+kA/g7QZdNbGsHXoZxr
 Zjd2jOe3JFTxIKJeicSyOhzq8+FZ7ZZZf/YnlXKeSYQe2DGiG55KQDdg9E9x/M8bqI
 9dRj1e/h5nG8AYk2jjHoXRR7cPEITnblehLa1v2QEDTsPb5oHgPdPHycXaEvObqQJG
 rXpFsWOIBOhzm2SXlMAWj7DuNvdv36cGWrIbynSJi4+PqoYtwR2PoQ4B7TupAwjTIf
 fIyh8p0QdYbag==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat, 10 Jul 2021 19:48:35 -0400
Message-Id: <20210710234915.3220342-3-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710234915.3220342-1-sashal@kernel.org>
References: <20210710234915.3220342-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.6 (/)
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
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m2Mix-0006iS-Qq
Subject: [f2fs-dev] [PATCH AUTOSEL 5.12 03/43] f2fs: fix to avoid racing on
 fsync_entry_slab by multi filesystem instances
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>,
 syzbot+9d90dad32dd9727ed084@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit cad83c968c2ebe97905f900326988ed37146c347 ]

As syzbot reported, there is an use-after-free issue during f2fs recovery:

Use-after-free write at 0xffff88823bc16040 (in kfence-#10):
 kmem_cache_destroy+0x1f/0x120 mm/slab_common.c:486
 f2fs_recover_fsync_data+0x75b0/0x8380 fs/f2fs/recovery.c:869
 f2fs_fill_super+0x9393/0xa420 fs/f2fs/super.c:3945
 mount_bdev+0x26c/0x3a0 fs/super.c:1367
 legacy_get_tree+0xea/0x180 fs/fs_context.c:592
 vfs_get_tree+0x86/0x270 fs/super.c:1497
 do_new_mount fs/namespace.c:2905 [inline]
 path_mount+0x196f/0x2be0 fs/namespace.c:3235
 do_mount fs/namespace.c:3248 [inline]
 __do_sys_mount fs/namespace.c:3456 [inline]
 __se_sys_mount+0x2f9/0x3b0 fs/namespace.c:3433
 do_syscall_64+0x3f/0xb0 arch/x86/entry/common.c:47
 entry_SYSCALL_64_after_hwframe+0x44/0xae

The root cause is multi f2fs filesystem instances can race on accessing
global fsync_entry_slab pointer, result in use-after-free issue of slab
cache, fixes to init/destroy this slab cache only once during module
init/destroy procedure to avoid this issue.

Reported-by: syzbot+9d90dad32dd9727ed084@syzkaller.appspotmail.com
Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/f2fs.h     |  2 ++
 fs/f2fs/recovery.c | 23 ++++++++++++++---------
 fs/f2fs/super.c    |  8 +++++++-
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f3fabb1edfe9..148fc1ce52d7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3560,6 +3560,8 @@ void f2fs_destroy_garbage_collection_cache(void);
  */
 int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only);
 bool f2fs_space_for_roll_forward(struct f2fs_sb_info *sbi);
+int __init f2fs_create_recovery_cache(void);
+void f2fs_destroy_recovery_cache(void);
 
 /*
  * debug.c
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index da75d5d52f0a..4ae055f39e21 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -787,13 +787,6 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	quota_enabled = f2fs_enable_quota_files(sbi, s_flags & SB_RDONLY);
 #endif
 
-	fsync_entry_slab = f2fs_kmem_cache_create("f2fs_fsync_inode_entry",
-			sizeof(struct fsync_inode_entry));
-	if (!fsync_entry_slab) {
-		err = -ENOMEM;
-		goto out;
-	}
-
 	INIT_LIST_HEAD(&inode_list);
 	INIT_LIST_HEAD(&tmp_inode_list);
 	INIT_LIST_HEAD(&dir_list);
@@ -866,8 +859,6 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 		}
 	}
 
-	kmem_cache_destroy(fsync_entry_slab);
-out:
 #ifdef CONFIG_QUOTA
 	/* Turn quotas off */
 	if (quota_enabled)
@@ -877,3 +868,17 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 
 	return ret ? ret: err;
 }
+
+int __init f2fs_create_recovery_cache(void)
+{
+	fsync_entry_slab = f2fs_kmem_cache_create("f2fs_fsync_inode_entry",
+					sizeof(struct fsync_inode_entry));
+	if (!fsync_entry_slab)
+		return -ENOMEM;
+	return 0;
+}
+
+void f2fs_destroy_recovery_cache(void)
+{
+	kmem_cache_destroy(fsync_entry_slab);
+}
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d852d96773a3..1f7bc4b3f6ae 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4187,9 +4187,12 @@ static int __init init_f2fs_fs(void)
 	err = f2fs_create_checkpoint_caches();
 	if (err)
 		goto free_segment_manager_caches;
-	err = f2fs_create_extent_cache();
+	err = f2fs_create_recovery_cache();
 	if (err)
 		goto free_checkpoint_caches;
+	err = f2fs_create_extent_cache();
+	if (err)
+		goto free_recovery_cache;
 	err = f2fs_create_garbage_collection_cache();
 	if (err)
 		goto free_extent_cache;
@@ -4238,6 +4241,8 @@ static int __init init_f2fs_fs(void)
 	f2fs_destroy_garbage_collection_cache();
 free_extent_cache:
 	f2fs_destroy_extent_cache();
+free_recovery_cache:
+	f2fs_destroy_recovery_cache();
 free_checkpoint_caches:
 	f2fs_destroy_checkpoint_caches();
 free_segment_manager_caches:
@@ -4263,6 +4268,7 @@ static void __exit exit_f2fs_fs(void)
 	f2fs_exit_sysfs();
 	f2fs_destroy_garbage_collection_cache();
 	f2fs_destroy_extent_cache();
+	f2fs_destroy_recovery_cache();
 	f2fs_destroy_checkpoint_caches();
 	f2fs_destroy_segment_manager_caches();
 	f2fs_destroy_node_manager_caches();
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
