Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D579F6E0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Aug 2019 01:26:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i2kqk-0002Oh-2L; Tue, 27 Aug 2019 23:26:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1i2kqe-0002Nl-Og
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Aug 2019 23:26:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D2Z4BT22MLG9/ONyXicJTpBpY4bxH6cwSqHveuNJTus=; b=eahMtTMt/Zr+eCgaazGP4tSyqx
 BEb24mVIWttvfiddRARtsv4KxQRqP3KN23zX98gUQ2urQuw+ciWBywQfcJgPOUogYD6ATJyCeD1bv
 5uewgery/1ZG7tDVehaTRKSHSH9jVUSUO+zMpClgn2lB2DgdCwh84Bd/IcX3mNmKwFO0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D2Z4BT22MLG9/ONyXicJTpBpY4bxH6cwSqHveuNJTus=; b=XT3006UqhM2+6N6gXH5/1gLHRZ
 1xHDTtrhO/H6nC0GApYpaX/ISGDBDHBkVuQQFRnNpcdKXCjDK6a2Fg7+IVg1xg1k4pAvRdLtuchjf
 vw9ENS+xcczofQx5uLhWvw9vKDlKcS7U957S1HQL8KjAeZgot4Amj+GaZH5DncqW7SUU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i2kqd-005YVA-KN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Aug 2019 23:26:00 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B093420856;
 Tue, 27 Aug 2019 23:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566948354;
 bh=kMH6BdnXJ0P1hQ2TM0m1VxKP+jJ+UNc7nQOh8WbQ5Gk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fzp493DGyrg1ykv7936i4fHAp9VPTqGr0lZM0f0hRIYmEY0Z0zFg/lz3/M2PXMOQh
 rllvYtJgcYjLzn+R5A7WBLebZR2yHRqIsRwDkBvrrwnwBG153NKuWW3w+i6Y+XYfzB
 G+W8UaZo4Jo98QfQkpkewv8SrDB/kJ1eUppmFsj4=
Date: Tue, 27 Aug 2019 16:25:52 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20190827232550.GA92220@gmail.com>
Mail-Followup-To: Satya Tangirala <satyat@google.com>,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Kim Boojin <boojin.kim@samsung.com>
References: <20190821075714.65140-1-satyat@google.com>
 <20190821075714.65140-6-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821075714.65140-6-satyat@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.2 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i2kqd-005YVA-KN
Subject: Re: [f2fs-dev] [PATCH v4 5/8] scsi: ufs: UFS crypto API
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
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 21, 2019 at 12:57:11AM -0700, Satya Tangirala wrote:
> +static int ufshcd_crypto_cap_find(void *hba_p,
> +			   enum blk_crypto_mode_num crypto_mode,
> +			   unsigned int data_unit_size)
> +{
> +	struct ufs_hba *hba = hba_p;
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
> +	/*
> +	 * case BLK_CRYPTO_ALG_BITLOCKER_AES_CBC:
> +	 *	ufs_alg = UFS_CRYPTO_ALG_BITLOCKER_AES_CBC;
> +	 *	break;
> +	 * case BLK_CRYPTO_ALG_AES_ECB:
> +	 *	ufs_alg = UFS_CRYPTO_ALG_AES_ECB;
> +	 *	break;
> +	 * case BLK_CRYPTO_ALG_ESSIV_AES_CBC:
> +	 *	ufs_alg = UFS_CRYPTO_ALG_ESSIV_AES_CBC;
> +	 *	break;
> +	 */

Perhaps just delete this comment... the constants are already outdated.

> +	hba->crypto_cfgs =
> +		devm_kcalloc(hba->dev,
> +			     hba->crypto_capabilities.config_count + 1,
> +			     sizeof(hba->crypto_cfgs[0]),
> +			     GFP_KERNEL);

Can use NUM_KEYSLOTS(hba) here, to avoid hardcoding the awkward '+ 1' again.

> +void ufshcd_crypto_setup_rq_keyslot_manager(struct ufs_hba *hba,
> +					    struct request_queue *q)
> +{
> +	if (!ufshcd_hba_is_crypto_supported(hba))
> +		return;
> +
> +	if (q) {
> +		mutex_lock(&hba->ksm_lock);
> +		if (!hba->ksm) {
> +			hba->ksm = keyslot_manager_create(
> +				hba->crypto_capabilities.config_count + 1,
> +				&ufshcd_ksm_ops, hba);
> +			hba->ksm_num_refs = 0;

Same here.

> +		}
> +		hba->ksm_num_refs++;
> +		mutex_unlock(&hba->ksm_lock);
> +		q->ksm = hba->ksm;
> +	}
> +	/*
> +	 * If we fail we make it look like
> +	 * crypto is not supported, which will avoid issues
> +	 * with reset
> +	 */
> +	if (!q || !q->ksm) {
> +		ufshcd_crypto_disable(hba);
> +		hba->crypto_capabilities.reg_val = 0;
> +		devm_kfree(hba->dev, hba->crypto_cap_array);
> +		devm_kfree(hba->dev, hba->crypto_cfgs);
> +	}
> +}
> +
> +void ufshcd_crypto_destroy_rq_keyslot_manager(struct ufs_hba *hba,
> +					      struct request_queue *q)
> +{
> +	if (q && q->ksm) {
> +		q->ksm = NULL;
> +		mutex_lock(&hba->ksm_lock);
> +		hba->ksm_num_refs--;
> +		if (hba->ksm_num_refs == 0) {
> +			keyslot_manager_destroy(hba->ksm);
> +			hba->ksm = NULL;
> +		}
> +		mutex_unlock(&hba->ksm_lock);
> +	}
> +}

Why is the keyslot_manager reference counted?  Doesn't it live as long as the
individual devices do?  So, can't we just create the keyslot manager when the
ufs_hba is created, and destroy it when the ufs_hba is destroyed?  Then for each
device we'd just set 'q->ksm = hba->ksm;', with no refcounting needed.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
