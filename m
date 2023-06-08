Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FAB727DD4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Jun 2023 13:04:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q7DRQ-0007nB-L6;
	Thu, 08 Jun 2023 11:04:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+69acd89764e6999cdd63+7228+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q7DRO-0007mb-Nd for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 11:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OYUHh+4M0utRLFunGOJAUcyyaBU5s2THoZb+BQl7GUE=; b=E9FqCPaPG4eRYOPUEyTYBanjnF
 4XdI81rqnrA9qzfOiyO+DRfwqHTrLDm1yqLhonufvovUtplcrHty2i5damCMyfuYGnvOHkhd4o24/
 k+gySNGCqfRJHqLh34pMIn7K1qmVnpDbPvhfXVMzfOcgVE8pAJ/eXiAchCUfgi0Meo0k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OYUHh+4M0utRLFunGOJAUcyyaBU5s2THoZb+BQl7GUE=; b=Nfnj0xVNNwXHtz9sfg57dTqO44
 r6Lsg4fAE8PI7eaUFtdamEOUP1i/Y4NIBq0rsog8FCqRlAlEuNVHdey1yp1wLboJSrM2krFUkMS/m
 G4W49ackITtLIbVATa8kK8j3kFsVCbyO7P0CKbNLbQmr3exyePnAXxXWTJTnFn5mWb0w=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q7DRN-0000Rz-4l for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 11:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=OYUHh+4M0utRLFunGOJAUcyyaBU5s2THoZb+BQl7GUE=; b=XMxt1xBscJ0pI2z9wXwtBfhHoj
 NaYMPR541sRAbKkNuq94A0tGaOdOL2ppU67LomkE8PHY1cLidjOlmD1ASO1pdXCpk0TwV2vD/WbBR
 9kiggNU0hMlB7OKMpYl+7IiwsFYBd4AMo4RNXxOSqah0M1fTVzzNIxH4opHOEUD6ocDCS1QCOZDsR
 ctTIHDJR3fDm3H3rHOfGswVKS8V8h7zZ3zaeE9z4hbqCdVvCfvfOA0KBL5SD8cN96eGG5AD6dpUnG
 r3gJ4kX/hr+9Vw6Ni/HBW9azjuUusZbT0wswuRD8pEJpADntyxeC7hSr3xDQtNuv+v+3O4GfQn6ui
 qiZvPnZg==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q7DQq-0092W2-2a; Thu, 08 Jun 2023 11:03:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  8 Jun 2023 13:02:48 +0200
Message-Id: <20230608110258.189493-21-hch@lst.de>
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
 Content preview: Instead of passing a fmode_t and only checking it for
 FMODE_WRITE, 
 pass a bool open_for_write to prepare for callers that won't have the fmode_t.
 Signed-off-by: Christoph Hellwig <hch@lst.de> Reviewed-by: Martin K. Petersen
 <martin.petersen@oracle.com> Reviewed-by: Hannes Reinecke <hare@suse.de>
 Acked-by: Christian Brauner <brauner@kernel.org> [...] 
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
X-Headers-End: 1q7DRN-0000Rz-4l
Subject: [f2fs-dev] [PATCH 20/30] scsi: replace the fmode_t argument to
 ->sg_io_fn with a simple bool
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

Instead of passing a fmode_t and only checking it for FMODE_WRITE, pass
a bool open_for_write to prepare for callers that won't have the fmode_t.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Acked-by: Christian Brauner <brauner@kernel.org>
---
 block/bsg-lib.c         | 2 +-
 block/bsg.c             | 8 +++++---
 drivers/scsi/scsi_bsg.c | 4 ++--
 include/linux/bsg.h     | 2 +-
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/block/bsg-lib.c b/block/bsg-lib.c
index 435c32373cd68f..b3acdbdb6e7ea8 100644
--- a/block/bsg-lib.c
+++ b/block/bsg-lib.c
@@ -26,7 +26,7 @@ struct bsg_set {
 };
 
 static int bsg_transport_sg_io_fn(struct request_queue *q, struct sg_io_v4 *hdr,
-		fmode_t mode, unsigned int timeout)
+		bool open_for_write, unsigned int timeout)
 {
 	struct bsg_job *job;
 	struct request *rq;
diff --git a/block/bsg.c b/block/bsg.c
index 7eca43f33d7ff8..bec4027842b31e 100644
--- a/block/bsg.c
+++ b/block/bsg.c
@@ -54,7 +54,8 @@ static unsigned int bsg_timeout(struct bsg_device *bd, struct sg_io_v4 *hdr)
 	return max_t(unsigned int, timeout, BLK_MIN_SG_TIMEOUT);
 }
 
