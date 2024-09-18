Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3339197BE4F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Sep 2024 17:03:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sqwDU-00087b-Cl;
	Wed, 18 Sep 2024 15:03:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3vOvqZgkbAH0tz0lbmmfsbqqje.hpphmfvtfsdpoufou.dpn@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sqwDQ-00087J-UO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Sep 2024 15:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+UC6Mc3Avq1l/u0KK21V2/bnbzcYLVONph6/3dO9HTk=; b=ilUuloV1HHX43aHLcuCJHZsJ+O
 U6I2VBgvpYSgzv9ef5iCVT5D6t7Lf6x9RQvVoJ6OGTsL8m3DVLJqmn5coW/1PwF4JKM64DbL6OVUI
 F3F4x3ZrPEbW7nltr+8I2nv7u3zsU3rtbRjov36g/qmNVKhieEs8eZd6NWNJ1+tJoaWs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+UC6Mc3Avq1l/u0KK21V2/bnbzcYLVONph6/3dO9HTk=; b=P
 56beMYg/Ix2nb7YOVPzLunhjfaG5hZquf+OTH607AbfmbEKs6v4dhtj4Akcfh03akvA1MKyuOp/aE
 XR5Bv53OLl/kpDeScJbzU2edktuktduzXLHAzuXIstgAockfmCTM1i8aSomzrvKTZuAtc9fMZwBLM
 EJNHXanvbdd9IfCo=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sqwDP-0000ON-8Y for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Sep 2024 15:03:36 +0000
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3a045e7ed57so110754995ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Sep 2024 08:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726671804; x=1727276604;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+UC6Mc3Avq1l/u0KK21V2/bnbzcYLVONph6/3dO9HTk=;
 b=rHWhNld8clj0Xwj6E3ZS08f7OmtpDH1HReBdglIlYO7c/Bq/a0Psv1CeIrIGI/DsWx
 TcjFYomCgzjNbsBOVy/5kej1soM4jXds4+BS0bfyVCCCjs33BQdW2JvAiZouLIymxJYb
 FZA8m0kH82qYJFlzzaynsYP88/D2fhs3TEBBjyvGEyJcSNtFsetc6SXgvCK9atWaBMOV
 Wn5JGgM2PG6kD0gPfKShyTpBkF8XDnBQxH2VxXI7EeH48Fag+nxY3477PvJLWq4N9k+h
 +cJe7h6ZipzlzYniSg8QdZaRF6XWCCC6WrSu9ceYg7Dzgw4X59bkQoWHWoEqh6fWFJtc
 eZJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqbiWqegIwd1zONnLZnrszVzZ83es3+3gsXzPo+T8gzk0BXIK9PTF7OuWaCtGVmTNYONQigZNMIvdK8vWEx5FP@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywq5hzgZ78oJwsY40Uk3dw3dxgZNimwNL3EIzB8+Tf4Z9L6FHNA
 LLzbIuFsykGjFW7tCZlO3U22AVCBUeQgf8anwG/L38RpDvWL1ex3TdSNFAHtq0X9nf97vOxGCRV
 euxmWLuetIvnSCx2EdnVVmGSspXGaFM80nRslRTNs0qPgG3MvX2hV1EQ=
X-Google-Smtp-Source: AGHT+IGhaa35gFQtE7Vu6kAqFod34bDr20BPHRMrc2dgJZosDloT+LS7bv0hMwlqO3aSKOat4cDUUzLJfcHG+Xzj1r6MMSb7kWtL
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:5a9:b0:3a0:8c68:7705 with SMTP id
 e9e14a558f8ab-3a08c6877c6mr146178425ab.21.1726671804203; Wed, 18 Sep 2024
 08:03:24 -0700 (PDT)
