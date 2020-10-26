Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DA92985F5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Oct 2020 04:37:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kWtKU-0001qF-AI; Mon, 26 Oct 2020 03:37:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1kWtKS-0001q0-FM
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 03:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GkQq1NKiH6b1ab589HosLYnWoE9lNlF7O6rZsWzr/SA=; b=MP0bdoMiLuOkV+hcuPaDbEJjON
 wjDJctBG5ZrIbacDi3WbqIUGrW9DQQm71DgxR0xMaGcyq5PpkrO1CVcQFRE5gv9jK128TXdFAB4D6
 szwwr9+Gplh5kcO6q3f47flEiTqLLZ+VXP/TiDlGJXxF5f+3TyoSBoqwmLgWdIGKPvRg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GkQq1NKiH6b1ab589HosLYnWoE9lNlF7O6rZsWzr/SA=; b=jnVyzChKHmS4eEP5qoMsuOTjbi
 +tUzDzUtzs1jw7+IhkeDXZt9v9yrIJux5lr3IH2FadcGJSzOAa+EtErRvgAhpoJb0jj+3/FrP+P0m
 pqpYnPI0WzUefbEkbBANtnmXW2NvTZFBCBlrF6/AoLIf1lgWJAasPc1LPO1EQQpV4or4=;
Received: from z5.mailgun.us ([104.130.96.5])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kWtKL-00793l-KQ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 03:37:52 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603683465; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=GkQq1NKiH6b1ab589HosLYnWoE9lNlF7O6rZsWzr/SA=;
 b=ESPC8KHrKNq420huA1wGjaCJuKnkRwiQD7bdXYNJ5+yRD+H2yi7LT9YO8Ka9C7962uDprd7n
 wom0Wz548SUHT+WFx2J5qcBNDNSMRx7Irxel7YA6FQwLyAi4CvOjI7IH0kJtxhmldmJl30ng
 L99SzoddXzHSjKEU7BueONZaJwg=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f963e82ef7f807d40be18d2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Oct 2020 03:12:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AACF9C433C9; Mon, 26 Oct 2020 03:12:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4243EC433CB;
 Mon, 26 Oct 2020 03:12:00 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 26 Oct 2020 11:12:00 +0800
From: Can Guo <cang@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
In-Reply-To: <20201022201825.GA3329812@google.com>
References: <20201020195258.2005605-1-jaegeuk@kernel.org>
 <20201020195258.2005605-6-jaegeuk@kernel.org>
 <2a8ecc4185b3a5411077f4e3fc66000f@codeaurora.org>
 <20201021045213.GB3004521@google.com>
 <e3e58a89474d23f1b9446fe2e38a7426@codeaurora.org>
 <20201022201825.GA3329812@google.com>
