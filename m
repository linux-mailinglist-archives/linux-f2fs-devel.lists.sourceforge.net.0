Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B025AFF092
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 20:10:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWKCDmHd1fY4JpqnKnXEajb9b17AlK4yMZDk5lQnEDU=; b=I+srSvz3D5lwrSTe0QfpdzcoxU
	dLuIOjt7FbSSS6nGbAoYPEsWKwqRLZiTnnvMLtqmbaHVkV3R9t66EN9XbnsP8LfWf/FVnqKnnzl4K
	BcjSWDxoShnzGRw25gstyosOhdRr5N2VM91OGLmFSr/PvNSbllId41Yvh9UKcxypY5oc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZZFM-0000Bo-Ax;
	Wed, 09 Jul 2025 18:10:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uZZFK-0000BH-D5
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:10:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VqNKuQJDAyLSKCmRx1eZQR7iNamjwD93pAoxB0N4QlA=; b=R5HWsM1Ezpbz9ePBCiFNyZHmC2
 Wk4XGIxGnTfqdN3BwAqmbAm/dKc8+9/4U59N1wUXLP6gi3J2NAd5gvJXmYMnBasptu1wG19LoKj7a
 MLQD4lXBR78gisfm1UkZh/R69413+XwsGKNs8jQUE+c6OZXoB70wntHHw8Tz1s36uZP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VqNKuQJDAyLSKCmRx1eZQR7iNamjwD93pAoxB0N4QlA=; b=ZzfNjT8ts9A1yqaSd4Pe2OqycJ
 dxDewW3905Gnqxzma4K00ajYBVF09wHusWUdGgTCj25kWW+mNEKw00K+Q9GMAEiQ2ES3GJUrb+KnU
 yr86b/5UtR00JrQxrbJp5zE7LKhzK4A5PxPuaVwxP4zgWO9pROxGIDzj4j8WTOqxjkU8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZZFJ-00015p-S5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7F4D65C66A5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  9 Jul 2025 18:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D07C4CEEF;
 Wed,  9 Jul 2025 18:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752084607;
 bh=PspK8ujFcaUDrWOGcERuvoq46KpPQ2Uf1F/VNnPDiJ0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Q0JK2x9rhYDWwEQs9c9Vf6PQt2HTPvooCcxVS+KfzoqIsqAjmB+RkuTXpmV3uN1tQ
 YgeBCIdDIW0hfzJnAKg/eGWcjaTAO7mYTZDCwgjeZ0OP+f5RIgTAS4gTWxaNC6PC6b
 vseppHCscEuUj6tS3SsGyT7Sa2s+VRIigbazEHlhI4U3CgesxTcauU4jsPW2x+x8Qk
 vE0LV/EQyQyOGMY0ioye/R4nj5zGILFO0VnM4jb71MQZX073eK40OHZgHBtWYCBr/K
 tq57c9n6XOoyEC+DlQyCxEvhDJ2ZNN9sJFe12JWQdz9++G7xkrtCAvRfEDrZe6bCIu
 brgogaI+/Yiog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB004380DBEE; Wed,  9 Jul 2025 18:10:30 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175208462949.806926.13437251978499582441.git-patchwork-notify@kernel.org>
Date: Wed, 09 Jul 2025 18:10:29 +0000
References: <20250627025944.152334-1-chao@kernel.org>
In-Reply-To: <20250627025944.152334-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 27 Jun 2025 10:59:43 +0800 you
 wrote: > F2FS-fs (vdc): f2fs_recover_fsync_data: recovery fsync data,
 check_only:
 0 > F2FS-fs (vdc): do_recover_data: start to recover dnode > F2FS-fs (vdc):
 rec [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uZZFJ-00015p-S5
Subject: Re: [f2fs-dev] [PATCH] f2fs: account and print more stats during
 recovery
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 27 Jun 2025 10:59:43 +0800 you wrote:
> F2FS-fs (vdc): f2fs_recover_fsync_data: recovery fsync data, check_only: 0
> F2FS-fs (vdc): do_recover_data: start to recover dnode
> F2FS-fs (vdc): recover_inode: ino = 5, name = testfile.t2, inline = 21
> F2FS-fs (vdc): recover_data: ino = 5, nid = 5 (i_size: recover), range (0, 864), recovered = 1, err = 0
> F2FS-fs (vdc): do_recover_data: dnode: (recoverable: 256, fsynced: 256, total: 256), recovered: (inode: 256, dentry: 1, dnode: 256), err: 0
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: account and print more stats during recovery
    https://git.kernel.org/jaegeuk/f2fs/c/55fc364b430e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
