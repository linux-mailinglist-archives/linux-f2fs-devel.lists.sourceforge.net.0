Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D458A436E
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Apr 2024 17:33:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rw1qw-0004qp-Jx;
	Sun, 14 Apr 2024 15:33:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rw1qt-0004qQ-88
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CVWIbJ7Tq8Sbv0yHIjvATF5l4cOO/DJYDLESAN5b7Fk=; b=cRjnVNt8K7umS4ky4nC/Mx8J4C
 frAIcG5piOpgtaqiYn+BtYyBphwONVpr7xePas8nVtHatR7xwyUt9qPfSySM4r4eWaQXa89AjF3Jr
 tfo9q6QpdjMjvSAhdHWhgPiqlB8Cbd/DH2f9q/WfA9d6ZtFud3LHiFoU14cS3KaMIS3k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CVWIbJ7Tq8Sbv0yHIjvATF5l4cOO/DJYDLESAN5b7Fk=; b=icy1o4R8bOeRSkXAcPjl0uaUtv
 nNbXXZoeRsQQUNxcsEipwoihWG3rMqkiPKXIr9Dz/DiuYj8UvdIwoSNM2cUWEFjO39xsgy9DxBg8z
 gzobQTuOYshxrmjcBvpmxZoiJPo86HgfheZrxGc9azsZhxQ/K9yFCNXepwsnLioNziMg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rw1qs-0003YH-N3 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Apr 2024 15:33:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 88E6C60B96;
 Sun, 14 Apr 2024 15:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9046BC4AF52;
 Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713108765;
 bh=eOD+pY6Oui9HSbYxTAiv8AlRymab8T1LAk021Ri9JVc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hl4xc13I1oNk1LM6SH1ng1DYnSoZu2/jOkoLxW/x2pw0NzzJHh4V0L+Q+O222gLaq
 5mReJl5UW4x4D2j78i9H6RiG+qjc8nOtijf27eEbt0xTB6nmRmlflhJJfhxn3bs9XA
 Sbv9YyQ4BE3xQiZcYWC6r+LQI7Xclic5o2aPeBpKzxI5I+YlT3PDTIChFlrjyaLSX4
 UObpiOj5RVkWSeHlkRVBMIH1RajfuG001ekledCroY8XUzf6ntt1vcwUNGAeR0X46d
 dXvogcOeW4IGCJpS/U+MupU2jtU6tGYgFROBkDx4jMzHy1fn/TVNjuqjucAX+w8tcn
 ccOP/JsupEdkg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 83D9BC32751; Sun, 14 Apr 2024 15:32:45 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171310876553.3156.14471633770093926825.git-patchwork-notify@kernel.org>
Date: Sun, 14 Apr 2024 15:32:45 +0000
References: <1710915736-31823-1-git-send-email-zhiguo.niu@unisoc.com>
In-Reply-To: <1710915736-31823-1-git-send-email-zhiguo.niu@unisoc.com>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 20 Mar 2024 14:22:16 +0800 you
 wrote: > some user behaviors requested filesystem operations, which > will
 cause filesystem not idle. > Meanwhile adjust some f2fs_update_time(REQ_TIME)
 position [...] 
 Content analysis details:   (-7.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rw1qs-0003YH-N3
Subject: Re: [f2fs-dev] [PATCH V3] f2fs: add REQ_TIME time update for some
 user behaviors
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 20 Mar 2024 14:22:16 +0800 you wrote:
> some user behaviors requested filesystem operations, which
> will cause filesystem not idle.
> Meanwhile adjust some f2fs_update_time(REQ_TIME) positions.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
> v3: modify some update conditions according to Chao's suggeestions
> v2: update patch according to Chao's suggestions
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,V3] f2fs: add REQ_TIME time update for some user behaviors
    https://git.kernel.org/jaegeuk/f2fs/c/fa18d87cb20f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
