Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0567920C6B3
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Jun 2020 09:12:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jpRTx-0008Vy-Qt; Sun, 28 Jun 2020 07:12:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jpRTw-0008Vs-Ot
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 07:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/2SGt0htqOksGPFcju9hlQviTdMGiYbLCq9E73Vt32k=; b=UNJHtn1SBqW+qPrGMiCwkTEcP9
 oQGC8n4rPxd2LuWBUmgyUIb0R24iM89svRFrovReGJEP9/1YeaQaXntyLZJZQWcRyOr81R8UYqhOJ
 s+x8Y4U9ilHQYfWyFuWAYpQ0dZE3znfGzFJgxwTEW30BpQUUP87c3LbIbaeiQgYbZUzA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/2SGt0htqOksGPFcju9hlQviTdMGiYbLCq9E73Vt32k=; b=fW9QEWF2lqRy6xQPqJ09coDJMh
 MPBAuJLcYjFnP1HLhsARGoTpx6HvMqLSXy02NvIB+BHP1BL0++QDyMDrO3chgCqJ4sRcBMXTtIiL2
 +Ch5FqyzNiftT3fqaY8M2P87cLlZ9pnlf/BlajzwJ3acpOsh3s3gf6lDChwgzExaW9Pk=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jpRTs-003LUx-VK
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 07:12:04 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 888BC465839FCC418A56
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 28 Jun 2020 15:11:42 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sun, 28 Jun
 2020 15:11:37 +0800
To: Ilya Averyanov <averyanovin@gmail.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <CABi8O6Zqo=pMT63K+PUbvktpXd1oYGrVkHgn4=NS8uziZNKhiA@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4ee2866e-bcbf-1893-76f3-51e1e18ceaf3@huawei.com>
Date: Sun, 28 Jun 2020 15:11:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CABi8O6Zqo=pMT63K+PUbvktpXd1oYGrVkHgn4=NS8uziZNKhiA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jpRTs-003LUx-VK
Subject: Re: [f2fs-dev] possible circular locking dependency detected
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

Hi,

Could you please check that whether below commit has been merged?

dd973007bfef ("f2fs: set GFP_NOFS when moving inline dentries")

