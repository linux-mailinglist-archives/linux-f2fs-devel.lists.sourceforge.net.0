Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CDC29953E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Oct 2020 19:26:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kX7C2-000768-JK; Mon, 26 Oct 2020 18:26:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1kX7C1-00075g-1U
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 18:26:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G0eqTb28YUCQE6wydCPTKC1qYreOL0mpGP289xk3vI0=; b=eNXIrzZL5yjgsNRakpmtftIrmb
 ABhCFRAoy6N18/IzzZPO43LngdyxZHh8/aSI2RjIVb6x/8VEIvcdimZ5Q/mDg6fUon0o0ZGuIrjQR
 eBEvWDnF8KNiI59MNx3WXMsJLVnu2axQHj8lZ+2xvyL0EBz+sphUtgjEXUDqGWtrEm7c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G0eqTb28YUCQE6wydCPTKC1qYreOL0mpGP289xk3vI0=; b=OHKgY63fFOtfJwVCO2k3ld4ufO
 VMf7ZI+Ejlua/gpqoKESaVhhLgLyDHHsW4FEyaX1FjDIhkP9SsQmQebCEfyzvbOSyUfSRy92wsrLs
 /iweVlYmAWRRlbVjYQAC3dM/4S6pIG0Evvtdg/jG3PlLNdO2quM8AEtA/cRNx3MmbNko=;
Received: from m42-4.mailgun.net ([69.72.42.4])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kX7Bn-007uYu-T6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 18:26:04 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603736751; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=G0eqTb28YUCQE6wydCPTKC1qYreOL0mpGP289xk3vI0=;
 b=X5mNbbP4NBYsYvy3p7rAa2sfoT18dnviWG35ZsYHbd1sN38ogtTKd9IXVKzsuz8i6EfZtSh8
 04afISlAUwIgQ90dQ8ZS363m2oOsJWSz8ZR8WGhteBvVl/cbqLRhVAvXIZG1B8QNsNMoKP4r
 gOWEyYEbMe8463K7/ha1scLDKJ4=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f97149fd20d12d202644f54 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Oct 2020 18:25:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F1155C43385; Mon, 26 Oct 2020 18:25:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BA587C433FE;
 Mon, 26 Oct 2020 18:25:32 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 26 Oct 2020 11:25:32 -0700
From: asutoshd@codeaurora.org
To: Jaegeuk Kim <jaegeuk@kernel.org>
In-Reply-To: <20201024150646.1790529-3-jaegeuk@kernel.org>
References: <20201024150646.1790529-1-jaegeuk@kernel.org>
 <20201024150646.1790529-3-jaegeuk@kernel.org>
