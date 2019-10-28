Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ACAE6D92
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2019 08:53:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lc/pyPU0tTJwobKspHDp51ujgYJt8PN7DphIMUIQf9A=; b=NeV1JctUG62Ue4vjq7Z8ylEFa
	v1ZElHjhXcwlchqbqNEVyP4OznxBZjUteoicwdI2K+wlYKWqHk2yPdIM3ePQCF9rgYiV+KUAgJDWO
	CISMGVRwR/zSn86ZceQo5+vdqvwC8wUt3YbyOrI+2WtM8Lsqosq+KXHNyztvtCxbco/ko=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iOzqK-0005ud-Of; Mon, 28 Oct 2019 07:53:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <31Za2XQYKANAEwFKwF2AA270.yA8@flex--satyat.bounces.google.com>)
 id 1iOzqJ-0005uQ-GM
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 07:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2wF1FL2um71TZXTPllMyCv0xpSXF1RkAdV1vOmnGVGY=; b=aeQ4aDm/+TeD1fLy3zWj8I+OQ
 EgY/EAcdVtKDc6BhrVTRLEFn1KbfE4ToS8hKYpFA93YnRMwb8CX0kszHAkenMNR9EwjkVCE0xAfE3
 Ioj7XJjGzmJYg3ErTns+594kFvXKeegvt/g05Dn4bTQZtJXE+lyXHsM7me1QgsXN4Zz2g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2wF1FL2um71TZXTPllMyCv0xpSXF1RkAdV1vOmnGVGY=; b=Sglfk9S17Q7pVNkWIcuF5puYXm
 /AUFAXlbsidRmjwsO0D4XsHEJ7MmBJJ4kuT/V6s4g+BZbj6aAgj62aMkxfzzhrsa42Mr06Sz/caBI
 5tsJG9nk+vFpygIunbjlVcocW57wiXPmUWsNcZ+puIQIolC3PXf2cMF3n98xHCyHhFow=;
Received: from mail-il1-f201.google.com ([209.85.166.201])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iOzqF-0067qo-UH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 07:53:35 +0000
Received: by mail-il1-f201.google.com with SMTP id n84so3159018ila.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Oct 2019 00:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=2wF1FL2um71TZXTPllMyCv0xpSXF1RkAdV1vOmnGVGY=;
 b=pakzYc6XGQh8JJBkU4zMyfqMOmrVrcl/WRoKpjbj4CR8/r1ll5Sc/09c+qBgJ9Vv+/
 V3iFR+fwDeecGH+5OMSlK3d4Kx8A5N2zOaByVI/2sx4cKubt9L8HxWPIFLz4HYn48tou
 7G6hBQ5QjfIibd/tOiR84zroVq4xYHgy6z90RcY+bL/Npfkd9zrRuj/1i+JUy99s5/v5
 5YdZ+GeNEb5ejKsK29JfeykIpWe9Cw4OYbXYN+F+oghX2V/Lt7LZhViP7YZMh2CzV3xE
 Iv8mY0vgL68SNWXAHohbWA4rHNGA2LFfLCvg9sLN16ELQwvqWhGO/mZlC1UdWBeWR2qb
 sjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=2wF1FL2um71TZXTPllMyCv0xpSXF1RkAdV1vOmnGVGY=;
 b=arbP3r72gqaZY5ypkgFsyEcDAvRpTGlSSMmN2OaZoPcBZuLaf4GsrCtISlGPmJ5Np+
 Azm/dxyrLJ7YYflVKLrKuDz+om8qmEQsmU3m9uf1CJNgpDEL/rD+tdpHLr9fSpcd2RdU
 5E/QtJaDyRiRmYIpivPN2oSLbEw8ydrGt/wqtTfyHB/7tmW2n2f3ZOKXdD18LAsleTaD
 RURhtNW8dDLGbmHMHLp1G978E4kIU7Y81MzwXEhB+fDZQzvv3QNHWFM7tm6B/7FwqERr
 4nx0/VRLv1ITu5637qA8yGlfpJ6RR40t3bYE6PmwjV13Ki7Tuw4rUFNj2LrKBHe12xPN
 3saQ==
X-Gm-Message-State: APjAAAWLqxcCmlOtd98Y1PxEKvBPcQ0E/BRlmL0SJ/0nwCHMBlG5wU5+
 qauzmV1Oz7Fl7Bi6nvHgOoYuw3IcslM=
X-Google-Smtp-Source: APXvYqy3InTY+RdLpcR9tmFHR45buosecQvoYzfMkh7GKWF+l2h443+9Dqs0Id39jUvJQqmLzfTv4bBn4dQ=
X-Received: by 2002:a65:4608:: with SMTP id v8mr18872025pgq.366.1572247253428; 
 Mon, 28 Oct 2019 00:20:53 -0700 (PDT)
