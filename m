Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 645757171DB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 01:40:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q48xF-0006Qp-BG;
	Tue, 30 May 2023 23:40:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1q48xD-0006Qe-JE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 23:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kkbMLyRXFa8/4+5blywO5UgiOnSsjfXrJfoN65d7sHI=; b=f5J7uznmtzedtYWl1XGOnvo3q2
 t9uokeHVHK49yDW1dNjo1jiSmrEqAnT+kmRgLh3kqMowJvMMj/m4/8eRfPjeUL0BOhdpbS8H0ZrKw
 Yam94DOCiMYcunLVPhtXneE/6AdYCIonfhAE4hOy706xQilDc7AQ5bCohA+FlbLN1ev4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kkbMLyRXFa8/4+5blywO5UgiOnSsjfXrJfoN65d7sHI=; b=C5bFrHu5VwxqsA+bnBkQhStkTR
 lSsvjMHCyUfIXmyQE0OK3cVmLm4/YHxsB5s9F/8aPy+pokhJN4dntgEw28rVPbRx4+sP2zmYk159S
 g6AsNxQ6qHjsaJVBnSdhfAWsXL5cdUjr/zAWEtviDdVjyeUidr9ZdU2CqZ/7qocvqe/I=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q48xD-0000Nh-S1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 23:40:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 726CA63553
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 May 2023 23:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60E50C433B4;
 Tue, 30 May 2023 23:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685490024;
 bh=JUb5V6kUM0gHtoz2x7OrWhtRLti1YDyfG3Z2xfxVIT8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XUhL7fxY7nS/+bDHkU9GjXgiFAamwjgoOKf1Ztm8Miis7BJ/Zk0rQbIbrkjPXkTi+
 imSx0NIp2uF+Y0vrir4JYiW0eZmipNzRMm9EgaAQSUgecwqnC1i2UpkiE61Jt0WRac
 Q4QBWfV9bUmbHlGISZL9+kNj7hwbefXMsYl0pOrFuWg0UulpsN1ETzaDqIdlaVAVhY
 pBtIWJc0kjkd834wgRZQ96H2l7h2J8L4tnli1dX6ybAGR7b2fPwQMsdaLJY/X0A74e
 ULC7B9gstPjhihIcAaVC+l+lMcoOyETKJyyQaRdw9CGpAnK4oFMlLYxno5F1XBb6/O
 PP4pzmBuGVkag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 407E7E4D022; Tue, 30 May 2023 23:40:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168549002425.8773.15836981117739675166.git-patchwork-notify@kernel.org>
Date: Tue, 30 May 2023 23:40:24 +0000
References: <20230527001539.3608665-1-chao@kernel.org>
In-Reply-To: <20230527001539.3608665-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Sat, 27 May 2023 08:15:39 +0800 you
 wrote: > We should set noatime bit for quota files, since no one cares about
 > atime of quota file, and we should set immutalbe bit as well, due to >
 nobody shou [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q48xD-0000Nh-S1
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to set noatime and immutable
 flag for quota file
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

On Sat, 27 May 2023 08:15:39 +0800 you wrote:
> We should set noatime bit for quota files, since no one cares about
> atime of quota file, and we should set immutalbe bit as well, due to
> nobody should write to the file through exported interfaces.
> 
> Meanwhile this patch use inode_lock to avoid race condition during
> inode->i_flags, f2fs_inode->i_flags update.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3] f2fs: fix to set noatime and immutable flag for quota file
    https://git.kernel.org/jaegeuk/f2fs/c/cd2a3af38096

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
