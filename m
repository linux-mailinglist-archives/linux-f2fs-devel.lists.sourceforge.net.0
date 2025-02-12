Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BA6A31C80
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Feb 2025 04:00:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ti2zD-0000ho-TX;
	Wed, 12 Feb 2025 03:00:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1ti2zA-0000hh-Su
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Feb 2025 03:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8Oba+HTaJCgLk06g8kikxdRs3qo3BQ/Ju8DiOaK42NY=; b=ILkDIaWTwPkpf5QfU+WuwcJ3hC
 v4gU6yaRAOFFCC0S7hIjbRQ7lNbdLt7PVXxR4sqZYSe6Ejf9yML0BNCjQIIsJ6ESktEGwL7fX9GJC
 4v29JTZMyVClMUbHr65owq+7syghXnapntJj3I4TGfxLdZwVUYGOmrC0s0uNe+xkkots=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8Oba+HTaJCgLk06g8kikxdRs3qo3BQ/Ju8DiOaK42NY=; b=Td3nttkZit90UbIdKs7FKIeZS3
 CSR+PKVYA9VtveNvX6BjjVzX7jG2Hd7iVO4z7OQRRHpg9ZKy6Wd5RW0JXLtygRTfY9mk4o7wustV6
 fQ4auKJIAmJU4me25IzStfdoyWIQ4Xj0i+HCmMmsB8oE2VyO/4pDkhbCAGQEsRl+q/Yc=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ti2z7-0002CF-P1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Feb 2025 03:00:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 439EEA406C6;
 Wed, 12 Feb 2025 02:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A75BC4CEDD;
 Wed, 12 Feb 2025 03:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739329210;
 bh=s51PwjYiXgxoVGujUd7KagMqrOmjYUloowPDYEhHEn8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=J4R6BsEsFngMhxMHInJf6ec0sVv19DPhPjwg0Wt2PslFHmUB6Haf2TvsznD/oZCnO
 FNoGw8X4V1yPGnLY4T4RiGjvHaDvUf/ac+VIwUhNhySEulK0S3jtm+L/UK3L9uWStJ
 kqHvAH8Yt/g3YNPc4uZ5u6Cw27ykbTqM3CzID6/g+t7bS8k7T3XomW4IDOdRoWhDyX
 OPtZtvQDheUf7qJsNaWIoGYUxadrLbY3uKOR5RcEdojt9iomd9KcP3DqKPHsfD633O
 qXSkNF3ffbPEzR0l5VGrTHUWYTI5bZzwy7xcC8EGkzcoT/I50cMDpQvzbwRrbQM41n
 cGbDBfI7xG+PQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 710FB380AAFF; Wed, 12 Feb 2025 03:00:40 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <173932923927.82998.635511827116437277.git-patchwork-notify@kernel.org>
Date: Wed, 12 Feb 2025 03:00:39 +0000
References: <20250211071725.457343-1-chao@kernel.org>
In-Reply-To: <20250211071725.457343-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -4.0 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 11 Feb 2025 15:17:25 +0800 you
 wrote: > From: Leo Stone <leocstone@gmail.com> > > The syzbot reproducer
 mounts
 a f2fs image, then tries to unlink an > existing file. However, the unlinked
 file [...] 
 Content analysis details:   (-4.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ti2z7-0002CF-P1
Subject: Re: [f2fs-dev] [PATCH v3 RESEND] f2fs: add check for deleted inode
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, leocstone@gmail.com,
 syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 11 Feb 2025 15:17:25 +0800 you wrote:
> From: Leo Stone <leocstone@gmail.com>
> 
> The syzbot reproducer mounts a f2fs image, then tries to unlink an
> existing file. However, the unlinked file already has a link count of 0
> when it is read for the first time in do_read_inode().
> 
> Add a check to sanity_check_inode() for i_nlink == 0.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3,RESEND] f2fs: add check for deleted inode
    https://git.kernel.org/jaegeuk/f2fs/c/6e3019906688

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
