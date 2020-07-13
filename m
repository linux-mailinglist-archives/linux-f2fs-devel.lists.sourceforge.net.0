Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C74AC21E2FE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jul 2020 00:24:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jv6sZ-0001iz-QG; Mon, 13 Jul 2020 22:24:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nroycea@gmail.com>) id 1jv6sY-0001ir-P8
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jul 2020 22:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OcHsM2BvDJutedC1r/JVX8yoOxfS5PqyzzhHipn6B9A=; b=ewYm9EQF9e6oO25Z93Q5xcP+G3
 aZtFHqGiNkS5Ub2iH3arMu0+AvAM6URgmyUEXcNYPO32aQ+iU9tz14tLqLzcV+pEP+rvbWrwZRx8t
 5u01ZNpBzNJwvRbSflildw0h+pIbQfzNoJa/1dcHuE0PWnmHbaPqeYYPFSXkgwsBtMuE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OcHsM2BvDJutedC1r/JVX8yoOxfS5PqyzzhHipn6B9A=; b=F
 gCTMcf/IAdrhA7/MIQGXTd6BworugJ62ZTx09NKHaGB2Brx3fWuSraU1BbWh0esSe/YdJd4ukl06m
 zE0gYVo64+jafqutNI4CkgvLrdmtTaaIfC8aYspHGHoKSW5rQyYu2t3vg8HzpFyIyqv6VCAxvhAlB
 JeYwiVkgCT5cdIiw=;
Received: from mail-qk1-f181.google.com ([209.85.222.181])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jv6sV-00GfDL-0A
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jul 2020 22:24:54 +0000
Received: by mail-qk1-f181.google.com with SMTP id q198so13891611qka.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Jul 2020 15:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=OcHsM2BvDJutedC1r/JVX8yoOxfS5PqyzzhHipn6B9A=;
 b=JaNR1TLSKZ1KaEsgcdcLgp0I8nK+ZjumVOIMW8Hlc2bTvH20yd13nv5rKA1NOBNCXa
 ho6iUoOSbxkFc3KdcwwFzzhuynWrfY8Fr5bnFExJPPir5EX7bm7wgYZVpIO6O3Ec7dY6
 n1FqlBf/yRFC2XfQ/eqbcQCQqaubqUGSJ8fPEA0yYVhiwfQ8b4M8zqLB5eA6rn2JnNfZ
 T8dOjaoKqAi5G3qcf6yhQivmskrCoBomsaR11sO1CYo10Ya/KKLnR5ZCB2fl1mPX+Xy7
 BKgNP7Wj2Ce3wz/NW9PlTc7UoPLbJT0ppESPCvgkzws7shU+PDoThWTK6/Yn0qMNH/ZC
 7J3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=OcHsM2BvDJutedC1r/JVX8yoOxfS5PqyzzhHipn6B9A=;
 b=kmCV1B+yXiMPrJFnps9sNr+S+j6XFxJb9+/s4iXuq8nNwcFHjDF9Z1e/z7Tk66c0cI
 +RB0fBRS0eRLbBxC5w0HKRUpamw5vS9PR8IJzEYSNFOxKys9CvlaZcLXGUaQKfPNyMJe
 JPL21QE9lYiIFEYjZzFCuxf2SKjBSAuwnHSSkdBWAN2ljaffunFP2OCUuyWpfe312O86
 LEvltaiaxm95IQrhX4dGKfghuBv9t3/5F9Epbbp7I4mGlJQ4YdUodTZmDDjYWlx0xQKi
 LCpq6oV1iU79IPXBmze7yd13GGzCFyuZJ/l0x7AW1HaKOG692yGIHb+YsUZwNWCU6wUk
 IBEQ==
X-Gm-Message-State: AOAM533CCWV617M5DbVbJa0OUNYKqUn4ZIKUhwnepNjXLneMFmWwm4Vt
 Nop7C32ypzjX3UaleLSidXSEsmjTs98BSa+LRWQ=
X-Google-Smtp-Source: ABdhPJzIBhaNuCKwKcWrv7zpOoTN6FH3FI/H6EL1Q9xcFhfLzY8lI+cZI4JnEdCE/gbdEzrIDbPfRFI0JZgpGMSxSVQ=
X-Received: by 2002:a37:7dc3:: with SMTP id y186mr1598119qkc.160.1594679085217; 
 Mon, 13 Jul 2020 15:24:45 -0700 (PDT)
