Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C35C72393B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jun 2023 09:40:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6RIu-000501-21;
	Tue, 06 Jun 2023 07:40:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+c7f58ba0a08136e81302+7226+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q6RIs-0004zv-ER for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 07:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SQswGPGJjSOolqgUFSYGX1AabMy5/DP2Tw/s3/r3yqg=; b=meDkazdkNew0Jjx/q+k5hlpMUl
 ARLHhK8bJij3LLeUK1uB0fVXo7hVWucozvyPY+Bz+BHM5B/Zpjysv9+roM7ATWo4mX0Q14gaHvWH2
 /GMf0navRkz4bonDew3edD3maCVgmUr/UU5NVNmCVavQ0BgpJJZ67nIWuOMWB/7ls9iw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SQswGPGJjSOolqgUFSYGX1AabMy5/DP2Tw/s3/r3yqg=; b=T
 3OjiEx3WKvPHygg5uhrJ9FB7ebcB+ImczZbxMpxjm4jrer60QtTqZaDV636D4xALKLkmcr4uNyLid
 zsrFz9Rms7yEDa6kIorkphAA+AcDhsqkGrU+0wHywvCjuyP9yMoTf8LTflQh2z6AKsJ9ev1Ek+Gr8
 HwYXKA+TyZC0w1Sc=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6RIr-00CV2N-W8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 07:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=SQswGPGJjSOolqgUFSYGX1AabMy5/DP2Tw/s3/r3yqg=; b=2MynR8QAmA2gZpPRvkdWYM0ENb
 IArUaR1A7xEHD/0or2gLb5eP/s9nrLYL9L/daXdZs3nYCua+W3GJb+I/B7x5/W4/Rf7mLD7JKCGYT
 H8EqZSkISD07AX4uFHc3zMtkj7yOSXEwTQpEFcvIcE/u2PcA50ARtaouBNJ8AleEKy/cUEx1xWOm0
 ja9Y90mDqAin14gK2EkrCpBotfhdPskWa9VGlp0+BM+PW/cmh7k0XZ9+MuiqC9OOUiiHr+pY3q/eg
 FYNNMUjpJSf4h7hc3O0Bqkg3aJeu+WMHXQq6bjVNh9CMn7ta7E8WrGD5+93ahvV3aiSQigm3VSe+B
 ViJqSx7Q==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q6RIH-000Ya3-0f; Tue, 06 Jun 2023 07:39:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue,  6 Jun 2023 09:39:19 +0200
Message-Id: <20230606073950.225178-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all,
 this series adds a new blk_mode_t for block open flags
 instead of abusing fmode_t. The block open flags work very different from
 the normal use of fmode_t and only share the basic READ/WRITE flags wit [...]
 Content analysis details:   (-2.2 points, 6.0 required)
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q6RIr-00CV2N-W8
Subject: [f2fs-dev] decouple block open flags from fmode_t
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

Hi all,

this series adds a new blk_mode_t for block open flags instead of abusing
fmode_t.  The block open flags work very different from the normal use of
fmode_t and only share the basic READ/WRITE flags with it.  None of the
other normal FMODE_* flags is used, but instead there are three
block-specific ones not used by anyone else, which can now be removed.

Note that I've only CCed maintainers and lists for drivers and file systems
that have non-trivial changes, as otherwise the series would spam literally
everyone in the block and file system world.

