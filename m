Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 094BC33CFEF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Mar 2021 09:34:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lM59k-0005d4-Go; Tue, 16 Mar 2021 08:34:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lM59i-0005ck-TT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Mar 2021 08:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7LBxvnxyGfEE+rEV3OdPoxiMLyQRdqRQUDOv0vo28VE=; b=bA1hVNkggigBcd5vA9o4i8hhea
 8U5wMxIFNBf1fogJfEoB5z0CUFHBZVyJ2ZB1CW+hIetjA2aMJjMYdMpDiyA7L6mWp+LQdSY7w89OR
 ZevAsDfAmzeSXZtQuxM2HmeWXBc8e6bebT/9Mz6x9JqVIkWy2G6t966hU8ljhZ3Joz+A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7LBxvnxyGfEE+rEV3OdPoxiMLyQRdqRQUDOv0vo28VE=; b=PTyyeEYwbREt+ljTsIKVJ+DITc
 aRZkIZkk0e3R4Klk1EwoyLSbWpltdf5/TMrKr4GsgCH0xN+j2n756efWfkCGIDRaIDxjwaItxvGBP
 ZA80AEdcprox/CW0vKmK3F7OlIVHA0l451URjq2kLjUB1O15PBGStpcBXkUuyBaktZXU=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lM59b-00038H-Eg
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Mar 2021 08:34:22 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F063J5Gyfz8yYj;
 Tue, 16 Mar 2021 16:32:12 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 16 Mar
 2021 16:34:03 +0800
To: Sahitya Tummala <stummala@codeaurora.org>
References: <20210316045800.GB11637@xsang-OptiPlex-9020>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <834d5270-ab2e-bd6a-addc-28ae357f67ee@huawei.com>
Date: Tue, 16 Mar 2021 16:34:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210316045800.GB11637@xsang-OptiPlex-9020>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: github.io]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lM59b-00038H-Eg
Subject: Re: [f2fs-dev] [f2fs] ab2dbddfd0:
 BUG:kernel_NULL_pointer_dereference, address
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
Cc: 0day robot <lkp@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, lkp@lists.01.org,
 kernel test robot <oliver.sang@intel.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Sahitya,

Node manager was initialized after segment manager's initialization,
so f2fs_available_free_memory() called from issue_discard_thread()
may access invalid nm_i pointer, could you please check and fix
this case?

