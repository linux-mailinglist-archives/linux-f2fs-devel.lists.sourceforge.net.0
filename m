Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 887E721542F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jul 2020 10:52:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jsMr3-0001ZR-5M; Mon, 06 Jul 2020 08:52:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jsMr1-0001ZE-Ma
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jul 2020 08:51:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E1cSvUTKjF5I15A+UeYJGBGGyDzXgPQ4COIfZjjFyoI=; b=AsnOCCxcXV9uVZjDKKs9pxbHIg
 jruuicusbEmHrTnspWISZJu0Jj81insF3eS8DWV6JCfPf3lypFwVBY/KqekeozCUzN19/Gc6GnSAj
 VHHn7COkPt56VcrLpiVAIjUZdFXuKhwVjtJUtxkLufF6sTP8b6HIZM2wnHWR1C8SAaNQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E1cSvUTKjF5I15A+UeYJGBGGyDzXgPQ4COIfZjjFyoI=; b=QelW2uX+AMHLYo1LreiS/OJsnW
 6zOXw5R2Kx752PCZJgYvwMdiNYgqrofzJ0bDJAn+Tv7EHrQb1DvrZR6JqoAN+1JQ//gxY3wrw4xUn
 6c5hvxT5LZDbPJeA2x0Vyj7kn8nJq8VUG9/g7WZLhUkxhA138fKvCdcANTJ8fwAZQVN0=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jsMqz-0096hX-E9
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jul 2020 08:51:59 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 55ECCDAE60758D264D3A;
 Mon,  6 Jul 2020 16:51:49 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 6 Jul 2020
 16:51:48 +0800
To: lampahome <pahome.chen@mirlab.org>
References: <CAB3eZfvyo4OzN_odXsnvDO6E=YHTt4qe5CXqQUyG7Mrk+MhzaQ@mail.gmail.com>
 <0ea89e42-8ea7-5557-8717-26d2e6965104@huawei.com>
 <CAB3eZfsjaNxMK+0HqYNAQQgksgGZNOO7QAXoT_Lgqr1+mPss3w@mail.gmail.com>
 <a80be8b3-75d1-33c8-a4da-b4c336ae53be@huawei.com>
 <CAB3eZfuVcAz56N5Cb8+BEsdRtfLWxxd0O+=aY8+qFhFaiAZWLw@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <2b4fc09f-126c-9f33-9f56-4e72d51eb012@huawei.com>
Date: Mon, 6 Jul 2020 16:51:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAB3eZfuVcAz56N5Cb8+BEsdRtfLWxxd0O+=aY8+qFhFaiAZWLw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jsMqz-0096hX-E9
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

On 2020/7/6 16:11, lampahome wrote:
> Brief procedures:
> parted /dev/sdd1 as 160GB disk
> mkfs -t f2fs /dev/sdd1
> mount /dev/sdd1 /mnt/f2fsdir
> 
> I use shell script to create 20 fio concurrently and wait for finish.
> fio command:
> fio -bs=4k -iodepth=4 -rw=write -ioengine=libaio -name=my -direct=0

Why not using direct=1 combining with libaio? otherwise data was only
written to cache.

> -size=1G -runtime=6000 -filename /mnt/f2fsdir/ggg$id
> // $id correspond to number of fio, so $id range is 1~20
> 
> 
> 

Below info shows GC or CP didn't affect the test result.

