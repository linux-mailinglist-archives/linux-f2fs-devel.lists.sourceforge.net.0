Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9192D905798
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jun 2024 17:56:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sHQKp-00008D-2y;
	Wed, 12 Jun 2024 15:56:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1sHQKc-00006J-AC;
 Wed, 12 Jun 2024 15:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u4ZRYpyRksJXAC7eqQUrubX0WAADsS963fxbHZmjvRY=; b=fUXX1H1qJN/psTE6DL0Aw/hAow
 uCMEJCMBViwRDwHCA1+cOZBoq9DNdz5lME2HpJ6XryrjLd5ZVns7LQeZorukZFFA2u8HGli/rMYq6
 jJfL0UsPE8eF+c0JzDoS12FAWfB/vhCutuq/D2Qr2bFXytdR02BfUxssZ7gFTi6X2ggQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u4ZRYpyRksJXAC7eqQUrubX0WAADsS963fxbHZmjvRY=; b=FMyJ8L82OlZEbWg29mg4CveRvo
 mzlJ8yWgUgMFvYR7QG1E3CkxErsFGOWmAjHCcdjw3B78fdYKnV/wEzfoQCbJqZkhGnnVltKnHvC7N
 Zw57x+A+4JS8gm8D0qYCVZeEhMvGyA3f0gWnBZ7HPvZkRxcl+hKUYDKQ69ELHwaoNt+g=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sHQKc-0007Sn-Nr; Wed, 12 Jun 2024 15:56:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ADF7F614E9;
 Wed, 12 Jun 2024 15:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AEC7C4DDE4;
 Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718207757;
 bh=OGohKvk0MjWf9+Q8+mvrBX+1BAlKKRyUXLbfH75xyb4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=kYWVzenO6v46dav7m+6VeeBQvWtkfZ2ijSROLzZNF2xhVox8NT4g6D7nEQ7Yr1CvD
 QbMqbzoNwKvtHxN4oOUSJGsdzFSOiqxLCA02gKqMCQ7TCsZzzusBONx5M/RWdCVpV3
 EiLccKqgRHfAnZUsG10WiKCsIr5ffuOoIqg1qhcsU6IhDG8FGsX5pkowWNVMy10FlC
 cn2EJB/8N7UtSBq02dCqRuSQs3PZ1MDiLAg7XtxdpzyjShLg11I47hWenlonizyvmL
 MeVPPNyid+I2VhiIZBpPj5WbK56sRWz78MH6UY8PKtaaCMSFrdgOOixPo+5vEX+bSG
 8/iqEXeUVgsUQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 61107C43618; Wed, 12 Jun 2024 15:55:57 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171820775738.32393.13116890369510221266.git-patchwork-notify@kernel.org>
Date: Wed, 12 Jun 2024 15:55:57 +0000
References: <20240516133454.681ba6a0@rorschach.local.home>
In-Reply-To: <20240516133454.681ba6a0@rorschach.local.home>
To: Steven Rostedt <rostedt@goodmis.org>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Steven Rostedt (Google) <rostedt@goodmis.org>: On Thu, 16 May 2024 13:34:54
 -0400 you wrote: > From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
 > > [ > This is a treewide change. I will likely re-create this patch again
 in > the second week o [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sHQKc-0007Sn-Nr
Subject: Re: [f2fs-dev] [PATCH] tracing/treewide: Remove second parameter of
 __assign_str()
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
Cc: linux-hyperv@vger.kernel.org, linux-usb@vger.kernel.org,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 brcm80211@lists.linux.dev, ath10k@lists.infradead.org,
 linux-xfs@vger.kernel.org, dev@openvswitch.org, linux-s390@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-pm@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-bcachefs@vger.kernel.org, iommu@lists.linux.dev,
 ath11k@lists.infradead.org, linux-media@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-cifs@vger.kernel.org,
 selinux@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-erofs@lists.ozlabs.org,
 virtualization@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-block@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 mathieu.desnoyers@efficios.com, linux-cxl@vger.kernel.org,
 linux-tegra@vger.kernel.org, io-uring@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 brcm80211-dev-list.pdl@broadcom.com, torvalds@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Julia.Lawall@inria.fr, ath12k@lists.infradead.org,
 tipc-discussion@lists.sourceforge.net, mhiramat@kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-wpan@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Steven Rostedt (Google) <rostedt@goodmis.org>:

On Thu, 16 May 2024 13:34:54 -0400 you wrote:
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> [
>    This is a treewide change. I will likely re-create this patch again in
>    the second week of the merge window of v6.10 and submit it then. Hoping
>    to keep the conflicts that it will cause to a minimum.
> ]
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] tracing/treewide: Remove second parameter of __assign_str()
    https://git.kernel.org/jaegeuk/f2fs/c/2c92ca849fcc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
