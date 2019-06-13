Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24894448BC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Jun 2019 19:11:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hbTG3-00016g-8C; Thu, 13 Jun 2019 17:11:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hbTG2-00016S-5G
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 17:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/uCU4boO4FwxZ48pRrg97ehNZuy9nKVxGPu2/PuDTZc=; b=OXZXPnI75PvTAZ+hcKNGwkgbBq
 w20gycOLVfGfjbWqdDn23LoZDm1PZaA1je9SxZ5FHP6DYu6bP0N0Xhb0QmXtH6IEx4cQZTs3T5yva
 Qnydf4Ss5RqKuiTzUX8dm6dbiw54DQBtwg70o+p753yANLXPqnWDxdzP1/7We+M9AQHw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/uCU4boO4FwxZ48pRrg97ehNZuy9nKVxGPu2/PuDTZc=; b=kuuisjtoUx0r5wwYV5zebxhza+
 QBwbcJtEkrSu1xuWeq8OHJQ9KVF9OF/1y2WGo9QwQC9bY/4UV6QQJcmYy6YCJAsQUo6f9G2k7bXVo
 sd01UnxyFFNyPzQwfLY59mGfMrK9QT74NtDdaqkowivyqfsG4qXVDBXDkUsTILCp6K6o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hbTFy-00CCy4-14
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 17:11:25 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4CF022063F;
 Thu, 13 Jun 2019 17:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560445875;
 bh=FBWMxYgWxiNu6570dn7YwBKk4jtYzSoOQbyjngxdWio=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=onyQ0TF6UDHFdLqBxVbYoaq8Vmetqt3XjxdkKH0dS0Gl8rOx6CanWFVNqTD5fhlPW
 CmhHjh0De9XgMRHLmahJfqiLW0NbrhZWZXtRyjPTdqDxYTvTI0JiEhV0DUFGfC4ypv
 Ebrd89F9zTt1JacElWfJJLosLuVPvJO62FCNDpVc=
Date: Thu, 13 Jun 2019 10:11:13 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20190613171113.GB686@sol.localdomain>
References: <20190605232837.31545-1-satyat@google.com>
 <20190605232837.31545-6-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605232837.31545-6-satyat@google.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hbTFy-00CCy4-14
Subject: Re: [f2fs-dev] [RFC PATCH v2 5/8] scsi: ufs: UFS crypto API
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
Cc: Ladvine D Almeida <ladvine.dalmeida@synopsys.com>,
 linux-scsi@vger.kernel.org, Parshuram Raju Thombare <pthombar@cadence.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Satya,

On Wed, Jun 05, 2019 at 04:28:34PM -0700, Satya Tangirala wrote:
> Introduce functions to manipulate UFS inline encryption hardware
> in line with the JEDEC UFSHCI v2.1 specification and to work with the
> block keyslot manager.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>
> ---
>  drivers/scsi/ufs/Kconfig         |  10 +
>  drivers/scsi/ufs/Makefile        |   1 +
>  drivers/scsi/ufs/ufshcd-crypto.c | 438 +++++++++++++++++++++++++++++++
>  drivers/scsi/ufs/ufshcd-crypto.h |  69 +++++
>  4 files changed, 518 insertions(+)
>  create mode 100644 drivers/scsi/ufs/ufshcd-crypto.c
>  create mode 100644 drivers/scsi/ufs/ufshcd-crypto.h
> 

There is a build error after this patch because it adds code that uses the
crypto fields in struct ufs_hba, but those aren't added until the next patch.

It needs to be possible to compile a working kernel after each patch.
Otherwise it breaks bisection.

So, perhaps add the fields in this patch instead.

> +++ b/drivers/scsi/ufs/ufshcd-crypto.c
> @@ -0,0 +1,438 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2019 Google LLC
> + */
> +
> +#include <crypto/algapi.h>
> +
> +#include "ufshcd.h"
> +#include "ufshcd-crypto.h"
> +
> +bool ufshcd_hba_is_crypto_supported(struct ufs_hba *hba)
> +{
> +	return hba->crypto_capabilities.reg_val != 0;
> +}
> +
> +bool ufshcd_is_crypto_enabled(struct ufs_hba *hba)
> +{
> +	return hba->caps & UFSHCD_CAP_CRYPTO;
> +}
> +
> +static bool ufshcd_cap_idx_valid(struct ufs_hba *hba, unsigned int cap_idx)
> +{
> +	return cap_idx < hba->crypto_capabilities.num_crypto_cap;
> +}
> +
> +#define NUM_KEYSLOTS(hba) (hba->crypto_capabilities.config_count + 1)
> +
> +bool ufshcd_keyslot_valid(struct ufs_hba *hba, unsigned int slot)
> +{
> +	/*
> +	 * The actual number of configurations supported is (CFGC+1), so slot
> +	 * numbers range from 0 to config_count inclusive.
> +	 */
> +	return slot < NUM_KEYSLOTS(hba);
> +}

