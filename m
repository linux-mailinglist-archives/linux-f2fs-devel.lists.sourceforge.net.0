Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 969701D23DA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 May 2020 02:37:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1WcsyP3UQ822mLXbtv5+3KkXSKZxwSb+zZyFEg7WJi0=; b=NL1ljhmRSwTbifiD1OUphSRj0
	6/5eoVFI+oYjet5a2xyMopB1aGT32pARALfmQto0qmqIXIDyVv6s05NV/P9AiiTII6wlVyz9YONyG
	FGetPy6IGMZFQ6PA+bLW8s94bSI4msJjgWUEoF26BC2XJR90DAT11AIqiGWYU6JRjmtUc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jZ1ss-0008LZ-Dj; Thu, 14 May 2020 00:37:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <325K8XgYKAO4iQjoQjWeeWbU.Sec@flex--satyat.bounces.google.com>)
 id 1jZ1sq-0008LS-Qz
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 May 2020 00:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YxoSL61UxbuGWd2Bh/T5HPoscTp7W3by3/2EPDBli74=; b=HdlRKoRdoN6bbh+Vm6VC9EPzB
 IELfw25g6rhCWn8S8yqfmzWUb9c5EMQi7aUqfdqi2//OOE9/bmDBW3TndrA7JpNzyDMnTA1M04hws
 ox4tQPNpEJ5vLw31s7AsB4R6hnU6EHLIpaN+ZZCQZNqVcjsD5lh7PsCByNmgiPoA+Vmx0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YxoSL61UxbuGWd2Bh/T5HPoscTp7W3by3/2EPDBli74=; b=H9rQFwjwy35Nxju323Lfu68srZ
 BUf6Q2tyJFoqHYS1j7OmhuPpIUIOA9B+XRbDsWsL6VumMeAC4Srf7UcET6N3iYfXtjF+bM1dmxMp2
 uyf+8matU7IBhXtHxowWUr9sRL6YQLraHKD+dywT9tqgvuFcgkzEH4wkSfORgVOQWOPw=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jZ1sn-00Ed8k-CZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 May 2020 00:37:56 +0000
Received: by mail-yb1-f202.google.com with SMTP id i2so1697294ybg.17
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 May 2020 17:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=YxoSL61UxbuGWd2Bh/T5HPoscTp7W3by3/2EPDBli74=;
 b=RbY7xaY2MznKdEgcBF811T5K/V2tyI7BktAOp03yr1F3ZvWf4OPJvLg77rtlkDuAKg
 hVaCgb9PoOmfLmA4DFs5P08CXdXEHjNXIBk6rGfyb/i+QNXPXPMHTAJJ85zFBILN13Wp
 Yy3klw91X7x2WHzz9u+mr/IuVll5pIP+hNuq10brUq2XMgutjtCfgV5lfH2SwEdVprz4
 ckaihRUBiX1g8+7LaNVjEqgs7/tbu/3P3WsZD6MX4ZasYThjE+UQ2Qx7ivpaS+JgU9Nu
 TUhVTTZOSuRrogSxoI3rSQvYB8482svdeAzldCGgBIH8Pwf/nkfBnJ8b/a+IlHZzf6Db
 t2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=YxoSL61UxbuGWd2Bh/T5HPoscTp7W3by3/2EPDBli74=;
 b=nqD6iNT6ogMrIHF5NpDWWBl4mYwF2G76h9K2WTtl4/swSu98BVs67+B9ybBnIevWa5
 tqQy/eCLBbZG/Y8S7eDuAYMnex/pl+HOKf/mdBdM387qjz4qutzBepevhRe9QqkVGqup
 yXOPYslfqyELQA5+3v/9jahaREH+YXyaKurS5e7+95oOotVW/avlDuC2GVqPMEJFvJKr
 M8DVSqJKvxQ3WGHqBWoEe3NqLLbZ+u6rt6ku7iuiyEcEMuFFl/ZQKhJkCt20N5ZhqD6Q
 mkmzIQlnYFUYPYcikn/36MzugByth2oVVSM/C/cQD6FMQK/wdpmsIm4bRxabAudGN2MS
 T1XQ==
X-Gm-Message-State: AOAM530C4yAtEh8LFwHVr/ARzIZ5LD4b+g/JGJ4bdpDj0bNFmnWJGCsl
 1Ev1trCwXihvceTraU1yI6WXLtxi8Vo=
X-Google-Smtp-Source: ABdhPJxtmfCexpOxpdE7bUZ0NwLazkz46J6Z7cCihPdFyG5nB3T3UZgP2l4G8/6dtUiUTSaM5pmRdIJaxO0=
X-Received: by 2002:a25:7801:: with SMTP id t1mr2934027ybc.410.1589416667463; 
 Wed, 13 May 2020 17:37:47 -0700 (PDT)
