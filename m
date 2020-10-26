Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49791299570
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Oct 2020 19:33:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kX7JR-0003hc-Ql; Mon, 26 Oct 2020 18:33:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1kX7JQ-0003hU-DI
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 18:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zXwlccfMR6GOFBjsJE59HoBnP80goXv5jTvLHdCwyJI=; b=Oth1HjUZbckNQjC9tbKSAZ57Xr
 e24ukTNlI46hlGjRAQDUK+9RVAbHcnqKP/NzR7XCmFtHAvu0n1GQl2bUoCgm80SKOgI8Z1A6lcG7F
 5kHYqObgyNmoYuE8XSVdiesVBJPH9T4yGUWWio/WAreM09I1ojKql/yD066Bn/CrP9KA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zXwlccfMR6GOFBjsJE59HoBnP80goXv5jTvLHdCwyJI=; b=CVKkvCCRJuBO+lMR8QwNn6saHT
 UGzc/KkN26oMGIQ1lGTeNT/IMUTS9snsPyYa2bXYk6S/CpAntyH83Io5CIgTVThj5uxsjXZtSVqEC
 sG0f0e98Pl+LMIq5kDUJNR3ESM/0x5SE0ZYJEKhiDG0vPWH+sMDFpM+t9o1VvalRkBDc=;
Received: from m42-4.mailgun.net ([69.72.42.4])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kX7JG-00EbCT-K2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 18:33:44 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603737215; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=zXwlccfMR6GOFBjsJE59HoBnP80goXv5jTvLHdCwyJI=;
 b=TvHmo211GrOISyBUQR1z0LvcRJOEkcZnnKbpjDY0pPokm3FOzPneuWm5s3fvTJ1blWusB2Pt
 yWycX5NQd4u9BSTrwXMPhnu3YEkEySkqCQfGTZckIWPHoUwu0VN+l3sLPr4PVVyhVZVNe5db
 Ue8dYgzpzDzTBuIZBcqIUdZy584=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f9716685e07d62bca0df627 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Oct 2020 18:33:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E8C20C43391; Mon, 26 Oct 2020 18:33:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4AD88C433FE;
 Mon, 26 Oct 2020 18:33:11 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 26 Oct 2020 11:33:11 -0700
From: asutoshd@codeaurora.org
To: Jaegeuk Kim <jaegeuk@kernel.org>
In-Reply-To: <20201024150646.1790529-6-jaegeuk@kernel.org>
References: <20201024150646.1790529-1-jaegeuk@kernel.org>
 <20201024150646.1790529-6-jaegeuk@kernel.org>
Message-ID: <9dbeb21b7a899d742670a243a9ffad7d@codeaurora.org>
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
X-Headers-End: 1kX7JG-00EbCT-K2
Subject: Re: [f2fs-dev] [PATCH v3 5/5] scsi: ufs: fix clkgating on/off
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
Cc: bvanassche@acm.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-@vger.kernel.org,
 avri.altman@wdc.com, cang@codeaurora.org, alim.akhtar@samsung.com,
 kernel-team@android.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020-10-24 08:06, Jaegeuk Kim wrote:
> The below call stack prevents clk_gating at every IO completion.
> We can remove the condition, ufshcd_any_tag_in_use(), since 
> clkgating_work
> will check it again.
> 
> ufshcd_complete_requests(struct ufs_hba *hba)
>   ufshcd_transfer_req_compl()
>     __ufshcd_transfer_req_compl()
>       __ufshcd_release(hba)
>         if (ufshcd_any_tag_in_use() == 1)
>            return;
>   ufshcd_tmc_handler(hba);
>     blk_mq_tagset_busy_iter();
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---

Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>

>  drivers/scsi/ufs/ufshcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index c94610cbecae..38043c6b8d5f 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -1746,7 +1746,7 @@ static void __ufshcd_release(struct ufs_hba *hba)
> 
>  	if (hba->clk_gating.active_reqs || hba->clk_gating.is_suspended ||
>  	    hba->ufshcd_state != UFSHCD_STATE_OPERATIONAL ||
> -	    ufshcd_any_tag_in_use(hba) || hba->outstanding_tasks ||
> +	    hba->outstanding_tasks ||
>  	    hba->active_uic_cmd || hba->uic_async_done)
>  		return;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
