Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7298108EE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Dec 2023 05:01:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rDGR6-0005WR-QO;
	Wed, 13 Dec 2023 04:01:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rDGR5-0005WC-OS
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Dec 2023 04:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W74V8QtCobbnfuvrfSmx6rxGCLo/wJVK/TR30qlPA8M=; b=nBqxcMMlx29u7JV6ismi810ecT
 cJF//JzadeBBZzBDyB1++6Ap6tEscUS+G1ta3k2xYR2sqr1v7fMiauDIOP/ZV0ipVa20C57Zp2zEz
 k1p+YK3M6V4yKB/Btr7rPy4KgTDsGtiLL4gExzwprsGseRPWLRtkplJ0QiJusLUw0p/U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W74V8QtCobbnfuvrfSmx6rxGCLo/wJVK/TR30qlPA8M=; b=VSmtul5Tsp5HTLD/CwA/86hqBQ
 Z1oV5+9XAJ36joGGwwVig/996Yvqf8Aq2fP2RzNPUoOb+RD+i0SfialTktPEr28DKD5rttiI//zuN
 zc86gx26JX9tRqO6dMr5wHZDSqcsicdyo3Pu92V4WRG4b53rbHt0mbOu+0O9CXhEojpE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rDGR4-0004CF-Ow for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Dec 2023 04:01:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 6AA01B81A1A;
 Wed, 13 Dec 2023 04:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D37EC433C7;
 Wed, 13 Dec 2023 04:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702440074;
 bh=x1ouiu2WnKIQtV47erUmnthL70kDRsFLvcEjWZFRFeg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f0KKoY2jT1ZANMkBJSLNQH5u8pVIMTsBy73HXBRpwKDV7Y9DEaZ3MOTaU6elnCdH5
 FEifJwGLDyd6ZCqq1Uxg65Uwdai7TBwjjtQs8EfW6obfdASjJ/0m23vQ8KPHo6TMju
 hQQ9jWtHdGElAkeKMaVUcltO3blbnswYq/yrMfCuij5ThcE+PRpE/suLTrQNhM5Lxy
 qcQ0xAqr3VM87rfeMHQ34tQ6Zj+NkaAl6JVTKgFojpSuA4mXi6VGxMsVnWl+Hi55zF
 UbfeVpEKmp9Oq4lTMdTCFosg906UJ++dakgjzl56DBXB2Nos2yVxhUpVEdNM0pcDiT
 gsKVYq/cC6eAA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Tue, 12 Dec 2023 20:00:16 -0800
