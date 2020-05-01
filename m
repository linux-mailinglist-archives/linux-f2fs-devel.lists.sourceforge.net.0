Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1F71C124C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 May 2020 14:38:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jUUwQ-0007bV-Kd; Fri, 01 May 2020 12:38:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <naresh.kamboju@linaro.org>) id 1jUUwO-0007bN-Al
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 May 2020 12:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TqI8LEY0eyMyfG41AA+7Dq/qGnmcexDU0BYlK6ALAXY=; b=fj994T0uDwcs7o29hZrffimnoU
 mprTdBdcZWHB8rYJbF10toFqCiezSpu2Xz7zy0qtxV5y2ZRGyXq3j9fgJgy9XXvHihr49w/syySeG
 fMNLKVBbXbNEEDUaHrl85qLdt0WCXTlcV2zsJB/eeZGY+aMsWuFggGzTUgXSfIYXGGJU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TqI8LEY0eyMyfG41AA+7Dq/qGnmcexDU0BYlK6ALAXY=; b=h
 jIHuGJKHD0WOTSzx7PIgQxmbmc1quCcgSnHYkFHi0lBUOtX2jcDxDxLNVX2LRvTJY6c3bLh5oYyTL
 5dHRadzIXSMcAFhAgHyYxwOobPc2ZvY6fD8obpM8y4efexbbKV3P8XegzZNLEjIic3UpgmBjSf4ir
 tEdS66vgYOrTrShM=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jUUwJ-006hgV-CU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 May 2020 12:38:51 +0000
Received: by mail-lj1-f194.google.com with SMTP id u6so2477058ljl.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 01 May 2020 05:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=TqI8LEY0eyMyfG41AA+7Dq/qGnmcexDU0BYlK6ALAXY=;
 b=kINb06rge4Hoo2a3boFUtz6iJsiMwQzukfeNKrspK5nztnLkCus1T8XHoE98GnCFlH
 jNGQU76sEKXJo/aRy1BeLc0wnQqJuy9Hu7D3YuABNzXbMvgxpYxSYUDlrXgnpklfx185
 60d/Oz9NtNkAfq6NchRX5efKJo04Jn0jStyQcAgBGBAJU/NORC1KdYKER1xXVE/q5GDx
 kTIfl38rkPP31aeqitrQIB0nCJux9G575koh6J6hGIgqRIBpwp1hgJL3o9LbhHII+zQ8
 /3pkgFy16PIDw8rhI+WScTyqpD7MnI+WvMhSFttUoS+syvrr5xrqao3qV3Xx5c5cOU2w
 +XcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=TqI8LEY0eyMyfG41AA+7Dq/qGnmcexDU0BYlK6ALAXY=;
 b=HI+/hK21+J1TNPI23Ikon+CXtl0Qp0kpgKBj0Q34+s9RZ3SO0thU/YpCISZkRrRPII
 Te+nfCe676nnr89+jshCxJdh3UYep5DdxGHCmP4trotwA0kY4NRxpWSjTee9q+bi6tXt
 WSgey+imtVzSJk6Xcy9gsTT3Z+9QuBsh3mdyLO948hCMJpRGzJIUt6OKuK4fa9ibK7YN
 532WTImUgkLsagJX/BqzeUxZCFaqmChd27gfIO4OyknvO4xkp4MSK135VP/f0TbqrplQ
 vBtKjBc1S1w1lKSEDSoSwFQkqWdEDt3yzt1Xq1DYHIeJ5I3TQbiV7pUKo2gJOKo7PcCq
 opCQ==
X-Gm-Message-State: AGi0PublYqaCUwk6KxRhxfl3g+2XIoedcJ1OVgK1lSHfAUacqQaykG5C
 Qnz/7EiZkNC1Wfdn3VdfdNSrGrQKxWB9Y1nS2CuAuQ==
X-Google-Smtp-Source: APiQypL43aPuXsQpKFSH646sQHWoZnIymrTx4owk73igNn3Q60iqK6qFY3QSccwQfXwIIb4C1tbs+Vy3n9UvWfr8a6U=
X-Received: by 2002:a2e:9018:: with SMTP id h24mr2322990ljg.217.1588336720045; 
 Fri, 01 May 2020 05:38:40 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 1 May 2020 18:08:28 +0530
Message-ID: <CA+G9fYu2ruH-8uxBHE0pdE6RgRTSx4QuQPAN=Nv3BCdRd2ouYA@mail.gmail.com>
To: open list <linux-kernel@vger.kernel.org>, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, linux-ext4 <linux-ext4@vger.kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: tuxbuild.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jUUwJ-006hgV-CU
Subject: [f2fs-dev] mm: mkfs.ext4 invoked oom-killer on i386 -
 pagecache_get_page
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Theodore Ts'o <tytso@mit.edu>,
 Arnd Bergmann <arnd@arndb.de>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Andreas Dilger <adilger.kernel@dilger.ca>, lkft-triage@lists.linaro.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

