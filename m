Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB64D1BD5AC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Apr 2020 09:21:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Jx4WiIHPrc+vElBrAD0mHQqbphcHd/DDOwn2vm+P2BA=; b=RWA2EkVY4okSNWHqqsIH0Rm4E
	ZWzhvO0Q5dLqxRjVYJAZmbvkfYQ8t9+BVHXHUJR7apVIPLQDJ0gsDsMFGE0646FRsMhay7TCzfMXs
	JFp5BCP+m3a//v2PB2FCkg4usUeQfrRcXtrHtQOhl9dUbX45V7IzDSdRBkh1bFWtobDGI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jTh2P-0002jg-FR; Wed, 29 Apr 2020 07:21:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3ACupXgYKAPUpXqvXqdlldib.Zlj@flex--satyat.bounces.google.com>)
 id 1jTh2O-0002jR-DO
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Apr 2020 07:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6QyXfeGvk0WJl1C/wpxTI5v1ePziEcWn5TI+lV37Q2o=; b=IqbbBpSfNpPOSy6GiJKilN6jQ
 hpwic1WzemmP6LkTTYOvXFMw5WVr+lFqllapVxUcgH96+xFftAYIqmAB1Foc0A/QzfDd7fwkS6nII
 ucECv1g1dibZ4wDVtjXEnLEW5e3T2dQTi51M+QhC2PEZatdrSoHKhiNwLlXASVlAwfLFk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6QyXfeGvk0WJl1C/wpxTI5v1ePziEcWn5TI+lV37Q2o=; b=g0fQfzj8mpjNM7CZXkUDXVld/B
 lyyBomq/rnCXRyo6P23dkIwu85mixVhCfH4L3kb4oF+d4XrtMcPVwbQx8NzQfcCsfVg/QtKrHQmG7
 Y5MGeMsVVz6o8L6CwZc+8gLk+VZoEa0dsbO25Kp0aaPYbyeYiKqXHKoEA/UdyLZUGkI8=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jTh2M-003XhS-Vi
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Apr 2020 07:21:44 +0000
Received: by mail-yb1-f202.google.com with SMTP id g17so2359087ybk.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Apr 2020 00:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=6QyXfeGvk0WJl1C/wpxTI5v1ePziEcWn5TI+lV37Q2o=;
 b=h4idqIq3vg3qI3az49fLjU8pyo05Z3rz6LVHeUBJYJ/pjy/GizuukmHRVx3uaa/2Vk
 x7yxfAP/vf5yT1i34vJUHSgoaWztU2WjO8ky65TvcKJgZSRdqR3v3KUaldz5jhacfzaw
 p3kKekyoujKMZA2cpcMmlFuEFgqP+zCX1kB8WH0v6h7k5Wb7xWOoyyqmnWxVeRhOQe5q
 U1H4XiUEc64SVAEu9msI2M9iu3UWT8Kz7qJDJOKDCBHDuYIo/DMxKVyMSgvaCIYHH0Gy
 d3f4IbWrvDyLxgdKdxcx3jNfC2EtuFLN6JScFKNyd630FOxXODbUXADEC2cTzlFItu69
 1J1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=6QyXfeGvk0WJl1C/wpxTI5v1ePziEcWn5TI+lV37Q2o=;
 b=sB9OK/ie2OGWPJ87KI5s5P7fEu4iz3lrkIVALL4fguJao3NyzYYG1G+lpXOPZwu1ZU
 xZKDHsnf8MjlGuDaPRDQNCrWbfbJWzl0dQ4c3/grlTUDRBUOqXgR9Tx4Qqg61dhItudZ
 OOswnGEfFHqEGxgwsOWoH2ITovaOyMBFOy41EcT+ekOEduHa4vp5NeB3ZWq9Oj4LQlMy
 9hjMVN8M/+zYapLwe6gWJIREC0qo/FZHOUyJqvo7WJ6jR66QtYmP4BtWINN2i3ibjqr2
 2nmBKAl7vadzqP2UOfOFW353iCmOp3bZqxGQNm+1ZY3peumSEvybFmqjcaiZTVH/Tdl1
 IJxg==
