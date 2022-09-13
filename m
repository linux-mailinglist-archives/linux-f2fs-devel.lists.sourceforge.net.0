Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C015B7D53
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Sep 2022 01:05:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oYExj-0001Mm-Fa;
	Tue, 13 Sep 2022 23:05:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phdm@macqel.be>) id 1oYExh-0001MU-7h
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 23:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KmKY4H5hjDAqrgHPX6aEmgmlnao3PFGaIetaaGFiisg=; b=L5ri9bkMrudM5e58pQkeXXIZEV
 SH0RyduaMghxr7x5YvosjAmgAXMse3Xea90dEEdJ7AVAFp6qfOrhFLMeuPmNfOd/iEGcPNW7QrKzv
 WFRgpNKu5BYYDZBNC/p74Fca16JRLgL71wIH76pZTIlAjQHWG+hRsHGJulmfHHaLrJN0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KmKY4H5hjDAqrgHPX6aEmgmlnao3PFGaIetaaGFiisg=; b=U
 N2xZ1QBukuASU8TnHfZUa56nbGkPl459tWGkD5gP3nM4YF3zes1nbTluUsliVa6fDg9oXwVnnecsS
 YGqzzUDqZrld8QIVQiQKypW5dJtkocBnpDiP9Lr9yvK6fV2HEe8tbtaRJ7MbKg9cFXBqMxhsxpKLx
 DerK54YWarcJyaaU=;
Received: from smtp2.macqel.be ([109.135.2.61] helo=frolo.macqel.be)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1oYExe-007LAM-MD for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 23:05:01 +0000
Received: by frolo.macqel.be (Postfix, from userid 1000)
 id 1D40FDF00AC; Wed, 14 Sep 2022 00:49:08 +0200 (CEST)
Date: Wed, 14 Sep 2022 00:49:08 +0200
From: Philippe De Muyter <phdm@macq.eu>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20220913224908.GA25100@172.21.0.10>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.16 (2007-06-09)
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, I use the f2fs version from linux 4.1.15 for the root
 partition of our product. At that time, fsck.f2fs did nothing. But now I
 feel the need to run fsck.f2fs in a initramfs at startup. I have cloned
 f2fs-tools and compiled version 1.14 of f2fs.fsck,
 and used it to check and fix automatically, 
 with option '-y', my root partition. 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oYExe-007LAM-MD
Subject: [f2fs-dev] concern about f2fs and fsck.f2fs
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

Hello,

I use the f2fs version from linux 4.1.15 for the root partition of our product.
At that time, fsck.f2fs did nothing.  But now I feel the need to run fsck.f2fs
in a initramfs at startup.

I have cloned f2fs-tools and compiled version 1.14 of f2fs.fsck, and used
it to check and fix automatically, with option '-y', my root partition.

When running it on a previously fsck'd partition, where I had installed
new files and shutdown the system properly, I have run fsck.f2fs and
it gave me thousands of messages

 [FIX] (fsck_chk_inode_blk:1141)  --> Regular: 0x13cc1 reset i_gc_failures from 0x1 to 0x00
 ...
 [FIX] (fsck_chk_inode_blk:1141)  --> Regular: 0x81b4 reset i_gc_failures from 0x1 to 0x00

and finished with :

 [FSCK] Check node 76051 / 76058 (100.00%)
 
 [FSCK] Max image size: 3600 MB, Free space: 887 MB
 [FSCK] Unreachable nat entries                        [Ok..] [0x0]
 [FSCK] SIT valid block bitmap checking                [Ok..]
 [FSCK] Hard link checking for regular file            [Ok..] [0x956]
 [FSCK] valid_block_count matching with CP             [Ok..] [0x96a9c]
 [FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x1291a]
 [FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x1291a]
 [FSCK] valid_inode_count matched with CP              [Ok..] [0x1280b]
 [FSCK] free segment_count matched with CP             [Ok..] [0x217]
 [FSCK] next block offset is free                      [Ok..]
 [FSCK] fixing SIT types
 [FSCK] other corrupted bugs                           [Ok..]
 Info: Duplicate valid checkpoint to mirror position 1024 -> 512
 Info: Write valid nat_bits in checkpoint
 Info: Write valid nat_bits in checkpoint
 
 Done: 288.437391 secs
 
