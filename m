Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7923A1D4432
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 May 2020 05:56:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jZRSE-0003mi-EA; Fri, 15 May 2020 03:56:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stanley.chu@mediatek.com>) id 1jZRSD-0003mV-8o
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 May 2020 03:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FIgtJPFxyfCI4OyCVzpT8IeOjmdr2nF5V1WfWYeRSDo=; b=S88aF68wOc9wYBAdEG8bIoGgbH
 fw37S5/4LpemL1AIp7/IL3si4N+z6obnDWyX+PYxsmBQmeErXCL4rK+vpePPAvQRrF6HjJHXaJQSQ
 f/f9X3TlsmxAsu82pPmJZZLwuR1kEB96oI40rhbcQwv06kA4nrRci0sBpHFKCPJdeJgU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FIgtJPFxyfCI4OyCVzpT8IeOjmdr2nF5V1WfWYeRSDo=; b=hlMHAfOwOa3YVCzAcSTpIdIe5U
 axiw1SVxx6UTY1JysIPv+wBsjUZJY24PNP66yZhskPZOjQ7xzfUSOcEio2LduuVGKH2nQm26uN4vo
 Pc91Q7GYfOPyHxgUn7IPNr3IJTgRnrE+urBB1qgYtSrmrOGHpnraXfB2SHY0l0TlXpJE=;
