Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16984299752
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Oct 2020 20:48:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kX8U1-0001yL-Lc; Mon, 26 Oct 2020 19:48:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kX8Tv-0001y0-Ad
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 19:48:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sjArQGTA5iYQCZe6uet2xBlaP+s8luuHZ/LczasCYGk=; b=Fd2rjup0mvO/NWdGUC/bj0XKYJ
 kVWfQA3hd++2sHZIoI3E7KiYF4UwWvVrIR6n0v8dWT7iIr5BmBDAbQrHr24ARJJCCaEIs6R4XBZQS
 h/CCzpX3i+N+upbkmDOH5DDS6GXgLinvfGjc3ek0w1bZNrcCPCp03X7j2TBPp7XUAY74=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sjArQGTA5iYQCZe6uet2xBlaP+s8luuHZ/LczasCYGk=; b=cIdzb2NHrfGRSGB1GCTyTZCDE+
 kn4Nn+9jfoANopoyN43G3Rsx5Vmkr4QN18wZHK4p8cd7UAMqzqBjXz2YQttJljAQF0mg626J7EBnm
 pYeLxBD5RWMdYUuUrmyOr7hYST/sTyqq5BefV63fLKPtfwziRTS86eqUS8ZVTBEbF4ug=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kX8To-007zYe-GA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 19:48:39 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7F7BC2076D;
 Mon, 26 Oct 2020 19:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603741699;
 bh=0CP8uZo286GYB4ZeSsm3JEfEaYF6gJ46de7Wm5oEt9g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YFfbfsOmu7bIpEI6O6D6dWmYeueVt5Ls58K7cJojaOUDcA/W5Ogra1vmfp4tFoG/b
 Q+BwBZl0EuQg39eDEe1fUs8OirTqXyKFzYX/8CAZUzGYxtZT2XN5P89avKRKXF1wbI
 9PBQ9fu/oUUKPKRmra78sKl1gVvO/GRQvrqDh6mE=
Date: Mon, 26 Oct 2020 12:48:17 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Can Guo <cang@codeaurora.org>
Message-ID: <20201026194817.GA359340@google.com>
References: <20201024150646.1790529-1-jaegeuk@kernel.org>
 <20201024150646.1790529-2-jaegeuk@kernel.org>
 <68cf5fe17691653f07544db5fe390c97@codeaurora.org>
 <20201026061313.GA2517102@google.com>
 <6c029b64cb4d78e7624bc896f9c9f16d@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c029b64cb4d78e7624bc896f9c9f16d@codeaurora.org>
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
X-Headers-End: 1kX8To-007zYe-GA
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
> On 2020-10-26 14:13, Jaegeuk Kim wrote:
> > On 10/26, Can Guo wrote:
> > > On 2020-10-24 23:06, Jaegeuk Kim wrote:
> > > > From: Jaegeuk Kim <jaegeuk@google.com>
> > > >
> > > > When giving a stress test which enables/disables clkgating, we hit
> > > > device
> > > > timeout sometimes. This patch avoids subtle racy condition to address
> > > > it.
> > > >
> > > > If we use __ufshcd_release(), I've seen that gate_work can be called in
> > > > parallel
> > > > with ungate_work, which results in UFS timeout when doing hibern8.
> > > > Should avoid it.
> > > >
> > > 
> > > I don't understand this comment. gate_work and ungate_work are
> > > queued on
> > > an ordered workqueue and an ordered workqueue executes at most one
> > > work item
> > > at any given time in the queued order. How can the two run in
> > > parallel?
> > 
> > When I hit UFS stuck, I saw this by clkgating tracepoint.
> > 
> > - REQ_CLK_OFF
> > - CLKS_OFF
> > - REQ_CLK_OFF
> > - REQ_CLKS_ON
> > ..
> > 
> 
> I don't see how can you tell that the two works are running in parallel
> just from above trace. May I know what is the exact error by "UFS timeout
> when doing hibern8"?
> 
> By using __ufshcd_release() here, I do see one potential issue if your test
> quickly toggles on/off of clk_gating - disable it, enable it, disable it and
> enable it, which will cause that __ufshcd_release() being called twice,
> meaning
> we queue two gate_works back to back. So can you try below code and let me
> know
> if it helps or not? I am OK with your current change, but I would like to
> understand the problem. Thanks.
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 1791bce..3eee438 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -2271,6 +2271,8 @@ static void ufshcd_gate_work(struct work_struct *work)
>         unsigned long flags;
> 
>         spin_lock_irqsave(hba->host->host_lock, flags);
> +       if (hba->clk_gating.state == CLKS_OFF)
> +               goto rel_lock;
>         /*
>          * In case you are here to cancel this work the gating state
>          * would be marked as REQ_CLKS_ON. In this case save time by

This doesn't help. So, I checked this back again, and, like what you said, now
suspect __ufshcd_release() which changed state to REQ_CLKS_OFF on CLKS_OFF.

With the below change, I can see the issue anymore. Let me send v4.

---
 drivers/scsi/ufs/ufshcd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index b8f573a02713..cc8d5f0c3fdc 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1745,7 +1745,8 @@ static void __ufshcd_release(struct ufs_hba *hba)
 	if (hba->clk_gating.active_reqs || hba->clk_gating.is_suspended ||
 	    hba->ufshcd_state != UFSHCD_STATE_OPERATIONAL ||
 	    ufshcd_any_tag_in_use(hba) || hba->outstanding_tasks ||
-	    hba->active_uic_cmd || hba->uic_async_done)
+	    hba->active_uic_cmd || hba->uic_async_done ||
+	    hba->clk_gating.state == CLKS_OFF)
 		return;
 
 	hba->clk_gating.state = REQ_CLKS_OFF;
-- 
2.29.0.rc1.297.gfa9743e501-goog


> 
> Regards,
> 
> Can Guo.
> 
> > By using active_req, I don't see any problem.
> > 
> > > 
> > > Thanks,
> > > 
> > > Can Guo.
> > > 
> > > > Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
> > > > ---
> > > >  drivers/scsi/ufs/ufshcd.c | 12 ++++++------
> > > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> > > > index b8f573a02713..e0b479f9eb8a 100644
> > > > --- a/drivers/scsi/ufs/ufshcd.c
> > > > +++ b/drivers/scsi/ufs/ufshcd.c
> > > > @@ -1807,19 +1807,19 @@ static ssize_t
> > > > ufshcd_clkgate_enable_store(struct device *dev,
> > > >  		return -EINVAL;
> > > >
> > > >  	value = !!value;
> > > > +
> > > > +	spin_lock_irqsave(hba->host->host_lock, flags);
> > > >  	if (value == hba->clk_gating.is_enabled)
> > > >  		goto out;
> > > >
> > > > -	if (value) {
> > > > -		ufshcd_release(hba);
> > > > -	} else {
> > > > -		spin_lock_irqsave(hba->host->host_lock, flags);
> > > > +	if (value)
> > > > +		hba->clk_gating.active_reqs--;
> > > > +	else
> > > >  		hba->clk_gating.active_reqs++;
> > > > -		spin_unlock_irqrestore(hba->host->host_lock, flags);
> > > > -	}
> > > >
> > > >  	hba->clk_gating.is_enabled = value;
> > > >  out:
> > > > +	spin_unlock_irqrestore(hba->host->host_lock, flags);
> > > >  	return count;
> > > >  }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