Message-ID: <20231213040018.73803-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213040018.73803-1-ebiggers@kernel.org>
References: <20231213040018.73803-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Christoph Hellwig <hch@lst.de> blkdev_put must not be
 called under sb->s_umount to avoid a lock order reversal with disk->open_mutex
 once call backs from block devices to the file system using the holder ops
 are supported. Move the [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rDGR4-0004CF-Ow
Subject: [f2fs-dev] [PATCH 1/3] btrfs: call btrfs_close_devices from
 ->kill_sb
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
Cc: Christian Brauner <brauner@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Christoph Hellwig <hch@lst.de>

blkdev_put must not be called under sb->s_umount to avoid a lock order
reversal with disk->open_mutex once call backs from block devices to
the file system using the holder ops are supported.  Move the call
to btrfs_close_devices into btrfs_free_fs_info so that it is closed
from ->kill_sb (which is also called from the mount failure handling
path unlike ->put_super) as well as when an fs_info is freed because
an existing superblock already exists.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/btrfs/disk-io.c | 4 ++--
 fs/btrfs/super.c   | 7 ++-----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index bbcc3df776461..fe98e6b1d9c61 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -1237,20 +1237,22 @@ static void free_global_roots(struct btrfs_fs_info *fs_info)
 
 	while ((node = rb_first_postorder(&fs_info->global_root_tree)) != NULL) {
 		root = rb_entry(node, struct btrfs_root, rb_node);
 		rb_erase(&root->rb_node, &fs_info->global_root_tree);
 		btrfs_put_root(root);
 	}
 }
 
 void btrfs_free_fs_info(struct btrfs_fs_info *fs_info)
 {
+	if (fs_info->fs_devices)
+		btrfs_close_devices(fs_info->fs_devices);
 	percpu_counter_destroy(&fs_info->dirty_metadata_bytes);
 	percpu_counter_destroy(&fs_info->delalloc_bytes);
 	percpu_counter_destroy(&fs_info->ordered_bytes);
 	percpu_counter_destroy(&fs_info->dev_replace.bio_counter);
 	btrfs_free_csum_hash(fs_info);
 	btrfs_free_stripe_hash_table(fs_info);
 	btrfs_free_ref_cache(fs_info);
 	kfree(fs_info->balance_ctl);
 	kfree(fs_info->delayed_root);
 	free_global_roots(fs_info);
@@ -3605,21 +3607,20 @@ int __cold open_ctree(struct super_block *sb, struct btrfs_fs_devices *fs_device
 	invalidate_inode_pages2(fs_info->btree_inode->i_mapping);
 
 fail_sb_buffer:
 	btrfs_stop_all_workers(fs_info);
 	btrfs_free_block_groups(fs_info);
 fail_alloc:
 	btrfs_mapping_tree_free(&fs_info->mapping_tree);
 
 	iput(fs_info->btree_inode);
 fail:
-	btrfs_close_devices(fs_info->fs_devices);
 	ASSERT(ret < 0);
 	return ret;
 }
 ALLOW_ERROR_INJECTION(open_ctree, ERRNO);
 
 static void btrfs_end_super_write(struct bio *bio)
 {
 	struct btrfs_device *device = bio->bi_private;
 	struct bio_vec *bvec;
 	struct bvec_iter_all iter_all;
@@ -4385,21 +4386,20 @@ void __cold close_ctree(struct btrfs_fs_info *fs_info)
 	 * have had an IO error and have left over tree log blocks that aren't
 	 * cleaned up until the fs roots are freed.  This makes the block group
 	 * accounting appear to be wrong because there's pending reserved bytes,
 	 * so make sure we do the block group cleanup afterwards.
 	 */
 	btrfs_free_block_groups(fs_info);
 
 	iput(fs_info->btree_inode);
 
 	btrfs_mapping_tree_free(&fs_info->mapping_tree);
-	btrfs_close_devices(fs_info->fs_devices);
 }
 
 void btrfs_mark_buffer_dirty(struct btrfs_trans_handle *trans,
 			     struct extent_buffer *buf)
 {
 	struct btrfs_fs_info *fs_info = buf->fs_info;
 	u64 transid = btrfs_header_generation(buf);
 
 #ifdef CONFIG_BTRFS_FS_RUN_SANITY_TESTS
 	/*
diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index ef256b944c72a..9616ce63c5630 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -1450,55 +1450,52 @@ static struct dentry *btrfs_mount_root(struct file_system_type *fs_type,
 	fs_devices = device->fs_devices;
 	fs_info->fs_devices = fs_devices;
 
 	error = btrfs_open_devices(fs_devices, mode, fs_type);
 	mutex_unlock(&uuid_mutex);
 	if (error)
 		goto error_fs_info;
 
 	if (!(flags & SB_RDONLY) && fs_devices->rw_devices == 0) {
 		error = -EACCES;
-		goto error_close_devices;
+		goto error_fs_info;
 	}
 
 	bdev = fs_devices->latest_dev->bdev;
 	s = sget(fs_type, btrfs_test_super, btrfs_set_super, flags | SB_NOSEC,
 		 fs_info);
 	if (IS_ERR(s)) {
 		error = PTR_ERR(s);
-		goto error_close_devices;
+		goto error_fs_info;
 	}
 
 	if (s->s_root) {
-		btrfs_close_devices(fs_devices);
 		btrfs_free_fs_info(fs_info);
 		if ((flags ^ s->s_flags) & SB_RDONLY)
 			error = -EBUSY;
 	} else {
 		snprintf(s->s_id, sizeof(s->s_id), "%pg", bdev);
 		shrinker_debugfs_rename(s->s_shrink, "sb-%s:%s", fs_type->name,
 					s->s_id);
 		btrfs_sb(s)->bdev_holder = fs_type;
 		error = btrfs_fill_super(s, fs_devices, data);
 	}
 	if (!error)
 		error = security_sb_set_mnt_opts(s, new_sec_opts, 0, NULL);
 	security_free_mnt_opts(&new_sec_opts);
 	if (error) {
 		deactivate_locked_super(s);
 		return ERR_PTR(error);
 	}
 
 	return dget(s->s_root);
 
-error_close_devices:
-	btrfs_close_devices(fs_devices);
 error_fs_info:
 	btrfs_free_fs_info(fs_info);
 error_sec_opts:
 	security_free_mnt_opts(&new_sec_opts);
 	return ERR_PTR(error);
 }
 
 /*
  * Mount function which is called by VFS layer.
  *
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
