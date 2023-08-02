Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F64C76D274
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Aug 2023 17:42:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRDzC-0004CY-Vy;
	Wed, 02 Aug 2023 15:42:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e55ed01a16a80b75ffb8+7283+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1qRDz9-0004CK-Ez for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t+hutzNu+OLKs7hwR5oQScZRP7h/WIsttBs8nagY2hw=; b=mpFvAZUrp9iGPbJKbISsKhXlJ3
 4oFsveLDgwRQxp8fq2wliss1CeVw5pP87GBJOeyPaBcEjZOZR4VN93Wh392H2pg2Sh8BXX27DWku6
 ZgKLGRWnZeWYC5+/Mk/6lRlLobBXeFID2e6iyWqPCQ3FLjVVywT0JZV7ihi3rZjxi638=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t+hutzNu+OLKs7hwR5oQScZRP7h/WIsttBs8nagY2hw=; b=JSNKS0rzQj9oKhqQtSfOjZEBAi
 aQPqAvB6X4JytxkDDV2FLKFAp3wEOVhUrUGkGAahV/2Hh7BxEhZAvbfK0fY7YH5aloj0plc0nNDER
 n/zqHO7hKJCG5g8rCME3KWcmjqvi7NpoWZ83pQJOXLyRI6JwXjdcSOlk/Os7yWbis4Bw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRDz6-0004SZ-3q for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=t+hutzNu+OLKs7hwR5oQScZRP7h/WIsttBs8nagY2hw=; b=MfqT8apVrXwKetoTs/uxlt7j0i
 F/hdDE9Szgwzy89HXkA2LaUSRquS53mI7cSS5sNi2T+7nVXkXcwAUpiTMNP2N9BUQzVtxjNbyk/V+
 qCBQeB2jWHyLGb9su722CpdyYmQflH0nge+RxWa/9QyBGSzuoZc82mvpQI/HsRPkkYBzgHu8k5itH
 I7+ZnGg1fmJX0esEcvXm687uZ0D6tg3KVz8hVG+2M/YO7ONoljrafnhwMRZz+5DIsDtvInnEt0dKc
 uhlmNE+HbPUosHqoiBEc789L7N+kHRFooos+y6ZmJd4JNk/BCKWXPcJIKPM+Rgb0VWyHQRMGW4EdW
 SAC0HevA==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qRDyt-005GFa-13; Wed, 02 Aug 2023 15:41:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Date: Wed,  2 Aug 2023 17:41:23 +0200
Message-Id: <20230802154131.2221419-5-hch@lst.de>
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
 Content preview:  Currently btrfs_mount_root opens the block devices before
 committing to allocating a super block. That creates problems for restricting
 the number of writers to a device, and also leads to a unusual a [...] 
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
X-Headers-End: 1qRDz6-0004SZ-3q
Subject: [f2fs-dev] [PATCH 04/12] btrfs: open block devices after superblock
 creation
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

Currently btrfs_mount_root opens the block devices before committing to
allocating a super block. That creates problems for restricting the
number of writers to a device, and also leads to a unusual and not very
helpful holder (the fs_type).

Reorganize the code to first look whether the superblock for a
particular fsid does already exist and open the block devices only if it
doesn't, mirror the recent changes to the VFS mount helpers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/btrfs/super.c   | 51 ++++++++++++++++++++++------------------------
 fs/btrfs/volumes.c |  4 ++--
 2 files changed, 26 insertions(+), 29 deletions(-)

diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index b318bddefd5236..5980b5dcc6b163 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -1434,10 +1434,8 @@ static struct dentry *mount_subvol(const char *subvol_name, u64 subvol_objectid,
 static struct dentry *btrfs_mount_root(struct file_system_type *fs_type,
 		int flags, const char *device_name, void *data)
 {
-	struct block_device *bdev = NULL;
 	struct super_block *s;
 	struct btrfs_device *device = NULL;
-	struct btrfs_fs_devices *fs_devices = NULL;
 	struct btrfs_fs_info *fs_info = NULL;
 	void *new_sec_opts = NULL;
 	int error = 0;
@@ -1483,35 +1481,36 @@ static struct dentry *btrfs_mount_root(struct file_system_type *fs_type,
 		error = PTR_ERR(device);
 		goto error_fs_info;
 	}
-
-	fs_devices = device->fs_devices;
-	fs_info->fs_devices = fs_devices;
-
-	error = btrfs_open_devices(fs_devices, sb_open_mode(flags), fs_type);
+	fs_info->fs_devices = device->fs_devices;
 	mutex_unlock(&uuid_mutex);
-	if (error)
-		goto error_fs_info;
-
-	if (!(flags & SB_RDONLY) && fs_devices->rw_devices == 0) {
-		error = -EACCES;
-		goto error_close_devices;
-	}
 
-	bdev = fs_devices->latest_dev->bdev;
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
-		snprintf(s->s_id, sizeof(s->s_id), "%pg", bdev);
+		struct btrfs_fs_devices *fs_devices = fs_info->fs_devices;
+
+		error = btrfs_open_devices(fs_devices, sb_open_mode(flags),
+					   fs_type);
+		if (error)
+			goto out_deactivate;
+
+		if (!(flags & SB_RDONLY) && fs_devices->rw_devices == 0) {
+			error = -EACCES;
+			btrfs_close_devices(fs_info->fs_devices);
+			goto out_deactivate;
+		}
+
+		snprintf(s->s_id, sizeof(s->s_id), "%pg",
+			 fs_devices->latest_dev->bdev);
 		shrinker_debugfs_rename(&s->s_shrink, "sb-%s:%s", fs_type->name,
 					s->s_id);
 		btrfs_sb(s)->bdev_holder = fs_type;
@@ -1519,21 +1518,19 @@ static struct dentry *btrfs_mount_root(struct file_system_type *fs_type,
 	}
 	if (!error)
 		error = security_sb_set_mnt_opts(s, new_sec_opts, 0, NULL);
+	if (error)
+		goto out_deactivate;
 	security_free_mnt_opts(&new_sec_opts);
-	if (error) {
-		deactivate_locked_super(s);
-		return ERR_PTR(error);
-	}
-
 	return dget(s->s_root);
 
-error_close_devices:
-	btrfs_close_devices(fs_devices);
-error_fs_info:
-	btrfs_free_fs_info(fs_info);
+out_deactivate:
+	deactivate_locked_super(s);
 error_sec_opts:
 	security_free_mnt_opts(&new_sec_opts);
 	return ERR_PTR(error);
+error_fs_info:
+	btrfs_free_fs_info(fs_info);
+	goto error_sec_opts;
 }
 
 /*
diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 8246578c70f55b..88e9daae5e74ed 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -1269,7 +1269,6 @@ int btrfs_open_devices(struct btrfs_fs_devices *fs_devices,
 {
 	int ret;
 
-	lockdep_assert_held(&uuid_mutex);
 	/*
 	 * The device_list_mutex cannot be taken here in case opening the
 	 * underlying device takes further locks like open_mutex.
@@ -1277,7 +1276,7 @@ int btrfs_open_devices(struct btrfs_fs_devices *fs_devices,
 	 * We also don't need the lock here as this is called during mount and
 	 * exclusion is provided by uuid_mutex
 	 */
-
+	mutex_lock(&uuid_mutex);
 	if (fs_devices->opened) {
 		fs_devices->opened++;
 		ret = 0;
@@ -1285,6 +1284,7 @@ int btrfs_open_devices(struct btrfs_fs_devices *fs_devices,
 		list_sort(NULL, &fs_devices->devices, devid_cmp);
 		ret = open_fs_devices(fs_devices, flags, holder);
 	}
+	mutex_unlock(&uuid_mutex);
 
 	return ret;
 }
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
