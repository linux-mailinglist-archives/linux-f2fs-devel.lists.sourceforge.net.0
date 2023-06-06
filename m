Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DB0723989
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jun 2023 09:41:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6RJq-0001R1-Vg;
	Tue, 06 Jun 2023 07:41:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+c7f58ba0a08136e81302+7226+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q6RJh-0001QE-Ek for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 07:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R/taWYn/VrvQVP7vJekvmlkcZ3skKwwlLMp5HGMR5SQ=; b=C72aw/MD6OKbJiEu6YWGiUc5IP
 JA71WRD4RG6RY83LbVhmYZRFTgyrhBjmj9pYCf3sFR4CC+f8k3KrN5oMtE2l1rQMbEU9ss+mHVRo+
 SnbEiTlYFM+a3N5j1wNtbdLRLVBkYvZ8doD+ITTu0yWbj9QSnoSFp6/dEHl/Fy+m8xJ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R/taWYn/VrvQVP7vJekvmlkcZ3skKwwlLMp5HGMR5SQ=; b=RytEBFI/+YGYD9Lo0s0j4L5K32
 3VRbTPWSt1LReAyJdSXd2xZWaE0x6T1gEsykTIItlgXsu+9e2qs+FnZyU2nDq7rdW1kAdZliPIcCQ
 a9U7LYNbFh8E3Tv2TXrH8ej4tdbbkGNIroILngkt7wNhMaR2HvsZit+1rCHO4xqB1quU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6RJg-00CV99-JV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 07:41:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=R/taWYn/VrvQVP7vJekvmlkcZ3skKwwlLMp5HGMR5SQ=; b=zg6tGoNyOaOlC2ng1tcChxTDEU
 LdAZ4j1dxKst+JUHQ7DfSAnPcWCIcboHQ0f+ymC6ACmj4ou4JBddjNg/SNyZd8k6IZzymPXRmHYkc
 pJv2J67DSIdPO9e3djSugFbPGi4YBMT7AyNMl/pwqstPo/nsGaKJVRejuqbjtppr1BlfDcK3sQzUd
 yeJMpsetPbMhB1CbT2g+jKQ6Qcga2qnvsXabnR7Lo6V4uWhybFuvVpwBsQX0aZX6C7Xiys/5yYwyz
 PJx+kGGfEsHhO3Tk20F7UdXeu120UGnUS2YrhImUjFIHlVJp9Ya5Xlta4wlVLfHhIt50MyGbWuODg
 vQRWVfQg==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q6RJB-000ZUg-1x; Tue, 06 Jun 2023 07:40:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue,  6 Jun 2023 09:39:36 +0200
