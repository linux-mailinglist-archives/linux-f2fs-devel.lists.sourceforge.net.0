Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE0054A8CC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jun 2022 07:38:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o0zGC-0002TY-1w; Tue, 14 Jun 2022 05:38:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1o0zGA-0002TS-C0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 05:38:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3Z51Jq+CC9Ksw0axyGDD5DV9JLlRzpYPLgLZ39sG3sU=; b=X9eQKsJSaTjzEyMsnLRBYd8WyR
 M/x4De3QoJY07eTP6Ja7GHulpzfs5RPSdKLfU3m1TdkiHTKy8ruZMjxf5D38Y9JTx67sA8NQj5o9O
 mW1gwEeWjuSo8aN6/M0snH1+188jVUUUHvF2IALV2Z9yCpBbLo5zSXWRC+eF+/IqjWUQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3Z51Jq+CC9Ksw0axyGDD5DV9JLlRzpYPLgLZ39sG3sU=; b=hiKCg3DmH1UT8PT2EBqnxour6I
 WuaS6OK9T2Ttla3Z6ytRL+IZIh7IUTq6t0q0WmK+SFZ3EFkemvQ0Q9d2o8IrPGnVwAT3N7ftYXOH3
 o1zcDsJ9YvNZld6oi+opn06EyCkBAXChBvOHnSj5MSpumAdVz8FAqcqfrzbxXJPRnpIw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o0zG6-000tsy-O4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jun 2022 05:38:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 79CF7B81647;
 Tue, 14 Jun 2022 05:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09168C3411B;
 Tue, 14 Jun 2022 05:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655185107;
 bh=TUhaPG/zxoBGFQdav+4Zj5v/KaSlZdbKvwElcae+ekM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PRRynFCKlFafYnFV+FXpS5mPmjmy9RbNBZIUudNs33AxblZJIL3y/AITp9ILp48mS
 h+gQHIe1pnbh6so8jxUOGl+g2NLM32vBs8Abet1BoL/7FebxtRtxs31XcYKznjzbUn
 MVC/LOgyDSEKZXlSvDySRxmj58gTLtMWugNCXjEcoDTl6+zxwyWbWiZc7PUJjNHysi
 ZNXPAcJPUIjO3vANraA3A4bExaGTvuUXDbjOXeXBI7Yv3v2NVRJ9LTJyV/8jLxgkBh
 14UjGCW8T5dGbC/czXUGtUV9ygaqQ4sm9a0w7/97E9FQT6R68r1ybSrSavHuRB23L1
 8FlXJP2qnIr8Q==
Date: Mon, 13 Jun 2022 22:38:25 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <Yqge0XS7jbSnNWvq@sol.localdomain>
References: <20220613155612.402297-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220613155612.402297-1-daeho43@gmail.com>
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: [+Cc Nathan Huckleberry who is looking into a similar problem
 in dm-verity] On Mon, Jun 13, 2022 at 08:56:12AM -0700, Daeho Jeong wrote:
 > From: Daeho Jeong <daehojeong@google.com> > > Now decompression is being
 handled in workqueue and it makes read I/O > latency non-determi [...] 
 Content analysis details:   (-6.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o0zG6-000tsy-O4
Subject: Re: [f2fs-dev] [PATCH] f2fs: handle decompress only post processing
 in softirq
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
Cc: Daeho Jeong <daehojeong@google.com>, Nathan Huckleberry <nhuck@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

[+Cc Nathan Huckleberry who is looking into a similar problem in dm-verity]

On Mon, Jun 13, 2022 at 08:56:12AM -0700, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Now decompression is being handled in workqueue and it makes read I/O
> latency non-deterministic, because of the non-deterministic scheduling
> nature of workqueues. So, I made it handled in softirq context only if
> possible.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/compress.c | 145 +++++++++++++++++++++++++--------------------
>  fs/f2fs/data.c     |  50 ++++++++++------
>  fs/f2fs/f2fs.h     |  10 ++--
>  3 files changed, 119 insertions(+), 86 deletions(-)
[...]
>  static void f2fs_read_end_io(struct bio *bio)
> @@ -281,16 +283,28 @@ static void f2fs_read_end_io(struct bio *bio)
>  	}
>  
>  	if (bio->bi_status) {
> -		f2fs_finish_read_bio(bio);
> +		f2fs_finish_read_bio(bio, true);
>  		return;
>  	}
>  
> -	if (ctx && (ctx->enabled_steps & (STEP_DECRYPT | STEP_DECOMPRESS))) {
> -		INIT_WORK(&ctx->work, f2fs_post_read_work);
> -		queue_work(ctx->sbi->post_read_wq, &ctx->work);
> -	} else {
> -		f2fs_verify_and_finish_bio(bio);
> +	if (ctx) {
> +		unsigned int enabled_steps = ctx->enabled_steps &
> +					(STEP_DECRYPT | STEP_DECOMPRESS);
> +
> +		/*
> +		 * If we have only decompression step between decompression and
> +		 * decrypt, we don't need post processing for this.
> +		 */
> +		if (enabled_steps == STEP_DECOMPRESS) {
> +			f2fs_handle_step_decompress(ctx, true);

One question: is this (the bio endio callback) actually guaranteed to be
executed from a softirq?  If you look at dm-crypt's support for workqueue-less
decryption, for example, it explicitly checks 'in_hardirq() || irqs_disabled()'
and schedules a tasklet if either of those is the case.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
