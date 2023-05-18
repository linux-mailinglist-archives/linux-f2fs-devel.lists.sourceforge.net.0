Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7242B70779F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 May 2023 03:50:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzSmk-0005v8-8A;
	Thu, 18 May 2023 01:50:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pzSmi-0005v2-DQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 01:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Eg6s7wpYw7I9ppUZ1ayNoEfJ0r5il2lS/TtU8iM/2Aw=; b=PleGwLIJfHySGaXJZ+o5RaYy5x
 Fx6udDY9KItwhevtfpHJd878vNrUwlPsgt6ZCkesCDaJd0vA1fiDp+VMhPCgM/blnv5HKbrHr34R0
 TPSfoA0v8iOWl7ubYR2iMhJWnbLpoVKS2KnLdftXTg+bhsT9I3yg9UBdkCEKmyST6L5Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Eg6s7wpYw7I9ppUZ1ayNoEfJ0r5il2lS/TtU8iM/2Aw=; b=PjJD6/WDu1yePUuNvZrEO1vuRe
 A0sw59qZMg10VVz0aGgj8082ZOMQFF7unV5Y7ND6g7EM9q5tX934A7km6KNCOWixwM5DORfpU84n8
 t68VzGDYXlg9cSDQLTjI5Ho/bfzptT+FIyxiKDDfbvkGRsu61G/kwI/N4JShit3PEQV8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzSmh-00Bluo-Tl for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 01:50:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8AD5064C42;
 Thu, 18 May 2023 01:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88C84C4339C;
 Thu, 18 May 2023 01:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684374621;
 bh=PFLd06VLQ2WY4f0od9Bw+0zPyizf71LbrjLVpikaTxU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Oi7OaKnixLsqk6cPpAvFNChdY9ez48wdye36EGfL/1CPlQWvZWC/DBS9A0gOnggLx
 OwL/6Z7KWlStThqe45n15z7Xj63GzKtgZzn+VG3mYAIvQaNxj5W2dNJrRPLz4CQhwK
 jpdNKEMLapcRG55difbO9dUpxfJbU/RfIMk+883gBB/xDfcfHaL9mxe6ckVSxpXH28
 QweyPv1phRCeapRY51ldw0fyCi7JLXr35uDl5NBPazCtJCwuwTnX/i62+jfJNkxAAo
 LI06zZgJG8WS1fYN/3BP1n1B4doMhmL6+EyKke/+DSzKnDPi6afm21iFl3GC6A4Jjo
 yBET1x1RpzNhQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6D584C59A4C; Thu, 18 May 2023 01:50:21 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168437462144.19511.3082830529196956881.git-patchwork-notify@kernel.org>
Date: Thu, 18 May 2023 01:50:21 +0000
References: <20230407183148.23231-1-frank.li@vivo.com>
In-Reply-To: <20230407183148.23231-1-frank.li@vivo.com>
To: Yangtao Li <frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sat, 8 Apr 2023 02:31:47 +0800 you wrote:
 > Commit 3fde13f817e2 ("f2fs: compress: support compress level") > forgot
 to do basic compress level check, let's add it. > > Signed-off-by: Yangtao
 Li <fr [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pzSmh-00Bluo-Tl
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add sanity compress level check for
 compressed file
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
Cc: jaegeuk@kernel.org, terrelln@fb.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sat,  8 Apr 2023 02:31:47 +0800 you wrote:
> Commit 3fde13f817e2 ("f2fs: compress: support compress level")
> forgot to do basic compress level check, let's add it.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/inode.c | 106 +++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 77 insertions(+), 29 deletions(-)

Here is the summary with links:
  - [f2fs-dev,v3] f2fs: add sanity compress level check for compressed file
    https://git.kernel.org/jaegeuk/f2fs/c/8328548780c7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
