Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A49974EB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Aug 2019 10:28:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nl+belrihDPQGVMR0kn9s61oif+RymW02HhbdKXnxh4=; b=JfebMt74Y5r5/19sQz+Xu7ppE
	vsl0mwxYu6jK4ikhdL+S+gekgzkl3weu+KLEankBjbsHzqzwHjVJKP/fFGRTP8Lo+EnKrtbdyPMLC
	wMOlP45pAEpk+xnbI3H/FdcUKQ1UEGTF3W8/p6FbdSKnIxyWVE7zGwSYi/Uk/fKpSL+D4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i0LyV-0001dN-Ly; Wed, 21 Aug 2019 08:28:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3avlcXQYKAMEzh05h0nvvnsl.jvt@flex--satyat.bounces.google.com>)
 id 1i0LyU-0001ax-AZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 08:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fA2UXmDikRvcLZrf/BqE7ho8JRRlilYy8SGfgnGYbi4=; b=cbgc4B8cNsKLClkmOKFjvJsCn
 6UZzy452YyVZxgQajEz7SUgkz/FFn26HRqcyhK7lXT2coDIssdyakuj3DrksabfR9losOE8gVOfus
 a/oVf/ulm2N6iqaMDM6R5kHyHkc+RR2N4BdZNMgrsMP4QNH6CgHnhLw6Ly4pG0n94infU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fA2UXmDikRvcLZrf/BqE7ho8JRRlilYy8SGfgnGYbi4=; b=fNuKrvo/MbAFkWpB5foF+u5L1g
 rm0Fl+p5HVvdSiyyHSqqjOJWiShIG1ODbziwEb06aCH/lf1lLXut9sOC8v86Iz/rb8cHRkeVLr9lq
 UagHGIbd8vk4Pj3hyrUyydxRre1jcvMcDUb+gGidxVtkrdekqIkYcwflSG0xlK+iUEV8=;
