Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DAECC0618
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Dec 2025 01:54:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pg8hsbwud/em66RMpQW/dfNH1nQd7kQxVw5h9nQbJ+c=; b=gN7hF1Nuu1xaTHM8iP6Q7S18Kf
	1+uArVDdUDyQcBnzUxN2iwG+R5JlolvMv42pq/ezT+lvN9+e9R4C/tcWuXc1kEnmG40yCa+KgaV7+
	iDNyPsPrvVZTEoTJDhMFh6XkrF7e6zSIxn1puFLemgk5r5R4jNZ2XtBdzrk/KLJS/MuE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vVJKH-0002CM-94;
	Tue, 16 Dec 2025 00:54:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vVJKG-0002CF-2c
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Dec 2025 00:54:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kEJavqY1mBEfdwv59R72G6zSa0yG9WCeejTYFd6hGT8=; b=ByI47nmIHhTDUNjoR4fOMJfQg9
 a7HjM8SFH0nCgw25fxP7hKmJv3eeZbmE98u3BQpTJgOFJd1tBj7AiHPitLfjkbZL9WqNEAP/yraS8
 lC3hRJW/G+0pT8bLYh4N/LPkCYvqiKLKrbt95Ut9VeBNx0v9T1jhIVJ0mmEmPySF3AcM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kEJavqY1mBEfdwv59R72G6zSa0yG9WCeejTYFd6hGT8=; b=iiEsR3qNtRq9Gtmsvda3lKs2k+
 DQVNCo0TZ2n+m3xShzdaAAYfiHNZl+K/e0GuaEt2gebL6FZKNgbpm8Gt5A9uVUS0vQj6lg9QUW9LI
 Vc3/ih557+cVi3xSurtCSd6pYBrCdzcz0s59MlUpkJGJPUmcvYNHaqC1NsmT006wBR4w=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vVJKG-0006mL-DM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Dec 2025 00:54:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2221F44158;
 Tue, 16 Dec 2025 00:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73A2C4CEF5;
 Tue, 16 Dec 2025 00:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765846434;
 bh=KVybdq2V+565NkdvIZa4ZXWTv3pqp1aoH6+zdj49hO8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=gZff/+3lrh30ypg/VcLwZ8dRm0LNcxTDJ/Mx1GXevfJSAU6NFwEpZdQTp2J6ONVPd
 +AdQwfUX76x71Y4SSX4BrmlVOasK87yGpCFZvB1HBuGm/PeH/V5Btry53nccgykKoy
 cKJIgtKxyNg36L/XJwFtJVik0BkDLCKZZsThmyoAh69+GI3eGTSaNGgT4AHRavSmvs
 e1OsiNZlUvbzr8wq30dL8qzKmfmUNRbLCypjy/Au26sc+kebX+Vx41y8he60N8SSKU
 WSgGgtuAnEq0r69RkNJjQF2xDDdsmEzO9kJeBl5zFdG0TBSXZiEjaJMFdUgIjABEwy
 snfQFZiawb5Hw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3B6D0380AAFA; Tue, 16 Dec 2025 00:50:46 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176584624503.387072.9496719293644511831.git-patchwork-notify@kernel.org>
Date: Tue, 16 Dec 2025 00:50:45 +0000
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
In-Reply-To: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Mikulas Patocka <mpatocka@redhat.com>: On Mon, 24 Nov 2025 15:48:00 -0800
 you wrote: > Hi, > > __blkdev_issue_discard() only returns value 0, that
 makes post call > error checking code dead. This patch series revmoes this
 dead code at > al [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vVJKG-0006mL-DM
Subject: Re: [f2fs-dev] [PATCH V3 0/6] block: ignore
 __blkdev_issue_discard() ret value
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
Cc: axboe@kernel.dk, dm-devel@lists.linux.dev, kch@nvidia.com, sagi@grimberg.me,
 linux-xfs@vger.kernel.org, linux-block@vger.kernel.org, cem@kernel.org,
 snitzer@kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-raid@vger.kernel.org, song@kernel.org, mpatocka@redhat.com,
 jaegeuk@kernel.org, bpf@vger.kernel.org, yukuai@fnnas.com, hch@lst.de,
 agk@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Mikulas Patocka <mpatocka@redhat.com>:

On Mon, 24 Nov 2025 15:48:00 -0800 you wrote:
> Hi,
> 
> __blkdev_issue_discard() only returns value 0, that makes post call
> error checking code dead. This patch series revmoes this dead code at
> all the call sites and adjust the callers.
> 
> Please note that it doesn't change the return type of the function from
> int to void in this series, it will be done once this series gets merged
> smoothly.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,V3,1/6] block: ignore discard return value
    (no matching commit)
  - [f2fs-dev,V3,2/6] md: ignore discard return value
    (no matching commit)
  - [f2fs-dev,V3,3/6] dm: ignore discard return value
    https://git.kernel.org/jaegeuk/f2fs/c/f4412c7d5a5a
  - [f2fs-dev,V3,4/6] nvmet: ignore discard return value
    (no matching commit)
  - [f2fs-dev,V3,5/6] f2fs: ignore discard return value
    (no matching commit)
  - [f2fs-dev,V3,6/6] xfs: ignore discard return value
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
