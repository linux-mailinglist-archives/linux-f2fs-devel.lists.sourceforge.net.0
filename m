Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B17F66A5062
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Feb 2023 02:02:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pWoNa-0001YF-2D;
	Tue, 28 Feb 2023 01:02:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pWoNY-0001Y2-Cz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Feb 2023 01:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hODw3IP01ME9yRZ+HMsiTgqNMbPZvcw8qjKF98A5oFY=; b=H6fW5M8gO7hYW69UQnq5Hp+0BJ
 my92L1EksOpvO1P9kdb7/GvkwfgU8/CGJr2f+Kq61tLE1Za46RTtJ6pHi/BdmeGtAcSOCDv7y8u3W
 uc41N1W7vTZ8vShw2m6QaNmf3Vqhsnoi7HDFdS8SvyveP3FRRIV87Bz1HfGg06aTj60c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hODw3IP01ME9yRZ+HMsiTgqNMbPZvcw8qjKF98A5oFY=; b=gg5MXZLG3/eHjUFEp1N9HaXiJB
 +M10fY+x0AFx4V5Y9AdPflZe+gJrqVvesNqq1ngf8rJBW7/wAW+3TzHWZV5LbGT8FiZXiDflXXtb2
 xHjUbPicylNM7ydySO6GGolF35IVI6uQD/rVNudqGz1m9urXE/JR+YPzqGvx5tAdqPIw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pWoNV-0056AF-4b for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Feb 2023 01:02:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B8C0C60F83;
 Tue, 28 Feb 2023 01:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26477C4339C;
 Tue, 28 Feb 2023 01:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677546115;
 bh=GjKuzdb4uP02dWcsVKBFNOoh1YCehKLSlNBQ+sAkvDU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=VvLwYFhmpm5uOu8hBSEIfqD//WOvfe6k9S1qZvLHwTW8BSPY/5VzZdIah1KMh/NrY
 /muCIXkVhH5bg4Hz0qNE42WG3kCHdh8GNbrr+ZjN0X/kBJjphlLBJEZin5kasznNoj
 kWYOipnTkRdmTtmORrdESxJzlUrars286olVWqTQ+TMmxmi/WN1yb9zwrxhbUZoM5J
 8TBiNay35e+fxCurNFSJU0r59d8w8IMiQYZSX3LIVhcuOLAVwWnula1x0tj0VSJdK3
 bqwjRpGlDatnwCnUHTxZlJekLFshv0R3rDFGCW/1zsrFkQ0mO8WE61IOQLosjGpMWW
 Sf7t4EA4lG9uw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 03E83E524D2; Tue, 28 Feb 2023 01:01:55 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167754611501.27916.12033201555755310755.git-patchwork-notify@kernel.org>
Date: Tue, 28 Feb 2023 01:01:55 +0000
References: <20230208062107.199831-1-ebiggers@kernel.org>
In-Reply-To: <20230208062107.199831-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Eric Biggers <ebiggers@google.com>: On Tue, 7 Feb 2023 22:21:02 -0800 you
 wrote: > This series eliminates the call to fscrypt_destroy_keyring() from
 > __put_super(), which is causing confusion because it looks like (but >
 actually isn't [...] 
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
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pWoNV-0056AF-4b
Subject: Re: [f2fs-dev] [PATCH 0/5] Add the test_dummy_encryption key
 on-demand
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, torvalds@linux-foundation.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Eric Biggers <ebiggers@google.com>:

On Tue,  7 Feb 2023 22:21:02 -0800 you wrote:
> This series eliminates the call to fscrypt_destroy_keyring() from
> __put_super(), which is causing confusion because it looks like (but
> actually isn't) a sleep-in-atomic bug.  See the thread "block: sleeping
> in atomic warnings", i.e.
> https://lore.kernel.org/linux-fsdevel/CAHk-=wg6ohuyrmLJYTfEpDbp2Jwnef54gkcpZ3-BYgy4C6UxRQ@mail.gmail.com
> and its responses.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/5] fscrypt: add the test dummy encryption key on-demand
    https://git.kernel.org/jaegeuk/f2fs/c/60e463f0be98
  - [f2fs-dev,2/5] ext4: stop calling fscrypt_add_test_dummy_key()
    https://git.kernel.org/jaegeuk/f2fs/c/7959eb19e4a3
  - [f2fs-dev,3/5] f2fs: stop calling fscrypt_add_test_dummy_key()
    https://git.kernel.org/jaegeuk/f2fs/c/1ad2a626762d
  - [f2fs-dev,4/5] fs/super.c: stop calling fscrypt_destroy_keyring() from __put_super()
    https://git.kernel.org/jaegeuk/f2fs/c/ec64036e6863
  - [f2fs-dev,5/5] fscrypt: clean up fscrypt_add_test_dummy_key()
    https://git.kernel.org/jaegeuk/f2fs/c/097d7c1fcb8d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
