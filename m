Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F27829A2C2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Oct 2020 03:44:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kXEya-0003SE-AJ; Tue, 27 Oct 2020 02:44:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1kXEyZ-0003S8-9e
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Oct 2020 02:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=79HQ6Qz4uXyUWuVIvkDHcYM8q1wj0DuO9ULceGzhRQM=; b=UxcId4Zgi+ZmCQ6hFRud+PxJl7
 Is2uHPoUDpCSEW7CqzpNwQs2AsG8qHwqE0PTyYMpfgGZkCpfHpl2dzKYRB+7Z0wyoDfr93Kay7k6T
 aIsd3FlyGqgFjRPdNg1n3UA7difAaia4ntONSa/gl3GuZ9SfB7i1XBUOURKZ0x6G+bAQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=79HQ6Qz4uXyUWuVIvkDHcYM8q1wj0DuO9ULceGzhRQM=; b=GhvfGVyLTHeZEl9SHCWqksQ5hX
 NUJbbrSKfH4/q4AEyH/TJRNCVi/DXpBeO7+bk2eduveE0ct9GKGDf4YKOTbCdETOilLizVpyO+aNF
 mWOpQh648tBCSSK05K7UGpxrLiHyoveAewlCz0Ge27MBwBEU4YaotJqXClysC0kA/HXU=;
Received: from z5.mailgun.us ([104.130.96.5])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kXEyP-00F1hr-LX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Oct 2020 02:44:43 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603766673; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=79HQ6Qz4uXyUWuVIvkDHcYM8q1wj0DuO9ULceGzhRQM=;
 b=T/wfQ02RWywqnIk5yfFc0dQcL2SOBnNhRtAHVhXyKN8SBRlvjtgAr5lwiU3tS3GHWrwftDq1
 0ZzTvgfmcLxnis0n0dKu8M4bQYjBdU7oHNsGRSWOmh+h9hs7taF9R8ai/VlR5ipR7SVX/h8M
 d7uvnDQarRvjhnLT86mAVA0d398=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f97897f856acb9b098f74a6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Oct 2020 02:44:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D3B19C43382; Tue, 27 Oct 2020 02:44:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B4407C433F0;
 Tue, 27 Oct 2020 02:44:14 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 27 Oct 2020 10:44:14 +0800
From: Can Guo <cang@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
In-Reply-To: <20201026194817.GA359340@google.com>
References: <20201024150646.1790529-1-jaegeuk@kernel.org>
 <20201024150646.1790529-2-jaegeuk@kernel.org>
 <68cf5fe17691653f07544db5fe390c97@codeaurora.org>
 <20201026061313.GA2517102@google.com>
 <6c029b64cb4d78e7624bc896f9c9f16d@codeaurora.org>
 <20201026194817.GA359340@google.com>
