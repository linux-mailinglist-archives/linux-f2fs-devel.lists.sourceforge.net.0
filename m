Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8D481615E
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Dec 2023 18:45:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rEvCx-0003a5-CO;
	Sun, 17 Dec 2023 17:45:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+1cffd234e19dbf5c5a3f+7420+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1rEvCu-0003Zz-Ce for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 Dec 2023 17:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KlChkldQeuhwg4sxIRC77ivEjvHivSeAsGBLr02m6Wc=; b=I6+ow8bItpsY+20fR2HbcXga+P
 Drehzb56qhVSdxK7qvSyKG9iKFy5XbC5XVf3r1MKqWDnVjo18r50YZw5mLi9JOKIxg22si5SKNH1n
 aO6ifDXpWlIpesP1YAsYOoWtHX4teoMu+5atoiDx+F1zzLMh8e62LmyiOaSXv1NDR19M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KlChkldQeuhwg4sxIRC77ivEjvHivSeAsGBLr02m6Wc=; b=WLZcY243pv1GcQF8ttb4GoThsF
 IHVVr3ZSgUS02Zyjvifhro2kRH3zCiLz7hqRzta3xk8jfhbUR4WaWKkfUY2oqXO/UGXbVMYjA5t9l
 CMZazxKg049EBSzW+v/is2nah/RsxNJ2mntxEuxjz4z/EMr40B16gJCeChFWuq+n8sIg=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rEvCt-0005bn-OM for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 Dec 2023 17:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=KlChkldQeuhwg4sxIRC77ivEjvHivSeAsGBLr02m6Wc=; b=A8QiNrYJJbfUqc7JdOr6skrvzo
 nm5wo6AewBrtor0R3qDFAUAV9HlX1yOpRqpF0O5BlElQumPtwm7vxXmjcOVeBJfYbYbABo1B+oQEd
 BUIGYmNhA2uRPOEAxQp+oZ9kU0g53+ZZD4dU80h5RiQq7EuhD03SHLGJEnAlotzLzOHh9hi6u0h4p
 55oFWl+69jtZntJHoZsIAaGlgHUE7vDrq1ezeAaJwG56gt8dCyY8kjTWRSbUn8A4PMIoQDkhJI65t
 FVb6UG7Iedu5Hn0UBSDfKl543zXrGYnXEQVm72mkFNmGVDW26HfrpJwbzpG3PUnEyj9eRwNPYRLgh
 Cxe/01WA==;
Received: from [88.128.92.84] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rEuP2-0088Lm-1m; Sun, 17 Dec 2023 16:54:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sun, 17 Dec 2023 17:53:56 +0100
Message-Id: <20231217165359.604246-3-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231217165359.604246-1-hch@lst.de>
References: <20231217165359.604246-1-hch@lst.de>
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
 Content preview: virtblk_revalidate_zones is called unconditionally from
 virtblk_config_changed_work
 from the virtio config_changed callback. virtblk_revalidate_zones is a bit
 odd in that it re-clears the zoned state for host aware or non-zoned devices, 
 which isn't needed unless the zoned mode changed - but a zone mode change
 to a host mana [...] 
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
X-Headers-End: 1rEvCt-0005bn-OM
Subject: [f2fs-dev] [PATCH 2/5] virtio_blk: remove the broken zone
 revalidation support
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

virtblk_revalidate_zones is called unconditionally from
virtblk_config_changed_work from the virtio config_changed callback.

virtblk_revalidate_zones is a bit odd in that it re-clears the zoned
state for host aware or non-zoned devices, which isn't needed unless the
zoned mode changed - but a zone mode change to a host managed model isn't
handled at all, and virtio_blk also doesn't handle any other config
change except for a capacity change is handled (and even if it was
the upper layers above virtio_blk wouldn't handle it very well).

But even the useful case of a size change that would add or remove
zones isn't handled properly as blk_revalidate_disk_zones expects the
device capacity to cover all zones, but the capacity is only updated
after virtblk_revalidate_zones.

As this code appears to be entirely untested and is getting in the way
remove it for now, but it can be readded in a fixed version with
proper test coverage if needed.

Fixes: 95bfec41bd3d ("virtio-blk: add support for zoned block devices")
Fixes: f1ba4e674feb ("virtio-blk: fix to match virtio spec")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/virtio_blk.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index aeead732a24dc9..a28f1687066bb4 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -722,27 +722,6 @@ static int virtblk_report_zones(struct gendisk *disk, sector_t sector,
 	return ret;
 }
 
-static void virtblk_revalidate_zones(struct virtio_blk *vblk)
-{
-	u8 model;
-
-	virtio_cread(vblk->vdev, struct virtio_blk_config,
-		     zoned.model, &model);
-	switch (model) {
-	default:
-		dev_err(&vblk->vdev->dev, "unknown zone model %d\n", model);
-		fallthrough;
-	case VIRTIO_BLK_Z_NONE:
-	case VIRTIO_BLK_Z_HA:
-		disk_set_zoned(vblk->disk, BLK_ZONED_NONE);
-		return;
-	case VIRTIO_BLK_Z_HM:
-		WARN_ON_ONCE(!vblk->zone_sectors);
-		if (!blk_revalidate_disk_zones(vblk->disk, NULL))
-			set_capacity_and_notify(vblk->disk, 0);
-	}
-}
-
 static int virtblk_probe_zoned_device(struct virtio_device *vdev,
 				       struct virtio_blk *vblk,
 				       struct request_queue *q)
@@ -823,10 +802,6 @@ static int virtblk_probe_zoned_device(struct virtio_device *vdev,
  */
 #define virtblk_report_zones       NULL
 
-static inline void virtblk_revalidate_zones(struct virtio_blk *vblk)
-{
-}
-
 static inline int virtblk_probe_zoned_device(struct virtio_device *vdev,
 			struct virtio_blk *vblk, struct request_queue *q)
 {
@@ -982,7 +957,6 @@ static void virtblk_config_changed_work(struct work_struct *work)
 	struct virtio_blk *vblk =
 		container_of(work, struct virtio_blk, config_work);
 
-	virtblk_revalidate_zones(vblk);
 	virtblk_update_capacity(vblk, true);
 }
 
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
