Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82199939CBF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jul 2024 10:33:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWAxh-0005oJ-Ah;
	Tue, 23 Jul 2024 08:33:33 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <youling.tang@linux.dev>) id 1sWAxg-0005o3-BO
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 08:33:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cje3Y5ms0q2wZZ3qNUkIwaPZ+RsvLH8H4iju91pzTbQ=; b=lnpZ0y1Osoq8vRvNS6U22EMd9z
 bwtAyDkuq+Pr4FOe6iDgZn+pOo1t3KG5TVVyiXmhWDaQoF0IbEttTB9O//fJmG90NCYLlBO5EIBRL
 /d22hNF5b4IGrkK+VHQSvmaGhy4M6oDBk0aBV6YMYVoGk3wLjsakOno0jCaei9uafMDg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cje3Y5ms0q2wZZ3qNUkIwaPZ+RsvLH8H4iju91pzTbQ=; b=imoEgsY4cGr5xI7S1s23YtWVh3
 l1ChDOqyJ7iUnqsrX6JpWgfbv+doJykOVinzyxisHRMHL8Q9PxwXdFe98GJOeyNxi9m4tmpvR2qcZ
 Sz3ADf/w2i81ihA3Glas0j4HNvbjcQ+uJIhqsVUDIr+ERvBMBuFtJu0qARZcauMKPsIo=;