mkfs -t ext4 invoked oom-killer on i386 kernel running on x86_64 device
and started happening on linux -next master branch kernel tag next-20200430
and next-20200501. We did not bisect this problem.

metadata
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git commit: e4a08b64261ab411b15580c369a3b8fbed28bbc1
  git describe: next-20200430
  make_kernelversion: 5.7.0-rc3
  kernel-config:
https://builds.tuxbuild.com/1YrE_XUQ6odA52tSBM919w/kernel.config

Steps to reproduce: (always reproducible)
---------------------------
mkfs -t ext4 <external-STORAGE_DEV>

Test log:
------------
+ mkfs -t ext4 /dev/disk/by-id/ata-TOSHIBA_MG04ACA100N_Y8RQK14KF6XF
mke2fs 1.43.8 (1-Jan-2018)
Creating filesystem with 244190646 4k blocks and 61054976 inodes
Filesystem UUID: 05e8451c-1dd6-4d94-b030-0f806653e4b4
Superblock backups stored on blocks:
32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
102400000, 214990848
Allocating group tables:    0/7453                           done
Writing inode tables:    0/7453                           done
Creating journal (262144 blocks): [   34.739137] mkfs.ext4 invoked
oom-killer: gfp_mask=0x101cc0(GFP_USER|__GFP_WRITE), order=0,
oom_score_adj=0
[   34.748889] CPU: 0 PID: 393 Comm: mkfs.ext4 Not tainted
5.7.0-rc3-next-20200430 #1
[   34.756450] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
2.2 05/23/2018
[   34.763844] Call Trace:
[   34.766305]  dump_stack+0x54/0x6e
[   34.769629]  dump_header+0x3d/0x1c6
[   34.773126]  ? oom_badness.part.0+0x10/0x120
[   34.777397]  ? ___ratelimit+0x8f/0xdc
[   34.781056]  oom_kill_process.cold+0x9/0xe
[   34.785152]  out_of_memory+0x1ab/0x260
[   34.788898]  __alloc_pages_nodemask+0xe0e/0xec0
[   34.793430]  pagecache_get_page+0xae/0x260
[   34.797521]  grab_cache_page_write_begin+0x1c/0x30
[   34.802303]  block_write_begin+0x1e/0x90
[   34.806222]  blkdev_write_begin+0x1e/0x20
[   34.810225]  ? bdev_evict_inode+0xd0/0xd0
[   34.814230]  generic_perform_write+0x97/0x180
[   34.818579]  __generic_file_write_iter+0x140/0x1f0
[   34.823365]  blkdev_write_iter+0xc0/0x190
[   34.827376]  __vfs_write+0x132/0x1e0
[   34.830947]  ? __audit_syscall_entry+0xa8/0xe0
[   34.835385]  vfs_write+0xa1/0x1a0
[   34.838696]  ksys_pwrite64+0x50/0x80
[   34.842267]  __ia32_sys_ia32_pwrite64+0x16/0x20
[   34.846798]  do_fast_syscall_32+0x6b/0x270
[   34.850890]  entry_SYSENTER_32+0xa5/0xf8
[   34.854805] EIP: 0xb7f0d549
[   34.857596] Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01
10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f
34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d 76 00 58 b8 77 00 00 00 cd 80 90
8d 76
[   34.876334] EAX: ffffffda EBX: 00000003 ECX: b7801010 EDX: 00400000
[   34.882591] ESI: 38400000 EDI: 00000074 EBP: 07438400 ESP: bfd266f0
[   34.888847] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000246
[   34.895630] Mem-Info:
[   34.897923] active_anon:5366 inactive_anon:2172 isolated_anon:0
[   34.897923]  active_file:4151 inactive_file:212494 isolated_file:0
[   34.897923]  unevictable:0 dirty:16505 writeback:6520 unstable:0
[   34.897923]  slab_reclaimable:5855 slab_unreclaimable:3531
[   34.897923]  mapped:6321 shmem:2236 pagetables:178 bounce:0
[   34.897923]  free:264202 free_pcp:1082 free_cma:0
[   34.931663] Node 0 active_anon:21464kB inactive_anon:8688kB
active_file:16604kB inactive_file:849976kB unevictable:0kB
isolated(anon):0kB isolated(file):0kB mapped:25284kB dirty:58952kB
writeback:27772kB shmem:8944kB writeback_tmp:0kB unstable:0kB
all_unreclaimable? yes
[   34.955523] DMA free:3356kB min:68kB low:84kB high:100kB
reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB
active_file:0kB inactive_file:11964kB unevictable:0kB
writepending:11980kB present:15964kB managed:15876kB mlocked:0kB
kernel_stack:0kB pagetables:0kB bounce:0kB free_pcp:0kB local_pcp:0kB
free_cma:0kB
[   34.983385] lowmem_reserve[]: 0 825 1947 825
[   34.987678] Normal free:3948kB min:7732kB low:8640kB high:9548kB
reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB
active_file:1096kB inactive_file:786400kB unevictable:0kB
writepending:65432kB present:884728kB managed:845576kB mlocked:0kB
kernel_stack:1112kB pagetables:0kB bounce:0kB free_pcp:2908kB
local_pcp:500kB free_cma:0kB
[   35.017427] lowmem_reserve[]: 0 0 8980 0
[   35.021362] HighMem free:1049496kB min:512kB low:1748kB high:2984kB
reserved_highatomic:0KB active_anon:21464kB inactive_anon:8688kB
active_file:15508kB inactive_file:51612kB unevictable:0kB
writepending:0kB present:1149540kB managed:1149540kB mlocked:0kB
kernel_stack:0kB pagetables:712kB bounce:0kB free_pcp:1524kB
local_pcp:292kB free_cma:0kB
[   35.051717] lowmem_reserve[]: 0 0 0 0
[   35.055374] DMA: 8*4kB (UE) 1*8kB (E) 1*16kB (E) 0*32kB 0*64kB
0*128kB 1*256kB (E) 0*512kB 1*1024kB (E) 1*2048kB (E) 0*4096kB =
3384kB
[   35.067446] Normal: 27*4kB (U) 23*8kB (U) 12*16kB (UE) 12*32kB (U)
4*64kB (UE) 2*128kB (U) 2*256kB (UE) 1*512kB (E) 0*1024kB 1*2048kB (U)
0*4096kB = 4452kB
[   35.081347] HighMem: 2*4kB (UM) 0*8kB 1*16kB (M) 2*32kB (UM) 1*64kB
(U) 0*128kB 1*256kB (M) 1*512kB (M) 0*1024kB 0*2048kB 256*4096kB (M) =
1049496kB
[   35.094634] Node 0 hugepages_total=0 hugepages_free=0
hugepages_surp=0 hugepages_size=4096kB
[   35.103059] 218892 total pagecache pages
[   35.106985] 0 pages in swap cache
[   35.110303] Swap cache stats: add 0, delete 0, find 0/0
[   35.115519] Free swap  = 0kB
[   35.118396] Total swap = 0kB
[   35.121274] 512558 pages RAM
[   35.124151] 287385 pages HighMem/MovableOnly
[   35.128418] 9810 pages reserved
[   35.131563] Tasks state (memory values in pages):
[   35.136260] [  pid  ]   uid  tgid total_vm      rss pgtables_bytes
swapents oom_score_adj name
[   35.144866] [    224]     0   224     3425     1273    28672
0             0 systemd-journal
[   35.153932] [    241]     0   241     3260      828    20480
0         -1000 systemd-udevd
[   35.162797] [    244]   994   244     3929      456    24576
0             0 systemd-timesyn
[   35.171837] [    277]   993   277     1569      786    20480
0             0 systemd-network
[   35.180891] [    279]   992   279     1729      825    20480
0             0 systemd-resolve
[   35.189948] [    283]     0   283     2032     1087    24576
0             0 haveged
[   35.198312] [    284]     0   284      810      457    16384
0             0 crond
[   35.206485] [    285]   996   285     1175      812    20480
0          -900 dbus-daemon
[   35.215177] [    286]     0   286    11786     2558    49152
0             0 NetworkManager
[   35.224121] [    287]     0   287      922      174    12288
0             0 klogd
[   35.232293] [    288]     0   288     1468     1001    20480
0             0 systemd-logind
[   35.241247] [    289]   995   289     1213      791    20480
0             0 avahi-daemon
[   35.250026] [    290]     0   290      677      435    16384
0             0 atd
[   35.258040] [    302]     0   302      921      420    16384
0             0 syslogd
[   35.266380] [    303]     0   303     5638     1558    32768
0             0 thermald
[   35.274828] [    305]   995   305     1182       58    20480
0             0 avahi-daemon
[   35.283659] [    306]     0   306      594       16    16384
0             0 acpid
[   35.291848] [    320]     0   320     1347      334    20480
0             0 systemd-hostnam
[   35.300906] [    336] 65534   336      729       32    16384
0             0 dnsmasq
[   35.309253] [    337]     0   337      666      443    16384
0             0 agetty
[   35.317528] [    338]     0   338      947      710    16384
0             0 login
[   35.325693] [    339]     0   339      666      458    16384
0             0 agetty
[   35.333994] [    350]   998   350    19521     2816    73728
0             0 polkitd
[   35.342330] [    358]     0   358     1892     1149    20480
0             0 systemd
[   35.350668] [    359]     0   359     2341      329    20480
0             0 (sd-pam)
[   35.359093] [    363]     0   363      971      711    16384
0             0 sh
[   35.367023] [    367]     0   367      920      627    20480
0             0 su
[   35.374937] [    368]     0   368      971      668    16384
0             0 sh
[   35.382864] [    373]     0   373      903      613    16384
0             0 lava-test-runne
[   35.391897] [    383]     0   383      903      518    16384
0             0 lava-test-shell
[   35.400935] [    384]     0   384      903      612    16384
0             0 sh
[   35.408847] [    393]     0   393     1976     1713    20480
0             0 mkfs.ext4
[   35.417384] oom-kill:constraint=CONSTRAINT_NONE,nodemask=(null),cpuset=/,mems_allowed=0,global_oom,task_memcg=/,task=polkitd,pid=350,uid=998
[   35.429982] Out of memory: Killed process 350 (polkitd)
total-vm:78084kB, anon-rss:2976kB, file-rss:8288kB, shmem-rss:0kB,
UID:998 pgtables:72kB oom_score_adj:0
[   35.444646] oom_reaper: reaped process 350 (polkitd), now
anon-rss:0kB, file-rss:0kB, shmem-rss:0kB
[   35.444648] mkfs.ext4 invoked oom-killer:
gfp_mask=0x101cc0(GFP_USER|__GFP_WRITE), order=0, oom_score_adj=0
[   35.463429] CPU: 0 PID: 393 Comm: mkfs.ext4 Not tainted
5.7.0-rc3-next-20200430 #1
[   35.470991] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
2.2 05/23/2018
[   35.478377] Call Trace:
[   35.480822]  dump_stack+0x54/0x6e
[   35.484139]  dump_header+0x3d/0x1c6
[   35.487634]  ? oom_badness.part.0+0x10/0x120
[   35.491922]  ? ___ratelimit+0x8f/0xdc
[   35.495578]  oom_kill_process.cold+0x9/0xe
[   35.499669]  out_of_memory+0x1ab/0x260
[   35.503414]  __alloc_pages_nodemask+0xe0e/0xec0
[   35.507939]  pagecache_get_page+0xae/0x260

