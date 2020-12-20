Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 195A02DF42C
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 20 Dec 2020 07:11:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kqrvr-00039M-JD; Sun, 20 Dec 2020 06:11:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1kqrvq-00039B-KQ
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 20 Dec 2020 06:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=exSHV0WWj7WefMeGhrz1x1B9xJ2D96h5sBHPMwelK6Q=; b=QrBroL794LFzQKlFp5aZj9NhD5
 x6j+MLHbSXpL5uRskA6lNR5qj0/Dl5GbmUDtKbA0uhrzu99EgGvBf1n864+MR9nsXzsMEcILDkMBU
 g2B3sZLtzXc9P5hTRrfHqtNjcvgrrIPx87FBxBe3ec5LUvz5jSh0V62CqNMNCH62ERZU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=exSHV0WWj7WefMeGhrz1x1B9xJ2D96h5sBHPMwelK6Q=; b=W
 MuVNWgg4v5oGviHhahrxdeP7izNY0f3OqDXq53AZKy3YKhKPY6Y8jE/kfcMByj3cjVhMwKFVe7c2m
 VkaKc7M81VRbAMJvDHHbWX06WVbPNU5LbylrBcM6ozx4GtvJ0Y8bWWvbgc8mJYowH4PkFuoqs8loa
 y4xKxr30bMN95MC4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kqrve-003LlS-R3
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 20 Dec 2020 06:11:02 +0000
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 20 Dec 2020 06:10:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thiemel@centrum.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-210797-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: centrum.cz]
X-Headers-End: 1kqrve-003LlS-R3
Subject: [f2fs-dev] [Bug 210797] New: resize.f2fs over 2 (LVM) disks
 corrupts whole filesystem
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

https://bugzilla.kernel.org/show_bug.cgi?id=210797

            Bug ID: 210797
           Summary: resize.f2fs over 2 (LVM) disks corrupts whole
                    filesystem
           Product: File System
           Version: 2.5
    Kernel Version: 5.9.15
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: thiemel@centrum.cz
        Regression: No

Scenario: F2FS over 2 LVM volumes; when both volumes size extended, then
resize.f2fs corrupts the F2FS



ftp1 ~ # lvresize -L 4G /dev/vgftp1a/f2fs-testa
  New size (8 extents) matches existing size (8 extents).


ftp1 ~ # lvresize -L 4G /dev/vgftp1b/f2fs-testb
  New size (8 extents) matches existing size (8 extents).


ftp1 ~ # mkfs.f2fs -f -O inode_checksum,sb_checksum,extra_attr -l f2fs-test -c
/dev/vgftp1b/f2fs-testb /dev/vgftp1a/f2fs-testa

        F2FS-tools: mkfs.f2fs Ver: 1.14.0 (2020-08-24)

Info: Disable heap-based policy
Info: Debug level = 0
Info: Label = f2fs-test
Info: Trim is enabled
Info: [/dev/vgftp1a/f2fs-testa] Disk Model: SanDisk SDSSDXPS
Info: [/dev/vgftp1b/f2fs-testb] Disk Model: SanDisk SDSSDXPS
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 16777216 (8192 MB)
Info: zone aligned segment0 blkaddr: 512
Info: format version with
  "Linux version 5.9.15-xeon (root@ftp1.wifizabreh.net) (gcc (Gentoo 9.3.0-r2
p4) 9.3.0, GNU ld (Gentoo 2.33.1 p2) 2.33.1) #2 SMP Sat Dec 19 02:48:01 CET
2020"
Info: [/dev/vgftp1a/f2fs-testa] Discarding device
Info: This device doesn't support BLKSECDISCARD
Info: Discarded 4096 MB
Info: [/dev/vgftp1b/f2fs-testb] Discarding device
Info: This device doesn't support BLKSECDISCARD
Info: Discarded 4096 MB
Info: Overprovision ratio = 2.220%
Info: Overprovision segments = 186 (GC reserved = 98)
Info: format successful


ftp1 ~ # lvresize -L 5G /dev/vgftp1b/f2fs-testb
  Size of logical volume vgftp1b/f2fs-testb changed from 4.00 GiB (8 extents)