X-Gm-Message-State: AGi0PuaqdcvUQxJKiEBY0atRBzcfE59zXtvsWPwrbINsc8rsDxot4VHn
 RUL7VBmdsJhhdWyLrOrahox0WAFs6MI=
X-Google-Smtp-Source: APiQypKe2bTFtDKbDRK08NQKF+eK3/ALTHM6m1Iw0vYl0YFCsr7p8VUxQwQ8KcqDdfUUtB2kXBOo8fbq+gY=
X-Received: by 2002:a25:6b0b:: with SMTP id g11mr49133618ybc.425.1588144896924; 
 Wed, 29 Apr 2020 00:21:36 -0700 (PDT)
Date: Wed, 29 Apr 2020 07:21:15 +0000
In-Reply-To: <20200429072121.50094-1-satyat@google.com>
Message-Id: <20200429072121.50094-7-satyat@google.com>
Mime-Version: 1.0
References: <20200429072121.50094-1-satyat@google.com>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.202 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jTh2M-003XhS-Vi
Subject: [f2fs-dev] [PATCH v11 06/12] scsi: ufs: UFS driver v2.1 spec crypto
 additions
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

Add the crypto registers and structs defined in v2.1 of the JEDEC UFSHCI
specification in preparation to add support for inline encryption to
UFS.

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 drivers/scsi/ufs/ufshcd.c |  2 ++
 drivers/scsi/ufs/ufshcd.h |  6 ++++
 drivers/scsi/ufs/ufshci.h | 67 +++++++++++++++++++++++++++++++++++++--
 3 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 698e8d20b4bac..2435c600cb2d9 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -4767,6 +4767,8 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp)
 	case OCS_MISMATCH_RESP_UPIU_SIZE:
 	case OCS_PEER_COMM_FAILURE:
 	case OCS_FATAL_ERROR:
+	case OCS_INVALID_CRYPTO_CONFIG:
+	case OCS_GENERAL_CRYPTO_ERROR:
 	default:
 		result |= DID_ERROR << 16;
 		dev_err(hba->dev,
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 6ffc08ad85f63..1eebb589159d6 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -555,6 +555,12 @@ enum ufshcd_caps {
 	 * for userspace to control the power management.
 	 */
 	UFSHCD_CAP_RPM_AUTOSUSPEND			= 1 << 6,
+
+	/*
+	 * This capability allows the host controller driver to use the
+	 * inline crypto engine, if it is present
+	 */
+	UFSHCD_CAP_CRYPTO				= (1 << 7),
 };
 
 /**
diff --git a/drivers/scsi/ufs/ufshci.h b/drivers/scsi/ufs/ufshci.h
index c2961d37cc1cf..c0651fe6dbbc6 100644
--- a/drivers/scsi/ufs/ufshci.h
+++ b/drivers/scsi/ufs/ufshci.h
@@ -90,6 +90,7 @@ enum {
 	MASK_64_ADDRESSING_SUPPORT		= 0x01000000,
 	MASK_OUT_OF_ORDER_DATA_DELIVERY_SUPPORT	= 0x02000000,
 	MASK_UIC_DME_TEST_MODE_SUPPORT		= 0x04000000,
+	MASK_CRYPTO_SUPPORT			= 0x10000000,
 };
 
 #define UFS_MASK(mask, offset)		((mask) << (offset))
@@ -143,6 +144,7 @@ enum {
 #define DEVICE_FATAL_ERROR			0x800
 #define CONTROLLER_FATAL_ERROR			0x10000
 #define SYSTEM_BUS_FATAL_ERROR			0x20000
+#define CRYPTO_ENGINE_FATAL_ERROR		0x40000
 
 #define UFSHCD_UIC_HIBERN8_MASK	(UIC_HIBERNATE_ENTER |\
 				UIC_HIBERNATE_EXIT)
@@ -155,11 +157,13 @@ enum {
 #define UFSHCD_ERROR_MASK	(UIC_ERROR |\
 				DEVICE_FATAL_ERROR |\
 				CONTROLLER_FATAL_ERROR |\
-				SYSTEM_BUS_FATAL_ERROR)
+				SYSTEM_BUS_FATAL_ERROR |\
+				CRYPTO_ENGINE_FATAL_ERROR)
 
 #define INT_FATAL_ERRORS	(DEVICE_FATAL_ERROR |\
 				CONTROLLER_FATAL_ERROR |\
-				SYSTEM_BUS_FATAL_ERROR)
+				SYSTEM_BUS_FATAL_ERROR |\
+				CRYPTO_ENGINE_FATAL_ERROR)
 
 /* HCS - Host Controller Status 30h */
 #define DEVICE_PRESENT				0x1
@@ -318,6 +322,61 @@ enum {
 	INTERRUPT_MASK_ALL_VER_21	= 0x71FFF,
 };
 
+/* CCAP - Crypto Capability 100h */
+union ufs_crypto_capabilities {
+	__le32 reg_val;
+	struct {
+		u8 num_crypto_cap;
+		u8 config_count;
+		u8 reserved;
+		u8 config_array_ptr;
+	};
+};
+
+enum ufs_crypto_key_size {
+	UFS_CRYPTO_KEY_SIZE_INVALID	= 0x0,
+	UFS_CRYPTO_KEY_SIZE_128		= 0x1,
+	UFS_CRYPTO_KEY_SIZE_192		= 0x2,
+	UFS_CRYPTO_KEY_SIZE_256		= 0x3,
+	UFS_CRYPTO_KEY_SIZE_512		= 0x4,
+};
+
+enum ufs_crypto_alg {
+	UFS_CRYPTO_ALG_AES_XTS			= 0x0,
+	UFS_CRYPTO_ALG_BITLOCKER_AES_CBC	= 0x1,
+	UFS_CRYPTO_ALG_AES_ECB			= 0x2,
+	UFS_CRYPTO_ALG_ESSIV_AES_CBC		= 0x3,
+};
+
+/* x-CRYPTOCAP - Crypto Capability X */
+union ufs_crypto_cap_entry {
+	__le32 reg_val;
+	struct {
+		u8 algorithm_id;
+		u8 sdus_mask; /* Supported data unit size mask */
+		u8 key_size;
+		u8 reserved;
+	};
+};
+
+#define UFS_CRYPTO_CONFIGURATION_ENABLE (1 << 7)
+#define UFS_CRYPTO_KEY_MAX_SIZE 64
+/* x-CRYPTOCFG - Crypto Configuration X */
+union ufs_crypto_cfg_entry {
+	__le32 reg_val[32];
+	struct {
+		u8 crypto_key[UFS_CRYPTO_KEY_MAX_SIZE];
+		u8 data_unit_size;
+		u8 crypto_cap_idx;
+		u8 reserved_1;
+		u8 config_enable;
+		u8 reserved_multi_host;
+		u8 reserved_2;
+		u8 vsb[2];
+		u8 reserved_3[56];
+	};
+};
+
 /*
  * Request Descriptor Definitions
  */
@@ -339,6 +398,7 @@ enum {
 	UTP_NATIVE_UFS_COMMAND		= 0x10000000,
 	UTP_DEVICE_MANAGEMENT_FUNCTION	= 0x20000000,
 	UTP_REQ_DESC_INT_CMD		= 0x01000000,
+	UTP_REQ_DESC_CRYPTO_ENABLE_CMD	= 0x00800000,
 };
 
 /* UTP Transfer Request Data Direction (DD) */
@@ -358,6 +418,9 @@ enum {
 	OCS_PEER_COMM_FAILURE		= 0x5,
 	OCS_ABORTED			= 0x6,
 	OCS_FATAL_ERROR			= 0x7,
+	OCS_DEVICE_FATAL_ERROR		= 0x8,
+	OCS_INVALID_CRYPTO_CONFIG	= 0x9,
+	OCS_GENERAL_CRYPTO_ERROR	= 0xA,
 	OCS_INVALID_COMMAND_STATUS	= 0x0F,
 	MASK_OCS			= 0x0F,
 };
-- 
2.26.2.303.gf8c07b1a785-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