MIME-Version: 1.0
From: Nathan Royce <nroycea+kernel@gmail.com>
Date: Mon, 13 Jul 2020 17:24:34 -0500
Message-ID: <CALaQ_hosk7627nTx97+xSSsGiN-qt=pTGNW4DZn4TOcAeRSC8g@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nroycea[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.181 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.181 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jv6sV-00GfDL-0A
Subject: [f2fs-dev] F2FS Segmentation Fault
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I won't re-format unless I hear something within a few days in case
you want me to try something.

Preface: There was a notable power outage a couple of nights ago.
When the power returned, everything seemed fine. No issues during
bootup or anything.
Then today, I went to open an application and my system started
schitzing out with programs suddenly closing(/crashing?).
I switched tty and tried to log in but was unable to even be allowed
to enter in my password.
I switched to another and tried logging in as root which succeeded (somehow).
I looked at the journal and saw an entry saying something about
/bin/login not being a valid exec format.
I went to reboot and when it got to fsck part of initramfs, it failed
and I was kicked to root.
I ran fsck and saw a bunch of issues, but I guess nothing could get
resolved enough to let me reboot.
Oh, in case you're wondering, my / (system) is on a 64GB SDHC card.
I just happened to also have an older / system on my mechanical drive
using BTRFS which I could boot to (which I'm on now).
I ran fsck from this older system and it seems I got the same results:

*****
Info: Fix the reported corruption.
Info: Force to fix corruption
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 124168159 (60628 MB)
Info: MKFS version
  "Linux version 5.1.15.a-1-hardened (builduser@slave-1) (gcc version
9.1.0 (GCC)) #1 SMP PREEMPT Thu Jun 27 11:33:04 CEST 2019"
Info: FSCK version
  from "Linux version 4.19.13-dirty (userName@computerName) (gcc
version 8.2.1 20181127 (GCC)) #2 SMP PREEMPT Mon Dec 31 00:15:50 CST
2018"
    to "Linux version 4.19.13-dirty (userName@computerName) (gcc
version 8.2.1 20181127 (GCC)) #2 SMP PREEMPT Mon Dec 31 00:15:50 CST
2018"
Info: superblock features = 0 :
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: total FS sectors = 124168152 (60628 MB)
Info: CKPT version = 63f2b4a
Info: checkpoint state = 55 :  crc fsck compacted_summary unmount

NID[0x18eca] is unreachable, blkaddr:0xcf1d9d3c
NID[0x18ecb] is unreachable, blkaddr:0x5db5f91f
NID[0x18ecc] is unreachable, blkaddr:0x4653d
NID[0x18ee3] is unreachable, blkaddr:0x144dc401
NID[0x18ee4] is unreachable, blkaddr:0x558cfba9
NID[0x18ee5] is unreachable, blkaddr:0x45553
NID[0x18f78] is unreachable, blkaddr:0x560555ac
NID[0x18f79] is unreachable, blkaddr:0x58cccb0d
NID[0x18f7a] is unreachable, blkaddr:0x53d84
NID[0x4d621] is unreachable, blkaddr:0x4fc1d
NID[0x4d622] is unreachable, blkaddr:0x4fc1e
NID[0x7fa32] is unreachable, blkaddr:0x20b0ca3a
NID[0x7fa33] is unreachable, blkaddr:0xf71b60
[FSCK] Unreachable nat entries                        [Fail] [0xd]
[FSCK] SIT valid block bitmap checking                [Fail]
[FSCK] Hard link checking for regular file            [Ok..] [0x4f6]
[FSCK] valid_block_count matching with CP             [Fail] [0x736fcb]
[FSCK] valid_node_count matcing with CP (de lookup)   [Fail] [0x70327]
[FSCK] valid_node_count matcing with CP (nat lookup)  [Ok..] [0x70334]
[FSCK] valid_inode_count matched with CP              [Fail] [0x6f09e]
[FSCK] free segment_count matched with CP             [Ok..] [0x3bfc]
[FSCK] next block offset is free                      [Ok..]
[FSCK] fixing SIT types
[FSCK] other corrupted bugs                           [Fail]

Do you want to restore lost files into ./lost_found/? [Y/N] Y
Segmentation fault
*****

*****
       Message: Process 3425 (fsck.f2fs) of user 0 dumped core.

                Stack trace of thread 3425:
                #0  0x000055f8515739c8 n/a (fsck.f2fs)
                #1  0x000055f851575261 n/a (fsck.f2fs)
                #2  0x000055f851572c56 n/a (fsck.f2fs)
                #3  0x000055f85156a3f0 n/a (fsck.f2fs)
                #4  0x00007f51420feee3 __libc_start_main (libc.so.6)
                #5  0x000055f85156a95e n/a (fsck.f2fs)
*****

So if you want more information or need me to try something, let me
know soon if you would. Otherwise, I'll just be reformatting my card
in a few days.
It just could've been a fluke occurred because of the power outage but
didn't manifest itself until today.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
