Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BB878B648
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Aug 2023 19:20:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qafun-0002pT-SG;
	Mon, 28 Aug 2023 17:20:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qafug-0002oz-LM
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 17:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AnXA39zltjJ5uIqVQ96kmXxKLM62AhCLJ0fPCAsGik8=; b=e0rKPxlAm/XEXVAvbeNZce1NlP
 SFM9IK6N9nkWCTUiPDwfQmvVvPdXBNi0LPSD+DKhyM9U19uYkY0Mg/HkxszfxyNn0+DpUkJJfQP3S
 bcsHxMECHiv/8pvUycWzVE28s58LGAK7hjzhYK4f3GAdMmFP7CFvlXZleKzN/mmoqDbY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AnXA39zltjJ5uIqVQ96kmXxKLM62AhCLJ0fPCAsGik8=; b=D
 GiG2VPbcSkNlycc1gJbUmtnIkU3iLk7zauDe2fK65jlV3Y1UJF51CCq9VOVhM+bG46phIbLNfUaQL
 REKWQaRpO5sjqSRHD9atad7bxWnSifUYPy5pGpiw8oy7eMJ5vfkjxUaeSe4+ofOX8KQL3UQxrEl11
 OITx85sFZAL05Nkk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qafuf-000y0B-01 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 17:20:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 69B2464E0F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Aug 2023 17:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0D1AC433C7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Aug 2023 17:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693243222;
 bh=6dCk5Pxkobqotw7SJeHBfxXdKdiHK11+hCuLHyEGDLs=;
 h=Subject:From:Date:To:From;
 b=doAyATT/VA4Sjnh6e2SMgarx9mRvElRI/ARLyZV1E3NE2NpQwshrBsFK/lgnWetQ3
 ZHGOs8WZLBB9JELY162EaGZyokejGkCxkFd5dfyIluMh3u6/bfRtcqGZO7iSu0hUwP
 U7idW0vehFmaEhRPlQFhPViek17ktMaQ+QjkrJ86MTWwclN7p4erVYTG4YsvAIHjkc
 I1U5U3NVpPs1tk1YaVBFWN8IGjdhqKmGC6jKit6SaAPcp7F8RrK/roIbKo8CAY7ioH
 v8SLEPtk0IgB5UqikLzxBn7LrJN1spy2gGnsUta9K2xzplj7w4i0nKzL3pon7MCDYM
 mAYslmN1BKWXg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 AD8C2C3274C for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Aug 2023 17:20:22 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169324322265.341.15397217536266413776.git-patchwork-summary@kernel.org>
Date: Mon, 28 Aug 2023 17:20:22 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: use
 finish zone command when closing a zone Submitter: Daeho Jeong
 <daeho43@gmail.com>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/proje [...] 
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
X-Headers-End: 1qafuf-000y0B-01
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

Patch: [f2fs-dev] f2fs: use finish zone command when closing a zone
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=779054
  Lore link: https://lore.kernel.org/r/20230824160832.3195155-1-daeho43@gmail.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
