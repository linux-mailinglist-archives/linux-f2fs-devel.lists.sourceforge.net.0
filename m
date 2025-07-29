Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C911DB14FFA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Jul 2025 17:07:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0ZbsltNmz2QgAfCBDd6R+XexvxxUYAmdQZFeV3kqxI=; b=P74IPt/EGR7flUZcJgBnlBMyZG
	DBo/L0MAhNtPmvZKrTdltEbZI9tdq1ytw95xPKuY/04vEo2/m60smcaOikpmoGzSiBTIS4H8cPPVR
	viJe5b0hMhvoqWeRWSdqEGdTK0J5kdXFO/YEwZT6pPZiVMur48L6SSb2v97QvIABLLDc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uglvM-0003Md-2n;
	Tue, 29 Jul 2025 15:07:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uglvK-0003MW-Ef
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Jul 2025 15:07:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SU1KEw6Q6+ZXHGZq3U693ugWAwcgJj8A+6jC5CjMG5s=; b=DGUuMjVpABNsNosNQjr4wEJ4/E
 jrmGpG0F/KMOvzANwHSHfnBr25eBB+Vtk9+minC0PvtgCS6S9laLMkmoGcP18+vw7djNs5M1+Nlbl
 y22QqXagVROS1uEuxFO99u5qTvAZrMgOgWDL6wr+9pmLCpyc0cXkR2kI/ETCdOX3iH7U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SU1KEw6Q6+ZXHGZq3U693ugWAwcgJj8A+6jC5CjMG5s=; b=WUQWiZRX1bCU698nHihkWXBFyt
 fOcUlS8pYeVoV0JdOhuonY8Xt5kSk0/vOyszKlc6Eqmfkk0OQo/YV5BE9hKxazRuBAyXLUAjaOSYV
 uU0VvIPuODsylctJRG2R5hP0W0i3+ZnV3dea3aJFfaoOT3YvboJXnSfMzYpxT69XyG4M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uglvJ-00068a-VQ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Jul 2025 15:07:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0B36A5C6351;
 Tue, 29 Jul 2025 15:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870E2C4CEEF;
 Tue, 29 Jul 2025 15:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753801634;
 bh=Ei4j61++xYai4BK5l+E6lE08w0YyBTZsWiZjNGGayh8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bTvkfjvuOt5QmZsgVZ+bICfYaIzVvCjhGSn8i2tm85TnsqOxHiBHQi2MR8EcUznT3
 CS8IQnRLsh++3pzI6RblJg7URscFMAAi8FTV1DG17RcYbGvURxKegnmBReglCfsRHq
 MYl4dxfFLz3KYKdKIZab2j/TwbaR65LMdpgEjXrZ577NTI3t7I/CSb+qZNIikVhSX/
 Y3woxHSyi230GmgAv3Z3rosdhuEnGlOAIgriYBgM9AW+Vh0s4kvA9Ethmt8j+WPBzF
 OS/oR946RLUkZh4USq/4ZOGF2jr90KQajlaDnjRca976/dGV7nQOU8bRgfV5uQw1CL
 C5PgcrUdIq4Mg==
Date: Tue, 29 Jul 2025 15:07:12 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aIjjoBJqYjdNv63m@google.com>
References: <20250729063326.435167-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250729063326.435167-1-chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/29, Chao Yu wrote: > generic/299 w/ mode=lfs will cause
 long time latency, let's dump more > information once we hit case. > > CP
 merge: > - Queued : 0 > - Issued : 1 > - Total : 1 > - Cur time [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uglvJ-00068a-VQ
Subject: Re: [f2fs-dev] [PATCH] f2fs: dump more information when checkpoint
 was blocked for long time
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/29, Chao Yu wrote:
> generic/299 w/ mode=lfs will cause long time latency, let's dump more
> information once we hit case.
> 
> CP merge:
>   - Queued :    0
>   - Issued :    1
>   - Total :    1
>   - Cur time : 7565(ms)
>   - Peak time : 7565(ms)
> 
> F2FS-fs (vdc): checkpoint was blocked for 7565 ms, affecting 1 tasks
> CPU: 8 UID: 0 PID: 1614 Comm: f2fs_ckpt-253:3 Tainted: G           O        6.16.0-rc3+ #406 PREEMPT(voluntary)
> Tainted: [O]=OOT_MODULE
> Call Trace:
>  dump_stack_lvl+0x6e/0xa0
>  __checkpoint_and_complete_reqs+0x1a6/0x1d0
>  issue_checkpoint_thread+0x4b/0x140
>  kthread+0x10d/0x250
>  ret_from_fork+0x164/0x190
>  ret_from_fork_asm+0x1a/0x30

Can we add more information for debugging this?

> 
> Cc: Jan Prusakowski <jprusakowski@google.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/checkpoint.c | 9 ++++++++-
>  fs/f2fs/f2fs.h       | 3 +++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index db3831f7f2f5..b0dcaa8dc40d 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1788,8 +1788,15 @@ static void __checkpoint_and_complete_reqs(struct f2fs_sb_info *sbi)
>  
>  	spin_lock(&cprc->stat_lock);
>  	cprc->cur_time = (unsigned int)div64_u64(sum_diff, count);
> -	if (cprc->peak_time < cprc->cur_time)
> +	if (cprc->peak_time < cprc->cur_time) {
>  		cprc->peak_time = cprc->cur_time;
> +
> +		if (unlikely(cprc->peak_time >= CP_LONG_LATENCY_THRESHOLD)) {
> +			f2fs_warn_ratelimited(sbi, "checkpoint was blocked for %u ms, affecting %llu tasks",
> +					cprc->peak_time, count);
> +			dump_stack();
> +		}
> +	}
>  	spin_unlock(&cprc->stat_lock);
>  }
>  
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 46d23c2c086c..3130ca6a4770 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -350,6 +350,9 @@ struct ckpt_req_control {
>  	unsigned int peak_time;		/* peak wait time in msec until now */
>  };
>  
> +/* a time threshold that checkpoint was blocked for, unit: ms */
> +#define CP_LONG_LATENCY_THRESHOLD	5000
> +
>  /* for the bitmap indicate blocks to be discarded */
>  struct discard_entry {
>  	struct list_head list;	/* list head */
> -- 
> 2.49.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
