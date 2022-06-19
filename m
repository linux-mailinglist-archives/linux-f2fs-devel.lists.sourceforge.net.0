Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0095507C4
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Jun 2022 02:41:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o2j05-00082X-Qq; Sun, 19 Jun 2022 00:41:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1o2j04-00082L-Ok
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 00:41:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q6B8w/+dkf+uhgpiaVxVdqcl2qu7Z6pWJU6ALHAv408=; b=dbS3bKai/hC/dwsvI2NW/tqi6u
 2glxxz+vIm6Egzn926RG4YNeHjUM+lu29fHVOoBVOgvd4HJ2WVNwFEjHIQ8S45PUoBy0CpSO0Drpy
 fWsCQ5naCX3n6e4eVMhJTZUt+blNtbsRDm1g9G3FlpssYes8bBRQ13mU96QHfPpTk7m0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q6B8w/+dkf+uhgpiaVxVdqcl2qu7Z6pWJU6ALHAv408=; b=CM+M+esBGeuigxB+CVudSPGETj
 a7WRO80TTjU0ByD1EIACYk+4yXF+ZcRImshh6wQFYfVddbIZs7zhY3O7bENPPyMlguwsjQF3IlRBa
 Y8aVYUBVZCdSACsipVj1iEzwxqVHH3B9/sdb57HZ/QUDPT6wmohx54Tex+AVjePaOXK4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o2j04-006tBl-Ph
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 00:41:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B5214B80108
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 19 Jun 2022 00:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A67C3411A;
 Sun, 19 Jun 2022 00:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655599264;
 bh=7Szk84PluvaE/i1H0i4KYSWKHR6uBovmNJ8fRYEiXLc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=YBMwtlCeRySE4VibIAG6yjvMtWZkW9ctVw5Lnilbe6p3hE3iKLqMQI+0gamwKyTss
 UGUe/fWmg7FCvJWFqi3GMTz30n0aT2po0Z+kejU+2Hm6OqIs/dU/ffF0HRNb8CY3ZD
 gHxOgPmFEy+D9QSsaoQvalSY8wqYR+mIaCnp1oU6tcDgp3JHGCACbkTDJnC3fWCTnX
 PXwUjesZe6cE+v26+M5rLz+xNah82WquuDr/A9by6JO827HcCh4pOBbfW+N+TqbVVg
 ISoedBHDOUd9uHJodPvOp3rs+qzA2fKGvKBbmyeyrbr/fBP3Xpl+q9ZvkMDEGa39Q1
 tilfzGpNccYnA==
Message-ID: <c45a9c8b-c73a-76bc-6725-5d7e48e7a3f2@kernel.org>
Date: Sun, 19 Jun 2022 08:41:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220617223106.3517374-1-jaegeuk@kernel.org>
 <20220617223106.3517374-2-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220617223106.3517374-2-jaegeuk@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/18 6:31,
 Jaegeuk Kim wrote: > When users set GC_URGENT
 or GC_MID, they expected to do GCs right away. > But, there's a condition
 to bypass it. Let's indicate we need to do now > in the threa [...] 
 Content analysis details:   (-7.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o2j04-006tBl-Ph
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs: run GCs synchronously given user
 requests
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/18 6:31, Jaegeuk Kim wrote:
> When users set GC_URGENT or GC_MID, they expected to do GCs right away.
> But, there's a condition to bypass it. Let's indicate we need to do now
> in the thread.

.should_migrate_blocks is used to force migrating blocks in full
section, so what is the condition here? GC should not never select
a full section, right?

Thanks,

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/gc.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index d5fb426e0747..f4aa3c88118b 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -37,7 +37,6 @@ static int gc_thread_func(void *data)
>   	unsigned int wait_ms;
>   	struct f2fs_gc_control gc_control = {
>   		.victim_segno = NULL_SEGNO,
> -		.should_migrate_blocks = false,
>   		.err_gc_skipped = false };
>   
>   	wait_ms = gc_th->min_sleep_time;
> @@ -113,7 +112,10 @@ static int gc_thread_func(void *data)
>   				sbi->gc_mode == GC_URGENT_MID) {
>   			wait_ms = gc_th->urgent_sleep_time;
>   			f2fs_down_write(&sbi->gc_lock);
> +			gc_control.should_migrate_blocks = true;
>   			goto do_gc;
> +		} else {
> +			gc_control.should_migrate_blocks = false;
>   		}
>   
>   		if (foreground) {
> @@ -139,7 +141,9 @@ static int gc_thread_func(void *data)
>   		if (!foreground)
>   			stat_inc_bggc_count(sbi->stat_info);
>   
> -		sync_mode = F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC;
> +		sync_mode = F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC ||
> +				sbi->gc_mode == GC_URGENT_HIGH ||
> +				sbi->gc_mode == GC_URGENT_MID;
>   
>   		/* foreground GC was been triggered via f2fs_balance_fs() */
>   		if (foreground)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
