Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F9A6D6EFE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 23:30:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjoEV-0002tb-5r;
	Tue, 04 Apr 2023 21:30:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pjoET-0002tV-81
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 21:30:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GfKVcyY6kZWlGqe7KIvkvz3HyHjyWyeVcyXmO3rlcdY=; b=ln/NQ+4eATaVs3ylx6Pl3QGbPA
 wikXHCI58P68GvnCSFTOEqF9IG7W89UmhzdyNHt5xEBAX+TsXfYQtOaEgiqWArAHeiD1NddW5F7XE
 AvuMD29WQzn1A4sbhNiObKm+zBwUs5gAO8PSnZ8Ku3RE8PFemyNl0QmrluI3PVpnNApc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GfKVcyY6kZWlGqe7KIvkvz3HyHjyWyeVcyXmO3rlcdY=; b=Sod0KfVgb/s+Kbofli7H0QWWoM
 7qN8Mi4/Bfqbqe4RqeqXEPWGy4GuLiJtOAkFUREG/Wtdo9Qdo55J3S7qsY1SyU5q9xwxDPRqOdBT/
 AvQ8ZZk7j59ChVDLoFs1zJfJvXY+/dJLWC29CJoIxFNUCoKsfwR39Ln1YY5MJMJytjvQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjoET-00FMON-0d for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 21:30:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9BF63635FF;
 Tue,  4 Apr 2023 21:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B13CC433EF;
 Tue,  4 Apr 2023 21:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680643819;
 bh=BhqwVjVyK+Eol6KMD537Bt+HCSapsZ3NENVcIm/jk3E=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=aRciJmjj3GSjvK/LQTaFh+wQ9PedRJ20Wpa6RH6UcqAZ4JfkmfZz2ESThlhzveigG
 4eUZcTY4xmnswV9DH2NY+xibmAAE2q0952DvDpXHrAwo4H8s1pIx2sMULX4m3A/bC0
 z3kMvySCcERCYKCtsudeXg63KL21X9KruWTVhGyQWvaDiGxMQI+hDyMEcmxXJ+zHgT
 E++8eYygKRVuk8Qf4Ggnlsqzz5eKAV70Aeav00Jh2UxFkEi9zuEsGpjj6c18jTPQPh
 ihHzOJu6vAvi+DrU8UvykCwVnHeq2pqHQvKaMQ6K3I11nKh6RtCObeD+ZaiAjSzbjE
 ymmib/CZ1lpgQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 DB511C395C5; Tue,  4 Apr 2023 21:30:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168064381889.16246.5404521009795232180.git-patchwork-notify@kernel.org>
Date: Tue, 04 Apr 2023 21:30:18 +0000
References: <20230404040051.50726-1-frank.li@vivo.com>
In-Reply-To: <20230404040051.50726-1-frank.li@vivo.com>
To: Yangtao Li <frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 4 Apr 2023 12:00:51 +0800 you wrote:
 > There is only single instance of these ops, and Jaegeuk point out that:
 > > Originally this was intended to give a chance to provide other >
 allocation o [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjoET-00FMON-0d
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: remove struct victim_selection
 default_v_ops
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue,  4 Apr 2023 12:00:51 +0800 you wrote:
> There is only single instance of these ops, and Jaegeuk point out that:
> 
>     Originally this was intended to give a chance to provide other
>     allocation option. Anyway, it seems quit hard to do it anymore.
> 
> So remove the indirection and call f2fs_get_victim() directly.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: remove struct victim_selection default_v_ops
    https://git.kernel.org/jaegeuk/f2fs/c/4066666c1581

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
