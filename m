Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 278D66C3724
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Mar 2023 17:40:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pef2O-00045P-DM;
	Tue, 21 Mar 2023 16:40:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pef2M-00045D-Cv
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Mar 2023 16:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/QcdMdjS5W18s49Sj1lmCsX19t1ORxeZlTBcAX5nlF8=; b=EfH6QYP8vD/0f1NXzgeP1Av4wC
 qlWcRkfXWvCFTDks2kqSTahdyeASWUCoXpKvVwSD2ez/+t0vYPVFkdKv2Cp4OlufFdU//0JSzg2BH
 MgslmxYydoHLku6RzuWxvcAJK4H3hCRYg1Iqdho2viZ8DaEmuIQUB56jw2LUzOeu3Alo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/QcdMdjS5W18s49Sj1lmCsX19t1ORxeZlTBcAX5nlF8=; b=FmxxRX0q+6SrKCH0pxTlg0Z/Ys
 gZkUn1qdPdrkLz+ze7P40kZ+T23jt7lElWKS4zPDq4RJl19vnHnaH0DjS44eg3cB969dUBQkFONJe
 tUDiWy5Ka7k1WKxu7Tv0HAVvKWZu/EMBT4dviFxLH7vLi62EwDSv8W4noE4jVpdmX2FQ=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pef2K-00FiJ0-Vm for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Mar 2023 16:40:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id EA9BCCE1A98;
 Tue, 21 Mar 2023 16:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06064C4339E;
 Tue, 21 Mar 2023 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679416819;
 bh=55reRUuPYsN7go7p2j+K98DZVMdkLy5/d38sthfHPtE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=kNgNn/z7V167WafQ8J3z1OcoJVbYWOuONUmHB3Jp6OyL5C3nVwHb14tJj1g/5DyQt
 SvHEtHdTDzv1rgahBeyDfWq++YCANCYuFrqz3Jp17NFH5xsLnL72dH4s71KsMoObqj
 UoNdAWQygaYYVW0fK22yWC2cuIXqiHyxpXzmSoxCFvglWYv1Tgi1tF9zrHsoVkXOYu
 mEUb8+LqvhsAmH025Y748edTTr9sEE1HhL9w93PQ6FXhjH32Oh1BlpoNomYuFKWBnG
 pd4Jmo4DVsd9vuZMp3n47XDkIinaYfHZmU+HiLHi1bKAyOuu/AD0XR+0KOaT/Hzp1Y
 0yZsFbUil8HiA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D1BD1E66C9A; Tue, 21 Mar 2023 16:40:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167941681885.25004.9197554561763193050.git-patchwork-notify@kernel.org>
Date: Tue, 21 Mar 2023 16:40:18 +0000
References: <20230308140623.35942-1-frank.li@vivo.com>
In-Reply-To: <20230308140623.35942-1-frank.li@vivo.com>
To: Yangtao Li <frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 8 Mar 2023 22:06:23 +0800 you wrote:
 > BIW reduce the s_flag array size and make s_flag constant. > >
 Signed-off-by:
 Yangtao Li <frank.li@vivo.com> > --- > v2: > -make s_flag constant > fs/f2f
 [...] Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pef2K-00FiJ0-Vm
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: convert to MAX_SBI_FLAG instead of
 32 in stat_show()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed,  8 Mar 2023 22:06:23 +0800 you wrote:
> BIW reduce the s_flag array size and make s_flag constant.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v2:
> -make s_flag constant
>  fs/f2fs/debug.c | 36 ++++++++++++++++++------------------
>  fs/f2fs/f2fs.h  |  6 +++++-
>  2 files changed, 23 insertions(+), 19 deletions(-)

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: convert to MAX_SBI_FLAG instead of 32 in stat_show()
    https://git.kernel.org/jaegeuk/f2fs/c/e17992cc090b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
