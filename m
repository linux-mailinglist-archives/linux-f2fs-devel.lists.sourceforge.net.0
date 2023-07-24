Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC8F75F298
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jul 2023 12:17:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qNsck-0008IO-0S;
	Mon, 24 Jul 2023 10:17:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qNsci-0008II-Su
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:17:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5g6npGIA+Om/kUVtGYVOvbagC3ZLyiKj4WIBQXCM8VE=; b=QSbpOnDIZkxvb+sqRm6Zuq9NG/
 5PekZOUx9hz0JlpjUgSqvR/XJh/fsv9KD9oFbbWaOUs7lhWlBPVAl/Nbj6Q+tAtJ/P03ENJb43Hqe
 ZYf+uiYjk8N16tYQEgK4zP7NWdF8MCpIAF+a2hMohO/RDvd9wumQI3xxIRFTwrCmttm8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5g6npGIA+Om/kUVtGYVOvbagC3ZLyiKj4WIBQXCM8VE=; b=UnHfdqCAAUm7l/b+W3L4gRAJtH
 UiCjbQo9+KcEjGQFRgmIg3BiLPuMSGmLYrOdoinpdbeinLdBskC7XpWPADT8QVINanQ0aa8BfX1J/
 Qnj+htO98IShhIO0yhjs9S9/wgBFeomOr6C9iXTIPYbxn2aABgpuT9co0xik2JaEcqKM=;
