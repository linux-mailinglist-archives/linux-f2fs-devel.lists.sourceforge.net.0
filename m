Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6414AAE58B1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jun 2025 02:40:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebHq9Ng4Aw30KowsvUXPgNxyluVvarCOqerLH3PC47M=; b=Houqn51UbQO4gqA7sa5wuqilcf
	WcpNwKH//Ho1C+sc1TFDHkHBSHbIf9is+19bsd8SBK7dg3in9qWyOuU68RmyOD4a88GvSRdDGZxFQ
	eBMQPDZEqJMvzSVj2xgJRVo1lCALZYBqMjPG3Fnq8pKiUIKPgmvAgAfqSTwSP9an9B3I=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uTriX-0005gb-CJ;
	Tue, 24 Jun 2025 00:40:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uTriH-0005gF-MN
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 00:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cca7dy6+doPZZXlfhi/nJ4Y5Tt8q+Xr5Hf9hvQKWY3E=; b=aG3AMukbqLzr139tQcSyZN/3aV
 rixMcsLCkoZU423+pNDOmLwTMr/ZiD436VYDVNUNZ4n16k2GtS2vCtRzNVc1LFgG9fskBpLYoBWxi
 M4R7tKGJOycl9qx5kWY4rGyVYq3ehxp+0Or4Q1QylyyU9ThwSIw80I3FBTY/cUlWi7t4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cca7dy6+doPZZXlfhi/nJ4Y5Tt8q+Xr5Hf9hvQKWY3E=; b=dCW3K/WT0yy8WpRQEwKXFN1CP8
 eIsnhCcs+VaxlxDt6cusBgNwFMEo9RptyZAEL2UtS6qxklF/HzrAhHcn6qen2VY8MCc9kNFjQRs5H
 ImnOSHkDFp5wNqDe7mf/OixvRWV0VT1ZC+wf5tgbPWt9Q/OldtlaEgIIHygM3ivmpO0c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uTriH-0006xy-7S for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 00:40:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 506945C06B6;
 Tue, 24 Jun 2025 00:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA3AC4CEED;
 Tue, 24 Jun 2025 00:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750725626;
 bh=e3rVs/o0fMu7m5NY/hFfYGBx06zdfmD7O3z/hZ4Omog=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=jOw47j8lkcUMJED6Asq+ovL4LDrLyngn3SYYSXIvRmYdeEnPUdnxQwV8hhzUo5j7D
 AbFyhqdMVn3qsmBqunASStoZi0pRRNN+skzS3wIJSynALZc+Fwj/0j1VUK+a7iS1Cj
 xKpto5GUHhJ2k6Xirs/nFF7TgpBL2l4Cl8VBGw8TdYqsoaWVqK/wI4qdL2AOsybke6
 Yqa3rB8+zSBmRFubhAkP0jsvC6lPoiebEHnAP95Y7ZQCZtduquXSx8xGH0vdJD7X38
 3hIXgmTGav10EpQhU2MoCnmZRC9bneCn0mVwMOuVQOpQj0TeKzPY5IibxG2yAePj6w
 FtqFivvcnb8dg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADDD439FEB7D; Tue, 24 Jun 2025 00:40:54 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175072565349.3346761.16728721043040341618.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jun 2025 00:40:53 +0000
References: <20250606184904.224811-1-daeho43@gmail.com>
In-Reply-To: <20250606184904.224811-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 6 Jun 2025 11:49:04 -0700 you wrote:
 > From: Daeho Jeong <daehojeong@google.com> > > one_time mode is only for
 background GC. So, we need to set it back to > false when foreground GC is
 enforc [...] 
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
X-Headers-End: 1uTriH-0006xy-7S
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: turn off one_time when forcibly set
 to foreground GC
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
Cc: daehojeong@google.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri,  6 Jun 2025 11:49:04 -0700 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> one_time mode is only for background GC. So, we need to set it back to
> false when foreground GC is enforced.
> 
> Fixes: 9748c2ddea4a ("f2fs: do FG_GC when GC boosting is required for zoned devices")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Reviewed-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: turn off one_time when forcibly set to foreground GC
    https://git.kernel.org/jaegeuk/f2fs/c/8142daf8a538

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
