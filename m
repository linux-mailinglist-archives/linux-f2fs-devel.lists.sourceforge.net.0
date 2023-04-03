Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DA06D505E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Apr 2023 20:30:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjOwm-00065t-1x;
	Mon, 03 Apr 2023 18:30:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pjOwk-00065n-Bb
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 18:30:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vOAA9ZkxzHphL4CfbBmzX2YrNd0KbOGa9iHzjcturxo=; b=fNAoaLsmBOdZiNckcl89xr8bEQ
 ZRKotn0tI3b8y1CtB7xFhois6ESdSjbtcS1HuJFVQP+mP9AIVVLqyVu4BnETu6k9iQy3efP1gJXJW
 i3dHSVeh0St2SRom4N9qsT8bWfzKObeA+RwnfwuPf3KVKUQIC+dn17w6LEOK7DLuKqCs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vOAA9ZkxzHphL4CfbBmzX2YrNd0KbOGa9iHzjcturxo=; b=GZPWfo7u5QgerSWMtbWW78Y06T
 TT/q0v39eGltjB8FqMJQgc8Il3k5kp84pnKycVz1nFHrGl4cw2vcjIoEe4uMmGT1BvOYZApTaiRSG
 Oz/D7tig+otk14F5vOrkLP9xO1XcQ9RTMpck0OtkQBzQJRbxoJ6ejsF235W4i40mlp2w=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjOwi-000737-MG for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 18:30:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4E137618F8;
 Mon,  3 Apr 2023 18:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B09D3C433EF;
 Mon,  3 Apr 2023 18:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680546618;
 bh=4LH6DmsLQfzTs2kOVQRO7644p9IgdG5cgEpOhmSGjRM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=oTD81naPwuSaro0Hvwrg1IJXSP2u1sMcvRGBbpwv1mhhjeLHp8blQZXsylbgYrivI
 EKX6thdKaKqSgGE+n4dRucWLN0dolTkLXBOrqjvvbF+HTYqBOyrJpmVFbvYW66JXOP
 IlPVsGGNuAzWG7sCBXrkR5zXRb/Qlt63kJQYwh0BN047YVIfVaE/vN62vfohT/Bgu7
 4GgUC+ajo7U6v3xFW6C+RjZWNzqO4Y8wnQp1HXibjmjXVngYTESZKPDTXaI5sQ/fGx
 DM3rPUFuPQnUwUeAoPFxRhZ7SJ3A7gMH+Vca3HV+VKw2MnnJ5V2rVyovqTjUf9MDg/
 9hOgwRKrnAicQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 93268E5EA86; Mon,  3 Apr 2023 18:30:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <168054661859.14597.6329451701329861497.git-patchwork-notify@kernel.org>
Date: Mon, 03 Apr 2023 18:30:18 +0000
References: <20230331092658.72386-1-bo.ye@mediatek.com>
In-Reply-To: <20230331092658.72386-1-bo.ye@mediatek.com>
To: Bo Ye <bo.ye@mediatek.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 31 Mar 2023 17:26:56 +0800 you
 wrote: > From: Qilin Tan <qilin.tan@mediatek.com> > > Made iostat lock irq
 safe to avoid potentinal deadlock. > > Deadlock scenario: > f2fs_attr_store
 > -> f2fs_ [...] 
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
X-Headers-End: 1pjOwi-000737-MG
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix iostat lock protection
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
Cc: yongdong.zhang@mediatek.com, linux-kernel@vger.kernel.org,
 light.hsieh@mediatek.com, linux-f2fs-devel@lists.sourceforge.net,
 qilin.tan@mediatek.com, linux-mediatek@lists.infradead.org,
 browse.zhang@mediatek.com, matthias.bgg@gmail.com, jaegeuk@kernel.org,
 peng.zhou@mediatek.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 31 Mar 2023 17:26:56 +0800 you wrote:
> From: Qilin Tan <qilin.tan@mediatek.com>
> 
> Made iostat lock irq safe to avoid potentinal deadlock.
> 
> Deadlock scenario:
> f2fs_attr_store
>   -> f2fs_sbi_store
>   -> _sbi_store
>   -> spin_lock(sbi->iostat_lock)
>     <interrupt request>
>     -> scsi_end_request
>     -> bio_endio
>     -> f2fs_dio_read_end_io
>     -> f2fs_update_iostat
>     -> spin_lock_irqsave(sbi->iostat_lock)  ===> Dead lock here
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: fix iostat lock protection
    https://git.kernel.org/jaegeuk/f2fs/c/daa080db4e7e
  - [f2fs-dev,2/2] f2fs: add __pack attribute for extent_info
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
