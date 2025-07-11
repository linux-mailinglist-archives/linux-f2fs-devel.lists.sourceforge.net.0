Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FD8B021CA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Jul 2025 18:30:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2Otg3vJPzNPdK+0XrtHklYZ2UC/TE0Rq7GbYL5malg=; b=Z4a8oU9pN39hlvp0TJMn2bhbkg
	iYH6h/xi9aHjH2rTUP2xDrQbWUsciSFzIlISw11citlzv0SoSIjvs8MPX2GjFqntRY/sVLBrnFXiT
	T86cISqlt3Q1+RYZAkhJQDRIgT1SsiIuzaF9m0A4NbQryHMt7Uj6y0CssQ1QtNUw4rpQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uaGdR-0005yL-Bz;
	Fri, 11 Jul 2025 16:30:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uaGdO-0005xN-32
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 16:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uc2vYbfV8ka4eLsVG+Wb0nlGRw8bJu8J8fb6CGV9PmA=; b=BbXtkxZAXWi7jbYTgsowLCV2mp
 gxwET+3ZBY2WYHinxv+smDb3EQ2Lo+X1SxC0Z1N/ENMStIAf4Ne12U/kqiPT1aLP4HfWFIMzyzihJ
 Uju9JH78LIb7r4VZL/tqMl/kfC6eH+YGHcmIZBDizquefS3/JmWoVimINMs8A9/xxo/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uc2vYbfV8ka4eLsVG+Wb0nlGRw8bJu8J8fb6CGV9PmA=; b=YqdyFIP5ajRaDMt9EtCSfe51ql
 /smAtpvlRLO+kfP0Bmwa/dQZEErkwcB93aPAXy/8NGkKMi49AJTHvb8ZYxVWBN2AHRUXwSO8iCD9a
 kkF3msxHkINsKE8eTffOwSFWPKs7GpR4DiogFDUWww6KzZg4pym+tdcAUqzhSyTz0wJg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uaGdK-0006UM-8I for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 16:29:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF7EE5C7216;
 Fri, 11 Jul 2025 16:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF05C4CEED;
 Fri, 11 Jul 2025 16:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752251387;
 bh=regUJwiUyUfYo9SilQRTdYXg8Yrk9zqB8WXtaKE8YEU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=I1QxiFWn8Cps9GA/XNKxP/Vak59hfxVvIy7HrTMBSg96o0eTN+IGm8yinCpyW8qmu
 OmKN4uYEHXZ5PmK126B24ZltGKkWVjRdqwNywTGJrfYfSqXy+4mJJkMfXdjDoEoCAc
 4GzM9to+Xz8Pim6m/z68jA5EVgIgiiGzB0nsxWXvHV24+XCRvLghDn9CBVagMzfMPb
 hCjH3LLs8BSzdhEZkLfqBZA8oaBZ/UpFgnreIMyfWQd4bxkCy32Qka+J9sLh2ZwAH3
 YzYbtZLlDHIvyfyL6Ofcf4B3DPoHIfm6WBa2QKjai6Mbu/JCsgUWMUWFrHiWw0LbUh
 PLpRaMD8kSBKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADD2C383B275; Fri, 11 Jul 2025 16:30:10 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175225140924.2328592.1750911075772737839.git-patchwork-notify@kernel.org>
Date: Fri, 11 Jul 2025 16:30:09 +0000
References: <20240814023912.3959299-1-lihongbo22@huawei.com>
In-Reply-To: <20240814023912.3959299-1-lihongbo22@huawei.com>
To: Hongbo Li <lihongbo22@huawei.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 14 Aug 2024 10:39:03 +0800 you
 wrote: > Since many filesystems have done the new mount API conversion, >
 we introduce the new mount API conversion in f2fs. > > The series can be
 applied on top [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uaGdK-0006UM-8I
Subject: Re: [f2fs-dev] [PATCH 0/9] f2fs: new mount API conversion
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
Cc: brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 lczerner@redhat.com, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 14 Aug 2024 10:39:03 +0800 you wrote:
> Since many filesystems have done the new mount API conversion,
> we introduce the new mount API conversion in f2fs.
> 
> The series can be applied on top of the current mainline tree
> and the work is based on the patches from Lukas Czerner (has
> done this in ext4[1]). His patch give me a lot of ideas.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/9] f2fs: Add fs parameter specifications for mount options
    (no matching commit)
  - [f2fs-dev,2/9] f2fs: move the option parser into handle_mount_opt
    (no matching commit)
  - [f2fs-dev,3/9] f2fs: move option validation into a separate helper
    (no matching commit)
  - [f2fs-dev,4/9] f2fs: Allow sbi to be NULL in f2fs_printk
    (no matching commit)
  - [f2fs-dev,5/9] f2fs: Add f2fs_fs_context to record the mount options
    (no matching commit)
  - [f2fs-dev,6/9] f2fs: separate the options parsing and options checking
    (no matching commit)
  - [f2fs-dev,7/9] f2fs: introduce fs_context_operation structure
    https://git.kernel.org/jaegeuk/f2fs/c/54e12a4e0209
  - [f2fs-dev,8/9] f2fs: switch to the new mount api
    (no matching commit)
  - [f2fs-dev,9/9] f2fs: remove unused structure and functions
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
