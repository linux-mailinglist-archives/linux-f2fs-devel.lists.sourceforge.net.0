Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DFF73594E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jun 2023 16:15:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qBFf9-0003gs-57;
	Mon, 19 Jun 2023 14:15:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qBFf7-0003gm-B4
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 14:15:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rUf6UnCW4BYVCJyQi3X5Zz+qD3xMSYHUanNn6NhmMWU=; b=CHyIvNnHq0dCXMYSTH2c7Foxgr
 I9L/WaqfluCuUt3lg5U8JlL1bH6YPdakonHMSlZoZ3YQLx5MKOxxchrvLeGktfHnb6LRiLyrN4lKB
 smC+vo3vQY+Y/3Q2kR/YBml6TH11EL5rvb9vo9ngd5lYeakJMZaQVYhJuPVOGGpSOPdw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rUf6UnCW4BYVCJyQi3X5Zz+qD3xMSYHUanNn6NhmMWU=; b=MWRDLVsEAe2EwR7Tp9VO5C1/aw
 3IqjSjr9fj6QeYplEufJueuSm8Wj+eW5xY93nGxJ7YUs5taetML5DBTYO+QxZC4IVPrOpqeLF6RJP
 8TQgTNJ1uNBy817Ugg+82006xkt6IM80XV71PcDOiMAzY6yKnlLIqpcLxEzqYgfWa9Zk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qBFf5-008j6N-Rw for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 14:15:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 723B360C86
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Jun 2023 14:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2BAC433C8;
 Mon, 19 Jun 2023 14:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687184113;
 bh=n3VZ8rOufXryBc7cFDnC5xwNcqIDjCReNAO3eGfBduk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=REs2Q4/RDty9J5EMd8OvOxBZhwehPfFkI8Ta0JbO+IfYtF0qfjTP8uA2tiv2Hvu+g
 w9jRrGZzOmXmgqasLRaIcn/SDK+uJwfMllilG8KeO52+EejNgvuMPm4VaVc9XIAuwe
 ZqoWhXkKjMckheKEAja4ANS76evGonrbXEtZkh3vAKoYzlac8dWDfBRdMRMgzx+MRE
 whv0Hg1qIScG8OMwHwdkmDm5ISOOoe/z3mxYuJtEqxPpEThmsajD1aTIGYHetx/apR
 XueS151+79QPuA0o8ROlOAj4H4thA9WFDT6IC6uoJNoiPNayMwbDZ958RS7hcIf/Cg
 XHeRVWp7akNVA==
Message-ID: <db6e12ea-c143-a8d9-6dc6-1a0a99886ef3@kernel.org>
Date: Mon, 19 Jun 2023 22:15:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>
References: <20230529104709.2560779-1-chao@kernel.org>
 <20230616060342.GB181948@sol.localdomain>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230616060342.GB181948@sol.localdomain>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/16 14:03, Eric Biggers wrote: > Hi Chao, Eric,
 Thanks for the report, let me check this. 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qBFf5-008j6N-Rw
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid mmap vs
 set_compress_option case
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/6/16 14:03, Eric Biggers wrote:
> Hi Chao,

Eric,

Thanks for the report, let me check this.

Thanks,

