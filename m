Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A68B482F4DA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jan 2024 20:02:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rPohl-0000dS-PE;
	Tue, 16 Jan 2024 19:02:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rPohi-0000dM-Tg
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 19:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pnJZvaGgxOYpvd+XF2v69bimJfecOxIiRACW2jwHVbI=; b=X1WPFFhQvYFhO5PpHvYCM4Vlux
 uE/erRi5pbSeQ0pLKeOpSXHW7acak3Vh+HeHHKf1pOttqSEMD7ipmLU5uXGEfbmgqMmAus8aXpUGO
 8x17WzrZOqUEWwQqGVoEQLFMao3XQ8ZRztgYaEoJ6+9r/srwNLjx9BM8ZzzaalumXAZ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pnJZvaGgxOYpvd+XF2v69bimJfecOxIiRACW2jwHVbI=; b=RBdsvCtCAXlqTPcCKWCUaFy7cy
 Y8ZMCF5jG1eH21VEOmZ7p3NpMDowU73WcwCeMbB+xAI4HkaLVF/ZQRh3iKsHRcnkx9N0/REEJuTaH
 6aeFQYSTRBayJGwE9LL/QLrR7zDMDSMPUfUtK15JvT1Rq8Ea+Pcci2YhjVw20jBjvnLY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rPohg-0000aq-Uu for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 19:02:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8F8AC61357;
 Tue, 16 Jan 2024 19:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0742FC43399;
 Tue, 16 Jan 2024 19:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705431739;
 bh=nALsHW0nNNJnXAJRWWBsEyVYTDQ9rQY/BR0V0vrFWNI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=t6PpYbQlUEiZuShVumRV8qr5Hb38KRxKM8Nz8OxFvaM5KGLNuU0BEDAgpzyaUO09+
 ukOszsK1sRpK1XM//w3GC5kfKuGl0UQ3ybI/WU7OVHrjyMw6S79dudEJL/7lwMoxVE
 MaW45AeZKZyvvN+a1+8NTrqL/nWxSFVsQr0jnz1BpSk7UjKbevsp71N3O9LCWG7m3t
 pzUOAgSBsK4JA99uA+7vUMG1u7LtjRjhnTnRiHGYPAtWkD76xOOdOJ2NgeQ6Dqr/lc
 I8eXqQA5ywl228EKmPt3WXpxPESlEG+uLbK4m+w1Fgg/vRujuSDI0H4hmVJ4m75Wiq
 cWkLE+n2N/KxA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 DEBD7D8C98B; Tue, 16 Jan 2024 19:02:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170543173890.30188.4422376381888328277.git-patchwork-notify@kernel.org>
Date: Tue, 16 Jan 2024 19:02:18 +0000
References: <ZaAzOgd3iWL0feTU@google.com>
In-Reply-To: <ZaAzOgd3iWL0feTU@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -7.0 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This pull request was applied to jaegeuk/f2fs.git
 (dev)
 by Linus Torvalds <torvalds@linux-foundation.org>: On Thu, 11 Jan 2024 10:28:10
 -0800 you wrote: > Hi Linus, > > Happy new year! > > Could you please consider
 this pull request? > > Thank you. > > [...] 
 Content analysis details:   (-7.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rPohg-0000aq-Uu
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.8-rc1
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
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This pull request was applied to jaegeuk/f2fs.git (dev)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Thu, 11 Jan 2024 10:28:10 -0800 you wrote:
> Hi Linus,
> 
> Happy new year!
> 
> Could you please consider this pull request?
> 
> Thank you.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,GIT,PULL] f2fs update for 6.8-rc1
    https://git.kernel.org/jaegeuk/f2fs/c/70d201a40823

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