Received: from out-179.mta0.migadu.com ([91.218.175.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWAxf-0003tr-71 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 08:33:32 +0000
X-Envelope-To: arnd@arndb.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1721723604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cje3Y5ms0q2wZZ3qNUkIwaPZ+RsvLH8H4iju91pzTbQ=;
 b=N70HycgdIR3ibRzffZLSSKoDwX0DMnfVNAP+94kP0Xckzmrh1ehHKiU2DX7lqmSsF2JTQ5
 aW8Lczzik40cmq6WMH0uY9KDoAMZ73kYcxd03FbPixjXXddnWVkoK9zAL6DSsO07vAiecE
 XydOC3tGCZiWKDPxNjOO63qsWY0TBFg=
X-Envelope-To: mcgrof@kernel.org
X-Envelope-To: clm@fb.com
X-Envelope-To: josef@toxicpanda.com
X-Envelope-To: dsterba@suse.com
X-Envelope-To: tytso@mit.edu
X-Envelope-To: adilger.kernel@dilger.ca
X-Envelope-To: jaegeuk@kernel.org
X-Envelope-To: chao@kernel.org
X-Envelope-To: hch@infradead.org
X-Envelope-To: linux-arch@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-modules@vger.kernel.org
X-Envelope-To: linux-btrfs@vger.kernel.org
X-Envelope-To: linux-ext4@vger.kernel.org
X-Envelope-To: linux-f2fs-devel@lists.sourceforge.net
X-Envelope-To: youling.tang@linux.dev
X-Envelope-To: tangyouling@kylinos.cn
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Youling Tang <youling.tang@linux.dev>
To: Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, tytso@mit.edu,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Christoph Hellwig <hch@infradead.org>
Date: Tue, 23 Jul 2024 16:32:39 +0800
Message-Id: <20240723083239.41533-5-youling.tang@linux.dev>
In-Reply-To: <20240723083239.41533-1-youling.tang@linux.dev>
References: <20240723083239.41533-1-youling.tang@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Youling Tang <tangyouling@kylinos.cn> Use
 module_{subinit, 
 subinit} to ensure that modules init and exit are in sequence and to simplify
 the code. Signed-off-by: Youling Tang <tangyouling@kylinos.cn> ---
 fs/f2fs/debug.c
 | 3 +- fs/f2fs/f2fs.h | 4 +- fs/f2fs/super.c | 139 +++++++++++ 3 files changed,
 36 inserti [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.dev]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [91.218.175.179 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [91.218.175.179 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sWAxf-0003tr-71
Subject: [f2fs-dev] [PATCH 4/4] f2fs: Use module_{subinit,
 subeixt} helper macros
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
Cc: linux-arch@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-modules@vger.kernel.org, youling.tang@linux.dev,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Youling Tang <tangyouling@kylinos.cn>

Use module_{subinit, subinit} to ensure that modules init and exit
are in sequence and to simplify the code.

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 fs/f2fs/debug.c |   3 +-
 fs/f2fs/f2fs.h  |   4 +-
 fs/f2fs/super.c | 139 +++++++++++-------------------------------------
 3 files changed, 36 insertions(+), 110 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 8b0e1e71b667..c08ecf807066 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -727,7 +727,7 @@ void f2fs_destroy_stats(struct f2fs_sb_info *sbi)
 	kfree(si);
 }
 
-void __init f2fs_create_root_stats(void)
+int __init f2fs_create_root_stats(void)
 {
 #ifdef CONFIG_DEBUG_FS
 	f2fs_debugfs_root = debugfs_create_dir("f2fs", NULL);
@@ -735,6 +735,7 @@ void __init f2fs_create_root_stats(void)
 	debugfs_create_file("status", 0444, f2fs_debugfs_root, NULL,
 			    &stat_fops);
 #endif
+	return 0;
 }
 
 void f2fs_destroy_root_stats(void)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8a9d910aa552..b2909383bcd9 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4100,7 +4100,7 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 
 int f2fs_build_stats(struct f2fs_sb_info *sbi);
 void f2fs_destroy_stats(struct f2fs_sb_info *sbi);
-void __init f2fs_create_root_stats(void);
+int __init f2fs_create_root_stats(void);
 void f2fs_destroy_root_stats(void);
 void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
 #else
@@ -4142,7 +4142,7 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
 
 static inline int f2fs_build_stats(struct f2fs_sb_info *sbi) { return 0; }
 static inline void f2fs_destroy_stats(struct f2fs_sb_info *sbi) { }
-static inline void __init f2fs_create_root_stats(void) { }
+static inline int __init f2fs_create_root_stats(void) { }
 static inline void f2fs_destroy_root_stats(void) { }
 static inline void f2fs_update_sit_info(struct f2fs_sb_info *sbi) {}
 #endif
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index df4cf31f93df..162ec1005b22 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4940,120 +4940,45 @@ static void destroy_inodecache(void)
 	kmem_cache_destroy(f2fs_inode_cachep);
 }
 
-static int __init init_f2fs_fs(void)
+static int register_f2fs(void)
 {
-	int err;
+	return register_filesystem(&f2fs_fs_type);
+}
 
-	err = init_inodecache();
-	if (err)
-		goto fail;
-	err = f2fs_create_node_manager_caches();
-	if (err)
-		goto free_inodecache;
-	err = f2fs_create_segment_manager_caches();
-	if (err)
-		goto free_node_manager_caches;
-	err = f2fs_create_checkpoint_caches();
-	if (err)
-		goto free_segment_manager_caches;
-	err = f2fs_create_recovery_cache();
-	if (err)
-		goto free_checkpoint_caches;
-	err = f2fs_create_extent_cache();
-	if (err)
-		goto free_recovery_cache;
-	err = f2fs_create_garbage_collection_cache();
-	if (err)
-		goto free_extent_cache;
-	err = f2fs_init_sysfs();
-	if (err)
-		goto free_garbage_collection_cache;
-	err = f2fs_init_shrinker();
-	if (err)
-		goto free_sysfs;
-	err = register_filesystem(&f2fs_fs_type);
-	if (err)
-		goto free_shrinker;
-	f2fs_create_root_stats();
-	err = f2fs_init_post_read_processing();
-	if (err)
-		goto free_root_stats;
-	err = f2fs_init_iostat_processing();
-	if (err)
-		goto free_post_read;
-	err = f2fs_init_bio_entry_cache();
-	if (err)
-		goto free_iostat;
-	err = f2fs_init_bioset();
-	if (err)
-		goto free_bio_entry_cache;
-	err = f2fs_init_compress_mempool();
-	if (err)
-		goto free_bioset;
-	err = f2fs_init_compress_cache();
-	if (err)
-		goto free_compress_mempool;
-	err = f2fs_create_casefold_cache();
-	if (err)
-		goto free_compress_cache;
-	return 0;
-free_compress_cache:
-	f2fs_destroy_compress_cache();
-free_compress_mempool:
-	f2fs_destroy_compress_mempool();
-free_bioset:
-	f2fs_destroy_bioset();
-free_bio_entry_cache:
-	f2fs_destroy_bio_entry_cache();
-free_iostat:
-	f2fs_destroy_iostat_processing();
-free_post_read:
-	f2fs_destroy_post_read_processing();
-free_root_stats:
-	f2fs_destroy_root_stats();
+static void unregister_f2fs(void)
+{
 	unregister_filesystem(&f2fs_fs_type);
-free_shrinker:
-	f2fs_exit_shrinker();
-free_sysfs:
-	f2fs_exit_sysfs();
-free_garbage_collection_cache:
-	f2fs_destroy_garbage_collection_cache();
-free_extent_cache:
-	f2fs_destroy_extent_cache();
-free_recovery_cache:
-	f2fs_destroy_recovery_cache();
-free_checkpoint_caches:
-	f2fs_destroy_checkpoint_caches();
-free_segment_manager_caches:
-	f2fs_destroy_segment_manager_caches();
-free_node_manager_caches:
-	f2fs_destroy_node_manager_caches();
-free_inodecache:
-	destroy_inodecache();
-fail:
-	return err;
 }
 
+static struct subexitcall_rollback rollback;
+
 static void __exit exit_f2fs_fs(void)
 {
-	f2fs_destroy_casefold_cache();
-	f2fs_destroy_compress_cache();
-	f2fs_destroy_compress_mempool();
-	f2fs_destroy_bioset();
-	f2fs_destroy_bio_entry_cache();
-	f2fs_destroy_iostat_processing();
-	f2fs_destroy_post_read_processing();
-	f2fs_destroy_root_stats();
-	unregister_filesystem(&f2fs_fs_type);
-	f2fs_exit_shrinker();
-	f2fs_exit_sysfs();
-	f2fs_destroy_garbage_collection_cache();
-	f2fs_destroy_extent_cache();
-	f2fs_destroy_recovery_cache();
-	f2fs_destroy_checkpoint_caches();
-	f2fs_destroy_segment_manager_caches();
-	f2fs_destroy_node_manager_caches();
-	destroy_inodecache();
+	module_subexit(&rollback);
+}
+
+static int __init init_f2fs_fs(void)
+{
+	module_subinit(init_inodecache, destroy_inodecache, &rollback);
+	module_subinit(f2fs_create_node_manager_caches, f2fs_destroy_node_manager_caches, &rollback);
+	module_subinit(f2fs_create_segment_manager_caches, f2fs_destroy_segment_manager_caches, &rollback);
+	module_subinit(f2fs_create_checkpoint_caches, f2fs_destroy_checkpoint_caches, &rollback);
+	module_subinit(f2fs_create_recovery_cache, f2fs_destroy_recovery_cache, &rollback);
+	module_subinit(f2fs_create_extent_cache, f2fs_destroy_extent_cache, &rollback);
+	module_subinit(f2fs_create_garbage_collection_cache, f2fs_destroy_garbage_collection_cache, &rollback);
+	module_subinit(f2fs_init_sysfs, f2fs_exit_sysfs, &rollback);
+	module_subinit(f2fs_init_shrinker, f2fs_exit_shrinker, &rollback);
+	module_subinit(register_f2fs, unregister_f2fs, &rollback);
+	module_subinit(f2fs_create_root_stats, f2fs_destroy_root_stats, &rollback);
+	module_subinit(f2fs_init_post_read_processing, f2fs_destroy_post_read_processing, &rollback);
+	module_subinit(f2fs_init_iostat_processing, f2fs_destroy_iostat_processing, &rollback);
+	module_subinit(f2fs_init_bio_entry_cache, f2fs_destroy_bio_entry_cache, &rollback);
+	module_subinit(f2fs_init_bioset, f2fs_destroy_bioset, &rollback);
+	module_subinit(f2fs_init_compress_mempool, f2fs_destroy_compress_mempool, &rollback);
+	module_subinit(f2fs_init_compress_cache, f2fs_destroy_compress_cache, &rollback);
+	module_subinit(f2fs_create_casefold_cache, f2fs_destroy_casefold_cache, &rollback);
+
+	return 0;
 }
 
 module_init(init_f2fs_fs)
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
