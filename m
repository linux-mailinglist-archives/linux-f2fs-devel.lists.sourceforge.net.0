Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 816CDCA1BAD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 03 Dec 2025 22:53:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wr8C8hrr7FiAyBCzwZeCnxXyCiizJh6rBWmjBMNWzKI=; b=VcHM/AN8y+kmx4+uejhMiZG2QG
	nkc4m65n0y1ht7Uu7z2p4Nh5KhbrE/ApApXdRcqm3VPEMS6MKJdhZu88Y7GJxjLldd0MnYbytSeIN
	wuV+EEyOLNaAnI3ivD6rKFY/0mN0mZ0Xj/05qe/dHl+l1f+fXRQUKLr2I5LrMm3TZubA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQumh-0000Cy-5w;
	Wed, 03 Dec 2025 21:53:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vQumf-0000Cs-9K
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Dec 2025 21:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=08QPltQjjVweN7ZFDco1IWhSRigw67mEXxD2xucsKo0=; b=FqHR5mu+hEOkQU5qd2fZo4j5wW
 5UlV1S3YnJdHPyfIAJWTXvReBQeI3gYH1t8eXL+JeWgqrJwRI4WG9EHFItYwd4w6NC37H41iHZcpP
 z1mBNsoVlPqz0It9423CbToxVfgdaxyTuNNl+2oszVFKbrmRNr1o/C/EwJ0y/WTLYoZI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=08QPltQjjVweN7ZFDco1IWhSRigw67mEXxD2xucsKo0=; b=EfPXGxOVq57VcLeOj7nCg6Eu4h
 Ss6NLdVWe90JOZmByf9YttpIRASOX98/gYl8oNhGj7e49AqTaS0tsnQvROLRkJ7MFALiHhYKUYP9P
 uhXIyTNZWpeBEQ26xjnC9ksTFoQSNJX1BKwAMv7tsOZ9z3DbpdKfZw3KnFNhTgy6b7oU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQume-0007RQ-OW for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Dec 2025 21:53:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 180686017E;
 Wed,  3 Dec 2025 21:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BABF8C4CEF5;
 Wed,  3 Dec 2025 21:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764798786;
 bh=FFk0BICWZ0s9eg+EWRAL/A8moz5Z/8tPM+4OoOw4t0c=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=VeYW0UkyuCwbiBS6GRQIS4qLICBiVyT5vCPL9NSbIU2AsyhMfKJ0O6UOsBhbWt6Gy
 t7OG96Mx+yOrltCQyVBwsFqX+YaPUVrJ+vWUeSd+WVBPXhyAB9Hggez6ODy6dFYYui
 ZpaMIqHYB5Eiv2d9dM4l3tiqJxDj5tDxZNo23QAaoGlwyhvON5tTsqIKBIM+SYJAbL
 WpzHUkIUck112Sr4cYs5KtgpwZcOFe8HykPGjTzRMFJWOF8SMIVxOrnf6S6gAUF/L0
 53SEym27LIuvDbTfdtDbyEw2FZA2ECa7B7byH54yqXJ5EbCTxX5aWDGUhcWEpmAOnq
 yvG5vq/6EsOOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B59AA3AA9A81; Wed,  3 Dec 2025 21:50:06 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176479860568.93351.11152980224844433705.git-patchwork-notify@kernel.org>
Date: Wed, 03 Dec 2025 21:50:05 +0000
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
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 24 Nov 2025 15:48:00 -0800 you
 wrote: > Hi, > > __blkdev_issue_discard() only returns value 0, that makes
 post call > error checking code dead. This patch series revmoes this dead
 code at > al [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQume-0007RQ-OW
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
by Jaegeuk Kim <jaegeuk@kernel.org>:

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
    (no matching commit)
  - [f2fs-dev,V3,4/6] nvmet: ignore discard return value
    (no matching commit)
  - [f2fs-dev,V3,5/6] f2fs: ignore discard return value
    https://git.kernel.org/jaegeuk/f2fs/c/807e755c468a
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