Message-Id: <20230606073950.225178-18-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230606073950.225178-1-hch@lst.de>
References: <20230606073950.225178-1-hch@lst.de>
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
 Content preview: Add a helper to return the open flags for blkdev_get_by* for
 passed in super block flags instead of open coding the logic in many places.
 Signed-off-by: Christoph Hellwig <hch@lst.de> --- fs/btrfs/super.c | 5 +----
 fs/nilfs2/super.c | 7 ++----- fs/super.c | 15 ++++ include/linux/blkdev.h
 | 7 +++++++ 4 files changed, 14 insert [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q6RJg-00CV99-JV
Subject: [f2fs-dev] [PATCH 17/31] block: add a sb_open_mode helper
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-nvme@lists.infradead.org,
 Phillip Potter <phil@philpotter.co.uk>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jack Wang <jinpu.wang@ionos.com>, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Christian Brauner <brauner@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add a helper to return the open flags for blkdev_get_by* for passed in
super block flags instead of open coding the logic in many places.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/btrfs/super.c       |  5 +----
 fs/nilfs2/super.c      |  7 ++-----
 fs/super.c             | 15 ++++-----------
 include/linux/blkdev.h |  7 +++++++
 4 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index 1a2ee9407f5414..fd02b92e39106a 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -1440,12 +1440,9 @@ static struct dentry *btrfs_mount_root(struct file_system_type *fs_type,
 	struct btrfs_fs_devices *fs_devices = NULL;
 	struct btrfs_fs_info *fs_info = NULL;
 	void *new_sec_opts = NULL;
-	fmode_t mode = FMODE_READ;
+	fmode_t mode = sb_open_mode(flags);
 	int error = 0;
 
-	if (!(flags & SB_RDONLY))
-		mode |= FMODE_WRITE;
-
 	if (data) {
 		error = security_sb_eat_lsm_opts(data, &new_sec_opts);
 		if (error)
diff --git a/fs/nilfs2/super.c b/fs/nilfs2/super.c
index 61d5e79a5e81df..a41fd84d4e28ab 100644
--- a/fs/nilfs2/super.c
+++ b/fs/nilfs2/super.c
@@ -1278,14 +1278,11 @@ nilfs_mount(struct file_system_type *fs_type, int flags,
 {
 	struct nilfs_super_data sd;
 	struct super_block *s;
-	fmode_t mode = FMODE_READ;
 	struct dentry *root_dentry;
 	int err, s_new = false;
 
-	if (!(flags & SB_RDONLY))
-		mode |= FMODE_WRITE;
-
-	sd.bdev = blkdev_get_by_path(dev_name, mode, fs_type, NULL);
+	sd.bdev = blkdev_get_by_path(dev_name, sb_open_mode(flags), fs_type,
+				     NULL);
 	if (IS_ERR(sd.bdev))
 		return ERR_CAST(sd.bdev);
 
diff --git a/fs/super.c b/fs/super.c
index 8563794a8bc462..dc7f328398339d 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1255,17 +1255,13 @@ int get_tree_bdev(struct fs_context *fc,
 {
 	struct block_device *bdev;
 	struct super_block *s;
-	fmode_t mode = FMODE_READ;
 	int error = 0;
 
-	if (!(fc->sb_flags & SB_RDONLY))
-		mode |= FMODE_WRITE;
-
 	if (!fc->source)
 		return invalf(fc, "No source specified");
 
-	bdev = blkdev_get_by_path(fc->source, mode, fc->fs_type,
-				  &fs_holder_ops);
+	bdev = blkdev_get_by_path(fc->source, sb_open_mode(fc->sb_flags),
+				  fc->fs_type, &fs_holder_ops);
 	if (IS_ERR(bdev)) {
 		errorf(fc, "%s: Can't open blockdev", fc->source);
 		return PTR_ERR(bdev);
@@ -1344,13 +1340,10 @@ struct dentry *mount_bdev(struct file_system_type *fs_type,
 {
 	struct block_device *bdev;
 	struct super_block *s;
-	fmode_t mode = FMODE_READ;
 	int error = 0;
 
-	if (!(flags & SB_RDONLY))
-		mode |= FMODE_WRITE;
-
-	bdev = blkdev_get_by_path(dev_name, mode, fs_type, &fs_holder_ops);
+	bdev = blkdev_get_by_path(dev_name, sb_open_mode(flags), fs_type,
+				  &fs_holder_ops);
 	if (IS_ERR(bdev))
 		return ERR_CAST(bdev);
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index d5b99796f12c11..97803603902076 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1473,6 +1473,13 @@ struct blk_holder_ops {
 	void (*mark_dead)(struct block_device *bdev);
 };
 
+/*
+ * Return the correct open flags for blkdev_get_by_* for super block flags
+ * as stored in sb->s_flags.
+ */
+#define sb_open_mode(flags) \
+	(FMODE_READ | (((flags) & SB_RDONLY) ? 0 : FMODE_WRITE))
+
 struct block_device *blkdev_get_by_dev(dev_t dev, fmode_t mode, void *holder,
 		const struct blk_holder_ops *hops);
 struct block_device *blkdev_get_by_path(const char *path, fmode_t mode,
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
