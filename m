Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 459B0727DA2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Jun 2023 13:03:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q7DQe-0006xz-Ju;
	Thu, 08 Jun 2023 11:03:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+69acd89764e6999cdd63+7228+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q7DQc-0006xs-EQ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 11:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=319q0onoIAoM2n/o+r2MAmSMvJKlXgEAWKSZAZbJIXs=; b=B+ragK1HC3PTN/0ZZuDrDCh0lX
 Nved4I9YcPDlOsV4hkAi56Lo/k7+6kXLQeseJ2UqVIDCD9FxzBWlGlA8jMIdvPEMhuV3mFA1ssdaH
 AsUu8B2Cv6aAJvSb4N/WZ6dEekerylGcHlq21xQxD5pXGtplR9gFT+zRgjDU6x4oCvWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=319q0onoIAoM2n/o+r2MAmSMvJKlXgEAWKSZAZbJIXs=; b=d+341VcS08Zl5dUbyJVmu8i9Pl
 dFK3GXn478uhHwb5vsF1kXUBZ+j5+afm98S5rdu8NtICXtsME9AIS0Edy0gNZNFhAOxGmg09mAAA0
 ovbySxKhxPIKNeq5vOP1wH2x+PWrBhpOx16XjFnVFRC3YjhZw5k92p/6senUyTL7WuzM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q7DQc-00EdvP-DX for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 11:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=319q0onoIAoM2n/o+r2MAmSMvJKlXgEAWKSZAZbJIXs=; b=W+6IS6bfgwtMoMjBe97+tG5PuD
 TX4ZuBxEAqSVIIEkrMYiDTzF4JiQtkbDhtZnAiwfu8m+lb6mokwIb/7AD9Au+oaLLe/UG90gRsD9d
 YVDhIMDi0qgCjHjiR50N+ty2HMH1MoEiJl01DmasLdKJCWj2nKIXh3uloB4uzimCb0XCvIt6tFJQ8
 dXavi9BKHVSmMnOA1S2r4oeroTdIyx+f276OazFTOzrVOuBSAbs4arKcm6sFMTydJMKDrN/5cMQDi
 0V46btfUVwGxacoCa6F66HComT2o4NWhn0naDTfyBDDEjv4H9LXs8qR1BVgFuL5ADwtBCLPezpS8t
 JWdmmrXg==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q7DQD-0091lb-2y; Thu, 08 Jun 2023 11:03:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  8 Jun 2023 13:02:34 +0200
Message-Id: <20230608110258.189493-7-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230608110258.189493-1-hch@lst.de>
References: <20230608110258.189493-1-hch@lst.de>
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
 Content preview:  Signed-off-by: Christoph Hellwig <hch@lst.de> Reviewed-by:
 Phillip Potter <phil@philpotter.co.uk> Reviewed-by: Hannes Reinecke
 <hare@suse.de>
 Acked-by: Christian Brauner <brauner@kernel.org> --- drive [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q7DQc-00EdvP-DX
Subject: [f2fs-dev] [PATCH 06/30] cdrom: remove the unused mode argument to
 cdrom_release
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
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org,
 Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Phillip Potter <phil@philpotter.co.uk>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Acked-by: Christian Brauner <brauner@kernel.org>
---
 drivers/cdrom/cdrom.c | 2 +-
 drivers/cdrom/gdrom.c | 2 +-
 drivers/scsi/sr.c     | 2 +-
 include/linux/cdrom.h | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
index adebac1bd210d9..998b03fe976e22 100644
--- a/drivers/cdrom/cdrom.c
+++ b/drivers/cdrom/cdrom.c
@@ -1250,7 +1250,7 @@ static int check_for_audio_disc(struct cdrom_device_info *cdi,
 	return 0;
 }
 
-void cdrom_release(struct cdrom_device_info *cdi, fmode_t mode)
+void cdrom_release(struct cdrom_device_info *cdi)
 {
 	const struct cdrom_device_ops *cdo = cdi->ops;
 
diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c
index 14922403983e9e..a401dc4218a998 100644
--- a/drivers/cdrom/gdrom.c
+++ b/drivers/cdrom/gdrom.c
@@ -481,7 +481,7 @@ static int gdrom_bdops_open(struct block_device *bdev, fmode_t mode)
 	bdev_check_media_change(bdev);
 
 	mutex_lock(&gdrom_mutex);
-	ret = cdrom_open(gd.cd_info, mode);
+	ret = cdrom_open(gd.cd_info);
 	mutex_unlock(&gdrom_mutex);
 	return ret;
 }
diff --git a/drivers/scsi/sr.c b/drivers/scsi/sr.c
index 444c7efc14cba7..6d33120ee5ba85 100644
--- a/drivers/scsi/sr.c
+++ b/drivers/scsi/sr.c
@@ -512,7 +512,7 @@ static void sr_block_release(struct gendisk *disk, fmode_t mode)
 	struct scsi_cd *cd = scsi_cd(disk);
 
 	mutex_lock(&cd->lock);
-	cdrom_release(&cd->cdi, mode);
+	cdrom_release(&cd->cdi);
 	mutex_unlock(&cd->lock);
 
 	scsi_device_put(cd->device);
diff --git a/include/linux/cdrom.h b/include/linux/cdrom.h
index adcc9f2beb2653..3c253b29f4aafc 100644
--- a/include/linux/cdrom.h
+++ b/include/linux/cdrom.h
@@ -102,7 +102,7 @@ int cdrom_read_tocentry(struct cdrom_device_info *cdi,
 
 /* the general block_device operations structure: */
 int cdrom_open(struct cdrom_device_info *cdi, fmode_t mode);
-extern void cdrom_release(struct cdrom_device_info *cdi, fmode_t mode);
+void cdrom_release(struct cdrom_device_info *cdi);
 int cdrom_ioctl(struct cdrom_device_info *cdi, struct block_device *bdev,
 		unsigned int cmd, unsigned long arg);
 extern unsigned int cdrom_check_events(struct cdrom_device_info *cdi,
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
