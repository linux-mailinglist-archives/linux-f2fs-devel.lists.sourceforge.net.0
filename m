Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 653DFCC0615
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Dec 2025 01:54:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bysjlu2cjXq6nLMxSOX2HUvStfp3VzI3QAXWcW5eoGg=; b=ZsigrYHa8CVNS3lsDBdyx0qiz/
	hpGDJuSSjL/nXQxNi+2jq2bAXjgVDZrhSL4R2/wvvGBiwN/w+LFCWWQlyESgSLmWbGaiYygZM4BT3
	eM2lnIdym8pZF6jsY+zeY/eeyBzeI3pTR3vfAW1bn5bm3Sf9YotEG2ot6Uix4LzmwdRI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vVJKC-0003DD-Dy;
	Tue, 16 Dec 2025 00:54:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vVJKA-0003D5-TY
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Dec 2025 00:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NmEv1YxPXX/r9KCzxjtKaxbPVlaZl41bQcB/DRTOxEc=; b=Ikc+nO630KErTDHG/lTECFoxWB
 NpwgQ6pTn8QENbxOXhC3a0ALOmD4WOxYc8AahqSD6UceY2bdrZeaZEUm1uAdtY9RfOYTNb9o33iTi
 WrsM/bfcMan7jNP99es/Z02W977uOWaTcEZ6N8bnZo+1VYBa/Q/K3guDSb8rii6TlurM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NmEv1YxPXX/r9KCzxjtKaxbPVlaZl41bQcB/DRTOxEc=; b=R
 Wb3mVCU9R+9NKSeya8R1GJr9dug57WmJVyS3H7GQ4EEHFx1uAAsFeHLoxJyqFBBJ9FlpypGQapG9e
 XxMqUFdj2LRNxp2rPygtXVy6mYhJhQ98wApgKq2nTc4woM++cxgV4t33PD9QZJ7NSTfobeGyCqwST
 YmzECe9qDQQ892R0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vVJKA-0006m5-86 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Dec 2025 00:53:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E18EA40AB9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Dec 2025 00:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18F9C4CEF5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Dec 2025 00:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765846432;
 bh=C5ATnbFv9Yr87JMtY7OfEdAn87ccjbVgWQisKDYRLPQ=;
 h=Subject:From:Date:To:From;
 b=m6w+7/GiSU1wMQAo7716jkYy6vozoYYUvc5Sr/CmG0HO7oCXlj6CIc2vdMl8rHCnq
 +HkKpUvqQyie1rYl735RlL2pg/6+UuHz+/yNu9SxXLL9JEKWzknz7AGxlPCvVrpcWu
 7srNmE1AuSyEWsN56iUlOl04XMwFnCqSqkreC7+0xWZj3JQ2nkDReHsGPYt/kF/cmU
 o/ivgFKBUinlqa0yyyZgf2YbTq+nrbnrrA5eppCtuGO9MQHVlxOzdRhTJdvSUxkYFC
 TL5Iwf91OCDWV5Y3s7FBXQTsoJo2ZDbq8aTbyUJhf361F8hTzfSLBAuTl5rVtccJF3
 ACXW3nyxfDWDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 0347C380AAFA for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Dec 2025 00:50:45 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176584624344.387072.9686123928669531402.git-patchwork-summary@kernel.org>
Date: Tue, 16 Dec 2025 00:50:43 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: block: ignore
 __blkdev_issue_discard()
 ret value Submitter: Chaitanya Kulkarni <ckulkarnilinux@gmail.com> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list/?series=1027128 Lore link:
 h [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vVJKA-0006m5-86
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

Series: block: ignore __blkdev_issue_discard() ret value
  Submitter: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1027128
  Lore link: https://lore.kernel.org/r/20251124234806.75216-1-ckulkarnilinux@gmail.com
    Patches: [f2fs-dev,V3,1/6] block: ignore discard return value
             [f2fs-dev,V3,3/6] dm: ignore discard return value


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