But, afterwards, when the f2fs driver in the kernel worked with the fixed file
system, it complained, only once, with :

 [ 2349.673407] ------------[ cut here ]------------
 [ 2349.676777] WARNING: CPU: 0 PID: 2359 at fs/f2fs/node.c:1863 flush_nat_entries+0x734/0x7c4()
 [ 2349.683996] Modules linked in:
 [ 2349.685796] CPU: 0 PID: 2359 Comm: python3 Not tainted 4.1.15-02177-gcef0cbe-dirty #166
 [ 2349.692527] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
 [ 2349.697780] [<80015f58>] (unwind_backtrace) from [<80012020>] (show_stack+0x10/0x14)
 [ 2349.704273] [<80012020>] (show_stack) from [<80732e64>] (dump_stack+0x68/0xb8)
 [ 2349.710205] [<80732e64>] (dump_stack) from [<8002b694>] (warn_slowpath_common+0x74/0xac)
 [ 2349.717031] [<8002b694>] (warn_slowpath_common) from [<8002b6e8>] (warn_slowpath_null+0x1c/0x24)
 [ 2349.724545] [<8002b6e8>] (warn_slowpath_null) from [<8024f8dc>] (flush_nat_entries+0x734/0x7c4)
 [ 2349.731950] [<8024f8dc>] (flush_nat_entries) from [<8024456c>] (write_checkpoint+0x208/0xe68)
 [ 2349.739207] [<8024456c>] (write_checkpoint) from [<802400c4>] (f2fs_sync_fs+0x50/0x70)
 [ 2349.745859] [<802400c4>] (f2fs_sync_fs) from [<8010436c>] (sync_fs_one_sb+0x28/0x2c)
 [ 2349.752315] [<8010436c>] (sync_fs_one_sb) from [<800df9e0>] (iterate_supers+0xac/0xd4)
 [ 2349.758960] [<800df9e0>] (iterate_supers) from [<80104414>] (sys_sync+0x48/0x98)
 [ 2349.765094] [<80104414>] (sys_sync) from [<8000f440>] (ret_fast_syscall+0x0/0x3c)
 [ 2349.771296] ---[ end trace 5d91f10cd7a61715 ]---

fs/f2fs/node.c:1863 is here :

        /* flush dirty nats in nat entry set */
        list_for_each_entry_safe(ne, cur, &set->entry_list, list) {
                struct f2fs_nat_entry *raw_ne;
                nid_t nid = nat_get_nid(ne);
                int offset;

                if (nat_get_blkaddr(ne) == NEW_ADDR)
                        continue;

                if (to_journal) {
                        offset = lookup_journal_in_cursum(sum,
                                                        NAT_JOURNAL, nid, 1);
HERE >>>>>>>>>>         f2fs_bug_on(sbi, offset < 0);
                        raw_ne = &nat_in_journal(sum, offset);
                        nid_in_journal(sum, offset) = cpu_to_le32(nid);
                } else {
                        raw_ne = &nat_blk->entries[nid - start_nid];
                }
                raw_nat_from_node_info(raw_ne, &ne->ni);

                down_write(&NM_I(sbi)->nat_tree_lock);
                nat_reset_flag(ne);
                __clear_nat_cache_dirty(NM_I(sbi), ne);
                up_write(&NM_I(sbi)->nat_tree_lock);

                if (nat_get_blkaddr(ne) == NULL_ADDR)
                        add_free_nid(sbi, nid, false);
        }

Is that 'offset < 0', probably '-1' as error return, really unexpected ?
Is it caused by the fsck run on the filesystem ?
Why does the driver continue with the negative offet instead of taking
an error path ?
Crashing the kernel is not an option as this runs on unattended devices,
and consequently F2FS_CHECK_FS is not set.

Afterwards, the kernel continued to run but issued those messages

 attempt to access beyond end of device
 mmcblk0p2: rw=16384, want=5798631936, limit=7372800

with various rw and want values.

After a second clean shutdown and reboot, initramfs ran again fsck.f2fs, and
this time I had much less 'reset i_gc_failures' messages, but many 'Set node summary'
and some 'Set data summary 0x6b1' messages, and a summary with 'Fail' reports.

 [FIX] (is_valid_ssa_node_blk: 201)  --> Set node summary 0x67a -> [0x9428] [0xd165c]
 [FIX] (is_valid_ssa_node_blk: 201)  --> Set node summary 0x67a -> [0x9429] [0xd165d]
 [FIX] (is_valid_ssa_node_blk: 201)  --> Set node summary 0x67a -> [0x95aa] [0xd168a]
 [FIX] (is_valid_ssa_node_blk: 201)  --> Set node summary 0x67a -> [0x95ab] [0xd168b]
 [FSCK] Check node 76051 / 76058 (100.00%)
 
 NID[0x9f4d] is unreachable, blkaddr:0xcd353
 [FSCK] Max image size: 3600 MB, Free space: 887 MB
 [FSCK] Unreachable nat entries                        [Fail] [0x1]
 [FSCK] SIT valid block bitmap checking                [Ok..]
 [FSCK] Hard link checking for regular file            [Ok..] [0x956]
 [FSCK] valid_block_count matching with CP             [Ok..] [0x96a9c]
 [FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x1291a]
 [FSCK] valid_node_count matching with CP (nat lookup) [Fail] [0x1291b]
 [FSCK] valid_inode_count matched with CP              [Ok..] [0x1280b]
 [FSCK] free segment_count matched with CP             [Ok..] [0x23a]
 [FSCK] next block offset is free                      [Ok..]
 [FSCK] fixing SIT types
 [FSCK] other corrupted bugs                           [Ok..]

Thereafter, while running linux I haven't received any warning about 'offset < 0',
nor about 'attempt to access beyond end of device'.

But now I feel unsecure about my filesystem,

Should I use an older version of fsck.f2fs (which one) or 1.15 ?

Is there a patch to do something more than spit a warning but still continue
with that negative offset ?

Best regards

Philippe


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
