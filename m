Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D97848D7BB9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Jun 2024 08:40:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sE1MY-0001Zb-JT;
	Mon, 03 Jun 2024 06:40:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sE1MW-0001ZV-Oq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Jun 2024 06:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lPAaNlTMlGF5/Ju3NJ7bELN7ekax56notjSCE0gM0Ts=; b=Itw17HKC8vIFofQmNs0/qZejXM
 GJvCYdUtBdJbwMcCm/e4ksrQbp3aaOrgK7mlUbD637lgGgQvNcZthkuDcR3mED6vpSjVVrSpyMHWR
 SAhI4Nn6EsON57PL0bAcJMYfLpnNfhGF+jDZQSUUjzX/OkrlMiQhtW6lqA2DvkCLJG/U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lPAaNlTMlGF5/Ju3NJ7bELN7ekax56notjSCE0gM0Ts=; b=jVur/hwzxVe6pSb2DGMBoMHWS2
 lEKUZR4Mtl0PDVdZPSqxOs5kTtQC2RX8zVnO12a4n/6CmukmruJBJaixKHZhH4HOU7wo3jx18ynAS
 mz15B2cqeqvlJkPYTOJfql71GXhFIuoJiHmC7Zu0gQwcuIPd/QgKQWNvSClfLcHkA4eM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sE1MW-0008FY-JG for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Jun 2024 06:40:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 75EFF60C3B;
 Mon,  3 Jun 2024 06:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A936DC2BD10;
 Mon,  3 Jun 2024 06:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717396797;
 bh=yMVHDPZTk2KiIA4M5duiDTFOwyQCPZJ4+zZKOyjLkCQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=F6Wjim7ABkZMuZmkWslsUYfIjuqeMGoOQ5VHlSs7N4rpNsgE09DypCXPvJb51g3kt
 UoBg/grrCvrX7PT5SkbG/8O50M9pL0eIRFfrGY8TKPkeVduPouTL4t2a+AcI+mj7+Y
 +cgwyWZKKEaE3Njox0+uxrz5kIMd+r/AnF/n3bWnZE2feQquAY7bTxaZPTJ45uTYGS
 +c9YAe77T8hz9SvEtxtuv5ibtGbk+f8yIYJVSbPzh20nsi7XOeTScdv+xFA34iz/2Y
 3mPkXf++5nxkgtDbHzvjuxAMetR3bQ4cqdhOfnF3T1vrdHM7IUz0u7jM8lsqsfI3Sb
 Mj5y4ewYMOIVg==
Message-ID: <b0c9f3dc-417a-4891-bdf0-25b849828e3b@kernel.org>
Date: Mon, 3 Jun 2024 14:39:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1717146645-18829-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1717146645-18829-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/5/31 17:10,
 Zhiguo Niu wrote: > Use new Macro IOPRIO_PRIO_LEVEL
 to get ckpt thread ioprio data(level), > it is more accurate and consisten
 with the way setting ckpt thread > ioprio(IOPRIO_PRIO [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sE1MW-0008FY-JG
Subject: Re: [f2fs-dev] [PATCH] f2fs: use new ioprio Macro to get ckpt
 thread ioprio data
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/5/31 17:10, Zhiguo Niu wrote:
> Use new Macro IOPRIO_PRIO_LEVEL to get ckpt thread ioprio data(level),
> it is more accurate and consisten with the way setting ckpt thread
> ioprio(IOPRIO_PRIO_VALUE(class, data)).
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>   fs/f2fs/sysfs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 72676c5..55d46da 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -340,7 +340,7 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
>   	if (!strcmp(a->attr.name, "ckpt_thread_ioprio")) {
>   		struct ckpt_req_control *cprc = &sbi->cprc_info;
>   		int class = IOPRIO_PRIO_CLASS(cprc->ckpt_thread_ioprio);
> -		int data = IOPRIO_PRIO_DATA(cprc->ckpt_thread_ioprio);
> +		int data = IOPRIO_PRIO_LEVEL(cprc->ckpt_thread_ioprio);

So, can you please use 'level' to instead 'data' in f2fs_sbi_show() and
__sbi_store()?

Thanks,

>   
>   		if (class != IOPRIO_CLASS_RT && class != IOPRIO_CLASS_BE)
>   			return -EINVAL;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