Date: Thu, 14 May 2020 00:37:23 +0000
In-Reply-To: <20200514003727.69001-1-satyat@google.com>
Message-Id: <20200514003727.69001-9-satyat@google.com>
Mime-Version: 1.0
References: <20200514003727.69001-1-satyat@google.com>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1jZ1sn-00Ed8k-CZ
Subject: [f2fs-dev] [PATCH v13 08/12] scsi: ufs: Add inline encryption
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
 drivers/scsi/ufs/ufshcd-crypto.h | 18 +++++++++++++
 drivers/scsi/ufs/ufshcd.c        | 44 ++++++++++++++++++++++++++++----
 drivers/scsi/ufs/ufshcd.h        |  6 +++++
 3 files changed, 63 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd-crypto.h b/drivers/scsi/ufs/ufshcd-crypto.h
index 22677619de595..9578edb63e7b4 100644
--- a/drivers/scsi/ufs/ufshcd-crypto.h
+++ b/drivers/scsi/ufs/ufshcd-crypto.h
@@ -10,6 +10,20 @@
 #include "ufshcd.h"
 #include "ufshci.h"
 
+static inline void ufshcd_prepare_lrbp_crypto(struct ufs_hba *hba,
+					      struct scsi_cmnd *cmd,
+					      struct ufshcd_lrb *lrbp)
+{
+	struct request *rq = cmd->request;
+
+	if (rq->crypt_keyslot) {
+		lrbp->crypto_key_slot = blk_ksm_get_slot_idx(rq->crypt_keyslot);
+		lrbp->data_unit_num = rq->crypt_ctx->bc_dun[0];
+	} else {
+		lrbp->crypto_key_slot = -1;
+	}
+}
+
 bool ufshcd_crypto_enable(struct ufs_hba *hba);
 
 int ufshcd_hba_init_crypto(struct ufs_hba *hba);
@@ -21,6 +35,10 @@ void ufshcd_crypto_destroy_keyslot_manager(struct ufs_hba *hba);
 
 #else /* CONFIG_SCSI_UFS_CRYPTO */
 
+static inline void ufshcd_prepare_lrbp_crypto(struct ufs_hba *hba,
+					      struct scsi_cmnd *cmd,
+					      struct ufshcd_lrb *lrbp) { }
+
 static inline bool ufshcd_crypto_enable(struct ufs_hba *hba)
 {
 	return false;
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 2435c600cb2d9..f087270165e96 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -48,6 +48,7 @@
 #include "unipro.h"
 #include "ufs-sysfs.h"
 #include "ufs_bsg.h"
+#include "ufshcd-crypto.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/ufs.h>
@@ -812,7 +813,12 @@ static void ufshcd_enable_run_stop_reg(struct ufs_hba *hba)
  */
 static inline void ufshcd_hba_start(struct ufs_hba *hba)
 {
-	ufshcd_writel(hba, CONTROLLER_ENABLE, REG_CONTROLLER_ENABLE);
+	u32 val = CONTROLLER_ENABLE;
+
+	if (ufshcd_crypto_enable(hba))
+		val |= CRYPTO_GENERAL_ENABLE;
+
+	ufshcd_writel(hba, val, REG_CONTROLLER_ENABLE);
 }
 
 /**
@@ -2220,6 +2226,8 @@ static void ufshcd_prepare_req_desc_hdr(struct ufshcd_lrb *lrbp,
 	struct utp_transfer_req_desc *req_desc = lrbp->utr_descriptor_ptr;
 	u32 data_direction;
 	u32 dword_0;
+	u32 dword_1 = 0;
+	u32 dword_3 = 0;
 
 	if (cmd_dir == DMA_FROM_DEVICE) {
 		data_direction = UTP_DEVICE_TO_HOST;
@@ -2238,9 +2246,17 @@ static void ufshcd_prepare_req_desc_hdr(struct ufshcd_lrb *lrbp,
 		dword_0 |= UTP_REQ_DESC_INT_CMD;
 
 	/* Transfer request descriptor header fields */
+#ifdef CONFIG_SCSI_UFS_CRYPTO
+	if (lrbp->crypto_key_slot >= 0) {
+		dword_0 |= UTP_REQ_DESC_CRYPTO_ENABLE_CMD;
+		dword_0 |= lrbp->crypto_key_slot;
+		dword_1 = lower_32_bits(lrbp->data_unit_num);
+		dword_3 = upper_32_bits(lrbp->data_unit_num);
+	}
+#endif /* CONFIG_SCSI_UFS_CRYPTO */
+
 	req_desc->header.dword_0 = cpu_to_le32(dword_0);
-	/* dword_1 is reserved, hence it is set to 0 */
-	req_desc->header.dword_1 = 0;
+	req_desc->header.dword_1 = cpu_to_le32(dword_1);
 	/*
 	 * assigning invalid value for command status. Controller
 	 * updates OCS on command completion, with the command
@@ -2248,8 +2264,7 @@ static void ufshcd_prepare_req_desc_hdr(struct ufshcd_lrb *lrbp,
 	 */
 	req_desc->header.dword_2 =
 		cpu_to_le32(OCS_INVALID_COMMAND_STATUS);
-	/* dword_3 is reserved, hence it is set to 0 */
-	req_desc->header.dword_3 = 0;
+	req_desc->header.dword_3 = cpu_to_le32(dword_3);
 
 	req_desc->prd_table_length = 0;
 }
