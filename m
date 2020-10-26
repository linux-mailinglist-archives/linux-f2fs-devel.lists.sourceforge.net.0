Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9777B2995B1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Oct 2020 19:49:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kX7YC-0003Ie-BU; Mon, 26 Oct 2020 18:49:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1kX7YA-0003I8-CU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 18:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IuMktuI/NzJNFZzTb5UtNKt9fniQXDSsFqHN0KzCiy4=; b=dtOupaA8c+7mMU4lEck45OJVxg
 uIhsui3nRUVdEDyCIbIehUY6OKvmxNe4V/hVDIV18HJnqdbHT1H+QWSg46eTq5EHq4iC4ZeMInNhy
 v7IsxEoR7UDbMMk3krnqLdvMIX4pf5J/wNlAB51ww0PTcxRRVjDlHr1P0Tu/MmdlNekg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IuMktuI/NzJNFZzTb5UtNKt9fniQXDSsFqHN0KzCiy4=; b=fWDJ3S5Z3DobZ6LCYsL1Ciz9O0
 HWeqhAlwq4b9YmeX8PX/ghAuw/HF4yOfD4VdUnIriKvhzz3fUaPXGdazi+1IH+DIugMe2FxnySyTH
 5OEC+TPKeBlt+v8/+KslMBrYKYVDw/A7XPTD0tHd8qGAf93SENgmKPat3NlUNcJvKwZM=;
Received: from m42-4.mailgun.net ([69.72.42.4])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kX7Y1-00EcEO-7u
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 18:48:58 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603738134; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=IuMktuI/NzJNFZzTb5UtNKt9fniQXDSsFqHN0KzCiy4=;
 b=bDW1q2uRH4Mb2/+igKPoan0kIWqezHphI7HOG2vpw4jPHzIb3EtDIcgUIesORf8axWTcSaa7
 dh69y28KEJggKWLH1YIvf8nSwkH1xfAhr9ZjFPMQmS+aNJv0OEMY5R44WgOu++lqu1vYTi/X
 b7vK/bDW/nMsY5hJTngv54190r0=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f9719bb8d1da1b307257ae4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Oct 2020 18:47:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B15A8C433FF; Mon, 26 Oct 2020 18:47:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C9E6C433CB;
 Mon, 26 Oct 2020 18:47:21 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 26 Oct 2020 11:47:21 -0700
From: asutoshd@codeaurora.org
To: Jaegeuk Kim <jaegeuk@kernel.org>
In-Reply-To: <20201022201825.GA3329812@google.com>
References: <20201020195258.2005605-1-jaegeuk@kernel.org>
 <20201020195258.2005605-6-jaegeuk@kernel.org>
 <2a8ecc4185b3a5411077f4e3fc66000f@codeaurora.org>
 <20201021045213.GB3004521@google.com>
 <e3e58a89474d23f1b9446fe2e38a7426@codeaurora.org>
 <20201022201825.GA3329812@google.com>
Message-ID: <a2ea723559452252208dca932d0be3f9@codeaurora.org>
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
X-Headers-End: 1kX7Y1-00EcEO-7u
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-@vger.kernel.org, Avri Altman <avri.altman@wdc.com>,
 Can Guo <cang@codeaurora.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 kernel-team@android.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020-10-22 17:53, Jaegeuk Kim wrote:
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

How about checking outstanding_reqs as well, say in 
ufshcd_any_tag_in_use() ?

-asd


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
