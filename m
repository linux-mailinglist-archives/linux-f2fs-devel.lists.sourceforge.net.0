Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADF32E8FA3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Jan 2021 04:46:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kwGol-0001PR-3h; Mon, 04 Jan 2021 03:46:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kwGoj-0001Oo-GU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 04 Jan 2021 03:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9hjLp9VJJpCPgE5uwNdMY7hK/Hb7qIhQLa1J4BjKgQs=; b=jR3JuXCZl3pr0lHd+pzjJIy4P3
 uxS/Wt/XfMgYIpe/aUtypVZz/oFVhl1iPEXvtmjjeOeB1aKLklm6vQckGmke8NYc0Swe56ODb+Utr
 AfJrHbYRT9WwU6wayvX+mkNC8iMxdUxynQT/YtPNf0/vYJxSfOiwcH+YiJV/KEqpFPWc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9hjLp9VJJpCPgE5uwNdMY7hK/Hb7qIhQLa1J4BjKgQs=; b=Cs8V+AKVW+sqe18Jc/4r+9eIHM
 C3xGp5Fwl3Qndg4mnXx6qQTMDbOaFJhW9iArLoa9Mkbs3OzZMnqahfMtJEPcVRrFigiW4m1X4SWOn
 w/9yCAR4fNsn2X4t0IPwd0k99TOM8ZN8+3H278X2bNkmgD03lw/3scWyFn4kOZ6/pQa0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kwGof-005DT3-Dr
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 04 Jan 2021 03:46:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 961562087E;
 Mon,  4 Jan 2021 03:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609731946;
 bh=6ARBT7fFQGUTWuwnrfa5PJ/9w9tyLns+HdyLR3NXCPI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YZC1dXHL+EmCdKCQ4V/QzikM849gh3LL7x0oeyt/hBrM2tgOOQc7UGu9R/BM0Bw/h
 xfw3l6gG2s4ezllPRVVAYDuK+wfI4OsrsklFYVD76PuQdU/KgoH4PP2n9M68itaJqf
 RyLA2uRT8qxqBMb6Up8KzEdZ2i6opg/f1Cp/PjyfhJAp14Zyjj7mJwkaPq6uHTwnvd
 16v5fTnexkktHb/lJGLsISrBZqbag5G9tSEV430b5OlEJ5d9MYgx/YdhdGuTXWRR8W
 ePSdgSdhoLhHRHxNMRGQ+j4Jm1DQe6wv82vMPu34OLhgYybXwZQMDw9uIYdTdKCRQT
 eN/E7LYVMc/MA==
Date: Sun, 3 Jan 2021 19:45:45 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X/KPaX7Z0WDEXhBM@sol.localdomain>
References: <20201228232612.45538-1-ebiggers@kernel.org>
 <a43158eb-114e-7f7f-871a-7bd9c70639d6@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a43158eb-114e-7f7f-871a-7bd9c70639d6@huawei.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kwGof-005DT3-Dr
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: clean up post-read processing
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
Cc: linux-fscrypt@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 04, 2021 at 11:35:58AM +0800, Chao Yu wrote:
> On 2020/12/29 7:26, Eric Biggers wrote:
> > +	if (ctx && (ctx->enabled_steps & (STEP_DECRYPT | STEP_DECOMPRESS))) {
> > +		INIT_WORK(&ctx->work, f2fs_post_read_work);
> > +		queue_work(ctx->sbi->post_read_wq, &ctx->work);
> 
> Could you keep STEP_DECOMPRESS_NOWQ related logic? so that bio only includes
> non-compressed pages could be handled in irq context rather than in wq context
> which should be unneeded.
> 
> Thanks,
> 

That's already handled; I made it so that STEP_DECOMPRESS is only enabled when
it's actually needed.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
