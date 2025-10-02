Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B366BB5330
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Oct 2025 22:50:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pizPg6UMSLM6oPU0KZ4nBPkVPl9vGardedMAHW73Bvo=; b=Sc3cunqw4Uw+be9XeY+sW1deWY
	vlWyGcBGSarmUkZlwKMRywkzO0syVVLDnhaACOl25GPmMGnGgrMHde+fj/bTnB+G1ez64PDdB2xqr
	oWktWi15v44TI0PgK04TKkCs9U666RIJezgaY4LC0AyFIpz2AzKYwoLjxo3L5Hec6ChY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v4QFy-0004TG-Ju;
	Thu, 02 Oct 2025 20:50:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1v4QFn-0004SU-7X
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Oct 2025 20:50:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3Bzy8PEhmcdlMYmLTuEbG0Pn+w7SZzse3wBK0DigEnw=; b=OTEQOAAQw6ur48w5CT1JAbvgn5
 UKz9p3NAJxOFmDdLPBuTRsGd+gY5aGpTqJ/EFJIKwh/VpSeLDxHnVPhOx6LAjV3IqUk213P6t0C5r
 37pj6kufoW0ZGv4MZMxUD2NGE/wNWRcbxY7T4bl2kzClsKHewq2B0HiiAll9sGfFMA6A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3Bzy8PEhmcdlMYmLTuEbG0Pn+w7SZzse3wBK0DigEnw=; b=e
 y5gQEEajS7qyx8DPKP2GkvbLt9rzNlj3CPxMObcwCnnQT8ffuUnggDioKJ1xw+VFVpV8v+OYCuoSr
 Z+J8rUQfQ7zzQ4KePIxXSWVBQsjhtT+fniC5hLcYsXCzLraRwxVFuDtDpfsuF0QzESrsUt9OJasB/
 Y7MomeYRp5r7axlw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v4QFn-0006vi-Gj for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Oct 2025 20:50:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 26E8948705
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Oct 2025 20:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03FCAC4CEF9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Oct 2025 20:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759438214;
 bh=CJLesYTj2rs5bzAB1fC+U2biZwFMPrQJVMIgntkl5Fk=;
 h=Subject:From:Date:To:From;
 b=sCo7JJPFk2y4im18i7+O3Hheavhf1Gs66n1z5Mz/mpIazmvgR5mZFG8n/N9t2LaOx
 KZU3O9jxFzcn0QVWK+4dttctxSaFVPxmqji52Op9b8NDujj2pficfURWIf1NZnS+Ib
 PLcS8QzfaNNeebgJAWFgU2bIQdxz/fQPpPlelJoqAef39nRJE58V/RKgoePBb9E5bq
 HIwtDHVLi0DoxC+bbBCG4XUbQn/oQSCb49qOw2pAefU8B59QOGXz7LNsq/eHfW1Bl9
 udzjlPFrjziWiXreS5ejf+L2A90+Z+u+7lbSvFSFRzLz1sf47JnTX+HW+0EQuwC15t
 Fdn2oMucQR6jA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EFB0239D0C1A for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Oct 2025 20:50:06 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175943820555.3449937.9711384032965236964.git-patchwork-summary@kernel.org>
Date: Thu, 02 Oct 2025 20:50:05 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: add
 missing dput() when printing the donation list Submitter: Jaegeuk Kim
 <jaegeuk@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.o [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v4QFn-0006vi-Gj
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

Patch: [f2fs-dev] f2fs: add missing dput() when printing the donation list
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1007867
  Lore link: https://lore.kernel.org/r/20251002015645.3588322-1-jaegeuk@kernel.org

Patch: [f2fs-dev] f2fs: fix ifolio memory leak in f2fs_move_inline_dirents error path
  Submitter: Haofeng Li <920484857@qq.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1007350
  Lore link: https://lore.kernel.org/r/tencent_3FA2C956B557ED4D050EB26922B50D3CF40A@qq.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