On 2021/3/16 12:58, kernel test robot wrote:
> 
> 
> Greeting,
> 
> FYI, we noticed the following commit (built with gcc-9):
> 
> commit: ab2dbddfd064f2078a7099e4d65cce54f5ef5e71 ("[PATCH v2] f2fs: allow to change discard policy based on cached discard cmds")
> url: https://github.com/0day-ci/linux/commits/Sahitya-Tummala/f2fs-allow-to-change-discard-policy-based-on-cached-discard-cmds/20210311-170257
> 
> 
> in testcase: ltp
> version: ltp-x86_64-14c1f76-1_20210315
> with following parameters:
> 
> 	disk: 1HDD
> 	fs: f2fs
> 	test: io
> 	ucode: 0x21
> 
> test-description: The LTP testsuite contains a collection of tools for testing the Linux kernel and related features.
> test-url: http://linux-test-project.github.io/
> 
> 
> on test machine: 4 threads Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz with 8G memory
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> 
> 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> 
> 
> [   38.378402] BUG: kernel NULL pointer dereference, address: 0000000000000010
> [   38.378526] #PF: supervisor read access in kernel mode
> [   38.378610] #PF: error_code(0x0000) - not-present page
> [   38.378694] PGD 0 P4D 0
> [   38.378739] Oops: 0000 [#1] SMP PTI
> [   38.378799] CPU: 2 PID: 2436 Comm: f2fs_discard-8: Not tainted 5.12.0-rc2-00001-gab2dbddfd064 #1
> [   38.378940] Hardware name: Hewlett-Packard p6-1451cx/2ADA, BIOS 8.15 02/05/2013
> [   38.379057] RIP: 0010:f2fs_available_free_memory (kbuild/src/consumer/fs/f2fs/node.c:96) f2fs
> [ 38.379237] Code: 04 00 00 48 0f af d6 48 be c3 f5 28 5c 8f c2 f5 28 48 c1 ea 02 48 89 d0 48 f7 e6 48 c1 ea 03 48 39 ca 0f 97 c0 e9 af fe ff ff <41> 8b 54 24 10 49 63 8d 94 20 00 00 48 0f af d6 48 be c3 f5 28 5c
> All code
> ========
>     0:	04 00                	add    $0x0,%al
>     2:	00 48 0f             	add    %cl,0xf(%rax)
>     5:	af                   	scas   %es:(%rdi),%eax
>     6:	d6                   	(bad)
>     7:	48 be c3 f5 28 5c 8f 	movabs $0x28f5c28f5c28f5c3,%rsi
>     e:	c2 f5 28
>    11:	48 c1 ea 02          	shr    $0x2,%rdx
>    15:	48 89 d0             	mov    %rdx,%rax
>    18:	48 f7 e6             	mul    %rsi
>    1b:	48 c1 ea 03          	shr    $0x3,%rdx
>    1f:	48 39 ca             	cmp    %rcx,%rdx
>    22:	0f 97 c0             	seta   %al
>    25:	e9 af fe ff ff       	jmpq   0xfffffffffffffed9
>    2a:*	41 8b 54 24 10       	mov    0x10(%r12),%edx		<-- trapping instruction
>    2f:	49 63 8d 94 20 00 00 	movslq 0x2094(%r13),%rcx
>    36:	48 0f af d6          	imul   %rsi,%rdx
>    3a:	48                   	rex.W
>    3b:	be c3 f5 28 5c       	mov    $0x5c28f5c3,%esi
> 
> Code starting with the faulting instruction
> ===========================================
>     0:	41 8b 54 24 10       	mov    0x10(%r12),%edx
>     5:	49 63 8d 94 20 00 00 	movslq 0x2094(%r13),%rcx
>     c:	48 0f af d6          	imul   %rsi,%rdx
>    10:	48                   	rex.W
>    11:	be c3 f5 28 5c       	mov    $0x5c28f5c3,%esi
> [   38.379531] RSP: 0018:ffffc900006f3dd8 EFLAGS: 00010246
> [   38.379617] RAX: 0000000000000106 RBX: ffff888213317000 RCX: 00000000001e9c8c
> [   38.379731] RDX: ffff88810c84b430 RSI: 00000000001e9c8c RDI: ffff88810c84b540
> [   38.379844] RBP: 0000000000000006 R08: 0000000000000106 R09: ffff88821fb2bc58
> [   38.379958] R10: 000000000000032e R11: ffff88821fb2a144 R12: 0000000000000000
> [   38.380071] R13: ffff88820b7e4000 R14: 000000000000ea60 R15: 0000000000000000
> [   38.380185] FS:  0000000000000000(0000) GS:ffff88821fb00000(0000) knlGS:0000000000000000
> [   38.380315] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   38.380408] CR2: 0000000000000010 CR3: 000000021e00a003 CR4: 00000000001706e0
> [   38.380522] Call Trace:
> [   38.380619] ? del_timer_sync (kbuild/src/consumer/kernel/time/timer.c:1394)
> [   38.380686] ? prepare_to_wait_event (kbuild/src/consumer/kernel/sched/wait.c:323 (discriminator 15))
> [   38.380762] ? __next_timer_interrupt (kbuild/src/consumer/kernel/time/timer.c:1816)
> [   38.380841] issue_discard_thread (kbuild/src/consumer/fs/f2fs/segment.c:1759 (discriminator 1)) f2fs
> [   38.380937] ? finish_wait (kbuild/src/consumer/kernel/sched/wait.c:403)
> [   38.380997] ? __issue_discard_cmd (kbuild/src/consumer/fs/f2fs/segment.c:1722) f2fs
> [   38.381094] kthread (kbuild/src/consumer/kernel/kthread.c:292)
> [   38.381151] ? kthread_park (kbuild/src/consumer/kernel/kthread.c:245)
> [   38.381213] ret_from_fork (kbuild/src/consumer/arch/x86/entry/entry_64.S:300)
> [   38.381276] Modules linked in: dm_mod f2fs netconsole btrfs blake2b_generic xor zstd_compress raid6_pq libcrc32c sd_mod t10_pi sg intel_rapl_msr intel_rapl_common i915 x86_pkg_temp_thermal intel_powerclamp coretemp intel_gtt crct10dif_pclmul crc32_pclmul drm_kms_helper crc32c_intel usb_storage ghash_clmulni_intel syscopyarea rapl ahci libahci sysfillrect sysimgblt fb_sys_fops ipmi_devintf ipmi_msghandler intel_cstate drm libata intel_uncore mei_me mei video ip_tables
> [   38.381939] CR2: 0000000000000010
> [   38.381996] ---[ end trace d47b1e3f3cb425e8 ]---
> [   38.382072] RIP: 0010:f2fs_available_free_memory (kbuild/src/consumer/fs/f2fs/node.c:96) f2fs
> [ 38.382188] Code: 04 00 00 48 0f af d6 48 be c3 f5 28 5c 8f c2 f5 28 48 c1 ea 02 48 89 d0 48 f7 e6 48 c1 ea 03 48 39 ca 0f 97 c0 e9 af fe ff ff <41> 8b 54 24 10 49 63 8d 94 20 00 00 48 0f af d6 48 be c3 f5 28 5c
> All code
> ========
>     0:	04 00                	add    $0x0,%al
>     2:	00 48 0f             	add    %cl,0xf(%rax)
>     5:	af                   	scas   %es:(%rdi),%eax
>     6:	d6                   	(bad)
>     7:	48 be c3 f5 28 5c 8f 	movabs $0x28f5c28f5c28f5c3,%rsi
>     e:	c2 f5 28
>    11:	48 c1 ea 02          	shr    $0x2,%rdx
>    15:	48 89 d0             	mov    %rdx,%rax
>    18:	48 f7 e6             	mul    %rsi
>    1b:	48 c1 ea 03          	shr    $0x3,%rdx
>    1f:	48 39 ca             	cmp    %rcx,%rdx
>    22:	0f 97 c0             	seta   %al
>    25:	e9 af fe ff ff       	jmpq   0xfffffffffffffed9
>    2a:*	41 8b 54 24 10       	mov    0x10(%r12),%edx		<-- trapping instruction
>    2f:	49 63 8d 94 20 00 00 	movslq 0x2094(%r13),%rcx
>    36:	48 0f af d6          	imul   %rsi,%rdx
>    3a:	48                   	rex.W
>    3b:	be c3 f5 28 5c       	mov    $0x5c28f5c3,%esi
> 
> Code starting with the faulting instruction
> ===========================================
>     0:	41 8b 54 24 10       	mov    0x10(%r12),%edx
>     5:	49 63 8d 94 20 00 00 	movslq 0x2094(%r13),%rcx
>     c:	48 0f af d6          	imul   %rsi,%rdx
>    10:	48                   	rex.W
>    11:	be c3 f5 28 5c       	mov    $0x5c28f5c3,%esi
> 
> 
> To reproduce:
> 
>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp install                job.yaml  # job file is attached in this email
>          bin/lkp split-job --compatible job.yaml
>          bin/lkp run                    compatible-job.yaml
> 
> 
> 
> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Center
> https://lists.01.org/hyperkitty/list/lkp@lists.01.org       Intel Corporation
> 
> Thanks,
> Oliver Sang
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
