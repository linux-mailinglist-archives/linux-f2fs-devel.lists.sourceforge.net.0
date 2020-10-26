Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 034692986C5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Oct 2020 07:13:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kWvl5-0002JE-2B; Mon, 26 Oct 2020 06:13:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kWvl4-0002J7-H5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 06:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cr/SDZV+YJW8Gp17QOGU7U4CVFsEcgo0MgCLzb/NmfM=; b=jPcBOSJZfpt2zrL92OOV7lH5Ww
 D5jnScBWv9wAPsjogauHUhyuCzhjCt3p9aVnV1WiSejfoGt+Vpw/UDcI2IHYe4pLuNmclBEarV7IZ
 XMcHcEof5e/7gcDVHKR64yYNTBmjCKwIbkNlnNe5Qdii/7UpIQ6Lnrar8eY1EXNKgYXA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cr/SDZV+YJW8Gp17QOGU7U4CVFsEcgo0MgCLzb/NmfM=; b=iacp9/hH/f54UO7bhmtMQUHshX
 NrALRy4LqbMLL9IpUR15g/T9Sv5OJE+J+ZHFznnUJ8Ly2BKzlIntA7bnHKItoBIuO/BX2hEjP1I4f
 BkF32ssTW5VmTnP9vTbkShp+Pe74NKWU+n7cdbqDcwsNxUtW+ONm3RrpKQfSIss0ZDaE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kWvkw-00DpLI-7K
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 06:13:30 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B35220738;
 Mon, 26 Oct 2020 06:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603692795;
 bh=aQujr3c5hIwOeShsApFTb7WRP6b5nsUJBe4uo9YQeTU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fDUIHOJzpTjLbbSu5shv3Avsw6Lwv0dRHZOu7umJUvvcoyetO36tCj6evv9gJ3Beo
 GKR61mkFHuZr3qIQp+K5P9HbWFsEt1DWCRRpjkYainBlffaRnKcSQH4uWEwFNW/Rkc
 ZWvjJ18r2gf8HsdWophkenPqDIiffXEe3SURJ/TQ=
Date: Sun, 25 Oct 2020 23:13:13 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Can Guo <cang@codeaurora.org>
Message-ID: <20201026061313.GA2517102@google.com>
References: <20201024150646.1790529-1-jaegeuk@kernel.org>
 <20201024150646.1790529-2-jaegeuk@kernel.org>
 <68cf5fe17691653f07544db5fe390c97@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <68cf5fe17691653f07544db5fe390c97@codeaurora.org>
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
X-Headers-End: 1kWvkw-00DpLI-7K
Subject: Re: [f2fs-dev] [PATCH v3 1/5] scsi: ufs: atomic update for
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
Cc: bvanassche@acm.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 avri.altman@wdc.com, alim.akhtar@samsung.com, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/26, Can Guo wrote:
> On 2020-10-24 23:06, Jaegeuk Kim wrote:
> > From: Jaegeuk Kim <jaegeuk@google.com>
> > 
> > When giving a stress test which enables/disables clkgating, we hit
> > device
> > timeout sometimes. This patch avoids subtle racy condition to address
> > it.
> > 
> > If we use __ufshcd_release(), I've seen that gate_work can be called in
> > parallel
> > with ungate_work, which results in UFS timeout when doing hibern8.
> > Should avoid it.
> > 
> 
> I don't understand this comment. gate_work and ungate_work are queued on
> an ordered workqueue and an ordered workqueue executes at most one work item
> at any given time in the queued order. How can the two run in parallel?

When I hit UFS stuck, I saw this by clkgating tracepoint.

- REQ_CLK_OFF
- CLKS_OFF
- REQ_CLK_OFF
- REQ_CLKS_ON
..

By using active_req, I don't see any problem.

> 
> Thanks,
> 
> Can Guo.
> 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
> > ---
> >  drivers/scsi/ufs/ufshcd.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> > index b8f573a02713..e0b479f9eb8a 100644
> > --- a/drivers/scsi/ufs/ufshcd.c
> > +++ b/drivers/scsi/ufs/ufshcd.c
> > @@ -1807,19 +1807,19 @@ static ssize_t
> > ufshcd_clkgate_enable_store(struct device *dev,
> >  		return -EINVAL;
> > 
> >  	value = !!value;
> > +
> > +	spin_lock_irqsave(hba->host->host_lock, flags);
> >  	if (value == hba->clk_gating.is_enabled)
> >  		goto out;
> > 
> > -	if (value) {
> > -		ufshcd_release(hba);
> > -	} else {
> > -		spin_lock_irqsave(hba->host->host_lock, flags);
> > +	if (value)
> > +		hba->clk_gating.active_reqs--;
> > +	else
> >  		hba->clk_gating.active_reqs++;
> > -		spin_unlock_irqrestore(hba->host->host_lock, flags);
> > -	}
> > 
> >  	hba->clk_gating.is_enabled = value;
> >  out:
> > +	spin_unlock_irqrestore(hba->host->host_lock, flags);
> >  	return count;
> >  }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