> Status before fio:
> =====[ partition info(sdd1). #0, RW, CP: Good]=====
> [SB: 1] [CP: 2] [SIT: 6] [NAT: 114] [SSA: 153] [MAIN:
> 77849(OverProv:794 Resv:400)]
> 
> Utilization: 0% (2 valid blocks, 39858686 discard blocks)
>   - Node: 1 (Inode: 1, Other: 0)
>   - Data: 1
>   - Inline_xattr Inode: 0
>   - Inline_data Inode: 0
>   - Inline_dentry Inode: 0
>   - Orphan/Append/Update Inode: 0, 0, 0
> 
> Main area: 77849 segs, 77849 secs 77849 zones
>   - COLD  data: 0, 0, 0
>   - WARM  data: 1, 1, 1
>   - HOT   data: 77845, 77845, 77845
>   - Dir   dnode: 77848, 77848, 77848
>   - File   dnode: 77847, 77847, 77847
>   - Indir nodes: 77846, 77846, 77846
> 
>   - Valid: 6
>   - Dirty: 0
>   - Prefree: 0
>   - Free: 77843 (77843)
> 
> CP calls: 1 (BG: 0)
>   - cp blocks : 3
>   - sit blocks : 0
>   - nat blocks : 0
>   - ssa blocks : 0
> GC calls: 0 (BG: 0)
>   - data segments : 0 (0)
>   - node segments : 0 (0)
> Try to move 0 blocks (BG: 0)
>   - data blocks : 0 (0)
>   - node blocks : 0 (0)
> Skipped : atomic write 0 (0)
> BG skip : IO: 0, Other: 0
> 
> Extent Cache:
>   - Hit Count: L1-1:0 L1-2:0 L2:0
>   - Hit Ratio: 0% (0 / 0)
>   - Inner Struct Count: tree: 0(0), node: 0
> 
> Balancing F2FS Async:
>   - DIO (R:    0, W:    0)
>   - IO_R (Data:    0, Node:    0, Meta:    0
>   - IO_W (CP:    0, Data:    0, Flush: (   0    0    1), Discard: (
> 0    0)) cmd:    0 undiscard:   0
>   - inmem:    0, atomic IO:    0 (Max.    0), volatile IO:    0 (Max.    0)
>   - nodes:    0 in    0
>   - dents:    0 in dirs:   0 (   0)
>   - datas:    0 in files:   0
>   - quota datas:    0 in quota files:   0
>   - meta:    0 in    0
>   - imeta:    0
>   - NATs:         0/        0
>   - SITs:         0/    77849
>   - free_nids:      3636/ 13278716
>   - alloc_nids:         0
> 
> Distribution of User Blocks: [ valid | invalid | free ]
>   [|-|-------------------------------------------------]
> 
> IPU: 0 blocks
> SSR: 0 blocks in 0 segments
> LFS: 1 blocks in 0 segments
> 
> BDF: 99, avg. vblocks: 0
> 
> Memory: 19767 KB
>   - static: 19674 KB
>   - cached: 93 KB
>   - paged : 0 KB
> 
> Status after fio:
> =====[ partition info(sdd1). #0, RW, CP: Good]=====
> [SB: 1] [CP: 2] [SIT: 6] [NAT: 114] [SSA: 153] [MAIN:
> 77849(OverProv:794 Resv:400)]
> 
> Utilization: 13% (5248062 valid blocks, 34610626 discard blocks)
>   - Node: 5181 (Inode: 21, Other: 5160)
>   - Data: 5242881
>   - Inline_xattr Inode: 20
>   - Inline_data Inode: 0
>   - Inline_dentry Inode: 0
>   - Orphan/Append/Update Inode: 0, 0, 0
> 
> Main area: 77849 segs, 77849 secs 77849 zones
>   - COLD  data: 0, 0, 0
>   - WARM  data: 10260, 10260, 10260
>   - HOT   data: 10023, 10023, 10023
>   - Dir   dnode: 77848, 77848, 77848
>   - File   dnode: 10184, 10184, 10184
>   - Indir nodes: 77846, 77846, 77846
> 
>   - Valid: 10244
>   - Dirty: 10
>   - Prefree: 0
>   - Free: 67595 (67595)
> 
> CP calls: 7 (BG: 6)
>   - cp blocks : 27
>   - sit blocks : 195
>   - nat blocks : 42
>   - ssa blocks : 10259
> GC calls: 1 (BG: 2)
>   - data segments : 1 (1)
>   - node segments : 0 (0)
> Try to move 511 blocks (BG: 511)
>   - data blocks : 511 (511)
>   - node blocks : 0 (0)
> Skipped : atomic write 0 (0)
> BG skip : IO: 4, Other: 0
> 
> Extent Cache:
>   - Hit Count: L1-1:0 L1-2:0 L2:0
>   - Hit Ratio: 0% (0 / 1020)
>   - Inner Struct Count: tree: 20(0), node: 1003
> 
> Balancing F2FS Async:
>   - DIO (R:    0, W:    0)
>   - IO_R (Data:    0, Node:    0, Meta:    0
>   - IO_W (CP:    0, Data:    0, Flush: (   0    0    1), Discard: (
> 0    0)) cmd:    0 undiscard:   0
>   - inmem:    0, atomic IO:    0 (Max.    0), volatile IO:    0 (Max.    0)
>   - nodes:    0 in 1980
>   - dents:    0 in dirs:   0 (   0)
>   - datas:    0 in files:   0
>   - quota datas:    0 in quota files:   0
>   - meta:    0 in  670
>   - imeta:    0
>   - NATs:         0/     1154
>   - SITs:         0/    77849
>   - free_nids:      2096/ 13273536
>   - alloc_nids:         0
> 
> Distribution of User Blocks: [ valid | invalid | free ]
>   [------|-|-------------------------------------------]
> 
> IPU: 0 blocks
> SSR: 0 blocks in 0 segments
> LFS: 5253829 blocks in 10259 segments
> 
> BDF: 99, avg. vblocks: 387
> 
> Memory: 30432 KB
>   - static: 19674 KB
>   - cached: 157 KB
>   - paged : 10600 KB
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
