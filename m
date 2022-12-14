Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CFA64D1FA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Dec 2022 22:52:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5Zg3-0006w2-LQ;
	Wed, 14 Dec 2022 21:52:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p5Zg2-0006vv-Ul
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Dec 2022 21:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7wKBdlVHYK8AIGFTyPA6IYbMeH0grO8kmVhvXpwvenU=; b=ShRRgzFbz6yt5F4+aDpFxcYfDp
 x1APQaOvXriSEw5MDs3F80eNuO3+kvc9y9MncmG8uOMWBbmeMWanKyvslqcgF7Fn8xIN+CXwDTm8f
 O1FRNg+V/JuxYFCGsYSwtPH5zWZ0unCUqhHOh5Wctgj3xdZ/WO0gBBUj+L3jbiPyeGGU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7wKBdlVHYK8AIGFTyPA6IYbMeH0grO8kmVhvXpwvenU=; b=mtubg8PGd3ZhFYm1rXKAiXb9zD
 p7EpPW9ynPT6+asvr7fW72ey0nZeEW3VFww8eHqOnogzMP25g0zLc9bFOxxGzlFj044BWOYYSeIDG
 U537MvqqXmQgRPJIwpsn2ibwDG6gzDqHAbNjLUruwNZqZ279JbYwHV8VsoXZ5RpWH1iU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5Zg1-00057B-Tp for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Dec 2022 21:52:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8732E61B0B;
 Wed, 14 Dec 2022 21:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24D8C433EF;
 Wed, 14 Dec 2022 21:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671054748;
 bh=gG2DXUOGTObADyLgpIRItMNng/eOb9njgSqvCaN25a8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GO2SXggVq7mMJUXZ45uJm/ONB7E3SqEgS87dg/z2Yy5XIjh6o8oSxDctPCVct9tAd
 3DccvhySVsxRUIm2cfREsWrFNe8OaWYAxyh0PvDGeb2e57KArcf8VUtQYebPM4UDuv
 R+EN8YXM5wSQfj6xTWSWwq2rx7bcQ+ejDwwwSUVrevvlrleuQcCJOpK9cZiL+cYCp7
 slHhavPHpNL0OfgRd44KzeR4AvZa+5S5YsDYo1eRpxepFThFc0qpAjrJeAH3Cyu0bb
 tB7jyn5pXuhJrK2xsZtaKpBHRfvMzKRVc8aT+C7b+8p6Ii/o+fGAWnFTHSBQaSNuzG
 z6YtdLbfenlUw==
Date: Wed, 14 Dec 2022 13:52:26 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Y5pFmv4AUDxw9GI9@google.com>
References: <Y5jPyEiAtDPx7VSI@google.com>
 <20221214072830.32911-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221214072830.32911-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/14, Yangtao Li wrote: > Hi Jaegeuk, > > > I cut off
 the patches for this merge window. Please consider next release. > > Alright, 
 thanks for your reminder. > > > BTW, could you please send a pat [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p5Zg1-00057B-Tp
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add support for counting time of
 submit discard cmd
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/14, Yangtao Li wrote:
> Hi Jaegeuk,
> 
> > I cut off the patches for this merge window. Please consider next release.
> 
> Alright, thanks for your reminder.
> 
> > BTW, could you please send a patch set instead of random posts?
> 
> Most of the patches were noticed when I looked at the code, and they were scattered.
> On the one hand, there is not much relationship between them, so I send patches based
> on the f2fs-dev branch every time. On the other hand, it is also to avoid that a patch
> may not be received and block subsequent patches.
> 
> > It's quite hard to find which one was merged or not.
> 
> Why not to use patchwork to manage patches?
> This tool is used by many kernel subsystems. And This tool has a more friendly
> interface and can mark the status of the patch.
> 
> https://korg.wiki.kernel.org/userdoc/patchwork#adding_patchwork-bot_integration

Good idea. I requested to add f2fs project there. :) Let's see.

> 
> Thx,
> Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
