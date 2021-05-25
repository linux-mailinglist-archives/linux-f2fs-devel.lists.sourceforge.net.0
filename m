Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D67F38FC13
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 May 2021 10:04:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1llS2z-0003TO-66; Tue, 25 May 2021 08:04:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1llS2p-0003Rl-Iz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 08:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jBiK99pYCu2dQDg+DKKZCD5t3FWXDdtg7ALKw5dN8AE=; b=Bjv7U6RVckokUApXw4QxAIdyfd
 oOpdTjhBRWtBAvh8IFRUXeEboBRCXEikTLXxSdLv/p/Bm7uLcKH5FT/zgoTCnw9r8XcnfN1zPDWFT
 rxq+41l8bndEmCQaQtSdfXzlw+Sn3ZspbWTztJf5HOXleDrMwfSYvQ7DcTOQiDDxKA5I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jBiK99pYCu2dQDg+DKKZCD5t3FWXDdtg7ALKw5dN8AE=; b=I
 sYtOXvcu8h5aUrBLaeiL/8o7++BoM8JDOcdcLBcDFJnjiwo8kVX10wFzBExDaqF3U9wB0mKpPOu3U
 7J3rGvlsB1o6pJ8hKHTRmrf/TU/Uoo8xsvPI8EAkXtILrWeJY2J9LRuiMAEdh95dEIqlg8Isl1zWS
 Mun2nRfIlQm+JeAU=;