Since ufshcd_hba_is_crypto_supported(), ufshcd_is_crypto_enabled(), and
ufshcd_keyslot_valid() are one-liners, don't access any private structures, and
are used outside this file including on the command submission path, how about
making them inline functions in ufshcd-crypto.h?

> +
> +static int ufshcd_crypto_alg_find(void *hba_p,
> +			   enum blk_crypt_mode_num crypt_mode,
> +			   unsigned int data_unit_size)
> +{

Now that the concept of "crypto alg IDs" is gone, rename this to
ufshcd_crypto_cap_find() and rename the crypto_alg_id variables to cap_idx.

This would make it consistent with using cap_idx elsewhere in the code and avoid
confusion with ufs_crypto_cap_entry::algorithm_id.

> +
> +static int ufshcd_crypto_keyslot_program(void *hba_p, const u8 *key,
> +					 enum blk_crypt_mode_num crypt_mode,
> +					 unsigned int data_unit_size,
> +					 unsigned int slot)
> +{
> +	struct ufs_hba *hba = hba_p;
> +	int err = 0;
> +	u8 data_unit_mask;
> +	union ufs_crypto_cfg_entry cfg;
> +	union ufs_crypto_cfg_entry *cfg_arr = hba->crypto_cfgs;
> +	int crypto_alg_id;
> +
> +	crypto_alg_id = ufshcd_crypto_alg_find(hba_p, crypt_mode,
> +					       data_unit_size);
> +
> +	if (!ufshcd_is_crypto_enabled(hba) ||
> +	    !ufshcd_keyslot_valid(hba, slot) ||
> +	    !ufshcd_cap_idx_valid(hba, crypto_alg_id))
> +		return -EINVAL;
> +
> +	data_unit_mask = get_data_unit_size_mask(data_unit_size);
> +
> +	if (!(data_unit_mask &
> +	      hba->crypto_cap_array[crypto_alg_id].sdus_mask))
> +		return -EINVAL;

Nit: the 'if' expression with data_unit_mask fits on one line.

> +static int ufshcd_crypto_keyslot_find(void *hba_p,
> +				      const u8 *key,
> +				      enum blk_crypt_mode_num crypt_mode,
> +				      unsigned int data_unit_size)
> +{
> +	struct ufs_hba *hba = hba_p;
> +	int err = 0;
> +	int slot;
> +	u8 data_unit_mask;
> +	union ufs_crypto_cfg_entry cfg;
> +	union ufs_crypto_cfg_entry *cfg_arr = hba->crypto_cfgs;
> +	int crypto_alg_id;
> +
> +	crypto_alg_id = ufshcd_crypto_alg_find(hba_p, crypt_mode,
> +					       data_unit_size);
> +
> +	if (!ufshcd_is_crypto_enabled(hba) ||
> +	    !ufshcd_cap_idx_valid(hba, crypto_alg_id))
> +		return -EINVAL;
> +
> +	data_unit_mask = get_data_unit_size_mask(data_unit_size);
> +
> +	if (!(data_unit_mask &
> +	      hba->crypto_cap_array[crypto_alg_id].sdus_mask))
> +		return -EINVAL;

Same here.

> +	for (slot = 0; slot < NUM_KEYSLOTS(hba); slot++) {
> +		if ((cfg_arr[slot].config_enable &
> +		     UFS_CRYPTO_CONFIGURATION_ENABLE) &&
> +		    data_unit_mask == cfg_arr[slot].data_unit_size &&
> +		    crypto_alg_id == cfg_arr[slot].crypto_cap_idx &&
> +		    crypto_memneq(&cfg.crypto_key, cfg_arr[slot].crypto_key,
> +				  UFS_CRYPTO_KEY_MAX_SIZE) == 0) {
> +			memzero_explicit(&cfg, sizeof(cfg));
> +			return slot;
> +		}
> +	}

Nit: as I've mentioned before, I think !crypto_memneq() is easier to read than
'crypto_memneq() == 0'.

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
> +	hba->crypto_cfgs =
> +		devm_kcalloc(hba->dev,
> +			     hba->crypto_capabilities.config_count + 1,
> +			     sizeof(union ufs_crypto_cfg_entry),
> +			     GFP_KERNEL);
> +	if (!hba->crypto_cfgs) {
> +		err = -ENOMEM;
> +		goto out_cfg_mem;
> +	}

Nit: use 'sizeof(hba->crypto_cfgs[0])' rather than 'sizeof(union
ufs_crypto_cfg_entry)', for consistency with the other array allocation.

Thanks,

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
