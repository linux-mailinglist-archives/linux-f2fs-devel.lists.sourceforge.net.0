Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AA4151D53
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Feb 2020 16:32:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iz0C2-0000Ob-II; Tue, 04 Feb 2020 15:32:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dsterba@suse.cz>) id 1iz0C1-0000OV-Px
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Feb 2020 15:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YFcCyZvsKENU+utxRclKezoqD6Eq7OPPvgMZgPXGCMs=; b=VW46acdP6h77EVDWlD8LsnPYsh
 Q/mNfGEdl9PIqj6lOugrfDOLlcih2yCmmEA+RX6Y6Q6cDWIdA1iy5j8Gn0CZZ76C38A3FBqDvkDsu
 EHMJoq5Lh1M2WJX++7NA6GlYNiKF01A0pRd61pi3iwh/w9mcMFsEvqeNnlDyYOt6bi4E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YFcCyZvsKENU+utxRclKezoqD6Eq7OPPvgMZgPXGCMs=; b=gdlttUCRt6R2sLV1epofUTQD4n
 p7OPo/kUm2YiLZZWyb8j71csux5hYNPzZ47NWRQKVdQswe/Yh0GjwFHIdj6JSHLz5QV9nErVS7gbz
 Ay+i9RAN+30ApM/OUoHBSy2oETMGhwtKl+UNERBJ2nKZQ9sgs0WCdHQ8ICRUgUYRLz24=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iz0Bz-00GkeH-Li
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Feb 2020 15:32:49 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 06D4EAF21;
 Tue,  4 Feb 2020 15:32:41 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id C3975DA80D; Tue,  4 Feb 2020 16:32:27 +0100 (CET)