Diffstat:
 arch/um/drivers/ubd_kern.c          |   20 ++-----
 arch/xtensa/platforms/iss/simdisk.c |    6 +-
 block/bdev.c                        |   99 ++++++++++++++++++------------------
 block/blk-zoned.c                   |   12 ++--
 block/blk.h                         |   26 ++++++++-
 block/bsg-lib.c                     |    2 
 block/bsg.c                         |    8 +-
 block/disk-events.c                 |   47 +++++++----------
 block/fops.c                        |   54 ++++++++++++-------
 block/genhd.c                       |   13 ++--
 block/ioctl.c                       |   61 +++++++---------------
 drivers/block/amiflop.c             |   20 +++----
 drivers/block/aoe/aoeblk.c          |    8 +-
 drivers/block/ataflop.c             |   43 +++++++--------
 drivers/block/drbd/drbd_main.c      |   13 ++--
 drivers/block/drbd/drbd_nl.c        |   23 +++++---
 drivers/block/floppy.c              |   72 +++++++++++++-------------
 drivers/block/loop.c                |   24 ++++----
 drivers/block/mtip32xx/mtip32xx.c   |    4 -
 drivers/block/nbd.c                 |   12 ++--
 drivers/block/pktcdvd.c             |   36 ++++++-------
 drivers/block/rbd.c                 |    6 +-
 drivers/block/rnbd/rnbd-clt.c       |    8 +-
 drivers/block/rnbd/rnbd-srv-sysfs.c |    3 -
 drivers/block/rnbd/rnbd-srv.c       |   23 ++++----
 drivers/block/rnbd/rnbd-srv.h       |    2 
 drivers/block/sunvdc.c              |    2 
 drivers/block/swim.c                |   24 ++++----
 drivers/block/swim3.c               |   33 +++++-------
 drivers/block/ublk_drv.c            |    4 -
 drivers/block/xen-blkback/xenbus.c  |    4 -
 drivers/block/xen-blkfront.c        |    2 
 drivers/block/z2ram.c               |    8 +-
 drivers/block/zram/zram_drv.c       |   21 +++----
 drivers/cdrom/cdrom.c               |   36 +++----------
 drivers/cdrom/gdrom.c               |   12 ++--
 drivers/md/bcache/bcache.h          |    2 
 drivers/md/bcache/request.c         |    4 -
 drivers/md/bcache/super.c           |   25 ++++-----
 drivers/md/dm-cache-target.c        |   12 ++--
 drivers/md/dm-clone-target.c        |   10 +--
 drivers/md/dm-core.h                |    7 +-
 drivers/md/dm-era-target.c          |    6 +-
 drivers/md/dm-ioctl.c               |   10 +--
 drivers/md/dm-snap.c                |    4 -
 drivers/md/dm-table.c               |   11 ++--
 drivers/md/dm-thin.c                |    9 +--
 drivers/md/dm-verity-fec.c          |    2 
 drivers/md/dm-verity-target.c       |    6 +-
 drivers/md/dm.c                     |   20 +++----
 drivers/md/dm.h                     |    2 
 drivers/md/md.c                     |   50 +++++++++---------
 drivers/mmc/core/block.c            |   12 ++--
 drivers/mtd/devices/block2mtd.c     |    6 +-
 drivers/mtd/mtd_blkdevs.c           |    8 +-
 drivers/mtd/mtdblock.c              |    2 
 drivers/mtd/ubi/block.c             |    9 +--
 drivers/nvme/host/core.c            |    6 +-
 drivers/nvme/host/ioctl.c           |   66 +++++++++++++-----------
 drivers/nvme/host/multipath.c       |    6 +-
 drivers/nvme/host/nvme.h            |    4 -
 drivers/nvme/target/io-cmd-bdev.c   |    4 -
 drivers/s390/block/dasd.c           |   10 +--
 drivers/s390/block/dasd_genhd.c     |    5 +
 drivers/s390/block/dasd_int.h       |    3 -
 drivers/s390/block/dasd_ioctl.c     |    2 
 drivers/s390/block/dcssblk.c        |   11 +---
 drivers/scsi/ch.c                   |    3 -
 drivers/scsi/scsi_bsg.c             |    4 -
 drivers/scsi/scsi_ioctl.c           |   38 ++++++-------
 drivers/scsi/sd.c                   |   39 ++++++--------
 drivers/scsi/sg.c                   |    7 +-
 drivers/scsi/sr.c                   |   22 ++++----
 drivers/scsi/st.c                   |    2 
 drivers/target/target_core_iblock.c |    9 +--
 drivers/target/target_core_pscsi.c  |   10 +--
 fs/btrfs/dev-replace.c              |    6 +-
 fs/btrfs/ioctl.c                    |   12 ++--
 fs/btrfs/super.c                    |   21 ++-----
 fs/btrfs/volumes.c                  |   55 +++++++++-----------
 fs/btrfs/volumes.h                  |   11 +---
 fs/erofs/super.c                    |    7 +-
 fs/ext4/super.c                     |   11 +---
 fs/f2fs/super.c                     |   12 ++--
 fs/jfs/jfs_logmgr.c                 |    6 +-
 fs/nfs/blocklayout/dev.c            |    9 +--
 fs/nilfs2/super.c                   |   12 +---
 fs/ocfs2/cluster/heartbeat.c        |    7 +-
 fs/reiserfs/journal.c               |   19 +++---
 fs/reiserfs/reiserfs.h              |    1 
 fs/super.c                          |   33 ++++--------
 fs/xfs/xfs_super.c                  |   15 ++---
 include/linux/blkdev.h              |   68 +++++++++++-------------
 include/linux/bsg.h                 |    2 
 include/linux/cdrom.h               |   12 ++--
 include/linux/device-mapper.h       |    8 +-
 include/linux/fs.h                  |    8 --
 include/linux/mtd/blktrans.h        |    2 
 include/scsi/scsi_ioctl.h           |    4 -
 kernel/power/hibernate.c            |   12 +---
 kernel/power/power.h                |    2 
 kernel/power/swap.c                 |   28 ++++------
 mm/swapfile.c                       |    7 +-
 103 files changed, 796 insertions(+), 853 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
