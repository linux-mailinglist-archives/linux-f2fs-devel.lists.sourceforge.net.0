Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4719485FA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Aug 2024 01:31:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sb7AT-0000W2-W0;
	Mon, 05 Aug 2024 23:31:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sb7AP-0000Vc-JE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Aug 2024 23:31:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dy9QuluF+o3jhQNe3mFcXUjv/lILOpEDga8G08JNq0A=; b=CzgPc6+eDuZIVaaPdOgZjqJsKg
 lNza0S4MX+DJ4y9Z/W93JCy9WBa8AMxgdxYAsipb2NlsK9oySmHYwdf7OMrVwZMc0ElW8on0rYREl
 YZWhgraEvkTpC58Ediax1hp30FGLWeMHeMpcgagQrOibya9SseEFh+KMRHsk83vaIfUU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dy9QuluF+o3jhQNe3mFcXUjv/lILOpEDga8G08JNq0A=; b=FACxPuSJVFiND1Q693cB3UTNGl
 K2T+tJz3yFkGLWomNKbNjTOMXg6n3Dg83cUNvs1e3+wHZ5SfNTevgDiHE7c5nSrXRFXDOuZTtqrsL
 S+EJjSeTinjnJ4CMmOFHFG0YnYaod0Svy/fu50GNcdlWfGK9HkSX+dBrx6RUkXsk5wgQ=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sb7AO-0005AP-62 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Aug 2024 23:31:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7DB84CE0BBD;
 Mon,  5 Aug 2024 23:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6FB4C32782;
 Mon,  5 Aug 2024 23:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722900651;
 bh=XZu/dAdBq936VCRbQ1zsROdndqUrnt2ipH5NDKIX8UI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=L7fQYhmbHU0jhFtpX2GhMYMcfKdT0OhOBoZUHsGreOwNTOs+kujIbjJJ/E931y1v+
 D051J11daa8z/CubhN9LtiUTm8CjAWkU82d4CCjjCQxozO146sR1q+vTZ6fo6h2kFy
 n3fR/ppPGtiMDYBdWyUAMFI3qICR2qz42WxlKhzQptTP/r9SOoTjc5E5wbXUMnpCKp
 eqySmsW8/DQswLWVg99nEliezVAXH9/tQnNC6Q9p7u8PETcfriEYmwcOPiXX6173sU
 aLnMd2ufqJC8XAMSxCWty92nkzjDHSiAG3b01cOfBlGjpfEhQJ531l0G7R36Fgw1Dm
 aqxPhOs8EQ14w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 BFCD4C433E9; Mon,  5 Aug 2024 23:30:51 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <172290065178.2803.508763440418815514.git-patchwork-notify@kernel.org>
Date: Mon, 05 Aug 2024 23:30:51 +0000
References: <20240722023913.54788-1-sunjunchao2870@gmail.com>
In-Reply-To: <20240722023913.54788-1-sunjunchao2870@gmail.com>
To: Julian Sun <sunjunchao2870@gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sun, 21 Jul 2024 22:39:12 -0400 you
 wrote: > The macro on_f2fs_build_free_nids accepts a parameter nmi, > but
 it was not used, rather the variable nm_i was directly used, > which may be
 a local var [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sb7AO-0005AP-62
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: fix macro definition
 on_f2fs_build_free_nids
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Sun, 21 Jul 2024 22:39:12 -0400 you wrote:
> The macro on_f2fs_build_free_nids accepts a parameter nmi,
> but it was not used, rather the variable nm_i was directly used,
> which may be a local variable inside a function that calls the macros.
> 
> Signed-off-by: Julian Sun <sunjunchao2870@gmail.com>
> ---
>  fs/f2fs/node.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [f2fs-dev,v2,1/2] f2fs: fix macro definition on_f2fs_build_free_nids
    https://git.kernel.org/jaegeuk/f2fs/c/d1e1ff971d1a
  - [f2fs-dev,v2,2/2] f2fs: fix macro definition stat_inc_cp_count
    https://git.kernel.org/jaegeuk/f2fs/c/d72750e4a752

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
