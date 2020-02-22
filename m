Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC8D168C6D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Feb 2020 06:00:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5MtQ-0002u7-6D; Sat, 22 Feb 2020 04:59:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j5MtP-0002tv-7s
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Feb 2020 04:59:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8IEFCksZdIjWHq8tRt8Hel6dX2zFkfcXhNkTI5aA0d0=; b=SqdvW45aHxNQZfsJ7bXW04xul4
 gsJRswwSBXjLszEaRNcGI5TV0k6WDpNZ/vbrgyFu9E9Mg/wjA9FvWJuBy6r8wVxmRN5FTfBNjHxoU
 acXGcVrvQkxyyZaZuobt8Vx1eJYiUOo1nA6lQUmbxQpqgLydGmixUTIOAR0wUFu/BFFs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8IEFCksZdIjWHq8tRt8Hel6dX2zFkfcXhNkTI5aA0d0=; b=ImGusLbkPWF5QOvepR2xH/GZHH
 ZNPCRNSuxsb3O25xRS3quiG7lHCXNbjI6B4ZHib/HgKmp7ySXHTLMicHCH04Z6owkOQnesR5zfd1L
 M6faGBUpmpqRiTLyS7IasGnW+PuUrqzs1WOlXhFsL7sv13G9n0e8cbLUj6tZsoJsN8V0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5MtG-00DHU1-Pr
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Feb 2020 04:59:55 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EA3CE208C4;
 Sat, 22 Feb 2020 04:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582347581;
 bh=jdJmeQHWfLzP8iz4Tg3BFePEIfcyOXGqPSQppwKYUwU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q0HvI0crrpMhLs1nOWpn7ktNXLBProFVDGFa0wVWZuVo1gjW+5QBddmI96dXgFhxN
 rEuxK240Ae6MPYrnjIXaj0GJotk49aI+loEDIQ2lTYmrBXGaFRhEeIv6gWE+d6aa1x
 NmUalpfEJEEU2QAV4KffW/alTYtb+icN8cdA8YPY=
