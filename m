Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8EE7FF968
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Nov 2023 19:31:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r8lob-0007PY-TY;
	Thu, 30 Nov 2023 18:31:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1r8loS-0007P2-BW
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Nov 2023 18:31:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ALdqRzzgNkp7oOFSjXMHJthz+QOO8WBk9uPxzemdSI4=; b=OfO3QBUbxO5hoa8TBQTCAqfkkX
 SCB+T9rOb4WSGJgi+HE2GUCY6bLfdoM36HofVUCWTPf0HYBZRpSRDxQ5x52/ytkNNUftVRMP0MFci
 NVTlkS0GOO+EfLLiGKKjMRUD33XOfhEumUKmpIveE4yAOmGSUjBzCjUKEqXhSZPHBdMw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ALdqRzzgNkp7oOFSjXMHJthz+QOO8WBk9uPxzemdSI4=; b=b
 FwwRrI09l+l90WkeatKLUw0ZSq7EK9t8GP9fo+0UlxK6e962xxFh06aqBe6IR0em1879lAHHCegCa
 dXwyqZny0uplWPPG+tqUjpIMbzsQZRGqiJC/zuYhY2hMpluXpqUb6aX+YjkMVfApr0CYs71YtADvB
 IgNQ54qDlI2Qri8c=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r8loK-0006TQ-Uy for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Nov 2023 18:30:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 614C3B845CC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Nov 2023 18:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6BA9C433C7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Nov 2023 18:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701369028;
 bh=dTShWGNE+HcghajTJ/Q5qEWtZeN9m5npBWuqxForNjE=;
 h=Subject:From:Date:To:From;
 b=kU7zqPRQVmk/UEoBaTYoV99w6F6trYT+XcbiV7oQMVjWJwsYM4Uka6j3U4ykI7het
 1pwzDo/OQTnvMVGuClRL6ZEg0SMyKpfmiXahxMHKckTNwR3w4/GtZBqol0pKRHQown
 cMvUNtK4i9O3SLfQSnjxQiApSJb/D8IrEadsr6kX6YcgcaSUpjlALbjVpmuHP0kUn6
 Ucst28KnVYylBHzbMFexAXkzW9D1D7FmiqadSVouODNR3dhd+yATYd6nzQkc6XYf0t
 cLiuvMp/0ikUNih2WuuYg78o5AM0TNYfliFk6sJQu0WJsWcizKYPr1Ydr4t0Fm2M5+
 g61arInmHG+4w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9AB45DFAA86 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Nov 2023 18:30:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <170136902856.21709.963032732341499764.git-patchwork-summary@kernel.org>
Date: Thu, 30 Nov 2023 18:30:28 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,1/3] f2fs:
 clean up w/ dotdot_name Submitter: Chao Yu <chao@kernel.org> Committer:
 Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list/?series= [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r8loK-0006TQ-Uy
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

Series: [f2fs-dev,1/3] f2fs: clean up w/ dotdot_name
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=801528
  Lore link: https://lore.kernel.org/r/20231116062556.2451839-1-chao@kernel.org
    Patches: [f2fs-dev,1/3] f2fs: clean up w/ dotdot_name
             [f2fs-dev,2/3] f2fs: use shared inode lock during f2fs_fiemap()
             [f2fs-dev,3/3] f2fs: fix to check return value of f2fs_reserve_new_block()

Series: [f2fs-dev,1/2] f2fs: introduce tracepoint for f2fs_rename()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=804802
  Lore link: https://lore.kernel.org/r/20231128093130.2885216-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: introduce tracepoint for f2fs_rename()
             [f2fs-dev,2/2] f2fs: show i_mode in trace_f2fs_new_inode()

Patch: [f2fs-dev] f2fs: fix to avoid dirent corruption
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=804798
  Lore link: https://lore.kernel.org/r/20231128092516.2882629-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: sysfs: support discard_io_aware
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=803325
  Lore link: https://lore.kernel.org/r/20231122144715.518256-1-chao@kernel.org

Patch: [f2fs-dev] f2fs: skip adding a discard command if exists
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=801164
  Lore link: https://lore.kernel.org/r/20231114212414.3498074-1-jaegeuk@kernel.org


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
