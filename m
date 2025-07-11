Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F14B021CB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Jul 2025 18:30:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z3405MhJ8y4+pi8Azn8ieZx+AySg8zKClkd4m0w/x9E=; b=Z1SFazcWAuWZHBK9UesMMJFVkQ
	In6Xf87sre4dUcYJH/IHsM15hbpALYqEJd58QEyJd6RCUkIRd3tb10uSYQSu3O1+Syg/iKp3boBeq
	JZce318jRoaUvri5UbKX7Bvlj8r/ok6vzcyrhGiZnQNgaJVxuONkXwbukvwibREvHQqY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uaGdQ-0008Ix-Ew;
	Fri, 11 Jul 2025 16:30:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uaGdO-0008Hp-31
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 16:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f44+H63Iszh7vad6bRH6ZKFcQVPsydJ7nghWHp21P8Y=; b=kW+TxVpOhYSXxemdt14OlG0207
 hdtJJDm5SFiSmJqE392+UNyBzZzG1S7M7Gjpn0eUDT058CigQ5QaODx9DHflKrCr1Ts0LB/Nq98zy
 NWGNI/kzDpakPQUl5k+mlV6UpmOdHFj8uNkO1H6fUNQcHbPs3PjMG+eaTI+8u8eX82lk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=f44+H63Iszh7vad6bRH6ZKFcQVPsydJ7nghWHp21P8Y=; b=c
 U9N03mdvL7bfxXjCOZlvSo0JkSrKvdDKVBaxIwvKtj1oUE/EPKh6lIcjJSEjqC8q4KoxT/M9rJmFw
 NBoB1xtUcXa7rTt9v998sRleRnotCFg4NR6WMgh0Ff+OhWXuvn0v+s4oRaGF0ub2+a3Si7P8IMmBp
 V3AC9tiMVR3/xnEY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uaGdI-0006U8-Am for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 16:29:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F0AD75C7217
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Jul 2025 16:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFEA6C4CEF5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Jul 2025 16:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752251385;
 bh=SRUKRAvTEawtMB0f0J9RVmZMwDjr1LTefptEqmCJqaU=;
 h=Subject:From:Date:To:From;
 b=hDvF7CHAcMI85b5VHBzJ3ybYASD29Ju7+gYignnSsG4KIvdg9N0RFboGtT0oHje8G
 iO43lXvD14s0Xdyal81unXffCyh/tp60JS+hTebgwvLmS57vErULwfJThGN+U5QJZX
 xWicFhDGYuinRZLT2KkzM93gZO0pxouaavHt1wnuYAakIBd9t7779wqleunPbxlR6d
 p/dYtaID5ftkUeNMBRGtX686n/Ab2xfO0JyPnjdvG/6AUAh2H3gJbMK3vrbp3H/5N6
 VDrITEK66hD6O8xXB6mAd//ONFyC1z3Gm5ChPm0s2w7SjUfw515/LX513Mb6hH6Jzh
 H0YALefDQKtLQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 F36D2383B275 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Jul 2025 16:30:07 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175225140689.2328592.5756188271598933605.git-patchwork-summary@kernel.org>
Date: Fri, 11 Jul 2025 16:30:06 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: f2fs: new mount API
 conversion Submitter: Hongbo Li <lihongbo22@huawei.com> Committer: Jaegeuk
 Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project/f2fs/list/?series=981007
 [...] Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uaGdI-0006U8-Am
Subject: [f2fs-dev] Patchwork summary for: f2fs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Series: f2fs: new mount API conversion
  Submitter: Hongbo Li <lihongbo22@huawei.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=981007
  Lore link: https://lore.kernel.org/r/20250710121415.628398-1-lihongbo22@huawei.com
    Patches: [f2fs-dev,v5,1/7] f2fs: Add fs parameter specifications for mount options
             [f2fs-dev,v5,2/7] f2fs: move the option parser into handle_mount_opt
             [f2fs-dev,v5,3/7] f2fs: Allow sbi to be NULL in f2fs_printk
             [f2fs-dev,v5,4/7] f2fs: Add f2fs_fs_context to record the mount options
             [f2fs-dev,v5,5/7] f2fs: separate the options parsing and options checking
             [f2fs-dev,v5,6/7] f2fs: introduce fs_context_operation structure
             [f2fs-dev,v5,7/7] f2fs: switch to the new mount api

Series: f2fs: new mount API conversion
  Submitter: Hongbo Li <lihongbo22@huawei.com>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=879437
  Lore link: https://lore.kernel.org/r/20240814023912.3959299-1-lihongbo22@huawei.com
    Patches: [f2fs-dev,1/9] f2fs: Add fs parameter specifications for mount options
             [f2fs-dev,7/9] f2fs: introduce fs_context_operation structure

Series: f2fs: new mount API conversion
  Submitter: Eric Sandeen <sandeen@redhat.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=955373
  Lore link: https://lore.kernel.org/r/20250420154647.1233033-1-sandeen@redhat.com
    Patches: [f2fs-dev,1/7] f2fs: Add fs parameter specifications for mount options
             [f2fs-dev,3/7] f2fs: Allow sbi to be NULL in f2fs_printk
             [f2fs-dev,6/7] f2fs: introduce fs_context_operation structure

Series: [f2fs-dev,V3,1/7] f2fs: Add fs parameter specifications for mount options
  Submitter: Eric Sandeen <sandeen@redhat.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=956653
  Lore link: https://lore.kernel.org/r/20250423170926.76007-2-sandeen@redhat.com
    Patches: [f2fs-dev,V3,1/7] f2fs: Add fs parameter specifications for mount options
             [f2fs-dev,V3,3/7] f2fs: Allow sbi to be NULL in f2fs_printk
             [f2fs-dev,V3,6/7] f2fs: introduce fs_context_operation structure


Total patches: 15

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
