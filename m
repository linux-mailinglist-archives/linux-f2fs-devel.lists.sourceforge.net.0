Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 339B02DF3DA
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 20 Dec 2020 06:29:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kqrHK-0001fT-CX; Sun, 20 Dec 2020 05:29:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1kqrHI-0001fE-KW
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 20 Dec 2020 05:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b82jRQhtP5m5edRfH/fqzV4hLmlpBp5KxdhW5fxuImE=; b=YFVkuOkIuWiBOtLAWoN+aCDD3/
 ymaBAwwDvBjbM08mLAC547+TSa3agnD+1jsvi2zpZsgJMtenl6u/eMlN7kz8V07ic7GRz6M2DqHo1
 mBW12QQb4VSnFhwH/mB6rTo0I1A43NaxyGv9Tz8pOpVqNUypFlVYVd6PB2VkmUVvXQ/Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=b82jRQhtP5m5edRfH/fqzV4hLmlpBp5KxdhW5fxuImE=; b=K
 /npQa9Im6uYSJYLvJQqkcKBLFC3jGlASLDQAuJGvdgQaQbf68rGLZigXicEwbo3VQOE3QsfD49dq5
 meMAMR2sBPg6t5jI3ClkAzPsBa7akzOj/Gc6S4aQ45SNgug6JzCYJD6iCum9Oc+GMj6EwWEnbM+io
 AGNW2nsaFZP+l6A0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kqrHD-002hz5-Pg
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 20 Dec 2020 05:29:08 +0000
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 20 Dec 2020 05:28:58 +0000
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
Message-ID: <bug-210795-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wifizabreh.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kqrHD-002hz5-Pg
Subject: [f2fs-dev] [Bug 210795] New: fsck.f2fs - 1.14.0 - error when not
 /dev/vgXX/lvYYY path provided - [ASSERT] (init_sb_info:1017) !strcmp((char
 *)sb->devs[i].path, (char *)c.devices[i].path)
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

https://bugzilla.kernel.org/show_bug.cgi?id=210795

            Bug ID: 210795
           Summary: fsck.f2fs - 1.14.0 - error when not /dev/vgXX/lvYYY
                    path provided - [ASSERT] (init_sb_info:1017)
                    !strcmp((char *)sb->devs[i].path, (char
                    *)c.devices[i].path)
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

Summary: fsck.f2fs version 1.14.0 has an error when not /dev/vgXX/lvYYY path
provided: "ASSERT] (init_sb_info:1017) !strcmp((char *)sb->devs[i].path, (char
*)c.devices[i].path)"


Comment: only /dev/vgftp1a/VIRTUALa goes ok, the rest from the list below
(including /dev/dm-15) throws an error.


Problem: when fsck enabled in /etc/fstab (6th field is non-zero value), bootup
fails due to FSCK error (OS Gentoo)


Details:

ftp1 ~ # find /dev/ -type l |while read i; do ls -als $i; done|grep dm-15
0 lrwxrwxrwx 1 root root 8 Dec 20 06:20 /dev/vgftp1a/VIRTUALa -> ../dm-15
0 lrwxrwxrwx 1 root root 11 Dec 20 06:20
/dev/disk/by-uuid/f6d10195-322c-4844-8c9d-0f9208b2928b -> ../../dm-15
0 lrwxrwxrwx 1 root root 11 Dec 20 06:20 /dev/disk/by-label/VIRTUAL ->
../../dm-15
0 lrwxrwxrwx 1 root root 11 Dec 20 06:20
/dev/disk/by-id/dm-uuid-LVM-fDvtRBj3wclGxpSKSfh63QVaqCC05s2l3ASPKi48wLYF7PamZ6fBWpRM7zA2d7HR
-> ../../dm-15
0 lrwxrwxrwx 1 root root 11 Dec 20 06:20
/dev/disk/by-id/dm-name-vgftp1a-VIRTUALa -> ../../dm-15
0 lrwxrwxrwx 1 root root 8 Dec 20 06:20 /dev/block/253:15 -> ../dm-15
0 lrwxrwxrwx 1 root root 8 Dec 20 06:20 /dev/mapper/vgftp1a-VIRTUALa ->
../dm-15

ftp1 ~ # ls -als /dev/dm-15
0 brw-rw---- 1 root disk 253, 15 Dec 20 06:20 /dev/dm-15




ftp1 ~ # uname -a
Linux ftp1.wifizabreh.net 5.9.15-xeon #2 SMP Sat Dec 19 02:48:01 CET 2020
x86_64 Intel(R) Xeon(R) CPU E3-1265L V2 @ 2.50GHz GenuineIntel GNU/Linux


ftp1 ~ # eix f2fs
[I] sys-fs/f2fs-tools
     Available versions:  1.14.0(0/8) {selinux}
     Installed versions:  1.14.0(0/8)(06:03:10 AM 12/20/2020)(-selinux)
     Homepage:           
https://git.kernel.org/cgit/linux/kernel/git/jaegeuk/f2fs-tools.git/about/
     Description:         Tools for Flash-Friendly File System (F2FS)


ftp1 ~ # fsck.f2fs  --dry-run /dev/disk/by-label/VIRTUAL
Info: Dry run
Info: [/dev/disk/by-label/VIRTUAL] Disk Model: SanDisk SDSSDXPS
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 209715200 (102400 MB)
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
[ASSERT] (init_sb_info:1017) !strcmp((char *)sb->devs[i].path, (char
*)c.devices[i].path)


ftp1 ~ # fsck.f2fs  --dry-run /dev/dm-15
Info: Dry run
Info: [/dev/dm-15] Disk Model: SanDisk SDSSDXPS
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 209715200 (102400 MB)
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
[ASSERT] (init_sb_info:1017) !strcmp((char *)sb->devs[i].path, (char
*)c.devices[i].path)



ftp1 ~ # fsck.f2fs  --dry-run /dev/vgftp1a/VIRTUALa
Info: Dry run
Info: [/dev/vgftp1a/VIRTUALa] Disk Model: SanDisk SDSSDXPS
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 209715200 (102400 MB)
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
Info: Device[0] : /dev/vgftp1a/VIRTUALa blkaddr = 0--13fffff
Info: [/dev/vgftp1b/VIRTUALb] Disk Model: SanDisk SDSSDXPS
Info: Device[1] : /dev/vgftp1b/VIRTUALb blkaddr = 1400000--27fffff
Info: total FS sectors = 335544320 (163840 MB)
Info: CKPT version = 6d2e3efb
Info: Checked valid nat_bits in checkpoint
Info: checkpoint state = 1c5 :  trimmed nat_bits crc compacted_summary unmount

[FSCK] Unreachable nat entries                        [Ok..] [0x0]
[FSCK] SIT valid block bitmap checking                [Ok..]
[FSCK] Hard link checking for regular file            [Ok..] [0x0]
[FSCK] valid_block_count matching with CP             [Ok..] [0x1dd6635]
[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x78a6]
[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x78a6]
[FSCK] valid_inode_count matched with CP              [Ok..] [0x94]
[FSCK] free segment_count matched with CP             [Ok..] [0x4fac]
[FSCK] next block offset is free                      [Ok..]
[FSCK] fixing SIT types
[FSCK] other corrupted bugs                           [Ok..]

Done: 27.694741 secs

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
