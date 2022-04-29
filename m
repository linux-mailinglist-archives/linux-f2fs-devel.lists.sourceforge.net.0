Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A995141D9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Apr 2022 07:41:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkJNz-00063C-Vx; Fri, 29 Apr 2022 05:41:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nkJNy-000636-8R
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 05:41:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qkURhUACtnnqG/gLEyW8fuUawZ3bVFFC+2ZooOgXPF8=; b=eBY227Z1UjingDeMkztelkLT4O
 IuLLBSMexcsMURRlKY9kZPYEniwhQwijO1Snoco7AwcDSqFm9t3jpTvaz1etDF6w7A7jRjVSPg9Gl
 rPl1ypwyTeAFeNuLqPx5EPJHuYqg5irMbYmZuO+7tGYy13WlXIT6nkvHB4JB4E9f2Hz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qkURhUACtnnqG/gLEyW8fuUawZ3bVFFC+2ZooOgXPF8=; b=P
 CNlS2ym6eVjEqVvMTfpOk8N6xwal+DboVlQFDwgyUhQAFE6EyljxnwdErcm89ZrvJFxTxfbrmx7Mv
 kyItX/z28UDq36PrOUCdZeDIVijOFC1dnBNhyvDMZAVFlOECYEKILEgaKsLrXoq3fe2gdL7etdtKZ
 NvCiSI2isVMy+Vdo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkJNv-00DYiI-Ex
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 05:41:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E5B8612C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 Apr 2022 05:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E03CC385A7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 Apr 2022 05:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651210889;
 bh=sxyUAU2wxtdX0yg7BYZtnDRFDgp51+AdOgjsIjJxcC8=;
 h=From:To:Subject:Date:From;
 b=MLk0Peyf0KayzkBeptHMYxbpneMQREAbisSgMhGegw9IghUmowd+aAOCCU35jezQH
 FrjOg7OnKpKZLPHzg5e0RAl8wK5LVLXt0DqAP3mWKJHyFBO5S8/cZQUfVGVi5fPLuh
 iGWDoguPoYjZbk/jgPsCsVlk1H/7ijHHhsvxjwkxOneA+9lDrXYHPFzUhPa4xigH6b
 cmThNJqd4jQAp3GC4hAsSREXiw8UOJLPl5/qNe/U5xeHjtd9w3CZgb5XTTtZGuvCc4
 yQIzQyDFYHHeZyDXkwCFWxEi3cCXIaHc0gJKAWszwvkeVZrHbEjQPS3Lrou1mcKAdc
 WnJ5Rllb7WbkQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 514A2C05FCE; Fri, 29 Apr 2022 05:41:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 29 Apr 2022 05:41:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yanming@tju.edu.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215916-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215916 Bug ID:
 215916 Summary: kernel BUG at fs/f2fs/segment.c:2560! Product: File System
 Version: 2.5 Kernel Version: 5.17 Hardware: All OS: Linux Tree: Mainline
 Status: NEW Severity: normal Priority: P1 C [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nkJNv-00DYiI-Ex
Subject: [f2fs-dev] [Bug 215916] New: kernel BUG at fs/f2fs/segment.c:2560!
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

https://bugzilla.kernel.org/show_bug.cgi?id=215916

            Bug ID: 215916
           Summary: kernel BUG at fs/f2fs/segment.c:2560!
           Product: File System
           Version: 2.5
    Kernel Version: 5.17
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: yanming@tju.edu.cn
        Regression: No

Created attachment 300845
  --> https://bugzilla.kernel.org/attachment.cgi?id=300845&action=edit
case.c

I have encountered a F2FS bug in the kernel v5.17.

This bug can be reproduced by running the following commands:
losetup /dev/loop0 case.img
mount -o
"background_gc=off,no_heap,noacl,inline_dentry,flush_merge,test_dummy_encryption,test_dummy_encryption"
/dev/loop0 /mnt/test/
gcc -o case case.c
./case

The system call sequence is in case.c, and the modified image can be found at
(https://drive.google.com/file/d/1NJPVAObap1fuhCCbaAF0YacDuoc1LRxo/view?usp=sharing).

The kernel message is shown below:

6,811,176146014,-;loop0: detected capacity change from 0 to 131072
4,812,176177760,-;F2FS-fs (loop0): Test dummy encryption mount option ignored
4,813,176177773,-;F2FS-fs (loop0): Test dummy encryption mount option ignored
5,814,176180172,-;F2FS-fs (loop0): Disable nat_bits due to incorrect cp_ver
(9632544162839053021, 5086346976812384983)
5,815,176207578,-;F2FS-fs (loop0): Mounted with checkpoint version = 7548c2dd
4,816,176363509,-;------------[ cut here ]------------
2,817,176363515,-;kernel BUG at fs/f2fs/segment.c:2560!
4,818,176363524,-;invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
4,819,176363528,-;CPU: 5 PID: 90 Comm: kworker/u16:2 Not tainted 5.17.0 #5
4,820,176363532,-;Hardware name: Dell Inc. OptiPlex 9020/03CPWF, BIOS A14
09/14/2015
4,821,176363535,-;Workqueue: writeback wb_workfn (flush-7:0)
4,822,176363543,-;RIP: 0010:new_curseg+0xe8d/0x15f0
4,823,176363548,-;Code: 45 0c 48 89 44 24 38 e9 2d f4 ff ff 89 e8 31 d2 41 89
ef f7 b3 58 04 00 00 31 d2 89 c1 f7 f6 89 cd 89 44 24 70 e9 0f f4 ff ff <0f> 0b
e8 dc 56 1f 00 48 8d bb 08 0a 00 00 48 ba 00 00 00 00 00 fc
4,824,176363551,-;RSP: 0018:ffff888109ea6738 EFLAGS: 00010246
4,825,176363555,-;RAX: 0000000000000018 RBX: ffff888145c2c000 RCX:
0000000000000018
4,826,176363557,-;RDX: 0000000000000000 RSI: 0000000000000018 RDI:
ffff888101a9be90
4,827,176363559,-;RBP: ffffed1028b8588c R08: ffff888101a9be88 R09:
0000000000000000
4,828,176363561,-;R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000000
4,829,176363563,-;R13: ffff888101100dc0 R14: dffffc0000000000 R15:
ffffed10202201bb
4,830,176363566,-;FS:  0000000000000000(0000) GS:ffff8881d5740000(0000)
knlGS:0000000000000000
4,831,176363568,-;CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
4,832,176363571,-;CR2: 00007f8dd8ecd0a0 CR3: 0000000159e10005 CR4:
00000000001706e0
4,833,176363573,-;Call Trace:
4,834,176363575,-; <TASK>
4,835,176363578,-; allocate_segment_by_default+0x228/0x440
4,836,176363582,-; f2fs_allocate_data_block+0x13d1/0x31f0
4,837,176363587,-; ? _raw_spin_lock_irqsave+0x88/0xe0
4,838,176363592,-; do_write_page+0x18d/0x710
4,839,176363596,-; f2fs_outplace_write_data+0x151/0x250
4,840,176363599,-; ? f2fs_do_write_node_page+0x110/0x110
4,841,176363602,-; ? __xa_set_mark+0xa8/0xf0
4,842,176363607,-; f2fs_do_write_data_page+0xef9/0x1980
4,843,176363611,-; ? f2fs_should_update_outplace+0x4f0/0x4f0
4,844,176363615,-; ? folio_mkclean+0xc9/0x150
4,845,176363621,-; ? percpu_counter_add_batch+0x79/0x130
4,846,176363625,-; move_data_page+0x6af/0xbc0
4,847,176363628,-; ? rwsem_down_read_slowpath+0x880/0x880
4,848,176363632,-; ? add_gc_inode+0x240/0x240
4,849,176363635,-; ? _raw_spin_unlock+0x34/0x60
4,850,176363639,-; ? down_write_trylock+0xa0/0x110
4,851,176363643,-; ? down_read_trylock+0x1c0/0x1c0
4,852,176363646,-; ? __get_node_page+0x13c/0xd30
4,853,176363649,-; do_garbage_collect+0x312f/0x46f0
4,854,176363654,-; ? move_data_page+0xbc0/0xbc0
4,855,176363657,-; ? move_data_block+0x22d0/0x22d0
4,856,176363661,-; f2fs_gc+0x6b0/0x3bc0
4,857,176363665,-; ? f2fs_start_bidx_of_node+0x10/0x10
4,858,176363669,-; ? f2fs_inode_chksum_set+0x15/0x130
4,859,176363672,-; ? f2fs_start_bidx_of_node.part.0+0x22f/0x310
4,860,176363676,-; ? down_write+0xa8/0x110
4,861,176363678,-; ? down_write_killable+0x120/0x120
4,862,176363681,-; ? f2fs_outplace_write_data+0x1c4/0x250
4,863,176363685,-; ? f2fs_balance_fs+0x921/0x2260
4,864,176363688,-; f2fs_balance_fs+0x921/0x2260
4,865,176363691,-; ? f2fs_should_update_outplace+0x4f0/0x4f0
4,866,176363695,-; ? __blk_account_io_start+0xe6/0x220
4,867,176363699,-; ? f2fs_balance_fs_bg+0xcd0/0xcd0
4,868,176363703,-; ? _raw_spin_lock+0x82/0xd0
4,869,176363706,-; ? _raw_spin_lock_irqsave+0xe0/0xe0
4,870,176363709,-; ? __unwind_start+0x514/0x7d0
4,871,176363712,-; ? kernel_text_address+0xd/0xb0
4,872,176363717,-; f2fs_write_single_data_page+0x16be/0x2370
4,873,176363721,-; ? submit_bio_checks+0x11e1/0x1240
4,874,176363724,-; ? submit_bio_noacct+0x5c6/0x850
4,875,176363727,-; ? release_pages+0x26f/0xa80
4,876,176363730,-; ? f2fs_do_write_data_page+0x1980/0x1980
4,877,176363734,-; ? invalid_page_referenced_vma+0x10/0x10
4,878,176363738,-; ? percpu_counter_add_batch+0x79/0x130
4,879,176363741,-; f2fs_write_cache_pages+0x428/0xd00
4,880,176363745,-; ? f2fs_write_single_data_page+0x2370/0x2370
4,881,176363749,-; ? nr_blockdev_pages+0xcb/0x100
4,882,176363753,-; ? si_meminfo+0x115/0x230
4,883,176363756,-; ? xas_set_mark+0xf0/0x1c0
4,884,176363760,-; ? __mutex_lock_slowpath+0x10/0x10
4,885,176363763,-; f2fs_write_data_pages+0x96e/0xd50
4,886,176363767,-; ? f2fs_write_cache_pages+0xd00/0xd00
4,887,176363770,-; ? f2fs_inode_synced+0x1e7/0x370
4,888,176363773,-; ? f2fs_set_node_page_dirty+0x1e1/0x7b0
4,889,176363777,-; ? f2fs_balance_fs_bg+0xcd0/0xcd0
4,890,176363780,-; do_writepages+0x168/0x550
4,891,176363783,-; ? page_writeback_cpu_online+0x10/0x10
4,892,176363786,-; ? f2fs_write_inode+0x468/0x1200
4,893,176363789,-; ? _raw_spin_lock+0x82/0xd0
4,894,176363792,-; ? _raw_spin_lock_irqsave+0xe0/0xe0
4,895,176363795,-; __writeback_single_inode+0x9f/0x870
4,896,176363799,-; ? __inode_add_lru+0x56/0x1c0
4,897,176363804,-; writeback_sb_inodes+0x47d/0xb20
4,898,176363808,-; ? _raw_spin_unlock+0x34/0x60
4,899,176363811,-; ? sync_inode_metadata+0xe0/0xe0
4,900,176363814,-; ? down_read_trylock+0x117/0x1c0
4,901,176363818,-; ? __traceiter_sb_clear_inode_writeback+0x90/0x90
4,902,176363822,-; __writeback_inodes_wb+0xb2/0x200
4,903,176363826,-; wb_writeback+0x4bd/0x660
4,904,176363830,-; ? __writeback_inodes_wb+0x200/0x200
4,905,176363834,-; ? get_nr_dirty_inodes+0xa9/0x100
4,906,176363837,-; wb_workfn+0x5f3/0xab0
4,907,176363840,-; ? inode_wait_for_writeback+0x30/0x30
4,908,176363842,-; ? set_next_entity+0x2b7/0x500
4,909,176363846,-; ? dequeue_task_fair+0x2cd/0x14d0
4,910,176363849,-; ? _raw_spin_unlock+0x34/0x60
4,911,176363852,-; ? finish_task_switch+0x1c8/0x680
4,912,176363856,-; ? read_word_at_a_time+0xe/0x20
4,913,176363859,-; ? strscpy+0x96/0x2a0
4,914,176363862,-; process_one_work+0x79f/0x13e0
4,915,176363865,-; worker_thread+0x89/0xf60
4,916,176363869,-; ? __kthread_parkme+0x86/0x150
4,917,176363872,-; ? process_one_work+0x13e0/0x13e0
4,918,176363875,-; kthread+0x26a/0x300
4,919,176363878,-; ? kthread_complete_and_exit+0x20/0x20
4,920,176363880,-; ret_from_fork+0x22/0x30
4,921,176363885,-; </TASK>
4,922,176363886,-;Modules linked in: x86_pkg_temp_thermal efivarfs
4,923,176363893,-;---[ end trace 0000000000000000 ]---
4,924,176363895,-;RIP: 0010:new_curseg+0xe8d/0x15f0
4,925,176363898,-;Code: 45 0c 48 89 44 24 38 e9 2d f4 ff ff 89 e8 31 d2 41 89
ef f7 b3 58 04 00 00 31 d2 89 c1 f7 f6 89 cd 89 44 24 70 e9 0f f4 ff ff <0f> 0b
e8 dc 56 1f 00 48 8d bb 08 0a 00 00 48 ba 00 00 00 00 00 fc
4,926,176363901,-;RSP: 0018:ffff888109ea6738 EFLAGS: 00010246
4,927,176363904,-;RAX: 0000000000000018 RBX: ffff888145c2c000 RCX:
0000000000000018
4,928,176363906,-;RDX: 0000000000000000 RSI: 0000000000000018 RDI:
ffff888101a9be90
4,929,176363908,-;RBP: ffffed1028b8588c R08: ffff888101a9be88 R09:
0000000000000000
4,930,176363910,-;R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000000
4,931,176363912,-;R13: ffff888101100dc0 R14: dffffc0000000000 R15:
ffffed10202201bb
4,932,176363915,-;FS:  0000000000000000(0000) GS:ffff8881d5740000(0000)
knlGS:0000000000000000
4,933,176363917,-;CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
4,934,176363919,-;CR2: 00007f8dd8ecd0a0 CR3: 0000000159e10005 CR4:
00000000001706e0
6,935,176363922,-;note: kworker/u16:2[90] exited with preempt_count 1
4,936,176363925,-;------------[ cut here ]------------
4,937,176363926,-;WARNING: CPU: 5 PID: 90 at kernel/exit.c:738
do_exit+0xb8/0x27b0
4,938,176363931,-;Modules linked in: x86_pkg_temp_thermal efivarfs
4,939,176363935,-;CPU: 5 PID: 90 Comm: kworker/u16:2 Tainted: G      D         
 5.17.0 #5
4,940,176363938,-;Hardware name: Dell Inc. OptiPlex 9020/03CPWF, BIOS A14
09/14/2015
4,941,176363940,-;Workqueue: writeback wb_workfn (flush-7:0)
4,942,176363944,-;RIP: 0010:do_exit+0xb8/0x27b0
4,943,176363947,-;Code: 85 ed 74 28 48 b8 00 00 00 00 00 fc ff df 48 89 ea 48
c1 ea 03 80 3c 02 00 0f 85 b3 21 00 00 48 83 7d 00 00 0f 84 b4 0b 00 00 <0f> 0b
4c 8d ab 90 07 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 ea
4,944,176363949,-;RSP: 0018:ffff888109ea7e48 EFLAGS: 00010202
4,945,176363952,-;RAX: dffffc0000000000 RBX: ffff888109def000 RCX:
0000000080000000
4,946,176363954,-;RDX: 1ffff110213d4f77 RSI: 0000000000000004 RDI:
ffff888109def878
4,947,176363956,-;RBP: ffff888109ea7bb8 R08: 0000000000000033 R09:
ffffed103aaece8e
4,948,176363959,-;R10: ffff8881d576746b R11: ffffed103aaece8d R12:
000000000000000b
4,949,176363961,-;R13: ffffffffab21c2e0 R14: ffff888109def000 R15:
0000000000000000
4,950,176363963,-;FS:  0000000000000000(0000) GS:ffff8881d5740000(0000)
knlGS:0000000000000000
4,951,176363965,-;CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
4,952,176363967,-;CR2: 00007f8dd8ecd0a0 CR3: 0000000159e10005 CR4:
00000000001706e0
4,953,176363970,-;Call Trace:
4,954,176363971,-; <TASK>
4,955,176363973,-; ? _printk+0xad/0xde
4,956,176363977,-; ? swsusp_write.cold+0x39b/0x39b
4,957,176363980,-; ? is_current_pgrp_orphaned+0x90/0x90
4,958,176363983,-; ? __kthread_parkme+0x86/0x150
4,959,176363987,-; ? process_one_work+0x13e0/0x13e0
4,960,176363990,-; make_task_dead+0xab/0xc0
4,961,176363993,-; rewind_stack_and_make_dead+0x17/0x17
4,962,176363996,-;RIP: 0000:0x0
4,963,176364000,-;Code: Unable to access opcode bytes at RIP
0xffffffffffffffd6.
4,964,176364002,-;RSP: 0000:0000000000000000 EFLAGS: 00000000 ORIG_RAX:
0000000000000000
4,965,176364005,-;RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000000
4,966,176364007,-;RDX: 0000000000000000 RSI: 0000000000000000 RDI:
0000000000000000
4,967,176364009,-;RBP: 0000000000000000 R08: 0000000000000000 R09:
0000000000000000
4,968,176364011,-;R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000000
4,969,176364013,-;R13: 0000000000000000 R14: 0000000000000000 R15:
0000000000000000
4,970,176364015,-; </TASK>
4,971,176364017,-;---[ end trace 0000000000000000 ]---

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
