Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB68838B3A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jan 2024 10:59:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rSDZK-0001uQ-BN;
	Tue, 23 Jan 2024 09:59:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=745eb970d=johannes.thumshirn@wdc.com>)
 id 1rSDZI-0001uK-LX for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 09:59:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c3V485QR15mzzWFdAVRJ2utjiAickSkqCmojnyiDwIM=; b=U0FRJBPSP9TOhwvRHmKy282tez
 8JfBB6S3swabiN3t2VJ9NgiUkW/zQCPzW0Q2no9skrsPHbqXlX+mgTa00qLk89QD+vMSkEqx9LHAr
 1VR0X12qkxGMp4uYqZCNgRdlU/HMwbvOVzUQFg5Go1uBIGuISIIqbFXWzKscTcI6236w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=c3V485QR15mzzWFdAVRJ2utjiAickSkqCmojnyiDwIM=; b=U
 izeTpelROksodKknAxnysw3sgUuTa0QGckghB4ym6Hm8fHKmWvWc3zFsRgjqo+VBwS+iuLNQ/SBpT
 pPZ0Sf/bpPNmvdFkgoaBRsPonYCHe5MGPGbbdSWvG0kz/qdC411ah0gs7dyPt4/ZxdK1NPLGqjmcT
 IJZbfaCdKjz9ovgM=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rSDZE-0000SS-BS for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 09:59:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1706003981; x=1737539981;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=/4h6qYS/eHpSlVim37uPdGcbFkvmnDTQ5JZLyrLcZnE=;
 b=a2KnxUBIjB7ksHnbBP+kZPVNuhrIzzt1vmnGVvPSVGvN2u9WDQhjPkKN
 E4/4G+beiFZWlvdhULV0wtmnR4TDkKAs5ZARfAeR/4u4Ar2nvnuWdu9Kp
 HZV47y73X3C29+cYoX8LvridBdWlD9XTBKhot8ONDu+HCUivsTEPXheB2
 uUh8bA1gBlcjjuO8Tp5ZJyoDGJQCYK7KYxD//jzUAl6BAq4S16SRZe9yg
 785oR+gwC5wKsFJLHGw06VxoN0KUuDYHssB/SN+o7GM5X82T/dUZgPR4W
 2t0MQiiGAlsE3xzO8Eg1HOEV/Seydn5QXu5AMuUpeXVZTwDmef8+zSKWa A==;
X-CSE-ConnectionGUID: aeG5S0HrTLCWvzhjMfN7Mg==
X-CSE-MsgGUID: +LYv0fWkSBuMUpPXjZhmFg==
X-IronPort-AV: E=Sophos;i="6.05,214,1701100800"; 
   d="scan'208";a="7462056"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 23 Jan 2024 17:43:52 +0800
IronPort-SDR: vbSprnZ5hLfca80vS9y6b46m5iWsA2WuYrYKp9DuoNNgp1XvMGHTf3tvpja1TtU2DF8EPuH2Sa
 BXa0XZ9QAxrQ==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jan 2024 00:48:13 -0800
IronPort-SDR: zUnRHHmVsKHmYWHqPESmgsAEmU5gU8xkWm6MN/q4pTyWM+A4c3LciGXWMEKUbx1GLBqQ7hfn4G
 QMsyEBuf/JKg==
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Jan 2024 01:43:47 -0800
Date: Tue, 23 Jan 2024 01:43:41 -0800
Message-Id: <20240123-zonefs_nofs-v1-0-cc0b0308ef25@wdc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE2Kr2UC/x3MMQqAMAxA0atIZgtpKA5eRUTUppqllQZELL27x
 fEN/xdQzsIKY1cg8y0qKTbYvoP9XOPBRnwzEJJDa9G8KXLQJaagxnvLRBsxugFacWUO8vy3aa7
 1AzrU4INdAAAA
To: Damien Le Moal <dlemoal@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, Mike Snitzer <snitzer@kernel.org>, 
 dm-devel@lists.linux.dev, Chris Mason <clm@fb.com>, 
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706003027; l=1540;
 i=johannes.thumshirn@wdc.com; s=20230613; h=from:subject:message-id;
 bh=/4h6qYS/eHpSlVim37uPdGcbFkvmnDTQ5JZLyrLcZnE=;
 b=XWApU1yRY0zet3szE9Y5YwxO0lp/MB+nH+oGhmBdyhChEBIQpYa6r7zw4rgXKerbrVnIXc2mT
 UtgASe05xPWAqN+bStf/4/hcrd6JLPpuUKW556WA7lZY9ZeLtErtKq6
X-Developer-Key: i=johannes.thumshirn@wdc.com; a=ed25519;
 pk=TGmHKs78FdPi+QhrViEvjKIGwReUGCfa+3LEnGoR2KM=
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Fueled by the LSFMM discussion on removing GFP_NOFS initiated
 by Willy, I've looked into the sole GFP_NOFS allocation in zonefs. As it
 turned out, it is only done for zone management commands and can [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.153.141 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rSDZE-0000SS-BS
Subject: [f2fs-dev] [PATCH 0/5] block: remove gfp_mask for blkdev_zone_mgmt()
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
From: Johannes Thumshirn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Cc: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fueled by the LSFMM discussion on removing GFP_NOFS initiated by Willy,
I've looked into the sole GFP_NOFS allocation in zonefs. As it turned out,
it is only done for zone management commands and can be removed.

After digging into more callers of blkdev_zone_mgmt() I came to the
conclusion that the gfp_mask parameter can be removed alltogether.

So this series switches all callers of blkdev_zone_mgmt() to either use
GFP_KERNEL where possible or grab a memalloc_no{fs,io} context.

The final patch in this series is getting rid of the gfp_mask parameter.

Link: https://lore.kernel.org/all/ZZcgXI46AinlcBDP@casper.infradead.org/

---
Johannes Thumshirn (5):
      zonefs: pass GFP_KERNEL to blkdev_zone_mgmt() call
      dm: dm-zoned: pass GFP_KERNEL to blkdev_zone_mgmt
      btrfs: zoned: call blkdev_zone_mgmt in nofs scope
      f2fs: guard blkdev_zone_mgmt with nofs scope
      block: remove gfp_flags from blkdev_zone_mgmt

 block/blk-zoned.c              | 19 ++++++++-----------
 drivers/md/dm-zoned-metadata.c |  2 +-
 drivers/nvme/target/zns.c      |  5 ++---
 fs/btrfs/zoned.c               | 35 +++++++++++++++++++++++++----------
 fs/f2fs/segment.c              | 15 ++++++++++++---
 fs/zonefs/super.c              |  2 +-
 include/linux/blkdev.h         |  2 +-
 7 files changed, 50 insertions(+), 30 deletions(-)
---
base-commit: 7ed2632ec7d72e926b9e8bcc9ad1bb0cd37274bf
change-id: 20240110-zonefs_nofs-dd1e22b2e046

Best regards,
-- 
Johannes Thumshirn <johannes.thumshirn@wdc.com>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
