Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 096EF2153BE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jul 2020 10:11:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jsMDz-0002r8-IO; Mon, 06 Jul 2020 08:11:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pahome.chen@mirlab.org>) id 1jsMDx-0002qk-VY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jul 2020 08:11:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JB/CzY2/my0pU6EXs3LtMRCHyMFyFOoF/WxIhscM14o=; b=iZ9lFsCpUER9un30s7wHl560ev
 N/Rr8JWtjQs8wpMpO05lTmPpyVcEtJuHiOrC8N4s3dDJDgszdf1L+sHwaOLmBCoBXl2Xq9mt++FA/
 oT3ZTxUf7OJRyABtqez6Ra/Ej3/c2AZuytunKwcWQxh/a0XmLpqpQJB0r0F1yzKZ77CE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JB/CzY2/my0pU6EXs3LtMRCHyMFyFOoF/WxIhscM14o=; b=iwBto4lZnEwNeC4i4XDK2Ax935
 j4UNlvoiZ29ibGfkXberPmMF+byY7TEvURMyiLNIugFstfdtV7KaSs7Tt7Oq69zdt6Th12bTP8/N6
 d1piIEnRk5f+SKfsJIo/dJ2M8B/j/18TS7SVwpPksBryVlKJ4v/qc5OzKpEg09KPtJfg=;
