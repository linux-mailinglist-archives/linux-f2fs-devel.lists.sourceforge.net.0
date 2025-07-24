Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7DBB1125A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Jul 2025 22:30:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2prHgz285Izhui36Mr+CN8igR+hbniGzKMcGNKngWGY=; b=Tc4fbuVy4DXL/72aQIJX3CpCy3
	Dg84csdx9Ncb/cyCflt3n3Gai3LVxOZPClEsBe3t31vAQ2Gjiwtjh5NF+4m9p0k2K+7iA4TwXJbqK
	LhTvcbNqFURxsW+j0bPw5NY1A4pZpvLBtIpoLIRLTFKnw3QXNGYVl/67wb9px54t4lS4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uf2Zj-0004sT-01;
	Thu, 24 Jul 2025 20:29:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uf2Zh-0004sN-Jz
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 20:29:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gl7CpfTCd5GUeOfECgdW/iptUw00V+mu5W9FWr+AR9U=; b=DgwNjr47qJ/CT7ShmKr6uT3LFE
 QHm2nNIxSaW3yeGVmEdsh9qAxMAb16Ktkk4ouWB/fXBWv/KAxXYOSSiPKLazzODBs0dN5LVc3o1i3
 MpapoZaUDeg5A7UWdzD1gLn8pkwVReC57oQbeRY+xwn/Ej66U5Iii8M6eau0ZWtNXJ2E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gl7CpfTCd5GUeOfECgdW/iptUw00V+mu5W9FWr+AR9U=; b=SvhkUHCCHtoEws4DqLXCNiL9A7
 2aZjehMCcRAtImbDZajFVxqXuURVs3cmptfO2C99RCJcCJkbYWRZpbmFDQXRr7cAe7qMHFoY5HpeF
 kpLSxPSzmJDu2nlYYMZL77gBg4ZncrjahTHnocVETlDxsGTkA2CrBBWYZPXruP3JzJw8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uf2Zh-00011L-2k for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 20:29:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6B9CE6112C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Jul 2025 20:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E76C4CEF6;
 Thu, 24 Jul 2025 20:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753388991;
 bh=8omJxnDmdLt4PCSaTRYHGUJhtLkmAWmpNQRwr/jaSUk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=rH4563OUE1trZPVxlHrlpmqT0BnZY1P5WVADs/cjCaCSKUb9fjC1k2UXVTt0+ZPjn
 5lA25Phj8YS6Vw1ka0zF4+dk0xn8+BAmzwMoE4ioZwLQgPtgEdp+PvJ+lBkNoZcZKP
 y0qNYOGROWQB3hCzMhKsmlS4Kpe5m+llPiZDKI6YDe/Ym059fUFhMVhJzSe5diXXD+
 bqs/Y9JGtNawPjB2LZubkW6KneyHbKfyXXKx6BvdD/P5AwEwb28bdQcQLgtbPLNBje
 44/tbEP6jiy80wGLj015yAZ1JZcBmLR9G/jtfgFMIbxF620XIkjqSH0QrTCOQAkAuC
 +oDZHpdvDcjrw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33AD5383BF4E; Thu, 24 Jul 2025 20:30:10 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175338900874.2519964.9616561185237270230.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jul 2025 20:30:08 +0000
References: <20250721020231.2482090-1-chao@kernel.org>
In-Reply-To: <20250721020231.2482090-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 21 Jul 2025 10:02:31 +0800 you
 wrote: > Commit 0638a3197c19 ("f2fs: avoid unused block when dio write in
 LFS > mode") has fixed unused block issue for dio write in lfs mode. > >
 However, f2fs_ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uf2Zh-00011L-2k
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't break allocation when crossing
 contiguous sections
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

On Mon, 21 Jul 2025 10:02:31 +0800 you wrote:
> Commit 0638a3197c19 ("f2fs: avoid unused block when dio write in LFS
> mode") has fixed unused block issue for dio write in lfs mode.
> 
> However, f2fs_map_blocks() may break and return smaller extent when
> last allocated block locates in the end of section, even allocator
> can allocate contiguous blocks across sections.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: don't break allocation when crossing contiguous sections
    https://git.kernel.org/jaegeuk/f2fs/c/f0a7adfedcc8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
