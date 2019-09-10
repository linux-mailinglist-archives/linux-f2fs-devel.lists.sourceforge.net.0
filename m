Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D77AEBD2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Sep 2019 15:44:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i7gR6-0007Dy-Bu; Tue, 10 Sep 2019 13:44:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1i7gR4-0007DR-B7
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Sep 2019 13:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FwpcBsbSR0bXRsu54JUyNGIpijh8h4fIsKsgiUGHdhQ=; b=kxtwC107qgsQ4W8HVuuD8yL2r3
 TH4toJdglJAuBcentDNkmB7RMZB6rZ0iF1AOd1vMyJjV+6xo3X+aakeVk+Oa/HzSuQz07hCb5cdOC
 9/MwiyQEaz89gnB02Q2ltAhYVHqx/i87xjDHJnkSOip0/6GxlTkNWtqmwOVl3zZcuauY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:
 Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FwpcBsbSR0bXRsu54JUyNGIpijh8h4fIsKsgiUGHdhQ=; b=h
 8PPw1hrCNjAf9ubPlmuLaJ5DlOMvEpfe9bUvQ89lImv4YPI8Q5RRWnl1d2/oTYXJqZZ7CoRR/J0Cv
 cLeNBRGor1w23G19RyOFOB4E/nQazi3FCkn2ghoo41smHuh88cw63RB8xWI4NrZVLax0vrTyAVC25
 iJIQAk6hln4b9Xak=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i7gR2-00GJOa-GO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Sep 2019 13:43:58 +0000