Date: Mon, 28 Oct 2019 00:20:29 -0700
In-Reply-To: <20191028072032.6911-1-satyat@google.com>
Message-Id: <20191028072032.6911-7-satyat@google.com>
Mime-Version: 1.0
References: <20191028072032.6911-1-satyat@google.com>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.201 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iOzqF-0067qo-UH
Subject: [f2fs-dev] [PATCH v5 6/9] scsi: ufs: Add inline encryption support
 to UFS
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: Kuohong Wang <kuohong.wang@mediatek.com>,
 Satya Tangirala <satyat@google.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Kim Boojin <boojin.kim@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Wire up ufshcd.c with the UFS Crypto API, the block layer inline
encryption additions and the keyslot manager.

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 drivers/scsi/ufs/ufshcd.c | 83 ++++++++++++++++++++++++++++++++++++---
 drivers/scsi/ufs/ufshcd.h |  6 +++
 2 files changed, 84 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index e66eb7a39a02..3a1190f0c672 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -47,6 +47,7 @@
 #include "unipro.h"
 #include "ufs-sysfs.h"
 #include "ufs_bsg.h"
+#include "ufshcd-crypto.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/ufs.h>
@@ -857,7 +858,14 @@ static void ufshcd_enable_run_stop_reg(struct ufs_hba *hba)
  */
 static inline void ufshcd_hba_start(struct ufs_hba *hba)
 {
-	ufshcd_writel(hba, CONTROLLER_ENABLE, REG_CONTROLLER_ENABLE);
+	u32 val = CONTROLLER_ENABLE;
+
+	if (ufshcd_hba_is_crypto_supported(hba)) {
+		ufshcd_crypto_enable(hba);
+		val |= CRYPTO_GENERAL_ENABLE;
+	}
+
+	ufshcd_writel(hba, val, REG_CONTROLLER_ENABLE);
 }
 
 /**
@@ -2211,9 +2219,21 @@ static void ufshcd_prepare_req_desc_hdr(struct ufshcd_lrb *lrbp,
 		dword_0 |= UTP_REQ_DESC_INT_CMD;
 
 	/* Transfer request descriptor header fields */
+	if (lrbp->crypto_enable) {
+		dword_0 |= UTP_REQ_DESC_CRYPTO_ENABLE_CMD;
+		dword_0 |= lrbp->crypto_key_slot;
+		req_desc->header.dword_1 =
+			cpu_to_le32((u32)lrbp->data_unit_num);
+		req_desc->header.dword_3 =
+			cpu_to_le32((u32)(lrbp->data_unit_num >> 32));
+	} else {
+		/* dword_1 and dword_3 are reserved, hence they are set to 0 */
+		req_desc->header.dword_1 = 0;
+		req_desc->header.dword_3 = 0;
+	}
+
 	req_desc->header.dword_0 = cpu_to_le32(dword_0);
-	/* dword_1 is reserved, hence it is set to 0 */
-	req_desc->header.dword_1 = 0;
+
 	/*
 	 * assigning invalid value for command status. Controller
 	 * updates OCS on command completion, with the command
@@ -2221,8 +2241,6 @@ static void ufshcd_prepare_req_desc_hdr(struct ufshcd_lrb *lrbp,
 	 */
 	req_desc->header.dword_2 =
 		cpu_to_le32(OCS_INVALID_COMMAND_STATUS);
-	/* dword_3 is reserved, hence it is set to 0 */
-	req_desc->header.dword_3 = 0;
 
 	req_desc->prd_table_length = 0;
 }
@@ -2382,6 +2400,37 @@ static inline u16 ufshcd_upiu_wlun_to_scsi_wlun(u8 upiu_wlun_id)
 	return (upiu_wlun_id & ~UFS_UPIU_WLUN_ID) | SCSI_W_LUN_BASE;
 }
 
