Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3DE7E4223
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Nov 2023 15:54:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r0NSj-0005TZ-D2;
	Tue, 07 Nov 2023 14:53:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r0NSi-0005TT-6e
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Nov 2023 14:53:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zinAH+53afmK4mC19DUZHR/C3PQtlAw51FZWyR90EKM=; b=Peb/R4bzpLmhLZQnS1Y//kM4Bm
 6YOjqATTEmcFluvnr1WciIey9Se29HeyQgIv6RgUG8CE515z11SPfGfbyem9QH4lUt0uvyPSHCKjG
 tiDA4SbKY19zMrWLQf88kfdNjRjqkvpM20JFn4taay610NEDrzJXJNaJEk6FZtu06meA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zinAH+53afmK4mC19DUZHR/C3PQtlAw51FZWyR90EKM=; b=c5uucUHPfYa69YpCpmbGxPgi/H
 ZZ8OXKXaeJafk0Xvi6PU/KtRlOFwfuY+wmMbtsahcxEorPwVp+asmjVvYB8cPUznGY21+ulkAQlCT
 oOuWWZji5HUP+R4dkSaSGMGBRBRtrCcOUHESPkdS9ZvDCJB9AlR2qUID03Efy1o2/vy0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r0NSi-00AMRB-4I for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Nov 2023 14:53:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B5D6B611F1;
 Tue,  7 Nov 2023 14:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD27C433C7;
 Tue,  7 Nov 2023 14:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699368826;
 bh=fOlaiY+Lug3W3hWE5Iha2poFtpHLl/oEcKB+nLp/pwE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TmchANtoaaPiRKN2OVuXoB2x79MMbJ7272ifdkW3t+92fq6U6CbxC5kzht3cXPb/7
 J4YodH/BXoKU0iQW1fxWBeltkc37FnJLmxr78LvB3cSO/+ziGO0jbU4WeR4c5DYmUZ
 lyl8PKDM2Xt16Z3YWWdbkMeLnIlJZ00L0MsBXm/VcQLdPHTfrlbiSt/roXfYVfSMYG
 M3NKJqJwluRWHFHezS5ERBDZQ9jTqssjxNrcEtS/2+o4G1GEhDh85tCf0ZmouyzEzF
 bqDn5mFiWa9VBvQ6VyD/TUOJ+hXbPJPTrMHNeyvJb9mVylKdDmOc3yMISK7BPkL6Ub
 0E/C0IAWoPkWg==
Message-ID: <fbba559c-59e2-94f1-52d6-94960a13f682@kernel.org>
Date: Tue, 7 Nov 2023 22:53:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1698888042-17199-1-git-send-email-zhiguo.niu@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1698888042-17199-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/11/2 9:20, Zhiguo Niu wrote: > Because the length
 of task'name in task_struct can not exceed > 16 characters,
 f2fs some thread'name
 cannot be fully displayed, > including important device numb [...] 
 Content analysis details:   (-7.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r0NSi-00AMRB-4I
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix thread name cannot be fully
 displayed
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
Cc: niuzhiguo84@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/11/2 9:20, Zhiguo Niu wrote:
> Because the length of task'name in task_struct can not exceed
> 16 characters, f2fs some thread'name cannot be fully displayed,
> including important device number information.
> If there are more than one partition using the f2fs file system,
> it is very inconvenient to match partitions and their threads.
> 
> The following examples show that 4 partitions all use f2fs file system
> PID: 400    TASK: ffffff80f120c9c0  CPU: 2   COMMAND: "f2fs_discard-25"
> PID: 392    TASK: ffffff80f6b75880  CPU: 3   COMMAND: "f2fs_discard-25"
> PID: 400    TASK: ffffff80f120c9c0  CPU: 2   COMMAND: "f2fs_discard-25"
> PID: 392    TASK: ffffff80f6b75880  CPU: 3   COMMAND: "f2fs_discard-25"
> PID: 510    TASK: ffffff80dd62c9c0  CPU: 0   COMMAND: "f2fs_ckpt-254:4"
> PID: 255    TASK: ffffff80f2268000  CPU: 3   COMMAND: "f2fs_ckpt-259:4"
> PID: 398    TASK: ffffff80f120ac40  CPU: 2   COMMAND: "f2fs_ckpt-259:4"
> PID: 390    TASK: ffffff80f6b76740  CPU: 3   COMMAND: "f2fs_ckpt-259:4"
> PID: 511    TASK: ffffff80dd629d80  CPU: 3   COMMAND: "f2fs_flush-254:"
> PID: 399    TASK: ffffff80f120bb00  CPU: 2   COMMAND: "f2fs_flush-259:"
> PID: 391    TASK: ffffff80f6b70000  CPU: 3   COMMAND: "f2fs_flush-259:"
> PID: 256    TASK: ffffff80f226d880  CPU: 6   COMMAND: "f2fs_flush-259:"
> 
> We can use the name format such as f2fs_gc-xxx, as saw in device:
> PID: 260    TASK: ffffff80f8c2e740  CPU: 3   COMMAND: "f2fs_gc-259:44"
> PID: 420    TASK: ffffff80f6505880  CPU: 2   COMMAND: "f2fs_gc-259:41"
> PID: 393    TASK: ffffff80f6b72c40  CPU: 1   COMMAND: "f2fs_gc-259:40
> PID: 513    TASK: ffffff80dd62e740  CPU: 1   COMMAND: "f2fs_gc-254:40"

Can you please check comments in below link?

https://lore.kernel.org/linux-f2fs-devel/8eaad9d0-1d59-3ecb-bab4-904ed22385f4@kernel.org/

Thanks,

> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>   fs/f2fs/checkpoint.c | 2 +-
>   fs/f2fs/segment.c    | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index b0597a5..f6a5424 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1893,7 +1893,7 @@ int f2fs_start_ckpt_thread(struct f2fs_sb_info *sbi)
>   		return 0;
>   
>   	cprc->f2fs_issue_ckpt = kthread_run(issue_checkpoint_thread, sbi,
> -			"f2fs_ckpt-%u:%u", MAJOR(dev), MINOR(dev));
> +			"f2fs_cp-%u:%u", MAJOR(dev), MINOR(dev));
>   	if (IS_ERR(cprc->f2fs_issue_ckpt)) {
>   		int err = PTR_ERR(cprc->f2fs_issue_ckpt);
>   
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index d05b416..b290713 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -677,7 +677,7 @@ int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi)
>   
>   init_thread:
>   	fcc->f2fs_issue_flush = kthread_run(issue_flush_thread, sbi,
> -				"f2fs_flush-%u:%u", MAJOR(dev), MINOR(dev));
> +				"f2fs_fh-%u:%u", MAJOR(dev), MINOR(dev));
>   	if (IS_ERR(fcc->f2fs_issue_flush)) {
>   		int err = PTR_ERR(fcc->f2fs_issue_flush);
>   
> @@ -2248,7 +2248,7 @@ int f2fs_start_discard_thread(struct f2fs_sb_info *sbi)
>   		return 0;
>   
>   	dcc->f2fs_issue_discard = kthread_run(issue_discard_thread, sbi,
> -				"f2fs_discard-%u:%u", MAJOR(dev), MINOR(dev));
> +				"f2fs_dc-%u:%u", MAJOR(dev), MINOR(dev));
>   	if (IS_ERR(dcc->f2fs_issue_discard)) {
>   		err = PTR_ERR(dcc->f2fs_issue_discard);
>   		dcc->f2fs_issue_discard = NULL;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
