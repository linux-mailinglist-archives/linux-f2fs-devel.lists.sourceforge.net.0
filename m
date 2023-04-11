Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC826DE1BF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Apr 2023 19:00:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmHMB-0007An-C5;
	Tue, 11 Apr 2023 17:00:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pmHM9-0007Ae-VI
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 17:00:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hWGud0FFCjFE9h7nJTagZyc1kr5Qo8DXORDVTfEi2Cg=; b=NJBbExQMGQ/Ogk46mZULHYT2/g
 LVUMuzqs0GgIG1uErnkl47+SyvhF0fVaCFHkzrJF9d+HWJCx877gWASZgMSGl9G0vEIdN9wARp2W0
 0a2CKQe0Ti+pr4ownkdF5Qdo5Q8HurLFdiXS6GG4jchd5eeWUpG+aRy8Pc2RB3IHeBJs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hWGud0FFCjFE9h7nJTagZyc1kr5Qo8DXORDVTfEi2Cg=; b=f/VyFVam3OnFGLHyZCLhdzgs12
 LQClwt+NoWDXRus3Sz4Z3qbqRJ+QifKX0TK8RqlX7FjrdxR68IIEXFsxjmeKp1IzScqE3dOyvSblf
 8CZe6N6hQazQyBSfat/RXMXseG7FZI/GnFn9UPB3WrZwRvcLLzTKt+1LrD0HAvlZ+poI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmHM7-0005Cw-S7 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Apr 2023 17:00:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 26C15629B3;
 Tue, 11 Apr 2023 17:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0163BC433D2;
 Tue, 11 Apr 2023 17:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681232420;
 bh=AgbUHXxAqtch2A8ZK9s2UlYpUA1Fw453yyGXCQGJqk8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=MwmG6PpNvMwo/cgJhd7Pkd0lP4bYljwNmD5rtAWWCQGYHctG4JZMBBHTy9Kruy/jY
 WlhkP5OzLkdc0IIl3JdUWYKfCZJ2loIiovV6N1c7Kz9JVyW7D1cUr6CTcNVGhd+ZyR
 N2qc/UQtVtxH3NDlENIdS6tklvy3pksMXtxRai0mCjd/rAW7VXYEaxuAvn3SSTvGro
 rUFuf8AgZuYrC2DbKvi84A56ImqQGcTNbLnFKhD8iQpd3hZmcXF1I2YDFOoL0HunX2
 0jp9YYlTw6uLl/m2MLxp9fQHvuo18xU1YX1D4MWOl2Ews91OQy9mcQS/CuWu1Ft73c
 HvHRUezrENgJQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D71E3E52446; Tue, 11 Apr 2023 17:00:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168123241987.4928.2853902355953919510.git-patchwork-notify@kernel.org>
Date: Tue, 11 Apr 2023 17:00:19 +0000
References: <20230404032844.3596879-1-o451686892@gmail.com>
In-Reply-To: <20230404032844.3596879-1-o451686892@gmail.com>
To: Weizhao Ouyang <o451686892@gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 4 Apr 2023 11:28:44 +0800 you wrote:
 > Use common implementation of file type conversion helpers. > >
 Signed-off-by:
 Weizhao Ouyang <o451686892@gmail.com> > --- > fs/f2fs/dir.c | 39 +++-------
 [...] Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pmHM7-0005Cw-S7
Subject: Re: [f2fs-dev] [PATCH] f2fs: use common implementation of file type
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

On Tue,  4 Apr 2023 11:28:44 +0800 you wrote:
> Use common implementation of file type conversion helpers.
> 
> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
> ---
>  fs/f2fs/dir.c           | 39 +++------------------------------------
>  fs/f2fs/f2fs.h          |  1 -
>  fs/f2fs/inline.c        |  2 +-
>  include/linux/f2fs_fs.h | 15 ---------------
>  4 files changed, 4 insertions(+), 53 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: use common implementation of file type
    https://git.kernel.org/jaegeuk/f2fs/c/0c9f4521958f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
