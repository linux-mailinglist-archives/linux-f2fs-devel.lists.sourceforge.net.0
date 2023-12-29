Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E93EA820121
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Dec 2023 20:10:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rJIFh-0007TO-Oc;
	Fri, 29 Dec 2023 19:10:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rJIFg-0007T8-Cz
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Dec 2023 19:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HXGDK7Wc9UlnlV2LXLy3jy8MEPPyzQY8R2a3l2/M63M=; b=j+V2LN6xKNFnEBLUKwpR2lAyNj
 XhzME9aaiLXpUaOqAvhNnLvPBtNaYflZn4GX8xAqTbyW5ahRh9abINBvu08psFg6tFhNAhh5UPjKs
 orMZVkDGAVPNDNngmENi/1lEdrgpMKEN078XifwaVtAf0JTFzbPMuWfm8YpWxsph+O3I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HXGDK7Wc9UlnlV2LXLy3jy8MEPPyzQY8R2a3l2/M63M=; b=K
 mC/z8g7K0M1wLHnrfU5Xg7xAPveF41Vm2qhjns1r1uSIMZJ4I2UNlIkJm1ciNuYkVmJoFjKWDJqeh
 jTEn5csXMeBXP3C5/P888tB8lavXtB7zCV7kwy0Q8/8QFJIzoNY+P1Zte+m4f41MhTiLR1cTi064y
 csHlem5klpsq/uU4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rJIFf-0005NO-Pw for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Dec 2023 19:10:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5A531611EC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 Dec 2023 19:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B482BC433C7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 Dec 2023 19:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703877024;
 bh=7W/uP2WB2+dwOZu2xeWvB7Je036LqJtiwXinzqfhCmo=;
 h=Subject:From:Date:To:From;
 b=XBJiGE+KSX9SGkIa2wRhYCZC4tptf1iDTsVx4ehfd1QN9+KD0UQZOMBpaCvJ3Xgps
 zAmXVuSp0doHK3pxyQ/yVgnDAov+8+QYRa4wkqcRhr68Z89g748rTPYCAqk1UVDTIe
 eoFlaAS1z89+YX4ZvTGHvRWpq8W7e41dxOBzmZrr1tMalmTq3N9kURCt6mCtMXaODn
 JNmUnwNk8V0nL2R5be/5OH/3Gn91GeTmAFrcDNmYVJJ/sfiaZ0hogUmhqbirH/7wXC
 nXRq4eCMcgFDW6A2WuXc7m0HFDdh3MaGOaI0jIcpRRfR1eeA3er22CJMxmqMspV0f2
 Hx4DMntmlLEoQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 974D8E333D5 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 Dec 2023 19:10:24 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170387702455.8173.13298946935811425671.git-patchwork-summary@kernel.org>
Date: Fri, 29 Dec 2023 19:10:24 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.8 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,1/2] f2fs:
 Constrain the modification range of dir_level in the sysfs Submitter: Yongpeng
 Yang <yangyongpeng1@oppo.com> Committer: Jaegeuk Kim <jaegeuk@kernel.org>
 Patchwork: https:/ [...] 
 Content analysis details:   (-7.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rJIFf-0005NO-Pw
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

Series: [f2fs-dev,1/2] f2fs: Constrain the modification range of dir_level in the sysfs
  Submitter: Yongpeng Yang <yangyongpeng1@oppo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=812369
  Lore link: https://lore.kernel.org/r/20231222032901.3861649-1-yangyongpeng1@oppo.com
    Patches: [f2fs-dev,1/2] f2fs: Constrain the modification range of dir_level in the sysfs
             [f2fs-dev,2/2] f2fs: Add error handling for negative returns from do_garbage_collect

Patch: [f2fs-dev,v2] f2fs: Use wait_event_freezable_timeout() for freezable kthread
  Submitter: Kevin Hao <haokexin@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=812034
  Lore link: https://lore.kernel.org/r/20231221064916.1930095-1-haokexin@gmail.com

Patch: [f2fs-dev,V5] f2fs: show more discard status by sysfs
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=811630
  Lore link: https://lore.kernel.org/r/1703037598-4359-1-git-send-email-zhiguo.niu@unisoc.com

Patch: [f2fs-dev,V2] f2fs: fix to check return value of f2fs_recover_xattr_data
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=809000
  Lore link: https://lore.kernel.org/r/1702347327-24181-1-git-send-email-zhiguo.niu@unisoc.com


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
