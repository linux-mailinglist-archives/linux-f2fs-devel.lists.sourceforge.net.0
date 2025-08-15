Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5205BB283F6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 18:40:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ziIy1j7d9RWzt6NOi8V7Ar8/I+i+N0ZsR5we71ixO3Y=; b=lXFccu+AxkmTa+uqEn8kSQmBuF
	AswXq3YVkRdwyCszKB4qf/qK3Df+ShzzfGt7jCYke2WOYVOz5zF1wYhjlLtxECUgeN3GZ02o4k0br
	qyQZ2rJpHZ/4hnN/L58RMENBXTgypf8yNmqXtzCLvL2dPoeVc8xLOdNF/QGpLKwgJUng=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umxTS-0008AG-KG;
	Fri, 15 Aug 2025 16:40:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1umxTQ-0008A8-My
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Rgvz/O3EqEmSP35D3BjbWHBElrw5pnf3X1Lv0ytbHc=; b=OHa94N0ybCkK6IpHNlN8pXKtWJ
 4JHSYa9ck4NnoW4O3HxuvgcZnxROvBCo77fVFbo1gpHhU2WAPlqQ3ribJaBatuoQxFIwQhjMG8n7D
 oXS0rE8eW08yf8x1m/JP0nmhS8oZOAH1a5E9a/SaaYVaK6SAPPD/ANKOjk1tYii6LIZ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Rgvz/O3EqEmSP35D3BjbWHBElrw5pnf3X1Lv0ytbHc=; b=QGuuOUzGBkvMJrMW9SVi+s00jy
 /4ryqQ+5NpH6Ybeme0N1K3o+GqdgZLIuzg/tKJwZiEduAdi8EDZNQjY0OO3LGfGDxQlRzHZJFTc0I
 CPjC5QDsVDTCO9K+qOwEV7UbV6e9IURysifX0DbmJkRt83YJaLCmU3T/mGqYAJvmv1iM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umxTQ-00018K-4y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:40:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8D9B55C04C0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Aug 2025 16:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C741C4CEEB;
 Fri, 15 Aug 2025 16:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755276001;
 bh=43pPEENNXF3rrozebD8tpAprb8WYEupLBf5ph8opWWg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=SIPNUljsKH1bCp/QlnjtpndZH6dEgSkv50GyKZx+Ou+gZrOdIo2yUYWGbEY4UwvIu
 SkSEr58RHet+qHyD2auMBdRqwLbyxnFuaD43LezU7w7m/rt7AYlyRhNKLtgg3xAKFE
 n9u2J95ekvkqsE3r66Kv31tyGJZc0GyVfTzCsI+YKLC9Izl9IYA+wcles0ON02nuL3
 TCcG9/ki3/BUSIt9l/09IxpJYuIgnyOfHgH9KLbLjMfzsUjK7hw+QfqqXdxQOD+5Nv
 xp4JpvTqWWK2y58lP3CrN54dRU5yQC6sGYZ9jrlFWkVys3fpZuY1retttW2Vyw8+3w
 GAPSaTM3HbZEg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADB6F39D0C3D; Fri, 15 Aug 2025 16:40:13 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175527601249.1161945.287054981363094697.git-patchwork-notify@kernel.org>
Date: Fri, 15 Aug 2025 16:40:12 +0000
References: <20250807040026.3834543-1-chao@kernel.org>
In-Reply-To: <20250807040026.3834543-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 7 Aug 2025 12:00:25 +0800 you wrote:
 > During f2fs_enable_checkpoint() in remount(), if we flush a large > amount
 of dirty pages into slow device, it may take long time which > will block
 writ [...] 
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
X-Headers-End: 1umxTQ-00018K-4y
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: add timeout in
 f2fs_enable_checkpoint()
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

On Thu,  7 Aug 2025 12:00:25 +0800 you wrote:
> During f2fs_enable_checkpoint() in remount(), if we flush a large
> amount of dirty pages into slow device, it may take long time which
> will block write IO, let's add a timeout machanism during dirty
> pages flush to avoid long time block in f2fs_enable_checkpoint().
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: add timeout in f2fs_enable_checkpoint()
    https://git.kernel.org/jaegeuk/f2fs/c/da63f609094d
  - [f2fs-dev,2/2] f2fs: dump more information for f2fs_{enable, disable}_checkpoint()
    https://git.kernel.org/jaegeuk/f2fs/c/347ff7d828c0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
