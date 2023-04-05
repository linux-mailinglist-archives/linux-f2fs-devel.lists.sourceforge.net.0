Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 411CF6D8388
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 18:20:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pk5sH-0006yb-NB;
	Wed, 05 Apr 2023 16:20:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pk5sF-0006xM-6s
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 16:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eWNoKCosQ4mceedQT4jz9HOysgSJ6YcVtUlelD2NwgA=; b=adyHziFNUy2YB1bySxtUhVAkbZ
 ufr4kSeZvM8yM3DIDrwuzmNumyOn7/9XZp/s64ZLO31o1UVBUK4c3zW9htVGFU/TBxVNbMpXZ03Lb
 FynKnUq++356bCfF4NtJaqsdeYGCD58iy1sRvZERlQ4r02vl6lNdllV7Y+PT5j5qFeuQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eWNoKCosQ4mceedQT4jz9HOysgSJ6YcVtUlelD2NwgA=; b=j
 zai/AgmGZdwvgh1EdYPRAoAXe61cY3qPxRKws3L4siRmReNk37dbHZn4/j7Geix99Gxt1y1sK4BEj
 kjUJ1fsUonyAdutSVTcGlhLqM9qLOVGnY8iw7/+nhk9QHH2x2YycmEyBODY/z3ecHOPTNVuSrv30K
 /arxOKAIDXDVnNoY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pk5s1-0002lR-Dn for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 16:20:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0950763F96
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  5 Apr 2023 16:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 835BEC433EF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  5 Apr 2023 16:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680711619;
 bh=LAkoCQNMF3pXleMXsbJ3Og2plN2Qk0pB7miWJEEPc20=;
 h=Subject:From:Date:To:From;
 b=mB6x1VfFmgTJKzNsHGtX5aXOIl7vrAiwrHw0rMBktSw8UZsgodcOUDOWdIgdyzHV4
 MUokYw0zdF3aHHYLBJCPM/XPP6W7UntSXF0VSyfKD374rdDmCG04NK8AI+IxZY9atH
 fUUhg25bqaqiVHQQeWOPoms7FtxfGvNjpcOoJwd7fAO/9F75Cj7nw3/F2I7zIVhfUn
 t19MS0RoMvL5E8FA3VK7D94Mdi8/GXlNa4zr2m66lTTS+qXmnrqa4DVjHmJA15EHoH
 K+xgJ2nAJgPPUkG+AOwkv4qZ+Pqu3P0CCONKAa9VPdT0nCmD+pLTBbh9D9jMPaTdNY
 +p4qxGcCJPZGA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 65864C395D8 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  5 Apr 2023 16:20:19 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168071161933.13885.12945501665093273107.git-patchwork-summary@kernel.org>
Date: Wed, 05 Apr 2023 16:20:19 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,1/4] f2fs:
 fix to check lz4hc compression when CONFIG_F2FS_FS_LZ4HC is not enabled
 Submitter: Yangtao Li <frank.li@vivo.com> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pk5s1-0002lR-Dn
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

Series: [f2fs-dev,1/4] f2fs: fix to check lz4hc compression when CONFIG_F2FS_FS_LZ4HC is not enabled
  Submitter: Yangtao Li <frank.li@vivo.com>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=715179
  Lore link: https://lore.kernel.org/r/20230124153346.74881-1-frank.li@vivo.com
    Patches: [f2fs-dev,1/4] f2fs: fix to check lz4hc compression when CONFIG_F2FS_FS_LZ4HC is not enabled
             [f2fs-dev,3/4] f2fs: set default compress option only when sb_has_compression

Patch: [f2fs-dev,RESEND] f2fs: set default compress option only when sb_has_compression
  Submitter: Yangtao Li <frank.li@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=735507
  Lore link: https://lore.kernel.org/r/20230330165648.33907-1-frank.li@vivo.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
