Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9659A8160D1
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Dec 2023 18:23:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rEuro-0001iO-R9;
	Sun, 17 Dec 2023 17:23:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+1cffd234e19dbf5c5a3f+7420+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1rEurm-0001iF-3a for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 Dec 2023 17:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=enCDnmquPxgkKwyC2qR+XvLDdfSg3i0fs7qLsP5yxNo=; b=E1Mn7XEZ5WW1bNN8SV8wKIYC8l
 y1PNNLDhO3M8G5I2vIEi2STL0Mlt300/gRN6vUrr3tHjeSHmK9XNIT3jIL4F2BwWhafgBxOOQYnIO
 VQ5pvS/amYZwBg9Uj5mLjMOYCXXnR8qaeJp692L8FkA0FNWN8NdBKkcY7dvIIUaytf3w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=enCDnmquPxgkKwyC2qR+XvLDdfSg3i0fs7qLsP5yxNo=; b=J5jH0zjNYaFPJwXDG5I6qH/Mgw
 zycvWUN+nIu6oI6quipNkQn/qgI6wxRJvMCrYfBpZihLwO7tvVFV1CO8Hy8R7WbpVf64M/jclLtO1
 pVW4FVK3hlMkWd79eiRZ5NuyBkU6flgKhVISiJXV32uvewUBV7Bmr63ncxGsgtB08Yb8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rEurk-0007vu-Ky for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 Dec 2023 17:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=enCDnmquPxgkKwyC2qR+XvLDdfSg3i0fs7qLsP5yxNo=; b=FUbbpnZXpZXYkogFygGqF1CsxS
 3q0u0AVgQRMNtArBU8J1RTa8Clyr56ma9xu9AFpzqJ3BeVlkU51f5V36bFr4h2qEBS0xYIuCBQr6q
 a0pLswR6pP7xGDEP9ezgXNYTsNUAzluP5cnFcXZB2YG4c9X7CEHhgjvk6f+Z71cUG4Adpwn4pOfpq
 SQXhD0/QUDfaxd15cALzv4KRsTDHHHhmaO5kmK04P/g7wTzP8wjksPRC6rPwTzoht7Q8NZLVDOpY5
 oMSHLyR27nAxUua10tl/v37Y8KyrUiPzs6LqQJeRl15W0RAu4YCpQkgE+Pr1+aElgXgihdYnuTrkH
 kdufIV4Q==;
Received: from [88.128.92.84] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rEuOz-0088LO-2C; Sun, 17 Dec 2023 16:54:06 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sun, 17 Dec 2023 17:53:55 +0100
Message-Id: <20231217165359.604246-2-hch@lst.de>
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
 Content preview: Move reading and checking the zoned model from
 virtblk_probe_zoned_device
 into the caller, leaving only the code to perform the actual setup for host
 managed zoned devices in virtblk_probe_zoned_devic [...] 
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
X-Headers-End: 1rEurk-0007vu-Ky
Subject: [f2fs-dev] [PATCH 1/5] virtio_blk: cleanup zoned device probing
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

Move reading and checking the zoned model from virtblk_probe_zoned_device
into the caller, leaving only the code to perform the actual setup for
host managed zoned devices in virtblk_probe_zoned_device.

This allows to share the model reading and sharing between builds with
and without CONFIG_BLK_DEV_ZONED, and improve it for the
!CONFIG_BLK_DEV_ZONED case.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/virtio_blk.c | 50 +++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index d53d6aa8ee69a4..aeead732a24dc9 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -748,22 +748,6 @@ static int virtblk_probe_zoned_device(struct virtio_device *vdev,
 				       struct request_queue *q)
 {
 	u32 v, wg;
-	u8 model;
-
-	virtio_cread(vdev, struct virtio_blk_config,
-		     zoned.model, &model);
-
-	switch (model) {
-	case VIRTIO_BLK_Z_NONE:
-	case VIRTIO_BLK_Z_HA:
-		/* Present the host-aware device as non-zoned */
-		return 0;
-	case VIRTIO_BLK_Z_HM:
-		break;
-	default:
-		dev_err(&vdev->dev, "unsupported zone model %d\n", model);
-		return -EINVAL;
-	}
 
 	dev_dbg(&vdev->dev, "probing host-managed zoned device\n");
 
@@ -846,16 +830,9 @@ static inline void virtblk_revalidate_zones(struct virtio_blk *vblk)
 static inline int virtblk_probe_zoned_device(struct virtio_device *vdev,
 			struct virtio_blk *vblk, struct request_queue *q)
 {
-	u8 model;
-
-	virtio_cread(vdev, struct virtio_blk_config, zoned.model, &model);
-	if (model == VIRTIO_BLK_Z_HM) {
-		dev_err(&vdev->dev,
-			"virtio_blk: zoned devices are not supported");
-		return -EOPNOTSUPP;
-	}
-
-	return 0;
+	dev_err(&vdev->dev,
+		"virtio_blk: zoned devices are not supported");
+	return -EOPNOTSUPP;
 }
 #endif /* CONFIG_BLK_DEV_ZONED */
 
@@ -1570,9 +1547,26 @@ static int virtblk_probe(struct virtio_device *vdev)
 	 * placed after the virtio_device_ready() call above.
 	 */
 	if (virtio_has_feature(vdev, VIRTIO_BLK_F_ZONED)) {
-		err = virtblk_probe_zoned_device(vdev, vblk, q);
-		if (err)
+		u8 model;
+
+		virtio_cread(vdev, struct virtio_blk_config, zoned.model,
+				&model);
+		switch (model) {
+		case VIRTIO_BLK_Z_NONE:
+		case VIRTIO_BLK_Z_HA:
+			/* Present the host-aware device as non-zoned */
+			break;
+		case VIRTIO_BLK_Z_HM:
+			err = virtblk_probe_zoned_device(vdev, vblk, q);
+			if (err)
+				goto out_cleanup_disk;
+			break;
+		default:
+			dev_err(&vdev->dev, "unsupported zone model %d\n",
+				model);
+			err = -EINVAL;
 			goto out_cleanup_disk;
+		}
 	}
 
 	err = device_add_disk(&vdev->dev, vblk->disk, virtblk_attr_groups);
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
