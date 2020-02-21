Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 850F5167D45
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 13:18:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=moefY4jl0bMIC2CggoU3n/ZNflsSIVzOZOyZEPhdGvM=; b=ATUYU53oWjiby8045HszYFuPz
	uEjNABVNkJO9n4xDHA+uKl86GH8dsGFMNF/6kiP7syKEfEHMfpM3GDqpWYpXLaWOWSfop0yLMr6kj
	9jP7bOUVQV0n7opmquMsTt/DQnepv1e3zAj6mBt34/dDrjYd8MsJPGZQy9+d0+QxGGsQQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j57G4-0007Lm-Pn; Fri, 21 Feb 2020 12:18:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3M8RPXgYKAPImUnsUnaiiafY.Wig@flex--satyat.bounces.google.com>)
 id 1j57G3-0007Le-Lr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 12:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tMmHCwZpNQDayKfNyc/8fq4LxPlbIZSlYFRxsRl0hhY=; b=mTZR7mvBzIv2qZVwZtJBu/4ak
 pfl+2yeN3Lkzq2RU/Q2ChomlPo9bwaBAKVocklKTjVqif2PzCQmDc9PCfmRSGKJPR1Yuev0+Sc7B8
 X0pIPk3eYK30BLq6jg/OJgrWcVY+Lpfqu4QfdTPfAxY/Jh/VQDB1sq9G3DFkAwwsCUUMw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tMmHCwZpNQDayKfNyc/8fq4LxPlbIZSlYFRxsRl0hhY=; b=YqGjcq15KEJLVZzFFMAW9hOzNc
 P9zsuo4hnXDIsKIF+Qo5yKQYEULZjw7QMRzmX/fyLqBp+PEleL4BvfNg6xnnrBPs0R7R0S/I2yQPv
 hUCXdrF+m+7IdVesehnGqpgCLjjcx1EVKoki1DmdLkMInVXJnX4+14OBYDRcxhw5rKDY=;
