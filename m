Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4AC36877
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jun 2019 01:58:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xkM7TVJSGj18XGrdjKCcAfUiLJ+IL8WVv7ZZCf9bH5w=; b=JmJXqIU28sYA2KAIVeQopzpli
	DD3xsDCU3Uixbqz6SNUi08r/3tjorMqji2c9moBbdtIzkKTggFVFCdKO7eacZkDmItoVgQVBfiB8X
	bz89ksdy6QdtbJ8ggkH+9Ewadytv3cbwQagr0OQjll1oECFrbwUc/bBFGejDjxeQEqVsI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hYfnD-0007eb-QE; Wed, 05 Jun 2019 23:58:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3QFD4XAYKAK8hPinPiVddVaT.Rdb@flex--satyat.bounces.google.com>)
 id 1hYfnB-0007eJ-Hw
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Jun 2019 23:58:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g59Z2pJDpjx0iOGjFBxnzdfuaNuQJt/JKIioIBNHw/U=; b=ZOBVStToJF3vhPDwz/6ML24l2
 XeGHN5b1tbR+l/LqIMhDhCWS5ff4wYtgbB9AQcqi0rqP5UnrlY0hueScU0N0UzjaE+XQfiZ/VUYhk
 YshGfX3GAvHiedJOmuicHo9QgHbhrpybviWvHbto+oEcbuXZNRpiggJIeapMwnmywBa08=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g59Z2pJDpjx0iOGjFBxnzdfuaNuQJt/JKIioIBNHw/U=; b=j1GQTXjfl/pFrRQsLaiHDbJhJG
 NgZAKJ1YVKJq6obK7C6FDTpPKLAIvxZKE2rJQx+SMKr5aVsApuhIPUGryAB8OIqQCuqw4xQR03Ww2
 lIT7KEv0qlQa2Ac7EqPTc2WSGTZAYnVcBMJYcgUfGhyFoXiWIcvlLDLzvv+o44txfNVo=;
