Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E006D505C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Apr 2023 20:30:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjOwj-0002yK-2r;
	Mon, 03 Apr 2023 18:30:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pjOwi-0002yE-8P
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 18:30:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7s2XuA2VovwHc2CEBF6YFwU6lVq+baHEIYEw+Y4p5aY=; b=ZcBudEgrYyycsIKFq6WhfoxIZv
 8GUCKw3nJ8S8DlIJUKZ3jsNMIQ924dTqzqEAdu7umh07n1DnKIRsomRbFALCW2zrxAnY6pueVkL/c
 A1vgoYH+0/KhQviuyDz9wOKssXqFaowKuVOB5cie13cxE1MUSJm4XwDOZS45DD2URUD0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7s2XuA2VovwHc2CEBF6YFwU6lVq+baHEIYEw+Y4p5aY=; b=O
 FwmB1beE32T/LrZpqX36vKyRhG+kGZBQyWlhyLqaokveHyH1L5sTKL2ksAGHIqWFeVuha9Kute6AJ
 fTyr6xCn8HMIguiF/8YHJgqyDEFM6yxvmb159P6A7JOYPe8F6/0LbJuGW4BhjukT1v8jTug66n+RM
 4QyIG2HZjruIZdyE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjOwi-00DxvZ-KO for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 18:30:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F463619C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  3 Apr 2023 18:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A36CDC433D2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  3 Apr 2023 18:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680546618;
 bh=D1gJi9jWP7Ye2wa6ucZyHpYKFTPdKNTj0BOkCoSlMps=;
 h=Subject:From:Date:To:From;
 b=MLAl747522YVqckVcOIdorbt/l9KGd3y7nQXPZ5JBA/D8kQWMtxkDaqvhSzm7XpJ6
 sAJhVu+mEAI1WUZ/IGHBxRwHgYcQ2dYCmkuV9mhIyTNuBpq7oLXxXWePkWaJQbKONL
 +YRWwzYQw9ko1Ib0mwNOUSwme+Pof8iRjX4cJ+6pYLtOQF5BB5+m3ld8N7qCHXvVh3
 iUHEGZnE+b4SasYTog4S5uzTAB5kyOmYYlX3Sqcv9c4MauQnHFvOKvQ3aibJgG96PV
 Tnj0PuynoOoEq3LJonCcMFP1ZO9AQJcCSf2wRuCHSylEWJT69hfmK3KKZVOc+jvop8
 S855Hi8VD3PRg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8AB71C41670 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  3 Apr 2023 18:30:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168054661849.14597.10064714302438002085.git-patchwork-summary@kernel.org>
Date: Mon, 03 Apr 2023 18:30:18 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,1/2] f2fs:
 fix iostat lock protection Submitter: Bo Ye <bo.ye@mediatek.com> Committer:
 Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list/?ser [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjOwi-00DxvZ-KO
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Series: [f2fs-dev,1/2] f2fs: fix iostat lock protection
  Submitter: Bo Ye <bo.ye@mediatek.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=735769
  Lore link: https://lore.kernel.org/r/20230331092658.72386-1-bo.ye@mediatek.com
    Patches: [f2fs-dev,1/2] f2fs: fix iostat lock protection

Patch: [f2fs-dev,v2] f2fs: fix align check for npo2
  Submitter: Yohan Joung <jyh429@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=736130
  Lore link: https://lore.kernel.org/r/20230402031259.286-1-yohan.joung@sk.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
