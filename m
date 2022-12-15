Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1CF64D54C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Dec 2022 03:27:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5dyR-0007bY-6T;
	Thu, 15 Dec 2022 02:27:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p5dyP-0007bS-Mm
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 02:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yvwjdl9ZfMoQ3QpSqUmQMmHEA4RDmUk/+ZI0/DiOX3o=; b=IJXObxQjcocZjE9M0p8f3zb/au
 SO4TRsKkf2ghxjQzM58bgEMLTRhwhJ61v6E1TK/SFHb3Nau5mdyP0xQZ6ehGoy79cCR/PQsMKhKSy
 hvyGZi1wH2nMiR8kIy57JCRAUX/rYpIglo3wSQW7owT1bRlOULg0yVdp/z6SaTs0t4iM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yvwjdl9ZfMoQ3QpSqUmQMmHEA4RDmUk/+ZI0/DiOX3o=; b=cdKsmSKYek9mjrukpMOZhKU8dv
 vjrBDq3KCG5Qv1byI00tGVOQwTECq6Jo50xcTCtsRlXgJBZURi3EDeF3LEXiEeLCrYadB59R8jd2E
 mhXKNIxnb/Svdg24lK03hgzQWfLh6oVBY6PN5csTuggpeuh1tDzhuD0S1cti/BkSawMY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5dyN-0006TQ-JQ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 02:27:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7AD49B819DC;
 Thu, 15 Dec 2022 02:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0791C433EF;
 Thu, 15 Dec 2022 02:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671071255;
 bh=6P0YU/kHb4MLrqdFcxUR9lquyd86rwTP5ITcamVK9p8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=D7k8vy9cvAV512lD8LMxtybCL0jRAFdoc2HUJYIhpYv8A9+vHKjh9MIsubO3UPllQ
 F/9zGaBukJ1TS12KJSsH8l+RDBqQZFC8SX6NN1gEM3A9391sPCIauXsSZZNZTyXoQc
 AvR44DOTInaumSEuansw+p6n7BV92eIOUV9M10zgM6cla08M74b/uRjyWDrrNlwtAY
 YDNuJyDfETOsdo/hpe83xRuMfddTgSS3C/RPse3wJUnc0yy1a1V9Z8KJ9Pk3d/NN9C
 i7NDMWucQE+lHBPEk9Pnj9sqtWO7SARRP18YeZMkC+Q7roi2F5P7uaPbBgmhsgT+xF
 ssW4ifduEut2g==
Message-ID: <ff5f1e9d-1f44-5a3b-4b76-d3cfa877b18b@kernel.org>
Date: Thu, 15 Dec 2022 10:27:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Yuwei Guan <Yuwei.Guan@zeekrlife.com>, jaegeuk@kernel.org
References: <20221213093419.134-1-Yuwei.Guan@zeekrlife.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221213093419.134-1-Yuwei.Guan@zeekrlife.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/13 17:34, Yuwei Guan wrote: > Any of the following
 scenarios will send more than the number of > max_requests at a time, which
 will not meet the design of the > max_requests limit. > > - Se [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p5dyN-0006TQ-JQ
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: deliver the accumulated 'issued' to
 __issue_discard_cmd_orderly() to meet the max_requests limit
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
Cc: linux-kernel@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/12/13 17:34, Yuwei Guan wrote:
> Any of the following scenarios will send more than the number of
> max_requests at a time, which will not meet the design of the
> max_requests limit.
> 
> - Set max_ordered_discard larger than discard_granularity from userspace.
> - It is a small size device, discard_granularity can be tuned to 1 in
>    f2fs_tuning_parameters().
> 
> We need to deliver the accumulated @issued to __issue_discard_cmd_orderly()
> to meet the max_requests limit.
> 
> BTW, convert the parameter type of @issued in __submit_discard_cmd().
> 
> Signed-off-by: Yuwei Guan <Yuwei.Guan@zeekrlife.com>
> Cc: Bagas Sanjaya <bagasdotme@gmail.com>

For the code part, it looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> ---
>   fs/f2fs/segment.c | 24 +++++++++++-------------
>   1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index a9099a754dd2..5268938466f5 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1097,8 +1097,7 @@ static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
>   /* this function is copied from blkdev_issue_discard from block/blk-lib.c */
>   static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>   						struct discard_policy *dpolicy,
> -						struct discard_cmd *dc,
> -						unsigned int *issued)
> +						struct discard_cmd *dc, int *issued)
>   {
>   	struct block_device *bdev = dc->bdev;
>   	unsigned int max_discard_blocks =
> @@ -1379,8 +1378,8 @@ static void __queue_discard_cmd(struct f2fs_sb_info *sbi,
>   	mutex_unlock(&SM_I(sbi)->dcc_info->cmd_lock);
>   }
>   
> -static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
> -					struct discard_policy *dpolicy)
> +static void __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
> +					struct discard_policy *dpolicy, int *issued)
>   {
>   	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
>   	struct discard_cmd *prev_dc = NULL, *next_dc = NULL;
> @@ -1388,7 +1387,6 @@ static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
>   	struct discard_cmd *dc;
>   	struct blk_plug plug;
>   	unsigned int pos = dcc->next_pos;
> -	unsigned int issued = 0;
>   	bool io_interrupted = false;
>   
>   	mutex_lock(&dcc->cmd_lock);
> @@ -1415,9 +1413,9 @@ static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
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
> @@ -1433,10 +1431,8 @@ static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
>   
>   	mutex_unlock(&dcc->cmd_lock);
>   
> -	if (!issued && io_interrupted)
> -		issued = -1;
> -
> -	return issued;
> +	if (!(*issued) && io_interrupted)
> +		*issued = -1;
>   }
>   static unsigned int __wait_all_discard_cmd(struct f2fs_sb_info *sbi,
>   					struct discard_policy *dpolicy);
> @@ -1464,8 +1460,10 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
>   		if (i + 1 < dpolicy->granularity)
>   			break;
>   
> -		if (i + 1 < dcc->max_ordered_discard && dpolicy->ordered)
> -			return __issue_discard_cmd_orderly(sbi, dpolicy);
> +		if (i + 1 < dcc->max_ordered_discard && dpolicy->ordered) {
> +			__issue_discard_cmd_orderly(sbi, dpolicy, &issued);
> +			return issued;
> +		}
>   
>   		pend_list = &dcc->pend_list[i];
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
