Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD2EAA40C1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Apr 2025 04:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fmEz4dg7dXgrUC/L0ZpGpKNS3CKJQ3bNMVDE787TMdU=; b=Q1SDQzQHC5t/6qhbBc+oabGyrX
	hZplTrj43aVeCvn9JsYnpYwokDd9N2dh9hSoYuvT3nzmKV8roOhUxTUWNnllqoBqzpLqvFFHhbMhP
	uBe4JewJRWp4qNjIO3cfjTfPkWYtRM3lj8It1ZOBXHjfu8Z+R9BMD9R7B33TarZMVnhM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u9wkB-0006tY-Hw;
	Wed, 30 Apr 2025 02:00:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1u9wkA-0006tP-6p
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Apr 2025 02:00:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bHDEN49Tl5v/e5cUb6j4UsX9OPjCq2IP4I/bcfYgUhY=; b=VszcJGORN06/GUIm1MFHgFFWl3
 ZR/VlA4nmop07MN44KoSonF+obroDC4TMronSTwmuVMQgQHDJPXWogj8JBNU0tJtbvZDsXk3pSvBG
 ikaYtn1xFwNTZ2rGI2XibIGfsDO6WUJGpPoOIr29J4XJ0t2R+3HD4T8XKa74cri77Y/k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bHDEN49Tl5v/e5cUb6j4UsX9OPjCq2IP4I/bcfYgUhY=; b=Q
 LdJBM+fzUCeJQj0/1RhltCTldjX5giTHgKUeowncvbUjxUNVAtxMJ3g8u+1GJqjA0azWpSogc7FGg
 VuAm/Q5uXbVia7YLnrvDQpLdI4Yci3kXvfGiRr28EfpB30Vb5wR0fLeMCvkN/lLDo+PVYoCIEjyWh
 c7HC0Kjz8Jye8DSE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u9wju-0004wS-IB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Apr 2025 02:00:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 12A425C4AA4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 30 Apr 2025 01:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3A5C4CEE3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 30 Apr 2025 01:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745978387;
 bh=3CtuIN7Q/glnf9DJ8+hWZbQjvfOmAummrxBcBPlnbDY=;
 h=Subject:From:Date:To:From;
 b=Bpd6vIeBqWoyMVasVgI5vS6BgelnjYejdoV3jP2MJ/oq2945ebV+aUTA61cjGHMVb
 SKIPWo1l0VvsXhQCUNqFdAACqcQAa13/raKPgUm8HpSdtFDM4DArw+bpCGUw+H4r61
 wdVATiRNUQQNJQF1UZkEqzaTmH15Dy2SqDUVSX7B1rZDdyk09na5S3z8JblhlKECTi
 WERucDREzmuDZ709I4EbMmRDxt2O70gxIumGTFIIby3N2HfGizrLqenIV/aUCjF5Mg
 fQ8WD9JhdHyZXyDR8LDKsFvN1Fm2sDUtK+sC3PxnA+uqbajs73xIzsOdv8igz+7rCF
 LasaakLC1U4zA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EEA4D3822D4E for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 30 Apr 2025 02:00:27 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174597842645.1861815.16136212020134458582.git-patchwork-summary@kernel.org>
Date: Wed, 30 Apr 2025 02:00:26 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: support
 FAULT_TIMEOUT Submitter: Chao Yu <chao@kernel.org> Committer: Jaegeuk Kim
 <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list/?series=956938
 [...] Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u9wju-0004wS-IB
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

Patch: [f2fs-dev] f2fs: support FAULT_TIMEOUT
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=956938
  Lore link: https://lore.kernel.org/r/20250425095055.1129285-1-chao@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
