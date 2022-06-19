Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 448A45508BF
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Jun 2022 07:23:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o2nOu-0005Qw-SH; Sun, 19 Jun 2022 05:23:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <qkrwngud825@gmail.com>) id 1o2nOt-0005Qp-GJ
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 05:23:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B4cKia+866cgTcRv88SlVAXkzYujoUDJN/Y6pFA+dAs=; b=UGWr3LAPeOikiODhoF4RftFFLR
 qUCZhT6tg2USjhBtB5zHjh+qdtenJKgE0G9sojPunG0jvMh3Hc3JTa9CBbunmxqcC7YbehkUCDF7g
 Io+wEC12TqZtvbDH6bYKHXoiUxMmacaORIdH/sMmchazne/wowE8JqqdnEkcy2l4m/1c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=B4cKia+866cgTcRv88SlVAXkzYujoUDJN/Y6pFA+dAs=; b=R
 HmX5m3f1zadJ4QsqlhUyLyn5ffwj1ns0TMpcRfBqqi3rarc/Ole9aNzMfO5KFxeeZuqAsoIu/tI0i
 2J5382ZCHRBImAie5tnNY3704smduD0pjzeDxoQPJBH6o603RpagxBZ45sxlHNvV9sGpRyvSeQ26l
 3ThcFkN96BV3FcOY=;
