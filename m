Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 428EBD3AAC8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 14:54:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUWNcuxjKVJz6UCidk9TDlomFzljOBOusEK/YAmJMU0=; b=Gxu8NlZTkaMgYt+UpEe3iCXr0D
	6WwP23D3wyna10uP227PWrmcFA72jM1nIinnEl5DVKSICJBuy2zSIN0qd2sIw0k3PeGZG480D+f2q
	UGoIetG9RGdx9qMSZ1HiX9jLrMWB4NEJcr0r6EInBVKui92f0OxUOeQNyoPybM0kbcrw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhpi2-0001X5-G2;
	Mon, 19 Jan 2026 13:54:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vhpi0-0001Ww-Qg
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 13:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8zZuK0Ck3plBogbuYkXkCU3YAwMoSjfpdBL98ixgAp0=; b=iyQlVH8RlEu5wG6SuVyYxQdUAM
 6mrkX6UYROK55c/iLh8+HpZWfQArYIgpJJ/z+fgnLLLbCwLYLdF1No489vehpCimZCE3YIwfDRq46
 KqczeK5xaajXsGesK+Acu9+1aa52aQYOJZkaedax6DiqpBfY9XhcYEfvdzWDVEfI2lbI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8zZuK0Ck3plBogbuYkXkCU3YAwMoSjfpdBL98ixgAp0=; b=dzunYS3tciBUFgbfhcCHSN4haC
 pF6+lc01+aekN3UnoKWJXtlnECbvXaWspcyi7CnynzLmef4urDlWk7q1i+eZNcaUk7er0Hm8w7lHi
 n8lzV7Qtc+cfkSLlQ0dn1IOwAST7rFVzPwrEUb4dpGUqvd6RDDyunozzAH8yfqkRkt2M=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhpi1-0005qt-4f for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 13:54:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D43FF43C7A;
 Mon, 19 Jan 2026 13:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD1B7C116C6;
 Mon, 19 Jan 2026 13:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768830855;
 bh=K15sz4wyCclDkJnhASr6DGuh8D11wAa1YBNtFs/ZFF4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ovGMdkWfDd9mNeJUjwzjqaIhkRtyw02y1OCCz0DXfYBeKcruAtaYoDWGX6gtlTVzO
 m9ZUw6MldAugM9Mbhs1E+9fdXRh4aKKOuSwgqLmPbNXqyjCSWz3DJ3hrK3cAGLkaqb
 TvUQP6REqhGkFLb6bhjAO18jDyj3yPO2bWjQh8CHjGvBU3D1xo1UPR1C53Kf7L0FQf
 7SMDMi/yAZm7Qc9G/0sHh2UWu2/EvzFO2vzHs2vadpP3kASJeQHiZ9x4geZ1WPaAmr
 84XFYGOjSmmhZTvr3Du9rFZ1yfv83GzWoheYo6AhB0nbYpDIkfrzSi0jlm1rfZBxiA
 IKGBlouCcPcuA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B58053A54A38; Mon, 19 Jan 2026 13:50:46 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176883064552.1419958.12451126631540238696.git-patchwork-notify@kernel.org>
Date: Mon, 19 Jan 2026 13:50:45 +0000
References: <20260113062229.4062-1-chao@kernel.org>
In-Reply-To: <20260113062229.4062-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 13 Jan 2026 14:22:29 +0800 you
 wrote: > Xiaolong Guo reported a f2fs bug in bugzilla [1] > > [1]
 https://bugzilla.kernel.org/show_bug.cgi?id=220951
 > > Quoted: > > "When using stress-ng's swap [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhpi1-0005qt-4f
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid mapping wrong physical
 block for swapfile
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
Cc: daehojeong@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, guoxiaolong2008@gmail.com,
 jaegeuk@kernel.org, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 13 Jan 2026 14:22:29 +0800 you wrote:
> Xiaolong Guo reported a f2fs bug in bugzilla [1]
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=220951
> 
> Quoted:
> 
> "When using stress-ng's swap stress test on F2FS filesystem with kernel 6.6+,
> the system experiences data corruption leading to either:
> 1 dm-verity corruption errors and device reboot
> 2 F2FS node corruption errors and boot hangs
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to avoid mapping wrong physical block for swapfile
    https://git.kernel.org/jaegeuk/f2fs/c/5c145c03188b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
