Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC770727D9B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Jun 2023 13:03:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q7DQY-0007h6-MX;
	Thu, 08 Jun 2023 11:03:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+69acd89764e6999cdd63+7228+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q7DQW-0007gs-TF for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 11:03:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eGImU7RddjAi80e+tW424dPAVsMSpId5HtotbM4PBXg=; b=Zh/6lHni3GfElBOpSGw4DRWX5j
 fM8osmR8RHq20SWoLOtGcKDPllsZuVluB4kDjBlVlEAdJkUVV3ZHMehC21UoIhBMpF2llgY9KcVm5
 We/oXaxWc027mIqXq+Hsw4ngi04H59XELX2v/WEIib2Y6B5cs+vxRFwilTRTC1cmX8kA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eGImU7RddjAi80e+tW424dPAVsMSpId5HtotbM4PBXg=; b=ZODgStz/rw/wjH/DTQoqRikhlv
 PTGGvX3EcM3yFXff10Vxp3vujPhNSd+oigh9TlG8qp59AOpSTHV0Qseft+jEyoOVUvtHWwSpYQJA2
 dNwOfK1nsWn9uyCx24EWf5YfmLtgqqj+88mN7RTg8KtB9/NDzHqvDNMOWdxbmI5ZryAo=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q7DQV-0000Ns-Ec for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 11:03:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=eGImU7RddjAi80e+tW424dPAVsMSpId5HtotbM4PBXg=; b=QKoakhTg4fLiP0bDEva9VVDSHF
 PoMBZ8+2TZOm6zqZZZbysdmTGb0yc9nnFw6clZtx37HM3Xse3adwly95AZxbBY1ySSJgA8HA67iRn
 eFV+iFsVsN2LDA9OYWGge7BK/aQOICH/cCGdQwmGwpXDtZ2C9goXDM/g0Anr3ib1UehMzci70pj/c
 1iUfv3NEM/9DSaVrFRoJ0WTbVxqrrIvihx4Na5Zz+kh4TjKYbgTjY+8ywcaQrPWxmiifoF5xz8Sji
 NfHF8ccPi5btIbYCZxAgOPoAfNOorZLKLMq1GGa7914qlDNbq0ngSD9scqJVd+NIwYP55iXOJWqBX
 sDrYuk7w==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q7DQ4-0091eW-27; Thu, 08 Jun 2023 11:03:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  8 Jun 2023 13:02:31 +0200
Message-Id: <20230608110258.189493-4-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230608110258.189493-1-hch@lst.de>
References: <20230608110258.189493-1-hch@lst.de>
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
 Content preview:  Signed-off-by: Christoph Hellwig <hch@lst.de> Reviewed-by:
 Phillip Potter <phil@philpotter.co.uk> Reviewed-by: Hannes Reinecke
 <hare@suse.de>
 Acked-by: Christian Brauner <brauner@kernel.org> --- drive [...] 
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
X-Headers-End: 1q7DQV-0000Ns-Ec
Subject: [f2fs-dev] [PATCH 03/30] cdrom: remove the unused mode argument to
 cdrom_ioctl
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
 include/linux/cdrom.h | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
index e3eab319cb0474..245e5bbb05d41c 100644
--- a/drivers/cdrom/cdrom.c
+++ b/drivers/cdrom/cdrom.c
@@ -3336,7 +3336,7 @@ static int mmc_ioctl(struct cdrom_device_info *cdi, unsigned int cmd,
  * ATAPI / SCSI specific code now mainly resides in mmc_ioctl().
  */
 int cdrom_ioctl(struct cdrom_device_info *cdi, struct block_device *bdev,
-		fmode_t mode, unsigned int cmd, unsigned long arg)
+		unsigned int cmd, unsigned long arg)
 {
 	void __user *argp = (void __user *)arg;
 	int ret;
diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c
index eaa2d5a90bc82f..14922403983e9e 100644
--- a/drivers/cdrom/gdrom.c
+++ b/drivers/cdrom/gdrom.c
@@ -505,7 +505,7 @@ static int gdrom_bdops_ioctl(struct block_device *bdev, fmode_t mode,
 	int ret;
 
 	mutex_lock(&gdrom_mutex);
-	ret = cdrom_ioctl(gd.cd_info, bdev, mode, cmd, arg);
+	ret = cdrom_ioctl(gd.cd_info, bdev, cmd, arg);
 	mutex_unlock(&gdrom_mutex);
 
 	return ret;
diff --git a/drivers/scsi/sr.c b/drivers/scsi/sr.c
index 61b83880e395a4..444c7efc14cba7 100644
--- a/drivers/scsi/sr.c
+++ b/drivers/scsi/sr.c
@@ -539,7 +539,7 @@ static int sr_block_ioctl(struct block_device *bdev, fmode_t mode, unsigned cmd,
 	scsi_autopm_get_device(sdev);
 
 	if (cmd != CDROMCLOSETRAY && cmd != CDROMEJECT) {
-		ret = cdrom_ioctl(&cd->cdi, bdev, mode, cmd, arg);
+		ret = cdrom_ioctl(&cd->cdi, bdev, cmd, arg);
 		if (ret != -ENOSYS)
 			goto put;
 	}
diff --git a/include/linux/cdrom.h b/include/linux/cdrom.h
index cc5717cb0fa8a8..4aea8c82d16971 100644
--- a/include/linux/cdrom.h
+++ b/include/linux/cdrom.h
@@ -103,8 +103,8 @@ int cdrom_read_tocentry(struct cdrom_device_info *cdi,
 /* the general block_device operations structure: */
 int cdrom_open(struct cdrom_device_info *cdi, fmode_t mode);
 extern void cdrom_release(struct cdrom_device_info *cdi, fmode_t mode);
-extern int cdrom_ioctl(struct cdrom_device_info *cdi, struct block_device *bdev,
-		       fmode_t mode, unsigned int cmd, unsigned long arg);
+int cdrom_ioctl(struct cdrom_device_info *cdi, struct block_device *bdev,
+		unsigned int cmd, unsigned long arg);
 extern unsigned int cdrom_check_events(struct cdrom_device_info *cdi,
 				       unsigned int clearing);
 
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
