Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F0D614E26
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Nov 2022 16:18:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1opt1g-0007xI-Vv;
	Tue, 01 Nov 2022 15:18:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1opt1f-0007x2-CG
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Nov 2022 15:18:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ecZNmbCljuW3rNiD4ny+BlaxWqn+8EyG3pFpKG3aZH4=; b=TasdPM4ol4yuyTImLQSXcvmSFE
 m9dxCtLptMAlcb8IAVLmnba6MEmQjjchLfBvq6r4HT0MHJNtgsl8fEXt7s1/JTYct5lZzQtJ1TMjd
 Y1DV0NeQyARmHR6eq6EcqOZ0uen8YeSOWZBsLxpp3s/eD4u5uwShCRnC9i3Zc3RzAl88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ecZNmbCljuW3rNiD4ny+BlaxWqn+8EyG3pFpKG3aZH4=; b=XURTx6exd18BXBrQ2AlJA9xVjn
 MijRVz3fWlo2/VDtgzQQAkHRPGabnSmChR3RyQLsl1tS5nlA0S04T1vk3X9W+zJRNVPDLjbtM5OYd
 oqe+3cKALzoS54b6C3f6uJ3mlVd0qycroqLWWE2PkF5f2VCo2t6uVhp30Z62QnkxJmBI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1opt1a-008DdQ-TU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Nov 2022 15:18:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A07FFB81D1B;
 Tue,  1 Nov 2022 15:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB47C433C1;
 Tue,  1 Nov 2022 15:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667315871;
 bh=vPFxSX5tdfDxM0GAlj0EtKyOoh8TOU8IF/wbZdlbQJg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tOaCLU+P43XRFjDjmirIAIdR3msJhGtnKSJFIiQymEC40DZ06RWjG22zC9CT8Ck75
 x2Buh9CewAett6IFLQLozPri5hzkq702ejDoCJEYVP1KI4XBcKFptTZH4M9ALXeud2
 swuHc+enFVy7H+luFxawRP7Tf/iOW7UXFDHXZ2zXtT7bRHto4WXweiJG8NZoQ8kypM
 jyYvZKdMuv3b9M3fEgrZAzWQ3drIV8l3shfh3+Zm4H87Kai6DBfw9hOoql6EoK6JjP
 E3MQTIAy166W+CNIxObCXn40mkEjCtztXhV6zAp/mtwSyBPSwIfVJ+IUCZUAeOuhbo
 05CiSKZsVLcfw==
Message-ID: <fd3f0cc6-1d7c-85bd-9887-ec32dd36601a@kernel.org>
Date: Tue, 1 Nov 2022 23:17:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221028143733.57322-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221028143733.57322-1-frank.li@vivo.com>
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/28 22:37, Yangtao Li wrote: > Under the current
 logic, after the fsck flag is set,
 > the discard thread will still run periodically.
 > > So stop the discard thread from running to avoid > e [...] 
 Content analysis details:   (-6.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -1.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1opt1a-008DdQ-TU
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: stop discard thread if has fsck tag
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/10/28 22:37, Yangtao Li wrote:
> Under the current logic, after the fsck flag is set,
> the discard thread will still run periodically.
> 
> So stop the discard thread from running to avoid
> energy consumption after the fsck flag is set.
> 
> Fixes: d618477473eb ("f2fs: stop issue discard if something wrong with f2fs")
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v2:
> - commit msg changes.
>   fs/f2fs/segment.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 7786351de429..b3600bcadfc7 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1716,8 +1716,8 @@ static int issue_discard_thread(void *data)
>   		if (kthread_should_stop())
>   			return 0;
>   		if (is_sbi_flag_set(sbi, SBI_NEED_FSCK)) {
> -			wait_ms = dpolicy.max_interval;
> -			continue;
> +			dcc->f2fs_issue_discard = NULL;
> +			return 0;

I don't think there will be much energy consumption, I guess
we can keep as it is.

>   		}
>   		if (!atomic_read(&dcc->discard_cmd_cnt))
>   			continue;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
