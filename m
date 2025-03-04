Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1465A4E7CD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Mar 2025 18:10:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tpVmd-0001Qi-H9;
	Tue, 04 Mar 2025 17:10:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1tpVmc-0001QV-Bl
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Mar 2025 17:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DaIPObirBqJHo7IGqze3YGI7Mva5HqDpfjG8mkHCqSg=; b=lkA4ozC/VxiOFCh74Jx0DTh5nf
 V1t6zxK7vUtesKYh8cdxdhxf+agPk44Kd/UYuFD2rUdUqeXxklBwCtRYFXVjh3vnbtoqpGazkT2cb
 ST7Ry2ixaIji8CGYkxJl4dgWnhZ7il0ZgFUQ9zdMfaWzmhujdfA4vQF5pLp2d/ZStNQ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DaIPObirBqJHo7IGqze3YGI7Mva5HqDpfjG8mkHCqSg=; b=GoEBO30gya2oIqEvzexxIF1VQz
 Y+2GC2EFtSRJEwq1qH/IBgtgPS4eqLMghJIuJFIwcB8qBceaRSP/RIlNSeztKmJE/+nvEKYjYvweA
 LbDKxcDifg3xwXyMRVOJLARoWKclM17wg9Yl7oOnKJtdxKO9nNNXY73Q3+1ndzwkUG6Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tpVmc-0004nY-GM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Mar 2025 17:10:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4FA305C4645;
 Tue,  4 Mar 2025 17:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82FEC4CEE5;
 Tue,  4 Mar 2025 17:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741108212;
 bh=WWUDy4hRLXd6xsZfc/ZyszaaktyeH+JXKR4MtvSr5Ds=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BjD8hFeMnQQCkogqz88dd79fqRCaUmhcB00T8MDRipDwEKPTpmIsWM5JWeWC9LDUx
 GKVnkKxct1nIW5L9hA+f3CcCVtSIHZXlWrmmwLcysPgzjIj44fGw0wj69yh4NDx/y5
 ThWU0QkuKtHi1dB4oTGOA6T85Vdb/7rjIKhAECf9JF5cU5K5Hs739WVHGlM5uGx0RU
 UNNdMwpt0wySI/zdiyAEtQrnyCmTCbKWMF+Unp6/Juloxg0i+cfBiDj/VzuSSDmu9V
 w8kSBcvQLxaiHyIZdSIqcbD/1ZqS15cQvtuL2pOREalm1Gge80LRI9YNcHWU8aG3is
 RqNEcsfT/LU/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB24C380AA7F; Tue,  4 Mar 2025 17:10:46 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174110824573.224349.9408350967320704453.git-patchwork-notify@kernel.org>
Date: Tue, 04 Mar 2025 17:10:45 +0000
References: <20250303034738.1355927-1-chao@kernel.org>
In-Reply-To: <20250303034738.1355927-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 3 Mar 2025 11:47:38 +0800 you wrote:
 > syzbot reports an UBSAN issue as below: > > [ cut here ] > UBSAN:
 array-index-out-of-bounds
 in fs/f2fs/node.h:381:10 > index 1844 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tpVmc-0004nY-GM
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid out-of-bounds access in
 f2fs_truncate_inode_blocks()
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
Cc: syzbot+6653f10281a1badc749e@syzkaller.appspotmail.com, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon,  3 Mar 2025 11:47:38 +0800 you wrote:
> syzbot reports an UBSAN issue as below:
> 
> ------------[ cut here ]------------
> UBSAN: array-index-out-of-bounds in fs/f2fs/node.h:381:10
> index 18446744073709550692 is out of range for type '__le32[5]' (aka 'unsigned int[5]')
> CPU: 0 UID: 0 PID: 5318 Comm: syz.0.0 Not tainted 6.14.0-rc3-syzkaller-00060-g6537cfb395f3 #0
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
>  ubsan_epilogue lib/ubsan.c:231 [inline]
>  __ubsan_handle_out_of_bounds+0x121/0x150 lib/ubsan.c:429
>  get_nid fs/f2fs/node.h:381 [inline]
>  f2fs_truncate_inode_blocks+0xa5e/0xf60 fs/f2fs/node.c:1181
>  f2fs_do_truncate_blocks+0x782/0x1030 fs/f2fs/file.c:808
>  f2fs_truncate_blocks+0x10d/0x300 fs/f2fs/file.c:836
>  f2fs_truncate+0x417/0x720 fs/f2fs/file.c:886
>  f2fs_file_write_iter+0x1bdb/0x2550 fs/f2fs/file.c:5093
>  aio_write+0x56b/0x7c0 fs/aio.c:1633
>  io_submit_one+0x8a7/0x18a0 fs/aio.c:2052
>  __do_sys_io_submit fs/aio.c:2111 [inline]
>  __se_sys_io_submit+0x171/0x2e0 fs/aio.c:2081
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f238798cde9
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: fix to avoid out-of-bounds access in f2fs_truncate_inode_blocks()
    https://git.kernel.org/jaegeuk/f2fs/c/e6494977bd4a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
