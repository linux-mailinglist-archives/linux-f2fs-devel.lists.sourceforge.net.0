Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A475B283F4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 18:40:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2sCTHM+l+fCOZcJjUAF1hd+DlOuQbJ2f9Uiukzp4j0=; b=hM/ZGeKvJcM4UQlf+lmhevT6nb
	49vNEobvx+lW24OYVNfO6vuNOOzW2zW110X7CE88OiYvkx4K1ChQGICTlUWOKzc3q5AY+DujZw/Ky
	gdtVxWFWv4axGMxMT8+ye8cYeVbqiO3AXNV7X2BlweaVrWYR7tydr8fVAg0ptIurhSVk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umxTR-0002wr-22;
	Fri, 15 Aug 2025 16:40:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1umxTO-0002wZ-Lc
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=abtAWJJHGMCdglZYDaRjnj+ppbxISQ8Eq3MxujxAFn8=; b=eglUMJE9KhISbmRbonPR4bk1tI
 gDv0QlxVfvI/w6KVp0zOAs81PUYYjEbFPcv3UabAU46aoF3ASxgGt1LkrkfmuEdAxnI9Y7NzMS09A
 k4rV1Fpeyxb6j34k6CnViZCYq5N6ajWOIkmuCh1XsDOSGQCFCx180Pa3O6VdAG/au6Ww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=abtAWJJHGMCdglZYDaRjnj+ppbxISQ8Eq3MxujxAFn8=; b=R1iumk271KJ0RuL03lFShdn4lJ
 B0GLluraVR6z65UQSxk8JFmp1gsOOkbgsPfs4qQWVFJgDU6XKHqxCrsDSf2pcFkanKnR3aPEgrNjK
 Y3IW1ppJ+7/pLOfZypzL9dq//tjkaZR4oLdaoCWqWKBnExb0NVhDHsoP+5gKx5gxO66M=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umxTO-00018F-V8 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:40:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A825C46426;
 Fri, 15 Aug 2025 16:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88450C4CEEB;
 Fri, 15 Aug 2025 16:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755276000;
 bh=EeeFqZS4JJOHrZXRZU/ZngCmex+Ibm/qQWj1VUkvDbM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=PNzn9niGtpjSlMCPAdlOHPVYo2b1EIvGe6rpFljmPiZf2SatkqXwYRNdo5BSGbC1l
 NVLTjA4xOSC+L306eWyoV7CmUUX/u2mfxri64XcK2S7PPXXaNWv3dBijfYo8oD9bUH
 t+5e4NDcfLyYtX8wN8jXiBATS0JaLUpVQBUFpkMbfOD/r7Kymf+Zlk5X6Q4AEO/lTI
 xVnUQWAIuYVd9luuBgvim8UlwMXcOpj7mL/gzM6MSfFt2hFTe+LjizqnzczgXBOQFg
 G9kBhcwHa0XNZ8CZpfT6eGCFUGv3MpKZxiDJ6fD03L//l7kqQcOEPNl9Qmi4qxqzpU
 4hPUSeaCeDBGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70E5E39D0C3D; Fri, 15 Aug 2025 16:40:12 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175527601124.1161945.12842294818231800884.git-patchwork-notify@kernel.org>
Date: Fri, 15 Aug 2025 16:40:11 +0000
References: <20250805065228.1473089-1-chullee@google.com>
In-Reply-To: <20250805065228.1473089-1-chullee@google.com>
To: Daniel Lee <chullee@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 4 Aug 2025 23:52:26 -0700 you wrote:
 > For casefolded directories, f2fs may fall back to a linear search if >
 a hash-based lookup fails. This can cause severe performance > regressions.
 > > Wh [...] 
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
X-Headers-End: 1umxTO-00018F-V8
Subject: Re: [f2fs-dev] [PATCH v3 1/2] f2fs: add lookup_mode mount option
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

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  4 Aug 2025 23:52:26 -0700 you wrote:
> For casefolded directories, f2fs may fall back to a linear search if
> a hash-based lookup fails. This can cause severe performance
> regressions.
> 
> While this behavior can be controlled by userspace tools (e.g. mkfs,
> fsck) by setting an on-disk flag, a kernel-level solution is needed
> to guarantee the lookup behavior regardless of the on-disk state.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3,1/2] f2fs: add lookup_mode mount option
    https://git.kernel.org/jaegeuk/f2fs/c/632f0b6c3e32
  - [f2fs-dev,v3,2/2] f2fs: add sysfs entry for effective lookup mode
    https://git.kernel.org/jaegeuk/f2fs/c/1bd119da0b93

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
