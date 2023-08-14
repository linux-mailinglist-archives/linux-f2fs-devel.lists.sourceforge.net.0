Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5B577C1BE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Aug 2023 22:50:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVeWN-0006E9-0Y;
	Mon, 14 Aug 2023 20:50:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qVeWK-0006E2-F2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 20:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ond0/Oi8zL8/bptZnMmLXSEBCsFk5/1YYjzlC3JMf+I=; b=nRQWqCrp1O3KPRVRey6LSZ3V1i
 eOUoLi3LZgr+Y20T3Uo9nAkmhxkiPYPr8lsYJpoQuSU8x7MXzxklhSHZo+LhvrbFP+Ya/A7EHWXOc
 03AxSyvNJ3tB9q21GIAeX/5I8zc2otNlq1ZHvOpuos8FyRJF+eztYdnSglGTSKyeRjJ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ond0/Oi8zL8/bptZnMmLXSEBCsFk5/1YYjzlC3JMf+I=; b=IJVA/gy5i6EQZulpRRquGxKvSn
 +B4jUtfa4i4bn3GRuC+iTpZvtKAM2juXEJ3xPdMjWp4SPEkpJgLW4GcTx5RhTyJVDXIPrr06/osRk
 sfPIDUKOh5wEGMSv6x+uXSBaj4OmCGtcGrICuFMPeNsG8BRkfljmOuCgQV0MHVsT4Gn8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qVeWJ-005ns6-GK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 20:50:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 97E956481D;
 Mon, 14 Aug 2023 20:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D4E7C43395;
 Mon, 14 Aug 2023 20:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692046222;
 bh=HyxFxhf4E18n+HFsMV0CE+FpVTTOA6JA7lROJ6EF848=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=CcwPvzKVwTQr3lffWFUCBr5l2Edfo/5qK3NmwWP68ZS5RO/Z8vEMcMPJ7IjaBv1rG
 3qJORsZ4DFZq4bFDDQhvSduLSFAI4w5Ro/vBbt1iYIT/JMHc7U3fiBeHffLMbiwcV+
 iL9meFKFQdIzLslhRcg9GpEguJHF0G5HyfUbRsVYsE1ohLog/MeLo+lK47J+gnOlXa
 vdzZiC0h+E9DaZy5JpjUJLsABlqO+ex4pK9Mvs7MEKAIv32ZTzp2i9fJeInh6tWAJH
 EacQS8eYzc7CdyPcuWtX+Hiq6v4uOGwpDwAgIbeXxRd6tTQ1BaWPpQSdyO2AvW+YMJ
 a1D6cyvZGI9EQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 601CAE93B37; Mon, 14 Aug 2023 20:50:22 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169204622238.5033.822780908633322584.git-patchwork-notify@kernel.org>
Date: Mon, 14 Aug 2023 20:50:22 +0000
References: <20230720112953.3764050-1-chao@kernel.org>
In-Reply-To: <20230720112953.3764050-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Thu, 20 Jul 2023 19:29:53 +0800 you
 wrote: > syzbot reports a f2fs bug as below: > > UBSAN:
 array-index-out-of-bounds
 in fs/f2fs/f2fs.h:3275:19 > index 1409 is out of range for type '__le32[923]'
 ( [...] Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qVeWJ-005ns6-GK
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: fix to do sanity check on
 extent cache correctly"
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
Cc: jaegeuk@kernel.org, syzbot+601018296973a481f302@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Thu, 20 Jul 2023 19:29:53 +0800 you wrote:
> syzbot reports a f2fs bug as below:
> 
> UBSAN: array-index-out-of-bounds in fs/f2fs/f2fs.h:3275:19
> index 1409 is out of range for type '__le32[923]' (aka 'unsigned int[923]')
> Call Trace:
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0x1e7/0x2d0 lib/dump_stack.c:106
>  ubsan_epilogue lib/ubsan.c:217 [inline]
>  __ubsan_handle_out_of_bounds+0x11c/0x150 lib/ubsan.c:348
>  inline_data_addr fs/f2fs/f2fs.h:3275 [inline]
>  __recover_inline_status fs/f2fs/inode.c:113 [inline]
>  do_read_inode fs/f2fs/inode.c:480 [inline]
>  f2fs_iget+0x4730/0x48b0 fs/f2fs/inode.c:604
>  f2fs_fill_super+0x640e/0x80c0 fs/f2fs/super.c:4601
>  mount_bdev+0x276/0x3b0 fs/super.c:1391
>  legacy_get_tree+0xef/0x190 fs/fs_context.c:611
>  vfs_get_tree+0x8c/0x270 fs/super.c:1519
>  do_new_mount+0x28f/0xae0 fs/namespace.c:3335
>  do_mount fs/namespace.c:3675 [inline]
>  __do_sys_mount fs/namespace.c:3884 [inline]
>  __se_sys_mount+0x2d9/0x3c0 fs/namespace.c:3861
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] Revert "f2fs: fix to do sanity check on extent cache correctly"
    https://git.kernel.org/jaegeuk/f2fs/c/958ccbbf1ce7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
