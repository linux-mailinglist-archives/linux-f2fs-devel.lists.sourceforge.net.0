Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA30C9C8F7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 02 Dec 2025 19:13:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oImllzk77Cv+fR7hvPuDE0BnLlPIulFL6/9SqJKCrus=; b=a1z6scPTUWho3FVyH/bBTtWi87
	dszvLyVyZvc1kWjCKmA5NWFCCOrxeBF05HqcMtw/iPv74LjhZxsOvrMyTaYrqU4ze4LEwM3Rn3xLl
	nPmcOfMZ3CjhGjGOItVDFjwtqtSWJmmB4SqVzc1dY2807dT2TlvNUTtywL3djI3tEGeY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQUsD-0003zA-HX;
	Tue, 02 Dec 2025 18:13:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vQUsC-0003z4-8z
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 18:13:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ild/O8rOoPQmlNBV5zwOt5U5tQT77otZJ5c/D3GEK+o=; b=UP8nKSx9OUjZ6rE7WRXxNRoP7n
 QHy5unxHi7Q63jTnV0+RPTTO9+emVrKy/TNh7XR0F7brDjVFBEuD+50/3Od0Cxj1HYv3A6OY5kMPf
 oQZVpT+nXeXpyERJsiFQD001t0ejD1yPOEdHNqJi8DTDQJFutY0jae+Mjrwxf4EaFzOg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Ild/O8rOoPQmlNBV5zwOt5U5tQT77otZJ5c/D3GEK+o=; b=M
 gcGgWuaJXVC2VVA7Ev8viC7BThw0a4mQ7EWWgKb5uQrVQxo9IJ+BEXUtW3Nr9wLkcsGpGAzshJaw6
 qEDVkHwKKZjLf4xPvqzPa02AfznLOApyl+VJgNA844aJ9c677ietjbCJf/yJ8IbKHXZkW9gk+H3Bn
 YpeHpURD503FHI5A=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQUsB-0005bi-M2 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 18:13:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0BCE46019C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Dec 2025 18:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6849C4CEF1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Dec 2025 18:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764699185;
 bh=fgamJTQuSavuzCdboApPfcRUjSHGMDebN77YSpIsWJw=;
 h=Subject:From:Date:To:From;
 b=GuQ+3TSeOHsdDhCgrYEdJzAs3PAPDx5B1VgdycJCKYiFKI2b9cjHh5ngJlOUE4x7z
 xWsk4HpLFe3t7Jb9lex9/g2GlzZpBCAEU9P2wXnG7Jb9gOWgsJrz7035/piOl6W8bi
 B0EkW/PoLL3qJeZeauSt8BiHnfWMrw8QRnGcIT8OB9SNENvp9woGtp95I1RDWqLT20
 iNddqVAu52FpP1Qvr8Vnu6sohmXm97TOrQuQzqWAAkKTD2JzRBUv3bDuaU9AjBOSBz
 6OLsseE8fEGhczLaPc4Rs7e87N2DT7jVFMF88rKHddviTKFUMNvQvYA6wCth1mgy7N
 3c+Z5CEVwkmUA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 43C1B3A54A3A for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Dec 2025 18:10:06 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176469900486.3331097.2264229540949448425.git-patchwork-summary@kernel.org>
Date: Tue, 02 Dec 2025 18:10:04 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: support
 to show curseg.next_blkoff in debugfs Submitter: Chao Yu <chao@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQUsB-0005bi-M2
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

Patch: [f2fs-dev] f2fs: support to show curseg.next_blkoff in debugfs
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1028598
  Lore link: https://lore.kernel.org/r/20251128092534.1607427-1-chao@kernel.org

Patch: [f2fs-dev,v2] f2fs: optimize trace_f2fs_write_checkpoint with enums
  Submitter: YH Lin <yhli@google.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1028527
  Lore link: https://lore.kernel.org/r/20251128032509.825003-1-yhli@google.com

Patch: [f2fs-dev] f2fs: fix to not account invalid blocks in get_left_section_blocks()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=1028597
  Lore link: https://lore.kernel.org/r/20251128092507.1607278-1-chao@kernel.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
