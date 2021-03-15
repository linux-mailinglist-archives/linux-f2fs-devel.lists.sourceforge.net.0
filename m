Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8863833AB79
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Mar 2021 07:13:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lLgTU-0002PZ-5H; Mon, 15 Mar 2021 06:13:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lLgTT-0002PO-Da
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Mar 2021 06:13:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q6Pk0dLNOvIR91j2fiGxLqRAnrDFXCbgMTkyhk1g3RI=; b=LXThL2BGaTMy4bARZ56jH+2vhm
 RMbEJROcfRR6IKYaUD/iCTxGy2H1WhmAXfRYpLwQdDFr7QJzXtDwkvddiyO8welk/AbOn4x2T6fNY
 hoGpQKcUbyTlGig7AqBWj5NVEJQh/+FePYu/6s6AoZgS8/Q9QqjgurluWyJCDss1A9YI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q6Pk0dLNOvIR91j2fiGxLqRAnrDFXCbgMTkyhk1g3RI=; b=Xrdvt1SbjBDZza06jG3Jvqj5Mu
 QNMdecTi5tNXTNRfAeq+YyWTF0BWhhHOZE4vKi6JjLFR2c4yjmZY0nXQLX/wqOnp9WhypMJKwHgJD
 qcV6eprjOrrwoAFMKcMHiIn8+gZI7uiW+mQncWjLgsjREEIcs4ZQYJF/3Yrz1SaGKZmA=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lLgTM-000Ahu-JN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Mar 2021 06:13:07 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DzQy95K4KzNn2k;
 Mon, 15 Mar 2021 14:10:25 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 15 Mar
 2021 14:12:45 +0800
To: Sahitya Tummala <stummala@codeaurora.org>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <1615784186-2693-1-git-send-email-stummala@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <49be0c70-4fe4-6acd-b508-08621f0623c0@huawei.com>
Date: Mon, 15 Mar 2021 14:12:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1615784186-2693-1-git-send-email-stummala@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lLgTM-000Ahu-JN
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix the discard thread sleep timeout
 under high utilization
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
Cc: linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Sahitya,

On 2021/3/15 12:56, Sahitya Tummala wrote:
> When f2fs is heavily utilized over 80%, the current discard policy
> sets the max sleep timeout of discard thread as 50ms
> (DEF_MIN_DISCARD_ISSUE_TIME). But this is set even when there are
> no pending discard commands to be issued. This results into
> unnecessary frequent and periodic wake ups of the discard thread.
> This patch adds check for pending  discard commands in addition
> to heavy utilization condition to prevent those wake ups.

Could this commit fix your issue?

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=43f8c47ea7d59c7b2270835f1d7c4618a1ea27b6

Thanks,

> 
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> ---
>   fs/f2fs/segment.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index dced46c..df30220 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1112,6 +1112,8 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
>   				struct discard_policy *dpolicy,
>   				int discard_type, unsigned int granularity)
>   {
> +	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
> +
>   	/* common policy */
>   	dpolicy->type = discard_type;
>   	dpolicy->sync = true;
> @@ -1129,7 +1131,8 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
>   		dpolicy->io_aware = true;
>   		dpolicy->sync = false;
>   		dpolicy->ordered = true;
> -		if (utilization(sbi) > DEF_DISCARD_URGENT_UTIL) {
> +		if (utilization(sbi) > DEF_DISCARD_URGENT_UTIL &&
> +				atomic_read(&dcc->discard_cmd_cnt)) {
>   			dpolicy->granularity = 1;
>   			dpolicy->max_interval = DEF_MIN_DISCARD_ISSUE_TIME;
>   		}
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
