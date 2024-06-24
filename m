Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1BD915593
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jun 2024 19:40:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLngM-0008J8-Bw;
	Mon, 24 Jun 2024 17:40:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sLngJ-0008Iy-4N
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 17:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2E/5HrnxiOR/QSFkPUtx2cGXJ1KpH63ROii1ENs5VR4=; b=DlW4DlRddwSZofGb+QgsZ7XNbW
 sz9W90KMpE/OlktNvmCHzJ/n39UuIKPFk3LxDl4D4lb9NZnCbjOuvVCwKwt4QCayO4tKCaJKitsxH
 BgG+15w3LR96byEHf7G0vAwmFRA04of7ggVhZa4zXX79eOT8DU+Jdj8y//vC0Cy4Rpzk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2E/5HrnxiOR/QSFkPUtx2cGXJ1KpH63ROii1ENs5VR4=; b=c
 SL/BAdSRSAHb6VFtALI6EbJ8C/XCCCGuFa2E/LUWOYnHfCuDe2gcrdnE18b5v6C2zgQrpvM4gRbn7
 pFqR5wajzdZ7bUOz4QSorgMySpKcJs8k4eRfNMLz99D6JO5wy9WQH+vzaVFkvxPdUBSqnsZIqrbOG
 SDGRjQqopBNWni+U=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLngK-00024x-AM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 17:40:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id BE9FFCE12DD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jun 2024 17:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E64D1C2BBFC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jun 2024 17:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719250830;
 bh=iV7KpUryNYU4MfS+Dd8ApowekXirXDgs+h8x1q2B4vA=;
 h=Subject:From:Date:To:From;
 b=BR6bOpKwcKUCYgfkxKs/o6yfYjw+dq8tbxpKhWZ1ILzi9yqLPj+rV9DLTZzbHSo3V
 twLZEotlVxPPOLjf60BkPycGHqZ4z0GS5GGYiPUQ+9JfpBU49JkpH2Cz4EJNb2K0LA
 uo6wLnrSWCCTu9oeE8LrZdDYlpGeoeE8UkakG7Lt9JeHhTnKYwRl/z76hT2+8Qthye
 1L0XhwA7b+JBWTmnKE5wQ6RPOnGNMxFSn5L81fmDya1Y+K/ynxddwYwm5sz0qi31To
 xmjx07sMzp2ch4nh2F9mKdfHZcuiPk7x9b3aFKcaX0jtEmEK9LIqEXgCz4zWuk4GiW
 3bR3FfpmSl18g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CD958C43446 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jun 2024 17:40:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171925083076.4247.11642844123598846816.git-patchwork-summary@kernel.org>
Date: Mon, 24 Jun 2024 17:40:30 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: assign
 CURSEG_ALL_DATA_ATGC if blkaddr is valid Submitter: Jaegeuk Kim
 <jaegeuk@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/ [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sLngK-00024x-AM
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

Patch: [f2fs-dev] f2fs: assign CURSEG_ALL_DATA_ATGC if blkaddr is valid
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=862837
  Lore link: https://lore.kernel.org/r/20240618022334.1576056-1-jaegeuk@kernel.org

Patch: [f2fs-dev,V2] f2fs: enable atgc dynamically if conditions are met
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=859847
  Lore link: https://lore.kernel.org/r/1717750830-15423-1-git-send-email-zhiguo.niu@unisoc.com

Patch: [f2fs-dev] f2fs: fix to use mnt_{want, drop}_write_file replace file_{start, end}_wrtie
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=861552
  Lore link: https://lore.kernel.org/r/1718271333-32179-1-git-send-email-zhiguo.niu@unisoc.com

Patch: [f2fs-dev] f2fs: clean up set REQ_RAHEAD given rac
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=861328
  Lore link: https://lore.kernel.org/r/20240612193831.106524-1-jaegeuk@kernel.org


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
