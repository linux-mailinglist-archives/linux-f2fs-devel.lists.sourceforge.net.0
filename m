Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C360220B309
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jun 2020 16:00:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jootg-0005KT-WC; Fri, 26 Jun 2020 14:00:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <averyanovin@gmail.com>) id 1jootf-0005KM-Qu
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jun 2020 14:00:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j/Iw0/VkSM/2+stNtYPB9RfbQ0lgKDws3gf2U/Nx0w0=; b=fc5Y/2NyuZLAvbtDolH70+6gMU
 2vJUvIfBY5AyZ08C74/3LaFf3C6FIvl/0EfuPg4CQz0j6YOKdukJmrTMC5dYj2Gdq6Oj4y97l8UeM
 J4q7E5F4WeGeN1926+TRV6rzNTzwFvKdAkUCEv9zZavHG8fOUgJmvtGOoQBNHPKdEdec=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=j/Iw0/VkSM/2+stNtYPB9RfbQ0lgKDws3gf2U/Nx0w0=; b=c
 xYPCae9LQenMBoeXfON7xCpz42rPB5yzTUnPtHhEwGKsHOyTkOm1ea7G0CtyN65fsqE5j8cW9ieCt
 VKnUZW7ZdVLZxHcdP9996Ur0Hwg6OhVSeAm/kCHaGgNnb0QIl6/AzuM5qmmIpH9gaaTHt5jDBHs4a
 LXn2Y7g5vJ6GLu44=;