Received: from mail-ej1-f67.google.com ([209.85.218.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jsMDw-0093PF-PC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jul 2020 08:11:37 +0000
Received: by mail-ej1-f67.google.com with SMTP id l12so41404520ejn.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 06 Jul 2020 01:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mirlab-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JB/CzY2/my0pU6EXs3LtMRCHyMFyFOoF/WxIhscM14o=;
 b=KRxa6lh2KIbY6mYGsORIvt0CHasyZi1/xcd0fvq6eRF5+hwlFK7gWa2WHE81j7+5i3
 4aQp/zzidTGn2V/zPkWJ2DEx85GeGVBLUybnIYyGuAzYNlmuOitfZCXFE/yrrNq+WHAR
 E64vxb40a8l0EQAyOYfsQVAvLg93k2mzZTWqkMW9PxPhKGbtNhdA78XRmZxrSbD1pQVb
 vGDva0rnj7x0L1DW3vxFLXGwZtGkqq5Snwa973LlpSRfJ80zXnJeAe7XmcrcX73tyilB
 uc06jrBkRio9OifmtEu45GQ+zlQjAMPSliw7ZQNqHFk51SOVjcuAMFWqmZXNmGxvOOB1
 3uRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JB/CzY2/my0pU6EXs3LtMRCHyMFyFOoF/WxIhscM14o=;
 b=EvWF4MExouJKMtJgL5hwM3hyMH/uYFdmDbckl/1vOIcBJ31cIoaTILTKd8VN7WTAX5
 vd+hi7ec4aZ/zacIDR/Z6ztd4qLHqBEgvGdq/XqTW9upaTAKVSuQt0JyhPVBad19Mr5a
 Q7BTyEzAucP0yAya7yI2C0Wu8sEy+PeJWWgjdXMPA5+0zhFVhMsy5tOtgKfCpAmzldue
 m34l08rOcW2gGVCuCYuHoPJN25oglX6hGmKNVZacJT5/BsnjUfnGi8lOrk1Wpv5drqsJ
 c6Si+lOrDcWcuZFnNLSifw4AjVNRpCaFaU636/jb1mjEJJSMifNWVCEtyjwzKPYm3n7A
 Qu5Q==
X-Gm-Message-State: AOAM533+vc/pps6TRxA5u+wbKu/KEc3wX6KCNZ53NfsQyEDU4MB6YLYu
 iHtdR2FU0rn2GD/Pwmmb/wuq3DRz+oqWMJ6bcXRjmJSjLU8=
X-Google-Smtp-Source: ABdhPJw+5N51ee8fZD2B5TpxAuWUOcVYq0l1TRVEgqdPssPSlPorq0kB0hcaGs7fIw0v2A25H6wMzbOUOKzZ1Hi0qGs=
X-Received: by 2002:a17:906:60d0:: with SMTP id
 f16mr37388909ejk.17.1594023083037; 
 Mon, 06 Jul 2020 01:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAB3eZfvyo4OzN_odXsnvDO6E=YHTt4qe5CXqQUyG7Mrk+MhzaQ@mail.gmail.com>
 <0ea89e42-8ea7-5557-8717-26d2e6965104@huawei.com>
 <CAB3eZfsjaNxMK+0HqYNAQQgksgGZNOO7QAXoT_Lgqr1+mPss3w@mail.gmail.com>
 <a80be8b3-75d1-33c8-a4da-b4c336ae53be@huawei.com>
In-Reply-To: <a80be8b3-75d1-33c8-a4da-b4c336ae53be@huawei.com>
From: lampahome <pahome.chen@mirlab.org>
Date: Mon, 6 Jul 2020 16:11:14 +0800
Message-ID: <CAB3eZfuVcAz56N5Cb8+BEsdRtfLWxxd0O+=aY8+qFhFaiAZWLw@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.218.67 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.67 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jsMDw-0093PF-PC
Subject: Re: [f2fs-dev] Can I know if now is gc-ing or checkpointing?
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Brief procedures:
parted /dev/sdd1 as 160GB disk
mkfs -t f2fs /dev/sdd1
mount /dev/sdd1 /mnt/f2fsdir

I use shell script to create 20 fio concurrently and wait for finish.
fio command:
fio -bs=4k -iodepth=4 -rw=write -ioengine=libaio -name=my -direct=0
-size=1G -runtime=6000 -filename /mnt/f2fsdir/ggg$id
// $id correspond to number of fio, so $id range is 1~20



Status before fio:
=====[ partition info(sdd1). #0, RW, CP: Good]=====
[SB: 1] [CP: 2] [SIT: 6] [NAT: 114] [SSA: 153] [MAIN:
77849(OverProv:794 Resv:400)]

Utilization: 0% (2 valid blocks, 39858686 discard blocks)
  - Node: 1 (Inode: 1, Other: 0)
  - Data: 1
  - Inline_xattr Inode: 0
  - Inline_data Inode: 0
  - Inline_dentry Inode: 0
  - Orphan/Append/Update Inode: 0, 0, 0

Main area: 77849 segs, 77849 secs 77849 zones
  - COLD  data: 0, 0, 0
  - WARM  data: 1, 1, 1
  - HOT   data: 77845, 77845, 77845
  - Dir   dnode: 77848, 77848, 77848
  - File   dnode: 77847, 77847, 77847
  - Indir nodes: 77846, 77846, 77846

  - Valid: 6
  - Dirty: 0
  - Prefree: 0
  - Free: 77843 (77843)

CP calls: 1 (BG: 0)
  - cp blocks : 3
  - sit blocks : 0
  - nat blocks : 0
  - ssa blocks : 0
GC calls: 0 (BG: 0)
  - data segments : 0 (0)
  - node segments : 0 (0)
Try to move 0 blocks (BG: 0)
  - data blocks : 0 (0)
  - node blocks : 0 (0)
Skipped : atomic write 0 (0)
BG skip : IO: 0, Other: 0

Extent Cache:
  - Hit Count: L1-1:0 L1-2:0 L2:0
  - Hit Ratio: 0% (0 / 0)
  - Inner Struct Count: tree: 0(0), node: 0

Balancing F2FS Async:
  - DIO (R:    0, W:    0)
  - IO_R (Data:    0, Node:    0, Meta:    0
  - IO_W (CP:    0, Data:    0, Flush: (   0    0    1), Discard: (
0    0)) cmd:    0 undiscard:   0
  - inmem:    0, atomic IO:    0 (Max.    0), volatile IO:    0 (Max.    0)
  - nodes:    0 in    0
  - dents:    0 in dirs:   0 (   0)
  - datas:    0 in files:   0
  - quota datas:    0 in quota files:   0
  - meta:    0 in    0
  - imeta:    0
  - NATs:         0/        0
  - SITs:         0/    77849
  - free_nids:      3636/ 13278716
  - alloc_nids:         0

Distribution of User Blocks: [ valid | invalid | free ]
  [|-|-------------------------------------------------]

IPU: 0 blocks
SSR: 0 blocks in 0 segments
LFS: 1 blocks in 0 segments

BDF: 99, avg. vblocks: 0

Memory: 19767 KB
  - static: 19674 KB
  - cached: 93 KB
  - paged : 0 KB

Status after fio:
=====[ partition info(sdd1). #0, RW, CP: Good]=====
[SB: 1] [CP: 2] [SIT: 6] [NAT: 114] [SSA: 153] [MAIN:
77849(OverProv:794 Resv:400)]

Utilization: 13% (5248062 valid blocks, 34610626 discard blocks)
  - Node: 5181 (Inode: 21, Other: 5160)
  - Data: 5242881
  - Inline_xattr Inode: 20
  - Inline_data Inode: 0
  - Inline_dentry Inode: 0
  - Orphan/Append/Update Inode: 0, 0, 0

Main area: 77849 segs, 77849 secs 77849 zones
  - COLD  data: 0, 0, 0
  - WARM  data: 10260, 10260, 10260
  - HOT   data: 10023, 10023, 10023
  - Dir   dnode: 77848, 77848, 77848
  - File   dnode: 10184, 10184, 10184
  - Indir nodes: 77846, 77846, 77846

  - Valid: 10244
  - Dirty: 10
  - Prefree: 0
  - Free: 67595 (67595)

CP calls: 7 (BG: 6)
  - cp blocks : 27
  - sit blocks : 195
  - nat blocks : 42
  - ssa blocks : 10259
GC calls: 1 (BG: 2)
  - data segments : 1 (1)
  - node segments : 0 (0)
Try to move 511 blocks (BG: 511)
  - data blocks : 511 (511)
  - node blocks : 0 (0)
Skipped : atomic write 0 (0)
BG skip : IO: 4, Other: 0

Extent Cache:
  - Hit Count: L1-1:0 L1-2:0 L2:0
  - Hit Ratio: 0% (0 / 1020)
  - Inner Struct Count: tree: 20(0), node: 1003

Balancing F2FS Async:
  - DIO (R:    0, W:    0)
  - IO_R (Data:    0, Node:    0, Meta:    0
  - IO_W (CP:    0, Data:    0, Flush: (   0    0    1), Discard: (
0    0)) cmd:    0 undiscard:   0
  - inmem:    0, atomic IO:    0 (Max.    0), volatile IO:    0 (Max.    0)
  - nodes:    0 in 1980
  - dents:    0 in dirs:   0 (   0)
  - datas:    0 in files:   0
  - quota datas:    0 in quota files:   0
  - meta:    0 in  670
  - imeta:    0
  - NATs:         0/     1154
  - SITs:         0/    77849
  - free_nids:      2096/ 13273536
  - alloc_nids:         0

Distribution of User Blocks: [ valid | invalid | free ]
  [------|-|-------------------------------------------]

IPU: 0 blocks
SSR: 0 blocks in 0 segments
LFS: 5253829 blocks in 10259 segments

BDF: 99, avg. vblocks: 387

Memory: 30432 KB
  - static: 19674 KB
  - cached: 157 KB
  - paged : 10600 KB


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
