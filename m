Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 089274D9366
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Mar 2022 05:43:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nTyta-0000rv-Hi; Tue, 15 Mar 2022 04:43:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <qkrwngud825@gmail.com>) id 1nTytZ-0000rp-LK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Mar 2022 04:43:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TLmC6zHwe6bRlz6L0oS5ei3TXF+W/wCaIxR542GqaCA=; b=OhkzBRVFQlOGgQZ72ybQXM5EnX
 bTtDAK9QuBeYko0dJGrvpAb5RmTlwlrZSKQ+NQ4+HQMlKgSVZxr4aZcZa4/n6vnAw77jBTsRIsVH1
 RhxUkWVOIo7fC1+5mBRtNnmDIvaWjcEI3CM9Xgk1x2VVNOj8J9Q4PvS5+FG5wdl1mUHY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TLmC6zHwe6bRlz6L0oS5ei3TXF+W/wCaIxR542GqaCA=; b=MYsASxGvpRcNYByhRRAb2a8z5B
 LGEGhBuXQKsbOJhFm8L7lTPQ3P9wlewfdXDSgoD7t/bByhBjS8V3NkdIRdJt78QUnoZAGvcsV+hPU
 1DsAweJfgtUlgygVnsFy3AeakDhbvU1YMosYHaAVk0+D0ftadMJ3uHb4+MLwqveDALxA=;
Received: from mail-ej1-f52.google.com ([209.85.218.52])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nTz1U-00G80U-18
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Mar 2022 04:43:05 +0000
Received: by mail-ej1-f52.google.com with SMTP id r25so261043eja.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Mar 2022 21:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TLmC6zHwe6bRlz6L0oS5ei3TXF+W/wCaIxR542GqaCA=;
 b=noZxvUmqjVerjLLA0/I4j0JT3bsC0RxaV/SAU8n5+10n9P0vyCjLmhlklyFvSJnXhh
 Erh5cWFMCKENtM8dBTjKL7A5Xd0TLjM0PnupQQulyUZzcPYN+M6dZ0TnTFaIvMHGMCxW
 p5a3GvRZ4/nTC6ym0qpCtcgPtWVJBXEMerJ6NE3fTI6VfdgU0MkxrBineTUUlsySOF/w
 wMU3f6pcEoKtyj4I9nuL2RCzrIXardy6JFOrTEh4RZACBKJ3Y5X3/tCz6b9wVw6gkoH4
 pJRaq+SYJ9S0jGATyMeSkSek0LqUTCx3fg4XT3G5Y307IkSEdrpDomFfNsNUUg/1n5Lm
 1WMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TLmC6zHwe6bRlz6L0oS5ei3TXF+W/wCaIxR542GqaCA=;
 b=lK1n7psyrWuuwaUVk8Eq58e5rrjCGFlmqOrlS37fIEg3iYJZfRcyd1zY/6SLtpmi+z
 T9BUEXqtPRw7ER6o08mOZyzI/NlJEEuMHAg8JAWxCHSRz4niRXIwYKEfilC3drHiYNkB
 zeACUkmwWVvyhdMJX58CUwWrwkenL+OrH7WZ60Nqd9C0OxsbaCfhvZnSrF3eeTxyoz9a
 rtwrtb9/Mxlx7gzZPipvwHkSn60bE0++FLWfc1l1n3TRfjMxGt7RiBAh9LnHcCvl41wd
 oRbWjebj1d9DKosIxRnNki5tk9o8/OMy77E/wXC+7JcdDeP1hkg4u70VP7XF1v+DhTNq
 oi9Q==
X-Gm-Message-State: AOAM5321MH1x3O0W0Fm7qQgFppulggLOm4qWkUUg4tbI/FVXbTP3P7es
 yDP7djyFxE2+TeP7RpZVNcMhDJRvQLxJjevFt2NyHe3oZvI=
X-Google-Smtp-Source: ABdhPJzkIF/u7/wnWNTHW4RtWOEsEn/lhYyKn8ZScftraE4TSqBXs8JrkERdPBuIgQEAnsDY5gTuibLrvLwJBV0JHpI=
X-Received: by 2002:a17:907:78d6:b0:6da:825b:96d with SMTP id
 kv22-20020a17090778d600b006da825b096dmr22139931ejc.460.1647319376192; Mon, 14
 Mar 2022 21:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAD14+f2nBZtLfLC6CwNjgCOuRRRjwzttp3D3iK4Of+1EEjK+cw@mail.gmail.com>
 <Yi/eMwvpeWAjwoER@google.com>