Received: from mail-pl1-f201.google.com ([209.85.214.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hYfn9-002bMI-Oq
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Jun 2019 23:58:05 +0000
Received: by mail-pl1-f201.google.com with SMTP id bc12so360571plb.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 05 Jun 2019 16:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=g59Z2pJDpjx0iOGjFBxnzdfuaNuQJt/JKIioIBNHw/U=;
 b=gMQlqlOSRMuiU56qvSdP+QLmvIfuRnh/69fSN0IsjmXoTSNHzIZC6WoJ2nynpPSfkG
 3NNgzZ6Sse04jj2PT/d6vBmiLEQrPiAi2uRQ/CMZJwJq4BeUK5ynfFo0kEKzMn92yVoV
 waEO+KzC512mbre5IITo+qM3xfphnbeoIuY4gpehlCWn6AHNrMDGwRLl8CXu6urC1Wy0
 omQIgLo7g+aFRJs+Xprk4Z4w+u24Hvbnvdd4uXSzuLDOT+pAVItFD8cPK43bSRkwWlWl
 DGr48nKYH1wdscVy3dfUjuYr6l00/0+HK4WiAbZnZST61ZjFsvfCcX9z4SOJdvj4N7K4
 Guvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=g59Z2pJDpjx0iOGjFBxnzdfuaNuQJt/JKIioIBNHw/U=;
 b=orn6AmsFH1teku+0+fHZh+I9dC0JRePW39xjkARMwhIc3A+EEdQxVizs3lCLkG6BT9
 ZcMi1B/nMklqCV2wiG5jvDQ9LI9FsRDVzF4wL6RBqzV/xvTZc1Bgt/0Uah5KiA/kGjlq
 YqkCoiqL9BJ03tQA0OHSCyIgCthuB7twlyl7ZKDCLRsFBEHEnSwB5/6Kbv3S6A32y0fb
 /6YTsueOENR2GxjrHGw/MEwsdrqQFdzNN5VzMqXFKZrGJr8hs0vypcZKNs8w9xcjYZzK
 uUhG334bUgtlMfR4ZMqhdnDqvgF3vkAcEoaqCG0tbxalMa7+T0rfIouSlneqxncnOqDX
 +vpw==
X-Gm-Message-State: APjAAAU3uLms3IJgh1MnaXTezA7iP9keUDN1xBoMO0k7oKDFrR15HER6
 mhILvIPuuwbiPl5vCcxxfDpSW9vEIrM=
X-Google-Smtp-Source: APXvYqwsd99bPbIM52k3KduTtwG1sY2tLR9JfLZcotvVmNQBnhhr6t58xs5P5Actw7UngE7pfDJQewjAJdc=
X-Received: by 2002:a63:d008:: with SMTP id z8mr358036pgf.335.1559777344469;
 Wed, 05 Jun 2019 16:29:04 -0700 (PDT)
Date: Wed,  5 Jun 2019 16:28:35 -0700
In-Reply-To: <20190605232837.31545-1-satyat@google.com>
Message-Id: <20190605232837.31545-7-satyat@google.com>
Mime-Version: 1.0
References: <20190605232837.31545-1-satyat@google.com>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_MED        DKIMwl.org - Medium sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hYfn9-002bMI-Oq
Subject: [f2fs-dev] [RFC PATCH v2 6/8] scsi: ufs: Add inline encryption
 support to UFS
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
 Ladvine D Almeida <ladvine.dalmeida@synopsys.com>,
 Satya Tangirala <satyat@google.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Parshuram Raju Thombare <pthombar@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Wire up ufshcd.c with the UFS Crypto API, the block layer inline
encryption additions and the keyslot manager.

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 drivers/scsi/ufs/ufshcd.c | 84 ++++++++++++++++++++++++++++++++++++---
 drivers/scsi/ufs/ufshcd.h | 18 +++++++++
 2 files changed, 97 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 8c1c551f2b42..c5ba141ce0cf 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -47,6 +47,7 @@
 #include "unipro.h"
 #include "ufs-sysfs.h"
 #include "ufs_bsg.h"
+#include "ufshcd-crypto.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/ufs.h>
@@ -855,7 +856,14 @@ static void ufshcd_enable_run_stop_reg(struct ufs_hba *hba)
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
@@ -2208,9 +2216,21 @@ static void ufshcd_prepare_req_desc_hdr(struct ufshcd_lrb *lrbp,
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
@@ -2218,8 +2238,6 @@ static void ufshcd_prepare_req_desc_hdr(struct ufshcd_lrb *lrbp,
 	 */
 	req_desc->header.dword_2 =
 		cpu_to_le32(OCS_INVALID_COMMAND_STATUS);
-	/* dword_3 is reserved, hence it is set to 0 */
-	req_desc->header.dword_3 = 0;
 
 	req_desc->prd_table_length = 0;
 }
@@ -2379,6 +2397,37 @@ static inline u16 ufshcd_upiu_wlun_to_scsi_wlun(u8 upiu_wlun_id)
 	return (upiu_wlun_id & ~UFS_UPIU_WLUN_ID) | SCSI_W_LUN_BASE;
 }
 
+static inline int ufshcd_prepare_lrbp_crypto(struct ufs_hba *hba,
+					     struct scsi_cmnd *cmd,
+					     struct ufshcd_lrb *lrbp)
+{
+	int key_slot;
+
+	if (!bio_crypt_should_process(cmd->request->bio,
+					cmd->request->q)) {
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
+	key_slot = bio_crypt_get_slot(cmd->request->bio);
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
@@ -2466,6 +2515,13 @@ static int ufshcd_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *cmd)
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
@@ -2499,6 +2555,7 @@ static int ufshcd_compose_dev_cmd(struct ufs_hba *hba,
 	lrbp->task_tag = tag;
 	lrbp->lun = 0; /* device management cmd is not specific to any LUN */
 	lrbp->intr_cmd = true; /* No interrupt aggregation */
+	lrbp->crypto_enable = false; /* No crypto operations */
 	hba->dev_cmd.type = cmd_type;
 
 	return ufshcd_comp_devman_upiu(hba, lrbp);
@@ -4191,6 +4248,8 @@ static inline void ufshcd_hba_stop(struct ufs_hba *hba, bool can_sleep)
 {
 	int err;
 
+	ufshcd_crypto_disable(hba);
+
 	ufshcd_writel(hba, CONTROLLER_DISABLE,  REG_CONTROLLER_ENABLE);
 	err = ufshcd_wait_for_register(hba, REG_CONTROLLER_ENABLE,
 					CONTROLLER_ENABLE, CONTROLLER_DISABLE,
@@ -4584,10 +4643,13 @@ static int ufshcd_change_queue_depth(struct scsi_device *sdev, int depth)
 static int ufshcd_slave_configure(struct scsi_device *sdev)
 {
 	struct request_queue *q = sdev->request_queue;
+	struct ufs_hba *hba = shost_priv(sdev->host);
 
 	blk_queue_update_dma_pad(q, PRDT_DATA_BYTE_COUNT_PAD - 1);
 	blk_queue_max_segment_size(q, PRDT_DATA_BYTE_COUNT_MAX);
 
+	ufshcd_crypto_setup_rq_keyslot_manager(hba, q);
+
 	return 0;
 }
 
@@ -4598,6 +4660,7 @@ static int ufshcd_slave_configure(struct scsi_device *sdev)
 static void ufshcd_slave_destroy(struct scsi_device *sdev)
 {
 	struct ufs_hba *hba;
+	struct request_queue *q = sdev->request_queue;
 
 	hba = shost_priv(sdev->host);
 	/* Drop the reference as it won't be needed anymore */
@@ -4608,6 +4671,8 @@ static void ufshcd_slave_destroy(struct scsi_device *sdev)
 		hba->sdev_ufs_device = NULL;
 		spin_unlock_irqrestore(hba->host->host_lock, flags);
 	}
+
+	ufshcd_crypto_destroy_rq_keyslot_manager(q);
 }
 
 /**
@@ -4723,6 +4788,8 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp)
 	case OCS_MISMATCH_RESP_UPIU_SIZE:
 	case OCS_PEER_COMM_FAILURE:
 	case OCS_FATAL_ERROR:
+	case OCS_INVALID_CRYPTO_CONFIG:
+	case OCS_GENERAL_CRYPTO_ERROR:
 	default:
 		result |= DID_ERROR << 16;
 		dev_err(hba->dev,
@@ -8290,6 +8357,13 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 		goto exit_gating;
 	}
 
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
index d3b6a6b57a37..283014e0924f 100644
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
@@ -501,6 +507,10 @@ struct ufs_stats {
  * @is_urgent_bkops_lvl_checked: keeps track if the urgent bkops level for
  *  device is known or not.
  * @scsi_block_reqs_cnt: reference counting for scsi block requests
+ * @crypto_capabilities: Content of crypto capabilities register (0x100)
+ * @crypto_cap_array: Array of crypto capabilities
+ * @crypto_cfg_register: Start of the crypto cfg array
+ * @crypto_cfgs: Array of crypto configurations (i.e. config for each slot)
  */
 struct ufs_hba {
 	void __iomem *mmio_base;
@@ -711,6 +721,14 @@ struct ufs_hba {
 
 	struct device		bsg_dev;
 	struct request_queue	*bsg_queue;
+
+#ifdef CONFIG_SCSI_UFS_CRYPTO
+	/* crypto */
+	union ufs_crypto_capabilities crypto_capabilities;
+	union ufs_crypto_cap_entry *crypto_cap_array;
+	u32 crypto_cfg_register;
+	union ufs_crypto_cfg_entry *crypto_cfgs;
+#endif /* CONFIG_SCSI_UFS_CRYPTO */
 };
 
 /* Returns true if clocks can be gated. Otherwise false */
-- 
2.22.0.rc1.311.g5d7573a151-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
