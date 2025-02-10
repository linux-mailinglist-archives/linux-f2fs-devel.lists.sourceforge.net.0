Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA26AA2F54D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Feb 2025 18:30:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1thXby-0002IR-HV;
	Mon, 10 Feb 2025 17:30:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1thXbx-0002IL-KV
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Feb 2025 17:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=df7Bd8c+xxcO28gA1Sy0Ien+NbOXdFHKkVjUImxlamc=; b=gkvZJe+gRA6aYMn7HGUAXWw6fS
 rBvTbyhMR6ESM6vKMnhpGvcnl6TRfXRp+cLPbbbWVmTGImw3bg7vfCil7T17L6PM6py//KzVyuajD
 kyvkee0PnY8y+q9Hzb8TN0V/MtcnjpoBfocijGAma+lxX3iKbDjE9r6vpKb+j5iD5+0c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=df7Bd8c+xxcO28gA1Sy0Ien+NbOXdFHKkVjUImxlamc=; b=B
 OpLDTXaQInf2aBI8y+B+Qn+VHfreGIDYU2QWNMmHUZJHnVPVpnvn6XSY++QbmPb/km6bSf2uAutl0
 IiQhfkOe9lyBm0+rX5pCIyyCNhc8aAvFOeT/5feoUpm2NRcgWIfSx+TpcDcqH2wPEXJZ8bTki5aD/
 3BSaTKcR/4jNzS80=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1thXbx-0005R0-If for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Feb 2025 17:30:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 925C75C5D61
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Feb 2025 17:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1D4C4CED1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Feb 2025 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739208610;
 bh=vFOmPIsqssQXSSfEZW4/6kEuhplr1Zrpmam2I5dRbew=;
 h=Subject:From:Date:To:From;
 b=ewBxUUy3pOk2QLOgVitscm+uuBVqizR6B8BfoQwBvki+qfGYnCvBR8gtzgZTHy8JB
 nnhCE+3wCBNbHsYE7jBfRthQ5g+9Iyn9YTc5vlP/Vm6VVwarGnOUGnhtYit2LF11aM
 8WRTdhtuMekNTd68gfxGN0xyXKSHeLQW67uFzAV55Je2OOuEL8qvmkgMMvV3tgPpU7
 iKf92YZTn7oEbnMrcSVgtx3gOlakx2MLUL7OOv2ZfPAVtLnIqh3C5tPUgAvqrt4Zht
 NQjRWwOerlxk/kj5kQ4Z3Bs47Q+OKCQk3lxH96dRe2lIZ7wuTny/KeH87SEwTo6TVd
 Y0fD8T0BC7ooQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADE3B380AA66 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Feb 2025 17:30:40 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173920863930.3835961.1474084273381530232.git-patchwork-summary@kernel.org>
Date: Mon, 10 Feb 2025 17:30:39 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: fix
 to return SHRINK_EMPTY if no objects to free Submitter: Zhiguo Niu
 <zhiguo.niu@unisoc.com>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.o [...] 
 Content analysis details:   (-6.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1thXbx-0005R0-If
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

Patch: [f2fs-dev] f2fs: fix to return SHRINK_EMPTY if no objects to free
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=932087
  Lore link: https://lore.kernel.org/r/1739150649-31850-1-git-send-email-zhiguo.niu@unisoc.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
