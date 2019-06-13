Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF0B44993
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Jun 2019 19:22:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hbTQr-0005y9-AR; Thu, 13 Jun 2019 17:22:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hbTQo-0005xx-U2
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 17:22:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yjc1XJHZcRozdhLdX375xfOlBZOLJSIRjcDIhwNu6Qw=; b=msvd0RrPc5GpI44QRGjnIcEcZt
 WDynboE7eWHyPNrOnyfaV2oPy/LJWGGD7WoorlrKlsKbZCePrRPOxXrqDcqW1FfqCMDr7IhXm9Ek+
 yycWKjQPdrPGz4XPGCNDn8AqHi4RFga8tjzxDUm3WlPPMFLDt4YbxDUNngeYEW2Zm49o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yjc1XJHZcRozdhLdX375xfOlBZOLJSIRjcDIhwNu6Qw=; b=L4qJO4OhiBT1fxjCivtS+CI4zd
 ztJAoHBeJZHjM4GHQPyuGk6kP4AVxILeEjPSSwpbtOQMFVmiGlGaWI2byHvQakq+KY1XyXOAWDspS
 /bZUQ/k8Ocaui6fO/KsRqm/zI0zDRabZJsmQTjkcduL10AHyfA01kuyEOfvrL0uw7eE4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hbTQl-00Boqx-6e
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 17:22:33 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CC1120679;
 Thu, 13 Jun 2019 17:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560446545;
 bh=PbtCWYw3+/L5ZSdTrza2PBMyBjK1af03TxKxZn//NJA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X02a/0K3/6+STmDdWAWoZEUWQy7LmmshnJFa3prXcJCSlZRlPWg1XFJeETJBfo9XF
 ZFom9WVDK5jgSJ0lPTG4HWzzt9glRAl5ECidMDs1Cyax5P8RE6Fqc86z0stV+YzfeO
 MnGyjEu8P25bl0n07U3CuqsbF0bHJ5eYRCm3MqNU=
Date: Thu, 13 Jun 2019 10:22:23 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20190613172223.GC686@sol.localdomain>
References: <20190605232837.31545-1-satyat@google.com>
 <20190605232837.31545-7-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605232837.31545-7-satyat@google.com>
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
X-Headers-End: 1hbTQl-00Boqx-6e
Subject: Re: [f2fs-dev] [RFC PATCH v2 6/8] scsi: ufs: Add inline encryption
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
Cc: Ladvine D Almeida <ladvine.dalmeida@synopsys.com>,
 linux-scsi@vger.kernel.org, Parshuram Raju Thombare <pthombar@cadence.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 05, 2019 at 04:28:35PM -0700, Satya Tangirala wrote:
> +static inline int ufshcd_prepare_lrbp_crypto(struct ufs_hba *hba,
> +					     struct scsi_cmnd *cmd,
> +					     struct ufshcd_lrb *lrbp)
> +{
> +	int key_slot;
> +
> +	if (!bio_crypt_should_process(cmd->request->bio,
> +					cmd->request->q)) {
> +		lrbp->crypto_enable = false;
> +		return 0;
> +	}

Nit: this 'if' expression fits on one line.

>  static int ufshcd_slave_configure(struct scsi_device *sdev)
>  {
>  	struct request_queue *q = sdev->request_queue;
> +	struct ufs_hba *hba = shost_priv(sdev->host);
>  
>  	blk_queue_update_dma_pad(q, PRDT_DATA_BYTE_COUNT_PAD - 1);
>  	blk_queue_max_segment_size(q, PRDT_DATA_BYTE_COUNT_MAX);
>  
> +	ufshcd_crypto_setup_rq_keyslot_manager(hba, q);
> +
>  	return 0;
>  }
>  
> @@ -4598,6 +4660,7 @@ static int ufshcd_slave_configure(struct scsi_device *sdev)
>  static void ufshcd_slave_destroy(struct scsi_device *sdev)
>  {
>  	struct ufs_hba *hba;
> +	struct request_queue *q = sdev->request_queue;
>  
>  	hba = shost_priv(sdev->host);
>  	/* Drop the reference as it won't be needed anymore */
> @@ -4608,6 +4671,8 @@ static void ufshcd_slave_destroy(struct scsi_device *sdev)
>  		hba->sdev_ufs_device = NULL;
>  		spin_unlock_irqrestore(hba->host->host_lock, flags);
>  	}
> +
> +	ufshcd_crypto_destroy_rq_keyslot_manager(q);
>  }

Each scsi_device is still getting its own keyslot manager.  As discussed before,
this is wrong because the keyslots are per-host controller, not per-device.

So the keyslot manager needs to be a property of the ufs_hba instead, and each
device's request_queue needs to reference that same keyslot manager.

> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index d3b6a6b57a37..283014e0924f 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -167,6 +167,9 @@ struct ufs_pm_lvl_states {
>   * @intr_cmd: Interrupt command (doesn't participate in interrupt aggregation)
>   * @issue_time_stamp: time stamp for debug purposes
>   * @compl_time_stamp: time stamp for statistics
> + * @crypto_enable: whether or not the request needs inline crypto operations
> + * @crypto_key_slot: the key slot to use for inline crypto
> + * @data_unit_num: the data unit number for the first block for inline crypto
>   * @req_abort_skip: skip request abort task flag
>   */
>  struct ufshcd_lrb {
> @@ -191,6 +194,9 @@ struct ufshcd_lrb {
>  	bool intr_cmd;
>  	ktime_t issue_time_stamp;
>  	ktime_t compl_time_stamp;
> +	bool crypto_enable;
> +	u8 crypto_key_slot;
> +	u64 data_unit_num;

Maybe these fields should be conditional on CONFIG_SCSI_UFS_CRYPTO too?

>  
>  	bool req_abort_skip;
>  };
> @@ -501,6 +507,10 @@ struct ufs_stats {
>   * @is_urgent_bkops_lvl_checked: keeps track if the urgent bkops level for
>   *  device is known or not.
>   * @scsi_block_reqs_cnt: reference counting for scsi block requests
> + * @crypto_capabilities: Content of crypto capabilities register (0x100)
> + * @crypto_cap_array: Array of crypto capabilities
> + * @crypto_cfg_register: Start of the crypto cfg array
> + * @crypto_cfgs: Array of crypto configurations (i.e. config for each slot)
>   */
>  struct ufs_hba {
>  	void __iomem *mmio_base;
> @@ -711,6 +721,14 @@ struct ufs_hba {
>  
>  	struct device		bsg_dev;
>  	struct request_queue	*bsg_queue;
> +
> +#ifdef CONFIG_SCSI_UFS_CRYPTO
> +	/* crypto */
> +	union ufs_crypto_capabilities crypto_capabilities;
> +	union ufs_crypto_cap_entry *crypto_cap_array;
> +	u32 crypto_cfg_register;
> +	union ufs_crypto_cfg_entry *crypto_cfgs;
> +#endif /* CONFIG_SCSI_UFS_CRYPTO */
>  };
>  
>  /* Returns true if clocks can be gated. Otherwise false */
> -- 
> 2.22.0.rc1.311.g5d7573a151-goog
> 

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