-static int bsg_sg_io(struct bsg_device *bd, fmode_t mode, void __user *uarg)
+static int bsg_sg_io(struct bsg_device *bd, bool open_for_write,
+		     void __user *uarg)
 {
 	struct sg_io_v4 hdr;
 	int ret;
@@ -63,7 +64,8 @@ static int bsg_sg_io(struct bsg_device *bd, fmode_t mode, void __user *uarg)
 		return -EFAULT;
 	if (hdr.guard != 'Q')
 		return -EINVAL;
-	ret = bd->sg_io_fn(bd->queue, &hdr, mode, bsg_timeout(bd, &hdr));
+	ret = bd->sg_io_fn(bd->queue, &hdr, open_for_write,
+			   bsg_timeout(bd, &hdr));
 	if (!ret && copy_to_user(uarg, &hdr, sizeof(hdr)))
 		return -EFAULT;
 	return ret;
@@ -146,7 +148,7 @@ static long bsg_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case SG_EMULATED_HOST:
 		return put_user(1, intp);
 	case SG_IO:
-		return bsg_sg_io(bd, file->f_mode, uarg);
+		return bsg_sg_io(bd, file->f_mode & FMODE_WRITE, uarg);
 	case SCSI_IOCTL_SEND_COMMAND:
 		pr_warn_ratelimited("%s: calling unsupported SCSI_IOCTL_SEND_COMMAND\n",
 				current->comm);
diff --git a/drivers/scsi/scsi_bsg.c b/drivers/scsi/scsi_bsg.c
index 12431f35f861e1..a9a9ec086a7e3f 100644
--- a/drivers/scsi/scsi_bsg.c
+++ b/drivers/scsi/scsi_bsg.c
@@ -10,7 +10,7 @@
 #define uptr64(val) ((void __user *)(uintptr_t)(val))
 
 static int scsi_bsg_sg_io_fn(struct request_queue *q, struct sg_io_v4 *hdr,
-		fmode_t mode, unsigned int timeout)
+		bool open_for_write, unsigned int timeout)
 {
 	struct scsi_cmnd *scmd;
 	struct request *rq;
@@ -42,7 +42,7 @@ static int scsi_bsg_sg_io_fn(struct request_queue *q, struct sg_io_v4 *hdr,
 	if (copy_from_user(scmd->cmnd, uptr64(hdr->request), scmd->cmd_len))
 		goto out_put_request;
 	ret = -EPERM;
-	if (!scsi_cmd_allowed(scmd->cmnd, mode & FMODE_WRITE))
+	if (!scsi_cmd_allowed(scmd->cmnd, open_for_write))
 		goto out_put_request;
 
 	ret = 0;
diff --git a/include/linux/bsg.h b/include/linux/bsg.h
index 1ac81c809da9b3..ee2df73edf83f8 100644
--- a/include/linux/bsg.h
+++ b/include/linux/bsg.h
@@ -9,7 +9,7 @@ struct device;
 struct request_queue;
 
 typedef int (bsg_sg_io_fn)(struct request_queue *, struct sg_io_v4 *hdr,
-		fmode_t mode, unsigned int timeout);
+		bool open_for_write, unsigned int timeout);
 
 struct bsg_device *bsg_register_queue(struct request_queue *q,
 		struct device *parent, const char *name,
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
