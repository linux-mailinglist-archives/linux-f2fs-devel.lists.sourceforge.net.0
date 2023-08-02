Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B61776D269
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Aug 2023 17:42:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRDzB-0002J3-Ve;
	Wed, 02 Aug 2023 15:42:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e55ed01a16a80b75ffb8+7283+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1qRDz6-0002IX-Iw for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:41:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XnpsdZtpyIJaScQ5NhvJitYDj8RzkQAdmUbC7tO240g=; b=irV2aZD382LHa7rQ8ZoYOPkv3G
 XW0XoWFkdPRA2yIXgjMEuo+LnF6sfYaITD1In8qnyIX0fHoR/OZ1WUeACl+4DndbMTe+1Zi9Ph2iv
 5yC/8wGvQUljXGje455SRgdAyHu3D2tpoCq09jK6Har+v5EfKgVOphoWz87UtKyIzBiU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XnpsdZtpyIJaScQ5NhvJitYDj8RzkQAdmUbC7tO240g=; b=BamDaB7aK8qJ3tZrIaZ6NwVXQ6
 nfeY0oKjb8uCD0H+WCQw8mlnzM1XUdx51oMxzKOBmdM+p7v2hoIod1cutcrtNfXyH5C97diHUKtQX
 vCupNF8unzn5tC32JmQBokviP9Dw1gJ7ugN+QTpjWg8HINjERAGMjTDS40moMzWDQCGs=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRDz1-00ArNO-4Z for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:41:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=XnpsdZtpyIJaScQ5NhvJitYDj8RzkQAdmUbC7tO240g=; b=moDSih/fwZ/ce0Ve1LXdFc0m8L
 iSvuVeExi91q1m3s2Iou36pDkNYIkeUEUD2rJAGrBOpXtvAFCX9sxuMGF3gzFuSkPGBwBV/cburHF
 E75407Qm9yEWNVapmncdD+w/8lxmK7gukVYRR/DY9xsBMrZcd+AJJ2QyNw9LxSMnYXuqAiQ/q+F1f
 9DM2cn7JLLYY+gl4CqGTevvJB1O9CIjNJAbIJ4pNo9eV0ruEai++QSPcY+gYL7weOo7vwc0o7B5c+
 Yn6vpPxgtUlcTvjn6HiHjqPK2RW7keOHHYnX5/iBs/MfeMw9E6cywXBAMgQZbRawpS5kmTrhkIeyU
 M/w93iLw==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qRDyn-005GEZ-2D; Wed, 02 Aug 2023 15:41:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Date: Wed,  2 Aug 2023 17:41:21 +0200
Message-Id: <20230802154131.2221419-3-hch@lst.de>
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
 Content preview: Use the generic setup_bdev_super helper to open the main
 block
 device and do various bits of superblock setup instead of duplicating the
 logic. This includes moving to the new scheme implemented in co [...] 
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
X-Headers-End: 1qRDz1-00ArNO-4Z
Subject: [f2fs-dev] [PATCH 02/12] nilfs2: use setup_bdev_super to
 de-duplicate the mount code
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

Use the generic setup_bdev_super helper to open the main block device
and do various bits of superblock setup instead of duplicating the
logic.  This includes moving to the new scheme implemented in common
code that only opens the block device after the superblock has allocated.

It does not yet convert nilfs2 to the new mount API, but doing so will
become a bit simpler after this first step.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/nilfs2/super.c | 81 ++++++++++++++++++-----------------------------
 1 file changed, 30 insertions(+), 51 deletions(-)

diff --git a/fs/nilfs2/super.c b/fs/nilfs2/super.c
index 0ef8c71bde8e5f..a5d1fa4e7552f6 100644
--- a/fs/nilfs2/super.c
+++ b/fs/nilfs2/super.c
@@ -35,6 +35,7 @@
 #include <linux/writeback.h>
 #include <linux/seq_file.h>
 #include <linux/mount.h>
+#include <linux/fs_context.h>
 #include "nilfs.h"
 #include "export.h"
 #include "mdt.h"
@@ -1216,7 +1217,6 @@ static int nilfs_remount(struct super_block *sb, int *flags, char *data)
 }
 
 struct nilfs_super_data {
-	struct block_device *bdev;
 	__u64 cno;
 	int flags;
 };
