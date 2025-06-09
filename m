Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02377AD2832
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Jun 2025 22:56:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nJLMvpXtHbYIS7PHJpehCghGp566Ks/+bW+b2YhnmKw=; b=ReBMvuE7927F0wPICcZtPa48m1
	GSGi34cq6yT2rby2cGgAKr7BUOCNRCOdBRg855np3HdOZhILJtU3Jlty6qdwVCh9AmTMTyKp0ecID
	Pt16t3NPfFMkc2AK6CpPv9vKH9Z5+iYc8xjCEMsSRvGm62B4cwhB4PKiD7bJiB7lwjKI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uOjX7-0001HJ-Md;
	Mon, 09 Jun 2025 20:55:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uOjX5-0001HB-Sd
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jun 2025 20:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gf7R4qThNsWw8Ia+th1MTId3lrI7KSLHLbVs3zGmR2Q=; b=O1EamVOXG4fDyzgeNsxWM0qJ3k
 frmdpTPJjJDDwUo4BvDvC04ucOtVyQlaNy11m/92CoM2qwf376rOapYAHtGsjgqeC/6j7ILVXbYVM
 1eVZS1Pi+dP4aULnpPd8EgRpoQxxRdF4fAIYw8HyVdtRXJBu1T/rHMiicYAZotivyIK0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gf7R4qThNsWw8Ia+th1MTId3lrI7KSLHLbVs3zGmR2Q=; b=I
 RdKWz3789XiPKTcdwOmv3Bwc5d9UhVCUITEuDaOHC+HAg9ZsDuOE63EFgj+5+TKBcSlWHkRAaBQ5X
 RX5ouyVyuRr2fAdGjtH3GrCSnVCACu/KtZaD00IgNiqWhXsGYYCQTDNb7+K9JC8yzbiYb9NU3Vlm9
 CnDqD/jm2TD5dpIo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uOjX5-0004on-Bz for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jun 2025 20:55:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 392715C5475
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  9 Jun 2025 20:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96DB9C4CEEB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  9 Jun 2025 20:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749502545;
 bh=5pTB3SXLTKZUulfP56H3YvMM3NSAgo6i/98yBApr1L0=;
 h=Subject:From:Date:To:From;
 b=Xq1MZHYbk4q1aJ6VbB/zKAJV6nOIIyk4K5QaCEUlcwJHqoOKcfyQ3f+Fk/MOsEDki
 /wmIUfV4dggZeB6D4/LCMssTfIa79wBlmjlZxec57b3LReZjaQmZfDSjEfwYoca2Fd
 9IV4dv3GBjmhzNuanzS1Ve2XERYb3pzA+dc88yGm0yUIc9D6Y1S9JF8fjqtirl0dv9
 8GFS8RLIyC9RomD42cw/xEI9NcPM7sFwC04Fg0EiRUhKUFY3Tk59UbTxNt6cmeDLzv
 K+l41sWK+IazFd5hTfI5TtcaLZq9et56sPNFXB9PftfNZY5bmXcEJNeNPT6CtWWTI6
 1eYfqqIiGXwlA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70E303822D49 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  9 Jun 2025 20:56:17 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174950257616.1531626.15896441690327808019.git-patchwork-summary@kernel.org>
Date: Mon, 09 Jun 2025 20:56:16 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: None Submitter: Kairui
 Song <ryncsn@gmail.com> Committer: Andrew Morton <akpm@linux-foundation.org>
 Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=957518
 Lore link: https://l [...] 
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
X-Headers-End: 1uOjX5-0004on-Bz
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

Patch: None
  Submitter: Kairui Song <ryncsn@gmail.com>
  Committer: Andrew Morton <akpm@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=957518
  Lore link: https://lore.kernel.org/r/20250427185908.90450-4-ryncsn@gmail.com

Patch: None
  Submitter: Kairui Song <ryncsn@gmail.com>
  Committer: Andrew Morton <akpm@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=958093
  Lore link: https://lore.kernel.org/r/20250429114949.41124-4-ryncsn@gmail.com

Patch: None
  Submitter: Kairui Song <ryncsn@gmail.com>
  Committer: Andrew Morton <akpm@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=958611
  Lore link: https://lore.kernel.org/r/20250430181052.55698-4-ryncsn@gmail.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