to 5.00 GiB (10 extents).
  Logical volume vgftp1b/f2fs-testb successfully resized.


ftp1 ~ # lvresize -L 5G /dev/vgftp1a/f2fs-testa
  Size of logical volume vgftp1a/f2fs-testa changed from 4.00 GiB (8 extents)
to 5.00 GiB (10 extents).
  Logical volume vgftp1a/f2fs-testa successfully resized.


ftp1 ~ # resize.f2fs /dev/vgftp1a/f2fs-testa
Info: [/dev/vgftp1a/f2fs-testa] Disk Model: SanDisk SDSSDXPS
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 10485760 (5120 MB)
Info: MKFS version
  "Linux version 5.9.15-xeon (root@ftp1.wifizabreh.net) (gcc (Gentoo 9.3.0-r2
p4) 9.3.0, GNU ld (Gentoo 2.33.1 p2) 2.33.1) #2 SMP Sat Dec 19 02:48:01 CET
2020"
Info: FSCK version
  from "Linux version 5.9.15-xeon (root@ftp1.wifizabreh.net) (gcc (Gentoo
9.3.0-r2 p4) 9.3.0, GNU ld (Gentoo 2.33.1 p2) 2.33.1) #2 SMP Sat Dec 19
02:48:01 CET 2020"
    to "Linux version 5.9.15-xeon (root@ftp1.wifizabreh.net) (gcc (Gentoo
9.3.0-r2 p4) 9.3.0, GNU ld (Gentoo 2.33.1 p2) 2.33.1) #2 SMP Sat Dec 19
02:48:01 CET 2020"
Info: superblock features = 828 :  extra_attr inode_checksum sb_checksum
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: Device[0] : /dev/vgftp1a/f2fs-testa blkaddr = 0--fffff
Info: [/dev/vgftp1b/f2fs-testb] Disk Model: SanDisk SDSSDXPS
Info: Device[1] : /dev/vgftp1b/f2fs-testb blkaddr = 100000--1fffff
Info: total FS sectors = 16777216 (8192 MB)
Info: CKPT version = 611403e1
Info: Duplicate valid checkpoint to mirror position 512 -> 1024
Info: Write valid nat_bits in checkpoint
[migrate_block:  56] Migrate node block 3e00 -> 4e00
[migrate_block:  56] Migrate data block 4400 -> 5000
[FIX] (move_one_curseg_info:2798)  --> Move curseg[0] 3 -> 9 after 4e00

[FIX] (move_one_curseg_info:2798)  --> Move curseg[1] 7ef -> a after 4e00

[FIX] (move_one_curseg_info:2798)  --> Move curseg[2] 3f7 -> b after 4e00

[FIX] (move_one_curseg_info:2798)  --> Move curseg[3] 0 -> 8 after 4e00

[FIX] (move_one_curseg_info:2798)  --> Move curseg[4] 1 -> c after 4e00

[FIX] (move_one_curseg_info:2798)  --> Move curseg[5] 2 -> d after 4e00

Info: Write valid nat_bits in checkpoint
Try to do defragement: Done
[migrate_ssa: 270] Info: Done to migrate SSA blocks: sum_blkaddr = 0x2e00 ->
0x3a00
[migrate_nat: 386] Info: Done to migrate NAT blocks: nat_blkaddr = 0xa00 ->
0xa00
[migrate_sit: 444] Info: Done to restore new SIT blocks: 0x600
Info: Write valid nat_bits in checkpoint
[rebuild_checkpoint: 585] Info: Done to rebuild checkpoint blocks
[update_superblock: 695] Info: Done to update superblock

Done: 0.426219 secs


ftp1 ~ # fsck.f2fs /dev/vgftp1a/f2fs-testa
Info: [/dev/vgftp1a/f2fs-testa] Disk Model: SanDisk SDSSDXPS
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 10485760 (5120 MB)
Segment count (5119) mismatch with total segments from devices (4095)   Can't
find a valid F2FS superblock at 0x0
Segment count (5119) mismatch with total segments from devices (4095)   Can't
find a valid F2FS superblock at 0x1

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
