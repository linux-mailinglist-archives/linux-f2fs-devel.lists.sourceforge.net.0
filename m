Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E61322986D0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Oct 2020 07:20:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kWvrX-0002Zu-RE; Mon, 26 Oct 2020 06:20:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kWvrW-0002Zg-7m
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 06:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ldTZWq7T3xCPJsB9G4ACU0tzyDnZ4AfUFawsaYc6Doc=; b=ESvWk5J7WcR2sX5rfdcU5YtEP+
 +QAcrXrnWB27SRKWZSRnCLTbIPKbpU5ra+TB34TiSAZCs3LZsqsFWL0Af/zkafjzDSQFClyuFyNCh
 dk3I6tnkWPTLGPWBHT6HHvxIZqczFOw4ima9NktxQozQ0aQyVibpN6QNp+G8f91KaaA4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ldTZWq7T3xCPJsB9G4ACU0tzyDnZ4AfUFawsaYc6Doc=; b=h7r0XfNzxzjEeYXV+88R9RDntw
 CCIYTl6LeXmuAZD39uSCM5nBEktjnhEqlsUaJ4+QBf5yrdMqgFWezAcunE4HHdnf4CHAT0R4bmSzs
 LQXWlHmq91dK6wNzTB5QsGL5BkaGswmrB9KpyKu4sdJULLW4n4hpuz/NmThhq+vb1lYc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kWvrK-00Dpan-OE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 06:20:10 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D59520853;
 Mon, 26 Oct 2020 06:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603693193;
 bh=ZMumJDxtizppcRhEvLccB7zDX1rEZFjVHF761knJgmg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pBd3JBzdGzJPLr0Nblc/VL0kcj3LHkF1QkK2ZIhWfuplBJJU6zXfQReJdXqsbkH5A
 FTzidI8lUc+CCE1gYIWuL3Dreay3Lbt8h4VzjbDFIDvd6JbiPFaK+8MA0MBeiA8C/c
 baHvrucRmV9WOodK/nw37PIg9KYtCfTQmQVqm6uc=
Date: Sun, 25 Oct 2020 23:19:51 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Can Guo <cang@codeaurora.org>
Message-ID: <20201026061951.GB2517102@google.com>
References: <20201020195258.2005605-1-jaegeuk@kernel.org>
 <20201020195258.2005605-6-jaegeuk@kernel.org>
 <2a8ecc4185b3a5411077f4e3fc66000f@codeaurora.org>
 <20201021045213.GB3004521@google.com>
 <e3e58a89474d23f1b9446fe2e38a7426@codeaurora.org>
 <20201022201825.GA3329812@google.com>
 <ccf9079dc1767c7d200fe55b5a849ba0@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ccf9079dc1767c7d200fe55b5a849ba0@codeaurora.org>
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
X-Headers-End: 1kWvrK-00Dpan-OE
Subject: Re: [f2fs-dev] [PATCH v2 5/5] scsi: ufs: fix clkgating on/off
 correctly
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
 Alim Akhtar <alim.akhtar@samsung.com>, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/26, Can Guo wrote:
> On 2020-10-23 08:53, Jaegeuk Kim wrote:
> > On 10/21, Can Guo wrote:
> > > On 2020-10-21 12:52, jaegeuk@kernel.org wrote:
> > > > On 10/21, Can Guo wrote:
> > > > > On 2020-10-21 03:52, Jaegeuk Kim wrote:
> > > > > > The below call stack prevents clk_gating at every IO completion.
> > > > > > We can remove the condition, ufshcd_any_tag_in_use(), since
> > > > > > clkgating_work
> > > > > > will check it again.
> > > > > >
> > > > >
> > > > > I think checking ufshcd_any_tag_in_use() in either ufshcd_release() or
> > > > > gate_work() can break UFS clk gating's functionality.
> > > > >
> > > > > ufshcd_any_tag_in_use() was introduced to replace hba->lrb_in_use.
> > > > > However,
> > > > > they are not exactly same - ufshcd_any_tag_in_use() returns true if
> > > > > any tag
> > > > > assigned from block layer is still in use, but tags are released
> > > > > asynchronously
> > > > > (through block softirq), meaning it does not reflect the real
> > > > > occupation of
> > > > > UFS host.
> > > > > That is after UFS host finishes all tasks, ufshcd_any_tag_in_use()
> > > > > can still
> > > > > return true.
> > > > >
> > > > > This change only removes the check of ufshcd_any_tag_in_use() in
> > > > > ufshcd_release(),
> > > > > but having the check of it in gate_work() can still prevent gating
> > > > > from
> > > > > happening.
> > > > > The current change works for you maybe because the tags are release
> > > > > before
> > > > > hba->clk_gating.delay_ms expires, but if hba->clk_gating.delay_ms is
> > > > > shorter
> > > > > or
> > > > > somehow block softirq is retarded, gate_work() may have chance to see
> > > > > ufshcd_any_tag_in_use()
> > > > > returns true. What do you think?
> > > >
> > > > I don't think this breaks clkgating, but fix the wrong condition check
> > > > which
> > > > prevented gate_work at all. As you mentioned, even if this schedules
> > > > gate_work
> > > > by racy conditions, gate_work will handle it as a last resort.
> > > >
> > > 
> > > If clocks cannot be gated after the last task is cleared from UFS
> > > host, then
> > > clk gating
> > > is broken, no? Assume UFS has completed the last task in its queue,
> > > as this
> > > change says,
> > > ufshcd_any_tag_in_use() is preventing ufshcd_release() from invoking
> > > gate_work().
> > > Similarly, ufshcd_any_tag_in_use() can prevent gate_work() from
> > > doing its
> > > real work -
> > > disabling the clocks. Do you agree?
> > > 
> > >         if (hba->clk_gating.active_reqs
> > >                 || hba->ufshcd_state != UFSHCD_STATE_OPERATIONAL
> > >                 || ufshcd_any_tag_in_use(hba) ||
> > > hba->outstanding_tasks
> > >                 || hba->active_uic_cmd || hba->uic_async_done)
> > >                 goto rel_lock;
> > 
> > I see the point, but this happens only when clkgate_delay_ms is too
> > short
> > to give enough time for releasing tag. If it's correctly set, I think
> > there'd
> > be no problem, unless softirq was delayed by other RT threads which is
> > just
> > a corner case tho.
> > 
> 
> Yes, we are fixing corner cases, aren't we? I thought you would like to
> address it since you are fixing clk gating.

I think that can be fixed by a separate patch which controls delay_ms when
user tries to change it from default 150 ms?

> 
> Regards,
> 
> Can Guo.
> 
> > > 
> > > Thanks,
> > > 
> > > Can Guo.
> > > 
> > > > >
> > > > > Thanks,
> > > > >
> > > > > Can Guo.
> > > > >
> > > > > In __ufshcd_transfer_req_compl
> > > > > Ihba->lrb_in_use is cleared immediately when UFS driver
> > > > > finishes all tasks
> > > > >
> > > > > > ufshcd_complete_requests(struct ufs_hba *hba)
> > > > > >   ufshcd_transfer_req_compl()
> > > > > >     __ufshcd_transfer_req_compl()
> > > > > >       __ufshcd_release(hba)
> > > > > >         if (ufshcd_any_tag_in_use() == 1)
> > > > > >            return;
> > > > > >   ufshcd_tmc_handler(hba);
> > > > > >     blk_mq_tagset_busy_iter();
> > > > > >
> > > > > > Cc: Alim Akhtar <alim.akhtar@samsung.com>
> > > > > > Cc: Avri Altman <avri.altman@wdc.com>
> > > > > > Cc: Can Guo <cang@codeaurora.org>
> > > > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > > > ---
> > > > > >  drivers/scsi/ufs/ufshcd.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> > > > > > index b5ca0effe636..cecbd4ace8b4 100644
> > > > > > --- a/drivers/scsi/ufs/ufshcd.c
> > > > > > +++ b/drivers/scsi/ufs/ufshcd.c
> > > > > > @@ -1746,7 +1746,7 @@ static void __ufshcd_release(struct ufs_hba *hba)
> > > > > >
> > > > > >  	if (hba->clk_gating.active_reqs || hba->clk_gating.is_suspended ||
> > > > > >  	    hba->ufshcd_state != UFSHCD_STATE_OPERATIONAL ||
> > > > > > -	    ufshcd_any_tag_in_use(hba) || hba->outstanding_tasks ||
> > > > > > +	    hba->outstanding_tasks ||
> > > > > >  	    hba->active_uic_cmd || hba->uic_async_done)
> > > > > >  		return;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