> 
> On Mon, May 29, 2023 at 06:47:09PM +0800, Chao Yu wrote:
>> Compression option in inode should not be changed after they have
>> been used, however, it may happen in below race case:
>>
>> Thread A				Thread B
>> - f2fs_ioc_set_compress_option
>>   - check f2fs_is_mmap_file()
>>   - check get_dirty_pages()
>>   - check F2FS_HAS_BLOCKS()
>> 					- f2fs_file_mmap
>> 					 - set_inode_flag(FI_MMAP_FILE)
>> 					- fault
>> 					 - do_page_mkwrite
>> 					  - f2fs_vm_page_mkwrite
>> 					  - f2fs_get_block_locked
>> 					 - fault_dirty_shared_page
>> 					  - set_page_dirty
>>   - update i_compress_algorithm
>>   - update i_log_cluster_size
>>   - update i_cluster_size
>>
>> Avoid such race condition by covering f2fs_file_mmap() w/ inode lock,
>> meanwhile add mmap file check condition in f2fs_may_compress() as well.
>>
>> Fixes: e1e8debec656 ("f2fs: add F2FS_IOC_SET_COMPRESS_OPTION ioctl")
>> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> This patch causes the following deadlock report:
> 
> [    9.622928] ======================================================
> [    9.623484] WARNING: possible circular locking dependency detected
> [    9.624054] 6.4.0-rc1-00039-g18a87f3eaef5 #12 Tainted: G                T
> [    9.624672] ------------------------------------------------------
> [    9.625242] xfs_io/2440 is trying to acquire lock:
> [    9.625682] ffff888103a2c888 (&sb->s_type->i_mutex_key#11){+.+.}-{3:3}, at: f2fs_file_mmap+0x53/0xc0
> [    9.626523]
> [    9.626523] but task is already holding lock:
> [    9.627058] ffff888103d0e8c0 (&mm->mmap_lock){++++}-{3:3}, at: vm_mmap_pgoff+0x72/0x1c0
> [    9.627797]
> [    9.627797] which lock already depends on the new lock.
> [    9.627797]
> [    9.628528]
> [    9.628528] the existing dependency chain (in reverse order) is:
> [    9.629210]
> [    9.629210] -> #1 (&mm->mmap_lock){++++}-{3:3}:
> [    9.629761]        lock_acquire+0xcb/0x2d0
> [    9.630147]        __might_fault+0x6f/0xa0
> [    9.630526]        _copy_to_user+0x27/0x90
> [    9.630915]        fiemap_fill_next_extent+0xbe/0x130
> [    9.631378]        f2fs_fiemap+0x223/0x5c0
> [    9.631757]        do_vfs_ioctl+0x6d5/0x860
> [    9.632150]        __x64_sys_ioctl+0x4a/0xd0
> [    9.632547]        do_syscall_64+0x39/0x90
> [    9.632935]        entry_SYSCALL_64_after_hwframe+0x63/0xcd
> [    9.633444]
> [    9.633444] -> #0 (&sb->s_type->i_mutex_key#11){+.+.}-{3:3}:
> [    9.634104]        check_prev_add+0x93/0xbd0
> [    9.634500]        __lock_acquire+0xc27/0x11e0
> [    9.634918]        lock_acquire+0xcb/0x2d0
> [    9.635297]        down_write+0x3d/0x100
> [    9.635660]        f2fs_file_mmap+0x53/0xc0
> [    9.636053]        mmap_region+0x20b/0x920
> [    9.636433]        do_mmap+0x345/0x570
> [    9.636781]        vm_mmap_pgoff+0xa1/0x1c0
> [    9.637179]        ksys_mmap_pgoff+0xa0/0xc0
> [    9.637574]        __x64_sys_mmap+0x32/0x60
> [    9.637970]        do_syscall_64+0x39/0x90
> [    9.638348]        entry_SYSCALL_64_after_hwframe+0x63/0xcd
> [    9.638864]
> [    9.638864] other info that might help us debug this:
> [    9.638864]
> [    9.639582]  Possible unsafe locking scenario:
> [    9.639582]
> [    9.640128]        CPU0                    CPU1
> [    9.640545]        ----                    ----
> [    9.640971]   lock(&mm->mmap_lock);
> [    9.641298]                                lock(&sb->s_type->i_mutex_key#11);
> [    9.641953]                                lock(&mm->mmap_lock);
> [    9.642500]   lock(&sb->s_type->i_mutex_key#11);
> [    9.642930]
> [    9.642930]  *** DEADLOCK ***
> [    9.642930]
> [    9.643469] 1 lock held by xfs_io/2440:
> [    9.643830]  #0: ffff888103d0e8c0 (&mm->mmap_lock){++++}-{3:3}, at: vm_mmap_pgoff+0x72/0x1c0
> [    9.644600]
> [    9.644600] stack backtrace:
> [    9.645012] CPU: 0 PID: 2440 Comm: xfs_io Tainted: G                T  6.4.0-rc1-00039-g18a87f3eaef5 #12
> [    9.645869] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS Arch Linux 1.16.2-1-1 04/01/2014
> [    9.646697] Call Trace:
> [    9.646933]  <TASK>
> [    9.647137]  dump_stack_lvl+0x4e/0x90
> [    9.647483]  dump_stack+0x14/0x20
> [    9.647800]  print_circular_bug+0x2eb/0x440
> [    9.648188]  check_noncircular+0x124/0x140
> [    9.648568]  check_prev_add+0x93/0xbd0
> [    9.648923]  ? add_chain_cache+0x10e/0x470
> [    9.649304]  __lock_acquire+0xc27/0x11e0
> [    9.649670]  lock_acquire+0xcb/0x2d0
> [    9.650013]  ? f2fs_file_mmap+0x53/0xc0
> [    9.650372]  down_write+0x3d/0x100
> [    9.650696]  ? f2fs_file_mmap+0x53/0xc0
> [    9.651059]  f2fs_file_mmap+0x53/0xc0
> [    9.651402]  mmap_region+0x20b/0x920
> [    9.651739]  do_mmap+0x345/0x570
> [    9.652053]  vm_mmap_pgoff+0xa1/0x1c0
> [    9.652397]  ksys_mmap_pgoff+0xa0/0xc0
> [    9.652747]  __x64_sys_mmap+0x32/0x60
> [    9.653098]  do_syscall_64+0x39/0x90
> [    9.653432]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> [    9.653904] RIP: 0033:0x7f1366f92b62
> [    9.654237] Code: e4 e8 b2 4b 01 00 66 90 41 f7 c1 ff 0f 00 00 75 27 55 48 89 fd 53 89 cb 48 85 ff 74 3b 41 89 da 48 89 ef 4
> [    9.655918] RSP: 002b:00007ffd5de38f08 EFLAGS: 00000246 ORIG_RAX: 0000000000000009
> [    9.656601] RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007f1366f92b62
> [    9.657256] RDX: 0000000000000001 RSI: 0000000000020000 RDI: 0000000000000000
> [    9.657909] RBP: 0000000000000000 R08: 0000000000000003 R09: 0000000000000000
> [    9.658558] R10: 0000000000000001 R11: 0000000000000246 R12: 0000000000000000
> [    9.659215] R13: 0000000000000000 R14: 0000000000000001 R15: 0000000000020000
> [    9.659867]  </TASK>
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
