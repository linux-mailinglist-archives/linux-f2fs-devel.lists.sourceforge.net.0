Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC03A31C2E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Feb 2025 03:40:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ti2fe-0006xc-Hn;
	Wed, 12 Feb 2025 02:40:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1ti2fd-0006xU-Am
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Feb 2025 02:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IDUSlPVM9vsJfO53HKrpyHGcKuZo5WQTA84g8nHw7rA=; b=CyfwqVcJwuxKQ8Cmfq/F3K6/+u
 iFp2nXjfTsAbpuc3BApV/hDLSjImm4oF/hg5m0WbMKASOdVxkxfu1diIF/ZXhxHffynN2+EWN1EIc
 C3vVF5D3wvdH8aUmBeDby4TRanh6+7VBKegvro2+RXgdxWpbEswcamHKlg90WkbgWvCY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IDUSlPVM9vsJfO53HKrpyHGcKuZo5WQTA84g8nHw7rA=; b=J
 mURs4qbEzSur6bbYyvwn6v31AAmNexSOT/KR2XjTqdxXwc3az9cMksWy+SY9/2jweKzd72uA9Uk6n
 Uz4LL5ztebSedjr7G3XSgl1LXl6hza6icfjTio1ixbw9aui9Ay0ac6spOvolZfzMCwU26/tR/TAXN
 ZNy1jy89T1Z7yT4o=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ti2fd-0000mp-2O for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Feb 2025 02:40:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DC6EEA406C8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Feb 2025 02:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D737EC4CEDD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Feb 2025 02:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739328001;
 bh=kl0gCAo/8tPQ9p0a4WmAq2WkqQ2DMrab43RYgsJhbLk=;
 h=Subject:From:Date:To:From;
 b=RN6PO4J2Sc86fy8jKAavyUkAgm2ktXBXgbx4EcoB9AnyQss+p7p9taS47FExA9M0f
 2eyG9kiITq4PiVWr8vIUvjKs74cXq9YiY4ALaF9eIcx7oZ8EDghpLwwVZNllOWGVoz
 6vQA2fqL3MfeT/HqTKdZHeZXtnkTPeGexuJIbQauC4pbqI0QUcSrlf3FdrLQB73N0B
 wMpRF8Uo71+n06DwrR2INN42gIsDz72qFXRqc5AR2/4vHs5L/opatmG9Gx9nCmGTjp
 8ajG8n4L0UdyDVc/LUIMvqUGq2Wt8Yi8gz6Mxw0yzIx9KBFkfKrEW5uWIgFunCqOJ5
 K3e6yLfnt4Wfg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 BB38A380AAFF for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Feb 2025 02:40:31 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173932803008.78500.4899217110658851424.git-patchwork-summary@kernel.org>
Date: Wed, 12 Feb 2025 02:40:30 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -4.0 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,1/2] f2fs:
 don't retry IO for corrupted data scenario Submitter: Chao Yu
 <chao@kernel.org>
 Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=932946
 Lore link: https:/ [...] 
 Content analysis details:   (-4.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ti2fd-0000mp-2O
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

Series: [f2fs-dev,1/2] f2fs: don't retry IO for corrupted data scenario
  Submitter: Chao Yu <chao@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=932946
  Lore link: https://lore.kernel.org/r/20250212015413.666375-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: don't retry IO for corrupted data scenario
             [f2fs-dev,2/2] f2fs: add dump_stack() in f2fs_handle_critical_error()


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
