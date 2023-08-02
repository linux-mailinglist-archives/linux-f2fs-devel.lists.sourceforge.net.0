Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F01676D27D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Aug 2023 17:42:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRDzJ-0005WE-C9;
	Wed, 02 Aug 2023 15:42:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e55ed01a16a80b75ffb8+7283+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1qRDzH-0005W3-SM for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M1CYJB5aZHpSvwyG1hOGEAK3efdcwABvgd5jbMJTCG8=; b=DfpK+3eqqsb+GDiap23vZV3+aV
 46J3LhWB7rVnpsnV+Hf1H1CCfIanjQQfVRdYj9AcM9qhTsPfO/6tU/8Lcq8uoUcEkxfgzQx0XVPny
 I3jHgQvOVjQZHP8w5NmzZNbWREsHllOqkvbn93npsuxBDVSSn3CBrVogFxReg1SWhVb0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M1CYJB5aZHpSvwyG1hOGEAK3efdcwABvgd5jbMJTCG8=; b=MnWt63AlV68rWWuvh4X84Bj1HS
 2RI1o2XW8INsJFoc6toBpz/n7qLBGA1Eryc7JZNQXZuVcJD93FtT88ZByqlfn5A3IZsTmC5Jqlg4X
 iydgHj5jFXL21bolpprTghy6RFHCDvj6DlQiW6eYjVPFY7E2LcOGpQTnBo2TbT+mBZJ8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRDzH-0004TP-6V for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=M1CYJB5aZHpSvwyG1hOGEAK3efdcwABvgd5jbMJTCG8=; b=4M2U9E2zBIKq45Q55cHcXCmYTg
 gAnYWD0UBubVeGE8flbFzHcT2SAbc9FEd/qFH3xmSbWluAsI7ww7kYoPqlU3QRz8RzFRKLHIzCgsf
 cr+3pEEMdDlLG1z5QCdKhFRnxuZje6F/ETjowj21lvzt7iG5qDNkgAKTduXm8RM6mxtnghjEmUiaS
 7mgukROVBAbdXXqRfUtEp/TlgAYZIPJaVLwJpzJz5iuX46JRBvvwzLD9hgz9rnWt+GHxif423Xbbh
 VxSnMzgn7bE0RP3Snb8vXJU9C2OAa1FWQ+NPZeXwjgltT9BQvqIRMcNdE46+kaNcA/LQM6OmRuIiT
 4Jzx0irw==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qRDz3-005GGI-2j; Wed, 02 Aug 2023 15:41:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Date: Wed,  2 Aug 2023 17:41:25 +0200
