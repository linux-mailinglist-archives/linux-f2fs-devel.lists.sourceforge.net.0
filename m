Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 587ED6A501F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Feb 2023 01:25:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pWnoL-0004E4-QK;
	Tue, 28 Feb 2023 00:25:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1pWnoK-0004Dx-Va
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Feb 2023 00:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MuaJGw1iu2r8jnlo0Lt1IJycYunoLe2uz+9lRC0Jz1w=; b=kTIzJIlybctzCxO28M6+cf9MxX
 761sVJvHB2du1PMcVuH0WglYHE9IxEggmG4CkLnOx0ngjLwGAXK0HLNEENaR8T0cHj8uh0X+K95do
 um/ND0voO1Z/rdT7C+5LS2xET8oXjATnuedyi/T3oHM+KN/eJErA64c1kffmutsGoISQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MuaJGw1iu2r8jnlo0Lt1IJycYunoLe2uz+9lRC0Jz1w=; b=IuqzsMJtcTh+rLa96Tb+tzQwWZ
 3wp8PLsWOLjVa0Wuu+POGX9u+u7lLgWTld39/niUYF41WvS02iY8shCsCxBMI1cdZz0qVzyyrbch8
 vyzP/uzhtfwasFBFnw0swLqq3YsnjXQUQmMF8tXpvBd1eQ7ADS5t9QrdTHjwsXVdZXVE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pWnoJ-00503F-P4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Feb 2023 00:25:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5EA8E60C4F;
 Tue, 28 Feb 2023 00:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8564C433EF;
 Tue, 28 Feb 2023 00:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677543933;
 bh=uqtNTePz6Sl/QcOVU1rzILaXe2O/AS0JXzjJgFAXFM4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=OkDu04Ewa6UP2wE/Yxk3Zld2i6tQ0Rx6Od6q1jH2KFEtYYmBW813DtFbzXjtzDVpi
 Y+AEZV20U7E5D5Q6716otGKgvPppIv88p8C22llARbGHsOzuLYiUR4DVr2rhx2dgB7
 aO2+VinT/JIYefQppDMm8m19k5zQFA57NbXXQgZ10fjiVJW9FNQ4MJI3iqSIqb0BL+
 OqlduHVB0Suq+6ZmQ1jY1Oh/6pAQUBjOY8fKwBl7mAs4bidOUHiYXcry7UaG85fSYS
 l2bDrBWtZNSCDGcm6j1DGuAdnxzP8DmEl8zGOtR6MHBKCAKpH2Pn9VFrwEMOlSxj+E
 gSo9y6RoyrmeA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 AF56AC41676; Tue, 28 Feb 2023 00:25:33 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <Y/004is4VtYI7G2u@google.com>
References: <Y/004is4VtYI7G2u@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Y/004is4VtYI7G2u@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.3-rc1
X-PR-Tracked-Commit-Id: ddf1eca4fc5a4038cb323306f51fbba34ce3f4d2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 103830683cfc8f43b15158b0a48014b6d6e83633
Message-Id: <167754393371.8193.15237019111319054864.pr-tracker-bot@kernel.org>
Date: Tue, 28 Feb 2023 00:25:33 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Mon, 27 Feb 2023 14:55:30 -0800:
 > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6.3-rc1 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/103830683cfc8f43b15158b0a48014b6d6e83633
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pWnoJ-00503F-P4
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.3-rc1
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Mon, 27 Feb 2023 14:55:30 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/103830683cfc8f43b15158b0a48014b6d6e83633

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