Message-ID: <84bad19305642b7faf21a1a48eb3e46f@codeaurora.org>
X-Sender: asutoshd@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [69.72.42.4 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kX7Bn-007uYu-T6
Subject: Re: [f2fs-dev] [PATCH v3 2/5] scsi: ufs: clear UAC for FFU and RPMB
 LUNs
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
Cc: bvanassche@acm.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-@vger.kernel.org,
 avri.altman@wdc.com, cang@codeaurora.org, alim.akhtar@samsung.com,
 kernel-team@android.com, Jaegeuk Kim <jaegeuk@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020-10-24 08:06, Jaegeuk Kim wrote:
> From: Jaegeuk Kim <jaegeuk@google.com>
> 
> In order to conduct FFU or RPMB operations, UFS needs to clear UAC. 
> This patch
> clears it explicitly, so that we could get no failure given early 
> execution.
> 

What's the meaning of 'given early execution'?

> Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
> ---
>  drivers/scsi/ufs/ufshcd.c | 70 +++++++++++++++++++++++++++++++++++----
>  drivers/scsi/ufs/ufshcd.h |  1 +
>  2 files changed, 65 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index e0b479f9eb8a..011e80a21170 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -7057,7 +7057,6 @@ static inline void
> ufshcd_blk_pm_runtime_init(struct scsi_device *sdev)
>  static int ufshcd_scsi_add_wlus(struct ufs_hba *hba)
>  {
>  	int ret = 0;
> -	struct scsi_device *sdev_rpmb;
>  	struct scsi_device *sdev_boot;
> 
>  	hba->sdev_ufs_device = __scsi_add_device(hba->host, 0, 0,
> @@ -7070,14 +7069,14 @@ static int ufshcd_scsi_add_wlus(struct ufs_hba 
> *hba)
>  	ufshcd_blk_pm_runtime_init(hba->sdev_ufs_device);
>  	scsi_device_put(hba->sdev_ufs_device);
> 
> -	sdev_rpmb = __scsi_add_device(hba->host, 0, 0,
> +	hba->sdev_rpmb = __scsi_add_device(hba->host, 0, 0,
>  		ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_RPMB_WLUN), NULL);
> -	if (IS_ERR(sdev_rpmb)) {
> -		ret = PTR_ERR(sdev_rpmb);
> +	if (IS_ERR(hba->sdev_rpmb)) {
> +		ret = PTR_ERR(hba->sdev_rpmb);
>  		goto remove_sdev_ufs_device;
>  	}
> -	ufshcd_blk_pm_runtime_init(sdev_rpmb);
> -	scsi_device_put(sdev_rpmb);
> +	ufshcd_blk_pm_runtime_init(hba->sdev_rpmb);
> +	scsi_device_put(hba->sdev_rpmb);
> 
>  	sdev_boot = __scsi_add_device(hba->host, 0, 0,
>  		ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_BOOT_WLUN), NULL);
> @@ -7601,6 +7600,63 @@ static int ufshcd_add_lus(struct ufs_hba *hba)
>  	return ret;
>  }
> 
> +static int
> +ufshcd_send_request_sense(struct ufs_hba *hba, struct scsi_device 
> *sdp);
> +
> +static int ufshcd_clear_ua_wlun(struct ufs_hba *hba, u8 wlun)
> +{
> +	struct scsi_device *sdp;
> +	unsigned long flags;
> +	int ret = 0;
> +
> +	spin_lock_irqsave(hba->host->host_lock, flags);
> +	if (wlun  == UFS_UPIU_UFS_DEVICE_WLUN)
> +		sdp = hba->sdev_ufs_device;
> +	else if (wlun  == UFS_UPIU_RPMB_WLUN)
> +		sdp = hba->sdev_rpmb;
> +	else
> +		BUG_ON(1);
> +	if (sdp) {
> +		ret = scsi_device_get(sdp);
> +		if (!ret && !scsi_device_online(sdp)) {
> +			ret = -ENODEV;
> +			scsi_device_put(sdp);
> +		}
> +	} else {
> +		ret = -ENODEV;
> +	}
> +	spin_unlock_irqrestore(hba->host->host_lock, flags);
> +	if (ret)
> +		goto out_err;
> +
> +	ret = ufshcd_send_request_sense(hba, sdp);
> +	scsi_device_put(sdp);
> +out_err:
> +	if (ret)
> +		dev_err(hba->dev, "%s: UAC clear LU=%x ret = %d\n",
> +				__func__, wlun, ret);
> +	return ret;
> +}
> +
> +static int ufshcd_clear_ua_wluns(struct ufs_hba *hba)
> +{
> +	int ret = 0;
> +
> +	if (!hba->wlun_dev_clr_ua)
> +		goto out;
> +
> +	ret = ufshcd_clear_ua_wlun(hba, UFS_UPIU_UFS_DEVICE_WLUN);
> +	if (!ret)
> +		ret = ufshcd_clear_ua_wlun(hba, UFS_UPIU_RPMB_WLUN);
> +	if (!ret)
> +		hba->wlun_dev_clr_ua = false;
> +out:
> +	if (ret)
> +		dev_err(hba->dev, "%s: Failed to clear UAC WLUNS ret = %d\n",
> +				__func__, ret);
> +	return ret;
> +}
> +
>  /**
>   * ufshcd_probe_hba - probe hba to detect device and initialize
>   * @hba: per-adapter instance
> @@ -7720,6 +7776,8 @@ static void ufshcd_async_scan(void *data,
> async_cookie_t cookie)
>  		pm_runtime_put_sync(hba->dev);
>  		ufshcd_exit_clk_scaling(hba);
>  		ufshcd_hba_exit(hba);
> +	} else {
> +		ufshcd_clear_ua_wluns(hba);
>  	}
>  }
> 
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index 47eb1430274c..718881d038f5 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -681,6 +681,7 @@ struct ufs_hba {
>  	 * "UFS device" W-LU.
>  	 */
>  	struct scsi_device *sdev_ufs_device;
> +	struct scsi_device *sdev_rpmb;
> 
>  	enum ufs_dev_pwr_mode curr_dev_pwr_mode;
>  	enum uic_link_state uic_link_state;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
