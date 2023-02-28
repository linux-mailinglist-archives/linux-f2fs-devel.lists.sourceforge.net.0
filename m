Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED316A5064
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Feb 2023 02:02:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pWoNf-0003Uk-4K;
	Tue, 28 Feb 2023 01:02:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pWoNd-0003Ua-EH
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Feb 2023 01:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tG4PXVSBDcThPmBb1XgJvgPBVAD8oHl/J1PvZpnEztE=; b=j/ub3udtVKekNVLC5zd9ZimWCr
 T0rbEi3KSledG2eUVzqbHqGsS2GkpS2TWrA1SoF3/R0j68zSnmULW8Wsw2oFnp5oj/4PpFLmxWsG3
 tZIrvs+3auHzvk9PezcNS/hb2cykRw5bYoCpYepKR5nqMZG2u90+qEQ5cEx4Va+Z6nYw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tG4PXVSBDcThPmBb1XgJvgPBVAD8oHl/J1PvZpnEztE=; b=HzDRnhZAM3cF2RdGS5kHd7MRiw
 Gut7zUgvq+fDfYXCdV4Au77KvfwIePxhR09dyiCR0l+HGORLwYA2pWGcZZJxmRb4UQFl+BHET9tTZ
 6ebTyeJLlybvaALXC0BAIcf6vdw79+Q4dBcSTsNESHZQ5tsUq0hbSADar3yLTp7dL+1M=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pWoNW-0001fc-G3 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Feb 2023 01:02:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 08826B80DDB;
 Tue, 28 Feb 2023 01:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4235EC433A4;
 Tue, 28 Feb 2023 01:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677546115;
 bh=PmoS5E4xHvZz7S45Aua+Oldz0QmPaw0tU7UqcXgqRRs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=FC/l+DsKvowNlIsw52thOMuE3cLhAO4XK0NIFS4KHfE+12QE4MFyV77WEfkhu912z
 eHnbzPxZF95iorEy2tQPemuYdLQOMntGxvpgwO2dvpppsr7H4me1rGxpuZoMW3VCpg
 uWhqnUK/ZhU8fe8CUvnij7r22vBS3/9Y/58MOoA6U5Xo0uniiF3iTxo9R4uU80Y0P8
 pXGmgNiC3eUHZ+odxHVkzB0+4r3kc8BXIRI4bWiPbAA4KrZI5r/evyCuZCJK35pFPj
 7PKzbimXo8acqF5roLuJOSHpFe8Z4X41FZlfd+oKoPDKIdgJKaLnVRJITQj1JIEYPy
 a673U8m5DbL3Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 12813E524D4; Tue, 28 Feb 2023 01:01:55 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167754611507.27916.17564819671316940009.git-patchwork-notify@kernel.org>
Date: Tue, 28 Feb 2023 01:01:55 +0000
References: <Y/004is4VtYI7G2u@google.com>
In-Reply-To: <Y/004is4VtYI7G2u@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This pull request was applied to jaegeuk/f2fs.git
 (dev)
 by Linus Torvalds <torvalds@linux-foundation.org>: On Mon, 27 Feb 2023 14:55:30
 -0800 you wrote: > Hi Linus, > > Could you please consider this pull request?
 > > Thanks, > > The following changes since commit
 512dee0c00ad9e9c7ae9f11fc6743702ea40caff: [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pWoNW-0001fc-G3
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.3-rc1
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
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This pull request was applied to jaegeuk/f2fs.git (dev)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Mon, 27 Feb 2023 14:55:30 -0800 you wrote:
> Hi Linus,
> 
> Could you please consider this pull request?
> 
> Thanks,
> 
> The following changes since commit 512dee0c00ad9e9c7ae9f11fc6743702ea40caff:
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,GIT,PULL] f2fs update for 6.3-rc1
    https://git.kernel.org/jaegeuk/f2fs/c/103830683cfc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