@@ -1283,64 +1283,49 @@ static int nilfs_identify(char *data, struct nilfs_super_data *sd)
 
 static int nilfs_set_bdev_super(struct super_block *s, void *data)
 {
-	s->s_bdev = data;
-	s->s_dev = s->s_bdev->bd_dev;
+	s->s_dev = *(dev_t *)data;
 	return 0;
 }
 
 static int nilfs_test_bdev_super(struct super_block *s, void *data)
 {
-	return (void *)s->s_bdev == data;
+	return !(s->s_iflags & SB_I_RETIRED) && s->s_dev == *(dev_t *)data;
 }
 
 static struct dentry *
 nilfs_mount(struct file_system_type *fs_type, int flags,
 	     const char *dev_name, void *data)
 {
-	struct nilfs_super_data sd;
+	struct nilfs_super_data sd = { .flags = flags };
 	struct super_block *s;
-	struct dentry *root_dentry;
-	int err, s_new = false;
+	dev_t dev;
+	int err;
 
-	sd.bdev = blkdev_get_by_path(dev_name, sb_open_mode(flags), fs_type,
-				     NULL);
-	if (IS_ERR(sd.bdev))
-		return ERR_CAST(sd.bdev);
+	if (nilfs_identify(data, &sd))
+		return ERR_PTR(-EINVAL);
 
-	sd.cno = 0;
-	sd.flags = flags;
-	if (nilfs_identify((char *)data, &sd)) {
-		err = -EINVAL;
-		goto failed;
-	}
+	err = lookup_bdev(dev_name, &dev);
+	if (err)
+		return ERR_PTR(err);
 
-	/*
-	 * once the super is inserted into the list by sget, s_umount
-	 * will protect the lockfs code from trying to start a snapshot
-	 * while we are mounting
-	 */
-	mutex_lock(&sd.bdev->bd_fsfreeze_mutex);
-	if (sd.bdev->bd_fsfreeze_count > 0) {
-		mutex_unlock(&sd.bdev->bd_fsfreeze_mutex);
-		err = -EBUSY;
-		goto failed;
-	}
 	s = sget(fs_type, nilfs_test_bdev_super, nilfs_set_bdev_super, flags,
-		 sd.bdev);
-	mutex_unlock(&sd.bdev->bd_fsfreeze_mutex);
-	if (IS_ERR(s)) {
-		err = PTR_ERR(s);
-		goto failed;
-	}
+		 &dev);
+	if (IS_ERR(s))
+		return ERR_CAST(s);
 
 	if (!s->s_root) {
-		s_new = true;
-
-		/* New superblock instance created */
-		snprintf(s->s_id, sizeof(s->s_id), "%pg", sd.bdev);
-		sb_set_blocksize(s, block_size(sd.bdev));
-
-		err = nilfs_fill_super(s, data, flags & SB_SILENT ? 1 : 0);
+		/*
+		 * We drop s_umount here because we need to open the bdev and
+		 * bdev->open_mutex ranks above s_umount (blkdev_put() ->
+		 * __invalidate_device()). It is safe because we have active sb
+		 * reference and SB_BORN is not set yet.
+		 */
+		up_write(&s->s_umount);
+		err = setup_bdev_super(s, flags, NULL);
+		down_write(&s->s_umount);
+		if (!err)
+			err = nilfs_fill_super(s, data,
+					       flags & SB_SILENT ? 1 : 0);
 		if (err)
 			goto failed_super;
 
@@ -1366,24 +1351,18 @@ nilfs_mount(struct file_system_type *fs_type, int flags,
 	}
 
 	if (sd.cno) {
+		struct dentry *root_dentry;
+
 		err = nilfs_attach_snapshot(s, sd.cno, &root_dentry);
 		if (err)
 			goto failed_super;
-	} else {
-		root_dentry = dget(s->s_root);
+		return root_dentry;
 	}
 
-	if (!s_new)
-		blkdev_put(sd.bdev, fs_type);
-
-	return root_dentry;
+	return dget(s->s_root);
 
  failed_super:
 	deactivate_locked_super(s);
-
- failed:
-	if (!s_new)
-		blkdev_put(sd.bdev, fs_type);
 	return ERR_PTR(err);
 }
 
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
