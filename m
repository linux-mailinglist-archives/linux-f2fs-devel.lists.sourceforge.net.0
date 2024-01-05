Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F385825B63
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jan 2024 21:11:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rLqXK-0003Jp-KW;
	Fri, 05 Jan 2024 20:11:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1rLqXI-0003Jj-KI
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jan 2024 20:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=86oFSCG1m9Og9FQYB/P8NCQt+RQlpeRSkwMZQAd8vHE=; b=X2DmL3XzLiprYYUyavZTUQWF99
 8tJlcsiQC8OT1c+DsC1wmq4ilK1kKWf6//AjJnrQ5mfsZj/zkKdrCzJDo3L917OgO+Duja/y3cQGu
 RBKHO2SykH3O/AgXMBwXx2m9Q2+ItNop4SM77KeYdIevJuFMXkdlnn4P67oAAVO0aRK8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=86oFSCG1m9Og9FQYB/P8NCQt+RQlpeRSkwMZQAd8vHE=; b=V
 JY640Z0aO50JPM9t6pmLiskG3pwEDsy1xctVpLqU2w7+wyKJnF5orkhOCnNOhmsZIx0nCRpIj1R0n
 fh8g7Smg+U5UwI9MJ+hT1tYgm1MjOvEhQmQh53xU+g36+cDDRW3C+FoVqVdMryj6oRLNbfGg6Y9Fx
 EvuIgp7ymTJkw3GQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rLqXE-0004uD-8P for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jan 2024 20:11:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 23731B80E88
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 Jan 2024 20:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76CE6C433C7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 Jan 2024 20:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704485462;
 bh=+dsHLy+YPC9LzcFYfnumYxLIKGz2sG7JIYMe6TS35PY=;
 h=From:To:Subject:Date:From;
 b=rr42MqNkCnS2OIps/Rypzx33DUrVMg/4rju1xXOplbMIoe78YHZMCjC3kLGN+Aer4
 8s7rMKDB7TPOEYT4NdNn9cgd4PagOwHMDSBpOSY4OePUdvSF6U3CpezSlfU4XkB714
 nidqa7iJm7tpgdxMyK133L/+5cmkeBPTxb0Jsq7hmNOPUleblB5lccAXGpIqE0m8Ja
 YtoK4iNBi0C1LxQlkCne6rO7UxMQLvEjnUNYBN8RrYZFR2gIsVQDcfZtVblFTXVNnK
 tFZzli5FQhgVOpISQtnLwzkpYtauo9UsS2A8YURadnkykMt/tTxz9uUlGlgROwlB0l
 Hd9Ghd6LHsXQw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5ED66C4332E; Fri,  5 Jan 2024 20:11:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 05 Jan 2024 20:11:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: qinfd2023@lzu.edu.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218349-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=218349 Bug ID:
 218349 Summary: f2fs partitions corrupted during power failures and cannot
 be fixed with fsck. Product: File System Version: 2.5 Hardware: AMD OS: Linux
 Status: NEW Severity: normal Priority: [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rLqXE-0004uD-8P
Subject: [f2fs-dev] [Bug 218349] New: f2fs partitions corrupted during power
 failures and cannot be fixed with fsck.
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

https://bugzilla.kernel.org/show_bug.cgi?id=218349

            Bug ID: 218349
           Summary: f2fs partitions corrupted during power failures and
                    cannot be fixed with fsck.
           Product: File System
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: qinfd2023@lzu.edu.cn
        Regression: No

I am using some Debian VMs with f2fs root partition for development.
My host machine crashed for some reason and this caused the f2fs partitions in
the VMs to become corrupted.
I tried to boot from Debian Live and repair the partitions but failed.

-----------------------------------------------------------
root@debian:/# uname -a
Linux debian 6.1.0-15-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.66-1 (2023-12-09)
x86_64 GNU/Linux
root@debian:/# fsck.f2fs -V
fsck.f2fs 1.16.0 (2023-04-11)
root@debian:/# fsck.f2fs -f -d 3 /dev/nvme0n1p2
Info: Force to fix corruption
Info: Debug level = 3
Info: MKFS version
  "Linux version 6.1.0-15-amd64 (debian-kernel@lists.debian.org) (gcc-12
(Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #1 SMP
PREEMPT_DYNAMIC Debian 6.1.66-1 (2023-12-09)"
Info: FSCK version
  from "Linux version 6.1.0-15-amd64 (debian-kernel@lists.debian.org) (gcc-12
(Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #1 SMP
PREEMPT_DYNAMIC Debian 6.1.66-1 (2023-12-09)"
    to "Linux version 6.1.0-15-amd64 (debian-kernel@lists.debian.org) (gcc-12
(Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #1 SMP
PREEMPT_DYNAMIC Debian 6.1.66-1 (2023-12-09)"
Info: superblock features = 0 :
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: fs errors: inconsistent_node_count

+--------------------------------------------------------+
| Super block                                            |
+--------------------------------------------------------+
magic                                   [0xf2f52010 : 4076150800]
major_ver                               [0x       1 : 1]
volum_name                              []
minor_ver                               [0x       f : 15]
log_sectorsize                          [0x       9 : 9]
log_sectors_per_block                   [0x       3 : 3]
log_blocksize                           [0x       c : 12]
log_blocks_per_seg                      [0x       9 : 9]
segs_per_sec                            [0x       1 : 1]
secs_per_zone                           [0x       1 : 1]
checksum_offset                         [0x       0 : 0]
block_count                             [0x  efdd00 : 15719680]
section_count                           [0x    7737 : 30519]
segment_count                           [0x    77ed : 30701]
segment_count_ckpt                      [0x       2 : 2]
segment_count_sit                       [0x       4 : 4]
segment_count_nat                       [0x      74 : 116]
segment_count_ssa                       [0x      3c : 60]
segment_count_main                      [0x    7737 : 30519]
segment0_blkaddr                        [0x     200 : 512]
cp_blkaddr                              [0x     200 : 512]
sit_blkaddr                             [0x     600 : 1536]
nat_blkaddr                             [0x     e00 : 3584]
ssa_blkaddr                             [0x    f600 : 62976]
main_blkaddr                            [0x   16e00 : 93696]
root_ino                                [0x       3 : 3]
node_ino                                [0x       1 : 1]
meta_ino                                [0x       2 : 2]
cp_payload                              [0x       0 : 0]
crc                                     [0x       0 : 0]
version                       Linux version 6.1.0-15-amd64
(debian-kernel@lists.debian.org) (gcc-12 (Debian 12.2.0-14) 12.2.0, GNU ld (GNU
Binutils for Debian) 2.40) #1 SMP PREEMPT_DYNAMIC Debian 6.1.66-1 (2023-12-09)
Info: Segments per section = 1
Info: Sections per zone = 1
Info: total FS sectors = 125757440 (61405 MB)
Info: CKPT version = 251861d5

+--------------------------------------------------------+
| Checkpoint                                             |
+--------------------------------------------------------+
checkpoint_ver                          [0x251861d5 : 622354901]
user_block_count                        [0x  ea8800 : 15370240]
valid_block_count                       [0x  707851 : 7370833]
rsvd_segment_count                      [0x      fe : 254]
overprov_segment_count                  [0x     1f3 : 499]
free_segment_count                      [0x    36a6 : 13990]
alloc_type[CURSEG_HOT_NODE]             [0x       0 : 0]
alloc_type[CURSEG_WARM_NODE]            [0x       0 : 0]
alloc_type[CURSEG_COLD_NODE]            [0x       0 : 0]
cur_node_segno[0]                       [0x     21e : 542]
cur_node_segno[1]                       [0x     f07 : 3847]
cur_node_segno[2]                       [0x     b47 : 2887]
cur_node_blkoff[0]                      [0x      2e : 46]
cur_node_blkoff[1]                      [0x      dc : 220]
cur_node_blkoff[2]                      [0x      9b : 155]
alloc_type[CURSEG_HOT_DATA]             [0x       0 : 0]
alloc_type[CURSEG_WARM_DATA]            [0x       0 : 0]
alloc_type[CURSEG_COLD_DATA]            [0x       0 : 0]
cur_data_segno[0]                       [0x     ef7 : 3831]
cur_data_segno[1]                       [0x    7583 : 30083]
cur_data_segno[2]                       [0x    2e79 : 11897]
cur_data_blkoff[0]                      [0x     15b : 347]
cur_data_blkoff[1]                      [0x      e2 : 226]
cur_data_blkoff[2]                      [0x       7 : 7]
ckpt_flags                              [0x      c6 : 198]
cp_pack_total_block_count               [0x       5 : 5]
cp_pack_start_sum                       [0x       2 : 2]
valid_node_count                        [0x   e8922 : 952610]
valid_inode_count                       [0x   e7b7c : 949116]
next_free_nid                           [0x   c5355 : 807765]
sit_ver_bitmap_bytesize                 [0x      80 : 128]
nat_ver_bitmap_bytesize                 [0x     e80 : 3712]
checksum_offset                         [0x     ffc : 4092]
elapsed_time                            [0x    549f : 21663]
sit_nat_version_bitmap[0]               [0x      c6 : 198]


do_record_fsync_data: [node] ino = 24573, nid = 0, blkaddr = 2063580
recover_data: ino = 24573, nid = 0, recorded = 0, err = 0
do_record_fsync_data: [node] ino = 471286, nid = 0, blkaddr = 2063581
recover_data: ino = 471286, nid = 0, recorded = 0, err = 0
[ASSERT] (do_record_fsync_data:3475) 0

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