In-Reply-To: <Yi/eMwvpeWAjwoER@google.com>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Tue, 15 Mar 2022 13:42:45 +0900
Message-ID: <CAD14+f1-XdwSs60dxHn5J5RdHe6CtLZiWUgqviiNs-jJ6MTPew@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 1.3 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk. fsck doesn't raise any red flags: Info: Force
 to fix corruption Info: Dry run Info: Segments per section = 1 Info: Sections
 per zone = 1 Info: sector size = 512 Info: total sectors = 11411472 (5572
 MB [...] Content analysis details:   (1.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qkrwngud825[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qkrwngud825[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.52 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.52 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nTz1U-00G80U-18
Subject: Re: [f2fs-dev] EIO returned when reading files from R/O,
 compressed f2fs image
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

Hi Jaegeuk.

fsck doesn't raise any red flags:
Info: Force to fix corruption
Info: Dry run
Info: Segments per section = 1
Info: Sections per zone = 1
Info: sector size = 512
Info: total sectors = 11411472 (5572 MB)
Info: MKFS version
  "5.4.0-62-generic"
Info: FSCK version
  from "5.4.0-62-generic"
    to "Linux version 5.15.0-22-generic (buildd@lcy02-amd64-054) (gcc
(Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0, GNU ld (GNU Binutils for Ubuntu)
2.34) #22~20.04.1-Ubuntu SMP Wed Feb 9 16:21:20 UTC 2022"
Info: superblock features = 6008 :  extra_attr compression ro
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: total FS sectors = 11231232 (5484 MB)
Info: CKPT version = 4321
Info: Checked valid nat_bits in checkpoint
Info: checkpoint state = 81 :  nat_bits unmount
[FSCK] Check node 1 / 9153 (0.01%)
[FSCK] Check node 916 / 9153 (10.01%)
[FSCK] Check node 1831 / 9153 (20.01%)
[FSCK] Check node 2746 / 9153 (30.01%)
[FSCK] Check node 3661 / 9153 (40.01%)
[FSCK] Check node 4576 / 9153 (50.01%)
[FSCK] Check node 5491 / 9153 (60.01%)
[FSCK] Check node 6406 / 9153 (70.01%)
[FSCK] Check node 7321 / 9153 (80.01%)
[FSCK] Check node 8236 / 9153 (90.01%)
[FSCK] Check node 9151 / 9153 (100.01%)

[FSCK] Max image size: 5480 MB, Free space: 0 MB
[FSCK] Unreachable nat entries                        [Ok..] [0x0]
[FSCK] SIT valid block bitmap checking                [Ok..]
[FSCK] Hard link checking for regular file            [Ok..] [0x0]
[FSCK] valid_block_count matching with CP             [Ok..] [0x155d87]
[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x23c1]
[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x23c1]
[FSCK] valid_inode_count matched with CP              [Ok..] [0x1db9]
[FSCK] free segment_count matched with CP             [Ok..] [0x0]
[FSCK] next block offset is free                      [Ok..]
[FSCK] fixing SIT types
[FSCK] other corrupted bugs                           [Ok..]

Done: 0.064030 secs

This is debugfs output, just in case:

=====[ partition info(loop0). #0, RO, CP: Good]=====
[SB: 1] [CP: 2] [SIT: 2] [NAT: 2] [SSA: 0] [MAIN: 2735(OverProv:0 Resv:0)]

Current Time Sec: 125333 / Mounted Time Sec: 125330

Utilization: 99% (1400199 valid blocks, 121 discard blocks)
  - Node: 9153 (Inode: 7609, Other: 1544)
  - Data: 1391046
  - Inline_xattr Inode: 0
  - Inline_data Inode: 0
  - Inline_dentry Inode: 0
  - Compressed Inode: 0, Blocks: 0
  - Orphan/Append/Update Inode: 0, 0, 0

Main area: 2735 segs, 2735 secs 2735 zones
    TYPE            segno    secno   zoneno  dirty_seg   full_seg  valid_blk
  - COLD   data:        0        0        0          0          0          0
  - WARM   data:        0        0        0          0          0          0
  - HOT    data:     2734     2734     2734          1       2716    1391046
  - Dir   dnode:     2661     2661     2661          1         17       9153
  - File  dnode:        0        0        0          0          0          0
  - Indir nodes:        0        0        0          0          0          0
  - Pinned file:       -1       -1       -1
  - ATGC   data:       -1       -1       -1

  - Valid: 2735
  - Dirty: 0
  - Prefree: 0
  - Free: 0 (0)

CP calls: 0 (BG: 0)
  - cp blocks : 0
  - sit blocks : 0
  - nat blocks : 0
  - ssa blocks : 0
CP merge (Queued:    0, Issued:    0, Total:    0, Cur time:    0(ms),
Peak time:    0(ms))
GC calls: 0 (BG: 0)
  - data segments : 0 (0)
  - node segments : 0 (0)
  - Reclaimed segs : Normal (0), Idle CB (0), Idle Greedy (0), Idle AT
(0), Urgent High (0), Urgent Low (0)
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
  - IO_W (CP:    0, Data:    0, Flush: (   0    0    0), Discard: (
0    0)) cmd:    0 undiscard:   0
  - inmem:    0, atomic IO:    0 (Max.    0), volatile IO:    0 (Max.    0)
  - compress:    0, hit:       0
  - nodes:    0 in    1
  - dents:    0 in dirs:   0 (   0)
  - datas:    0 in files:   0
  - quota datas:    0 in quota files:   0
  - meta:    0 in   69
  - imeta:    0
  - NATs:         0/        1
  - SITs:         0/     2735
  - free_nids:         0/   223804
  - alloc_nids:         0

Distribution of User Blocks: [ valid | invalid | free ]
  [-------------------------------------------------|-|]

IPU: 0 blocks
SSR: 0 blocks in 0 segments
LFS: 0 blocks in 0 segments

BDF: 99, avg. vblocks: 0

Memory: 992 KB
  - static: 704 KB
  - cached: 8 KB
  - paged : 280 KB

Thanks.

On Tue, Mar 15, 2022 at 9:30 AM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>
> Juhyung,
>
> On 03/14, Juhyung Park wrote:
> > Hi.
> >
> > We have a production server storing some Android firmwares over a ZFS
> > file-system, and we noticed some issues when extracting firmware files
> > that use f2fs for Android system partitions.
> >
> > This is a proprietary environment, so I cannot disclose every detail,
> > so I hope you understand. I'll try to elaborate as much as I can.
> >
> > The server is running Ubuntu 20.04 with Linux v5.15 (recently upgraded
> > from v5.13 after noticing RO feature added on v5.14 being required).
> > We have a set of scripts extracting Android firmware files. The input
> > is typically the OTA zip file and after going through the script, it
> > extracts every file and binary image from a given file.
> >
> > So that includes extracting super (dynamic partition), ext4 system
> > partitions with dedup enabled, and now, f2fs system partitions with RO
> > and compression enabled.
> >
> > Our script never had to deal with f2fs before as we only started
> > seeing f2fs system partitions with recently released devices.
> >
> > This is the f2fs mount flag after mounting with `mount -o ro
> > system.raw /some/dir`:
> > ro,relatime,lazytime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,extent_cache,mode=adaptive,active_logs=2,alloc_mode=reuse,checkpoint_merge,fsync_mode=posix,compress_algorithm=lz4,compress_log_size=2,compress_mode=fs,discard_unit=block
> >
> > There are *a lot* of files in Android firmware these days, so we try
> > to parallelize parts when we can.
> >
> > This is a snippet of the script:
> > ```
> > #!/bin/bash
> > <...>
> > RSYNC="rsync -ahAXx --inplace --numeric-ids"
> > <...>
> > for val in system vendor product odm; do
> >   if ! ls images/$val.raw > /dev/null 2>&1; then continue; fi
> >
> >   mkdir -p fs
> >   cd fs
> >
> >   mkdir -p $val.mount tmp_$val
> >   mount -o ro ../images/$val.raw $val.mount
> >
> >   $RSYNC $val.mount/ "$DEST_PWD/fs/$val/" &
> >   echo $! > $val.pid
> >   disown
> >
> >   cd $val.mount
> >   find . -type d -exec mkdir -p "$DEST_PWD/strings/$val/"{} \;
> >   find . -type d -exec mkdir -p "../tmp_$val/"{} \;
> >
> >   while read file; do strings "$file" > "$DEST_PWD/strings/$val/$file"
> > & done < <(find . -type f | grep -v '\.apk\|\.jar\|\.zip')
> >   wait
> >
> > <...>
> >
> >   cd ../
> >   rm -rf tmp_$val
> >   cd ../
> > done
> >
> > wait
> > <...>
> > for val in system vendor product odm; do
> >   if ! ls images/$val.raw > /dev/null 2>&1; then continue; fi
> >   tail --pid=$(cat fs/$val.pid) -f /dev/null
> >   umount fs/$val.mount
> >   rmdir fs/$val.mount
> >   rm -f images/$val.img images/$val.raw 2>/dev/null
> > done
> > ```
> >
> > The offending part is:
> > ```
> >   $RSYNC $val.mount/ "$DEST_PWD/fs/$val/" &
> >   find . -type d -exec mkdir -p "$DEST_PWD/strings/$val/"{} \;
> >   find . -type d -exec mkdir -p "../tmp_$val/"{} \;
> >   while read file; do strings "$file" > "$DEST_PWD/strings/$val/$file"
> > & done < <(find . -type f | grep -v '\.apk\|\.jar\|\.zip')
> >   wait
> > ```
> >
> > When that part is reached, the script forks thousands of new processes
> > and starts reading from f2fs. (We simply decided to rely on Linux's
> > task scheduler and didn't bother to limit the number of
> > sub-processes.)
> >
> > I am able to reliably cause f2fs to return EIO on some files:
> > cp: error reading './system/priv-app/some_apk_1/some_apk_1.apk':
> > Input/output error
> > cp: error reading './system/priv-app/some_apk_2/some_apk_2.apk':
> > Input/output error
> > cp: error reading './system/priv-app/some_apk_3/some_apk_3.apk':
> > Input/output error
> > rsync: [sender] read errors mapping
> > "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_1/some_apk_1.apk":
> > Input/output error (5)
> > rsync: [sender] read errors mapping
> > "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_2/some_apk_2.apk":
> > Input/output error (5)
> > rsync: [sender] read errors mapping
> > "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_3/some_apk_3.apk":
> > Input/output error (5)
> > rsync: [sender] read errors mapping
> > "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_1/some_apk_1.apk":
> > Input/output error (5)
> > ERROR: system/priv-app/some_apk_1/some_apk_1.apk failed verification
> > -- update retained.
> > rsync: [sender] read errors mapping
> > "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_2/some_apk_2.apk":
> > Input/output error (5)
> > ERROR: system/priv-app/some_apk_2/some_apk_2.apk failed verification
> > -- update retained.
> > rsync: [sender] read errors mapping
> > "/ssd/some_firmware.zip/fs/system.mount/system/priv-app/some_apk_3/some_apk_3.apk":
> > Input/output error (5)
> > ERROR: system/priv-app/some_apk_3/some_apk_3.apk failed verification
> > -- update retained.
> > rsync error: some files/attrs were not transferred (see previous
> > errors) (code 23) at main.c(1333) [sender=v3.2.3-45-ga28c4558]
> >
> > The dmesg remains silent.
>
> Hmm, could you share fsck.f2fs result with the image?
>
> >
> > When I modify the script a little bit and force it to run in a
> > single-thread (by removing &), it runs well.
> >
> > I was able to confirm that it isn't a memory issue. The server has
> > 50G+ of free memory, and the issue is still reliably reproducible when
> > I defragment the memory by dropping caches and doing `echo 1 >
> > /proc/sys/vm/compact_memory`.
> >
> > I wasn't able to test any recent kernels (v5.16 or v5.17) as it's
> > unsupported by ZFS. And it being a production server, I am somewhat
> > limited in dabbling around the kernel.
> >
> > I am planning to test a new kernel with v5.15 +
> > f2fs-stable/linux-5.15.y merged. Meanwhile, if this is a new report or
> > fixed with newer commits, I'd appreciate a tip.
> >
> > Thanks.
> >
> >
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