Received: from mail-lj1-f172.google.com ([209.85.208.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1joote-0022eD-Cc
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jun 2020 14:00:03 +0000
Received: by mail-lj1-f172.google.com with SMTP id s9so10407788ljm.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Jun 2020 07:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=j/Iw0/VkSM/2+stNtYPB9RfbQ0lgKDws3gf2U/Nx0w0=;
 b=M1F1lxfSomjOGjf9/mpNyYSvDJ0Vhh+Ia+H+Sx+nW64axul+rd4y2nesKkkiSJtYkS
 7GdAYbWBXSpYQCN7Zwp0dCuDR1HMLHSkcQCFQu2gDl0+OUEUizHjJWAtz5UheHi/U43T
 ybcE0OhxIUvzeLjAB0/EB1t/e67MMUdiEBxvfhyOjTzCQ9PJBEmPPU/ggdFxgaCmd9qn
 qm+BF5WL5Q4G6wgz7/lu/10IgqVc5M8JdgsxdAoF+8IQvJ/daZtgrYTD+UorEBBM+6fk
 Gg2U00f+wm/6A3JwrThRmrcg85+Q8pGA5muzJRxSJ5da4GqP1kdDdJfmDftoqeohWxEF
 7oXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=j/Iw0/VkSM/2+stNtYPB9RfbQ0lgKDws3gf2U/Nx0w0=;
 b=G0v62vA3RD8YGgeZjESmvNNGKKpPwy7MDQhFcHru2/ADGnfDy0xTF/yJpYWPLcO9uL
 VErYrD9jUbvZdC28vKrFXSMhtnmGuA4Udou53/pP/axu9y0M8MdTXsBLgZFbvnyuYLfy
 oa3P6/U3+EJwDwgIIPNXTisfqz5pgKwyPBCZBWXtkp53GZj0Xdw5GzndUIAHIe31GYWb
 ttUnR5OTSbZVfpEQzO1uFccrHa3VLEeOMYh/Phz/y89t1ROmqXxKflod5rZUg8034aXn
 c8EK8YkX5Acj/o7lavERcG5LYReSIOuQkpN7/tmnawfNM76agdhLY35kkdhTALd1VBML
 BDgQ==
X-Gm-Message-State: AOAM532QISK44WrmASUJ2FhDpv54ZpfACMDMehUUEdkNnsfFY3qXAWI1
 +6ZdRb92q/8aPACte8gYkmypgSXvzxsbDwA0I1QnNHdK
X-Google-Smtp-Source: ABdhPJyYQUu6qAct+8xw9wFOkBENjVo2rwNab+FaRHxAVqHsfNOyv0egRA4LYVtZ/vOkS00tzXr6vQX/CBvnekM4z2w=
X-Received: by 2002:a2e:9089:: with SMTP id l9mr1464415ljg.305.1593179995476; 
 Fri, 26 Jun 2020 06:59:55 -0700 (PDT)
MIME-Version: 1.0
From: Ilya Averyanov <averyanovin@gmail.com>
Date: Fri, 26 Jun 2020 16:56:49 +0300
Message-ID: <CABi8O6Zqo=pMT63K+PUbvktpXd1oYGrVkHgn4=NS8uziZNKhiA@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (averyanovin[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.172 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.172 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1joote-0022eD-Cc
Subject: [f2fs-dev] possible circular locking dependency detected
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I can reproduce this WARNING if I run rsync -rtS -@2 --no-compress
--no-i-r --info=progress
2 /mnt/f2fs/ /mnt/sd/
where /mnt/f2fs/ is emmc card with f2fs and /mnt/sd/ external SD card.
And in same time start create many files in /mnt/f2fs/

[ 1264.858858] WARNING: possible circular locking dependency detected
[ 1264.865047] 5.4.31 #1 Not tainted
[ 1264.868365] ------------------------------------------------------
[ 1264.874549] kswapd0/86 is trying to acquire lock:
[ 1264.879258] e93fab88 (sb_internal){.+.+}, at:
f2fs_evict_inode+0x234/0x514 [f2fs]
[ 1264.887012]
[ 1264.887012] but task is already holding lock:
[ 1264.892854] c0c270f8 (fs_reclaim){+.+.}, at: __fs_reclaim_acquire+0x0/0x40
[ 1264.899750]
[ 1264.899750] which lock already depends on the new lock.
[ 1264.899750]
[ 1264.907931]
[ 1264.907931] the existing dependency chain (in reverse order) is:
[ 1264.915416]
[ 1264.915416] -> #2 (fs_reclaim){+.+.}:
[ 1264.920570]        __alloc_pages_nodemask+0x1c8/0x1384
[ 1264.925717]        pagecache_get_page+0x98/0x358
[ 1264.930552]        f2fs_move_inline_dirents+0x44/0x838 [f2fs]
[ 1264.936499]        f2fs_try_convert_inline_dir+0x10c/0x21c [f2fs]
[ 1264.942786]        f2fs_rename2+0x3e8/0x1138 [f2fs]
[ 1264.947678]        vfs_rename+0x210/0x7d4
[ 1264.951696]        do_renameat2+0x470/0x4ec
[ 1264.955887]        sys_rename+0x24/0x2c
[ 1264.959730]        ret_fast_syscall+0x0/0x28
[ 1264.964005]        0xb691d704
[ 1264.966977]
[ 1264.966977] -> #1 (&sbi->cp_rwsem){++++}:
[ 1264.972670]        f2fs_truncate_blocks+0x2f8/0x6d8 [f2fs]
[ 1264.978352]        f2fs_truncate+0x14c/0x2a4 [f2fs]
[ 1264.983424]        f2fs_evict_inode+0x2e0/0x514 [f2fs]
[ 1264.988574]        evict+0x9c/0x164
[ 1264.992070]        do_unlinkat+0x190/0x2a8
[ 1264.996172]        ret_fast_syscall+0x0/0x28
[ 1265.000445]        0xb691d73c
[ 1265.003415]
[ 1265.003415] -> #0 (sb_internal){.+.+}:
[ 1265.008659]        lock_acquire+0xd8/0x1f8
[ 1265.012764]        __sb_start_write+0x110/0x210
[ 1265.017495]        f2fs_evict_inode+0x234/0x514 [f2fs]
[ 1265.022644]        evict+0x9c/0x164
[ 1265.026142]        dispose_list+0x38/0x4c
[ 1265.030162]        prune_icache_sb+0x5c/0x7c
[ 1265.034438]        super_cache_scan+0x118/0x170
[ 1265.038980]        shrink_slab.constprop.24+0x2b8/0x608
[ 1265.044215]        shrink_node+0x42c/0x958
[ 1265.048316]        kswapd+0x398/0xa04
[ 1265.051986]        kthread+0x148/0x150
[ 1265.055742]        ret_from_fork+0x14/0x20
[ 1265.059842]        0x0
[ 1265.062205]
[ 1265.062205] other info that might help us debug this:
[ 1265.062205]
[ 1265.070214] Chain exists of:
[ 1265.070214]   sb_internal --> &sbi->cp_rwsem --> fs_reclaim
[ 1265.070214]
[ 1265.080138]  Possible unsafe locking scenario:
[ 1265.080138]
[ 1265.086062]        CPU0                    CPU1
[ 1265.090595]        ----                    ----
[ 1265.095128]   lock(fs_reclaim);
[ 1265.098276]                                lock(&sbi->cp_rwsem);
[ 1265.104287]                                lock(fs_reclaim);
[ 1265.109950]   lock(sb_internal);
[ 1265.113183]
[ 1265.113183]  *** DEADLOCK ***
[ 1265.113183]
[ 1265.119108] 3 locks held by kswapd0/86:
[ 1265.122948]  #0: c0c270f8 (fs_reclaim){+.+.}, at:
__fs_reclaim_acquire+0x0/0x40
[ 1265.130273]  #1: c0c1ead0 (shrinker_rwsem){++++}, at:
shrink_slab.constprop.24+0x38/0x608
[ 1265.138467]  #2: e93fa87c (&type->s_umount_key#29){++++}, at:
trylock_super+0x14/0x58
[ 1265.146312]
[ 1265.146312] stack backtrace:
[ 1265.150679] CPU: 0 PID: 86 Comm: kswapd0 Not tainted 5.4.31 #1
[ 1265.156518] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[ 1265.163063] [<c01116f8>] (unwind_backtrace) from [<c010c3fc>]
(show_stack+0x10/0x14)
[ 1265.170820] [<c010c3fc>] (show_stack) from [<c07dc8b0>]
(dump_stack+0xb4/0xe0)
[ 1265.178059] [<c07dc8b0>] (dump_stack) from [<c01747b4>]
(check_noncircular+0x1e4/0x1fc)
[ 1265.186076] [<c01747b4>] (check_noncircular) from [<c0176dbc>]
(__lock_acquire+0x15a8/0x25c4)
[ 1265.194613] [<c0176dbc>] (__lock_acquire) from [<c017867c>]
(lock_acquire+0xd8/0x1f8)
[ 1265.202452] [<c017867c>] (lock_acquire) from [<c0269e4c>]
(__sb_start_write+0x110/0x210)
[ 1265.210755] [<c0269e4c>] (__sb_start_write) from [<bf2cd8c0>]
(f2fs_evict_inode+0x234/0x514 [f2fs])
[ 1265.220013] [<bf2cd8c0>] (f2fs_evict_inode [f2fs]) from
[<c0286060>] (evict+0x9c/0x164)
[ 1265.228033] [<c0286060>] (evict) from [<c0286160>] (dispose_list+0x38/0x4c)
[ 1265.235005] [<c0286160>] (dispose_list) from [<c02871a0>]
(prune_icache_sb+0x5c/0x7c)
[ 1265.242847] [<c02871a0>] (prune_icache_sb) from [<c026a0bc>]
(super_cache_scan+0x118/0x170)
[ 1265.251214] [<c026a0bc>] (super_cache_scan) from [<c0215478>]
(shrink_slab.constprop.24+0x2b8/0x608)
[ 1265.260359] [<c0215478>] (shrink_slab.constprop.24) from
[<c02193dc>] (shrink_node+0x42c/0x958)
[ 1265.269065] [<c02193dc>] (shrink_node) from [<c021a4f8>] (kswapd+0x398/0xa04)
[ 1265.276210] [<c021a4f8>] (kswapd) from [<c01461e4>] (kthread+0x148/0x150)
[ 1265.283009] [<c01461e4>] (kthread) from [<c01010b4>]
(ret_from_fork+0x14/0x20)
[ 1265.290236] Exception stack(0xe8421fb0 to 0xe8421ff8)
[ 1265.295297] 1fa0:                                     00000000
00000000 00000000 00000000
[ 1265.303482] 1fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[ 1265.311665] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
