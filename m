Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52771299549
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Oct 2020 19:28:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kX7Dt-0007XK-Su; Mon, 26 Oct 2020 18:28:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1kX7Dt-0007X3-3U
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 18:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:References:In-Reply-To:Subject:Cc:To:
 From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2rVdRj4SsbfGPG3FVq4W/LAdXew0WoAOEbrxP4lHncM=; b=fJXz13FC5EgP74MjanXN2DL0Y4
 00kwmeQEHv4D29HLkj0Y959SkBIPbBSZMqayJ2TMi4+uV6Og8lsyupo0EWUE5v5tB0RO+sux8JZX8
 a1tGcx5hLzoapDdHBLx5lanujDKCkaTbBikkkYPWoJIu6aIFKAnkXeXPNyrhX2vtL2O4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2rVdRj4SsbfGPG3FVq4W/LAdXew0WoAOEbrxP4lHncM=; b=Z/PKj7GjoK8Wu8VR4u5FQ8hFL3
 d389okqhvFdpt+OSloqR+fBbbjaEQUjETcDbyeemdKNQYjPfJhARXEelxB6toLzl3wYPHMFRBE9ra
 G5wfQLKxJm1EUXa0enG+c/dnsc9VHtZmRKJWcFZ5OsQgUNLgDkfKcM4rvLL9QvJd7oIE=;
Received: from m42-4.mailgun.net ([69.72.42.4])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kX7Dm-007uYu-D1
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 18:28:00 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603736876; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2rVdRj4SsbfGPG3FVq4W/LAdXew0WoAOEbrxP4lHncM=;
 b=Sogi587xT5VI7JgcBkhX3/dkkdXZYhUdfuanXaghodiSIX57cuB4pC4fE8mBEbQRKMBCzhq5
 s5XlRE07mQke2kDNokqq/9vN2N7cUmKrrQPvVBbvfDoDijg/iNlcc7uak2JLnQqMp0XJX0/H
 y511DaEezeF50NJx8kD/2VBRqwA=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f97151cd6826c2dbdedbfce (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Oct 2020 18:27:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5D9E4C43385; Mon, 26 Oct 2020 18:27:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B56BBC433FE;
 Mon, 26 Oct 2020 18:27:38 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 26 Oct 2020 11:27:38 -0700
From: asutoshd@codeaurora.org
To: Jaegeuk Kim <jaegeuk@kernel.org>
In-Reply-To: <20201024150646.1790529-4-jaegeuk@kernel.org>
References: <20201024150646.1790529-1-jaegeuk@kernel.org>
 <20201024150646.1790529-4-jaegeuk@kernel.org>
Message-ID: <0ba2065c107eacd112858905e8d079e0@codeaurora.org>
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
X-Headers-End: 1kX7Dm-007uYu-D1
Subject: Re: [f2fs-dev] [PATCH v3 3/5] scsi: ufs: use WQ_HIGHPRI for gating
 work
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
> Must have WQ_MEM_RECLAIM
> ``WQ_MEM_RECLAIM``
>   All wq which might be used in the memory reclaim paths **MUST**
>   have this flag set.  The wq is guaranteed to have at least one
>   execution context regardless of memory pressure.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
> ---

Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>

>  drivers/scsi/ufs/ufshcd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 011e80a21170..bc0d623aed66 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -1867,7 +1867,7 @@ static void ufshcd_init_clk_gating(struct ufs_hba 
> *hba)
>  	snprintf(wq_name, ARRAY_SIZE(wq_name), "ufs_clk_gating_%d",
>  		 hba->host->host_no);
>  	hba->clk_gating.clk_gating_workq = alloc_ordered_workqueue(wq_name,
> -							   WQ_MEM_RECLAIM);
> +					WQ_MEM_RECLAIM | WQ_HIGHPRI);
> 
>  	hba->clk_gating.is_enabled = true;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
