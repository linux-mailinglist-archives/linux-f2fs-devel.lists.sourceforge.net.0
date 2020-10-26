Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB17299742
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Oct 2020 20:43:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kX8PH-00078K-Uy; Mon, 26 Oct 2020 19:43:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kX8PH-000786-3Z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 19:43:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i7/K8Jz+0zfMaUKeV48jb5eV9gyL8n6Bl2TycVYP80k=; b=cnJX8VVpdlRmGTQ14b2ONFLhGk
 qpq77E+0TXma/24qYF7g8RawUybz8TIvMlB4fL0wTC54xLEYi3xXbS0NyYBPFTBV7TYoHym7JQvh8
 HpFVv2ECmCd3M3aPPfMSz/ftN9WcmXE96o6tPcQwm6QCDzn6aLuyQsAeMJFCaOR4ZXNU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i7/K8Jz+0zfMaUKeV48jb5eV9gyL8n6Bl2TycVYP80k=; b=QO7dQKFKFbuzGf/grEiC1q0M2L
 uewsd3eZLpp3hDrAXoyZ2BQ2TGPkv+WS9PCc+Vwd8uZTKKsFwK9OZoUseViFEj3A6OJ5JS1013tyv
 Ww0oHB8a8eKUx6ibl7UfQOJZk+c8vVwhdGYRiKbGMbQglNV4gO+74DaO/9rwVT1Y26Ps=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kX8P9-00EfnR-Dj
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 19:43:51 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D6DF2087C;
 Mon, 26 Oct 2020 19:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603741417;
 bh=pRjS0+eZxaeWEj3A+YYqBWF7ikHcSLUa5f9mmCAZJnI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JblqeucZceheoI2hlEcCyC6I7gByQsxGY3o3pMWCzYEB6g9aEtDaljR04JOUrcfHk
 I0knx8IWohjlrFY+McoMohaWy/WyR9m/z84XL3VuULmDV0n5LRdTUyI3/ao3vAekof
 n5ccA7nyv1UrjDZ6YDGr/mwtKAoTwxQhaC75jc1s=
Date: Mon, 26 Oct 2020 12:43:36 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: asutoshd@codeaurora.org
Message-ID: <20201026194336.GA226134@google.com>
References: <20201024150646.1790529-1-jaegeuk@kernel.org>
 <20201024150646.1790529-3-jaegeuk@kernel.org>
 <84bad19305642b7faf21a1a48eb3e46f@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84bad19305642b7faf21a1a48eb3e46f@codeaurora.org>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kX8P9-00EfnR-Dj
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
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/26, asutoshd@codeaurora.org wrote:
> On 2020-10-24 08:06, Jaegeuk Kim wrote:
> > From: Jaegeuk Kim <jaegeuk@google.com>
> > 
> > In order to conduct FFU or RPMB operations, UFS needs to clear UAC. This
> > patch
> > clears it explicitly, so that we could get no failure given early
> > execution.
> > 
> 
> What's the meaning of 'given early execution'?

I saw there's hba->wlun_dev_clr_ua to clear UA at ufshcd_set_dev_pwr_mode(),
and thus, assumed there's other path to clear UA. So, with this patch, user
can try FFU or RPMB requests regardless of that being done.