Date: Wed, 18 Sep 2024 08:03:24 -0700
In-Reply-To: <66e55308.050a0220.1f4381.0004.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <66eaebbc.050a0220.252d9a.0015.GAE@google.com>
From: syzbot <syzbot+74f79df25c37437e4d5a@syzkaller.appspotmail.com>
To: chao@kernel.org, clm@fb.com, dsterba@suse.com, jaegeuk@kernel.org, 
 josef@toxicpanda.com, linux-btrfs@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 2.1 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot has found a reproducer for the following issue on:
 HEAD commit: 5f5673607153 Merge branch 'for-next/core' into for-kernelci git
 tree: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 for-kernelci console output: https://syzkaller.appspot. [...] 
 Content analysis details:   (2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -1.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.197 listed in list.dnswl.org]
 0.1 PLING_QUERY            Subject has exclamation mark and question mark
X-Headers-End: 1sqwDP-0000ON-8Y
Subject: Re: [f2fs-dev] [syzbot] [btrfs?] BUG: MAX_LOCKDEP_CHAIN_HLOCKS too
 low! (7)
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    5f5673607153 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=137fc69f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dedbcb1ff4387972
dashboard link: https://syzkaller.appspot.com/bug?extid=74f79df25c37437e4d5a
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12b8f500580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10dbc4a9980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/40172aed5414/disk-5f567360.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/58372f305e9d/vmlinux-5f567360.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d2aae6fa798f/Image-5f567360.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/e4b8f51425ac/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+74f79df25c37437e4d5a@syzkaller.appspotmail.com

BUG: MAX_LOCKDEP_CHAIN_HLOCKS too low!
turning off the locking correctness validator.
CPU: 0 UID: 0 PID: 137 Comm: kworker/u8:4 Not tainted 6.11.0-rc7-syzkaller-g5f5673607153 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/06/2024
Workqueue: btrfs-endio-write btrfs_work_helper
Call trace:
 dump_backtrace+0x1b8/0x1e4 arch/arm64/kernel/stacktrace.c:319
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:326
 __dump_stack lib/dump_stack.c:93 [inline]
 dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:119
 dump_stack+0x1c/0x28 lib/dump_stack.c:128
 lookup_chain_cache_add kernel/locking/lockdep.c:3815 [inline]
 validate_chain kernel/locking/lockdep.c:3836 [inline]
 __lock_acquire+0x1fa0/0x779c kernel/locking/lockdep.c:5142
 lock_acquire+0x240/0x728 kernel/locking/lockdep.c:5759
 __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
 _raw_spin_lock+0x48/0x60 kernel/locking/spinlock.c:154
 spin_lock include/linux/spinlock.h:351 [inline]
 btrfs_block_rsv_size fs/btrfs/block-rsv.h:136 [inline]
 btrfs_use_block_rsv+0x184/0x73c fs/btrfs/block-rsv.c:495
 btrfs_alloc_tree_block+0x16c/0x12d4 fs/btrfs/extent-tree.c:5130
 btrfs_force_cow_block+0x4e4/0x1c9c fs/btrfs/ctree.c:573
 btrfs_cow_block+0x318/0xa28 fs/btrfs/ctree.c:754
 btrfs_search_slot+0xba0/0x2a08
 btrfs_lookup_file_extent+0x124/0x1bc fs/btrfs/file-item.c:267
 btrfs_drop_extents+0x370/0x2ad8 fs/btrfs/file.c:251
 insert_reserved_file_extent+0x2b4/0xa6c fs/btrfs/inode.c:2911
 insert_ordered_extent_file_extent+0x348/0x508 fs/btrfs/inode.c:3016
 btrfs_finish_one_ordered+0x6a0/0x129c fs/btrfs/inode.c:3124
 btrfs_finish_ordered_io+0x120/0x134 fs/btrfs/inode.c:3266
 finish_ordered_fn+0x20/0x30 fs/btrfs/ordered-data.c:331
 btrfs_work_helper+0x340/0xd28 fs/btrfs/async-thread.c:314
 process_one_work+0x79c/0x15b8 kernel/workqueue.c:3231
 process_scheduled_works kernel/workqueue.c:3312 [inline]
 worker_thread+0x978/0xec4 kernel/workqueue.c:3389
 kthread+0x288/0x310 kernel/kthread.c:389
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
