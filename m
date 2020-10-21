Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C50529466F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Oct 2020 04:16:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kV3fd-0002KE-Js; Wed, 21 Oct 2020 02:16:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1kV3fb-0002Jy-Rd
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Oct 2020 02:16:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S5lmg/47eSMB0cMlWY5RcQ2SoXrP4WZ/K1BZsdaCAF8=; b=cy1XLCEam7G32OpcChjbZEPpsR
 a5vVs3x1I7Pqx+aMkLY8U5AN9fz3Uy2xO+UYn4Be4eNKAc9U7/n/DZiqSWDWonVSgKkjEpm/v5v7D
 XbsSty0O7ONUgLhaUGDCGjQE41JuFffX/Aab0f0qy8uF9l9T66YvGGn7Ia8eoQcePn6U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S5lmg/47eSMB0cMlWY5RcQ2SoXrP4WZ/K1BZsdaCAF8=; b=PhIbqAsykuJYxKLAO4EaqJS40v
 0QFIloJPia57plncHxs47cx/WM71Xhim7fY930UPLRMn9x+DISk+I1WHYq9CPRfUasZJHe1y+/vRR
 m6u28PDJNiT3PZX4zDvUFYK455m9kEwW+PjBQwyUR+75kAFGKWUDulXaRWFG2uVb5ufA=;
Received: from m42-4.mailgun.net ([69.72.42.4])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kV3fP-006OFP-Oj
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Oct 2020 02:16:07 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603246555; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=S5lmg/47eSMB0cMlWY5RcQ2SoXrP4WZ/K1BZsdaCAF8=;
 b=ov89IIAMX3VelrDYq6EfzrM387hNbJUw8rv4Ox0P5gN/W9LoXTF5JOV+OSi2hVyBdbqiT0Gn
 BhcbMV7KAzUFE7IUnRKi1ljv12j7iIGrLDo2Mg/e74Vx7koMNZfq3RtsqP/UQ6xMqyqdjxPw
 OfBDDFlESRvw4q55E6nWD3ywFqo=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f8f9762a03b63d673963f9f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Oct 2020 02:05:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7819AC433FE; Wed, 21 Oct 2020 02:05:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4AD07C433C9;
 Wed, 21 Oct 2020 02:05:21 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 21 Oct 2020 10:05:21 +0800
From: Can Guo <cang@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
In-Reply-To: <20201020195258.2005605-2-jaegeuk@kernel.org>
References: <20201020195258.2005605-1-jaegeuk@kernel.org>
 <20201020195258.2005605-2-jaegeuk@kernel.org>
Message-ID: <6c7bc6794b215a0ae1ae0cd9d448efa3@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [69.72.42.4 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kV3fP-006OFP-Oj
Subject: Re: [f2fs-dev] [PATCH v2 1/5] scsi: ufs: atomic update for
 clkgating_enable
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
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Avri Altman <avri.altman@wdc.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, kernel-team@android.com,
 Jaegeuk Kim <jaegeuk@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020-10-21 03:52, Jaegeuk Kim wrote:
> From: Jaegeuk Kim <jaegeuk@google.com>
> 
> When giving a stress test which enables/disables clkgating, we hit 
> device
> timeout sometimes. This patch avoids subtle racy condition to address 
> it.
> 
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Avri Altman <avri.altman@wdc.com>
> Cc: Can Guo <cang@codeaurora.org>
> Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>

Reviewed-by: Can Guo <cang@codeaurora.org>

Next time can you have a cover letter in case of multiple patches?

Thanks,

Can Guo.

> ---
>  drivers/scsi/ufs/ufshcd.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index b8f573a02713..7344353a9167 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -1807,19 +1807,19 @@ static ssize_t
> ufshcd_clkgate_enable_store(struct device *dev,
>  		return -EINVAL;
> 
>  	value = !!value;
> +
> +	spin_lock_irqsave(hba->host->host_lock, flags);
>  	if (value == hba->clk_gating.is_enabled)
>  		goto out;
> 
> -	if (value) {
> -		ufshcd_release(hba);
> -	} else {
> -		spin_lock_irqsave(hba->host->host_lock, flags);
> +	if (value)
> +		__ufshcd_release(hba);
> +	else
>  		hba->clk_gating.active_reqs++;
> -		spin_unlock_irqrestore(hba->host->host_lock, flags);
> -	}
> 
>  	hba->clk_gating.is_enabled = value;
>  out:
> +	spin_unlock_irqrestore(hba->host->host_lock, flags);
>  	return count;
>  }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