Message-Id: <20230802154131.2221419-7-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802154131.2221419-1-hch@lst.de>
References: <20230802154131.2221419-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The file system type is not a very useful holder as it
 doesn't
 allow us to go back to the actual file system instance. Pass the super_block
 instead which is useful when passed back to the file system [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qRDzH-0004TP-6V
Subject: [f2fs-dev] [PATCH 06/12] fs: use the super_block as holder when
 mounting file systems
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The file system type is not a very useful holder as it doesn't allow us
to go back to the actual file system instance.  Pass the super_block instead
which is useful when passed back to the file system driver.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/btrfs/super.c | 7 ++-----
 fs/f2fs/super.c  | 7 +++----
 fs/super.c       | 8 ++++----
 3 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index 5980b5dcc6b163..8a47c7f2690880 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -69,8 +69,6 @@ static const struct super_operations btrfs_super_ops;
  * requested by subvol=/path. That way the callchain is straightforward and we
  * don't have to play tricks with the mount options and recursive calls to
  * btrfs_mount.
- *
- * The new btrfs_root_fs_type also servers as a tag for the bdev_holder.
  */
 static struct file_system_type btrfs_fs_type;
 static struct file_system_type btrfs_root_fs_type;
@@ -1498,8 +1496,7 @@ static struct dentry *btrfs_mount_root(struct file_system_type *fs_type,
 	} else {
 		struct btrfs_fs_devices *fs_devices = fs_info->fs_devices;
 
-		error = btrfs_open_devices(fs_devices, sb_open_mode(flags),
-					   fs_type);
+		error = btrfs_open_devices(fs_devices, sb_open_mode(flags), s);
 		if (error)
 			goto out_deactivate;
 
@@ -1513,7 +1510,7 @@ static struct dentry *btrfs_mount_root(struct file_system_type *fs_type,
 			 fs_devices->latest_dev->bdev);
 		shrinker_debugfs_rename(&s->s_shrink, "sb-%s:%s", fs_type->name,
 					s->s_id);
-		btrfs_sb(s)->bdev_holder = fs_type;
+		fs_info->bdev_holder = s;
 		error = btrfs_fill_super(s, fs_devices, data);
 	}
 	if (!error)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ca31163da00a55..05c90fdb7a6cca 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1561,7 +1561,7 @@ static void destroy_device_list(struct f2fs_sb_info *sbi)
 	int i;
 
 	for (i = 0; i < sbi->s_ndevs; i++) {
-		blkdev_put(FDEV(i).bdev, sbi->sb->s_type);
+		blkdev_put(FDEV(i).bdev, sbi->sb);
 #ifdef CONFIG_BLK_DEV_ZONED
 		kvfree(FDEV(i).blkz_seq);
 #endif
@@ -4198,7 +4198,7 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 			/* Single zoned block device mount */
 			FDEV(0).bdev =
 				blkdev_get_by_dev(sbi->sb->s_bdev->bd_dev, mode,
-						  sbi->sb->s_type, NULL);
+						  sbi->sb, NULL);
 		} else {
 			/* Multi-device mount */
 			memcpy(FDEV(i).path, RDEV(i).path, MAX_PATH_LEN);
@@ -4217,8 +4217,7 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 					sbi->log_blocks_per_seg) - 1;
 			}
 			FDEV(i).bdev = blkdev_get_by_path(FDEV(i).path, mode,
-							  sbi->sb->s_type,
-							  NULL);
+							  sbi->sb, NULL);
 		}
 		if (IS_ERR(FDEV(i).bdev))
 			return PTR_ERR(FDEV(i).bdev);
diff --git a/fs/super.c b/fs/super.c
index 6aaa275fa8630d..09b65ee1a8b737 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1249,7 +1249,7 @@ int setup_bdev_super(struct super_block *sb, int sb_flags,
 	blk_mode_t mode = sb_open_mode(sb_flags);
 	struct block_device *bdev;
 
-	bdev = blkdev_get_by_dev(sb->s_dev, mode, sb->s_type, &fs_holder_ops);
+	bdev = blkdev_get_by_dev(sb->s_dev, mode, sb, &fs_holder_ops);
 	if (IS_ERR(bdev)) {
 		if (fc)
 			errorf(fc, "%s: Can't open blockdev", fc->source);
@@ -1262,7 +1262,7 @@ int setup_bdev_super(struct super_block *sb, int sb_flags,
 	 * writable from userspace even for a read-only block device.
 	 */
 	if ((mode & BLK_OPEN_WRITE) && bdev_read_only(bdev)) {
-		blkdev_put(bdev, sb->s_type);
+		blkdev_put(bdev, sb);
 		return -EACCES;
 	}
 
@@ -1278,7 +1278,7 @@ int setup_bdev_super(struct super_block *sb, int sb_flags,
 		mutex_unlock(&bdev->bd_fsfreeze_mutex);
 		if (fc)
 			warnf(fc, "%pg: Can't mount, blockdev is frozen", bdev);
-		blkdev_put(bdev, sb->s_type);
+		blkdev_put(bdev, sb);
 		return -EBUSY;
 	}
 	spin_lock(&sb_lock);
@@ -1418,7 +1418,7 @@ void kill_block_super(struct super_block *sb)
 	if (bdev) {
 		bdev->bd_super = NULL;
 		sync_blockdev(bdev);
-		blkdev_put(bdev, sb->s_type);
+		blkdev_put(bdev, sb);
 	}
 }
 
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