+static inline int ufshcd_prepare_lrbp_crypto(struct ufs_hba *hba,
+					     struct scsi_cmnd *cmd,
+					     struct ufshcd_lrb *lrbp)
+{
+	int key_slot;
+
+	if (!cmd->request->bio ||
+	    !bio_crypt_should_process(cmd->request->bio, cmd->request->q)) {
+		lrbp->crypto_enable = false;
+		return 0;
+	}
+
+	if (WARN_ON(!ufshcd_is_crypto_enabled(hba))) {
+		/*
+		 * Upper layer asked us to do inline encryption
+		 * but that isn't enabled, so we fail this request.
+		 */
+		return -EINVAL;
+	}
+	key_slot = bio_crypt_get_keyslot(cmd->request->bio);
+	if (!ufshcd_keyslot_valid(hba, key_slot))
+		return -EINVAL;
+
+	lrbp->crypto_enable = true;
+	lrbp->crypto_key_slot = key_slot;
+	lrbp->data_unit_num = bio_crypt_data_unit_num(cmd->request->bio);
+
+	return 0;
+}
+
+
 /**
  * ufshcd_queuecommand - main entry point for SCSI requests
  * @host: SCSI host pointer
@@ -2469,6 +2518,13 @@ static int ufshcd_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *cmd)
 	lrbp->task_tag = tag;
 	lrbp->lun = ufshcd_scsi_to_upiu_lun(cmd->device->lun);
 	lrbp->intr_cmd = !ufshcd_is_intr_aggr_allowed(hba) ? true : false;
+
+	err = ufshcd_prepare_lrbp_crypto(hba, cmd, lrbp);
+	if (err) {
+		lrbp->cmd = NULL;
+		clear_bit_unlock(tag, &hba->lrb_in_use);
+		goto out;
+	}
 	lrbp->req_abort_skip = false;
 
 	ufshcd_comp_scsi_upiu(hba, lrbp);
@@ -2502,6 +2558,7 @@ static int ufshcd_compose_dev_cmd(struct ufs_hba *hba,
 	lrbp->task_tag = tag;
 	lrbp->lun = 0; /* device management cmd is not specific to any LUN */
 	lrbp->intr_cmd = true; /* No interrupt aggregation */
+	lrbp->crypto_enable = false; /* No crypto operations */
 	hba->dev_cmd.type = cmd_type;
 
 	return ufshcd_comp_devman_upiu(hba, lrbp);
@@ -4229,6 +4286,8 @@ static inline void ufshcd_hba_stop(struct ufs_hba *hba, bool can_sleep)
 {
 	int err;
 
+	ufshcd_crypto_disable(hba);
+
 	ufshcd_writel(hba, CONTROLLER_DISABLE,  REG_CONTROLLER_ENABLE);
 	err = ufshcd_wait_for_register(hba, REG_CONTROLLER_ENABLE,
 					CONTROLLER_ENABLE, CONTROLLER_DISABLE,
@@ -4632,8 +4691,12 @@ static int ufshcd_change_queue_depth(struct scsi_device *sdev, int depth)
 static int ufshcd_slave_configure(struct scsi_device *sdev)
 {
 	struct request_queue *q = sdev->request_queue;
+	struct ufs_hba *hba = shost_priv(sdev->host);
 
 	blk_queue_update_dma_pad(q, PRDT_DATA_BYTE_COUNT_PAD - 1);
+
+	ufshcd_crypto_setup_rq_keyslot_manager(hba, q);
+
 	return 0;
 }
 
@@ -4644,6 +4707,7 @@ static int ufshcd_slave_configure(struct scsi_device *sdev)
 static void ufshcd_slave_destroy(struct scsi_device *sdev)
 {
 	struct ufs_hba *hba;
+	struct request_queue *q = sdev->request_queue;
 
 	hba = shost_priv(sdev->host);
 	/* Drop the reference as it won't be needed anymore */
@@ -4654,6 +4718,8 @@ static void ufshcd_slave_destroy(struct scsi_device *sdev)
 		hba->sdev_ufs_device = NULL;
 		spin_unlock_irqrestore(hba->host->host_lock, flags);
 	}
+
+	ufshcd_crypto_destroy_rq_keyslot_manager(hba, q);
 }
 
 /**
@@ -8380,6 +8446,13 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	/* Reset the attached device */
 	ufshcd_vops_device_reset(hba);
 
+	/* Init crypto */
+	err = ufshcd_hba_init_crypto(hba);
+	if (err) {
+		dev_err(hba->dev, "crypto setup failed\n");
+		goto out_remove_scsi_host;
+	}
+
 	/* Host controller enable */
 	err = ufshcd_hba_enable(hba);
 	if (err) {
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 31e64f4267dd..a106b45f8358 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -167,6 +167,9 @@ struct ufs_pm_lvl_states {
  * @intr_cmd: Interrupt command (doesn't participate in interrupt aggregation)
  * @issue_time_stamp: time stamp for debug purposes
  * @compl_time_stamp: time stamp for statistics
+ * @crypto_enable: whether or not the request needs inline crypto operations
+ * @crypto_key_slot: the key slot to use for inline crypto
+ * @data_unit_num: the data unit number for the first block for inline crypto
  * @req_abort_skip: skip request abort task flag
  */
 struct ufshcd_lrb {
@@ -191,6 +194,9 @@ struct ufshcd_lrb {
 	bool intr_cmd;
 	ktime_t issue_time_stamp;
 	ktime_t compl_time_stamp;
+	bool crypto_enable;
+	u8 crypto_key_slot;
+	u64 data_unit_num;
 
 	bool req_abort_skip;
 };
-- 
2.24.0.rc0.303.g954a862665-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
