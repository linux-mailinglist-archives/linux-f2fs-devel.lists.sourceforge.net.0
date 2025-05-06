Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D652FAACA08
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 May 2025 17:50:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+uZRxsor2euF7n2wuOXInshvuUkcKSP2TcgncAnbXMU=; b=TAln0UKI1FVSmU/+LcZyUYgh9x
	CerENHJc/3U4MkzHYKIOWh1IXCFzZRfyj8arSeqJ175xk56pBVBAp0AYmaKOaBNTf090Rsd203UeP
	nsHBzFxt6G+p8it8gIB0SDgP0ipQLQ7aCzAD1YsNsngS0T9WoSoMLlfDqM2/3mc0KmPw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCKYl-0000Mf-EF;
	Tue, 06 May 2025 15:50:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uCKYj-0000MW-5g
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 15:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=50y8aJkAXRA8AQnUYY/XRrRIAIPb8vFUzdySacQgf1E=; b=YdRx1ns+qxcNvTXVyZIUWWWdtw
 Ii3cYCLYXDiYOovEPC85LiSLOjnhS/ni6lJRlsieV1dESOyeHF77mtt1/0Rx/Wsh6DCZceiOMgH8t
 PNMUwj7Uv7uwzn/4oiqnwnnkETepDld3dRP9mDyuK3lOUPcxE2Xy0sECLAh8ly2SZd+k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=50y8aJkAXRA8AQnUYY/XRrRIAIPb8vFUzdySacQgf1E=; b=O
 6+rp+KxztVhJmkayToryGLaVEyOfb6uJQY6UOLdLI8L6WSMxttnbdQkbUpbMtsBb+MuyIUXvA1hfe
 MLg81LHgxkafvg3bSVfHOf90sMai+DXj5w9YYReDNnaMQK6tDObQmocyQcnvZknNj2xH2b3L4vU57
 RiEaN3FoORglKC6k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCKYS-0001jl-H0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 15:50:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D3D555C57D1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 May 2025 15:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B25ABC4CEE4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 May 2025 15:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746546588;
 bh=ufbKGia51Op1ZHk9gemX0pc4WNafEoQEBuUzCS0O2ZE=;
 h=Subject:From:Date:To:From;
 b=E6pRGf786a2e8j/8F1682I06nI8pupj188SHUuTUbq88Ne42m+BLhQd10cMSPWJ2x
 JKLs9Kh1IZt4fvzeLSVUTQAyWthdXft99F23nOkb0bYdsW7sGHc7tWYFyBVS69ERfM
 ysxdEWbolYgCFSDsdU9Zpv2XfPtaENYxvcnOnjiLp8Yfw0gDkf+f1b5Y8gt4fXCDUQ
 r+NHva+2E6aLcJKk38e4Ha9CK9uSA6CLdQiJWZ1k2rpbvlt0SSoHuJtli2x58XV+mo
 +YO+Y64cvr4ekulxi7malDlgaK0Qav1EnKR5Kb2Vfh8MunGhujs/9cW91hWTb4Rzw9
 /AKWTBATJpgSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EE6C4380CFD7 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 May 2025 15:50:28 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174654662740.1568197.17613397160563686013.git-patchwork-summary@kernel.org>
Date: Tue, 06 May 2025 15:50:27 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,v2,1/2] f2fs:
 sysfs: add encoding_flags entry Submitter: Chao Yu <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/lis [...] 
 Content analysis details:   (-5.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/, high
 trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCKYS-0001jl-H0
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

Patch: [f2fs-dev,v2,1/2] f2fs: sysfs: add encoding_flags entry
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=959910
  Lore link: https://lore.kernel.org/r/20250506074725.12315-1-chao@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
