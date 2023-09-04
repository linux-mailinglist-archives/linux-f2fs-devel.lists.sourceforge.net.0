Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BF4791C75
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Sep 2023 20:11:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qdE2j-0007qA-4m;
	Mon, 04 Sep 2023 18:11:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qdE2h-0007pz-Dz
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 18:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Ayb3yjCLQTlLTjoZzR7ktb7o3vVPYxJNAemwcs1exQ=; b=SvjyN5ZEg/ONgeRag9m1s+DscU
 juc+H8cSL1Cr7MBNfhB2bphrjDHYb6bCXkotjbmslI2AsaHP0lBC0yBCSSajKPVLkqIm2ooAqSt4f
 E0E1wUOxAnzFI4M+VDv9DSeaY5MeC2qHtvb+AplaSBKjzbM/o86jv4IctTgkcPl1psIA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Ayb3yjCLQTlLTjoZzR7ktb7o3vVPYxJNAemwcs1exQ=; b=J8XXyq0cQfR8APu/l5v7ty8ziT
 5GcHlqbrn7V7HtMDgZbBMbQ1X04cC5vpHdW0ymrHhZBUZPyD4MhVvoMGe0u3RJFbIfJfZFQZdXW4i
 3PGozKi+1sHwYrw7/09xnY/nlI0bgoc9zd4Phxf74UQVL+Wf4sKQwNPt/5lOm3T82zhk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qdE2h-0007WX-7j for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 18:11:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E8A5E61981
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Sep 2023 18:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5532FC116A3;
 Mon,  4 Sep 2023 18:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693851069;
 bh=kDblhT9YU6Z13oCtuFpW2rqTqYaBtsASH9dKHi3/gS0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=KCIPdf7Q0FJfi462+L+9hLlIq0BX3t5I5nU+KyC3JUzPxLXnAhbxymMCPphIjkZk2
 nAsEm8alo/h9yzDnwp6A8LVb7rfbQMxy2RfjbpRRrEaQ/eBashGE75ZiLRId6mtGSt
 n174WOpZJUMdgC0EjnVVC2vm5+7uig8ReNTtltsXQsPxwJ4Heo6W2elu0nWCCAFa+P
 IPwUZr1zyeD6ymPLFhgxMaBz9kyOb8bPnob2+yLx+ge2NU+glqZFicKWUrFr0q5nEO
 oYTUotqMOD89YLI/lMJVg/6rp/a47wySfbJ7iLUnBpXB+H2O664scK9VXRyIFBHpkL
 AGY3UbxOXs2Pw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1F4B9C0C3FD; Mon,  4 Sep 2023 18:11:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169385106912.19669.17692351155547248889.git-patchwork-notify@kernel.org>
Date: Mon, 04 Sep 2023 18:11:09 +0000
References: <20230705212743.42180-1-ebiggers@kernel.org>
In-Reply-To: <20230705212743.42180-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Eric Biggers <ebiggers@google.com>: On Wed, 5 Jul 2023 14:27:41 -0700 you
 wrote: > This series simplifies handling of errors during the fsverity_init()
 > initcall, and moves the sysctl registration out of signature.c so that
 > it is not [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qdE2h-0007WX-7j
Subject: Re: [f2fs-dev] [PATCH 0/2] fsverity: simplify initcall and move
 sysctl registration
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
Cc: fsverity@lists.linux.dev, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Eric Biggers <ebiggers@google.com>:

On Wed,  5 Jul 2023 14:27:41 -0700 you wrote:
> This series simplifies handling of errors during the fsverity_init()
> initcall, and moves the sysctl registration out of signature.c so that
> it is not unnecessarily tied to the builtin signature feature.
> 
> Eric Biggers (2):
>   fsverity: simplify handling of errors during initcall
>   fsverity: move sysctl registration out of signature.c
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] fsverity: simplify handling of errors during initcall
    https://git.kernel.org/jaegeuk/f2fs/c/e77000ccc531
  - [f2fs-dev,2/2] fsverity: move sysctl registration out of signature.c
    https://git.kernel.org/jaegeuk/f2fs/c/456ae5fe9b44

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