Received: from mail-il1-f201.google.com ([209.85.166.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1j57Fz-00ChaL-V9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 12:18:15 +0000
Received: by mail-il1-f201.google.com with SMTP id m18so2377120ill.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Feb 2020 04:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=tMmHCwZpNQDayKfNyc/8fq4LxPlbIZSlYFRxsRl0hhY=;
 b=LxCnq4GSSYvGLy2sKhPpV+J/PcO/iyzzOU6AEGbTjeiE2LeIChH/T+hKUZptYjlWwL
 2Hh2B8BTGUo/3ZwBKs+0/t7aNggmhfmImaDZ+nBtyc+C13upYafB6yeiuh8LjY6HjMA4
 KlOM7z97+Je7Awcr08cPn+5Q1wHKPNz57KW53hNgpUSVobPgkORF4bk0QBrA8J+avVE5
 xbAGs0U3iaXxe8XrbBnLFWyfUSYZFVz3RYhrN6iWcnDJ2UA5UtSG/RPv0rIwMAPboKY5
 ZjMbaI4ErpKi7kdxk8AHJokbKSbqkAslkYTcA0RaER8qdnFEy0eNJHwIO+UGk77/9VNn
 A18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=tMmHCwZpNQDayKfNyc/8fq4LxPlbIZSlYFRxsRl0hhY=;
 b=dt2etnUrTFaBItK1VmkeJ+6hC6I/IySi6Ba1bKdgdvr3d6lD3s5opA2VfqYKyOXM7/
 ktmVOYYt9bp+0Bodnnh25JpLSKMVsDUB8hRVeECWY9+uNEAJhh0duxIz1VgYjZavFZzj
 /aMQOmDfqmCpothCg42PpRmAQntNVYZa7PWf8NEhptNRaDEwmkAABog32uNCYa8AfSpk
 eWwP5Wj62tF9+wBoWTXGDC3LUgAXWEtFOM2jVj0dj/GePxXuaNPJqNSTjaQaCh3nFafM
 DkbzkriEtR8WOoKvDUNV4pexHJRxdFc5rJPIMbWNtdA1kO2EdvBewPr+fjRNAvj9Tl9S
 zNCw==
X-Gm-Message-State: APjAAAWJTOy6DFggx93xbnVxXkv0BLY+4hGAa6HcVhj4vv6LIj+zRsHi
 SqWWN8j8zbDZRVdeluZpcrYQhOpV1Ww=
X-Google-Smtp-Source: APXvYqwKNXtIcmoRCsApb2kfgvvmXBbmRmjqK2UlW4K24hb3Kl91/DJP5txJB1ItUyL1rB18cvDmGtQI6dA=
X-Received: by 2002:a63:504f:: with SMTP id q15mr37991367pgl.8.1582285875116; 
 Fri, 21 Feb 2020 03:51:15 -0800 (PST)
Date: Fri, 21 Feb 2020 03:50:47 -0800
In-Reply-To: <20200221115050.238976-1-satyat@google.com>
Message-Id: <20200221115050.238976-7-satyat@google.com>
Mime-Version: 1.0
References: <20200221115050.238976-1-satyat@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googlesource.com]
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
X-Headers-End: 1j57Fz-00ChaL-V9
Subject: [f2fs-dev] [PATCH v7 6/9] scsi: ufs: Add inline encryption support
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

Also, introduce UFSHCD_QUIRK_BROKEN_CRYPTO that certain UFS drivers
that don't yet support inline encryption need to use - taken from
patches by John Stultz <john.stultz@linaro.org>
(https://android-review.googlesource.com/c/kernel/common/+/1162224/5)
(https://android-review.googlesource.com/c/kernel/common/+/1162225/5)
(https://android-review.googlesource.com/c/kernel/common/+/1164506/1)

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 drivers/scsi/ufs/ufs-hisi.c      |  8 +++++
 drivers/scsi/ufs/ufs-qcom.c      |  7 ++++
 drivers/scsi/ufs/ufshcd-crypto.c | 26 ++++++++++++++
 drivers/scsi/ufs/ufshcd-crypto.h | 14 ++++++++
 drivers/scsi/ufs/ufshcd.c        | 59 +++++++++++++++++++++++++++++---
 drivers/scsi/ufs/ufshcd.h        |  8 +++++
 6 files changed, 117 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-hisi.c b/drivers/scsi/ufs/ufs-hisi.c
index 5d6487350a6c..fa9d4d1c43c9 100644
--- a/drivers/scsi/ufs/ufs-hisi.c
+++ b/drivers/scsi/ufs/ufs-hisi.c
@@ -475,6 +475,14 @@ static int ufs_hisi_init_common(struct ufs_hba *hba)
 	if (!host)
 		return -ENOMEM;
 
+	/*
+	 * Inline crypto is currently broken with ufs-hisi because the keyslots
+	 * overlap with the vendor-specific SYS CTRL registers -- and even if
+	 * software uses only non-overlapping keyslots, the kernel crashes when
+	 * programming a key or a UFS error occurs on the first encrypted I/O.
+	 */
+	hba->quirks |= UFSHCD_QUIRK_BROKEN_CRYPTO;
+
 	host->hba = hba;
 	ufshcd_set_variant(hba, host);
 
diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index c69c29a1ceb9..4b2ec3745a16 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -1002,6 +1002,13 @@ static void ufs_qcom_advertise_quirks(struct ufs_hba *hba)
 				| UFSHCD_QUIRK_DME_PEER_ACCESS_AUTO_MODE
 				| UFSHCD_QUIRK_BROKEN_PA_RXHSUNTERMCAP);
 	}
+
+	/*
+	 * Inline crypto is currently broken with ufs-qcom at least because the
+	 * device tree doesn't include the crypto registers.  There are likely
+	 * to be other issues that will need to be addressed too.
+	 */
+	hba->quirks |= UFSHCD_QUIRK_BROKEN_CRYPTO;
 }
 
 static void ufs_qcom_set_caps(struct ufs_hba *hba)
diff --git a/drivers/scsi/ufs/ufshcd-crypto.c b/drivers/scsi/ufs/ufshcd-crypto.c
index 1b8e14d30c04..cd7ca50a1dd9 100644
--- a/drivers/scsi/ufs/ufshcd-crypto.c
+++ b/drivers/scsi/ufs/ufshcd-crypto.c
@@ -365,3 +365,29 @@ void ufshcd_crypto_destroy_keyslot_manager(struct ufs_hba *hba)
 {
 	blk_ksm_destroy(&hba->ksm);
 }
+
+int ufshcd_prepare_lrbp_crypto(struct ufs_hba *hba,
+			       struct scsi_cmnd *cmd,
+			       struct ufshcd_lrb *lrbp)
+{
+	struct rq_crypt_ctx *rc = &cmd->request->rq_crypt_ctx;
+	struct bio_crypt_ctx *bc = rc->bc;
+
+	lrbp->crypto_enable = false;
+
+	if (WARN_ON(!(hba->caps & UFSHCD_CAP_CRYPTO))) {
+		/*
+		 * Upper layer asked us to do inline encryption
+		 * but that isn't enabled, so we fail this request.
+		 */
+		return -EINVAL;
+	}
+	if (!ufshcd_keyslot_valid(hba, rc->keyslot))
+		return -EINVAL;
+
+	lrbp->crypto_enable = true;
+	lrbp->crypto_key_slot = rc->keyslot;
+	lrbp->data_unit_num = bc->bc_dun[0];
+
+	return 0;
+}
diff --git a/drivers/scsi/ufs/ufshcd-crypto.h b/drivers/scsi/ufs/ufshcd-crypto.h
index 8270c0c5081a..c76f93ede51c 100644
--- a/drivers/scsi/ufs/ufshcd-crypto.h
+++ b/drivers/scsi/ufs/ufshcd-crypto.h
@@ -16,6 +16,15 @@ static inline bool ufshcd_hba_is_crypto_supported(struct ufs_hba *hba)
 	return hba->crypto_capabilities.reg_val != 0;
 }
 