Message-ID: <ccf9079dc1767c7d200fe55b5a849ba0@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Spam-Score: 1.2 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.2 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in bl.spamcop.net
 [Blocked - see <https://www.spamcop.net/bl.shtml?104.130.96.5>]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kWtKL-00793l-KQ
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020-10-23 08:53, Jaegeuk Kim wrote:
> On 10/21, Can Guo wrote:
>> On 2020-10-21 12:52, jaegeuk@kernel.org wrote:
>> > On 10/21, Can Guo wrote:
>> > > On 2020-10-21 03:52, Jaegeuk Kim wrote:
>> > > > The below call stack prevents clk_gating at every IO completion.
>> > > > We can remove the condition, ufshcd_any_tag_in_use(), since
>> > > > clkgating_work
>> > > > will check it again.
>> > > >
>> > >
>> > > I think checking ufshcd_any_tag_in_use() in either ufshcd_release() or
>> > > gate_work() can break UFS clk gating's functionality.
>> > >
>> > > ufshcd_any_tag_in_use() was introduced to replace hba->lrb_in_use.
>> > > However,
>> > > they are not exactly same - ufshcd_any_tag_in_use() returns true if
>> > > any tag
>> > > assigned from block layer is still in use, but tags are released
>> > > asynchronously
>> > > (through block softirq), meaning it does not reflect the real
>> > > occupation of
>> > > UFS host.
>> > > That is after UFS host finishes all tasks, ufshcd_any_tag_in_use()
>> > > can still
>> > > return true.
>> > >
>> > > This change only removes the check of ufshcd_any_tag_in_use() in
>> > > ufshcd_release(),
>> > > but having the check of it in gate_work() can still prevent gating
>> > > from
>> > > happening.
>> > > The current change works for you maybe because the tags are release
>> > > before
>> > > hba->clk_gating.delay_ms expires, but if hba->clk_gating.delay_ms is
>> > > shorter
>> > > or
>> > > somehow block softirq is retarded, gate_work() may have chance to see
>> > > ufshcd_any_tag_in_use()
>> > > returns true. What do you think?
>> >
>> > I don't think this breaks clkgating, but fix the wrong condition check
>> > which
>> > prevented gate_work at all. As you mentioned, even if this schedules
>> > gate_work
>> > by racy conditions, gate_work will handle it as a last resort.
>> >
>> 
>> If clocks cannot be gated after the last task is cleared from UFS 
>> host, then
>> clk gating
>> is broken, no? Assume UFS has completed the last task in its queue, as 
>> this
>> change says,
>> ufshcd_any_tag_in_use() is preventing ufshcd_release() from invoking
>> gate_work().
>> Similarly, ufshcd_any_tag_in_use() can prevent gate_work() from doing 
>> its
>> real work -
>> disabling the clocks. Do you agree?
>> 
>>         if (hba->clk_gating.active_reqs
>>                 || hba->ufshcd_state != UFSHCD_STATE_OPERATIONAL
>>                 || ufshcd_any_tag_in_use(hba) || 
>> hba->outstanding_tasks
>>                 || hba->active_uic_cmd || hba->uic_async_done)
>>                 goto rel_lock;
> 
> I see the point, but this happens only when clkgate_delay_ms is too 
> short
> to give enough time for releasing tag. If it's correctly set, I think 
> there'd
> be no problem, unless softirq was delayed by other RT threads which is 
> just
> a corner case tho.
> 

Yes, we are fixing corner cases, aren't we? I thought you would like to
address it since you are fixing clk gating.

Regards,

Can Guo.

>> 
>> Thanks,
>> 
>> Can Guo.
>> 
>> > >
>> > > Thanks,
>> > >
>> > > Can Guo.
>> > >
>> > > In __ufshcd_transfer_req_compl
>> > > Ihba->lrb_in_use is cleared immediately when UFS driver
>> > > finishes all tasks
>> > >
>> > > > ufshcd_complete_requests(struct ufs_hba *hba)
>> > > >   ufshcd_transfer_req_compl()
>> > > >     __ufshcd_transfer_req_compl()
>> > > >       __ufshcd_release(hba)
>> > > >         if (ufshcd_any_tag_in_use() == 1)
>> > > >            return;
>> > > >   ufshcd_tmc_handler(hba);
>> > > >     blk_mq_tagset_busy_iter();
>> > > >
>> > > > Cc: Alim Akhtar <alim.akhtar@samsung.com>
>> > > > Cc: Avri Altman <avri.altman@wdc.com>
>> > > > Cc: Can Guo <cang@codeaurora.org>
>> > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>> > > > ---
>> > > >  drivers/scsi/ufs/ufshcd.c | 2 +-
>> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > > >
>> > > > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
>> > > > index b5ca0effe636..cecbd4ace8b4 100644
>> > > > --- a/drivers/scsi/ufs/ufshcd.c
>> > > > +++ b/drivers/scsi/ufs/ufshcd.c
>> > > > @@ -1746,7 +1746,7 @@ static void __ufshcd_release(struct ufs_hba *hba)
>> > > >
>> > > >  	if (hba->clk_gating.active_reqs || hba->clk_gating.is_suspended ||
>> > > >  	    hba->ufshcd_state != UFSHCD_STATE_OPERATIONAL ||
>> > > > -	    ufshcd_any_tag_in_use(hba) || hba->outstanding_tasks ||
>> > > > +	    hba->outstanding_tasks ||
>> > > >  	    hba->active_uic_cmd || hba->uic_async_done)
>> > > >  		return;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
