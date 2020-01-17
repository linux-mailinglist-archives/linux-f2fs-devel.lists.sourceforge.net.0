Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 825F3140B9D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2020 14:52:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1isS2X-0006dn-8D; Fri, 17 Jan 2020 13:51:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+99029fa5cb4ba764ed81+5990+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1isS2V-0006dc-CS
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 13:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ip2cTR5qN3djsZNZYzyPJtYHK3z2QBxzZGbtdMsXahg=; b=XEoH1AYYx5uKXQduVn6+97NqN2
 rvYkVfZShdq9asj2UG7EKV/GJQ+5iz/4071xXbAeL5wkVwrRb6TXhl0d+nf2AkqNodtYLnKQBleiP
 THtWnuC9n5747Gw+BsEtJr+QfLmQpsr7YITN1ER8XvxOsV/pnEx7DkbveHz5rwpp/48E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ip2cTR5qN3djsZNZYzyPJtYHK3z2QBxzZGbtdMsXahg=; b=FrkMBiwLFClB6JdQFL0Ri/uSl+
 GHIf6xVq7WoIoy/JYo/CqDMuWAVF8IEamNlJLkdUnc+5mbAx+s1diF6YiQ6vcZp5YoGR8xq1nykw1
 ti56pnu7x8zjLng9m8qK+ZVDPqGgJL8AUz3LgM4PFXzCGH/TvEHB8qGB4KYRrEpmPk5g=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1isS2Q-00BDc4-CU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 13:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ip2cTR5qN3djsZNZYzyPJtYHK3z2QBxzZGbtdMsXahg=; b=ildL1FlhnQrx29DWrPlZHvUES
 rK9crFCvsQXHCu89JBYkQAl5c42QY6uBiUQ7RRk1HTWdheIAjvLF+LzFTI/qAgyD0hGGKXurOvGzf
 1o/noQirka0NWuzuznNHsVqACY3NtphuDs/pDxSr70PTUyZbqv35os+wNOUnNpl+JDSygiZXQHYmI
 uzAODVnXhj4lw/cp6seRriDbLUYoRU4EzW56MVsrhgG1LV7k+hQl95cT8057Kan0KjpXbBktjYs+z
 Q4IGHWV1XsESFa30ShIfXEM46wB9V7WeGbmDF95GinkWAfXG9fQC/hfq8TUnoe5D25Zy7kWxcKlB+
 /iwcnCvdA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1isS2F-0003Cy-K0; Fri, 17 Jan 2020 13:51:39 +0000
Date: Fri, 17 Jan 2020 05:51:39 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200117135139.GA5670@infradead.org>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-6-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218145136.172774-6-satyat@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1isS2Q-00BDc4-CU
Subject: Re: [f2fs-dev] [PATCH v6 5/9] scsi: ufs: UFS crypto API
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

> index 94c6c5d7334b..e88cdcde83fd 100644
> --- a/drivers/scsi/ufs/Makefile
> +++ b/drivers/scsi/ufs/Makefile
> @@ -12,3 +12,4 @@ obj-$(CONFIG_SCSI_UFSHCD_PLATFORM) += ufshcd-pltfrm.o
>  obj-$(CONFIG_SCSI_UFS_HISI) += ufs-hisi.o
>  obj-$(CONFIG_SCSI_UFS_MEDIATEK) += ufs-mediatek.o
>  obj-$(CONFIG_SCSI_UFS_TI_J721E) += ti-j721e-ufs.o
> +ufshcd-core-$(CONFIG_SCSI_UFS_CRYPTO) += ufshcd-crypto.o

This line should be moved up to just below the previous statement adding
and object to fshcd-core-.

> +static bool ufshcd_cap_idx_valid(struct ufs_hba *hba, unsigned int cap_idx)
> +{
> +	return cap_idx < hba->crypto_capabilities.num_crypto_cap;
> +}
> +
> +static u8 get_data_unit_size_mask(unsigned int data_unit_size)
> +{
> +	if (data_unit_size < 512 || data_unit_size > 65536 ||
> +	    !is_power_of_2(data_unit_size))
> +		return 0;
> +
> +	return data_unit_size / 512;
> +}
> +
> +static size_t get_keysize_bytes(enum ufs_crypto_key_size size)

Please add ufshcd_ prefixes to all the helpers.

> +	pm_runtime_get_sync(hba->dev);
> +	ufshcd_hold(hba, false);
> +	/* Clear the dword 16 */
> +	ufshcd_writel(hba, 0, slot_offset + 16 * sizeof(cfg->reg_val[0]));
> +	/* Ensure that CFGE is cleared before programming the key */
> +	wmb();
> +	for (i = 0; i < 16; i++) {
> +		ufshcd_writel(hba, le32_to_cpu(cfg->reg_val[i]),
> +			      slot_offset + i * sizeof(cfg->reg_val[0]));
> +		/* Spec says each dword in key must be written sequentially */
> +		wmb();
> +	}
> +	/* Write dword 17 */
> +	ufshcd_writel(hba, le32_to_cpu(cfg->reg_val[17]),
> +		      slot_offset + 17 * sizeof(cfg->reg_val[0]));
> +	/* Dword 16 must be written last */
> +	wmb();
> +	/* Write dword 16 */
> +	ufshcd_writel(hba, le32_to_cpu(cfg->reg_val[16]),
> +		      slot_offset + 16 * sizeof(cfg->reg_val[0]));
> +	wmb();

All these wmb calls look bogus as writel itself orders mmio writes,
while wmb is not guaranteed to have any effect on mmio space.

> +EXPORT_SYMBOL_GPL(ufshcd_crypto_enable);

> +}
> +EXPORT_SYMBOL_GPL(ufshcd_crypto_disable);

None of the exported symbols in this file is used outside
ufshcd-core.ko, so all the exports caan be dropped.

> +	if (ufs_crypto_alg == UFS_CRYPTO_ALG_AES_XTS &&
> +		key_size == UFS_CRYPTO_KEY_SIZE_256)
> +		return BLK_ENCRYPTION_MODE_AES_256_XTS;

Please don't indent continuation lines of conditional with a single tab.

> +static inline int ufshcd_num_keyslots(struct ufs_hba *hba)

> +static inline bool ufshcd_keyslot_valid(struct ufs_hba *hba, unsigned int slot)

The two functions are only used in ufshcd-crypto.c and can be moved
there.

> +static inline bool ufshcd_is_crypto_enabled(struct ufs_hba *hba)
> +{
> +	return hba->caps & UFSHCD_CAP_CRYPTO;
> +}

I think this one would be clearer to just open code in the three callers.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
