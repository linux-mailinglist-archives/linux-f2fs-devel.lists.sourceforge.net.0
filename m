Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E77241A1A9D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Apr 2020 05:57:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BOY/tB7rPD/r3UVoQ2uhta3WeYI72H2BG8QcMQYQvsg=; b=TU1T7B7MaZqwZL3CjipfrrUu0
	AuL/H64kefiSryBS3wDlGX1ZW06ppECOKemHeONsbbg9tJyDn3g4j9fbwCpehX78NsskOHI5jbWI7
	kKIQH2oHSPY2A0Rlj9iYUioe7REczDhxCWApx8T5XLHGPlL5EH2wSc74VIMV1NCoX5m/8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jM1qH-0007tD-O7; Wed, 08 Apr 2020 03:57:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3o0uNXgYKAGoaIbgIbOWWOTM.KWU@flex--satyat.bounces.google.com>)
 id 1jM1qG-0007t3-3Z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Apr 2020 03:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5K05Xoh+SUd9/3sbKxNGQzWXEU2C4ODqRTQbgXmNJ50=; b=U9HKZ9ViJ9BndIVfJfmWN9UHE
 QWY1P4EaSei2G2zla4zG+DVgihIs3sG5Ojf6WnZCpxbvyA4xA0u78beo+RB8Ze12hrnAZjILdrlKl
 qdwuSpvXCnIf+sfuTTlFi8OX5LyUIKWiz3qTF1iyTT64NJLD0EzNOPyiq+IjM9dy0ygMY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5K05Xoh+SUd9/3sbKxNGQzWXEU2C4ODqRTQbgXmNJ50=; b=H3PzdRr8RnEBNrJCnZ88DmylJ3
 7H4DCyMnNKPA0gg686O6agl+OqprLLoBb7TWyXf94d9woPodnhRQ+n8L9wXjg+Dl8aru4tlbHSFiW
 P5fiJVtlQEwrBUIYetldmqUk4B5l4ltKeEEAsNz8Fj2IhgDlMmc+sCess42BDOgnwsm8=;
