Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC75F6A5061
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Feb 2023 02:02:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pWoNb-0001YP-Cy;
	Tue, 28 Feb 2023 01:02:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pWoNZ-0001Y9-Iw
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Feb 2023 01:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=65E2QounQvIsZ5erALfXxYnHzJlblone+m77tx+MA+g=; b=R0FuwSmxdY/iObBbzmyCclJOIN
 CTeWqiBAw4Q+YhaQ8fsMCuh/wUPO1qLgk4rzbJIBQH4LB45O+WIz+9OVa6129kPFiOz3f7jNe/hhA
 hnl01W3lOKDMvx8G7/q5xUpeNYAbaZC5O7YfBCZxV9TVZu7FnSQWNdzaUAcYx5CeIKDo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=65E2QounQvIsZ5erALfXxYnHzJlblone+m77tx+MA+g=; b=hgHNrkR24kTZ4ee/2U6iYXHXPF
 v0ye8DeQOm38dZZBBV6NZMfhX3HkkjPa88hADyjjJweNWX9XIMIArmvcH/VmKjOguSRG6BhwsdXMV
 YO5zJGnszzmb//t+yX9dqpUmWTBcPzANFVLHpLUD6AuntuWWvm2PAeVARSNfbuMME+Xw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pWoNW-0001fZ-9v for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Feb 2023 01:02:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CCC27B80DD8;
 Tue, 28 Feb 2023 01:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3309EC433A0;
 Tue, 28 Feb 2023 01:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677546115;
 bh=84Xvp168sokHCBrmD6E23XwAok9TjE5uZlT8zL1cCUU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=cNsRvhiueD336eCgeTzlzL7CN3QR418HrwVSOd7U/zCliL7nqvIsJnUeAOsp8UOw5
 hiLt68AbPwaZc/2mRXOgQPTPuYtLP7vjKKuBDGH1Ob9Eo3AcQ2R2Pur5VBT5XHYZWf
 5QUOasmUUwZ3yRAGneBG3sRZck43cSAXv8d7yKFkuKWmdWJkd7AQ10aIUAa2yg76OE
 wVC2TNmlRYuLYhYb+1V8IasY//WsjgMIE8bRIoLn5UuT3F7ZCYsr91bgX5k5aZhWD/
 JgNbITP619mqy6l+mslm9DtMj8lrl+R5TK0UWsbgnO2FtoZOilvek311LPP2Kw7y9d
 2vNeTy3RQPm3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0AC4CE50D60; Tue, 28 Feb 2023 01:01:55 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167754611503.27916.4447364691434133144.git-patchwork-notify@kernel.org>
Date: Tue, 28 Feb 2023 01:01:55 +0000
References: <20230116233424.65657-1-ebiggers@kernel.org>
In-Reply-To: <20230116233424.65657-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Eric Biggers <ebiggers@google.com>: On Mon, 16 Jan 2023 15:34:24 -0800 you
 wrote: > From: Eric Biggers <ebiggers@google.com> > > fscrypt.git is being
 renamed to linux.git, so update MAINTAINERS > accordingly. (The reasons for
 the rename [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pWoNW-0001fZ-9v
Subject: Re: [f2fs-dev] [PATCH] MAINTAINERS: update fscrypt git repo
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Eric Biggers <ebiggers@google.com>:

On Mon, 16 Jan 2023 15:34:24 -0800 you wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> fscrypt.git is being renamed to linux.git, so update MAINTAINERS
> accordingly.  (The reasons for the rename are to match what I'm doing
> for the new fsverity repo, which also involves the branch names changing
> to be clearer; and to avoid ambiguity with userspace tools.)
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] MAINTAINERS: update fscrypt git repo
    https://git.kernel.org/jaegeuk/f2fs/c/31e1be62abde

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
