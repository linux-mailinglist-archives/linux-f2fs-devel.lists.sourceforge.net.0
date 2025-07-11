Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1E3B0218F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Jul 2025 18:20:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAtIU+rc/dCtIBWIsj41YKLBkwDgONHQeQY0iE5qDLM=; b=cofxLmp7NPmabyrF2Ln1kMQ6ps
	5DU+i8JI+g0VebvY3Uv5HZtoZg40iEDKOBDgRSoov/D4F9h5ioZGoVszdJHiGd7R2YSEJBeNTC20l
	ZWH/mMTODLF2T4/R0i7B51m3+EKS+NURd8Hqh43ObaStf5h/2P4XRB3CJn53fZkBAsXw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uaGTq-0004a1-Bv;
	Fri, 11 Jul 2025 16:20:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uaGTp-0004Zv-7M
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 16:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UfPV5cfJtM+3/YeJbN8J2yKn/Ep9hqgDB6ezeWuSGVo=; b=U1De8whXINZ3xziVuoAqlzJ+iv
 t6S3NJ6H/7kHo3J01Xx1OBlJv3Hr5FYGHKN/2UfZfT12psAEcLm4P77rWKBfT1fofGXg8ngtPN4Ve
 9A63+xGlHp9OFEZ9krhd433Ph4ft/KyvirVzWc9p+bH/vYuzXQW/s0N+v/XERYU8brew=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UfPV5cfJtM+3/YeJbN8J2yKn/Ep9hqgDB6ezeWuSGVo=; b=kLw4f42Fnhosf24FTco+UIGD1y
 JV7BbWTf+QA+syoLHXVqk0Y1tKaYqMfaAE9M2Pf5vp8Lx8WOizdALhZxDRK4caheK0gyaStDLRx6z
 TtpYU2v9NxTmTDc6ugRha6TyLciZjwEpQMATUEjmd6+BYREEPP7bO+XhmB//W2RYBG28=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uaGTo-0005ro-6W for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 16:20:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E382844F18
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Jul 2025 16:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28F0C4CEED;
 Fri, 11 Jul 2025 16:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752250797;
 bh=1Cc4/JfdEwYxt9wDCzQswq8lMP1iCeM+kgPAm365koM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=RWNZcYEOQkKajxdfntCy4fNxtgO8cTjwrYtATtWgSn//qj5ZYENkJsJTn2yyWEOES
 8nxjJY2QYTCVVc2G9Ee1774aI6WTfEZ2oCKyb7QJOKh7eIG/Qt+QIwEpF+7gWQWx3K
 GdIbmI3PirIjSPEqKEf79U5bNmYY3RX/d+ehIe9EkrE0wcwqNfywMLkG7Hw7yuIHW+
 4iFfX6fsWogdGiqM9BCdlBrE4MZ8MpyDiYbYcPEm4IrdAQfkDaMSaXHpqHibchCOb4
 /SA+coo1TCIdF+7pXgUiY+FcYRqbK2oAa+0kGF9OwWtlls4xaMDD7gODXU0O/miemg
 Gg9Z7jkA02eJg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAFBB383B275; Fri, 11 Jul 2025 16:20:20 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175225081949.2325425.16515007956966725798.git-patchwork-notify@kernel.org>
Date: Fri, 11 Jul 2025 16:20:19 +0000
References: <20250711071450.207302-1-chao@kernel.org>
In-Reply-To: <20250711071450.207302-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 11 Jul 2025 15:14:50 +0800 you
 wrote: > - touch
 /mnt/f2fs/012345678901234567890123456789012345678901234567890123
 > - truncate -s $((1024*1024*1024)) \ >
 /mnt/f2fs/01234567890123456789012345678 [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uaGTo-0005ro-6W
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid out-of-boundary access in
 devs.path
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 11 Jul 2025 15:14:50 +0800 you wrote:
> - touch /mnt/f2fs/012345678901234567890123456789012345678901234567890123
> - truncate -s $((1024*1024*1024)) \
>   /mnt/f2fs/012345678901234567890123456789012345678901234567890123
> - touch /mnt/f2fs/file
> - truncate -s $((1024*1024*1024)) /mnt/f2fs/file
> - mkfs.f2fs /mnt/f2fs/012345678901234567890123456789012345678901234567890123 \
>   -c /mnt/f2fs/file
> - mount /mnt/f2fs/012345678901234567890123456789012345678901234567890123 \
>   /mnt/f2fs/loop
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to avoid out-of-boundary access in devs.path
    https://git.kernel.org/jaegeuk/f2fs/c/65eeef059d04

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
