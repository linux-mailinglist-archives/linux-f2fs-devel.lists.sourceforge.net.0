Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 338AFBBED43
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Oct 2025 19:38:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+9f+b2b6/y7ZFjvPn+Nq7BcHtTAoEvyR/n0/EeYoMhg=; b=mUeWEL7iOJlgnB7wBWcJqQugla
	wRDWseok4Gszdf2y7JUz0Ds0hJgaJQYtGICbWAWLQgXbHnvvR2CS4LBbh0vx0IVCxdJanzZ/FxO41
	MQr1rRZNu83xwiox9HQ5417TizhfllTT6DXIREALd47idBlTyReoaWv0YaNMCILkzKC4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v5pAU-0008Aw-Jn;
	Mon, 06 Oct 2025 17:38:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1v5pAS-0008Ae-Gw
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Oct 2025 17:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dbdIzSv1Tb3XUjr+9aZCrzUnid9wQF3FFHF+avzbypI=; b=YeArjW6KNW60UYfqrc/uWjJoRq
 U/17liFRb4KVv4sHmwXFZlntNozaMM5OEgpoYs6GHI/iUrNJ1+b8AxtQFStEwxK8Gyy+R2aMcUAL0
 TypkA9cFmQRh4PEVRohgxaiHLCLgQG5Fdi3pYIUzAP7jR1JYfX/gEzONqnu2L+V2lMbs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dbdIzSv1Tb3XUjr+9aZCrzUnid9wQF3FFHF+avzbypI=; b=h
 whBSNi61fWpEpUIeN6BoDei/wGX9b2O8tfitRy00DU4ONchCDUJBp/5ydt/tv6ni8015PEn6869Ei
 LHKQ/tuup0zX0jreBgJR7ucZ7XhM26KxxdFtdguZJnSKEifmSJ6RWGR99jwamV0uqv9cVusw9Co1D
 mWanEuIQQtJnTztQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v5pAS-0001fo-Nw for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Oct 2025 17:38:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 102A660329
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Oct 2025 17:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5611C4CEF5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Oct 2025 17:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759772310;
 bh=sCshs9JgyDpZRFNJXK1ir5GLyTFHfAztPZcqqyCy4Hs=;
 h=Subject:From:Date:To:From;
 b=hhZ9pvUW9Xl+eZkXog/975xOQJdiSHHlHwvhQIGkmr1itmvrEt9eVZDYBVkk7eDZ5
 HfJRS6sOFMg+1lF+eoaFHvXIQe9ewgrxT+aIUM0881x2hC9Wt66/tzrlOA0IP+Tkha
 0TEI2xvdgBecUegk6cel3MYbtn6s4LNWN6GKsXSapVwAewJlwpszU/UbAD4UAjbsgW
 Pz3O05KSfeU752nOVPj2Rxe8/QnOFB6hHrtTzjiaYguH2UpIyKU3hK1WWjCWWpyPo/
 /lgrY9FdpdGySRbRyyf7FkKjoF7PtM/TC3PQYCkrm2xTfTDSKaxUGqcpER6QWTmt/w
 WW0Q6fKmMLzmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 749AB39D0C1A for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Oct 2025 17:38:21 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175977229991.1449062.8002306020956826098.git-patchwork-summary@kernel.org>
Date: Mon, 06 Oct 2025 17:38:19 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,GIT,PULL] f2fs
 for 6.18-rc1 Submitter: Jaegeuk Kim <jaegeuk@kernel.org> Committer: Linus
 Torvalds <torvalds@linux-foundation.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/ [...] 
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
X-Headers-End: 1v5pAS-0001fo-Nw
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

Patch: [f2fs-dev,GIT,PULL] f2fs for 6.18-rc1
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1008341
  Lore link: https://lore.kernel.org/r/aOAOS864BmSwjfGm@google.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