Received: from mail-qt1-f170.google.com ([209.85.160.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qNscf-0004qb-Nx for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:17:03 +0000
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-403a7c0ce4dso11814451cf.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jul 2023 03:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690193816; x=1690798616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5g6npGIA+Om/kUVtGYVOvbagC3ZLyiKj4WIBQXCM8VE=;
 b=UW/o5g77JQSGT9YRgACh7WxCgM+28tcWiSwDK2NJgrE29L28xNY8Gdp5fKLdb7m1VB
 Qtlnq/g8G/qmEGCElYp1LqSKAG/iFUtIzucwzRgduVIsNr51aFI2asFLIUAtBmTXAbIN
 9S3TfQbCksgdHliTXqqO0H/ocV2Bv47HMMwMBwM9JrWUKAGG5j5hO4xtnWqN0ztZBA4e
 uKPf04dD0XK99AJYiTjgacc/pabrM4hsE841C1V+GZ74j0GSOhFiDHCEYY2D1k/m9sJ9
 XWhzcmqmZcAab8ZCvxOEmXlm4rrJqXZ1e+e3oO1eD841gApNqR8ygYJvE7XQXiIhbZ/x
 A3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690193816; x=1690798616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5g6npGIA+Om/kUVtGYVOvbagC3ZLyiKj4WIBQXCM8VE=;
 b=OTFe8IgMdIw+fv//Gp1CwaBcQp24pjVYfuk/KwIzMUZbn2J16ZRwvgf6vLCK53v7/L
 6Yxp3isWvs5uKo1XB4LmU4zmsJJgLoloDkf2cg6XkBNc+XqpOaXnt9VhGc3Rqe0K6e3W
 1JEKs1dqzEadUoyBBzbual34QA+ukzGOJGCgqseRj9dlbl9z52XsuuLbNL7j4cssbQl5
 33SL1UqdGI1NxRheIEeCpPyUQ1itez6rH1ZqWfdTARzgMuE6MlIZNL2hhTiRFB+EKGij
 odtWbXTPdm+zZB186D6jAPrCvQhbnUbQCMTJj3aVtO/SEP9Krff33kMeDHh3abpHlDEr
 Bh0g==
X-Gm-Message-State: ABy/qLbxxhd3MaNhksazPTqwp7ngCnTgj7aRWDil8d4cXkz1x+IM+nmQ
 Fj/VulvmDNRVYFGHyM71KrC+kUQHtlBcH4xRP98=
X-Google-Smtp-Source: APBJJlEx0UJtyjeglsteyzH1DFG53jEzFogOJaFJ6A1FWxhCOYZ9xoBbTcFIdBRvvwYlgD9HKyyPmg==
X-Received: by 2002:a17:902:ce92:b0:1b8:1591:9f81 with SMTP id
 f18-20020a170902ce9200b001b815919f81mr12186048plg.4.1690192385749; 
 Mon, 24 Jul 2023 02:53:05 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:53:05 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 17:43:47 +0800
Message-Id: <20230724094354.90817-41-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In preparation for implementing lockless slab shrink, use
 new APIs to dynamically allocate the s_shrink,
 so that it can be freed asynchronously
 using kfree_rcu(). Then it doesn't need to wait for RCU [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.170 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.170 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qNscf-0004qb-Nx
Subject: [f2fs-dev] [PATCH v2 40/47] fs: super: dynamically allocate the
 s_shrink
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
From: Qi Zheng via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the s_shrink, so that it can be freed asynchronously
using kfree_rcu(). Then it doesn't need to wait for RCU read-side critical
section when releasing the struct super_block.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 fs/btrfs/super.c   |  2 +-
 fs/kernfs/mount.c  |  2 +-
 fs/proc/root.c     |  2 +-
 fs/super.c         | 37 +++++++++++++++++++++----------------
 include/linux/fs.h |  2 +-
 5 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index f1dd172d8d5b..fad4ded26c80 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -1513,7 +1513,7 @@ static struct dentry *btrfs_mount_root(struct file_system_type *fs_type,
 			error = -EBUSY;
 	} else {
 		snprintf(s->s_id, sizeof(s->s_id), "%pg", bdev);
-		shrinker_debugfs_rename(&s->s_shrink, "sb-%s:%s", fs_type->name,
+		shrinker_debugfs_rename(s->s_shrink, "sb-%s:%s", fs_type->name,
 					s->s_id);
 		btrfs_sb(s)->bdev_holder = fs_type;
 		error = btrfs_fill_super(s, fs_devices, data);
diff --git a/fs/kernfs/mount.c b/fs/kernfs/mount.c
index d49606accb07..2657ff1181f1 100644
--- a/fs/kernfs/mount.c
+++ b/fs/kernfs/mount.c
@@ -256,7 +256,7 @@ static int kernfs_fill_super(struct super_block *sb, struct kernfs_fs_context *k
 	sb->s_time_gran = 1;
 
 	/* sysfs dentries and inodes don't require IO to create */
-	sb->s_shrink.seeks = 0;
+	sb->s_shrink->seeks = 0;
 
 	/* get root inode, initialize and unlock it */
 	down_read(&kf_root->kernfs_rwsem);
diff --git a/fs/proc/root.c b/fs/proc/root.c
index a86e65a608da..22b78b28b477 100644
--- a/fs/proc/root.c
+++ b/fs/proc/root.c
@@ -188,7 +188,7 @@ static int proc_fill_super(struct super_block *s, struct fs_context *fc)
 	s->s_stack_depth = FILESYSTEM_MAX_STACK_DEPTH;
 
 	/* procfs dentries and inodes don't require IO to create */
-	s->s_shrink.seeks = 0;
+	s->s_shrink->seeks = 0;
 
 	pde_get(&proc_root);
 	root_inode = proc_get_inode(s, &proc_root);
diff --git a/fs/super.c b/fs/super.c
index e781226e2880..04643fd80886 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -67,7 +67,7 @@ static unsigned long super_cache_scan(struct shrinker *shrink,
 	long	dentries;
 	long	inodes;
 
-	sb = container_of(shrink, struct super_block, s_shrink);
+	sb = shrink->private_data;
 
 	/*
 	 * Deadlock avoidance.  We may hold various FS locks, and we don't want
@@ -120,7 +120,7 @@ static unsigned long super_cache_count(struct shrinker *shrink,
 	struct super_block *sb;
 	long	total_objects = 0;
 
-	sb = container_of(shrink, struct super_block, s_shrink);
+	sb = shrink->private_data;
 
 	/*
 	 * We don't call trylock_super() here as it is a scalability bottleneck,
@@ -182,7 +182,8 @@ static void destroy_unused_super(struct super_block *s)
 	security_sb_free(s);
 	put_user_ns(s->s_user_ns);
 	kfree(s->s_subtype);
-	free_prealloced_shrinker(&s->s_shrink);
+	if (s->s_shrink)
+		shrinker_free_non_registered(s->s_shrink);
 	/* no delays needed */
 	destroy_super_work(&s->destroy_work);
 }
@@ -259,16 +260,20 @@ static struct super_block *alloc_super(struct file_system_type *type, int flags,
 	s->s_time_min = TIME64_MIN;
 	s->s_time_max = TIME64_MAX;
 
-	s->s_shrink.seeks = DEFAULT_SEEKS;
-	s->s_shrink.scan_objects = super_cache_scan;
-	s->s_shrink.count_objects = super_cache_count;
-	s->s_shrink.batch = 1024;
-	s->s_shrink.flags = SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE;
-	if (prealloc_shrinker(&s->s_shrink, "sb-%s", type->name))
+	s->s_shrink = shrinker_alloc(SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE,
+				     "sb-%s", type->name);
+	if (!s->s_shrink)
 		goto fail;
-	if (list_lru_init_memcg(&s->s_dentry_lru, &s->s_shrink))
+
+	s->s_shrink->seeks = DEFAULT_SEEKS;
+	s->s_shrink->scan_objects = super_cache_scan;
+	s->s_shrink->count_objects = super_cache_count;
+	s->s_shrink->batch = 1024;
+	s->s_shrink->private_data = s;
+
+	if (list_lru_init_memcg(&s->s_dentry_lru, s->s_shrink))
 		goto fail;
-	if (list_lru_init_memcg(&s->s_inode_lru, &s->s_shrink))
+	if (list_lru_init_memcg(&s->s_inode_lru, s->s_shrink))
 		goto fail;
 	return s;
 
@@ -326,7 +331,7 @@ void deactivate_locked_super(struct super_block *s)
 {
 	struct file_system_type *fs = s->s_type;
 	if (atomic_dec_and_test(&s->s_active)) {
-		unregister_shrinker(&s->s_shrink);
+		shrinker_unregister(s->s_shrink);
 		fs->kill_sb(s);
 
 		/*
@@ -599,7 +604,7 @@ struct super_block *sget_fc(struct fs_context *fc,
 	hlist_add_head(&s->s_instances, &s->s_type->fs_supers);
 	spin_unlock(&sb_lock);
 	get_filesystem(s->s_type);
-	register_shrinker_prepared(&s->s_shrink);
+	shrinker_register(s->s_shrink);
 	return s;
 
 share_extant_sb:
@@ -678,7 +683,7 @@ struct super_block *sget(struct file_system_type *type,
 	hlist_add_head(&s->s_instances, &type->fs_supers);
 	spin_unlock(&sb_lock);
 	get_filesystem(type);
-	register_shrinker_prepared(&s->s_shrink);
+	shrinker_register(s->s_shrink);
 	return s;
 }
 EXPORT_SYMBOL(sget);
@@ -1312,7 +1317,7 @@ int get_tree_bdev(struct fs_context *fc,
 		down_write(&s->s_umount);
 	} else {
 		snprintf(s->s_id, sizeof(s->s_id), "%pg", bdev);
-		shrinker_debugfs_rename(&s->s_shrink, "sb-%s:%s",
+		shrinker_debugfs_rename(s->s_shrink, "sb-%s:%s",
 					fc->fs_type->name, s->s_id);
 		sb_set_blocksize(s, block_size(bdev));
 		error = fill_super(s, fc);
@@ -1385,7 +1390,7 @@ struct dentry *mount_bdev(struct file_system_type *fs_type,
 		down_write(&s->s_umount);
 	} else {
 		snprintf(s->s_id, sizeof(s->s_id), "%pg", bdev);
-		shrinker_debugfs_rename(&s->s_shrink, "sb-%s:%s",
+		shrinker_debugfs_rename(s->s_shrink, "sb-%s:%s",
 					fs_type->name, s->s_id);
 		sb_set_blocksize(s, block_size(bdev));
 		error = fill_super(s, data, flags & SB_SILENT ? 1 : 0);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index b4dca987a5d8..92748fc368b2 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1231,7 +1231,7 @@ struct super_block {
 
 	const struct dentry_operations *s_d_op; /* default d_op for dentries */
 
-	struct shrinker s_shrink;	/* per-sb shrinker handle */
+	struct shrinker *s_shrink;	/* per-sb shrinker handle */
 
 	/* Number of inodes with nlink == 0 but still referenced */
 	atomic_long_t s_remove_count;
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