Received: from mail-qt1-f202.google.com ([209.85.160.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1i0Lqa-00EHiC-7g
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 08:20:02 +0000
Received: by mail-qt1-f202.google.com with SMTP id c14so1758425qtn.17
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Aug 2019 01:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=fA2UXmDikRvcLZrf/BqE7ho8JRRlilYy8SGfgnGYbi4=;
 b=BCi2mC+20w5N+zNpYWAqnl3OLa7sGF9NYqQymsw3pKM27U9g1dk897V+yEt8tkuAe6
 ceAu6GgylS/c2+MiabcQ7GQUpw3UKjB1gH6Bv9nFni+AkgT9HoASdjJ2dm3v+yL2gmrQ
 Y855BGce0NfeBx5c7O/a8hefODO/BqchfBIkF5QHWsPRNP0uTrv9pZJiVxVrBFrBcWjV
 6eO0vFziVEbaRJaZF5OfhPsCCYXdiaYB7rD6TrEaUciu6bN+kgsRROH9Vf5wMiPP1yyC
 AoHg93D45k0kcNrmb5i8APmlvDXmOVoGeQ63PZoLFxIY9FBW7X/LClh/99v5EXYqjkKu
 qC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=fA2UXmDikRvcLZrf/BqE7ho8JRRlilYy8SGfgnGYbi4=;
 b=hwVSkKKIz7qpH5h5VyD5MSNAUrZIZYqimxIok3hKyi78mjZ7z5NXbVt48/UyPgAxV/
 dPE6w1G2jlPGujoHKByMfbPEOXe0BjQWZl3YlZnsRkR4eU5okpxmsEAPSDisP7qfNjWh
 9TSv7V09NWsXVHjGJgZ2C23pdlICuzMZUXNgPV1g5/Q/4LZzXtpRn/pa6R6TVi9WCY+W
 pjt4vrnm9vV8wNReACHUWno+loTGP4icI8nNKlMb/8tb5s1hgLRBPB/RaPQucDkKcxc6
 6ou2ygDud0vOx9l2Py8ZvAcC10Q8rjC0Ji45D5C9X5H0sNTXSnu+ZM3WGugupW79/zul
 HzgA==
X-Gm-Message-State: APjAAAWm63VfjICQ8CU2g08oFDKOodiUC0wocSMVGqcgih+ym6rMHz94
 brkf4kNZNio1Hi5e7ZSYCcnK7iRKUAY=
X-Google-Smtp-Source: APXvYqzC8CoZweF87ZvQlp1cKwYdF56hZv5lmzuFuV0i/0ehwOjdV1EfGnbFYblwutaQqJebzYMZrOtnRo8=
X-Received: by 2002:a65:43c2:: with SMTP id n2mr28366337pgp.110.1566374250947; 
 Wed, 21 Aug 2019 00:57:30 -0700 (PDT)
Date: Wed, 21 Aug 2019 00:57:11 -0700
In-Reply-To: <20190821075714.65140-1-satyat@google.com>
Message-Id: <20190821075714.65140-6-satyat@google.com>
Mime-Version: 1.0
References: <20190821075714.65140-1-satyat@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1i0Lqa-00EHiC-7g
Subject: [f2fs-dev] [PATCH v4 5/8] scsi: ufs: UFS crypto API
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

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 drivers/scsi/ufs/Kconfig         |  10 +
 drivers/scsi/ufs/Makefile        |   1 +
 drivers/scsi/ufs/ufshcd-crypto.c | 429 +++++++++++++++++++++++++++++++
 drivers/scsi/ufs/ufshcd-crypto.h |  86 +++++++
 drivers/scsi/ufs/ufshcd.h        |  18 ++
 5 files changed, 544 insertions(+)
 create mode 100644 drivers/scsi/ufs/ufshcd-crypto.c
 create mode 100644 drivers/scsi/ufs/ufshcd-crypto.h

diff --git a/drivers/scsi/ufs/Kconfig b/drivers/scsi/ufs/Kconfig
index 0b845ab7c3bf..861aabfe791b 100644
--- a/drivers/scsi/ufs/Kconfig
+++ b/drivers/scsi/ufs/Kconfig
@@ -150,3 +150,13 @@ config SCSI_UFS_BSG
 
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
+
diff --git a/drivers/scsi/ufs/Makefile b/drivers/scsi/ufs/Makefile
index 2a9097939bcb..094c39989a37 100644
--- a/drivers/scsi/ufs/Makefile
+++ b/drivers/scsi/ufs/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_SCSI_UFSHCD_PCI) += ufshcd-pci.o
 obj-$(CONFIG_SCSI_UFSHCD_PLATFORM) += ufshcd-pltfrm.o
 obj-$(CONFIG_SCSI_UFS_HISI) += ufs-hisi.o
 obj-$(CONFIG_SCSI_UFS_MEDIATEK) += ufs-mediatek.o
+ufshcd-core-$(CONFIG_SCSI_UFS_CRYPTO) += ufshcd-crypto.o
diff --git a/drivers/scsi/ufs/ufshcd-crypto.c b/drivers/scsi/ufs/ufshcd-crypto.c
new file mode 100644
index 000000000000..c069a75b245f
--- /dev/null
+++ b/drivers/scsi/ufs/ufshcd-crypto.c
@@ -0,0 +1,429 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2019 Google LLC
+ */
+
+#include <crypto/algapi.h>
+
+#include "ufshcd.h"
+#include "ufshcd-crypto.h"
+
+static bool ufshcd_cap_idx_valid(struct ufs_hba *hba, unsigned int cap_idx)
+{
+	return cap_idx < hba->crypto_capabilities.num_crypto_cap;
+}
+
+static u8 get_data_unit_size_mask(unsigned int data_unit_size)
+{
+	if (data_unit_size < 512 || data_unit_size > 65536 ||
+	    !is_power_of_2(data_unit_size))
+		return 0;
+
+	return data_unit_size / 512;
+}
+
+static size_t get_keysize_bytes(enum ufs_crypto_key_size size)
+{
+	switch (size) {
+	case UFS_CRYPTO_KEY_SIZE_128: return 16;
+	case UFS_CRYPTO_KEY_SIZE_192: return 24;
+	case UFS_CRYPTO_KEY_SIZE_256: return 32;
+	case UFS_CRYPTO_KEY_SIZE_512: return 64;
+	default: return 0;
+	}
+}
+
+static int ufshcd_crypto_cap_find(void *hba_p,
+			   enum blk_crypto_mode_num crypto_mode,
+			   unsigned int data_unit_size)
+{
+	struct ufs_hba *hba = hba_p;
+	enum ufs_crypto_alg ufs_alg;
+	u8 data_unit_mask;
+	int cap_idx;
+	enum ufs_crypto_key_size ufs_key_size;
+	union ufs_crypto_cap_entry *ccap_array = hba->crypto_cap_array;
+
+	if (!ufshcd_hba_is_crypto_supported(hba))
+		return -EINVAL;
+
+	switch (crypto_mode) {
+	case BLK_ENCRYPTION_MODE_AES_256_XTS:
+		ufs_alg = UFS_CRYPTO_ALG_AES_XTS;
+		ufs_key_size = UFS_CRYPTO_KEY_SIZE_256;
+		break;
+	/*
+	 * case BLK_CRYPTO_ALG_BITLOCKER_AES_CBC:
+	 *	ufs_alg = UFS_CRYPTO_ALG_BITLOCKER_AES_CBC;
+	 *	break;
+	 * case BLK_CRYPTO_ALG_AES_ECB:
+	 *	ufs_alg = UFS_CRYPTO_ALG_AES_ECB;
+	 *	break;
+	 * case BLK_CRYPTO_ALG_ESSIV_AES_CBC:
+	 *	ufs_alg = UFS_CRYPTO_ALG_ESSIV_AES_CBC;
+	 *	break;
+	 */
+	default: return -EINVAL;
+	}
+
+	data_unit_mask = get_data_unit_size_mask(data_unit_size);
+
+	for (cap_idx = 0; cap_idx < hba->crypto_capabilities.num_crypto_cap;
+	     cap_idx++) {
+		if (ccap_array[cap_idx].algorithm_id == ufs_alg &&
+		    (ccap_array[cap_idx].sdus_mask & data_unit_mask) &&
+		    ccap_array[cap_idx].key_size == ufs_key_size)
+			return cap_idx;
+	}
+
+	return -EINVAL;
+}
+
+/**
+ * ufshcd_crypto_cfg_entry_write_key - Write a key into a crypto_cfg_entry
+ *
+ *	Writes the key with the appropriate format - for AES_XTS,
+ *	the first half of the key is copied as is, the second half is
+ *	copied with an offset halfway into the cfg->crypto_key array.
+ *	For the other supported crypto algs, the key is just copied.
+ *
+ * @cfg: The crypto config to write to
+ * @key: The key to write
+ * @cap: The crypto capability (which specifies the crypto alg and key size)
+ *
+ * Returns 0 on success, or -EINVAL
+ */
+static int ufshcd_crypto_cfg_entry_write_key(union ufs_crypto_cfg_entry *cfg,
+					     const u8 *key,
+					     union ufs_crypto_cap_entry cap)
+{
+	size_t key_size_bytes = get_keysize_bytes(cap.key_size);
+
+	if (key_size_bytes == 0)
+		return -EINVAL;
+
+	switch (cap.algorithm_id) {
+	case UFS_CRYPTO_ALG_AES_XTS:
+		key_size_bytes *= 2;
+		if (key_size_bytes > UFS_CRYPTO_KEY_MAX_SIZE)
+			return -EINVAL;
+
+		memcpy(cfg->crypto_key, key, key_size_bytes/2);
+		memcpy(cfg->crypto_key + UFS_CRYPTO_KEY_MAX_SIZE/2,
+		       key + key_size_bytes/2, key_size_bytes/2);
+		return 0;
+	case UFS_CRYPTO_ALG_BITLOCKER_AES_CBC: // fallthrough
+	case UFS_CRYPTO_ALG_AES_ECB: // fallthrough
+	case UFS_CRYPTO_ALG_ESSIV_AES_CBC:
+		memcpy(cfg->crypto_key, key, key_size_bytes);
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static void program_key(struct ufs_hba *hba,
+			const union ufs_crypto_cfg_entry *cfg,
+			int slot)
+{
+	int i;
+	u32 slot_offset = hba->crypto_cfg_register + slot * sizeof(*cfg);
+
+	/* Clear the dword 16 */
+	ufshcd_writel(hba, 0, slot_offset + 16 * sizeof(cfg->reg_val[0]));
+	/* Ensure that CFGE is cleared before programming the key */
+	wmb();
+	for (i = 0; i < 16; i++) {
+		ufshcd_writel(hba, le32_to_cpu(cfg->reg_val[i]),
+			      slot_offset + i * sizeof(cfg->reg_val[0]));
+		/* Spec says each dword in key must be written sequentially */
+		wmb();
+	}
+	/* Write dword 17 */
+	ufshcd_writel(hba, le32_to_cpu(cfg->reg_val[17]),
+		      slot_offset + 17 * sizeof(cfg->reg_val[0]));
+	/* Dword 16 must be written last */
+	wmb();
+	/* Write dword 16 */
+	ufshcd_writel(hba, le32_to_cpu(cfg->reg_val[16]),
+		      slot_offset + 16 * sizeof(cfg->reg_val[0]));
+	wmb();
+}
+
+static int ufshcd_crypto_keyslot_program(void *hba_p, const u8 *key,
+					 enum blk_crypto_mode_num crypto_mode,
+					 unsigned int data_unit_size,
+					 unsigned int slot)
+{
+	struct ufs_hba *hba = hba_p;
+	int err = 0;
+	u8 data_unit_mask;
+	union ufs_crypto_cfg_entry cfg;
+	union ufs_crypto_cfg_entry *cfg_arr = hba->crypto_cfgs;
+	int cap_idx;
+
+	cap_idx = ufshcd_crypto_cap_find(hba_p, crypto_mode,
+					       data_unit_size);
+
+	if (!ufshcd_is_crypto_enabled(hba) ||
+	    !ufshcd_keyslot_valid(hba, slot) ||
+	    !ufshcd_cap_idx_valid(hba, cap_idx))
+		return -EINVAL;
+
+	data_unit_mask = get_data_unit_size_mask(data_unit_size);
+
+	if (!(data_unit_mask & hba->crypto_cap_array[cap_idx].sdus_mask))
+		return -EINVAL;
+
+	memset(&cfg, 0, sizeof(cfg));
+	cfg.data_unit_size = data_unit_mask;
+	cfg.crypto_cap_idx = cap_idx;
+	cfg.config_enable |= UFS_CRYPTO_CONFIGURATION_ENABLE;
+
+	err = ufshcd_crypto_cfg_entry_write_key(&cfg, key,
+				hba->crypto_cap_array[cap_idx]);
+	if (err)
+		return err;
+
+	program_key(hba, &cfg, slot);
+
+	memcpy(&cfg_arr[slot], &cfg, sizeof(cfg));
+	memzero_explicit(&cfg, sizeof(cfg));
+
+	return 0;
+}
+
+static int ufshcd_crypto_keyslot_find(void *hba_p,
+				      const u8 *key,
+				      enum blk_crypto_mode_num crypto_mode,
+				      unsigned int data_unit_size)
+{
+	struct ufs_hba *hba = hba_p;
+	int err = 0;
+	int slot;
+	u8 data_unit_mask;
+	union ufs_crypto_cfg_entry cfg;
+	union ufs_crypto_cfg_entry *cfg_arr = hba->crypto_cfgs;
+	int cap_idx;
+
+	cap_idx = ufshcd_crypto_cap_find(hba_p, crypto_mode,
+					       data_unit_size);
+
+	if (!ufshcd_is_crypto_enabled(hba) ||
+	    !ufshcd_cap_idx_valid(hba, cap_idx))
+		return -EINVAL;
+
+	data_unit_mask = get_data_unit_size_mask(data_unit_size);
+
+	if (!(data_unit_mask & hba->crypto_cap_array[cap_idx].sdus_mask))
+		return -EINVAL;
+
+	memset(&cfg, 0, sizeof(cfg));
+	err = ufshcd_crypto_cfg_entry_write_key(&cfg, key,
+					hba->crypto_cap_array[cap_idx]);
+
+	if (err)
+		return -EINVAL;
+
+	for (slot = 0; slot < NUM_KEYSLOTS(hba); slot++) {
+		if ((cfg_arr[slot].config_enable &
+		     UFS_CRYPTO_CONFIGURATION_ENABLE) &&
+		    data_unit_mask == cfg_arr[slot].data_unit_size &&
+		    cap_idx == cfg_arr[slot].crypto_cap_idx &&
+		    !crypto_memneq(&cfg.crypto_key, cfg_arr[slot].crypto_key,
+				  UFS_CRYPTO_KEY_MAX_SIZE)) {
+			memzero_explicit(&cfg, sizeof(cfg));
+			return slot;
+		}
+	}
+
+	memzero_explicit(&cfg, sizeof(cfg));
+	return -ENOKEY;
+}
+
+static int ufshcd_crypto_keyslot_evict(void *hba_p, const u8 *key,
+				       enum blk_crypto_mode_num crypto_mode,
+				       unsigned int data_unit_size,
+				       unsigned int slot)
+{
+	struct ufs_hba *hba = hba_p;
+	int i = 0;
+	u32 reg_base;
+	union ufs_crypto_cfg_entry *cfg_arr = hba->crypto_cfgs;
+
+	if (!ufshcd_is_crypto_enabled(hba) ||
+	    !ufshcd_keyslot_valid(hba, slot))
+		return -EINVAL;
+
+	memset(&cfg_arr[slot], 0, sizeof(cfg_arr[slot]));
+	reg_base = hba->crypto_cfg_register + slot * sizeof(cfg_arr[0]);
+
+	/*
+	 * Clear the crypto cfg on the device. Clearing CFGE
+	 * might not be sufficient, so just clear the entire cfg.
+	 */
+	for (i = 0; i < sizeof(cfg_arr[0]); i += sizeof(__le32))
+		ufshcd_writel(hba, 0, reg_base + i);
+	wmb();
+
+	return 0;
+}
+
+static bool ufshcd_crypto_mode_supported(void *hba_p,
+					 enum blk_crypto_mode_num crypto_mode,
+					 unsigned int data_unit_size)
+{
+	return ufshcd_crypto_cap_find(hba_p, crypto_mode, data_unit_size) >= 0;
+}
+
+void ufshcd_crypto_enable(struct ufs_hba *hba)
+{
+	union ufs_crypto_cfg_entry *cfg_arr = hba->crypto_cfgs;
+	int slot;
+
+	if (!ufshcd_hba_is_crypto_supported(hba))
+		return;
+
+	hba->caps |= UFSHCD_CAP_CRYPTO;
+	/*
+	 * Reset might clear all keys, so reprogram all the keys.
+	 * Also serves to clear keys on driver init.
+	 */
+	for (slot = 0; slot < NUM_KEYSLOTS(hba); slot++)
+		program_key(hba, &cfg_arr[slot], slot);
+}
+
+void ufshcd_crypto_disable(struct ufs_hba *hba)
+{
+	hba->caps &= ~UFSHCD_CAP_CRYPTO;
+}
+
+
+/**
+ * ufshcd_hba_init_crypto - Read crypto capabilities, init crypto fields in hba
+ * @hba: Per adapter instance
+ *
+ * Returns 0 on success. Returns -ENODEV if such capabilities don't exist, and
+ * -ENOMEM upon OOM.
+ */
+int ufshcd_hba_init_crypto(struct ufs_hba *hba)
+{
+	int cap_idx = 0;
+	int err = 0;
+
+	/* Default to disabling crypto */
+	hba->caps &= ~UFSHCD_CAP_CRYPTO;
+
+	if (!(hba->capabilities & MASK_CRYPTO_SUPPORT)) {
+		err = -ENODEV;
+		goto out;
+	}
+
+	/*
+	 * Crypto Capabilities should never be 0, because the
+	 * config_array_ptr > 04h. So we use a 0 value to indicate that
+	 * crypto init failed, and can't be enabled.
+	 */
+	hba->crypto_capabilities.reg_val =
+			cpu_to_le32(ufshcd_readl(hba, REG_UFS_CCAP));
+	hba->crypto_cfg_register =
+		(u32)hba->crypto_capabilities.config_array_ptr * 0x100;
+	hba->crypto_cap_array =
+		devm_kcalloc(hba->dev,
+			     hba->crypto_capabilities.num_crypto_cap,
+			     sizeof(hba->crypto_cap_array[0]),
+			     GFP_KERNEL);
+	if (!hba->crypto_cap_array) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	hba->crypto_cfgs =
+		devm_kcalloc(hba->dev,
+			     hba->crypto_capabilities.config_count + 1,
+			     sizeof(hba->crypto_cfgs[0]),
+			     GFP_KERNEL);
+	if (!hba->crypto_cfgs) {
+		err = -ENOMEM;
+		goto out_cfg_mem;
+	}
+
+	/*
+	 * Store all the capabilities now so that we don't need to repeatedly
+	 * access the device each time we want to know its capabilities
+	 */
+	for (cap_idx = 0; cap_idx < hba->crypto_capabilities.num_crypto_cap;
+	     cap_idx++) {
+		hba->crypto_cap_array[cap_idx].reg_val =
+			cpu_to_le32(ufshcd_readl(hba,
+						 REG_UFS_CRYPTOCAP +
+						 cap_idx * sizeof(__le32)));
+	}
+
+	hba->ksm = NULL;
+	mutex_init(&hba->ksm_lock);
+	hba->ksm_num_refs = 0;
+
+	return 0;
+out_cfg_mem:
+	devm_kfree(hba->dev, hba->crypto_cap_array);
+out:
+	// TODO: print error?
+	/* Indicate that init failed by setting crypto_capabilities to 0 */
+	hba->crypto_capabilities.reg_val = 0;
+	return err;
+}
+
+static const struct keyslot_mgmt_ll_ops ufshcd_ksm_ops = {
+	.keyslot_program	= ufshcd_crypto_keyslot_program,
+	.keyslot_evict		= ufshcd_crypto_keyslot_evict,
+	.keyslot_find		= ufshcd_crypto_keyslot_find,
+	.crypto_mode_supported	= ufshcd_crypto_mode_supported,
+};
+
+void ufshcd_crypto_setup_rq_keyslot_manager(struct ufs_hba *hba,
+					    struct request_queue *q)
+{
+	if (!ufshcd_hba_is_crypto_supported(hba))
+		return;
+
+	if (q) {
+		mutex_lock(&hba->ksm_lock);
+		if (!hba->ksm) {
+			hba->ksm = keyslot_manager_create(
+				hba->crypto_capabilities.config_count + 1,
+				&ufshcd_ksm_ops, hba);
+			hba->ksm_num_refs = 0;
+		}
+		hba->ksm_num_refs++;
+		mutex_unlock(&hba->ksm_lock);
+		q->ksm = hba->ksm;
+	}
+	/*
+	 * If we fail we make it look like
+	 * crypto is not supported, which will avoid issues
+	 * with reset
+	 */
+	if (!q || !q->ksm) {
+		ufshcd_crypto_disable(hba);
+		hba->crypto_capabilities.reg_val = 0;
+		devm_kfree(hba->dev, hba->crypto_cap_array);
+		devm_kfree(hba->dev, hba->crypto_cfgs);
+	}
+}
+
+void ufshcd_crypto_destroy_rq_keyslot_manager(struct ufs_hba *hba,
+					      struct request_queue *q)
+{
+	if (q && q->ksm) {
+		q->ksm = NULL;
+		mutex_lock(&hba->ksm_lock);
+		hba->ksm_num_refs--;
+		if (hba->ksm_num_refs == 0) {
+			keyslot_manager_destroy(hba->ksm);
+			hba->ksm = NULL;
+		}
+		mutex_unlock(&hba->ksm_lock);
+	}
+}
+
diff --git a/drivers/scsi/ufs/ufshcd-crypto.h b/drivers/scsi/ufs/ufshcd-crypto.h
new file mode 100644
index 000000000000..73ddc8e493fb
--- /dev/null
+++ b/drivers/scsi/ufs/ufshcd-crypto.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2019 Google LLC
+ */
+
+#ifndef _UFSHCD_CRYPTO_H
+#define _UFSHCD_CRYPTO_H
+
+struct ufs_hba;
+
+#ifdef CONFIG_SCSI_UFS_CRYPTO
+#include <linux/keyslot-manager.h>
+
+#include "ufshci.h"
+
+#define NUM_KEYSLOTS(hba) (hba->crypto_capabilities.config_count + 1)
+
+static inline bool ufshcd_keyslot_valid(struct ufs_hba *hba, unsigned int slot)
+{
+	/*
+	 * The actual number of configurations supported is (CFGC+1), so slot
+	 * numbers range from 0 to config_count inclusive.
+	 */
+	return slot < NUM_KEYSLOTS(hba);
+}
+
+static inline bool ufshcd_hba_is_crypto_supported(struct ufs_hba *hba)
+{
+	return hba->crypto_capabilities.reg_val != 0;
+}
+
+static inline bool ufshcd_is_crypto_enabled(struct ufs_hba *hba)
+{
+	return hba->caps & UFSHCD_CAP_CRYPTO;
+}
+
+void ufshcd_crypto_enable(struct ufs_hba *hba);
+
+void ufshcd_crypto_disable(struct ufs_hba *hba);
+
+int ufshcd_hba_init_crypto(struct ufs_hba *hba);
+
+void ufshcd_crypto_setup_rq_keyslot_manager(struct ufs_hba *hba,
+					    struct request_queue *q);
+
+void ufshcd_crypto_destroy_rq_keyslot_manager(struct ufs_hba *hba,
+					      struct request_queue *q);
+
+#else /* CONFIG_SCSI_UFS_CRYPTO */
+
+static inline bool ufshcd_keyslot_valid(struct ufs_hba *hba,
+					unsigned int slot)
+{
+	return false;
+}
+
+static inline bool ufshcd_hba_is_crypto_supported(struct ufs_hba *hba)
+{
+	return false;
+}
+
+static inline bool ufshcd_is_crypto_enabled(struct ufs_hba *hba)
+{
+	return false;
+}
+
+static inline void ufshcd_crypto_enable(struct ufs_hba *hba) { }
+
+static inline void ufshcd_crypto_disable(struct ufs_hba *hba) { }
+
+static inline int ufshcd_hba_init_crypto(struct ufs_hba *hba)
+{
+	return 0;
+}
+
+static inline void ufshcd_crypto_setup_rq_keyslot_manager(
+					struct ufs_hba *hba,
+					struct request_queue *q) { }
+
+static inline void ufshcd_crypto_destroy_rq_keyslot_manager(
+				struct ufs_hba *hba,
+				struct request_queue *q) { }
+
+#endif /* CONFIG_SCSI_UFS_CRYPTO */
+
+#endif /* _UFSHCD_CRYPTO_H */
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 10b5cd26a020..34e9849f00f0 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -501,6 +501,13 @@ struct ufs_stats {
  * @is_urgent_bkops_lvl_checked: keeps track if the urgent bkops level for
  *  device is known or not.
  * @scsi_block_reqs_cnt: reference counting for scsi block requests
+ * @crypto_capabilities: Content of crypto capabilities register (0x100)
+ * @crypto_cap_array: Array of crypto capabilities
+ * @crypto_cfg_register: Start of the crypto cfg array
+ * @crypto_cfgs: Array of crypto configurations (i.e. config for each slot)
+ * @ksm: the keyslot manager tied to this hba
+ * @ksm_lock: lock to protect initialization and refcount of ksm
+ * @ksm_num_refs: refcount for ksm
  */
 struct ufs_hba {
 	void __iomem *mmio_base;
@@ -711,6 +718,17 @@ struct ufs_hba {
 
 	struct device		bsg_dev;
 	struct request_queue	*bsg_queue;
+
+#ifdef CONFIG_SCSI_UFS_CRYPTO
+	/* crypto */
+	union ufs_crypto_capabilities crypto_capabilities;
+	union ufs_crypto_cap_entry *crypto_cap_array;
+	u32 crypto_cfg_register;
+	union ufs_crypto_cfg_entry *crypto_cfgs;
+	struct keyslot_manager *ksm;
+	struct mutex ksm_lock;
+	unsigned int ksm_num_refs;
+#endif /* CONFIG_SCSI_UFS_CRYPTO */
 };
 
 /* Returns true if clocks can be gated. Otherwise false */
-- 
2.23.0.rc1.153.gdeed80330f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