Received: from mail-pg1-f201.google.com ([209.85.215.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jM1qD-0075Iv-Ce
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Apr 2020 03:57:32 +0000
Received: by mail-pg1-f201.google.com with SMTP id z29so3346190pgc.23
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 07 Apr 2020 20:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=5K05Xoh+SUd9/3sbKxNGQzWXEU2C4ODqRTQbgXmNJ50=;
 b=dwkCO7oCtvUY5vnzfBf0f9j/42FQp2cf/I0ujOSIsTG6ZoJA6cSR2Pju0jDTC0n1em
 X5B026kegrPUkCgWXrRMjp8ttYJ0TwPTCVuY42yqAcDYAdyN2B2k1kjvCSsEbGULkcmn
 LVkZcpwmhxJbiHhwBQmtrlbg3ciwcXay0kfTsI6hFSguBIAZMvvettefG7REQi4TsEte
 ZPKC5kd+MI56tWIJl57hK4Jvv5IQkBOMYIhqZJ/FEGN9qb0DH/wIyXLFjOtXIo4VLiVu
 Y1SqvOsbuPnyvu0Q0268tsDXFcpkDKM7Ya7/Imju9oLg7rM/LmWQsMoV9kxWkisNaxcw
 fXdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=5K05Xoh+SUd9/3sbKxNGQzWXEU2C4ODqRTQbgXmNJ50=;
 b=UQ1aHCnKV6oLiL2+oasuH8skZN/Z114R2KVz0+JxYBf+LBBRlfZ1c6uB/ongEmkS9z
 biOMKHPk8QsOQkt4b320tB0wXE+JPrfawKiFvGNk6xesiQdkp60il6MzIQo/6qxr4z2Z
 cnMHUGDmbdssvmT2umbFPnwcp0U/XqK21xz0oRFIoVhpMlFYepQ09t35DyMca7DiX+HF
 J3dZF0geL9usOHQl+2I75iOa4t7k+HYRFfWOwNr3+eo54CiPP6uizJQTKsp6Zw2FlfQw
 iYGwiQvuhVaaShInBMX4sCVg1cPRw88tJHn1IA8Ps21WVb41Zt6P8/zSRUO7yJls963W
 p4lQ==
X-Gm-Message-State: AGi0PubE1M4mNM9kkR6TczXiM4yu4tm4Dal0qVK4bSKAXfpjfSLJJTkd
 IKSlSxk2Er9HI9a5Dz9V1+lA6a4Zljg=
X-Google-Smtp-Source: APiQypLA0dvfpQGP+Fnuz4mCP6iiPwfx7hyPGTp3tuJwLGyMme8qhMDGNeQzvGDeOBu1rPWXDYPyIV6ZoHw=
X-Received: by 2002:a63:ff4e:: with SMTP id s14mr5207371pgk.269.1586318243478; 
 Tue, 07 Apr 2020 20:57:23 -0700 (PDT)
Date: Tue,  7 Apr 2020 20:56:49 -0700
In-Reply-To: <20200408035654.247908-1-satyat@google.com>
Message-Id: <20200408035654.247908-8-satyat@google.com>
Mime-Version: 1.0
References: <20200408035654.247908-1-satyat@google.com>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.201 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jM1qD-0075Iv-Ce
Subject: [f2fs-dev] [PATCH v10 07/12] scsi: ufs: UFS crypto API
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

Introduce functions to manipulate UFS inline encryption hardware
in line with the JEDEC UFSHCI v2.1 specification and to work with the
block keyslot manager.

The UFS crypto API will assume by default that a vendor driver doesn't
support UFS crypto, even if the hardware advertises the capability, because
a lot of hardware requires some special handling that's not specified in
the aforementioned JEDEC spec. Each vendor driver must explicity set
hba->caps |= UFSHCD_CAP_CRYPTO before ufshcd_hba_init_crypto is called to
opt-in to UFS crypto support.

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 drivers/scsi/ufs/Kconfig         |   9 ++
 drivers/scsi/ufs/Makefile        |   1 +
 drivers/scsi/ufs/ufshcd-crypto.c | 226 +++++++++++++++++++++++++++++++
 drivers/scsi/ufs/ufshcd-crypto.h |  42 ++++++
 drivers/scsi/ufs/ufshcd.h        |  12 ++
 5 files changed, 290 insertions(+)
 create mode 100644 drivers/scsi/ufs/ufshcd-crypto.c
 create mode 100644 drivers/scsi/ufs/ufshcd-crypto.h

diff --git a/drivers/scsi/ufs/Kconfig b/drivers/scsi/ufs/Kconfig
index e2005aeddc2db..5ed3f209f8810 100644
--- a/drivers/scsi/ufs/Kconfig
+++ b/drivers/scsi/ufs/Kconfig
@@ -160,3 +160,12 @@ config SCSI_UFS_BSG
 
 	  Select this if you need a bsg device node for your UFS controller.
 	  If unsure, say N.
+
+config SCSI_UFS_CRYPTO
+	bool "UFS Crypto Engine Support"
+	depends on SCSI_UFSHCD && BLK_INLINE_ENCRYPTION
+	help
+	  Enable Crypto Engine Support in UFS.
+	  Enabling this makes it possible for the kernel to use the crypto
+	  capabilities of the UFS device (if present) to perform crypto
+	  operations on data being transferred to/from the device.
diff --git a/drivers/scsi/ufs/Makefile b/drivers/scsi/ufs/Makefile
index 94c6c5d7334b6..197e178f44bce 100644
--- a/drivers/scsi/ufs/Makefile
+++ b/drivers/scsi/ufs/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_SCSI_UFS_QCOM) += ufs-qcom.o
 obj-$(CONFIG_SCSI_UFSHCD) += ufshcd-core.o
 ufshcd-core-y				+= ufshcd.o ufs-sysfs.o
 ufshcd-core-$(CONFIG_SCSI_UFS_BSG)	+= ufs_bsg.o
+ufshcd-core-$(CONFIG_SCSI_UFS_CRYPTO) += ufshcd-crypto.o
 obj-$(CONFIG_SCSI_UFSHCD_PCI) += ufshcd-pci.o
 obj-$(CONFIG_SCSI_UFSHCD_PLATFORM) += ufshcd-pltfrm.o
 obj-$(CONFIG_SCSI_UFS_HISI) += ufs-hisi.o
diff --git a/drivers/scsi/ufs/ufshcd-crypto.c b/drivers/scsi/ufs/ufshcd-crypto.c
new file mode 100644
index 0000000000000..65a3115d2a2d4
--- /dev/null
+++ b/drivers/scsi/ufs/ufshcd-crypto.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2019 Google LLC
+ */
+
+#include "ufshcd.h"
+#include "ufshcd-crypto.h"
+
+/* Blk-crypto modes supported by UFS crypto */
+static const struct ufs_crypto_alg_entry {
+	enum ufs_crypto_alg ufs_alg;
+	enum ufs_crypto_key_size ufs_key_size;
+} ufs_crypto_algs[BLK_ENCRYPTION_MODE_MAX] = {
+	[BLK_ENCRYPTION_MODE_AES_256_XTS] = {
+		.ufs_alg = UFS_CRYPTO_ALG_AES_XTS,
+		.ufs_key_size = UFS_CRYPTO_KEY_SIZE_256,
+	},
+};
+
+static void ufshcd_program_key(struct ufs_hba *hba,
+			       const union ufs_crypto_cfg_entry *cfg,
+			       int slot)
+{
+	int i;
+	u32 slot_offset = hba->crypto_cfg_register + slot * sizeof(*cfg);
+
+	ufshcd_hold(hba, false);
+	/* Ensure that CFGE is cleared before programming the key */
+	ufshcd_writel(hba, 0, slot_offset + 16 * sizeof(cfg->reg_val[0]));
+	for (i = 0; i < 16; i++) {
+		ufshcd_writel(hba, le32_to_cpu(cfg->reg_val[i]),
+			      slot_offset + i * sizeof(cfg->reg_val[0]));
+	}
+	/* Write dword 17 */
+	ufshcd_writel(hba, le32_to_cpu(cfg->reg_val[17]),
+		      slot_offset + 17 * sizeof(cfg->reg_val[0]));
+	/* Dword 16 must be written last */
+	ufshcd_writel(hba, le32_to_cpu(cfg->reg_val[16]),
+		      slot_offset + 16 * sizeof(cfg->reg_val[0]));
+	ufshcd_release(hba);
+}
+
+static int ufshcd_crypto_keyslot_program(struct blk_keyslot_manager *ksm,
+					 const struct blk_crypto_key *key,
+					 unsigned int slot)
+{
+	struct ufs_hba *hba = container_of(ksm, struct ufs_hba, ksm);
+	const union ufs_crypto_cap_entry *ccap_array = hba->crypto_cap_array;
+	const struct ufs_crypto_alg_entry *alg =
+			&ufs_crypto_algs[key->crypto_cfg.crypto_mode];
+	u8 data_unit_mask = key->crypto_cfg.data_unit_size / 512;
+	int i;
+	int cap_idx = -1;
+	union ufs_crypto_cfg_entry cfg = { 0 };
+
+	BUILD_BUG_ON(UFS_CRYPTO_KEY_SIZE_INVALID != 0);
+	for (i = 0; i < hba->crypto_capabilities.num_crypto_cap; i++) {
+		if (ccap_array[i].algorithm_id == alg->ufs_alg &&
+		    ccap_array[i].key_size == alg->ufs_key_size &&
+		    (ccap_array[i].sdus_mask & data_unit_mask)) {
+			cap_idx = i;
+			break;
+		}
+	}
+
+	if (WARN_ON(cap_idx < 0))
+		return -EOPNOTSUPP;
+
+	cfg.data_unit_size = data_unit_mask;
+	cfg.crypto_cap_idx = cap_idx;
+	cfg.config_enable = UFS_CRYPTO_CONFIGURATION_ENABLE;
+
+	if (ccap_array[cap_idx].algorithm_id == UFS_CRYPTO_ALG_AES_XTS) {
+		/* In XTS mode, the blk_crypto_key's size is already doubled */
+		memcpy(cfg.crypto_key, key->raw, key->size/2);
+		memcpy(cfg.crypto_key + UFS_CRYPTO_KEY_MAX_SIZE/2,
+		       key->raw + key->size/2, key->size/2);
+	} else {
+		memcpy(cfg.crypto_key, key->raw, key->size);
+	}
+
+	ufshcd_program_key(hba, &cfg, slot);
+
+	memzero_explicit(&cfg, sizeof(cfg));
+	return 0;
+}
+
+static void ufshcd_clear_keyslot(struct ufs_hba *hba, int slot)
+{
+	/*
+	 * Clear the crypto cfg on the device. Clearing CFGE
+	 * might not be sufficient, so just clear the entire cfg.
+	 */
+	union ufs_crypto_cfg_entry cfg = { 0 };
+
+	ufshcd_program_key(hba, &cfg, slot);
+}
+
+static int ufshcd_crypto_keyslot_evict(struct blk_keyslot_manager *ksm,
+				       const struct blk_crypto_key *key,
+				       unsigned int slot)
+{
+	struct ufs_hba *hba = container_of(ksm, struct ufs_hba, ksm);
+
+	ufshcd_clear_keyslot(hba, slot);
+
+	return 0;
+}
+
+bool ufshcd_crypto_enable(struct ufs_hba *hba)
+{
+	if (!(hba->caps & UFSHCD_CAP_CRYPTO))
+		return false;
+
+	/* Reset might clear all keys, so reprogram all the keys. */
+	blk_ksm_reprogram_all_keys(&hba->ksm);
+	return true;
+}
+
+static const struct blk_ksm_ll_ops ufshcd_ksm_ops = {
+	.keyslot_program	= ufshcd_crypto_keyslot_program,
+	.keyslot_evict		= ufshcd_crypto_keyslot_evict,
+};
+
+static enum blk_crypto_mode_num
+ufshcd_find_blk_crypto_mode(union ufs_crypto_cap_entry cap)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ufs_crypto_algs); i++) {
+		BUILD_BUG_ON(UFS_CRYPTO_KEY_SIZE_INVALID != 0);
+		if (ufs_crypto_algs[i].ufs_alg == cap.algorithm_id &&
+		    ufs_crypto_algs[i].ufs_key_size == cap.key_size) {
+			return i;
+		}
+	}
+	return BLK_ENCRYPTION_MODE_INVALID;
+}
+
+/**
+ * ufshcd_hba_init_crypto - Read crypto capabilities, init crypto fields in hba
+ * @hba: Per adapter instance
+ *
+ * Return: 0 if crypto was initialized or is not supported, else a -errno value.
+ */
+int ufshcd_hba_init_crypto(struct ufs_hba *hba)
+{
+	int cap_idx = 0;
+	int err = 0;
+	enum blk_crypto_mode_num blk_mode_num;
+	int slot = 0;
+	int num_keyslots;
+
+	/*
+	 * Don't use crypto if either the hardware doesn't advertise the
+	 * standard crypto capability bit *or* if the vendor specific driver
+	 * hasn't advertised that crypto is supported.
+	 */
+	if (!(hba->capabilities & MASK_CRYPTO_SUPPORT) ||
+	    !(hba->caps & UFSHCD_CAP_CRYPTO))
+		goto out;
+
+	hba->crypto_capabilities.reg_val =
+			cpu_to_le32(ufshcd_readl(hba, REG_UFS_CCAP));
+	hba->crypto_cfg_register =
+		(u32)hba->crypto_capabilities.config_array_ptr * 0x100;
+	hba->crypto_cap_array =
+		devm_kcalloc(hba->dev, hba->crypto_capabilities.num_crypto_cap,
+			     sizeof(hba->crypto_cap_array[0]), GFP_KERNEL);
+	if (!hba->crypto_cap_array) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	/* The actual number of configurations supported is (CFGC+1) */
+	num_keyslots = hba->crypto_capabilities.config_count + 1;
+	err = blk_ksm_init(&hba->ksm, num_keyslots);
+	if (err)
+		goto out_free_caps;
+
+	hba->ksm.ksm_ll_ops = ufshcd_ksm_ops;
+	/* UFS only supports 8 bytes for any DUN */
+	hba->ksm.max_dun_bytes_supported = 8;
+	hba->ksm.dev = hba->dev;
+
+	/*
+	 * Cache all the UFS crypto capabilities and advertise the supported
+	 * crypto modes and data unit sizes to the block layer.
+	 */
+	for (cap_idx = 0; cap_idx < hba->crypto_capabilities.num_crypto_cap;
+	     cap_idx++) {
+		hba->crypto_cap_array[cap_idx].reg_val =
+			cpu_to_le32(ufshcd_readl(hba,
+						 REG_UFS_CRYPTOCAP +
+						 cap_idx * sizeof(__le32)));
+		blk_mode_num = ufshcd_find_blk_crypto_mode(
+						hba->crypto_cap_array[cap_idx]);
+		if (blk_mode_num != BLK_ENCRYPTION_MODE_INVALID)
+			hba->ksm.crypto_modes_supported[blk_mode_num] |=
+				hba->crypto_cap_array[cap_idx].sdus_mask * 512;
+	}
+
+	for (slot = 0; slot < num_keyslots; slot++)
+		ufshcd_clear_keyslot(hba, slot);
+
+	return 0;
+
+out_free_caps:
+	devm_kfree(hba->dev, hba->crypto_cap_array);
+out:
+	/* Indicate that init failed by clearing UFSHCD_CAP_CRYPTO */
+	hba->caps &= ~UFSHCD_CAP_CRYPTO;
+	return err;
+}
+
+void ufshcd_crypto_setup_rq_keyslot_manager(struct ufs_hba *hba,
+					    struct request_queue *q)
+{
+	if (hba->caps & UFSHCD_CAP_CRYPTO)
+		blk_ksm_register(&hba->ksm, q);
+}
+
+void ufshcd_crypto_destroy_keyslot_manager(struct ufs_hba *hba)
+{
+	blk_ksm_destroy(&hba->ksm);
+}
diff --git a/drivers/scsi/ufs/ufshcd-crypto.h b/drivers/scsi/ufs/ufshcd-crypto.h
new file mode 100644
index 0000000000000..22677619de595
--- /dev/null
+++ b/drivers/scsi/ufs/ufshcd-crypto.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2019 Google LLC
+ */
+
+#ifndef _UFSHCD_CRYPTO_H
+#define _UFSHCD_CRYPTO_H
+
+#ifdef CONFIG_SCSI_UFS_CRYPTO
+#include "ufshcd.h"
+#include "ufshci.h"
+
+bool ufshcd_crypto_enable(struct ufs_hba *hba);
+
+int ufshcd_hba_init_crypto(struct ufs_hba *hba);
+
+void ufshcd_crypto_setup_rq_keyslot_manager(struct ufs_hba *hba,
+					    struct request_queue *q);
+
+void ufshcd_crypto_destroy_keyslot_manager(struct ufs_hba *hba);
+
+#else /* CONFIG_SCSI_UFS_CRYPTO */
+
+static inline bool ufshcd_crypto_enable(struct ufs_hba *hba)
+{
+	return false;
+}
+
+static inline int ufshcd_hba_init_crypto(struct ufs_hba *hba)
+{
+	return 0;
+}
+
+static inline void ufshcd_crypto_setup_rq_keyslot_manager(struct ufs_hba *hba,
+						struct request_queue *q) { }
+
+static inline void ufshcd_crypto_destroy_keyslot_manager(struct ufs_hba *hba)
+{ }
+
+#endif /* CONFIG_SCSI_UFS_CRYPTO */
+
+#endif /* _UFSHCD_CRYPTO_H */
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index ca570d3f10d42..6c14f72e9ccc1 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -57,6 +57,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/bitfield.h>
 #include <linux/devfreq.h>
+#include <linux/keyslot-manager.h>
 #include "unipro.h"
 
 #include <asm/irq.h>
@@ -601,6 +602,10 @@ enum ufshcd_caps {
  * @is_urgent_bkops_lvl_checked: keeps track if the urgent bkops level for
  *  device is known or not.
  * @scsi_block_reqs_cnt: reference counting for scsi block requests
+ * @crypto_capabilities: Content of crypto capabilities register (0x100)
+ * @crypto_cap_array: Array of crypto capabilities
+ * @crypto_cfg_register: Start of the crypto cfg array
+ * @ksm: the keyslot manager tied to this hba
  */
 struct ufs_hba {
 	void __iomem *mmio_base;
@@ -720,6 +725,13 @@ struct ufs_hba {
 
 	struct device		bsg_dev;
 	struct request_queue	*bsg_queue;
+
+#ifdef CONFIG_SCSI_UFS_CRYPTO
+	union ufs_crypto_capabilities crypto_capabilities;
+	union ufs_crypto_cap_entry *crypto_cap_array;
+	u32 crypto_cfg_register;
+	struct blk_keyslot_manager ksm;
+#endif
 };
 
 /* Returns true if clocks can be gated. Otherwise false */
-- 
2.26.0.110.g2183baf09c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
