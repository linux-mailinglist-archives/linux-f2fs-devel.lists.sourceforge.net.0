Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 016EA723991
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jun 2023 09:41:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6RK0-00054h-GK;
	Tue, 06 Jun 2023 07:41:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+c7f58ba0a08136e81302+7226+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q6RJq-00053p-JV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 07:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R20Yw5zcuZYpJrVEQSWYsB8I147QjgDqBqLKr0ySJho=; b=LJLQ3OnAqpZKyQvf5Jq60km1kc
 gOf6km4eCOSjFzgU0WAN6t0ndTSVjFuTU/8wtUHj8mY6xTGlf0QRzzWq3ZbhL+WWrLDxylZY9l718
 0UJIncwlPZsqNM+oWCXqsnGn1X9mseeEHAgVQOXECt0a369Iq95cdWYW2E3gUMn2/T1U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R20Yw5zcuZYpJrVEQSWYsB8I147QjgDqBqLKr0ySJho=; b=EK1Vy8jGdW4mkwNZ9aFC108GE+
 ZyXKNfSbLrBLCfMgrEbVKrrRh884jKXoA5E7aawmu3pqeDHTPbBJwtdNLNOmsU/W9ZCO8+4e7bZGc
 0f3oRpPId1q8WSWqUVzw8k+8sl8T9wqsyuQrH90IpG8mwx6ZR7mQOeRjcEq1MhEImIEI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6RJn-0003cN-6H for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 07:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=R20Yw5zcuZYpJrVEQSWYsB8I147QjgDqBqLKr0ySJho=; b=tE1ub59JY675GaIY0kdz4kx9qC
 t7Qrc0/hmnop4dUwlNIZOgadngaDt3sjdmr/bvyBcd74WBEgBPyG7hwBD+ob9iQUAjigHwCq7G2gW
 ndPgHGaKJhtBEa3X75flYf15KyoVnLTWiRbCCiOCVoZ4tCo8ccLlU4gymjRWMloLSvmGsOxtIbRbc
 kuU9vB/dU4VIISSn077TJvWp5DtTu/2mMCAzENwjt5mz1YDSBxJ3fiqfNholQvwgyYbsKPBZkqgw3
 YbkjCpuzUtPKAT9JE1ZzfKhaaXtvvwaye6MKcdy/TlUjdtDI9897XLkt2e18PfISHy0jGDJyPD3f9
 6INetx1Q==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q6RJL-000ZgM-1N; Tue, 06 Jun 2023 07:40:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue,  6 Jun 2023 09:39:39 +0200
Message-Id: <20230606073950.225178-21-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230606073950.225178-1-hch@lst.de>
References: <20230606073950.225178-1-hch@lst.de>
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
 Content preview: Instead of passing a fmode_t and only checking it for
 FMODE_WRITE, 
 pass a bool open_for_write to prepare for callers that won't have the fmode_t.
 Signed-off-by: Christoph Hellwig <hch@lst.de> --- drivers/scsi/ch.c | 3 ++-
 drivers/scsi/scsi_ioctl.c | 34 +++++++++++++++++ drivers/scsi/sd.c | 2 +-
 drivers/scsi/sg.c | 5 +++-- drive [...] 
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
X-Headers-End: 1q6RJn-0003cN-6H
Subject: [f2fs-dev] [PATCH 20/31] scsi: replace the fmode_t argument to
 scsi_ioctl with a simple bool
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

Instead of passing a fmode_t and only checking it for FMODE_WRITE, pass
a bool open_for_write to prepare for callers that won't have the fmode_t.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/ch.c         |  3 ++-
 drivers/scsi/scsi_ioctl.c | 34 +++++++++++++++++-----------------
 drivers/scsi/sd.c         |  2 +-
 drivers/scsi/sg.c         |  5 +++--
 drivers/scsi/sr.c         |  2 +-
 drivers/scsi/st.c         |  2 +-
 include/scsi/scsi_ioctl.h |  2 +-
 7 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/scsi/ch.c b/drivers/scsi/ch.c
