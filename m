Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 991946CA9D5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Mar 2023 18:00:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pgpHC-0005pE-TS;
	Mon, 27 Mar 2023 16:00:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pgpGm-0005ob-33
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Mar 2023 16:00:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5CkRBzkL78Ioeoe5w1B4ppjByiT5o6gT2P3CXuigT8U=; b=hkqAKkHl7qa8dbJt/6VdAaBu4O
 TA7gZLKnSBNqSvhgofN1k4GjqLw77+9DSmuYEbtaP3f+7n+oiADtGmbzeFWvlS68yRD4sKB93iQiQ
 LNN4HWZuk9nW9ygP7PkqQphjRpV5MBTbPrPZF6snymEk0xA/uJ3C3+fTrRL6RLz9U9Ao=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5CkRBzkL78Ioeoe5w1B4ppjByiT5o6gT2P3CXuigT8U=; b=iUAt5hFnZiHSBbSxeiO2hzJ9Gg
 YD+grNPOhXN0tsOOpHOd51uGhG0HNff1Qy5SQiVoidk9VoMxVEVqwOXT3txozdypDSCP6j3c/UDe5
 LWlElvlsQQIVKvWzqw4gXAcUNX1nHLPwpmGp9EmRsQ072q3JFeP/bO7FSKKxCGAG7pMw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pgpGk-00038Q-HJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Mar 2023 16:00:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 25FA561360;
 Mon, 27 Mar 2023 16:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FE77C433A0;
 Mon, 27 Mar 2023 16:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679932820;
 bh=oUUSCDiH2WMg9UB86ydnRFcrguAfJOQY+1/VoFRAloU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=NeMVYXZ/FxoXhFDtqN+LHHb7lbyL+S2Veih4DCOl5zTZst3rKH76kafeSe279jp7z
 ulD6Brrphq7Ir6CetYD/B7vdsWwyXS49jeOfPr5BmJ3kKezjM2CbVcJY7driafB/VW
 2sSCpwiwLnAwy4qRfLh4KD5Ug4zMZtb4jIVNmEmluoupr5P5eaXuVkFYab4uV8ufzG
 XL4Lv4yAI4aCCXgttOrR6f1q9ehGXpObwXYQDiGgx9XKieViNxeMQPFO/KdDhl/Qjm
 6TmTfX7M71v13RsFh0df1w1ZBbjKVVrQm5DM3uKTT3MoY9ayDPblf2tCk5xUXJcqnX
 oH3r/UGoPGa+w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 EC7CCE4D02F; Mon, 27 Mar 2023 16:00:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167993281996.32120.327857245576913303.git-patchwork-notify@kernel.org>
Date: Mon, 27 Mar 2023 16:00:19 +0000
References: <20230319075822.79337-1-frank.li@vivo.com>
In-Reply-To: <20230319075822.79337-1-frank.li@vivo.com>
To: Yangtao Li <frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 19 Mar 2023 15:58:22 +0800 you
 wrote: > is_extension_exist() only return two values, 0 or 1. > So there is
 no need to use int type. > > Signed-off-by: Yangtao Li <frank.li@vivo.com>
 > --- > Re [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pgpGk-00038Q-HJ
Subject: Re: [f2fs-dev] [RESEND] f2fs: convert is_extension_exist() to
 return bool type
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

On Sun, 19 Mar 2023 15:58:22 +0800 you wrote:
> is_extension_exist() only return two values, 0 or 1.
> So there is no need to use int type.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> Resend this patch because there is no similar patch to merge in this time.
>  fs/f2fs/namei.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Here is the summary with links:
  - [f2fs-dev,RESEND] f2fs: convert is_extension_exist() to return bool type
    https://git.kernel.org/jaegeuk/f2fs/c/08d04e0156f3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