> 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
> > ---
> >  drivers/scsi/ufs/ufshcd.c | 70 +++++++++++++++++++++++++++++++++++----
> >  drivers/scsi/ufs/ufshcd.h |  1 +
> >  2 files changed, 65 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> > index e0b479f9eb8a..011e80a21170 100644
> > --- a/drivers/scsi/ufs/ufshcd.c
> > +++ b/drivers/scsi/ufs/ufshcd.c
> > @@ -7057,7 +7057,6 @@ static inline void
> > ufshcd_blk_pm_runtime_init(struct scsi_device *sdev)
> >  static int ufshcd_scsi_add_wlus(struct ufs_hba *hba)
> >  {
> >  	int ret = 0;
> > -	struct scsi_device *sdev_rpmb;
> >  	struct scsi_device *sdev_boot;
> > 
> >  	hba->sdev_ufs_device = __scsi_add_device(hba->host, 0, 0,
> > @@ -7070,14 +7069,14 @@ static int ufshcd_scsi_add_wlus(struct ufs_hba
> > *hba)
> >  	ufshcd_blk_pm_runtime_init(hba->sdev_ufs_device);
> >  	scsi_device_put(hba->sdev_ufs_device);
> > 
> > -	sdev_rpmb = __scsi_add_device(hba->host, 0, 0,
> > +	hba->sdev_rpmb = __scsi_add_device(hba->host, 0, 0,
> >  		ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_RPMB_WLUN), NULL);
> > -	if (IS_ERR(sdev_rpmb)) {
> > -		ret = PTR_ERR(sdev_rpmb);
> > +	if (IS_ERR(hba->sdev_rpmb)) {
> > +		ret = PTR_ERR(hba->sdev_rpmb);
> >  		goto remove_sdev_ufs_device;
> >  	}
> > -	ufshcd_blk_pm_runtime_init(sdev_rpmb);
> > -	scsi_device_put(sdev_rpmb);
> > +	ufshcd_blk_pm_runtime_init(hba->sdev_rpmb);
> > +	scsi_device_put(hba->sdev_rpmb);
> > 
> >  	sdev_boot = __scsi_add_device(hba->host, 0, 0,
> >  		ufshcd_upiu_wlun_to_scsi_wlun(UFS_UPIU_BOOT_WLUN), NULL);
> > @@ -7601,6 +7600,63 @@ static int ufshcd_add_lus(struct ufs_hba *hba)
> >  	return ret;
> >  }
> > 
> > +static int
> > +ufshcd_send_request_sense(struct ufs_hba *hba, struct scsi_device
> > *sdp);
> > +
> > +static int ufshcd_clear_ua_wlun(struct ufs_hba *hba, u8 wlun)
> > +{
> > +	struct scsi_device *sdp;
> > +	unsigned long flags;
> > +	int ret = 0;
> > +
> > +	spin_lock_irqsave(hba->host->host_lock, flags);
> > +	if (wlun  == UFS_UPIU_UFS_DEVICE_WLUN)
> > +		sdp = hba->sdev_ufs_device;
> > +	else if (wlun  == UFS_UPIU_RPMB_WLUN)
> > +		sdp = hba->sdev_rpmb;
> > +	else
> > +		BUG_ON(1);
> > +	if (sdp) {
> > +		ret = scsi_device_get(sdp);
> > +		if (!ret && !scsi_device_online(sdp)) {
> > +			ret = -ENODEV;
> > +			scsi_device_put(sdp);
> > +		}
> > +	} else {
> > +		ret = -ENODEV;
> > +	}
> > +	spin_unlock_irqrestore(hba->host->host_lock, flags);
> > +	if (ret)
> > +		goto out_err;
> > +
> > +	ret = ufshcd_send_request_sense(hba, sdp);
> > +	scsi_device_put(sdp);
> > +out_err:
> > +	if (ret)
> > +		dev_err(hba->dev, "%s: UAC clear LU=%x ret = %d\n",
> > +				__func__, wlun, ret);
> > +	return ret;
> > +}
> > +
> > +static int ufshcd_clear_ua_wluns(struct ufs_hba *hba)
> > +{
> > +	int ret = 0;
> > +
> > +	if (!hba->wlun_dev_clr_ua)
> > +		goto out;
> > +
> > +	ret = ufshcd_clear_ua_wlun(hba, UFS_UPIU_UFS_DEVICE_WLUN);
> > +	if (!ret)
> > +		ret = ufshcd_clear_ua_wlun(hba, UFS_UPIU_RPMB_WLUN);
> > +	if (!ret)
> > +		hba->wlun_dev_clr_ua = false;
> > +out:
> > +	if (ret)
> > +		dev_err(hba->dev, "%s: Failed to clear UAC WLUNS ret = %d\n",
> > +				__func__, ret);
> > +	return ret;
> > +}
> > +
> >  /**
> >   * ufshcd_probe_hba - probe hba to detect device and initialize
> >   * @hba: per-adapter instance
> > @@ -7720,6 +7776,8 @@ static void ufshcd_async_scan(void *data,
> > async_cookie_t cookie)
> >  		pm_runtime_put_sync(hba->dev);
> >  		ufshcd_exit_clk_scaling(hba);
> >  		ufshcd_hba_exit(hba);
> > +	} else {
> > +		ufshcd_clear_ua_wluns(hba);
> >  	}
> >  }
> > 
> > diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> > index 47eb1430274c..718881d038f5 100644
> > --- a/drivers/scsi/ufs/ufshcd.h
> > +++ b/drivers/scsi/ufs/ufshcd.h
> > @@ -681,6 +681,7 @@ struct ufs_hba {
> >  	 * "UFS device" W-LU.
> >  	 */
> >  	struct scsi_device *sdev_ufs_device;
> > +	struct scsi_device *sdev_rpmb;
> > 
> >  	enum ufs_dev_pwr_mode curr_dev_pwr_mode;
> >  	enum uic_link_state uic_link_state;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