Date: Tue, 4 Feb 2020 16:32:27 +0100
From: David Sterba <dsterba@suse.cz>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200204153227.GF2654@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Matthew Wilcox <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 cluster-devel@redhat.com, ocfs2-devel@oss.oracle.com
References: <20200201151240.24082-1-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200201151240.24082-1-willy@infradead.org>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: 2.5 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 2.5 URIBL_DBL_ABUSE_MALW   Contains an abused malware URL listed in the
 Spamhaus DBL blocklist [URIs: infradead.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: opensuse.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1iz0Bz-00GkeH-Li
Subject: Re: [f2fs-dev] [PATCH v4 00/12] Change readahead API
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
Reply-To: dsterba@suse.cz
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Feb 01, 2020 at 07:12:28AM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> I would particularly value feedback on this from the gfs2 and ocfs2
> maintainers.  They have non-trivial changes, and a review on patch 5
> would be greatly appreciated.
> 
> This series adds a readahead address_space operation to eventually
> replace the readpages operation.  The key difference is that
> pages are added to the page cache as they are allocated (and
> then looked up by the filesystem) instead of passing them on a
> list to the readpages operation and having the filesystem add
> them to the page cache.  It's a net reduction in code for each
> implementation, more efficient than walking a list, and solves
> the direct-write vs buffered-read problem reported by yu kuai at
> https://lore.kernel.org/linux-fsdevel/20200116063601.39201-1-yukuai3@huawei.com/
> 
> v4:
>  - Rebase on current Linus (a62aa6f7f50a ("Merge tag 'gfs2-for-5.6'"))

I've tried to test the patchset but haven't got very far, it crashes at boot
ritht after VFS mounts the root. The patches are from mailinglist, applied on
current master, bug I saw the same crash with the git branch in your
repo (probably v1).

(gdb) l *(ext4_mpage_readpages+0x1da/0xc20)
0xffffffff813753f0 is in ext4_mpage_readpages (fs/ext4/readpage.c:226).
221             return i_size_read(inode);
222     }
223
224     int ext4_mpage_readpages(struct address_space *mapping, pgoff_t start,
225                     struct page *page, unsigned nr_pages, bool is_readahead)
226     {
227             struct bio *bio = NULL;
228             sector_t last_block_in_bio = 0;
229
230             struct inode *inode = mapping->host;

[    8.008531] BUG: kernel NULL pointer dereference, address: 0000000000000000
[    8.011482] #PF: supervisor read access in kernel mode
[    8.014121] #PF: error_code(0x0000) - not-present page
[    8.016767] PGD 0 P4D 0
[    8.018352] Oops: 0000 [#1] SMP
[    8.019716] CPU: 2 PID: 1 Comm: swapper/0 Not tainted 5.5.0-default+ #955
[    8.021746] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.12.0-59-gc9ba527-rebuilt.opensuse.org 04/01/2014
[    8.025244] RIP: 0010:ext4_mpage_readpages+0x1da/0xc20
[    8.026817] Code: 7c 24 4e 00 0f 85 23 04 00 00 44 29 74 24 3c 83 6c 24 48 01 0f 84 4d 04 00 00 80 7c 24 4e 00 0f 85 fc 05 00 00 48 8b 4c 24 18 <48> 8b 01 f6 c4 20 75 89 4c 8b 69 20 b9 0c 00 00 00 2b 4c 24 38 83
[    8.031957] RSP: 0000:ffffb34f40013988 EFLAGS: 00010292
[    8.033691] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
[    8.035533] RDX: 0000000000000001 RSI: ffffffff960934c0 RDI: ffffffff9681a080
[    8.036900] RBP: 0000000000000001 R08: ffffb34f40013a68 R09: 0000000000000000
[    8.038461] R10: 0000000000000038 R11: 0000000000000000 R12: 0000000000000004
[    8.040698] R13: ffff9668ba4e18e0 R14: 0000000000000001 R15: 0000000000000000
[    8.042805] FS:  0000000000000000(0000) GS:ffff9668bda00000(0000) knlGS:0000000000000000
[    8.045396] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    8.047233] CR2: 0000000000000000 CR3: 000000002e011001 CR4: 0000000000160ee0
[    8.049337] Call Trace:
[    8.050435]  ? __lock_acquire+0xee0/0x1320
[    8.051833]  ? release_pages+0x310/0x380
[    8.053265]  ? mark_held_locks+0x50/0x80
[    8.054468]  ext4_readahead+0x3b/0x50
[    8.055877]  read_pages+0x65/0x1a0
[    8.057167]  ? put_pages_list+0x90/0x90
[    8.058689]  __do_page_cache_readahead+0x24b/0x2a0
[    8.060394]  generic_file_buffered_read+0x7cf/0x9f0
[    8.062137]  ? sched_clock+0x5/0x10
[    8.063451]  ? up_read+0x18/0x240
[    8.064774]  ? ext4_xattr_get+0x97/0x2c0
[    8.066178]  new_sync_read+0x111/0x1a0
[    8.067423]  vfs_read+0xc5/0x180
[    8.068572]  kernel_read+0x2c/0x40
[    8.069788]  prepare_binprm+0x171/0x1b0
[    8.071311]  load_script+0x1c1/0x250
[    8.072643]  search_binary_handler+0x5f/0x210
[    8.074135]  exec_binprm+0xd7/0x290
[    8.075463]  __do_execve_file.isra.0+0x570/0x800
[    8.077400]  ? rest_init+0x2f1/0x2f5
[    8.078979]  do_execve+0x21/0x30
[    8.080420]  kernel_init+0xa4/0x11b
[    8.081856]  ? rest_init+0x2f5/0x2f5
[    8.083173]  ret_from_fork+0x24/0x30
[    8.084695] Modules linked in:
[    8.086055] CR2: 0000000000000000
[    8.087572] ---[ end trace 0890c371a706b34a ]---
[    8.089417] RIP: 0010:ext4_mpage_readpages+0x1da/0xc20
[    8.116836] BUG: sleeping function called from invalid context at include/linux/percpu-rwsem.h:38
[    8.119626] in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1, name: swapper/0
[    8.122392] INFO: lockdep is turned off.
[    8.123694] irq event stamp: 18341344
[    8.124735] hardirqs last  enabled at (18341343): [<ffffffff95230c42>] free_unref_page_list+0x232/0x270
[    8.127918] hardirqs last disabled at (18341344): [<ffffffff95002b4b>] trace_hardirqs_off_thunk+0x1a/0x1c
[    8.131145] softirqs last  enabled at (18341250): [<ffffffff95a00358>] __do_softirq+0x358/0x52b
[    8.143060] softirqs last disabled at (18341243): [<ffffffff9508ae3d>] irq_exit+0x9d/0xb0
[    8.145603] CPU: 2 PID: 1 Comm: swapper/0 Tainted: G      D           5.5.0-default+ #955
[    8.148474] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.12.0-59-gc9ba527-rebuilt.opensuse.org 04/01/2014
[    8.152440] Call Trace:
[    8.153747]  dump_stack+0x71/0xa0
[    8.155238]  ___might_sleep.cold+0xa6/0xf9
[    8.156903]  exit_signals+0x31/0x310
[    8.158431]  ? __do_execve_file.isra.0+0x570/0x800
[    8.160179]  do_exit+0xa8/0xd60
[    8.161632]  ? rest_init+0x2f1/0x2f5
[    8.163204]  rewind_stack_do_exit+0x17/0x20
[    8.164931] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000009
[    8.167575] Kernel Offset: 0x14000000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
