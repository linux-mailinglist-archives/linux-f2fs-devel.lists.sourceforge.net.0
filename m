Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 386456E1870
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Apr 2023 01:40:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pn6YK-0005WP-35;
	Thu, 13 Apr 2023 23:40:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pn6YI-0005WJ-Dm
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 23:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=glqStJUXLmueFpVBAnohcApilg/2IZlUBwTvegOurgY=; b=GpjSPOsuSMNwUxKRpNVQ/AFP15
 ZmLQJvN81vSpq1IEFRq2s5uIOfFiEBOuoNOGQpDmHtFiqPUaNqR9SGlKydV+jpAjwzK1dEX327gQU
 g+9HoP3GKjHOrFiP35KiuImaBeKAj2Qa+GgT9et9gS56sTZ1FuNLs3YCj2rjdXFujbTA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=glqStJUXLmueFpVBAnohcApilg/2IZlUBwTvegOurgY=; b=jRuDN6z7+ZZJ1pOWNC/1VfG+pv
 67JguHnNtXFb91XksPZhXfoiieC3rBGoVYPlYGHTgzXjv1v0TCE2gvD75qaHxhUBM6J1v2fIfgdNN
 aj1hSvNgHS8CbgF1sDnfM3ZRVQ103LnzppquQM8GVONZYk8jtJPAFIDpt+SrYwuX59vE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pn6YI-006zt6-NU for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 23:40:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 95D6664276;
 Thu, 13 Apr 2023 23:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DAA5BC4339B;
 Thu, 13 Apr 2023 23:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681429218;
 bh=fZPPuWKEzgHEeF7NvGfgflts7JxtanhschQS1SQZgaI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=immdKNSy5L0EeNxGFex4I8z+xe4JkKjf/8SxzKk96BMPdK3p754DTZayphFi8BWRq
 cooVbaShlMkuzkfo2fC+NaCqaQeMZKJulm0X6L/9B0gXH7+U3ezyyUHPXdCV1BBlos
 Hz27U5B0fFNHhrwK6dIa94GpD/BbVNy4f1/ijVDCJDqoh0G6QHH9R1V8qu6//L1GIl
 TcyRR22YrZ+YS6ImkVDaqda4eJJ3XmGJIp525toYWpFdzNylPTsi6js4QsAtoH0JXz
 YE21Qq8HSq2MQjy2T9CFZJpVM/h/4foIAAx3TnbyLnu0L1a/JaGS5QKPvaTRDJYc0T
 MIj9Kk7/WnXGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B3D48E5244F; Thu, 13 Apr 2023 23:40:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168142921873.31957.2801806079442088561.git-patchwork-notify@kernel.org>
Date: Thu, 13 Apr 2023 23:40:18 +0000
References: <20230413101711.13682-1-bo.wu@vivo.com>
In-Reply-To: <20230413101711.13682-1-bo.wu@vivo.com>
To: Wu Bo <bo.wu@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 13 Apr 2023 18:17:11 +0800 you
 wrote: > Wire up the iopoll method to the common implementation. > As f2fs
 use common dio infrastructure: > commit a1e09b03e6f5 ("f2fs: use iomap for
 direct I/O" [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pn6YI-006zt6-NU
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: support iopoll method
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
Cc: wubo.oduw@gmail.com, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 13 Apr 2023 18:17:11 +0800 you wrote:
> Wire up the iopoll method to the common implementation.
> As f2fs use common dio infrastructure:
> commit a1e09b03e6f5 ("f2fs: use iomap for direct I/O")
> 
> Signed-off-by: Wu Bo <bo.wu@vivo.com>
> ---
>  fs/f2fs/file.c | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [f2fs-dev,1/1] f2fs: support iopoll method
    https://git.kernel.org/jaegeuk/f2fs/c/50aa6f44e1da

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
