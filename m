Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F382A215D6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jan 2025 01:56:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tcwNC-0004DL-MX;
	Wed, 29 Jan 2025 00:56:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tcwN4-0004Cz-Nq
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Jan 2025 00:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hXRqZ1VfveiCnn35o7HLJurX4+K1Ri+isTuSXXyYOQY=; b=bOwKGsy30REtsmxm0xFGeqcsPv
 xhdgB4UPsXqpjdTN+TE3/8O18jVA2PweCG96l561h+U1nLsfz5YyPew7Z/QF5EMFT5QG26SvA8XG5
 4FfK4+IoQ0Vg43LGxr0Yk9dHKR6BXrjJk3KFQvfaqW7qP+j38BV5Gx4cAtIxo7NFjfz8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hXRqZ1VfveiCnn35o7HLJurX4+K1Ri+isTuSXXyYOQY=; b=FDqnnnSttjrtdEOjVJQjsaf+s6
 blNIESkCLR1bVyuWWJ0Vb++GMm/b4wiEBDFaUYpUkoZBv6SwmmVDlAKut6WWSyMN1P84iVG96qEp6
 dQFCcpv1VU0J5D7t5+pCUE15q6BkfHqOFfncRVG0gHyd806NWQfF8nDsPIQis5Aj+XEA=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tcwN3-0001Ln-IN for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Jan 2025 00:55:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EA6A1A41651;
 Wed, 29 Jan 2025 00:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDD9C4CEED;
 Wed, 29 Jan 2025 00:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738112146;
 bh=E7SMn7UwC8b0qGiERpygySgP6h2jvicUtzMHrC7lB0U=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=fZw6MReAikaXmK4YW7Llx9xS4AZREWDVf+VbEuhy7K5j/LpgE7j3g4mGnR9EHqExT
 V0kZiClE2/Vbh3TvYLRpqSSWW1gu1H4xZYWgX8ok3cSy+5oeP8OS4P1L3YkdfBA9nH
 QmO3dMtn+ImUdjs5yE7jAsKioOpnj7OtsoAvlgOUh1eKvjLqkuo0RE/gUANcWBubNN
 WsDioFefbuBTBmF2YtPx+AiF6qLab2nsgdzuYqQs725jBoJlg1Yj7w22IhNIVWNr01
 8Yl8tbvDUl+Ds6GwEYmfvCJrv2QlWKNl0DwRZkktsQH+OCBIoQSbbM9WZRjRsz9/Dh
 n7OhUFf4o8JtQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33C1B380AA66; Wed, 29 Jan 2025 00:56:13 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173811217199.3973351.14941578865039072034.git-patchwork-notify@kernel.org>
Date: Wed, 29 Jan 2025 00:56:11 +0000
References: <Z5hYrgYwNJuaPFF1@google.com>
In-Reply-To: <Z5hYrgYwNJuaPFF1@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This pull request was applied to jaegeuk/f2fs.git
 (dev)
 by Linus Torvalds <torvalds@linux-foundation.org>: On Tue, 28 Jan 2025 04:10:22
 +0000 you wrote: > Hi Linus, > > Could you please consider this pull request?
 > > Thanks, > > The following changes since commit
 40384c840ea1944d7c5a392e8975ed088ecf0b37: [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tcwN3-0001Ln-IN
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.14-rc1
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This pull request was applied to jaegeuk/f2fs.git (dev)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Tue, 28 Jan 2025 04:10:22 +0000 you wrote:
> Hi Linus,
> 
> Could you please consider this pull request?
> 
> Thanks,
> 
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,GIT,PULL] f2fs update for 6.14-rc1
    https://git.kernel.org/jaegeuk/f2fs/c/6d61a53dd6f5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
