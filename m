Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5D34F5582
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Apr 2022 08:06:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nbyoQ-0001PV-Vf; Wed, 06 Apr 2022 06:06:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+4210fbe0094d03a681f9+6800+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nbyoP-0001P1-NO; Wed, 06 Apr 2022 06:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TxXl3MdplxU9MCO/Q7D4FJYRsok6DDTDVaSg962eOWw=; b=FZDwTjlYZ5R7CK5ssc8y3eCUvB
 mDpSBVgwXz1fNfVCwAR5KPGgw2hjNdPFMF4bEScvgYGr0qSa4YWz8QQ+UZyVESJ1qqXpfytSc+mqu
 lUx0J416S2/9gKqesq/G8S4Y/7klUKVtqK0DmfFqyTAol7awyC5xoaV/fO1/+GMGLu7E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TxXl3MdplxU9MCO/Q7D4FJYRsok6DDTDVaSg962eOWw=; b=feIJpQeLM7lO3a7Haj8J4KmTyc
 qjoeUVQwuOrvolSr1j0bovLCyUT7UlNzxSeowUu59p0bxfgGQWv/LOlOFFeluBpoRsfmTFzQps+cX
 RunbvzZCNc4ImMeAtLAoPk/3xa6DqqZhSBamtBT+QFy/d80Fi0MuB33+UUXbNxE7/498=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nbyoO-0075CB-6R; Wed, 06 Apr 2022 06:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=TxXl3MdplxU9MCO/Q7D4FJYRsok6DDTDVaSg962eOWw=; b=rucC9iJZF0nT1xLRSKT9tqQoP5
 nL0SBYR/iPNSHB6wdcFxgaOg4ge9C2M4FP2p1JxUqmGG9zNBcpvn8l2ImaqSWUruwic5SBL+1Ka0A
 N9OC/cngiat+LW2SmmgQgik6umVCvLvTWe7LVYau+JKoIVcB5LAd/jZAV15/t6fN+UTCCe2AFXibt
 E1V1T10hMp3lTxlmDK2XsJoN/x/84A5CsbNWzJR1vr4eEH4n9FywvazpXPuwcYDJ3oSJzJmHtYcSR
 fBAUwkO6DmJcsI89V/f7f2YpyrUwGe49T4osq7oE4lAOjncY7dpUANpsFS6qbMzskbxkKi/9ab/Dz
 RphmF5Bw==;
Received: from 213-225-3-188.nat.highway.a1.net ([213.225.3.188]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbyo9-003vQV-AV; Wed, 06 Apr 2022 06:06:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 08:05:05 +0200
Message-Id: <20220406060516.409838-17-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406060516.409838-1-hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
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
 Content preview:  The bdev version does the right thing for partitions, so use
 that. Fixes: 9104d31a759f ("drbd: introduce WRITE_SAME support")
 Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- drivers/block/drbd/drbd_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1nbyoO-0075CB-6R
Subject: [f2fs-dev] [PATCH 16/27] drbd: use bdev_alignment_offset instead of
 queue_alignment_offset
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
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The bdev version does the right thing for partitions, so use that.

Fixes: 9104d31a759f ("drbd: introduce WRITE_SAME support")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index d20d84ee7a88e..9d43aadde19ad 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -939,7 +939,7 @@ int drbd_send_sizes(struct drbd_peer_device *peer_device, int trigger_reply, enu
 		p->qlim->logical_block_size =
 			cpu_to_be32(bdev_logical_block_size(bdev));
 		p->qlim->alignment_offset =
-			cpu_to_be32(queue_alignment_offset(q));
+			cpu_to_be32(bdev_alignment_offset(bdev));
 		p->qlim->io_min = cpu_to_be32(bdev_io_min(bdev));
 		p->qlim->io_opt = cpu_to_be32(bdev_io_opt(bdev));
 		p->qlim->discard_enabled = blk_queue_discard(q);
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
