Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DE086BAFD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Feb 2024 23:50:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfSlD-0006Uj-In;
	Wed, 28 Feb 2024 22:50:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rfSlA-0006Ub-0w
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Feb 2024 22:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=reOPAB6KUDLX5/9XbojxOmDZPW5CdJ+aw8wDEMZtSvI=; b=cwy7lpjDIhs36uGsN9BHwLAKEk
 6xH/YNgFCfIxtQ6N0EUwmtLIDVlv4NH0NcZ7SIzSFRN0eqdqOLDGiLXnjFwPVnFRfWPF9lGMxLrZK
 9L/APN+xgJA8y+pbbPvRHFCQ0wvzsqQaQ/XNc4hG/bbPy1qqWmtktOfy/lfDGyR4rJnY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=reOPAB6KUDLX5/9XbojxOmDZPW5CdJ+aw8wDEMZtSvI=; b=Jq25b7yqmTpT52mBvg2XVb/eLT
 r3dtq3jCsHmVdHeAPcFd0fh1c6m9Mb7ZYhsNFgRDNtC0C24IN/iAPYStXqL32O4Uu6xWuODtDRg0G
 +8c+AsxaUQKDgHYtwQwgjWCWmTKUBbm1nl+had766T1VrgHI5NueBbKfVKlz8H86mfkA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rfSlA-0001hg-1C for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Feb 2024 22:50:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5B49BCE2316
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 Feb 2024 22:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AB46C43390;
 Wed, 28 Feb 2024 22:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709160631;
 bh=examtTGxF0eDbGWdJnoARMLc/WduLuup5xEbQ5qHBY8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=SR3qF4fPQpler/7MPquVmdcWZnMYumxsTm1FOE46EHgOjuZQym+SGKaif+4zRqEt2
 eSBciKpZvwbwuIh9rMXPHoEdE0vJ8HxKxg3r1FcwZB/pSBo7IUR1k9Bm7eRP45FIKV
 2asDOcrXyuSRSNKfibHkPK9GBax1u/RFsDgde10vwRe75WFyiIpK1Sowh1eIiJVYBz
 vpETTdtVXU/HuMBQneEkvWAA+/kiwZeRvCGK62Me9CkUL4Q6CgtkRu5ZWCrNFHXBTW
 QY376f66XMZhicA3IcSsxtwiKd9zbH8UacURRU0nnhBYNjCN1YGropCvZuyF2Egzyc
 DRI437fA3X2rw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 734DED84BC5; Wed, 28 Feb 2024 22:50:31 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170916063146.28690.11898550448489981752.git-patchwork-notify@kernel.org>
Date: Wed, 28 Feb 2024 22:50:31 +0000
References: <20240223205535.307307-1-jaegeuk@kernel.org>
In-Reply-To: <20240223205535.307307-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 23 Feb 2024 12:55:31 -0800 you
 wrote: > In cfd66bb715fd ("f2fs: fix deadloop in foreground GC"), we needed
 to check > the number of blocks in a section instead of the segment. > >
 In addtion, [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rfSlA-0001hg-1C
Subject: Re: [f2fs-dev] [PATCH 1/5] f2fs: check number of blocks in a
 current section
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 23 Feb 2024 12:55:31 -0800 you wrote:
> In cfd66bb715fd ("f2fs: fix deadloop in foreground GC"), we needed to check
> the number of blocks in a section instead of the segment.
> 
> In addtion, let's check the entire node sections when checking the avaiable
> node block space. It does not match one to one per temperature, but currently
> we don't have exact dirty page count per temperature. Hence, use a rough
> estimation.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/5] f2fs: check number of blocks in a current section
    (no matching commit)
  - [f2fs-dev,2/5] f2fs: fix write pointers all the time
    (no matching commit)
  - [f2fs-dev,3/5] f2fs: print zone status in string and some log
    (no matching commit)
  - [f2fs-dev,4/5] f2fs: prevent an f2fs_gc loop during disable_checkpoint
    https://git.kernel.org/jaegeuk/f2fs/c/496b655d0460
  - [f2fs-dev,5/5] f2fs: allow to mount if cap is 100
    https://git.kernel.org/jaegeuk/f2fs/c/38fcb47642ae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
