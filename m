Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F412B16554
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Jul 2025 19:20:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N4mPS8J8PY3seFgsJGfnfPJXuY4VTZHWsntwypUTJpI=; b=IcNJtJrdPN+JQ86n9Gu5Rsmleu
	M5XHB5rzVec+ZzZZqVSXU4kq+Zxnx6KkkzVR1unS6tvBciiM7qGcMpStN4KfRm2w2M9WPQIziy8co
	6yB1RyWTdH86ywqxMRPl64Pa5zAOw6bQFKHC/AUm9RJAUWvZdEu0kYTR6gDWw73sxRQQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uhATT-0003Fr-Ir;
	Wed, 30 Jul 2025 17:20:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uhATA-0003EX-AG
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Jul 2025 17:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U+R+kE7GDha7oBTKSjXAEEgNxbPtW+zrOlt+EWR1nB4=; b=AyM3W4OeMwdxAJHrUSfuqbk9Ys
 P3LiCq09GP9DhRuRtP5dSzH8ZiTT3Viem8sQ6fN6VOG2LCadCniWxRBPyPIePlk7O8zD7A/u/qOaO
 YAeWJUMzTCENhwdagkQUWMqUXaTSBlMKyHmvY7TroFKgCnAlpUbZGMJ4nzTmPSfo/fEo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=U+R+kE7GDha7oBTKSjXAEEgNxbPtW+zrOlt+EWR1nB4=; b=D
 Pf/Rox41G1n/bqLAhRFXuvD7ax+CB9xR4gH16VjNV7A/D6iDmYYXSlbswghvM+uZh7eceoK6qkc8o
 XAoq0c1Z0WFbcjXF6U9Z+GX6XdGMBgq2pXEpzunrTl3ecUkLb1jH2ao4LUPiy+yUJzMWJhBZ9+0O1
 O8/e2gS5RnRa44tc=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uhAT9-0001be-Mc for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Jul 2025 17:20:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 10131A55367
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 30 Jul 2025 17:19:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE74C4CEE3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 30 Jul 2025 17:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753895988;
 bh=4Odq2tatseyFGlfuopV8m2xgWpfXvL4681iGhL4Pe9o=;
 h=Subject:From:Date:To:From;
 b=MOBjpd8IAf2QABwBpuO7ISdWi/NS2wZD0ccAYX6+LLba1arC9WW8t9L4BnlhJJDzn
 2UQ5q4ZMJ0Gam9N03VkHJxNE1JjLKDULPc0rQ35V+bSc8USXyo1EzwOdzkJrzoybo5
 Z/boINGGBddry6H4onIi1Z7RGBnDtxuyDyy6O7Buuiozc2Dt4Ls0G1InoAB2V+0LAx
 wlt7rH5xX7mVSGcnXhfaHVBKSPyWnlnsbz9lJPbmj7NhWulKHfBjDP7o1nyXBCXOsV
 lQwHTIgWTQ1IPyVLGUEdeihDdGNixOQr6HFxpAJCo3tu6dgCrOurzUFM8a5mmwwN0r
 H/BMt/Lcg5AGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B15A9383BF5F for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 30 Jul 2025 17:20:05 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175389600438.2380550.10114819066620754444.git-patchwork-summary@kernel.org>
Date: Wed, 30 Jul 2025 17:20:04 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: drop
 inode from the donation list when the last file is closed Submitter: Jaegeuk
 Kim <jaegeuk@kernel.org> Committer: Jaegeuk Kim <jaegeuk@kernel.org>
 Patchwork: https://patchw [...] 
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
X-Headers-End: 1uhAT9-0001be-Mc
Subject: [f2fs-dev] Patchwork summary for: f2fs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Patch: [f2fs-dev] f2fs: drop inode from the donation list when the last file is closed
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=986849
  Lore link: https://lore.kernel.org/r/20250729204719.1253285-1-jaegeuk@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