@@ -2504,6 +2519,9 @@ static int ufshcd_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *cmd)
 	lrbp->task_tag = tag;
 	lrbp->lun = ufshcd_scsi_to_upiu_lun(cmd->device->lun);
 	lrbp->intr_cmd = !ufshcd_is_intr_aggr_allowed(hba) ? true : false;
+
+	ufshcd_prepare_lrbp_crypto(hba, cmd, lrbp);
+
 	lrbp->req_abort_skip = false;
 
 	ufshcd_comp_scsi_upiu(hba, lrbp);
@@ -2537,6 +2555,9 @@ static int ufshcd_compose_dev_cmd(struct ufs_hba *hba,
 	lrbp->task_tag = tag;
 	lrbp->lun = 0; /* device management cmd is not specific to any LUN */
 	lrbp->intr_cmd = true; /* No interrupt aggregation */
+#ifdef CONFIG_SCSI_UFS_CRYPTO
+	lrbp->crypto_key_slot = -1; /* No crypto operations */
+#endif
 	hba->dev_cmd.type = cmd_type;
 
 	return ufshcd_comp_devman_upiu(hba, lrbp);
@@ -4625,6 +4646,8 @@ static int ufshcd_slave_configure(struct scsi_device *sdev)
 	if (ufshcd_is_rpm_autosuspend_allowed(hba))
 		sdev->rpm_autosuspend = 1;
 
+	ufshcd_crypto_setup_rq_keyslot_manager(hba, q);
+
 	return 0;
 }
 
@@ -5905,6 +5928,9 @@ static int ufshcd_issue_devman_upiu_cmd(struct ufs_hba *hba,
 	lrbp->task_tag = tag;
 	lrbp->lun = 0;
 	lrbp->intr_cmd = true;
+#ifdef CONFIG_SCSI_UFS_CRYPTO
+	lrbp->crypto_key_slot = -1; /* No crypto operations */
+#endif
 	hba->dev_cmd.type = cmd_type;
 
 	switch (hba->ufs_version) {
@@ -8331,6 +8357,7 @@ EXPORT_SYMBOL_GPL(ufshcd_remove);
  */
 void ufshcd_dealloc_host(struct ufs_hba *hba)
 {
+	ufshcd_crypto_destroy_keyslot_manager(hba);
 	scsi_host_put(hba->host);
 }
 EXPORT_SYMBOL_GPL(ufshcd_dealloc_host);
@@ -8541,6 +8568,13 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	/* Reset the attached device */
 	ufshcd_vops_device_reset(hba);
 
+	/* Init crypto */
+	err = ufshcd_hba_init_crypto(hba);
+	if (err) {
+		dev_err(hba->dev, "crypto setup failed\n");
+		goto free_tmf_queue;
+	}
+
 	/* Host controller enable */
 	err = ufshcd_hba_enable(hba);
 	if (err) {
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index c935ebb16cba3..bc2f945d3f5f5 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -183,6 +183,8 @@ struct ufs_pm_lvl_states {
  * @intr_cmd: Interrupt command (doesn't participate in interrupt aggregation)
  * @issue_time_stamp: time stamp for debug purposes
  * @compl_time_stamp: time stamp for statistics
+ * @crypto_key_slot: the key slot to use for inline crypto (-1 if none)
+ * @data_unit_num: the data unit number for the first block for inline crypto
  * @req_abort_skip: skip request abort task flag
  */
 struct ufshcd_lrb {
@@ -207,6 +209,10 @@ struct ufshcd_lrb {
 	bool intr_cmd;
 	ktime_t issue_time_stamp;
 	ktime_t compl_time_stamp;
+#ifdef CONFIG_SCSI_UFS_CRYPTO
+	int crypto_key_slot;
+	u64 data_unit_num;
+#endif
 
 	bool req_abort_skip;
 };
-- 
2.26.2.645.ge9eca65c58-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
