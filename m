Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AA087A0C8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Mar 2024 02:30:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rkDSG-0000BT-3O;
	Wed, 13 Mar 2024 01:30:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rkDSE-0000BN-6j
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 01:30:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sET0NEd3vQvLko2wPQxycnG6nT6piEnZT03a2fTAE4c=; b=lrBeoGcHmSOoT4THIbY9Z26W4F
 RgGRg4/4Wv6tMKSwMzwpn8fxOhAJYQO+LTRSEK6Gd2Rhy8DUAbGMKufAKNxEwNpEPFVxyi2Jlwq7F
 zoizgztaJ9pruFt5e7g83sKKncW469nd1Uy/IV+BUJ9w54h8YtKQm0YpTJ30gzjGPQFM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sET0NEd3vQvLko2wPQxycnG6nT6piEnZT03a2fTAE4c=; b=X74rrYYsj2BC9BMu++oIBDmVr4
 eVT3VwdK8GmoCN9S/6upQd3nziYKlRh5lJU0NKomspq8X3oUNOkVD0mrJ77779OvQUklfHBmOHeED
 LrMOFT0hy8JUmt592t0i9rZi4AuTp5I6wfv5pYkzCY++GTr5OsgqNMCxcd5jiHlTp6Qo=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rkDS1-00023z-DN for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 01:30:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B070DCE1A05;
 Wed, 13 Mar 2024 01:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 282A6C433B1;
 Wed, 13 Mar 2024 01:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710293430;
 bh=6JRE1NMP92r9jyzept6E2/RoqBDzcqGI8JbPwPSrY1o=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=g5ymEmdVMHEV+tgD0Wu3lZYXbBAzie4o5P+8jY8fOF1M0MQbN5JKf24N5F2//bz+r
 FBs2kxfVsY21bPcwla5XL8xLT0qwERK4L8DrqNc+6h2oCqhtFN7Adj9yW/v40w29eO
 W5qYqwYMYqTNoYYcxe2RBj9M+1lEVP5WoTq/Mzxlcy+c3thiAtsNz2S7s7Hlict5at
 1pdeuqU7ue6P+8SFYqn3ytahzzD9cM7XGhwtgRCOJ17RAlzQxhVMot8/uFJeuFBagw
 YCf86J+AMjkR5nJRI3aIu6ppK841ffxUNXJXqvkVFuSwM/RVi/2C85o4keeV65gYn5
 7Vm+zdWI2AOWw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 04B70D84BAF; Wed, 13 Mar 2024 01:30:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171029343001.17296.13667262889763299275.git-patchwork-notify@kernel.org>
Date: Wed, 13 Mar 2024 01:30:30 +0000
References: <1710143334-27653-1-git-send-email-zhiguo.niu@unisoc.com>
In-Reply-To: <1710143334-27653-1-git-send-email-zhiguo.niu@unisoc.com>
To: Zhiguo Niu <zhiguo.niu@unisoc.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 11 Mar 2024 15:48:54 +0800 you
 wrote: > {new, change}_curseg() may return error in some special cases, > error
 handling should be did in their callers, and this will also > facilitate
 subsequen [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rkDS1-00023z-DN
Subject: Re: [f2fs-dev] [PATCH V2 2/2] f2fs: fix to handle error paths of
 {new, change}_curseg()
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

On Mon, 11 Mar 2024 15:48:54 +0800 you wrote:
> {new,change}_curseg() may return error in some special cases,
> error handling should be did in their callers, and this will also
> facilitate subsequent error path expansion in {new,change}_curseg().
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,V2,2/2] f2fs: fix to handle error paths of {new, change}_curseg()
    https://git.kernel.org/jaegeuk/f2fs/c/245930617c9b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
