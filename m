Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD8A304118
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Jan 2021 15:58:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4Pmu-0008LP-6q; Tue, 26 Jan 2021 14:57:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+b7a2078c382f6036dc0e+6365+infradead.org+hch@casper.srs.infradead.org>)
 id 1l4Pms-0008L5-Vq
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 14:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DlGuhvUuF5545bhBTyuoYUED18e0Xo1tptPGH+ZCVWM=; b=GWXHpbhmy1BSLazxFvIhFVjQA0
 ZkbAICxvMBWLKxmaYa55MMLdERg+hIpSSBiqkkfzOWPcc6YrcBzCLWL6pLxyMLNhfIFaY8mfwBaiR
 V/7Lg0EiRatCIHNplfb4RvYiIoipmmLVcdO47VcRuS2DfOWN37zzfZA7YoZ8VWB8OVko=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DlGuhvUuF5545bhBTyuoYUED18e0Xo1tptPGH+ZCVWM=; b=C
 J/3Q98e7RdE0vPq55St/luK2vkUGaDFUchwNO/sq+HuwKe284GDNjeG7L2KXDApeICrV1trIANoIq
 MDo2tvJ1hMaXYGoRqorskeHYN43cZPzzUOP07o5kDaRQdNvdq0tQKthYhORXrxe6nuXshcGM861Uv
 ZP1TqVzHdD0g6cnQ=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4Pmj-006jTx-AX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 14:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=DlGuhvUuF5545bhBTyuoYUED18e0Xo1tptPGH+ZCVWM=; b=jMQTwjqfgxOzhYVUlZs0z9WFMS
 HRM3mdeuPCtX41haFTd6hK9e25Otzz6mCyGNcv34gLl3lwXKlK5lNyLTebUWNNaFab+hdAbStB327
 6X13dSBciQr1C4yXzcvGmt62gd3mz/quTqo9WjsRSWJx4E4YtRztVJUQF2aYf33t7c4ozLh5cmFBq
 jtTnUIVw6VgPNfzXwq64Crdqp9Bei9fIWZOg+evdMuBCYdR8RMjwHbP99COwLm/oF7u4+vzFrU+Tm
 2WUpSisrQMH9uO9aOlv+vEiHmHKQMMIj8qQj2cijQqFQjcvZAiJ5jVKPz8liZXt3v3QT/yndTE765
 OTjGoq6g==;
Received: from [2001:4bb8:191:e347:5918:ac86:61cb:8801] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l4Pi4-005luv-Pc; Tue, 26 Jan 2021 14:53:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 15:52:30 +0100
Message-Id: <20210126145247.1964410-1-hch@lst.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l4Pmj-006jTx-AX
Subject: [f2fs-dev] misc bio allocation cleanups
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
Cc: Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org, dm-devel@redhat.com,
 drbd-dev@lists.linbit.com, Naohiro Aota <naohiro.aota@wdc.com>,
 linux-nilfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 linux-nfs@vger.kernel.org, Coly Li <colyli@suse.de>,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-block@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jens,

this series contains various cleanups for how bios are allocated or
initialized plus related fallout.

Diffstat:
 Documentation/filesystems/f2fs.rst |    1 
 block/bio.c                        |  167 ++++++++++++++++++-------------------
 block/blk-crypto-fallback.c        |    2 
 block/blk-flush.c                  |   17 +--
 drivers/block/drbd/drbd_actlog.c   |    2 
 drivers/block/drbd/drbd_bitmap.c   |    2 
 drivers/block/drbd/drbd_int.h      |    2 
 drivers/block/drbd/drbd_main.c     |   13 --
 drivers/block/drbd/drbd_req.c      |    5 -
 drivers/block/drbd/drbd_req.h      |   12 --
 drivers/block/drbd/drbd_worker.c   |    5 -
 drivers/md/dm-clone-target.c       |   14 ---
 drivers/md/dm-zoned-metadata.c     |    6 -
 drivers/md/md.c                    |   48 +++-------
 drivers/md/md.h                    |    2 
 drivers/md/raid1.c                 |    2 
 drivers/md/raid10.c                |    2 
 drivers/md/raid5-ppl.c             |    2 
 drivers/md/raid5.c                 |  108 +++++++++--------------
 drivers/nvme/target/io-cmd-bdev.c  |    2 
 fs/block_dev.c                     |    2 
 fs/btrfs/volumes.c                 |    2 
 fs/exfat/file.c                    |    2 
 fs/ext4/fast_commit.c              |    4 
 fs/ext4/fsync.c                    |    2 
 fs/ext4/ialloc.c                   |    2 
 fs/ext4/super.c                    |    2 
 fs/f2fs/data.c                     |   28 ------
 fs/f2fs/f2fs.h                     |    2 
 fs/f2fs/segment.c                  |   12 --
 fs/f2fs/super.c                    |    1 
 fs/fat/file.c                      |    2 
 fs/hfsplus/inode.c                 |    2 
 fs/hfsplus/super.c                 |    2 
 fs/jbd2/checkpoint.c               |    2 
 fs/jbd2/commit.c                   |    4 
 fs/jbd2/recovery.c                 |    2 
 fs/libfs.c                         |    2 
 fs/nfs/blocklayout/blocklayout.c   |    5 -
 fs/nilfs2/segbuf.c                 |    4 
 fs/nilfs2/the_nilfs.h              |    2 
 fs/ocfs2/file.c                    |    2 
 fs/reiserfs/file.c                 |    2 
 fs/xfs/xfs_super.c                 |    2 
 fs/zonefs/super.c                  |    4 
 include/linux/bio.h                |    6 -
 include/linux/blkdev.h             |    4 
 include/linux/swap.h               |    1 
 mm/page_io.c                       |   45 ++-------
 mm/swapfile.c                      |   10 --
 50 files changed, 213 insertions(+), 363 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
