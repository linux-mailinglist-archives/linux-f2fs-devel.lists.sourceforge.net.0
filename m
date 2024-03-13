Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CD187A0C7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Mar 2024 02:30:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rkDSB-0001QE-0N;
	Wed, 13 Mar 2024 01:30:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rkDS9-0001Q8-3h
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 01:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QaLoCesEa3FigrElrzGEqRoGO1nI9NKoD7A6Um042zs=; b=IHCehyDghv3w3UZtnzaND8gJw4
 3kt/o6iBDtt1VWENYuIEQsdIZXvU7WA0oGTsYi007VEC1FITL16VXOFHGeTnLDJ0WHcwYHgtm5gQL
 yeG0M5T8mi/ciRErOnuAFibGOISweEQ+rrqDVGejYh9Fvc3ihTwiNGPxatfxl5IV2Eco=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QaLoCesEa3FigrElrzGEqRoGO1nI9NKoD7A6Um042zs=; b=D
 SmtzsKxhWHQSu7o1+Wd09kqVSAt1HVukA7q2ASgX3dDdWRxm2m6EqMIpbf0H7p5Y99RSspuRHxK8+
 tIPC2S7DYMWysdLIe36CIKv5jUty47MBjZTOckpkthpUzyEjYjzYKYMM0Gj/dMg0T5U5NVY9r9b3B
 NI3xMG3tOKDVUsb0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rkDRy-00023f-LT for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 01:30:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4FA3661346
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 Mar 2024 01:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E78D5C433F1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 Mar 2024 01:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710293429;
 bh=dOIzdw4qg16uoAkKG+4U75XWqG8X1LiB9ilFH4aDyJQ=;
 h=Subject:From:Date:To:From;
 b=MTx91NG/qQYehK77W06DJmDgp0Hlat9Y8xhTp9Zz9xkBWbZ88U7tXxRN7phz15bTW
 25jWDxhB5pPWiKryAIKo+ib2wv9BYpbik01GaX+W1YGJ0Ky7g+Fp9ZDwRWjD/SfNnE
 1y5emFYSJTL1E65Yfczd6lQqOY/cqnfjdvi7EkncPWXMTnfr205XwZR6x+HJVxaV0a
 HCqdoBZD9tarfBWHEaesBfshNUqKcRQDGEsjLWbVrup9DBzoRmjXcLovMyShlrYcGo
 RjczqWcivmUuY9trABdWnO4W9mgelYp7JewL+KA5ZdDobuMdciGL9xx8DxObUoC8+S
 2H+6jEp6Ph01A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C8D7BD95053 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 Mar 2024 01:30:29 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171029342976.17296.7961812797377876526.git-patchwork-summary@kernel.org>
Date: Wed, 13 Mar 2024 01:30:29 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,1/2] f2fs:
 prevent atomic write on pinned file Submitter: Daeho Jeong <daeho43@gmail.com>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/ [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rkDRy-00023f-LT
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

Series: [f2fs-dev,1/2] f2fs: prevent atomic write on pinned file
  Submitter: Daeho Jeong <daeho43@gmail.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=834480
  Lore link: https://lore.kernel.org/r/20240311235921.1832684-1-daeho43@gmail.com
    Patches: [f2fs-dev,1/2] f2fs: prevent atomic write on pinned file

Patch: [f2fs-dev] f2fs: zone: fix to remove pow2 check condition for zoned block device
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=833648
  Lore link: https://lore.kernel.org/r/20240308035057.62660-1-chao@kernel.org

Patch: [f2fs-dev,v2] f2fs: fix to truncate meta inode pages forcely
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=833630
  Lore link: https://lore.kernel.org/r/20240308010834.4023772-1-chao@kernel.org

Series: [f2fs-dev,V2,1/2] f2fs: compress: relocate some judgments in f2fs_reserve_compress_blocks
  Submitter: Xiuhong Wang <xiuhong.wang@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=832808
  Lore link: https://lore.kernel.org/r/20240306034746.3722986-1-xiuhong.wang@unisoc.com
    Patches: [f2fs-dev,V2,1/2] f2fs: compress: relocate some judgments in f2fs_reserve_compress_blocks
             [f2fs-dev,V2,2/2] f2fs: compress: fix reserve_cblocks counting error when out of space

Patch: None
  Submitter: Zhiguo Niu <zhiguo.niu@unisoc.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=834208
  Lore link: https://lore.kernel.org/r/1710143334-27653-1-git-send-email-zhiguo.niu@unisoc.com


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
