Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA6968E0B6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Feb 2023 20:00:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pPTCg-0000tP-3z;
	Tue, 07 Feb 2023 19:00:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pPTCb-0000t9-JX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Feb 2023 19:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xeJe9FgspaFsnxPbY1+BH/1D9vtgFsDTr/kPWbnuuk0=; b=T1XvM1kzTucFkFoTGR3PYruq52
 z7lDqHvuhSByD2czeI+vsdGAw4PGs7L6YvDXZInodaLrbyHS2Polhzinzme2YC9YdjrTi86idwJQL
 z+Ufx1msZuMPij0r6++0IQ1m9VV3jFsBX0A5FmVp0+rGiEM+cGXxz2EgSnUEStarnBag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xeJe9FgspaFsnxPbY1+BH/1D9vtgFsDTr/kPWbnuuk0=; b=Y+JPNX4nNBFaIPMXvO52icuksz
 BujW+X8O2SjcvWIJ6OkFoj1s9rpmkGK0iJmf7nhCKc+PVarNc1cXoURz0cO5Xz+Cd7ARtynVsoyZD
 f83fSM6tzV6GTehwYyxXWQj7VlFvUFqZwfjmnw/8o7yXziYT0pnfJAPgeNn0Y57t/Q5U=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pPTCa-00Du7k-Ev for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Feb 2023 19:00:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1729460F71;
 Tue,  7 Feb 2023 19:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2C0CC4339E;
 Tue,  7 Feb 2023 19:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675796418;
 bh=BcIOalxqWOrgaDJrq9uO5FEbZqioEpeR56hDPQadaes=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=jOHkP2DOGkeFQ6xpbLfOntxl03B5I5xTjyhc7ByKewUlmBRX74ou3zikK5Mdgn/Vx
 F2eYpAUi3Fw0Hp0wKWhoTpD0jqG1Yyv1/uiZPTGR7pZ/M6RhghDxpogeI1zQ1QqJv0
 4Y4ujFf6KYp+QgpsRK3oLNqmPZ68pHryQZzl6sjDo5K5sy6YL8U+CRIZpGXmUEBnbE
 jT/zoYhYen4jS8pKP3pb8Bx72dK5pKsuZXfyFHD+3DV32TuWE0K8f+DqSPOO6T+hG6
 3m0wAwW/xTTUXJOaKshjNNg+ljdtqulhXN+EAGacFmXF7DKpCuubdQVAxUEuVRVwcE
 XHPvOXs0Guhsg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CBE7BE21ECD; Tue,  7 Feb 2023 19:00:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167579641783.24576.11656544535078514322.git-patchwork-notify@kernel.org>
Date: Tue, 07 Feb 2023 19:00:17 +0000
References: <20230206144310.2344-1-frank.li@vivo.com>
In-Reply-To: <20230206144310.2344-1-frank.li@vivo.com>
To: Yangtao Li <frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 6 Feb 2023 22:43:08 +0800 you wrote:
 > For LFS mode, it should update outplace and no need inplace update. > When
 using LFS mode for small-volume devices, IPU will not be used, > and the
 OPU w [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pPTCa-00Du7k-Ev
Subject: Re: [f2fs-dev] [PATCH v4 1/3] f2fs: fix to set ipu policy
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

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  6 Feb 2023 22:43:08 +0800 you wrote:
> For LFS mode, it should update outplace and no need inplace update.
> When using LFS mode for small-volume devices, IPU will not be used,
> and the OPU writing method is actually used, but F2FS_IPU_FORCE can
> be read from the ipu_policy node, which is different from the actual
> situation. And remount to lfs mode should be disallowed when
> f2fs ipu is enabled, let's fix it.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v4,1/3] f2fs: fix to set ipu policy
    (no matching commit)
  - [f2fs-dev,v4,2/3] f2fs: add missing description for ipu_policy node
    https://git.kernel.org/jaegeuk/f2fs/c/9e615dbba41e
  - [f2fs-dev,v4,3/3] f2fs: introduce ipu_mode sysfs node
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
