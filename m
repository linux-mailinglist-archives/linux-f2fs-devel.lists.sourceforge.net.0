Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A7B791C78
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Sep 2023 20:11:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qdE2l-0001qn-Nn;
	Mon, 04 Sep 2023 18:11:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qdE2j-0001qF-LE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 18:11:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AoON+jLAMrkgYtLmtqnFtngN1/nb9Fe4Y2jIvpYAUiM=; b=XzKbzGprsp8f2RdqWWuqf9Ks1t
 tHiRgV0/QSUxdwj0iQAiIeORPsKMTOEceGVgGv05z7J1YzyNWxYf27xTwulze/q/TUuyGh5o0vWM0
 /YGAyGFx5dQe3fVSdFaJnw5AraorEBkHIs/gj+ewTm2GmX6pNC55tKVUcYRtoutf2tiA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AoON+jLAMrkgYtLmtqnFtngN1/nb9Fe4Y2jIvpYAUiM=; b=XGSUCumbwkIvY1u+JruxgQi/Ux
 IPv49hln4Abv0H9stp/SmmEwOwjx0wdU4c65UlbJoZGLC5dGdhLB3Ddfs8tAYGVDqgFKLWkG4gjga
 PSf6iIPMGPnAcxPnbmNu7RizQb0rcumggNhPUUwp9fUFQd6/Ir27LGeNz6oMgvd7ov7U=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qdE2j-0007WW-L0 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Sep 2023 18:11:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C2F73CE0F9E;
 Mon,  4 Sep 2023 18:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A55FC433BD;
 Mon,  4 Sep 2023 18:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693851069;
 bh=6PRC2IiXOaVQ74rsqcqlaidhvNsvQl6gN6anNwKmH0Q=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=sM5gXvVxBTbLKXM4zeMrnhi3wGLIX+kAeewNYN0MFxtWVI7SEPDf2wFxs2s3Pwnth
 yqpnH5JHbAWIcRhtwNZhAZhMJ6MGeIaJoTstJ/tkvt3FZyQwzMV6cOgUSocRSaXUz1
 5w2aLgeG4KUnKPBPu6QATkd85nxxzXS6zoEDB+lw/OsBRaR7mvQAXba6y69P9sLeXt
 54OZnTSjbSK6qDO2x8fsJEnQFSmpOhamIEqCAxEmXE4oydL6Ybr7AaH/fijRxsy8Yt
 ilvyJOum2raf9GBdSKVlAU4PraDAaMxQICKPMioyjy7UN6z9UHS0VAqZOWcJM35VOv
 nhY+rzU7Nh3wA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 090F6C04DD9; Mon,  4 Sep 2023 18:11:09 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169385106903.19669.6849396083145416463.git-patchwork-notify@kernel.org>
Date: Mon, 04 Sep 2023 18:11:09 +0000
References: <20230814182903.37267-1-ebiggers@kernel.org>
In-Reply-To: <20230814182903.37267-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Theodore Ts'o <tytso@mit.edu>: On Mon, 14 Aug 2023 11:29:00 -0700 you wrote:
 > This series makes unexpected casefold flags on inodes be consistently >
 rejected early on so that additional validation isn't needed later on > during
 r [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
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
X-Headers-End: 1qdE2j-0007WW-L0
Subject: Re: [f2fs-dev] [PATCH 0/3] Simplify rejection of unexpected
 casefold inode flag
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
Cc: linux-fsdevel@vger.kernel.org, krisman@suse.de, linux-ext4@vger.kernel.org,
 tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Theodore Ts'o <tytso@mit.edu>:

On Mon, 14 Aug 2023 11:29:00 -0700 you wrote:
> This series makes unexpected casefold flags on inodes be consistently
> rejected early on so that additional validation isn't needed later on
> during random filesystem operations.  For additional context, refer to
> the discussion on patch 1 of
> https://lore.kernel.org/linux-fsdevel/20230812004146.30980-1-krisman@suse.de/T/#u
> 
> Applies to v6.5-rc6
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/3] ext4: reject casefold inode flag without casefold feature
    https://git.kernel.org/jaegeuk/f2fs/c/8216776ccff6
  - [f2fs-dev,2/3] ext4: remove redundant checks of s_encoding
    https://git.kernel.org/jaegeuk/f2fs/c/b81427939590
  - [f2fs-dev,3/3] libfs: remove redundant checks of s_encoding
    https://git.kernel.org/jaegeuk/f2fs/c/af494af38580

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
