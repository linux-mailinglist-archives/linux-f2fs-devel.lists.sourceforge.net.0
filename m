Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3D861ACF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Jul 2019 08:57:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hkNa6-0003no-75; Mon, 08 Jul 2019 06:56:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1hkNa4-0003nE-21
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jul 2019 06:56:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QfkcSIyO+xRoc7vvmdfoysiacKWcWrnsLnrxSQbei8k=; b=TxjH7XreOogilovbtbFnqbVx9q
 5tjRtMywK4lJPKoJBCu9f4j/YEsh8/Yr2ipgkEJf6D3Qgl3hHDVscg0gojjV1xk0Fy+Cren6uZ7fC
 slBr0R/mvXhU0FBrEmpeSX+93mLWVhpMLZKP3XUVnwEq+Vu/UByokboHDKFZCMesI9hk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QfkcSIyO+xRoc7vvmdfoysiacKWcWrnsLnrxSQbei8k=; b=gXP/dUYNan/qvWjLajeGFZxZCd
 qNq66Wu6cn6v4X7q9O82Wj1//w3PHODsmVOYJtG/ztsbl0zEAFS8gRtO26De2Rp1fo4VsteY7+BDH
 XBzah6V3wmnmHaNaZQ8gcJEt6nIz5qhh4UixyMnCDiHYpmxAUCvYgOeO0+0Wq8eVG9FQ=;
Received: from mail.wl.linuxfoundation.org ([198.145.29.98])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hkNaI-00BQvM-Lr
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jul 2019 06:57:12 +0000
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 1F64D281E1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  8 Jul 2019 06:57:05 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 133C328249; Mon,  8 Jul 2019 06:57:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 08 Jul 2019 06:57:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: midwinter1993@gmail.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204043-202145-jaIyFepdu0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204043-202145@https.bugzilla.kernel.org/>
References: <bug-204043-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hkNaI-00BQvM-Lr
Subject: [f2fs-dev] [Bug 204043] F2fs kernel BUG at fs/f2fs/data.c:317!
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

https://bugzilla.kernel.org/show_bug.cgi?id=204043