Received: from [192.168.0.103] (unknown [58.212.132.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1B2020863
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Sep 2019 13:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568123030;
 bh=8GUnPbJrwG/dYCm/SwzByG3X+CJMsyCmghi/Iwl5gcs=;
 h=To:From:Subject:Date:From;
 b=hinQRPIm+doM46jxccNhiHPia3zjE4nysAiGA9KnqWJJ2r82iegLh+YjPs2FIEVuo
 ieY5VnOkUR4dqPiNJVX1gA/rQTStYc3whcMavhBQQFkm3uU4QELoTyWQFjOcLrlMEQ
 TVJ+Viyf59ReSWnO6j4apS46/FPiAOZOqPWdhSgo=
To: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
From: Chao Yu <chao@kernel.org>
Message-ID: <6937d78a-70e1-c095-978a-d5748dbed5ef@kernel.org>
Date: Tue, 10 Sep 2019 21:43:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i7gR2-00GJOa-GO
Subject: [f2fs-dev] f2fs deadlock on generic/232
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

export F2FS_MOUNT_OPTIONS="-o discard"
export F2FS_MKFS_OPTIONS="-O extra_attr -O project_quota -O inode_checksum -O
flexible_inline_xattr -O inode_crtime -f"

[ 1171.718538] ======================================================
[ 1171.718546] WARNING: possible circular locking dependency detected
[ 1171.718556] 5.3.0-rc1 #48 Not tainted
[ 1171.718563] ------------------------------------------------------
[ 1171.718568] fsstress/2617 is trying to acquire lock:
[ 1171.718575] 5f9d8379 (&sbi->node_change){++++}, at: __do_map_lock+0x84/0xc0
[f2fs]
[ 1171.718653]
[ 1171.718653] but task is already holding lock:
[ 1171.718660] 6a4ea751 (&s->s_dquot.dqio_sem){++++}, at:
v2_write_dquot+0x3b/0x110 [quota_v2]
[ 1171.718672]
[ 1171.718672] which lock already depends on the new lock.
[ 1171.718672]
[ 1171.718678]
[ 1171.718678] the existing dependency chain (in reverse order) is:
[ 1171.718683]
[ 1171.718683] -> #3 (&s->s_dquot.dqio_sem){++++}:
[ 1171.718695]        __lock_acquire+0x829/0x1120
[ 1171.718702]        lock_acquire+0x14a/0x340
[ 1171.718721]        down_read+0x55/0x260
[ 1171.718729]        v2_read_dquot+0x2d/0x90 [quota_v2]
[ 1171.718737]        dquot_acquire+0x71/0x230
[ 1171.718795]        f2fs_dquot_acquire+0x49/0xc0 [f2fs]
[ 1171.718801]        dqget+0x53c/0x7b0
[ 1171.718807]        __dquot_initialize+0x4b0/0x550
[ 1171.718815]        dquot_initialize+0x20/0x30
[ 1171.718871]        f2fs_mkdir+0x54/0x3f0 [f2fs]
[ 1171.718880]        vfs_mkdir+0x21f/0x3c0
[ 1171.718886]        do_mkdirat+0x15d/0x1b0
[ 1171.718892]        sys_mkdir+0x27/0x40
[ 1171.718900]        do_fast_syscall_32+0x12b/0x653
[ 1171.718908]        entry_SYSENTER_32+0xa4/0xfc
[ 1171.718913]
[ 1171.718913] -> #2 (&dquot->dq_lock){+.+.}:
[ 1171.718923]        __lock_acquire+0x829/0x1120
[ 1171.718929]        lock_acquire+0x14a/0x340
[ 1171.718953]        __mutex_lock+0x5f/0x12a0
[ 1171.718960]        mutex_lock_nested+0x41/0x60
[ 1171.718967]        dquot_acquire+0x30/0x230
[ 1171.719024]        f2fs_dquot_acquire+0x49/0xc0 [f2fs]
[ 1171.719030]        dqget+0x53c/0x7b0
[ 1171.719037]        __dquot_initialize+0x4b0/0x550
[ 1171.719044]        dquot_initialize+0x20/0x30
[ 1171.719100]        f2fs_mkdir+0x54/0x3f0 [f2fs]
[ 1171.719108]        vfs_mkdir+0x21f/0x3c0
[ 1171.719116]        do_mkdirat+0x15d/0x1b0
[ 1171.719121]        sys_mkdir+0x27/0x40
[ 1171.719128]        do_fast_syscall_32+0x12b/0x653
[ 1171.719136]        entry_SYSENTER_32+0xa4/0xfc
[ 1171.719142]
[ 1171.719142] -> #1 (&sbi->quota_sem){.+.+}:
[ 1171.719151]        __lock_acquire+0x829/0x1120
[ 1171.719158]        lock_acquire+0x14a/0x340
[ 1171.719165]        down_read+0x55/0x260
[ 1171.719220]        f2fs_dquot_mark_dquot_dirty+0x34/0x120 [f2fs]
[ 1171.719227]        dquot_claim_space_nodirty+0x307/0x3e0
[ 1171.719285]        inc_valid_block_count+0x1b9/0x5f0 [f2fs]
[ 1171.719344]        f2fs_reserve_new_blocks+0x6f/0x500 [f2fs]
[ 1171.719403]        f2fs_map_blocks+0x77c/0xeb0 [f2fs]
[ 1171.719477]        f2fs_preallocate_blocks+0x144/0x500 [f2fs]
[ 1171.719534]        f2fs_file_write_iter+0x46c/0xa60 [f2fs]
[ 1171.719542]        do_iter_readv_writev+0x357/0x3d0
[ 1171.719550]        do_iter_write+0xcb/0x250
[ 1171.719557]        vfs_writev+0xab/0x170
[ 1171.719564]        do_writev+0xa0/0x1e0
[ 1171.719570]        sys_writev+0x2e/0x40
[ 1171.719577]        do_fast_syscall_32+0x12b/0x653
[ 1171.719583]        entry_SYSENTER_32+0xa4/0xfc
[ 1171.719589]
[ 1171.719589] -> #0 (&sbi->node_change){++++}:
[ 1171.719598]        check_prev_add+0x15d/0x1cb0
[ 1171.719605]        validate_chain+0xc6c/0x1330
[ 1171.719612]        __lock_acquire+0x829/0x1120
[ 1171.719620]        lock_acquire+0x14a/0x340
[ 1171.719626]        down_read+0x55/0x260
[ 1171.719684]        __do_map_lock+0x84/0xc0 [f2fs]
[ 1171.719743]        f2fs_write_begin+0x462/0x1030 [f2fs]
[ 1171.719799]        f2fs_quota_write+0xbd/0x280 [f2fs]
[ 1171.719808]        write_blk+0x53/0xd0 [quota_tree]
[ 1171.719815]        get_free_dqblk+0x72/0x130 [quota_tree]
[ 1171.719824]        do_insert_tree+0x150/0x790 [quota_tree]
[ 1171.719831]        do_insert_tree+0xf5/0x790 [quota_tree]
[ 1171.719840]        do_insert_tree+0xf5/0x790 [quota_tree]
[ 1171.719848]        do_insert_tree+0xf5/0x790 [quota_tree]
[ 1171.719856]        qtree_write_dquot+0xae/0x2c0 [quota_tree]
[ 1171.719864]        v2_write_dquot+0x69/0x110 [quota_v2]
[ 1171.719872]        dquot_acquire+0x18d/0x230
[ 1171.719927]        f2fs_dquot_acquire+0x49/0xc0 [f2fs]
[ 1171.719950]        dqget+0x53c/0x7b0
[ 1171.719959]        dquot_transfer+0xb0/0x200
[ 1171.720016]        f2fs_setattr+0x159/0xcf0 [f2fs]
[ 1171.720023]        notify_change+0x48c/0x860
[ 1171.720029]        chown_common+0x2a9/0x370
[ 1171.720034]        do_fchownat+0xfb/0x180
[ 1171.720040]        sys_lchown+0x37/0x50
[ 1171.720045]        do_fast_syscall_32+0x12b/0x653
[ 1171.720051]        entry_SYSENTER_32+0xa4/0xfc
[ 1171.720056]
[ 1171.720056] other info that might help us debug this:
[ 1171.720056]
[ 1171.720060] Chain exists of:
[ 1171.720060]   &sbi->node_change --> &dquot->dq_lock --> &s->s_dquot.dqio_sem
[ 1171.720060]
[ 1171.720067]  Possible unsafe locking scenario:
[ 1171.720067]
[ 1171.720072]        CPU0                    CPU1
[ 1171.720076]        ----                    ----
[ 1171.720080]   lock(&s->s_dquot.dqio_sem);
[ 1171.720085]                                lock(&dquot->dq_lock);
[ 1171.720090]                                lock(&s->s_dquot.dqio_sem);
[ 1171.720095]   lock(&sbi->node_change);
[ 1171.720099]
[ 1171.720099]  *** DEADLOCK ***
[ 1171.720099]
[ 1171.720105] 6 locks held by fsstress/2617:
[ 1171.720109]  #0: 931cd15a (sb_writers#12){.+.+}, at: mnt_want_write+0x2c/0x90
[ 1171.720119]  #1: 8b2a225a (&sb->s_type->i_mutex_key#14){+.+.}, at:
chown_common+0x257/0x370
[ 1171.720127]  #2: 08a4bc55 (&sbi->cp_rwsem){++++}, at:
f2fs_setattr+0x142/0xcf0 [f2fs]
[ 1171.720183]  #3: 5c44c4cd (&sbi->quota_sem){.+.+}, at:
f2fs_dquot_acquire+0x34/0xc0 [f2fs]
[ 1171.720240]  #4: 09738ca6 (&dquot->dq_lock){+.+.}, at: dquot_acquire+0x30/0x230
[ 1171.720248]  #5: 6a4ea751 (&s->s_dquot.dqio_sem){++++}, at:
v2_write_dquot+0x3b/0x110 [quota_v2]
[ 1171.720257]
[ 1171.720257] stack backtrace:
[ 1171.720264] CPU: 3 PID: 2617 Comm: fsstress Not tainted 5.3.0-rc1 #48
[ 1171.720269] Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS
VirtualBox 12/01/2006
[ 1171.720274] Call Trace:
[ 1171.720284]  dump_stack+0x13c/0x1da
[ 1171.720292]  print_circular_bug+0x406/0x41c
[ 1171.720299]  check_noncircular+0x2d4/0x310
[ 1171.720309]  check_prev_add+0x15d/0x1cb0
[ 1171.720317]  ? validate_chain+0xc6c/0x1330
[ 1171.720325]  ? alloc_lock_chain+0x20/0x70
[ 1171.720334]  validate_chain+0xc6c/0x1330
[ 1171.720343]  __lock_acquire+0x829/0x1120
[ 1171.720350]  ? __lock_acquire+0x9d6/0x1120
[ 1171.720358]  lock_acquire+0x14a/0x340
[ 1171.720412]  ? __do_map_lock+0x84/0xc0 [f2fs]
[ 1171.720442]  down_read+0x55/0x260
[ 1171.720501]  ? __do_map_lock+0x84/0xc0 [f2fs]
[ 1171.720561]  __do_map_lock+0x84/0xc0 [f2fs]
[ 1171.720620]  f2fs_write_begin+0x462/0x1030 [f2fs]
[ 1171.720657]  f2fs_quota_write+0xbd/0x280 [f2fs]
[ 1171.720679]  ? rcu_read_lock_sched_held+0x10a/0x120
[ 1171.720687]  ? __kmalloc+0x643/0x810
[ 1171.720693]  ? rcu_read_lock_sched_held+0x10a/0x120
[ 1171.720715]  ? f2fs_get_context+0x50/0x50 [f2fs]
[ 1171.720715]  write_blk+0x53/0xd0 [quota_tree]
[ 1171.720715]  get_free_dqblk+0x72/0x130 [quota_tree]
[ 1171.720715]  do_insert_tree+0x150/0x790 [quota_tree]
[ 1171.720715]  ? get_free_dqblk+0xbe/0x130 [quota_tree]
[ 1171.720715]  ? from_kuid+0x1b/0x30
[ 1171.720715]  ? from_kqid+0x83/0xc0
[ 1171.720715]  ? get_index+0x28/0xb0 [quota_tree]
[ 1171.720715]  do_insert_tree+0xf5/0x790 [quota_tree]
[ 1171.720715]  ? read_blk+0x60/0x80 [quota_tree]
[ 1171.720715]  ? from_kuid+0x1b/0x30
[ 1171.720715]  ? from_kqid+0x83/0xc0
[ 1171.720715]  do_insert_tree+0xf5/0x790 [quota_tree]
[ 1171.720715]  ? read_blk+0x60/0x80 [quota_tree]
[ 1171.720715]  ? from_kuid+0x1b/0x30
[ 1171.720715]  ? from_kqid+0x83/0xc0
[ 1171.720715]  do_insert_tree+0xf5/0x790 [quota_tree]
[ 1171.720715]  ? rcu_read_lock_sched_held+0x10a/0x120
[ 1171.720715]  ? __kmalloc+0x643/0x810
[ 1171.720715]  ? getdqbuf+0x24/0x80 [quota_tree]
[ 1171.720715]  qtree_write_dquot+0xae/0x2c0 [quota_tree]
[ 1171.720715]  v2_write_dquot+0x69/0x110 [quota_v2]
[ 1171.720715]  dquot_acquire+0x18d/0x230
[ 1171.720715]  ? dqget+0x6c0/0x7b0
[ 1171.720715]  f2fs_dquot_acquire+0x49/0xc0 [f2fs]
[ 1171.720715]  dqget+0x53c/0x7b0
[ 1171.720715]  dquot_transfer+0xb0/0x200
[ 1171.720715]  f2fs_setattr+0x159/0xcf0 [f2fs]
[ 1171.720715]  ? selinux_inode_setattr+0x1b3/0x1e0
[ 1171.720715]  ? evm_inode_setattr+0x54/0xd0
[ 1171.720715]  ? security_inode_setattr+0xcb/0x100
[ 1171.720715]  notify_change+0x48c/0x860
[ 1171.720715]  chown_common+0x2a9/0x370
[ 1171.720715]  ? __sb_start_write+0x41d/0x510
[ 1171.720715]  do_fchownat+0xfb/0x180
[ 1171.720715]  sys_lchown+0x37/0x50
[ 1171.720715]  do_fast_syscall_32+0x12b/0x653
[ 1171.720715]  entry_SYSENTER_32+0xa4/0xfc
[ 1171.720715] EIP: 0xb7eee941
[ 1171.720715] Code: 00 89 d3 83 c4 10 5b 5e 5f 5d c3 8d b6 00 00 00 00 ba 00 09
3d 00 eb 9a 8b 0c 24 c3 8b 1c 24 c3 90 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3
90 90 90 90 8d 76 00 58 b8 77 00 00 00 cd 80 90 8d 76
[ 1171.720715] EAX: ffffffda EBX: 0935f180 ECX: 003fd970 EDX: 00cdd317
[ 1171.720715] ESI: bf8449a8 EDI: b7eab000 EBP: bf8449a8 ESP: bf844824
[ 1171.720715] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000296
[ 1176.232859] 232 (2410): drop_caches: 3


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
