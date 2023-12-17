Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDA8816148
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Dec 2023 18:36:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rEv3w-0003yf-FD;
	Sun, 17 Dec 2023 17:36:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+1cffd234e19dbf5c5a3f+7420+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1rEv3v-0003yZ-HL for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 Dec 2023 17:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zthoML/uhpAs1hPvD/fh13swKppKnu7l7FTtACwvAxE=; b=mv7tJYKoXz2Eaun141zlEtd5n5
 gQW0Eafy6PmiG866CIgE2+xOf0h+PHDz8LNP/Z5MpIoEc67BVmZtHh9ZNZfxkw2NxK96CQ+3cw9ab
 NatIbdQX8ICHfimjeypFBNY1AIdlNLPm6wUtzoBmH96XDW9dLIWzOZLAfkJi1FYi+plM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zthoML/uhpAs1hPvD/fh13swKppKnu7l7FTtACwvAxE=; b=I
 ndSH+eCO4Mol18bNCOoJcVnz+VeShvxpn16ehXZBdnCAz8kXg48cK9sIAQKIymXXUxtlfdmLIk9uH
 LqSXD4gSvqMMKFAfdTofKGJV22YDNi0uKWDdy4E33wUr6ez5giSK6kfl1e3p/HpEjFYNyMnY0RMkO
 Wd19tAPi+T1DzWUQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rEv3t-00031S-SV for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 Dec 2023 17:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=zthoML/uhpAs1hPvD/fh13swKppKnu7l7FTtACwvAxE=; b=WLAw68JlEwbNFdIQ2xyIscfsps
 CWgTZVnaIvQlWzz06TQgw+PjcgppWNTQHeaP9heFZI/N1X6bRYNdiDnf2HKguxboWjjhX0XmDtIjK
 Cfq3ixlcQVdCDmt8I6cHcZgfNphEKcI3/sVh25Wwnsz+IwF9FU+0k1hDj6q3C9Vdeme9/K9trDDqA
 V71hDtLh1lZVVWiDsNBiBlb8sihMmf06SvtbxGjuggJOMDbBBTxgpx44hH1dWWFQwYuZk0pKkO4pD
 z9I6Ggwwd4Bgt8+xX5UuHNQ6CBWHRRa61Hf3XU+/hpP1RR7WYzVz20j0J0IOo1IjoDdlSGlIKer06
 t4lIRgSQ==;
Received: from [88.128.92.84] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rEuOw-0088L9-1x; Sun, 17 Dec 2023 16:54:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sun, 17 Dec 2023 17:53:54 +0100
Message-Id: <20231217165359.604246-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all, hen zones were first added the SCSI and ATA specs,
 two different models were supported (in addition to the drive managed one
 that is invisible to the host): - host managed where non-conventional zones
 there is strict requirement to write at the write pointer, or else an error
 is returned - host aware where a write point is maintained if writes always
 hap [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rEv3t-00031S-SV
Subject: [f2fs-dev] remove support for the host aware zoned model
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
Cc: dm-devel@lists.linux.dev, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 virtualization@lists.linux.dev, Damien Le Moal <dlemoal@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi all,

hen zones were first added the SCSI and ATA specs, two different
models were supported (in addition to the drive managed one that
is invisible to the host):

 - host managed where non-conventional zones there is strict requirement
   to write at the write pointer, or else an error is returned
 - host aware where a write point is maintained if writes always happen
   at it, otherwise it is left in an under-defined state and the
   sequential write preferred zones behave like conventional zones
   (probably very badly performing ones, though)

Not surprisingly this lukewarm model didn't prove to be very useful and
was finally removed from the ZBC and SBC specs (NVMe never implemented
it).  Due to to the easily disappearing write pointer host software
could never rely on the write pointer to actually be useful for say
recovery.

Fortunately only a few HDD prototypes shipped using this model which
never made it to mass production.  Drop the support before it is too
late.  Note that any such host aware prototype HDD can still be used
with Linux as we'll now treat it as a conventional HDD.

Diffstat:
 block/blk-settings.c           |   83 +++++------------------------------------
 block/blk-sysfs.c              |    9 ----
 block/blk-zoned.c              |    3 -
 block/blk.h                    |    2 
 block/partitions/core.c        |   12 -----
 drivers/block/null_blk/zoned.c |    2 
 drivers/block/ublk_drv.c       |    2 
 drivers/block/virtio_blk.c     |   78 +++++++++++---------------------------
 drivers/md/dm-kcopyd.c         |    2 
 drivers/md/dm-table.c          |   45 +++++++++-------------
 drivers/md/dm-zoned-metadata.c |    7 +--
 drivers/md/dm-zoned-target.c   |    4 -
 drivers/nvme/host/zns.c        |    2 
 drivers/scsi/scsi_debug.c      |   27 ++++++-------
 drivers/scsi/sd.c              |   50 +++++++++++-------------
 drivers/scsi/sd_zbc.c          |   16 -------
 fs/btrfs/zoned.c               |   23 +----------
 fs/btrfs/zoned.h               |    2 
 fs/f2fs/data.c                 |    2 
 fs/f2fs/super.c                |   17 +++-----
 include/linux/blkdev.h         |   38 +-----------------
 21 files changed, 124 insertions(+), 302 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
