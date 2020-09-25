Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD4C2794DA
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Sep 2020 01:42:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLxM9-0000y2-Dt; Fri, 25 Sep 2020 23:42:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1kLxM7-0000xk-QL
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 23:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t2Rfx6mldKzB6x94dI6EfYKXsEl9D2/HGt7ptWZ4RjA=; b=MmMxbUJNeczq4H9kT4/HL/YgwM
 tXXr2ZCYU8FGG3+eNvMLaURn83F7JBWNRmVeFb8OaeSOFZiP/fNRicC1bHY5uotZPS6ruVStJJ6eC
 ksMzNerETm7bO3aBD/JXo+HQ/fyHQiYj1M4s2685DEw/1NEjteD91cbjpuismLiN+MXM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t2Rfx6mldKzB6x94dI6EfYKXsEl9D2/HGt7ptWZ4RjA=; b=SKqZyYChifW3tdjbUbIoHADUZa
 9DlWdzhalIXaUeExqQ8UtCM/byFQnMdZyWO3CgClj6bpZJpmNscFk3jslXjr0yXkbEtSzSmFSoZNM
 jq4scTgPrCew+4RldcBDGrKMwAwNE+1i4v6KsOeZwKWLG1F9GjtyA8wP7GeXtLwhBWXE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kLxM3-008ULj-F0
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 23:42:23 +0000
Received: from [192.168.0.108] (unknown [49.65.245.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C25692086A;
 Fri, 25 Sep 2020 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601077326;
 bh=3kCVceXDX01WOddg2crYrZ9DLByiFCKMEKFeVfDj/Gw=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=JTCvxzL3mV3O0VR+dwoi4ylyKP6OMtYN/vd70+pA4VIFSKOr2jZ1n8m+JBgLDdaNq
 Qt67PehmYg9RazI9svmGjhksLE/BmRM1m8+NGi/VaH8oidSxMUsSqX/iaoR2qEwMsI
 7fh139318M2GiKuA6nLnnFfdvmNShuBMh7ulytD0=
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20200923084512.2947439-1-jaegeuk@kernel.org>
 <20200925232550.GB4136545@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <f1f04328-f5b3-a349-fe51-e341e5e3d4cb@kernel.org>
Date: Sat, 26 Sep 2020 07:42:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200925232550.GB4136545@google.com>
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kLxM3-008ULj-F0
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix slab leak of rpages pointer
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020-9-26 7:25, Jaegeuk Kim wrote:
> I missed the f2fs mailing list by gitconfig. :)
>
> On 09/23, Jaegeuk Kim wrote:
>> This fixes the below mem leak.
>>
>> [  130.157600] =============================================================================
>> [  130.159662] BUG f2fs_page_array_entry-252:16 (Tainted: G        W  O     ): Objects remaining in f2fs_page_array_entry-252:16 on __kmem_cache_shutdown()
>> [  130.162742] -----------------------------------------------------------------------------
>> [  130.162742]
>> [  130.164979] Disabling lock debugging due to kernel taint
>> [  130.166188] INFO: Slab 0x000000009f5a52d2 objects=22 used=4 fp=0x00000000ba72c3e9 flags=0xfffffc0010200
>> [  130.168269] CPU: 7 PID: 3560 Comm: umount Tainted: G    B   W  O      5.9.0-rc4+ #35
>> [  130.170019] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1 04/01/2014
>> [  130.171941] Call Trace:
>> [  130.172528]  dump_stack+0x74/0x9a
>> [  130.173298]  slab_err+0xb7/0xdc
>> [  130.174044]  ? kernel_poison_pages+0xc0/0xc0
>> [  130.175065]  ? on_each_cpu_cond_mask+0x48/0x90
>> [  130.176096]  __kmem_cache_shutdown.cold+0x34/0x141
>> [  130.177190]  kmem_cache_destroy+0x59/0x100
>> [  130.178223]  f2fs_destroy_page_array_cache+0x15/0x20 [f2fs]
>> [  130.179527]  f2fs_put_super+0x1bc/0x380 [f2fs]
>> [  130.180538]  generic_shutdown_super+0x72/0x110
>> [  130.181547]  kill_block_super+0x27/0x50
>> [  130.182438]  kill_f2fs_super+0x76/0xe0 [f2fs]
>> [  130.183448]  deactivate_locked_super+0x3b/0x80
>> [  130.184456]  deactivate_super+0x3e/0x50
>> [  130.185363]  cleanup_mnt+0x109/0x160
>> [  130.186179]  __cleanup_mnt+0x12/0x20
>> [  130.187003]  task_work_run+0x70/0xb0
>> [  130.187841]  exit_to_user_mode_prepare+0x18f/0x1b0
>> [  130.188917]  syscall_exit_to_user_mode+0x31/0x170
>> [  130.189989]  do_syscall_64+0x45/0x90
>> [  130.190828]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>> [  130.191986] RIP: 0033:0x7faf868ea2eb
>> [  130.192815] Code: 7b 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 90 f3 0f 1e fa 31 f6 e9 05 00 00 00 0f 1f 44 00 00 f3 0f 1e fa b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 75 7b 0c 00 f7 d8 64 89 01
>> [  130.196872] RSP: 002b:00007fffb7edb478 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
>> [  130.198494] RAX: 0000000000000000 RBX: 00007faf86a18204 RCX: 00007faf868ea2eb
>> [  130.201021] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000055971df71c50
>> [  130.203415] RBP: 000055971df71a40 R08: 0000000000000000 R09: 00007fffb7eda1f0
>> [  130.205772] R10: 00007faf86a04339 R11: 0000000000000246 R12: 000055971df71c50
>> [  130.208150] R13: 0000000000000000 R14: 000055971df71b38 R15: 0000000000000000
>> [  130.210515] INFO: Object 0x00000000a980843a @offset=744
>> [  130.212476] INFO: Allocated in page_array_alloc+0x3d/0xe0 [f2fs] age=1572 cpu=0 pid=3297
>> [  130.215030] 	__slab_alloc+0x20/0x40
>> [  130.216566] 	kmem_cache_alloc+0x2a0/0x2e0
>> [  130.218217] 	page_array_alloc+0x3d/0xe0 [f2fs]
>> [  130.219940] 	f2fs_init_compress_ctx+0x1f/0x40 [f2fs]
>> [  130.221736] 	f2fs_write_cache_pages+0x3db/0x860 [f2fs]
>> [  130.223591] 	f2fs_write_data_pages+0x2c9/0x300 [f2fs]
>> [  130.225414] 	do_writepages+0x43/0xd0
>> [  130.226907] 	__filemap_fdatawrite_range+0xd5/0x110
>> [  130.228632] 	filemap_write_and_wait_range+0x48/0xb0
>> [  130.230336] 	__generic_file_write_iter+0x18a/0x1d0
>> [  130.232035] 	f2fs_file_write_iter+0x226/0x550 [f2fs]
>> [  130.233737] 	new_sync_write+0x113/0x1a0
>> [  130.235204] 	vfs_write+0x1a6/0x200
>> [  130.236579] 	ksys_write+0x67/0xe0
>> [  130.237898] 	__x64_sys_write+0x1a/0x20
>> [  130.239309] 	do_syscall_64+0x38/0x90
>>
>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
