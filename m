Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1D5B40E80
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Sep 2025 22:20:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3rOIQ96T3DdBVJhs1m0cHUED8TrxB43m/LYMtSY0zs=; b=JdFPC0PzkVc/SKe7UnpDKLhjyk
	H6EqVz+Tr8K+5TufWujZN6MQy9lTEPY2XqgnZ00tCimVuZQBrWks2jsN627oals4p9ziabIlR4hT4
	uu5g/KNtmhNArodYezsQnOSs23JWW0UN1pkJYTcL3i9I0s1PYaGhQu1ZRZTLbG12tvIw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1utXUK-0006bR-IJ;
	Tue, 02 Sep 2025 20:20:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1utXUI-0006bG-Am
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Sep 2025 20:20:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6qYRMuuIY6GmHzjGyY5yjPdMru4bSDrs/BK1//N4D64=; b=FvubFAT28e7g6KldDhGogc8r39
 n3eJyN17qJa5L7bUVjhRmSkb8DAB9/LdI68xAVhyraVqnLT6w2ZdLZea39ntlgtum4vVvuI2WO/qv
 g+FKHQse7DuVFEVURYdg2jhIteGv2THcVEPi/L1cdPl4YTKoJxjA6EVXiV4J+FBw6MD0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6qYRMuuIY6GmHzjGyY5yjPdMru4bSDrs/BK1//N4D64=; b=GUUJIa09aRDAUU0wpDFA5kEt3N
 414CyEuD0ORVXkbiZeZ8RUtd6aY+Di1cXU7u7O9Qv+y7CdroDdFOS6vJqSzZmY7T2ztjnw6njshnq
 zKfVTb/V7sDfB5GlLAqKVGVLmyE2p/sjFhbnL2D/Fw24beqVsaJy6ud0BsxdkdYZy9e4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1utXUH-0004B9-Pr for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Sep 2025 20:20:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3B7A16022A;
 Tue,  2 Sep 2025 20:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C849C4CEF8;
 Tue,  2 Sep 2025 20:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756844407;
 bh=dYWMczR//YCOS9zBgbUp4tAMn84V2mawXfAbvifUB2o=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=BfA3IKiuAEuc9Xn/ecePZhyebbRQmKblTLutQv0AFSKAYqZHwnC5xPkva9szEW4lu
 rmDHQ9NZxpZn5vkszZXSlCQvNOeIXSOAcgq8Dl5yyTPqxhsytn4UaFCdJnbonWoM9w
 FfowdKTUvL8IB+oK2WSr0b4Spd1QPbVBpJEzhg/sidKLCFpbkaSf5SkU//VADDalMs
 5PSucvbazQRG/5sgl1yzBaKdlXUfI2xIVkNOkgX2dcFhdmW0+5opkePXa17eKUYytT
 J9iyeoR23ITRvfkFy4eiwgrPkLgK8USrXv+5DnSJTthxJL6pHqG0SBDomyldCBERTU
 jCEb8KM532ofA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADE05383BF64; Tue,  2 Sep 2025 20:20:13 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175684441250.425353.3302301690844852179.git-patchwork-notify@kernel.org>
Date: Tue, 02 Sep 2025 20:20:12 +0000
References: <20250818020939.3529802-1-chao@kernel.org>
In-Reply-To: <20250818020939.3529802-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 18 Aug 2025 10:09:38 +0800 you
 wrote: > syzbot reported a f2fs bug as below: > > Oops: gen[ 107.736417][
 T5848] Oops: general protection fault, probably for non-canonical address
 0xdffffc00000 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1utXUH-0004B9-Pr
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix to avoid NULL pointer
 dereference in f2fs_check_quota_consistency()
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
 lihongbo22@huawei.com, linux-kernel@vger.kernel.org,
 syzbot+d371efea57d5aeab877b@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 18 Aug 2025 10:09:38 +0800 you wrote:
> syzbot reported a f2fs bug as below:
> 
> Oops: gen[  107.736417][ T5848] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
> KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> CPU: 1 UID: 0 PID: 5848 Comm: syz-executor263 Tainted: G        W           6.17.0-rc1-syzkaller-00014-g0e39a731820a #0 PREEMPT_{RT,(full)}
> RIP: 0010:strcmp+0x3c/0xc0 lib/string.c:284
> Call Trace:
>  <TASK>
>  f2fs_check_quota_consistency fs/f2fs/super.c:1188 [inline]
>  f2fs_check_opt_consistency+0x1378/0x2c10 fs/f2fs/super.c:1436
>  __f2fs_remount fs/f2fs/super.c:2653 [inline]
>  f2fs_reconfigure+0x482/0x1770 fs/f2fs/super.c:5297
>  reconfigure_super+0x224/0x890 fs/super.c:1077
>  do_remount fs/namespace.c:3314 [inline]
>  path_mount+0xd18/0xfe0 fs/namespace.c:4112
>  do_mount fs/namespace.c:4133 [inline]
>  __do_sys_mount fs/namespace.c:4344 [inline]
>  __se_sys_mount+0x317/0x410 fs/namespace.c:4321
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: fix to avoid NULL pointer dereference in f2fs_check_quota_consistency()
    https://git.kernel.org/jaegeuk/f2fs/c/930a9a6ee8e7
  - [f2fs-dev,2/2] f2fs: fix to allow removing qf_name
    https://git.kernel.org/jaegeuk/f2fs/c/ff11d8701b77

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
