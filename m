Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F97BAAB04
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Sep 2025 00:30:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lasA2aPCFAASJsHL9iq+Z0zqjKtMnuro95UI4Mj5KX0=; b=YcJMQKZ74OMyFd2+/1CM3tRUjy
	9IRC/55PdK7vpRLwdfX4Ej0MeUC3c81GurjcJph8Lb/VBd1+ccyVEFPkJXcK7PE8HdFrOGxsq29St
	vclfhFIOeoJVZny4ZfF1HPAIpc5eQrMMjwDMzIh7U2lPbKAWRNyyLC+tD/QZEfvaeGQg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3MOA-0007WM-UW;
	Mon, 29 Sep 2025 22:30:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1v3MO9-0007WF-7U
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 22:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ymEQ/OlfaoZFLsHMREXR3uL1Zzq63pdcfkNBhonRFD0=; b=QPSf5JCtVODv7O2ZqMgV5X42qg
 bcMlAAs6IxKgNkUZZBeD1DgtC8iQjXFHeX0Dsrt/CHv+WZieULWPajV+1qmXEk93gv8XiAUpZ9CQF
 +AIzv52OLn6VUg3jz4/W+f/3DLMpVN5Ldt3vxZ9+vlFC2FiQK+fgvBBW39IiVrtQ6fkw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ymEQ/OlfaoZFLsHMREXR3uL1Zzq63pdcfkNBhonRFD0=; b=DdaiXxyUbLCs0k3Gn/+r05tRbj
 gIoYR85KPZ5GYPnSvDxQG0JpNXMtXcrIoq1bmml/cuK21dNq5/rlxW/ky4bBriiz+5Pw/EELAsao6
 hWyZCnF1srG+Mi0kI7eXk0pwdfNBEP9ziI1XDd69UQJMIpNbbv/03wKyhpfVjJPmbW/0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3MO8-0005My-Kt for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 22:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1414E60256;
 Mon, 29 Sep 2025 22:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C4AC4CEF4;
 Mon, 29 Sep 2025 22:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759185026;
 bh=yKPgLINx6rQbQbu2rBfYvO4HKLsgtmUQUDYDyamD624=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=GzLyu33ZQkDQYV5tlnTGp1sB4o7Yp25+j4vZNGAxHUJapiXOZtl3p13xFDTzUmQ0O
 haSn93VvH5iREzOlZqKJOcesqeI0lNLLpVz9neREIhy4Iq2PYVc1WibUDUPbjS3c8x
 h3GjZgoqXY1XfSiBfaHbGHtMyrN7mc+pWTwqkPiQzFDZEH0DN04RIsAuiF9Vhyu2cJ
 0c+Gi2zMwNoQamvNvV+ZL23daFLHu1bB/GrHAt8vZPBBreTnYNrfmxTvNMaatUMySn
 wUMn1G3/Y2irwpeLCRUkV7vdo0c2Mx07lUDzlSQLdOvjfkESIbxtP+7nQU1Jufmo2C
 sflmkIsNs3UBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70B0439D0C1A; Mon, 29 Sep 2025 22:30:21 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175918502025.1733438.16761795407237847575.git-patchwork-notify@kernel.org>
Date: Mon, 29 Sep 2025 22:30:20 +0000
References: <20250901020416.2172182-1-chao@kernel.org>
In-Reply-To: <20250901020416.2172182-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 1 Sep 2025 10:04:15 +0800 you wrote:
 > It reports a bug from device w/ zufs: > > F2FS-fs (dm-64): Inconsistent
 segment (173822) type [1,
 0] in SSA and SIT > F2FS-fs (dm-64): Stopped filesystem [...] 
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
X-Headers-End: 1v3MO8-0005My-Kt
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid migrating empty section
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 daehojeong@google.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  1 Sep 2025 10:04:15 +0800 you wrote:
> It reports a bug from device w/ zufs:
> 
> F2FS-fs (dm-64): Inconsistent segment (173822) type [1, 0] in SSA and SIT
> F2FS-fs (dm-64): Stopped filesystem due to reason: 4
> 
> Thread A				Thread B
> - f2fs_expand_inode_data
>  - f2fs_allocate_pinning_section
>   - f2fs_gc_range
>    - do_garbage_collect w/ segno #x
> 					- writepage
> 					 - f2fs_allocate_data_block
> 					  - new_curseg
> 					   - allocate segno #x
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to avoid migrating empty section
    https://git.kernel.org/jaegeuk/f2fs/c/d625a2b08c08

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