Received: from mail-ed1-f51.google.com ([209.85.208.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1o2nOq-0073ZB-17
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 05:23:06 +0000
Received: by mail-ed1-f51.google.com with SMTP id o10so11002140edi.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 18 Jun 2022 22:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=B4cKia+866cgTcRv88SlVAXkzYujoUDJN/Y6pFA+dAs=;
 b=fwBVBtX8FCJo93gNfm7oXyUUrFdkcYZpgDETpEw5ZoQesfe2GugbUinHO9ylgZgjBm
 hh43lH1Ky0KAetpM6LvKajcNTMpktHK5Y4ILG5hBk9+NoX4stX+C85GUVTaDsf1ON2V9
 GSSntMXjKKK0iU/0mlayxDSn9bFMneI65Qu15+NHU2+qQgO5BMj/49w6ZxWzRfi0E4v3
 asoEoNvghCPRPjmXfdStpqObzyKYvRdCuuEzH09wgqencjtu8YuUSjA1Yp5FPj2dR7ti
 SZ7hQzDEQmhoWBwfnmk8vmoGJ6QGIZhpxpk2ftiUIvFK+5TtoD4zfVZ1DiNQ5Fz0bNbM
 Jn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=B4cKia+866cgTcRv88SlVAXkzYujoUDJN/Y6pFA+dAs=;
 b=SbCYwalBAoMq73LSqagzoFFIRKh3G1Qk903rcchf+Jt9JogkzcUDfAvP1ivhwsKuev
 DQtbnFXFUTGzA3hsxSqxfFdDmiHb9gnwrYVVzhK+Zlj+3xsaQebqzxmHvtb4iVmdH2bQ
 OFc7TTVCKHd7PNrj+sNiwkdQ0/CloOw7PQol9+Os3oJzY+D5lnEEUJGv5Jn9sqS4eit8
 7c8m2/bhY3CbbgC5UsALOC8/mg7SQERgWZjiycLi8tWCx5vyin/Kt9WaqV9d8hwFahWr
 6+yJFoyLQE02LTAaLmJU0jeMK6ntrPyIrRGIRMlGmrcvI6JK/eW7HPeWKJvv+tiU00xz
 H9cQ==
X-Gm-Message-State: AJIora9cIWyEibsj3I79aztE3od+JjkhD+x41m0+xOBvbDj9D9uCIng+
 3xF6ynlZmKrRwVAWxPws6PzFSagb0/9nixOotMJgJlSgL8PnmAl4
X-Google-Smtp-Source: AGRyM1u6tYKPIPl7yYdOlkUiHQj0gyvQ38A2biOr8Nq6kevDR0plQhE3+CoxpW2uiGE84PI9rJatwKknC3XsGJ9JSEs=
X-Received: by 2002:aa7:df19:0:b0:435:5eb7:5e31 with SMTP id
 c25-20020aa7df19000000b004355eb75e31mr13448144edy.418.1655616177215; Sat, 18
 Jun 2022 22:22:57 -0700 (PDT)
MIME-Version: 1.0
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Sun, 19 Jun 2022 14:22:46 +0900
Message-ID: <CAD14+f2U0FcZMEXvCXcwnpg-i5OuBURgd0apkB9voSkDu+CB_g@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: 1.3 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, I'm currently trying out f2fs safe resize / shrink on
 Android. (Size: 98 GiB used out of 221 GiB, 501, 313 nodes, resize to 180 GiB)
 It seems to work surprisingly well, the only improvement that can be made
 seems to be updating quota. 
 Content analysis details:   (1.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qkrwngud825[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qkrwngud825[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.51 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.51 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1o2nOq-0073ZB-17
Subject: [f2fs-dev] f2fs: resize should update quota (w/ general experience
 on Android)
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

Hi,

I'm currently trying out f2fs safe resize / shrink on Android.
(Size: 98 GiB used out of 221 GiB, 501,313 nodes, resize to 180 GiB)

It seems to work surprisingly well, the only improvement that can be
made seems to be updating quota.

After resize, fsck complains:
[ERROR] quotaio_v2.c:201:v2_init_io:: Quota inode 4 corrupted: file
size 73728 does not match page offset 19
[ERROR] quotaio_v2.c:201:v2_init_io:: Quota inode 5 corrupted: file
size 120832 does not match page offset 30
[ERROR] quotaio_v2.c:201:v2_init_io:: Quota inode 6 corrupted: file
size 27648 does not match page offset 7

The resize.f2fs process was stuck at 100% CPU usage the whole time.
Maybe this can be improved with a more efficient algorithm or
parallelizing, but that's another discussion.
The whole process took about 5 minutes, when the resize.f2fs was
pinned at cpu7 (Cortex-X1).

I've also confirmed that the files are exactly the same before and
after the shrink (checked via rsync -c). This took 25 minutes.
All in all, I'm glad to find out that shrinking works on f2fs well. No
error logs on dmesg either.

Also, I believe man/resize.f2fs.8 needs to be updated:
`Current version only supports expanding the prebuilt filesystem.`

Used versions:
f2fs-tools 1.15.0
Linux v5.4.197 with 5.19-rc1-5.4 merged

Here's the full commands & outputs that I've used:
---- Snapshot creation ----
# echo 10G > /sys/block/zram0/disksize
# dmsetup create snap --table "0 464059800 snapshot
/dev/block/bootdevice/by-name/userdata /dev/block/zram0 N 256"

---- Initial fsck before resize ----
# fsck.f2fs -y -f /dev/block/mapper/snap
Info: Force to fix corruption
Info: Force to fix corruption
Info: MKFS version
  "5.4.179-arter97-gbc35154ef66c"
Info: FSCK version
  from "5.4-arter97"
    to "Linux version 5.4.197-arter97-r21b2-69720-g84bf16de46b9
(arter97@arter97-dgist) (Android (8508608, based on r450784e) clang
version 14.0.7 (https://android.googlesource.com/toolchain/llvm-project
4c603efb0cca074e9238af8b4106c30add4418f6), LLD 14.0.7) #"
Info: superblock features = 1499 :  encrypt verity extra_attr
project_quota quota_ino casefold
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: Segments per section = 1
Info: Sections per zone = 1
Info: total FS sectors = 58007475 (226591 MB)
Info: CKPT version = 6b90089a
Info: checkpoint state = 44 :  crc compacted_summary sudden-power-off
[FSCK] Check node 1 / 501313 (0.00%)
[FSCK] Check node 50132 / 501313 (10.00%)
[FSCK] Check node 100263 / 501313 (20.00%)
[FSCK] Check node 150394 / 501313 (30.00%)
[FSCK] Check node 200525 / 501313 (40.00%)
[FSCK] Check node 250656 / 501313 (50.00%)
[FSCK] Check node 300787 / 501313 (60.00%)
[FSCK] Check node 350918 / 501313 (70.00%)
[FSCK] Check node 401049 / 501313 (80.00%)
[FSCK] Check node 451180 / 501313 (90.00%)
[FSCK] Check node 501311 / 501313 (100.00%)
[fsck_chk_quota_files:2035] Fixing Quota file ([  0] ino [0x4])
[fsck_chk_quota_files:2035] Fixing Quota file ([  1] ino [0x5])
[fsck_chk_quota_files:2035] Fixing Quota file ([  2] ino [0x6])

[FSCK] Max image size: 206671 MB, Free space: 126217 MB
[FSCK] Unreachable nat entries                        [Ok..] [0x0]
[FSCK] SIT valid block bitmap checking                [Ok..]
[FSCK] Hard link checking for regular file            [Ok..] [0xa]
[FSCK] valid_block_count matching with CP             [Ok..] [0x17deab6]
[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x7a641]
[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x7a641]
[FSCK] valid_inode_count matched with CP              [Ok..] [0x76cec]
[FSCK] free segment_count matched with CP             [Ok..] [0xfa30]
[FSCK] next block offset is free                      [Ok..]
[FSCK] fixing SIT types
[FSCK] other corrupted bugs                           [Ok..]
Info: Duplicate valid checkpoint to mirror position 1024 -> 512
Info: Write valid nat_bits in checkpoint
Info: Write valid nat_bits in checkpoint

Done: 0.000000 secs

---- Resize ----
# resize.f2fs -s -t 47185920 /dev/block/mapper/snap
Info: MKFS version
  "5.4.179-arter97-gbc35154ef66c"
Info: FSCK version
  from "5.4-arter97"
    to "Linux version 5.4.197-arter97-r21b2-69720-g84bf16de46b9
(arter97@arter97-dgist) (Android (8508608, based on r450784e) clang
version 14.0.7 (https://android.googlesource.com/toolchain/llvm-project
4c603efb0cca074e9238af8b4106c30add4418f6), LLD 14.0.7) #"
Info: superblock features = 1499 :  encrypt verity extra_attr
project_quota quota_ino casefold
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: Segments per section = 1
Info: Sections per zone = 1
Info: total FS sectors = 58007475 (226591 MB)
Info: CKPT version = 6b90089a
[FIX] (move_one_curseg_info:2857)  --> Move curseg[0] 70 -> 161cc after 2d00000

[FIX] (move_one_curseg_info:2857)  --> Move curseg[1] 890 -> 161cb after 2d00000

[FIX] (move_one_curseg_info:2857)  --> Move curseg[2] 8af -> 161cd after 2d00000

[FIX] (move_one_curseg_info:2857)  --> Move curseg[3] a8 -> 161ca after 2d00000

[FIX] (move_one_curseg_info:2857)  --> Move curseg[4] 117 -> 161c9 after 2d00000

[FIX] (move_one_curseg_info:2857)  --> Move curseg[5] 16d9 -> 161c8
after 2d00000

Info: Write valid nat_bits in checkpoint
Try to do defragement: Done
[update_superblock: 701] Info: Done to update superblock
Info: Write valid nat_bits in checkpoint
[rebuild_checkpoint: 591] Info: Done to rebuild checkpoint blocks

Done: 0.000000 secs

---- 1st fsck after resize ----
# fsck.f2fs -y -f /dev/block/mapper/snap
Info: Force to fix corruption
Info: Force to fix corruption
Info: MKFS version
  "5.4.179-arter97-gbc35154ef66c"
Info: FSCK version
  from "5.4-arter97"
    to "Linux version 5.4.197-arter97-r21b2-69720-g84bf16de46b9
(arter97@arter97-dgist) (Android (8508608, based on r450784e) clang
version 14.0.7 (https://android.googlesource.com/toolchain/llvm-project
4c603efb0cca074e9238af8b4106c30add4418f6), LLD 14.0.7) #"
Info: superblock features = 1499 :  encrypt verity extra_attr
project_quota quota_ino casefold
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: Segments per section = 1
Info: Sections per zone = 1
Info: total FS sectors = 47185920 (184320 MB)
Invalid CP CRC offset: 0
Info: CKPT version = 6b90089b
Info: Checked valid nat_bits in checkpoint
Info: checkpoint state = 81 :  nat_bits unmount
[FSCK] Check node 1 / 501313 (0.00%)
[FSCK] Check node 50132 / 501313 (10.00%)
[FSCK] Check node 100263 / 501313 (20.00%)
[FSCK] Check node 150394 / 501313 (30.00%)
[FSCK] Check node 200525 / 501313 (40.00%)
[FSCK] Check node 250656 / 501313 (50.00%)
[FSCK] Check node 300787 / 501313 (60.00%)
[FSCK] Check node 350918 / 501313 (70.00%)
[FSCK] Check node 401049 / 501313 (80.00%)
[FSCK] Check node 451180 / 501313 (90.00%)
[FSCK] Check node 501311 / 501313 (100.00%)
[ERROR] quotaio_v2.c:201:v2_init_io:: Quota inode 4 corrupted: file
size 73728 does not match page offset 19
[ERROR] quotaio_v2.c:201:v2_init_io:: Quota inode 5 corrupted: file
size 120832 does not match page offset 30
[ERROR] quotaio_v2.c:201:v2_init_io:: Quota inode 6 corrupted: file
size 27648 does not match page offset 7

[FSCK] Max image size: 184108 MB, Free space: 84135 MB
[FSCK] Unreachable nat entries                        [Ok..] [0x0]
[FSCK] SIT valid block bitmap checking                [Ok..]
[FSCK] Hard link checking for regular file            [Ok..] [0xa]
[FSCK] valid_block_count matching with CP             [Ok..] [0x17deab6]
[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x7a641]
[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x7a641]
[FSCK] valid_inode_count matched with CP              [Ok..] [0x76cec]
[FSCK] free segment_count matched with CP             [Ok..] [0xa79c]
[FSCK] next block offset is free                      [Ok..]
[FSCK] fixing SIT types
[FSCK] other corrupted bugs                           [Ok..]

Done: 0.000000 secs

---- 2nd fsck after resize ----
# fsck.f2fs -y -f /dev/block/mapper/snap
Info: Force to fix corruption
Info: Force to fix corruption
Info: MKFS version
  "5.4.179-arter97-gbc35154ef66c"
Info: FSCK version
  from "5.4-arter97"
    to "Linux version 5.4.197-arter97-r21b2-69720-g84bf16de46b9
(arter97@arter97-dgist) (Android (8508608, based on r450784e) clang
version 14.0.7 (https://android.googlesource.com/toolchain/llvm-project
4c603efb0cca074e9238af8b4106c30add4418f6), LLD 14.0.7) #"
Info: superblock features = 1499 :  encrypt verity extra_attr
project_quota quota_ino casefold
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: Segments per section = 1
Info: Sections per zone = 1
Info: total FS sectors = 47185920 (184320 MB)
Invalid CP CRC offset: 0
Info: CKPT version = 6b90089b
Info: Checked valid nat_bits in checkpoint
Info: checkpoint state = 81 :  nat_bits unmount
[FSCK] Check node 1 / 501313 (0.00%)
[FSCK] Check node 50132 / 501313 (10.00%)
[FSCK] Check node 100263 / 501313 (20.00%)
[FSCK] Check node 150394 / 501313 (30.00%)
[FSCK] Check node 200525 / 501313 (40.00%)
[FSCK] Check node 250656 / 501313 (50.00%)
[FSCK] Check node 300787 / 501313 (60.00%)
[FSCK] Check node 350918 / 501313 (70.00%)
[FSCK] Check node 401049 / 501313 (80.00%)
[FSCK] Check node 451180 / 501313 (90.00%)
[FSCK] Check node 501311 / 501313 (100.00%)

[FSCK] Max image size: 184108 MB, Free space: 84135 MB
[FSCK] Unreachable nat entries                        [Ok..] [0x0]
[FSCK] SIT valid block bitmap checking                [Ok..]
[FSCK] Hard link checking for regular file            [Ok..] [0xa]
[FSCK] valid_block_count matching with CP             [Ok..] [0x17deab6]
[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x7a641]
[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x7a641]
[FSCK] valid_inode_count matched with CP              [Ok..] [0x76cec]
[FSCK] free segment_count matched with CP             [Ok..] [0xa79c]
[FSCK] next block offset is free                      [Ok..]
[FSCK] fixing SIT types
[FSCK] other corrupted bugs                           [Ok..]

Done: 0.000000 secs

---- Before & after check ----
# mkdir /tmp/1 /tmp/2
# losetup -f -r /dev/block/by-name/userdata
# mount -t f2fs -o ro /dev/block/loop0 /tmp/1
# mount -t f2fs -o ro /dev/block/mapper/snap /tmp/2
# rsync -ahxvc --info=progress2 1/ 2/
sending incremental file list
              0   0%    0.00kB/s    0:00:00 (xfr#0, to-chk=0/486687)

sent 25.22M bytes  received 90.17K bytes  16.92K bytes/sec
total size is 101.04G  speedup is 3,991.40
# dmesg | grep -i f2fs
[ 2462.787850] F2FS-fs (loop0): Using encoding defined by superblock:
utf8-12.1.0 with flags 0x0
[ 2462.929670] F2FS-fs (loop0): recover fsync data on readonly fs
[ 2462.976133] F2FS-fs (loop0): write access unavailable, skipping recovery
[ 2462.976135] F2FS-fs (loop0): Mounted with checkpoint version = 6b90089a
[ 2475.857335] F2FS-fs (dm-0): Using encoding defined by superblock:
utf8-12.1.0 with flags 0x0
[ 2475.876950] F2FS-fs (dm-0): Found nat_bits in checkpoint
[ 2475.913980] F2FS-fs (dm-0): recover fsync data on readonly fs
[ 2475.940111] F2FS-fs (dm-0): Mounted with checkpoint version = 6b9009b7

After the whole operation, zram0 usage was 3 GiB (uncompressed size).


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