Received: from mail-ed1-f51.google.com ([209.85.208.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1llS2l-0053Bv-K1
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 08:04:08 +0000
Received: by mail-ed1-f51.google.com with SMTP id o5so26053481edc.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 May 2021 01:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=jBiK99pYCu2dQDg+DKKZCD5t3FWXDdtg7ALKw5dN8AE=;
 b=VBn3HymYNZAzyUxRimb8qnNOhy0e7pf4KkgvpYGMmq+KJTH3h9iftl+yBLu75t9t5S
 4qgaX84DuC74iReOAmV1fZfk8dcUH7HvuHcOB/M9WUa4E6MQCBLw8RzrQZgn2OpK6FO/
 v9L8vXl8BrOpY6utd6SyMnhPCRkJHeKkGEb0OqjRdYCUQQrxlpMlXzxPWdoD21adjwP7
 1leGXHmVu4g5mnCghapv7xMlmcjiMW5rPZpBNQJ0pOUPsqsu57dNV+Uadnz5iH38b/z9
 VVRqG7IXI0OjVqLIt1KE3okOwYCBCl8Nd1YssR7fCM+Rl/1feFoOiqSg2ILS9GvhVx04
 fnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=jBiK99pYCu2dQDg+DKKZCD5t3FWXDdtg7ALKw5dN8AE=;
 b=pzB5uynveMg0a7cJarhjdi1TWm1Peuu0CLUEn6n9zozNzEFVUmzOS48b1QB+ZSu51z
 0ggliEi+Ys8w92gJGWHKYxl97Ym39+n8ftJ9+bH6SCM/pydByooJABucTg8IgYhhDsUJ
 W1arZdbpuwkrDQCfu/CUQa1ywfpD2AdLg4EQOKkrc2+ngbOiABQbRGNg0VSFz1o7SX15
 FANIQJkmkeprATD+xiDwhVhb0OOJGIHhMbhoqIHiPIHhrcOffiHC5L0+mcbsnnCPn+hc
 ybZPir71OcqYWhNTMdxsh82qJte52yE5qdqkCMrZnuDQB2Z11LSmcfxabbM/TOMQXm2/
 9hGg==
X-Gm-Message-State: AOAM533S+QswjfeSXpEjmjHfx/G561qObH9yzK3zk+ZxrIKPUSX/YELT
 UaYmhceXb/s1MRWoddg2v7eSmgaXVM1iou/5UOECbWfCIdyf33zq
X-Google-Smtp-Source: ABdhPJwXHFxR+nxgphe5+ZuDn7w09DUNveGyJnucaMM3yh0R66zSOhGf+gNxYSg3kiGS4JkyNqXgoxkabeqRJtPuda0=
X-Received: by 2002:aa7:d94f:: with SMTP id l15mr31583127eds.235.1621929836904; 
 Tue, 25 May 2021 01:03:56 -0700 (PDT)
MIME-Version: 1.0
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Tue, 25 May 2021 17:03:45 +0900
Message-ID: <CAD14+f3k7LB7w_XyfQGFRYDKbM9GoD8n7gos2URPjGrzeEEwUw@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: 2.1 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.0 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.51 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.51 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1llS2l-0053Bv-K1
Subject: [f2fs-dev] Multiple fsck runs required to fix quota
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

Hi.

I'm reporting a possible issue with fsck requiring multiple runs to fix quota.

The fsck version is the latest master branch, statically compiled
under arm64 flavor of Ubuntu and was executed under recovery mode.

First run:
OnePlus7Pro:/ # /fsck.f2fs -a -f /dev/block/sda19
Info: Fix the reported corruption.
Info: Force to fix corruption
Info: [/dev/block/sda19] Disk Model: KLUEG8UHDB-C2D1
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 4096
Info: total sectors = 59463283 (232278 MB)
Info: MKFS version
  "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang version
8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST 2019"
Info: FSCK version
  from "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang
version 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST
2019"
    to "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang
version 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST
2019"
Info: superblock features = 80 :  quota_ino
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: total FS sectors = 59463283 (232278 MB)
Info: CKPT version = 5a6b3a3
Info: checkpoint state = 45 :  crc compacted_summary unmount
[ERROR] quotaio_v2.c:201:v2_init_io:: Quota inode 4 corrupted: file
size 88064 does not match page offset 28
[fsck_chk_quota_files:1880] Fixing Quota file ([  0] ino [0x4])
[ERROR] quotaio_v2.c:201:v2_init_io:: Quota inode 5 corrupted: file
size 160768 does not match page offset 53
[fsck_chk_quota_files:1880] Fixing Quota file ([  1] ino [0x5])

[FSCK] Unreachable nat entries                        [Ok..] [0x0]
[FSCK] SIT valid block bitmap checking                [Ok..]
[FSCK] Hard link checking for regular file            [Ok..] [0x153c]
[FSCK] valid_block_count matching with CP             [Ok..] [0x1e13d74]
[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x9d260]
[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x9d260]
[FSCK] valid_inode_count matched with CP              [Ok..] [0x98b99]
[FSCK] free segment_count matched with CP             [Ok..] [0xd395]
[FSCK] next block offset is free                      [Ok..]
[FSCK] fixing SIT types
[FSCK] other corrupted bugs                           [Fail]
Info: Duplicate valid checkpoint to mirror position 1024 -> 512
Info: Write valid nat_bits in checkpoint
Info: Write valid nat_bits in checkpoint

Done: 75.117901 secs
1|OnePlus7Pro:/ #

As you can see, the first run returns 1.

Second run:
1|OnePlus7Pro:/ # /fsck.f2fs -a -f /dev/block/sda19
Info: Fix the reported corruption.
Info: Force to fix corruption
Info: [/dev/block/sda19] Disk Model: KLUEG8UHDB-C2D1
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 4096
Info: total sectors = 59463283 (232278 MB)
Info: MKFS version
  "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang version
8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST 2019"
Info: FSCK version
  from "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang
version 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST
2019"
    to "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang
version 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST
2019"
Info: superblock features = 80 :  quota_ino
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: total FS sectors = 59463283 (232278 MB)
Info: CKPT version = 5a6b3a3
Info: Checked valid nat_bits in checkpoint
Info: checkpoint state = 281 :  allow_nocrc nat_bits unmount
[ERROR] quotaio_v2.c:201:v2_init_io:: Quota inode 4 corrupted: file
size 88064 does not match page offset 28
[ERROR] quotaio_v2.c:201:v2_init_io:: Quota inode 5 corrupted: file
size 159744 does not match page offset 53

[FSCK] Unreachable nat entries                        [Ok..] [0x0]
[FSCK] SIT valid block bitmap checking                [Ok..]
[FSCK] Hard link checking for regular file            [Ok..] [0x153c]
[FSCK] valid_block_count matching with CP             [Ok..] [0x1e13d74]
[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x9d260]
[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x9d260]
[FSCK] valid_inode_count matched with CP              [Ok..] [0x98b99]
[FSCK] free segment_count matched with CP             [Ok..] [0xd395]
[FSCK] next block offset is free                      [Ok..]
[FSCK] fixing SIT types
[FSCK] other corrupted bugs                           [Ok..]

Done: 73.506501 secs
OnePlus7Pro:/ #

We can see that it returns 0, but still prints "Quota inode # corrupted".

Third run:
OnePlus7Pro:/ # /fsck.f2fs -a -f /dev/block/sda19
Info: Fix the reported corruption.
Info: Force to fix corruption
Info: [/dev/block/sda19] Disk Model: KLUEG8UHDB-C2D1
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 4096
Info: total sectors = 59463283 (232278 MB)
Info: MKFS version
  "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang version
8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST 2019"
Info: FSCK version
  from "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang
version 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST
2019"
    to "Linux version 4.14.117-perf+ (OnePlus@rd-build-81) (clang
version 8.0.8 for Android NDK) #1 SMP PREEMPT Tue Sep 17 21:09:27 CST
2019"
Info: superblock features = 80 :  quota_ino
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: total FS sectors = 59463283 (232278 MB)
Info: CKPT version = 5a6b3a3
Info: Checked valid nat_bits in checkpoint
Info: checkpoint state = 281 :  allow_nocrc nat_bits unmount

[FSCK] Unreachable nat entries                        [Ok..] [0x0]
[FSCK] SIT valid block bitmap checking                [Ok..]
[FSCK] Hard link checking for regular file            [Ok..] [0x153c]
[FSCK] valid_block_count matching with CP             [Ok..] [0x1e13d74]
[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x9d260]
[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x9d260]
[FSCK] valid_inode_count matched with CP              [Ok..] [0x98b99]
[FSCK] free segment_count matched with CP             [Ok..] [0xd395]
[FSCK] next block offset is free                      [Ok..]
[FSCK] fixing SIT types
[FSCK] other corrupted bugs                           [Ok..]

Done: 68.652988 secs

Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