Date: Fri, 21 Feb 2020 20:59:39 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200222045939.GA848@sol.localdomain>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-6-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221115050.238976-6-satyat@google.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j5MtG-00DHU1-Pr
Subject: Re: [f2fs-dev] [PATCH v7 5/9] scsi: ufs: UFS crypto API
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
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 21, 2020 at 03:50:46AM -0800, Satya Tangirala wrote:
> +static int ufshcd_crypto_cap_find(struct ufs_hba *hba,
> +				  enum blk_crypto_mode_num crypto_mode,
> +				  unsigned int data_unit_size)
> +{
> +	enum ufs_crypto_alg ufs_alg;
> +	u8 data_unit_mask;
> +	int cap_idx;
> +	enum ufs_crypto_key_size ufs_key_size;
> +	union ufs_crypto_cap_entry *ccap_array = hba->crypto_cap_array;
> +
> +	if (!ufshcd_hba_is_crypto_supported(hba))
> +		return -EINVAL;
> +
> +	switch (crypto_mode) {
> +	case BLK_ENCRYPTION_MODE_AES_256_XTS:
> +		ufs_alg = UFS_CRYPTO_ALG_AES_XTS;
> +		ufs_key_size = UFS_CRYPTO_KEY_SIZE_256;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
[...]
> +bool ufshcd_blk_crypto_mode_num_for_alg_dusize(
> +					enum ufs_crypto_alg ufs_crypto_alg,
> +					enum ufs_crypto_key_size key_size,
> +					enum blk_crypto_mode_num *blk_mode_num,
> +					unsigned int *max_dun_bytes_supported)
> +{
> +	/*
> +	 * This is currently the only mode that UFS and blk-crypto both support.
> +	 */
> +	if (ufs_crypto_alg == UFS_CRYPTO_ALG_AES_XTS &&
> +	    key_size == UFS_CRYPTO_KEY_SIZE_256) {
> +		*blk_mode_num = BLK_ENCRYPTION_MODE_AES_256_XTS;
> +		*max_dun_bytes_supported = 8;
> +		return true;
> +	}
> +
> +	return false;
> +}

In UFS, max_dun_bytes_supported is always 8 because it's a property of how the
DUN is conveyed in the UFS standard, not specific to the crypto algorithm.  So,
ufshcd_hba_init_crypto() should just set to 8, and there's no need for this code
that pretends like it could be a per-algorithm thing.

Also, perhaps ufshcd_crypto_cap_find() and this would be better served by a
table that maps between the different conventions for representing the
algorithms?  For now it would just have one entry:

	static const struct {
		enum ufs_crypto_alg ufs_alg;
		enum ufs_crypto_key_size ufs_key_size;
		enum blk_crypto_mode_num blk_mode;
	} ufs_crypto_algs[] = {
		{
			.ufs_alg = UFS_CRYPTO_ALG_AES_XTS,
			.ufs_key_size = UFS_CRYPTO_KEY_SIZE_256, 
			.blk_mode = BLK_ENCRYPTION_MODE_AES_256_XTS,
		},
	};      

But then it would be super easy to add another entry later.

I think the only reason not to do that is if we didn't expect any more
algorithms to be added later.  But in that case it would be simpler to remove
ufshcd_blk_crypto_mode_num_for_alg_dusize() and just hard-code AES-256-XTS, and
likewise make ufshcd_crypto_cap_find() use 'if' instead of 'switch'.

(Note that ufshcd_blk_crypto_mode_num_for_alg_dusize() is also misnamed, as it
doesn't have anything to do with the data unit size. And it should be 'static'.)

> +
> +/**
> + * ufshcd_hba_init_crypto - Read crypto capabilities, init crypto fields in hba
> + * @hba: Per adapter instance
> + *
> + * Return: 0 if crypto was initialized or is not supported, else a -errno value.
> + */
> +int ufshcd_hba_init_crypto(struct ufs_hba *hba)
> +{
> +	int cap_idx = 0;
> +	int err = 0;
> +	enum blk_crypto_mode_num blk_mode_num;
> +	unsigned int max_dun_bytes;
> +
> +	/* Default to disabling crypto */
> +	hba->caps &= ~UFSHCD_CAP_CRYPTO;
> +
> +	/* Return 0 if crypto support isn't present */
> +	if (!(hba->capabilities & MASK_CRYPTO_SUPPORT) ||
> +	    (hba->quirks & UFSHCD_QUIRK_BROKEN_CRYPTO))
> +		goto out;
> +
> +	/*
> +	 * Crypto Capabilities should never be 0, because the
> +	 * config_array_ptr > 04h. So we use a 0 value to indicate that
> +	 * crypto init failed, and can't be enabled.
> +	 */
> +	hba->crypto_capabilities.reg_val =
> +			cpu_to_le32(ufshcd_readl(hba, REG_UFS_CCAP));
> +	hba->crypto_cfg_register =
> +		(u32)hba->crypto_capabilities.config_array_ptr * 0x100;
> +	hba->crypto_cap_array =
> +		devm_kcalloc(hba->dev,
> +			     hba->crypto_capabilities.num_crypto_cap,
> +			     sizeof(hba->crypto_cap_array[0]),
> +			     GFP_KERNEL);
> +	if (!hba->crypto_cap_array) {
> +		err = -ENOMEM;
> +		goto out;
> +	}
> +
> +	err = blk_ksm_init(&hba->ksm, hba->dev, ufshcd_num_keyslots(hba));
> +	if (err)
> +		goto out_free_caps;
> +
> +	hba->ksm.ksm_ll_ops = ufshcd_ksm_ops;
> +	hba->ksm.ll_priv_data = hba;

ll_priv_data isn't used anymore, so it should be removed.

> +
> +	memset(hba->ksm.crypto_modes_supported, 0,
> +	       sizeof(hba->ksm.crypto_modes_supported));
> +	memset(hba->ksm.max_dun_bytes_supported, 0,
> +	       sizeof(hba->ksm.max_dun_bytes_supported));

No need to zero these arrays here, since it's already done by blk_ksm_init().

> +	/*
> +	 * Store all the capabilities now so that we don't need to repeatedly
> +	 * access the device each time we want to know its capabilities
> +	 */

This comment is a bit misleading now, since now this loop also initializes the
crypto_modes_supported array, which is *required* and not just a performance
optimization.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