--- Comment #2 from midwinter1993@gmail.com ---
(In reply to Chao Yu from comment #1)
> Could you help to add below diff to check debug info?
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index bc5cea27b512..333285cb14c5 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -241,7 +241,7 @@ static inline void __submit_bio(struct f2fs_sb_info *sbi,
>  				struct bio *bio, enum page_type type)
>  {
>  	if (!is_read_io(bio_op(bio))) {
> -		unsigned int start;
> +		unsigned int start, ofs;
>  
>  		if (type != DATA && type != NODE)
>  			goto submit_io;
> @@ -256,7 +256,7 @@ static inline void __submit_bio(struct f2fs_sb_info *sbi,
>  			goto submit_io;
>  
>  		/* fill dummy pages */
> -		for (; start < F2FS_IO_SIZE(sbi); start++) {
> +		for (ofs = start; ofs < F2FS_IO_SIZE(sbi); ofs++) {
>  			struct page *page =
>  				mempool_alloc(sbi->write_io_dummy,
>  					      GFP_NOIO | __GFP_NOFAIL);
> @@ -266,8 +266,16 @@ static inline void __submit_bio(struct f2fs_sb_info
> *sbi,
>  			SetPagePrivate(page);
>  			set_page_private(page, (unsigned long)DUMMY_WRITTEN_PAGE);
>  			lock_page(page);
> -			if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE)
> -				f2fs_bug_on(sbi, 1);
> +			if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
> +				printk("ofs:%u, start:%u, io_size:%u, "
> +					"size:%u, vcnt:%u, max_vecs:%u",
> +					ofs, start, F2FS_IO_SIZE(sbi),
> +					bio->bi_iter.bi_size,
> +					bio->bi_vcnt,
> +					bio->bi_max_vecs);
> +				WARN_ON(1);
> +				break;
> +			}
>  		}
>  		/*
>  		 * In the NODE case, we lose next block address chain. So, we

Hi!

I patched the kernel, and after I run the test case about 7 times, a warning
occurred:

[   78.460040] F2FS-fs (loop0): Test dummy encryption mount option ignored
[   78.464621] F2FS-fs (loop0): Found nat_bits in checkpoint
[   78.479864] F2FS-fs (loop0): Mounted with checkpoint version = aaca8fb
[   78.482474] F2FS-fs (loop0): Test dummy encryption mount option ignored
[   78.483451] F2FS-fs (loop0): switch extent_cache option is not allowed
[   78.691092] ofs:1, start:1, io_size:8, size:1085440, vcnt:256, max_vecs:256
[   78.691161] WARNING: CPU: 1 PID: 1072 at fs/f2fs/data.c:323
__submit_merged_bio.cold+0x74/0x7c
[   78.693234] Modules linked in:
[   78.693579] CPU: 1 PID: 1072 Comm: kworker/u4:3 Not tainted 5.1.3 #8
[   78.694330] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   78.695523] Workqueue: writeback wb_workfn (flush-7:0)
[   78.696109] RIP: 0010:__submit_merged_bio.cold+0x74/0x7c
[   78.696762] Code: 00 00 00 45 89 e1 41 89 e8 41 8b 8d bc 04 00 00 41 57 48
c7 c7 80 6f dd 8c 8b 54 24 3c 8b 74 24 10 d3 e0 89 c1 e8 50 01 68 ff <0f> 0b 58
e9 15 c3 fe ff e8 9a 4f 73 ff 49 8d 7c 24 5a e8 60 89 89
[   78.699018] RSP: 0018:ffff888117fa7140 EFLAGS: 00010282
[   78.699620] RAX: 000000000000003f RBX: ffff88810828bb40 RCX:
0000000000000000
[   78.700530] RDX: 0000000000000000 RSI: 0000000000000278 RDI:
ffffed1022ff4e1a
[   78.701337] RBP: 0000000000109000 R08: 000000000000003f R09:
fffffbfff1c7766c
[   78.702027] R10: fffffbfff1c7766b R11: ffffffff8e3bb35e R12:
0000000000000100
[   78.702874] R13: ffff888107a1a200 R14: ffff888108101500 R15:
0000000000000100
[   78.703735] FS:  0000000000000000(0000) GS:ffff88811b500000(0000)
knlGS:0000000000000000
[   78.704722] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   78.705383] CR2: 00005615108e12d8 CR3: 0000000107c58000 CR4:
00000000000006e0
[   78.706229] Call Trace:
[   78.706498]  f2fs_submit_page_write+0x3cd/0xdd0
[   78.707014]  do_write_page+0x15d/0x360
[   78.707453]  f2fs_outplace_write_data+0xd7/0x210
[   78.707985]  ? f2fs_do_write_node_page+0x190/0x190
[   78.708549]  ? __enqueue_entity+0xae/0xe0
[   78.709047]  f2fs_do_write_data_page+0x43b/0xf30
[   78.709590]  ? f2fs_should_update_outplace+0x1c0/0x1c0
[   78.710177]  ? __switch_to_asm+0x34/0x70
[   78.710602]  ? __switch_to_asm+0x40/0x70
[   78.711067]  ? __switch_to_asm+0x34/0x70
[   78.711534]  ? finish_task_switch+0x145/0x370
[   78.712048]  ? __switch_to_asm+0x34/0x70
[   78.712497]  ? __switch_to_asm+0x40/0x70
[   78.712959]  __write_data_page+0xcf6/0x1140
[   78.713461]  ? page_mapped+0xf8/0x1f0
[   78.713870]  ? f2fs_do_write_data_page+0xf30/0xf30
[   78.714462]  ? page_referenced+0x3d0/0x3d0
[   78.714909]  ? _raw_write_unlock_irqrestore+0x20/0x20
[   78.715533]  f2fs_write_cache_pages+0x3ba/0xb40
[   78.716032]  ? __write_data_page+0x1140/0x1140
[   78.716492]  ? f2fs_fsync_node_pages+0xf90/0xf90
[   78.717021]  ? xas_start+0xbf/0x1c0
[   78.717451]  ? __mutex_lock_slowpath+0x10/0x10
[   78.717995]  f2fs_write_data_pages+0x3dd/0x8b0
[   78.718506]  ? f2fs_write_cache_pages+0xb40/0xb40
[   78.719052]  ? f2fs_set_node_page_dirty+0x175/0x3a0
[   78.719618]  ? f2fs_inode_synced+0x1c7/0x200
[   78.720069]  ? memset+0x20/0x40
[   78.720447]  ? f2fs_write_cache_pages+0xb40/0xb40
[   78.721006]  do_writepages+0xbb/0x1e0
[   78.721444]  ? page_writeback_cpu_online+0x10/0x10
[   78.721964]  ? _raw_spin_lock+0x75/0xd0
[   78.722409]  ? _raw_spin_lock_irq+0xd0/0xd0
[   78.722891]  ? __wake_up_bit+0x84/0xe0
[   78.723331]  __writeback_single_inode+0xb6/0x800
[   78.723861]  ? inode_add_lru+0xd9/0x110
[   78.724273]  writeback_sb_inodes+0x441/0x910
[   78.724756]  ? sync_inode_metadata+0x100/0x100
[   78.725263]  ? queue_io+0x16b/0x220
[   78.725674]  wb_writeback+0x261/0x650
[   78.726129]  ? __switch_to_asm+0x34/0x70
[   78.726641]  ? __writeback_inodes_wb+0x170/0x170
[   78.727361]  ? cwt_wakefn+0x60/0x60
[   78.728104]  ? _raw_spin_lock_bh+0x80/0xd0
[   78.728827]  ? _raw_read_unlock_irqrestore+0x20/0x20
[   78.729542]  ? __switch_to_asm+0x34/0x70
[   78.730121]  ? wb_workfn+0xc4/0x7a0
[   78.730643]  wb_workfn+0x1f9/0x7a0
[   78.731161]  ? inode_wait_for_writeback+0x40/0x40
[   78.731868]  ? __schedule+0x481/0xc80
[   78.732417]  ? _raw_spin_lock_irq+0x76/0xd0
[   78.733046]  ? read_word_at_a_time+0xe/0x20
[   78.733668]  ? strscpy+0xb2/0x180
[   78.734168]  process_one_work+0x503/0x970
[   78.734770]  worker_thread+0x7d/0x820
[   78.735322]  kthread+0x1ad/0x210
[   78.735821]  ? process_one_work+0x970/0x970
[   78.736443]  ? kthread_park+0x130/0x130
[   78.737020]  ret_from_fork+0x35/0x40
[   78.737555] ---[ end trace 5a4cea2bd5b6d207 ]---

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
