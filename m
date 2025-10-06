Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A98BBEDF5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Oct 2025 20:00:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nfeC/UM3JDPImDRy04a/pHo3VKW6b3b1p9NvOIds5As=; b=faGvSmjtDM9j73CwqoI9v5+ojV
	3zdrkGEk5mbkc8DqI8S3XCNJAZp7Q30Q5JvjTCX8eJ5roEGPIgWc1RIEEmHqlOAEZttC42bpbBdKo
	xVfKC6iOfwP6oKpFnSuZt0I2Yur4LdHv4m2gg4OMUkjz0YVluHVfJXarRpp1zatqoWkU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v5pVc-000077-2n;
	Mon, 06 Oct 2025 18:00:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1v5pVb-000070-7T
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Oct 2025 18:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U8IlWCBK0GomUutIvqwpGlD32JxND6XxT3V+uZP/GpM=; b=dtJYTJchmE5sHWRRBt+s3ngug8
 EP/zAHBSzTGm8tanoVEXv1MmjRJmKMPurgrX12iC+Hs8aXSXks5V/yX6tQTyqvrWDiPi+Qvqkg/3F
 9CqbeD8ZfcXKnKY8mapPBt/Ng+ExZvrawSi4dExQMVuATwb/Xpf7cJnMmNTYjZiUGEhw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=U8IlWCBK0GomUutIvqwpGlD32JxND6XxT3V+uZP/GpM=; b=Q
 HYviaimI9gDo4YCeL0lv1BfhaLRAohHal1GtTcp3gSU02LLy0ZzJ0ZNC2wDckmdfs4zhbomY5uT38
 MgH1hSMR3qq6PzWFZD4OU0ezW9ZS0NKJjR7iZSOLt5JecpdAHgtS+IvKnYbzFw+iGjVQz7oQ8ZUsi
 BmDsmVl73xCtOLKc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v5pVa-0002xG-MQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Oct 2025 18:00:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F2B71605A5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Oct 2025 18:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A39D5C4CEF5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Oct 2025 18:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759773615;
 bh=gm01d1ItuYNJwR6U2151OYbgEEi5uxamXSxwuf1kXXU=;
 h=Subject:From:Date:To:From;
 b=W6ji51QohpehtJZYeV2bKDKmfkpDWYkjCKyAqUeLHb+VI9M591dGTddmTaDnNyJO7
 YIIs1n/MDNSMYI5zGN2w7kYW0cIA326XZv/qPPBETPUHRmw96f7oZbQ5J1DUTPSg8e
 oheWNiKicTOK48amufGpt0UDFeFmT4+MStej7ogvD94RdxSV3cuF730oXUXQU/YYtC
 dRsuHZmBcD+zPD7nLP6GQzgNxxutZm7s4+D3XH4ChrobDDbnjbuWz+nvd8NPIMKVMB
 ABqIeMN24+NYDmGdNquOSky0mEEoxqGTJ2ZrU7yf/L9x9+dulo70SjB/gDHCFoKCQT
 ogPBs01r1Bq1A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 76BCF39D0C1A for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Oct 2025 18:00:06 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175977360500.1498132.5405844798778407587.git-patchwork-summary@kernel.org>
Date: Mon, 06 Oct 2025 18:00:05 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: don't
 call iput() from f2fs_drop_inode() Submitter: Mateusz Guzik
 <mjguzik@gmail.com>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/projec [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v5pVa-0002xG-MQ
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

Patch: [f2fs-dev] f2fs: don't call iput() from f2fs_drop_inode()
  Submitter: Mateusz Guzik <mjguzik@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1007527
  Lore link: https://lore.kernel.org/r/20250930232957.14361-1-mjguzik@gmail.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