Message-ID: <63bb653fe0a26f092426945a8af1aba5@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kXEyP-00F1hr-LX
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020-10-27 03:48, Jaegeuk Kim wrote:
> On 10/26, Can Guo wrote:
>> On 2020-10-26 14:13, Jaegeuk Kim wrote:
>> > On 10/26, Can Guo wrote:
>> > > On 2020-10-24 23:06, Jaegeuk Kim wrote:
>> > > > From: Jaegeuk Kim <jaegeuk@google.com>
>> > > >
>> > > > When giving a stress test which enables/disables clkgating, we hit
>> > > > device
>> > > > timeout sometimes. This patch avoids subtle racy condition to address
>> > > > it.
>> > > >
>> > > > If we use __ufshcd_release(), I've seen that gate_work can be called in
>> > > > parallel
>> > > > with ungate_work, which results in UFS timeout when doing hibern8.
>> > > > Should avoid it.
>> > > >
>> > >
>> > > I don't understand this comment. gate_work and ungate_work are
>> > > queued on
>> > > an ordered workqueue and an ordered workqueue executes at most one
>> > > work item
>> > > at any given time in the queued order. How can the two run in
>> > > parallel?
>> >
>> > When I hit UFS stuck, I saw this by clkgating tracepoint.
>> >
>> > - REQ_CLK_OFF
>> > - CLKS_OFF
>> > - REQ_CLK_OFF
>> > - REQ_CLKS_ON
>> > ..
>> >
>> 
>> I don't see how can you tell that the two works are running in 
>> parallel
>> just from above trace. May I know what is the exact error by "UFS 
>> timeout
>> when doing hibern8"?
>> 
>> By using __ufshcd_release() here, I do see one potential issue if your 
>> test
>> quickly toggles on/off of clk_gating - disable it, enable it, disable 
>> it and
>> enable it, which will cause that __ufshcd_release() being called 
>> twice,
>> meaning
>> we queue two gate_works back to back. So can you try below code and 
>> let me
>> know
>> if it helps or not? I am OK with your current change, but I would like 
>> to
>> understand the problem. Thanks.
>> 
>> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
>> index 1791bce..3eee438 100644
>> --- a/drivers/scsi/ufs/ufshcd.c
>> +++ b/drivers/scsi/ufs/ufshcd.c
>> @@ -2271,6 +2271,8 @@ static void ufshcd_gate_work(struct work_struct 
>> *work)
>>         unsigned long flags;
>> 
>>         spin_lock_irqsave(hba->host->host_lock, flags);
>> +       if (hba->clk_gating.state == CLKS_OFF)
>> +               goto rel_lock;
>>         /*
>>          * In case you are here to cancel this work the gating state
>>          * would be marked as REQ_CLKS_ON. In this case save time by
> 
> This doesn't help. So, I checked this back again, and, like what you 
> said, now
> suspect __ufshcd_release() which changed state to REQ_CLKS_OFF on 
> CLKS_OFF.
> 

Aha, sorry that I gave the right analysis but wrong fix - my check won't 
help
since it is checking CLKS_OFF, but at that moment it has become 
CLKS_REQ_OFF.
Your fix is fulfiling the right purpose.

Thanks,

Can Guo.


> With the below change, I can see the issue anymore. Let me send v4.
> 
> ---
>  drivers/scsi/ufs/ufshcd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index b8f573a02713..cc8d5f0c3fdc 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -1745,7 +1745,8 @@ static void __ufshcd_release(struct ufs_hba *hba)
>  	if (hba->clk_gating.active_reqs || hba->clk_gating.is_suspended ||
>  	    hba->ufshcd_state != UFSHCD_STATE_OPERATIONAL ||
>  	    ufshcd_any_tag_in_use(hba) || hba->outstanding_tasks ||
> -	    hba->active_uic_cmd || hba->uic_async_done)
> +	    hba->active_uic_cmd || hba->uic_async_done ||
> +	    hba->clk_gating.state == CLKS_OFF)
>  		return;
> 
>  	hba->clk_gating.state = REQ_CLKS_OFF;
> --
> 2.29.0.rc1.297.gfa9743e501-goog
> 
> 
>> 
>> Regards,
>> 
>> Can Guo.
>> 
>> > By using active_req, I don't see any problem.
>> >
>> > >
>> > > Thanks,
>> > >
>> > > Can Guo.
>> > >
>> > > > Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
>> > > > ---
>> > > >  drivers/scsi/ufs/ufshcd.c | 12 ++++++------
>> > > >  1 file changed, 6 insertions(+), 6 deletions(-)
>> > > >
>> > > > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
>> > > > index b8f573a02713..e0b479f9eb8a 100644
>> > > > --- a/drivers/scsi/ufs/ufshcd.c
>> > > > +++ b/drivers/scsi/ufs/ufshcd.c
>> > > > @@ -1807,19 +1807,19 @@ static ssize_t
>> > > > ufshcd_clkgate_enable_store(struct device *dev,
>> > > >  		return -EINVAL;
>> > > >
>> > > >  	value = !!value;
>> > > > +
>> > > > +	spin_lock_irqsave(hba->host->host_lock, flags);
>> > > >  	if (value == hba->clk_gating.is_enabled)
>> > > >  		goto out;
>> > > >
>> > > > -	if (value) {
>> > > > -		ufshcd_release(hba);
>> > > > -	} else {
>> > > > -		spin_lock_irqsave(hba->host->host_lock, flags);
>> > > > +	if (value)
>> > > > +		hba->clk_gating.active_reqs--;
>> > > > +	else
>> > > >  		hba->clk_gating.active_reqs++;
>> > > > -		spin_unlock_irqrestore(hba->host->host_lock, flags);
>> > > > -	}
>> > > >
>> > > >  	hba->clk_gating.is_enabled = value;
>> > > >  out:
>> > > > +	spin_unlock_irqrestore(hba->host->host_lock, flags);
>> > > >  	return count;
>> > > >  }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