Git log from recent changes on fs and mm.

# fs$ git log --oneline ext4 | head
5868dada23f7 ext4: pass the inode to ext4_mpage_readpages
0c855f1fc999 ext4: convert from readpages to readahead
ebc0198b60e9 mm: add page_cache_readahead_unbounded
907ea529fc4c ext4: convert BUG_ON's to WARN_ON's in mballoc.c
a17a9d935dc4 ext4: increase wait time needed before reuse of deleted
inode numbers
648814111af2 ext4: remove set but not used variable 'es' in ext4_jbd2.c
05ca87c149ae ext4: remove set but not used variable 'es'
801674f34ecf ext4: do not zeroout extents beyond i_disksize
9033783c8cfd ext4: fix return-value types in several function comments
d87f639258a6 ext4: use non-movable memory for superblock readahead

# fs/f2fs$ git log --oneline . | head
a4928e314c45 Merge branch 'akpm-current/current'
f1c6758147a8 f2fs: pass the inode to f2fs_mpage_readpages
272e45338126 f2fs: convert from readpages to readahead
ebc0198b60e9 mm: add page_cache_readahead_unbounded
435cbab95e39 f2fs: fix quota_sync failure due to f2fs_lock_op
8b83ac81f428 f2fs: support read iostat
df4233997575 f2fs: Fix the accounting of dcc->undiscard_blks
ce4c638cdd52 f2fs: fix to handle error path of f2fs_ra_meta_pages()
3fa6a8c5b55d f2fs: report the discard cmd errors properly
141af6ba5216 f2fs: fix long latency due to discard during umount

# fs$ git log --oneline ext4 | head
5868dada23f7 ext4: pass the inode to ext4_mpage_readpages
0c855f1fc999 ext4: convert from readpages to readahead
ebc0198b60e9 mm: add page_cache_readahead_unbounded
907ea529fc4c ext4: convert BUG_ON's to WARN_ON's in mballoc.c
a17a9d935dc4 ext4: increase wait time needed before reuse of deleted
inode numbers
648814111af2 ext4: remove set but not used variable 'es' in ext4_jbd2.c
05ca87c149ae ext4: remove set but not used variable 'es'
801674f34ecf ext4: do not zeroout extents beyond i_disksize
9033783c8cfd ext4: fix return-value types in several function comments
d87f639258a6 ext4: use non-movable memory for superblock readahead

Test full log link,
https://lkft.validation.linaro.org/scheduler/job/1406110#L1223
https://lkft.validation.linaro.org/scheduler/job/1408508#L1250

-- 
Linaro LKFT
https://lkft.linaro.org


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
