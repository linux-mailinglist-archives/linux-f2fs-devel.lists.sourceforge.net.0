Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E42D3731F99
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jun 2023 20:00:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q9rGu-0007Jj-Cd;
	Thu, 15 Jun 2023 18:00:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1q9rGt-0007Jc-Jp
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jun 2023 18:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=irbZUQyXmZtmRxv1mVudvytN+DzfziO+da6cH+lX0pQ=; b=Bk1aZwy1paUBFGzjux0e0zfo2V
 FNbugfrCsykI+8qL0mJtFeNap9na2jdMVlUj0RmkB/knnqAptFZ23iEWQ+YMEWFdZ1f4t0zukMdTM
 f+ayH337bExB8E1HNivQ1I4wnkQHrTacM42F+o3Q5e9zqXvnpd4VQ9LoWV4peSXxEZRA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=irbZUQyXmZtmRxv1mVudvytN+DzfziO+da6cH+lX0pQ=; b=N5Wa03oRpoaSyv6vx60hxaNGBj
 272eWFDYakM3kcOMFKIlMDJYsgWSB3/Pp3vw3sSqbAJ4omVb7nt0Ox1mKpBYweS/sCa6jA/3xG+aR
 EnxQ9Mv4ufij74VJSL/c7fxwBKdffbFY2xAmvhQpuWkaAVZ2f8gmq2NqalWFCJV5orGg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q9rGt-004QtO-2L for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jun 2023 18:00:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 44E53622C0;
 Thu, 15 Jun 2023 18:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4720AC433A9;
 Thu, 15 Jun 2023 18:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686852023;
 bh=aIpA+No+IYUS2eydROUU+J8tzkLnv1Uz23da1C/W8o0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=NOS5PxqmElCq3Muy5StRWkIBjKjYbP+cCm+hpf7CEkWk93Ne14kunxeI4RTHp79Qs
 4/8CiAUEC5ZlBO2Vq4m49qJU+FTseEIwbVZ3Ize1ZMxVzAetSX8HiutFcvEf/my5nA
 fpi56MPy6RGq6tPO4LtTL7NzWXaUr+XKP/rBrRIB3nrYhVWFcfwDPijB/H6OK4YNG1
 1WM9tJkspH4eo9170WxqHyB0a41FCW0WwwLmhnoQ0a/TsUCgjo57hpD37H4I5bXIci
 XDNat3IIHP2Fx+847dxsBrSIAAbmoOQfukAtYTG9MKrY74GwG1oJ2QDBNG/gnfsCNg
 uDGqp8jnXaunw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 199BCC3274B; Thu, 15 Jun 2023 18:00:23 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168685202310.7502.1450479349588433609.git-patchwork-notify@kernel.org>
Date: Thu, 15 Jun 2023 18:00:23 +0000
References: <20230613072912.52249-1-frank.li@vivo.com>
In-Reply-To: <20230613072912.52249-1-frank.li@vivo.com>
To: Yangtao Li <frank.li@vivo.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 13 Jun 2023 15:29:11 +0800 you
 wrote: > This adds the async buffered write support to f2fs, > the following
 is the relevant test data. > > iodepth | 1 | 2 | 4 | 8 | 16 | > before(M/s)
 | 1012 | [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q9rGt-004QtO-2L
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: enable nowait async buffered writes
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, luhongfei@vivo.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 13 Jun 2023 15:29:11 +0800 you wrote:
> This adds the async buffered write support to f2fs,
> the following is the relevant test data.
> 
> iodepth      | 1    | 2    | 4    | 8    | 16   |
> before(M/s)  | 1012 | 1133 | 894  | 981  | 866  |
> after(M/s)   | 1488 | 1896 | 2081 | 2188 | 2207 |
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: enable nowait async buffered writes
    https://git.kernel.org/jaegeuk/f2fs/c/d61812691182

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
