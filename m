Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C446EFDD9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Apr 2023 01:07:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1proEV-0007FK-KS;
	Wed, 26 Apr 2023 23:07:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1proET-0007F7-Kh
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Apr 2023 23:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qgnqyf29BGtWKeF4E5exmaAxjVwdFo5NSlrx3Swjvyw=; b=L5MT8mTudoMzpQOuYOGmbZ9jrl
 WQaQ89iz33wvst4GiCc1ablSSTIRTaGaOmn47x/zikmisGmj7U25YqKTapTu4dhi0+b7xogB00tOX
 immr42jaXki+imwb3IXo9Gt4E+liEyrbJEtPUp2SdYNyf4hPPqxISPBMfqf1BDsMa0zQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Qgnqyf29BGtWKeF4E5exmaAxjVwdFo5NSlrx3Swjvyw=; b=Q
 h9jK8kHjg1+aBV0QTovyvo/Wonm+Iv9dJuUS8h3qLUH2N8Phh3knCwKManA3lLtEXd6bmMT/h4U8t
 U3bD33dBpv28AZSAh3LMvyj1fcumnAaRgdHW/I/w37B1+l30P4glNHddD23u7ySzRqim5AriZ2USU
 9iGfUjC04qbcBhXk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1proET-0002Gw-SE for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Apr 2023 23:07:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4C90B60AF0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Apr 2023 23:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFBC5C433EF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Apr 2023 23:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682550440;
 bh=PwTEB1vzF6HMxSIdPZMZITC7fC12GSDt01cXWWq8nGM=;
 h=Subject:From:Date:To:From;
 b=TA1FWYUwxkpPK0/KplrbWuGpO2cWvwyUjjsahTPPIl1ALXNB+wwbNUYYCNq9u3aT/
 0M24Oy9WmaotCHB/+8ANgMC8AZcXx0N/heY6Xbccq3yRmWlkSFUPrko8lOaEccspVn
 JI31SNa316sPHDiQhQHWXcThacvY05kNZCM7mltzWrvH7/a4k2W34f791t4S/d+seC
 nRE+Y3wS/Mvx9Vd4lSkBhZw0Q6EiCDcVZQ5z4ioQBLLhDQPeK2mZ8+8ctOeixAN8o3
 ew6skSyegnHL2B87132WVEG9YCVkqylkU4HxW7EKOnOzdEEB+5ObHf7e+1fCpk08mM
 UfjafolOXhOOA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 98C7EE5FFC9 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Apr 2023 23:07:20 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168255044055.16014.14169437395103079337.git-patchwork-summary@kernel.org>
Date: Wed, 26 Apr 2023 23:07:20 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,GIT,PULL] f2fs
 update for 6.4 Submitter: Jaegeuk Kim <jaegeuk@kernel.org> Committer: Linus
 Torvalds <torvalds@linux-foundation.org> Patchwork:
 https://patchwork.kernel.org/project/f2f [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1proET-0002Gw-SE
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

Patch: [f2fs-dev,GIT,PULL] f2fs update for 6.4
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=743132
  Lore link: https://lore.kernel.org/r/ZEgdmJWhJX9NJ0fG@google.com

Patch: acl: remove generic posix acl handlers from all xattr handlers
  Submitter: Christian Brauner <brauner@kernel.org>
  Committer: Christian Brauner (Microsoft) <brauner@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=717032
  Lore link: https://lore.kernel.org/r/20230125-fs-acl-remove-generic-xattr-handlers-v2-0-214cfb88bb56@kernel.org

Patch: acl: drop posix acl handlers from xattr handlers
  Submitter: Christian Brauner <brauner@kernel.org>
  Committer: Christian Brauner (Microsoft) <brauner@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=717704
  Lore link: https://lore.kernel.org/r/20230125-fs-acl-remove-generic-xattr-handlers-v3-0-f760cc58967d@kernel.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
