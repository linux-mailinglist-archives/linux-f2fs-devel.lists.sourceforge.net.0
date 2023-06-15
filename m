Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9D4731F9E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Jun 2023 20:00:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q9rGu-00064E-5Q;
	Thu, 15 Jun 2023 18:00:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1q9rGq-000647-Pl
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jun 2023 18:00:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y9u06kSrt6I5g+JoKWtvU5ff2mgIQmm1HQDIWMwrWDg=; b=GHnCMtjRuLWYO5N1VN2zAL9RUy
 2eGWSArlBSLOEX4snk37aLU1tdirUIfsCR7nfL+1KDi+hqLyC1sRmk2P2igO7ciEcw2hgcodhBKtq
 Wsivn6IPULmhHy/Z2u2pLULn1No9n2AEAz9WEsb7nBImotayoBat70Cm5tvRLVKyjLSs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y9u06kSrt6I5g+JoKWtvU5ff2mgIQmm1HQDIWMwrWDg=; b=a++SGFvzrJrYkHo9rGnZVE3gD4
 cQNX/m3mmZpxiTUzN+pEhF0iC93wZrWA8VAVtsaT/H5kf0K/e8SzQIcIUNybj5Eya554nTp4/G+lK
 +4hTgjENEx2lCbAaKZDAHpCkV0meUZAyjsGQTTiI960bPhkiwHn4a/+AP5P3U2qWjhxI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q9rGo-00063M-Lc for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Jun 2023 18:00:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4A486221F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 15 Jun 2023 18:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11EDDC433C8;
 Thu, 15 Jun 2023 18:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686852023;
 bh=xjpwDOfwo5GfYMb7NKBDO2vH76dSeta4+5w7iHfMRqo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=UAaL/bKhOJe/dz0JXS3mu0uFSZ2z4RinIp92NRVUjJ3/5boX+agFkiPbpN+Wb28CS
 ONYJkeCer9FO4GAaKnB23nMklwyu7i5ajE6gvR00VoLPqQK0Pc73baL8gcDP609MVz
 E85X9Wh/uc0+s86iTcAL8xg8FRiQtXQsEXbXqB3YRhq6NSsTpl1b0c34t/v96Nm6G1
 XgYKFa9r6y5WIsvnYc6E40me40VBkz0r1TcD133XKGEUj2cPl6BLwgFQjyCzcQhek7
 YsMUVcPhuxmcyDQ8TYg/mOcUIdr1ZsrWZpgJSdhGEvFaKrEJCS/0tNftnyeqhV/yNz
 kquFehz35wpgg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D3DB4C64458; Thu, 15 Jun 2023 18:00:22 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168685202285.7502.4758002877500330229.git-patchwork-notify@kernel.org>
Date: Thu, 15 Jun 2023 18:00:22 +0000
References: <20230612201626.3768393-1-jaegeuk@kernel.org>
In-Reply-To: <20230612201626.3768393-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 12 Jun 2023 13:16:26 -0700 you
 wrote: > Let's avoid any confusion from assigning compress_level=0 for LZ4HC
 and ZSTD. > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> > --- >
 fs/f2fs/compre [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q9rGo-00063M-Lc
Subject: Re: [f2fs-dev] [PATCH] f2fs: assign default compression level
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

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 12 Jun 2023 13:16:26 -0700 you wrote:
> Let's avoid any confusion from assigning compress_level=0 for LZ4HC and ZSTD.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/compress.c |  3 +--
>  fs/f2fs/f2fs.h     |  2 ++
>  fs/f2fs/super.c    | 12 +++++++-----
>  3 files changed, 10 insertions(+), 7 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: assign default compression level
    https://git.kernel.org/jaegeuk/f2fs/c/e59031a552b5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