Received: from [210.61.82.183] (helo=mailgw01.mediatek.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1jZRS6-00851M-RY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 May 2020 03:56:09 +0000
X-UUID: 8a4f21b0b7d84073b78ae9e67e94ec41-20200515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=FIgtJPFxyfCI4OyCVzpT8IeOjmdr2nF5V1WfWYeRSDo=; 
 b=Do86qxYH39Brv/cvZSm/P3gZCC4EVUvzLH4BEaEG9Y+KEcKpBbEatL3xXFJcIhD0Lbd/BH6RLCwOCRzkk1hKpzaZO01NPqsHtA7TnljbwfUXhKBcUvabiOjUiaHRIPHmLDWdljVooxYDpmV4JE0woRgEkUf/GpI+R/keh61YJ5w=;
X-UUID: 8a4f21b0b7d84073b78ae9e67e94ec41-20200515
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <stanley.chu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 216926550; Fri, 15 May 2020 11:55:37 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 May 2020 11:55:36 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 May 2020 11:55:36 +0800
Message-ID: <1589514936.3197.108.camel@mtkswgap22>
From: Stanley Chu <stanley.chu@mediatek.com>
To: Satya Tangirala <satyat@google.com>
Date: Fri, 15 May 2020 11:55:36 +0800
In-Reply-To: <20200514003727.69001-7-satyat@google.com>
References: <20200514003727.69001-1-satyat@google.com>
 <20200514003727.69001-7-satyat@google.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.9 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZRS6-00851M-RY
Subject: Re: [f2fs-dev] [PATCH v13 06/12] scsi: ufs: UFS driver v2.1 spec
 crypto additions
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Eric
 Biggers <ebiggers@google.com>, Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Satya,

On Thu, 2020-05-14 at 00:37 +0000, Satya Tangirala wrote:
> Add the crypto registers and structs defined in v2.1 of the JEDEC UFSHCI
> specification in preparation to add support for inline encryption to
> UFS.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>
> Reviewed-by: Eric Biggers <ebiggers@google.com>
> ---
>  drivers/scsi/ufs/ufshcd.c |  2 ++
>  drivers/scsi/ufs/ufshcd.h |  6 ++++
>  drivers/scsi/ufs/ufshci.h | 67 +++++++++++++++++++++++++++++++++++++--
>  3 files changed, 73 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 698e8d20b4bac..2435c600cb2d9 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -4767,6 +4767,8 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp)
>  	case OCS_MISMATCH_RESP_UPIU_SIZE:
>  	case OCS_PEER_COMM_FAILURE:
>  	case OCS_FATAL_ERROR:
> +	case OCS_INVALID_CRYPTO_CONFIG:
> +	case OCS_GENERAL_CRYPTO_ERROR:
>  	default:
>  		result |= DID_ERROR << 16;
>  		dev_err(hba->dev,
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index 6ffc08ad85f63..835b9a844aa21 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -555,6 +555,12 @@ enum ufshcd_caps {
>  	 * for userspace to control the power management.
>  	 */
>  	UFSHCD_CAP_RPM_AUTOSUSPEND			= 1 << 6,
> +
> +	/*
> +	 * This capability allows the host controller driver to use the
> +	 * inline crypto engine, if it is present
> +	 */
> +	UFSHCD_CAP_CRYPTO				= 1 << 7,
>  };
>  
>  /**
> diff --git a/drivers/scsi/ufs/ufshci.h b/drivers/scsi/ufs/ufshci.h
> index c2961d37cc1cf..c0651fe6dbbc6 100644
> --- a/drivers/scsi/ufs/ufshci.h
> +++ b/drivers/scsi/ufs/ufshci.h
> @@ -90,6 +90,7 @@ enum {
>  	MASK_64_ADDRESSING_SUPPORT		= 0x01000000,
>  	MASK_OUT_OF_ORDER_DATA_DELIVERY_SUPPORT	= 0x02000000,
>  	MASK_UIC_DME_TEST_MODE_SUPPORT		= 0x04000000,
> +	MASK_CRYPTO_SUPPORT			= 0x10000000,
>  };
>  
>  #define UFS_MASK(mask, offset)		((mask) << (offset))
> @@ -143,6 +144,7 @@ enum {
>  #define DEVICE_FATAL_ERROR			0x800
>  #define CONTROLLER_FATAL_ERROR			0x10000
>  #define SYSTEM_BUS_FATAL_ERROR			0x20000
> +#define CRYPTO_ENGINE_FATAL_ERROR		0x40000
>  
>  #define UFSHCD_UIC_HIBERN8_MASK	(UIC_HIBERNATE_ENTER |\
>  				UIC_HIBERNATE_EXIT)
> @@ -155,11 +157,13 @@ enum {
>  #define UFSHCD_ERROR_MASK	(UIC_ERROR |\
>  				DEVICE_FATAL_ERROR |\
>  				CONTROLLER_FATAL_ERROR |\
> -				SYSTEM_BUS_FATAL_ERROR)
> +				SYSTEM_BUS_FATAL_ERROR |\
> +				CRYPTO_ENGINE_FATAL_ERROR)
>  
>  #define INT_FATAL_ERRORS	(DEVICE_FATAL_ERROR |\
>  				CONTROLLER_FATAL_ERROR |\
> -				SYSTEM_BUS_FATAL_ERROR)
> +				SYSTEM_BUS_FATAL_ERROR |\
> +				CRYPTO_ENGINE_FATAL_ERROR)
>  
>  /* HCS - Host Controller Status 30h */
>  #define DEVICE_PRESENT				0x1
> @@ -318,6 +322,61 @@ enum {
>  	INTERRUPT_MASK_ALL_VER_21	= 0x71FFF,
>  };
>  
> +/* CCAP - Crypto Capability 100h */
> +union ufs_crypto_capabilities {
> +	__le32 reg_val;
> +	struct {
> +		u8 num_crypto_cap;
> +		u8 config_count;
> +		u8 reserved;
> +		u8 config_array_ptr;
> +	};
> +};
> +
> +enum ufs_crypto_key_size {
> +	UFS_CRYPTO_KEY_SIZE_INVALID	= 0x0,
> +	UFS_CRYPTO_KEY_SIZE_128		= 0x1,
> +	UFS_CRYPTO_KEY_SIZE_192		= 0x2,
> +	UFS_CRYPTO_KEY_SIZE_256		= 0x3,
> +	UFS_CRYPTO_KEY_SIZE_512		= 0x4,
> +};
> +
> +enum ufs_crypto_alg {
> +	UFS_CRYPTO_ALG_AES_XTS			= 0x0,
> +	UFS_CRYPTO_ALG_BITLOCKER_AES_CBC	= 0x1,
> +	UFS_CRYPTO_ALG_AES_ECB			= 0x2,
> +	UFS_CRYPTO_ALG_ESSIV_AES_CBC		= 0x3,
> +};
> +
> +/* x-CRYPTOCAP - Crypto Capability X */
> +union ufs_crypto_cap_entry {
> +	__le32 reg_val;
> +	struct {
> +		u8 algorithm_id;
> +		u8 sdus_mask; /* Supported data unit size mask */
> +		u8 key_size;
> +		u8 reserved;
> +	};
> +};
> +
> +#define UFS_CRYPTO_CONFIGURATION_ENABLE (1 << 7)
> +#define UFS_CRYPTO_KEY_MAX_SIZE 64
> +/* x-CRYPTOCFG - Crypto Configuration X */
> +union ufs_crypto_cfg_entry {
> +	__le32 reg_val[32];
> +	struct {
> +		u8 crypto_key[UFS_CRYPTO_KEY_MAX_SIZE];
> +		u8 data_unit_size;
> +		u8 crypto_cap_idx;
> +		u8 reserved_1;
> +		u8 config_enable;
> +		u8 reserved_multi_host;
> +		u8 reserved_2;
> +		u8 vsb[2];
> +		u8 reserved_3[56];
> +	};
> +};
> +
>  /*
>   * Request Descriptor Definitions
>   */
> @@ -339,6 +398,7 @@ enum {
>  	UTP_NATIVE_UFS_COMMAND		= 0x10000000,
>  	UTP_DEVICE_MANAGEMENT_FUNCTION	= 0x20000000,
>  	UTP_REQ_DESC_INT_CMD		= 0x01000000,
> +	UTP_REQ_DESC_CRYPTO_ENABLE_CMD	= 0x00800000,
>  };
>  
>  /* UTP Transfer Request Data Direction (DD) */
> @@ -358,6 +418,9 @@ enum {
>  	OCS_PEER_COMM_FAILURE		= 0x5,
>  	OCS_ABORTED			= 0x6,
>  	OCS_FATAL_ERROR			= 0x7,
> +	OCS_DEVICE_FATAL_ERROR		= 0x8,
> +	OCS_INVALID_CRYPTO_CONFIG	= 0x9,
> +	OCS_GENERAL_CRYPTO_ERROR	= 0xA,

A nit is that OCS_DEVICE_FATAL_ERROR definition is added here but not
added in ufshcd_transfer_rsp_status().

This will not have any side effect because OCS_DEVICE_FATAL_ERROR was
already handled by "default" label in ufshcd_transfer_rsp_status().

>  	OCS_INVALID_COMMAND_STATUS	= 0x0F,
>  	MASK_OCS			= 0x0F,
>  };

Otherwise looks good to me.

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