index ac648bb8f7e7f4..cb0a399be1ccee 100644
--- a/drivers/scsi/ch.c
+++ b/drivers/scsi/ch.c
@@ -877,7 +877,8 @@ static long ch_ioctl(struct file *file,
 	}
 
 	default:
-		return scsi_ioctl(ch->device, file->f_mode, cmd, argp);
+		return scsi_ioctl(ch->device, file->f_mode & FMODE_WRITE, cmd,
+				  argp);
 
 	}
 }
diff --git a/drivers/scsi/scsi_ioctl.c b/drivers/scsi/scsi_ioctl.c
index dda5468ca97f90..6f6c5973c3ea95 100644
--- a/drivers/scsi/scsi_ioctl.c
+++ b/drivers/scsi/scsi_ioctl.c
@@ -346,7 +346,7 @@ bool scsi_cmd_allowed(unsigned char *cmd, bool open_for_write)
 EXPORT_SYMBOL(scsi_cmd_allowed);
 
 static int scsi_fill_sghdr_rq(struct scsi_device *sdev, struct request *rq,
-		struct sg_io_hdr *hdr, fmode_t mode)
+		struct sg_io_hdr *hdr, bool open_for_write)
 {
 	struct scsi_cmnd *scmd = blk_mq_rq_to_pdu(rq);
 
@@ -354,7 +354,7 @@ static int scsi_fill_sghdr_rq(struct scsi_device *sdev, struct request *rq,
 		return -EMSGSIZE;
 	if (copy_from_user(scmd->cmnd, hdr->cmdp, hdr->cmd_len))
 		return -EFAULT;
-	if (!scsi_cmd_allowed(scmd->cmnd, mode & FMODE_WRITE))
+	if (!scsi_cmd_allowed(scmd->cmnd, open_for_write))
 		return -EPERM;
 	scmd->cmd_len = hdr->cmd_len;
 
@@ -407,7 +407,8 @@ static int scsi_complete_sghdr_rq(struct request *rq, struct sg_io_hdr *hdr,
 	return ret;
 }
 
-static int sg_io(struct scsi_device *sdev, struct sg_io_hdr *hdr, fmode_t mode)
+static int sg_io(struct scsi_device *sdev, struct sg_io_hdr *hdr,
+		bool open_for_write)
 {
 	unsigned long start_time;
 	ssize_t ret = 0;
@@ -448,7 +449,7 @@ static int sg_io(struct scsi_device *sdev, struct sg_io_hdr *hdr, fmode_t mode)
 		goto out_put_request;
 	}
 
-	ret = scsi_fill_sghdr_rq(sdev, rq, hdr, mode);
+	ret = scsi_fill_sghdr_rq(sdev, rq, hdr, open_for_write);
 	if (ret < 0)
 		goto out_put_request;
 
@@ -477,8 +478,7 @@ static int sg_io(struct scsi_device *sdev, struct sg_io_hdr *hdr, fmode_t mode)
 /**
  * sg_scsi_ioctl  --  handle deprecated SCSI_IOCTL_SEND_COMMAND ioctl
  * @q:		request queue to send scsi commands down
- * @mode:	mode used to open the file through which the ioctl has been
- *		submitted
+ * @open_for_write: is the file / block device opened for writing?
  * @sic:	userspace structure describing the command to perform
  *
  * Send down the scsi command described by @sic to the device below
@@ -501,7 +501,7 @@ static int sg_io(struct scsi_device *sdev, struct sg_io_hdr *hdr, fmode_t mode)
  *      Positive numbers returned are the compacted SCSI error codes (4
  *      bytes in one int) where the lowest byte is the SCSI status.
  */
-static int sg_scsi_ioctl(struct request_queue *q, fmode_t mode,
+static int sg_scsi_ioctl(struct request_queue *q, bool open_for_write,
 		struct scsi_ioctl_command __user *sic)
 {
 	struct request *rq;
@@ -554,7 +554,7 @@ static int sg_scsi_ioctl(struct request_queue *q, fmode_t mode,
 		goto error;
 
 	err = -EPERM;
-	if (!scsi_cmd_allowed(scmd->cmnd, mode & FMODE_WRITE))
+	if (!scsi_cmd_allowed(scmd->cmnd, open_for_write))
 		goto error;
 
 	/* default.  possible overridden later */
@@ -776,7 +776,7 @@ static int scsi_put_cdrom_generic_arg(const struct cdrom_generic_command *cgc,
 	return 0;
 }
 
-static int scsi_cdrom_send_packet(struct scsi_device *sdev, fmode_t mode,
+static int scsi_cdrom_send_packet(struct scsi_device *sdev, bool open_for_write,
 		void __user *arg)
 {
 	struct cdrom_generic_command cgc;
@@ -817,7 +817,7 @@ static int scsi_cdrom_send_packet(struct scsi_device *sdev, fmode_t mode,
 	hdr.cmdp = ((struct cdrom_generic_command __user *) arg)->cmd;
 	hdr.cmd_len = sizeof(cgc.cmd);
 
-	err = sg_io(sdev, &hdr, mode);
+	err = sg_io(sdev, &hdr, open_for_write);
 	if (err == -EFAULT)
 		return -EFAULT;
 
@@ -832,7 +832,7 @@ static int scsi_cdrom_send_packet(struct scsi_device *sdev, fmode_t mode,
 	return err;
 }
 
-static int scsi_ioctl_sg_io(struct scsi_device *sdev, fmode_t mode,
+static int scsi_ioctl_sg_io(struct scsi_device *sdev, bool open_for_write,
 		void __user *argp)
 {
 	struct sg_io_hdr hdr;
@@ -841,7 +841,7 @@ static int scsi_ioctl_sg_io(struct scsi_device *sdev, fmode_t mode,
 	error = get_sg_io_hdr(&hdr, argp);
 	if (error)
 		return error;
-	error = sg_io(sdev, &hdr, mode);
+	error = sg_io(sdev, &hdr, open_for_write);
 	if (error == -EFAULT)
 		return error;
 	if (put_sg_io_hdr(&hdr, argp))
@@ -852,7 +852,7 @@ static int scsi_ioctl_sg_io(struct scsi_device *sdev, fmode_t mode,
 /**
  * scsi_ioctl - Dispatch ioctl to scsi device
  * @sdev: scsi device receiving ioctl
- * @mode: mode the block/char device is opened with
+ * @open_for_write: is the file / block device opened for writing?
  * @cmd: which ioctl is it
  * @arg: data associated with ioctl
  *
@@ -860,7 +860,7 @@ static int scsi_ioctl_sg_io(struct scsi_device *sdev, fmode_t mode,
  * does not take a major/minor number as the dev field.  Rather, it takes
  * a pointer to a &struct scsi_device.
  */
-int scsi_ioctl(struct scsi_device *sdev, fmode_t mode, int cmd,
+int scsi_ioctl(struct scsi_device *sdev, bool open_for_write, int cmd,
 		void __user *arg)
 {
 	struct request_queue *q = sdev->request_queue;
@@ -896,11 +896,11 @@ int scsi_ioctl(struct scsi_device *sdev, fmode_t mode, int cmd,
 	case SG_EMULATED_HOST:
 		return sg_emulated_host(q, arg);
 	case SG_IO:
-		return scsi_ioctl_sg_io(sdev, mode, arg);
+		return scsi_ioctl_sg_io(sdev, open_for_write, arg);
 	case SCSI_IOCTL_SEND_COMMAND:
-		return sg_scsi_ioctl(q, mode, arg);
+		return sg_scsi_ioctl(q, open_for_write, arg);
 	case CDROM_SEND_PACKET:
-		return scsi_cdrom_send_packet(sdev, mode, arg);
+		return scsi_cdrom_send_packet(sdev, open_for_write, arg);
 	case CDROMCLOSETRAY:
 		return scsi_send_start_stop(sdev, 3);
 	case CDROMEJECT:
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index c67c84f6ba6178..02b6704ec2b401 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -1463,7 +1463,7 @@ static int sd_ioctl(struct block_device *bdev, fmode_t mode,
 
 	if (is_sed_ioctl(cmd))
 		return sed_ioctl(sdkp->opal_dev, cmd, p);
-	return scsi_ioctl(sdp, mode, cmd, p);
+	return scsi_ioctl(sdp, mode & FMODE_WRITE, cmd, p);
 }
 
 static void set_media_not_present(struct scsi_disk *sdkp)
diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
index e49ea693d0b656..138e28bb76b749 100644
--- a/drivers/scsi/sg.c
+++ b/drivers/scsi/sg.c
@@ -1103,7 +1103,8 @@ sg_ioctl_common(struct file *filp, Sg_device *sdp, Sg_fd *sfp,
 	case SCSI_IOCTL_SEND_COMMAND:
 		if (atomic_read(&sdp->detaching))
 			return -ENODEV;
-		return scsi_ioctl(sdp->device, filp->f_mode, cmd_in, p);
+		return scsi_ioctl(sdp->device, filp->f_mode & FMODE_WRITE,
+				  cmd_in, p);
 	case SG_SET_DEBUG:
 		result = get_user(val, ip);
 		if (result)
@@ -1159,7 +1160,7 @@ sg_ioctl(struct file *filp, unsigned int cmd_in, unsigned long arg)
 	ret = sg_ioctl_common(filp, sdp, sfp, cmd_in, p);
 	if (ret != -ENOIOCTLCMD)
 		return ret;
-	return scsi_ioctl(sdp->device, filp->f_mode, cmd_in, p);
+	return scsi_ioctl(sdp->device, filp->f_mode & FMODE_WRITE, cmd_in, p);
 }
 
 static __poll_t
diff --git a/drivers/scsi/sr.c b/drivers/scsi/sr.c
index 55082acb59bcaa..00aaafc8dd78f8 100644
--- a/drivers/scsi/sr.c
+++ b/drivers/scsi/sr.c
@@ -543,7 +543,7 @@ static int sr_block_ioctl(struct block_device *bdev, fmode_t mode, unsigned cmd,
 		if (ret != -ENOSYS)
 			goto put;
 	}
-	ret = scsi_ioctl(sdev, mode, cmd, argp);
+	ret = scsi_ioctl(sdev, mode & FMODE_WRITE, cmd, argp);
 
 put:
 	scsi_autopm_put_device(sdev);
diff --git a/drivers/scsi/st.c b/drivers/scsi/st.c
index b90a440e135dc4..14d7981ddcdd19 100644
--- a/drivers/scsi/st.c
+++ b/drivers/scsi/st.c
@@ -3832,7 +3832,7 @@ static long st_ioctl(struct file *file, unsigned int cmd_in, unsigned long arg)
 		break;
 	}
 
-	retval = scsi_ioctl(STp->device, file->f_mode, cmd_in, p);
+	retval = scsi_ioctl(STp->device, file->f_mode & FMODE_WRITE, cmd_in, p);
 	if (!retval && cmd_in == SCSI_IOCTL_STOP_UNIT) {
 		/* unload */
 		STp->rew_at_close = 0;
diff --git a/include/scsi/scsi_ioctl.h b/include/scsi/scsi_ioctl.h
index 914201a8cb947c..a207c07da9d20c 100644
--- a/include/scsi/scsi_ioctl.h
+++ b/include/scsi/scsi_ioctl.h
@@ -45,7 +45,7 @@ typedef struct scsi_fctargaddress {
 
 int scsi_ioctl_block_when_processing_errors(struct scsi_device *sdev,
 		int cmd, bool ndelay);
-int scsi_ioctl(struct scsi_device *sdev, fmode_t mode, int cmd,
+int scsi_ioctl(struct scsi_device *sdev, bool open_for_write, int cmd,
 		void __user *arg);
 int get_sg_io_hdr(struct sg_io_hdr *hdr, const void __user *argp);
 int put_sg_io_hdr(const struct sg_io_hdr *hdr, void __user *argp);
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