On 2020/6/26 21:56, Ilya Averyanov wrote:
> I can reproduce this WARNING if I run rsync -rtS -@2 --no-compress
> --no-i-r --info=progress
> 2 /mnt/f2fs/ /mnt/sd/
> where /mnt/f2fs/ is emmc card with f2fs and /mnt/sd/ external SD card.
> And in same time start create many files in /mnt/f2fs/
> 
> [ 1264.858858] WARNING: possible circular locking dependency detected
> [ 1264.865047] 5.4.31 #1 Not tainted
> [ 1264.868365] ------------------------------------------------------
> [ 1264.874549] kswapd0/86 is trying to acquire lock:
> [ 1264.879258] e93fab88 (sb_internal){.+.+}, at:
> f2fs_evict_inode+0x234/0x514 [f2fs]
> [ 1264.887012]
> [ 1264.887012] but task is already holding lock:
> [ 1264.892854] c0c270f8 (fs_reclaim){+.+.}, at: __fs_reclaim_acquire+0x0/0x40
> [ 1264.899750]
> [ 1264.899750] which lock already depends on the new lock.
> [ 1264.899750]
> [ 1264.907931]
> [ 1264.907931] the existing dependency chain (in reverse order) is:
> [ 1264.915416]
> [ 1264.915416] -> #2 (fs_reclaim){+.+.}:
> [ 1264.920570]        __alloc_pages_nodemask+0x1c8/0x1384
> [ 1264.925717]        pagecache_get_page+0x98/0x358
> [ 1264.930552]        f2fs_move_inline_dirents+0x44/0x838 [f2fs]
> [ 1264.936499]        f2fs_try_convert_inline_dir+0x10c/0x21c [f2fs]
> [ 1264.942786]        f2fs_rename2+0x3e8/0x1138 [f2fs]
> [ 1264.947678]        vfs_rename+0x210/0x7d4
> [ 1264.951696]        do_renameat2+0x470/0x4ec
> [ 1264.955887]        sys_rename+0x24/0x2c
> [ 1264.959730]        ret_fast_syscall+0x0/0x28
> [ 1264.964005]        0xb691d704
> [ 1264.966977]
> [ 1264.966977] -> #1 (&sbi->cp_rwsem){++++}:
> [ 1264.972670]        f2fs_truncate_blocks+0x2f8/0x6d8 [f2fs]
> [ 1264.978352]        f2fs_truncate+0x14c/0x2a4 [f2fs]
> [ 1264.983424]        f2fs_evict_inode+0x2e0/0x514 [f2fs]
> [ 1264.988574]        evict+0x9c/0x164
> [ 1264.992070]        do_unlinkat+0x190/0x2a8
> [ 1264.996172]        ret_fast_syscall+0x0/0x28
> [ 1265.000445]        0xb691d73c
> [ 1265.003415]
> [ 1265.003415] -> #0 (sb_internal){.+.+}:
> [ 1265.008659]        lock_acquire+0xd8/0x1f8
> [ 1265.012764]        __sb_start_write+0x110/0x210
> [ 1265.017495]        f2fs_evict_inode+0x234/0x514 [f2fs]
> [ 1265.022644]        evict+0x9c/0x164
> [ 1265.026142]        dispose_list+0x38/0x4c
> [ 1265.030162]        prune_icache_sb+0x5c/0x7c
> [ 1265.034438]        super_cache_scan+0x118/0x170
> [ 1265.038980]        shrink_slab.constprop.24+0x2b8/0x608
> [ 1265.044215]        shrink_node+0x42c/0x958
> [ 1265.048316]        kswapd+0x398/0xa04
> [ 1265.051986]        kthread+0x148/0x150
> [ 1265.055742]        ret_from_fork+0x14/0x20
> [ 1265.059842]        0x0
> [ 1265.062205]
> [ 1265.062205] other info that might help us debug this:
> [ 1265.062205]
> [ 1265.070214] Chain exists of:
> [ 1265.070214]   sb_internal --> &sbi->cp_rwsem --> fs_reclaim
> [ 1265.070214]
> [ 1265.080138]  Possible unsafe locking scenario:
> [ 1265.080138]
> [ 1265.086062]        CPU0                    CPU1
> [ 1265.090595]        ----                    ----
> [ 1265.095128]   lock(fs_reclaim);
> [ 1265.098276]                                lock(&sbi->cp_rwsem);
> [ 1265.104287]                                lock(fs_reclaim);
> [ 1265.109950]   lock(sb_internal);
> [ 1265.113183]
> [ 1265.113183]  *** DEADLOCK ***
> [ 1265.113183]
> [ 1265.119108] 3 locks held by kswapd0/86:
> [ 1265.122948]  #0: c0c270f8 (fs_reclaim){+.+.}, at:
> __fs_reclaim_acquire+0x0/0x40
> [ 1265.130273]  #1: c0c1ead0 (shrinker_rwsem){++++}, at:
> shrink_slab.constprop.24+0x38/0x608
> [ 1265.138467]  #2: e93fa87c (&type->s_umount_key#29){++++}, at:
> trylock_super+0x14/0x58
> [ 1265.146312]
> [ 1265.146312] stack backtrace:
> [ 1265.150679] CPU: 0 PID: 86 Comm: kswapd0 Not tainted 5.4.31 #1
> [ 1265.156518] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> [ 1265.163063] [<c01116f8>] (unwind_backtrace) from [<c010c3fc>]
> (show_stack+0x10/0x14)
> [ 1265.170820] [<c010c3fc>] (show_stack) from [<c07dc8b0>]
> (dump_stack+0xb4/0xe0)
> [ 1265.178059] [<c07dc8b0>] (dump_stack) from [<c01747b4>]
> (check_noncircular+0x1e4/0x1fc)
> [ 1265.186076] [<c01747b4>] (check_noncircular) from [<c0176dbc>]
> (__lock_acquire+0x15a8/0x25c4)
> [ 1265.194613] [<c0176dbc>] (__lock_acquire) from [<c017867c>]
> (lock_acquire+0xd8/0x1f8)
> [ 1265.202452] [<c017867c>] (lock_acquire) from [<c0269e4c>]
> (__sb_start_write+0x110/0x210)
> [ 1265.210755] [<c0269e4c>] (__sb_start_write) from [<bf2cd8c0>]
> (f2fs_evict_inode+0x234/0x514 [f2fs])
> [ 1265.220013] [<bf2cd8c0>] (f2fs_evict_inode [f2fs]) from
> [<c0286060>] (evict+0x9c/0x164)
> [ 1265.228033] [<c0286060>] (evict) from [<c0286160>] (dispose_list+0x38/0x4c)
> [ 1265.235005] [<c0286160>] (dispose_list) from [<c02871a0>]
> (prune_icache_sb+0x5c/0x7c)
> [ 1265.242847] [<c02871a0>] (prune_icache_sb) from [<c026a0bc>]
> (super_cache_scan+0x118/0x170)
> [ 1265.251214] [<c026a0bc>] (super_cache_scan) from [<c0215478>]
> (shrink_slab.constprop.24+0x2b8/0x608)
> [ 1265.260359] [<c0215478>] (shrink_slab.constprop.24) from
> [<c02193dc>] (shrink_node+0x42c/0x958)
> [ 1265.269065] [<c02193dc>] (shrink_node) from [<c021a4f8>] (kswapd+0x398/0xa04)
> [ 1265.276210] [<c021a4f8>] (kswapd) from [<c01461e4>] (kthread+0x148/0x150)
> [ 1265.283009] [<c01461e4>] (kthread) from [<c01010b4>]
> (ret_from_fork+0x14/0x20)
> [ 1265.290236] Exception stack(0xe8421fb0 to 0xe8421ff8)
> [ 1265.295297] 1fa0:                                     00000000
> 00000000 00000000 00000000
> [ 1265.303482] 1fc0: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [ 1265.311665] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
