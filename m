Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 489C96491FA
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Dec 2022 03:36:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4CCP-00038A-La;
	Sun, 11 Dec 2022 02:36:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p4CCO-000383-FF
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 02:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MnSX+gXz9qDvxPKiZpnAqqjpxbIpQb5kH0DPatYwaCc=; b=MuN4/v6nQzJVyzEOxjGIo23P3m
 hWqg9YjehP+zQypN+EZn6v9J6ZHAueobjlniRtf/KN1C0ZLyeCPwATv+pnrGaaGfxk/VuzbMU2XwL
 k5MJuZqc4pGgbzSPUoMdTcEWDNqt2L3xPFSQ0iNBaNBsp/aAKO9bN9l5Bjt2aIOlbyDE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MnSX+gXz9qDvxPKiZpnAqqjpxbIpQb5kH0DPatYwaCc=; b=mtcFSNJxW6Q1OQ8VgfuXzIpSTM
 McXAsAowwGz7cXfDSyqwyyhTGhvW9CK7FJd3FQQxabKwBcOddaT8XWcWRZOSQ8pMMJVPpFaeCmEoe
 5k7MGX2w2cIA3kiVPdRMVGzH9PLUTbhKSx5f9XMko63xbjYH9fPu/pkREki1iwEadkf8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4CCN-0006KM-Ov for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 02:36:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58CCF60D24;
 Sun, 11 Dec 2022 02:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90980C433EF;
 Sun, 11 Dec 2022 02:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670726169;
 bh=XWHn21ifsX5oD2GoaKAPEWjwGFhWVCPr6vE1FimUBKs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QYf9/Hmjx3JUY4dPoN8Kp4x8XtXZy2VQH2KGZ4LUZ5d0PmxACcDqEGKBrXV6ZyJs3
 EkK4Sw9w/5uuCny18ZUzChn6hwmMHKboBDuogRbtKAZaaMXWq0e9O8x6H/+qCwtv9a
 kY1G0tA94sVotgJVOT9x1cNt4l8dnfVblxgkAPyHKuimv2HJCFXWt272p9uqELccuC
 qkDFmBY+Pf+QuFEMphW/tO2NRwQo4Fhx6b5CcB7KUqLvyxIRyELm/EwiqfbIumCKwc
 SNYHfveVtWvuOrawiefLJeYiCxYuSwzhcQNacZHFGlkvhpKNh5tyoiDefL70TtzlpQ
 hpDaXxt8aZIgg==
Message-ID: <7368c57a-141e-86b0-365f-8af795940483@kernel.org>
Date: Sun, 11 Dec 2022 10:36:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Yuwei Guan <ssawgyw@gmail.com>, jaegeuk@kernel.org
References: <20221121161101.72847-1-Yuwei.Guan@zeekrlife.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221121161101.72847-1-Yuwei.Guan@zeekrlife.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/22 0:11,
 Yuwei Guan wrote: > As the 'dcc->discard_granularity'
 and 'dcc->max_ordered_discard' can be set > at the user space, and if the
 'dcc->max_ordered_discard' is set larger than > 'dcc [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p4CCN-0006KM-Ov
Subject: Re: [f2fs-dev] [PATCH] f2fs: continuous counting for 'issued' in
 __issue_discard_cmd_orderly()
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

On 2022/11/22 0:11, Yuwei Guan wrote:
> As the 'dcc->discard_granularity' and 'dcc->max_ordered_discard' can be set
> at the user space, and if the 'dcc->max_ordered_discard' is set larger than
> 'dcc->discard_granularity' in DPOLICY_BG mode, or it's a volume device,
> discard_granularity can be tuned to 1 in f2fs_tuning_parameters(),
> it will may send more requests than the number of 'dpolicy->max_requests'
> in issue_discard_thread().
> 
> This patch will fix the issue.
> 
> Signed-off-by: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
> ---
>   fs/f2fs/segment.c | 17 ++++++++---------
>   1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 8b0b76550578..b0157bf392fb 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1379,8 +1379,8 @@ static int __queue_discard_cmd(struct f2fs_sb_info *sbi,
>   	return 0;
>   }
>   
> -static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
> -					struct discard_policy *dpolicy)
> +static int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
> +					struct discard_policy *dpolicy, int *issued)
>   {
>   	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
>   	struct discard_cmd *prev_dc = NULL, *next_dc = NULL;
> @@ -1388,7 +1388,6 @@ static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
>   	struct discard_cmd *dc;
>   	struct blk_plug plug;
>   	unsigned int pos = dcc->next_pos;
> -	unsigned int issued = 0;
>   	bool io_interrupted = false;
>   
>   	mutex_lock(&dcc->cmd_lock);
> @@ -1415,9 +1414,9 @@ static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
>   		}
>   
>   		dcc->next_pos = dc->lstart + dc->len;
> -		err = __submit_discard_cmd(sbi, dpolicy, dc, &issued);
> +		err = __submit_discard_cmd(sbi, dpolicy, dc, issued);
>   
> -		if (issued >= dpolicy->max_requests)
> +		if (*issued >= dpolicy->max_requests)
>   			break;
>   next:
>   		node = rb_next(&dc->rb_node);
> @@ -1433,10 +1432,10 @@ static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
>   
>   	mutex_unlock(&dcc->cmd_lock);
>   
> -	if (!issued && io_interrupted)
> -		issued = -1;
> +	if (!(*issued) && io_interrupted)
> +		*issued = -1;
>   
> -	return issued;
> +	return *issued;

A little weired that __issue_discard_cmd_orderly() will output the data
in both return value and @issued parameter.

How about changing type of return value __issue_discard_cmd_orderly()
from unsigned int to void.

Thanks,

>   }
>   static unsigned int __wait_all_discard_cmd(struct f2fs_sb_info *sbi,
>   					struct discard_policy *dpolicy);
> @@ -1465,7 +1464,7 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
>   			break;
>   
>   		if (i + 1 < dcc->max_ordered_discard && dpolicy->ordered)
> -			return __issue_discard_cmd_orderly(sbi, dpolicy);
> +			return __issue_discard_cmd_orderly(sbi, dpolicy, &issued);
>   
>   		pend_list = &dcc->pend_list[i];
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
