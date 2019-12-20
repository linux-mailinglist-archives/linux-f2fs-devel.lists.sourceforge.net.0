Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2FB127568
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Dec 2019 06:45:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iiB5v-0004Qw-Nh; Fri, 20 Dec 2019 05:44:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iiB5u-0004Qp-OU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Dec 2019 05:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UA53Cp5EdNLiXb948QYY1O+KqvjlcN/zogEkq7rmYyk=; b=fx0wOMFPFhXxBoyp0aiUsVmVAE
 SD9hjvyfrRtJ1FFH7Pm0OPaXl7jvttYoJG9hYLK0DhDuZRqupfGomyGG2RwU/22LSJaDWB2KFH2PS
 9xfS1BNRuvI2u0kLzs09Z6FrUyfglIBqQJyiuSgxGoe3himqODatW4WXnC8qG+QQVU44=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UA53Cp5EdNLiXb948QYY1O+KqvjlcN/zogEkq7rmYyk=; b=WICE81wdzsLEs15d8wgnIVR/9u
 7xud3SEiXiyCWybe7kUFYrKI9cZgmXasrIICNPmN3V3frecgvFMpmEq+DUpYXneqbir/NVLz0WCor
 QJ1U8+eP2wxChcYj6prIUMsQ9fG1sW0DzJ1KmkDaDlBiPZcnytOxs/EMvpnBfBr0mUXs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iiB5r-00AktL-Ab
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Dec 2019 05:44:58 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B84421D7D;
 Fri, 20 Dec 2019 05:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576820684;
 bh=crWqBTWcrWs9Yhos0lMvcsdeK71eAsUMhrzRN5VLDls=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u6bqa5Kiip/6ahbVT5hOuKU19IdN56g9JWtYUfZRTIdrzvnzQyWxjrEXkPz44EwhT
 Jw/r2SBBnmrvnIDAHniEUcNRDJ69m9srW0I5RVFhFCeFWhf/ohypkp+qEGNA49Irq+
 AyDqbRmxX3j6GLIi/aUxl3jSe7NM5UP1WNAfMIjM=
Date: Thu, 19 Dec 2019 21:44:43 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20191220054443.GF718@sol.localdomain>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-7-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218145136.172774-7-satyat@google.com>
X-Spam-Score: -0.5 (/)
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
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iiB5r-00AktL-Ab
Subject: Re: [f2fs-dev] [PATCH v6 6/9] scsi: ufs: Add inline encryption
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 18, 2019 at 06:51:33AM -0800, Satya Tangirala wrote:
> Wire up ufshcd.c with the UFS Crypto API, the block layer inline
> encryption additions and the keyslot manager.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>
> ---
>  drivers/scsi/ufs/ufshcd-crypto.c | 30 ++++++++++++++++++
>  drivers/scsi/ufs/ufshcd-crypto.h | 21 +++++++++++++
>  drivers/scsi/ufs/ufshcd.c        | 54 +++++++++++++++++++++++++++++---
>  drivers/scsi/ufs/ufshcd.h        |  8 +++++
>  4 files changed, 108 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd-crypto.c b/drivers/scsi/ufs/ufshcd-crypto.c
> index b0aa072d9009..749c325686a7 100644
> --- a/drivers/scsi/ufs/ufshcd-crypto.c
> +++ b/drivers/scsi/ufs/ufshcd-crypto.c
> @@ -352,6 +352,36 @@ void ufshcd_crypto_setup_rq_keyslot_manager(struct ufs_hba *hba,
>  }
>  EXPORT_SYMBOL_GPL(ufshcd_crypto_setup_rq_keyslot_manager);
>  
> +int ufshcd_prepare_lrbp_crypto(struct ufs_hba *hba,
> +			       struct scsi_cmnd *cmd,
> +			       struct ufshcd_lrb *lrbp)
> +{
> +	struct bio_crypt_ctx *bc;
> +
> +	if (!bio_crypt_should_process(cmd->request)) {
> +		lrbp->crypto_enable = false;
> +		return 0;
> +	}
> +	bc = cmd->request->bio->bi_crypt_context;
> +
> +	if (WARN_ON(!ufshcd_is_crypto_enabled(hba))) {
> +		/*
> +		 * Upper layer asked us to do inline encryption
> +		 * but that isn't enabled, so we fail this request.
> +		 */
> +		return -EINVAL;
> +	}
> +	if (!ufshcd_keyslot_valid(hba, bc->bc_keyslot))
> +		return -EINVAL;
> +
> +	lrbp->crypto_enable = true;
> +	lrbp->crypto_key_slot = bc->bc_keyslot;
> +	lrbp->data_unit_num = bc->bc_dun[0];
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(ufshcd_prepare_lrbp_crypto);

The UFS driver only uses the first 64 bits of the DUN, but in this version of
the patchset the DUN in the bio_crypt_ctx can be up to the real length of the
algorithm's IV -- which for AES-256-XTS is 128 bits.  So if the user were to
specify anything nonzero in bits 64-127, the crypto would be done incorrectly.

(This case isn't encountered with fscrypt.  But it's still an issue with the
overall approach.)

So there needs to be a way for drivers to declare the max_dun_size they support,
and prevent them from being used with longer DUNs.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