+int ufshcd_prepare_lrbp_crypto(struct ufs_hba *hba,
+			       struct scsi_cmnd *cmd,
+			       struct ufshcd_lrb *lrbp);
+
+static inline bool ufshcd_lrbp_crypto_enabled(struct ufshcd_lrb *lrbp)
+{
+	return lrbp->crypto_enable;
+}
+
 void ufshcd_crypto_enable(struct ufs_hba *hba);
 
 void ufshcd_crypto_disable(struct ufs_hba *hba);
@@ -49,6 +58,11 @@ static inline void ufshcd_crypto_setup_rq_keyslot_manager(struct ufs_hba *hba,
 static inline void ufshcd_crypto_destroy_keyslot_manager(struct ufs_hba *hba)
 { }
 
+static inline bool ufshcd_lrbp_crypto_enabled(struct ufshcd_lrb *lrbp)
+{
+	return false;
+}
+
 #endif /* CONFIG_SCSI_UFS_CRYPTO */
 
 #endif /* _UFSHCD_CRYPTO_H */
diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 825d9eb34f10..9ecfc10feafb 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -47,6 +47,7 @@
 #include "unipro.h"
 #include "ufs-sysfs.h"
 #include "ufs_bsg.h"
+#include "ufshcd-crypto.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/ufs.h>
@@ -816,7 +817,14 @@ static void ufshcd_enable_run_stop_reg(struct ufs_hba *hba)
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
@@ -2192,9 +2200,23 @@ static void ufshcd_prepare_req_desc_hdr(struct ufshcd_lrb *lrbp,
 		dword_0 |= UTP_REQ_DESC_INT_CMD;
 
 	/* Transfer request descriptor header fields */
+	if (ufshcd_lrbp_crypto_enabled(lrbp)) {
+#ifdef CONFIG_SCSI_UFS_CRYPTO
+		dword_0 |= UTP_REQ_DESC_CRYPTO_ENABLE_CMD;
+		dword_0 |= lrbp->crypto_key_slot;
+		req_desc->header.dword_1 =
+			cpu_to_le32(lower_32_bits(lrbp->data_unit_num));
+		req_desc->header.dword_3 =
+			cpu_to_le32(upper_32_bits(lrbp->data_unit_num));
+#endif /* CONFIG_SCSI_UFS_CRYPTO */
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
@@ -2202,8 +2224,6 @@ static void ufshcd_prepare_req_desc_hdr(struct ufshcd_lrb *lrbp,
 	 */
 	req_desc->header.dword_2 =
 		cpu_to_le32(OCS_INVALID_COMMAND_STATUS);
-	/* dword_3 is reserved, hence it is set to 0 */
-	req_desc->header.dword_3 = 0;
 
 	req_desc->prd_table_length = 0;
 }
@@ -2437,6 +2457,20 @@ static int ufshcd_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *cmd)
 	lrbp->task_tag = tag;
 	lrbp->lun = ufshcd_scsi_to_upiu_lun(cmd->device->lun);
 	lrbp->intr_cmd = !ufshcd_is_intr_aggr_allowed(hba) ? true : false;
+
+#ifdef CONFIG_SCSI_UFS_CRYPTO
+	if (cmd->request->rq_crypt_ctx.keyslot >= 0) {
+		err = ufshcd_prepare_lrbp_crypto(hba, cmd, lrbp);
+		if (err) {
+			lrbp->cmd = NULL;
+			ufshcd_release(hba);
+			goto out;
+		}
+	} else {
+		lrbp->crypto_enable = false;
+	}
+#endif
+
 	lrbp->req_abort_skip = false;
 
 	ufshcd_comp_scsi_upiu(hba, lrbp);
@@ -2470,6 +2504,9 @@ static int ufshcd_compose_dev_cmd(struct ufs_hba *hba,
 	lrbp->task_tag = tag;
 	lrbp->lun = 0; /* device management cmd is not specific to any LUN */
 	lrbp->intr_cmd = true; /* No interrupt aggregation */
+#ifdef CONFIG_SCSI_UFS_CRYPTO
+	lrbp->crypto_enable = false; /* No crypto operations */
+#endif
 	hba->dev_cmd.type = cmd_type;
 
 	return ufshcd_comp_devman_upiu(hba, lrbp);
@@ -4208,6 +4245,8 @@ static inline void ufshcd_hba_stop(struct ufs_hba *hba, bool can_sleep)
 {
 	int err;
 
+	ufshcd_crypto_disable(hba);
+
 	ufshcd_writel(hba, CONTROLLER_DISABLE,  REG_CONTROLLER_ENABLE);
 	err = ufshcd_wait_for_register(hba, REG_CONTROLLER_ENABLE,
 					CONTROLLER_ENABLE, CONTROLLER_DISABLE,
@@ -4624,6 +4663,8 @@ static int ufshcd_slave_configure(struct scsi_device *sdev)
 	if (ufshcd_is_rpm_autosuspend_allowed(hba))
 		sdev->rpm_autosuspend = 1;
 
+	ufshcd_crypto_setup_rq_keyslot_manager(hba, q);
+
 	return 0;
 }
 
@@ -8304,6 +8345,7 @@ EXPORT_SYMBOL_GPL(ufshcd_remove);
  */
 void ufshcd_dealloc_host(struct ufs_hba *hba)
 {
+	ufshcd_crypto_destroy_keyslot_manager(hba);
 	scsi_host_put(hba->host);
 }
 EXPORT_SYMBOL_GPL(ufshcd_dealloc_host);
@@ -8513,6 +8555,13 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
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
index 7b8a87418f0c..c8f948aa5e3d 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -168,6 +168,9 @@ struct ufs_pm_lvl_states {
  * @intr_cmd: Interrupt command (doesn't participate in interrupt aggregation)
  * @issue_time_stamp: time stamp for debug purposes
  * @compl_time_stamp: time stamp for statistics
+ * @crypto_enable: whether or not the request needs inline crypto operations
+ * @crypto_key_slot: the key slot to use for inline crypto
+ * @data_unit_num: the data unit number for the first block for inline crypto
  * @req_abort_skip: skip request abort task flag
  */
 struct ufshcd_lrb {
@@ -192,6 +195,11 @@ struct ufshcd_lrb {
 	bool intr_cmd;
 	ktime_t issue_time_stamp;
 	ktime_t compl_time_stamp;
+#if IS_ENABLED(CONFIG_SCSI_UFS_CRYPTO)
+	bool crypto_enable;
+	u8 crypto_key_slot;
+	u64 data_unit_num;
+#endif /* CONFIG_SCSI_UFS_CRYPTO */
 
 	bool req_abort_skip;
 };
-- 
2.25.0.265.gbab2e86ba0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
