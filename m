Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C6D1D7AC6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 May 2020 16:11:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jagUE-0000yy-2p; Mon, 18 May 2020 14:11:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <naresh.kamboju@linaro.org>) id 1jagUC-0000yq-Nr
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 May 2020 14:11:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y4BfVPMrcL5XMLNtJLkseqJyMgIk5RPf0oE06Ck2Yvk=; b=MCgIoRkOe3X6Iy0WTkLBjTYJtk
 +oufeCzf4CCW5MdXiwBzz6dP8aTffIMyAHhTTTZe5sJm/JrFBw/a/NK3f4Ux/eyc3gmRMwqUE6HX+
 ssX2q5GSzHf3n8GgJOTIhbiR/dIEUsVddElWPnJsyQ6Iwf/C/zHv9K6f2Np+VOKaaFiU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y4BfVPMrcL5XMLNtJLkseqJyMgIk5RPf0oE06Ck2Yvk=; b=DGRz3lcgatPOuXWACjLw5TYZ6I
 SskpjnxjXwj5NXAiizoxWxjPCXRng6Yoh3OHmhj6nINGhkd75NIhl+OYjzBNtcbvdxPfZG76LOug2
 ITJyAODrvgrNMoT2DsZiqmboZrrifrbWQJHfz0xdkLp4QbGN456bDcdRxyR7IWRHChak=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jagU7-00H1Ke-So
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 May 2020 14:11:20 +0000
Received: by mail-lj1-f193.google.com with SMTP id f18so9998254lja.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 18 May 2020 07:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y4BfVPMrcL5XMLNtJLkseqJyMgIk5RPf0oE06Ck2Yvk=;
 b=A1f1mfImLmtsU5Ui5A75Vh0KTtVBpXIB+Oo5PgKidQG+TiOcHdNi3lfioMWAkO3EwB
 k8e0JDnlxGs9dPovHOq/9f3A1OOdwkUpIk7SxRFCjILsPbhdw5tTVUKxMzMfCshfICVx
 25GMRkW9A4Np6rs75s8OolqK/xzHCtRqD+HMzGergCBEoLssCFfxrQzbM1YYY4hpGtYv
 JLf2GQP/1QepwzivDNu0yFz3xOJDkVcQJHHrji5qxRt8LOlgTmwYtiekMhYs6fEgrkhv
 VdW3iel4hT+rcW9FFZllMMVNKf9HTQtBg3MZwIGoXrBiqz1oUuRwOt5xIIzLiOP+HQ5b
 knNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y4BfVPMrcL5XMLNtJLkseqJyMgIk5RPf0oE06Ck2Yvk=;
 b=F45QBgEo/kM7GOa2HZJ5US5DHuSes4K+4VdhHsRD9Sok1KqljlNMB1ROdzzX9h1gFY
 NMVx4FcKSutZM0BodNJ0iPMxHSEdW3wjsq/qdjZotZaEcDKiVPVGt/lOgK/y4LvRt/qT
 q7xwO7mludZv6wDMdc/PJzJLlla8ZWcH1hjz5mg9XlNp6TWOqEOVFYSQs2TKUBshGX0z
 Qt0P0T/NzRv8htyRQaMNyjJbUBmlwtuadfLQ1Px/J+X4v+Waq7xHGRUUzwbdRbqFwpe+
 cSnkrdu0Au6zd1gXJEehfBVGI7MoVNexxOOJWs7oOnrbqou246VbOazKZ81sZQGtyIYX
 q7kA==
X-Gm-Message-State: AOAM532z6FmGxNNvO2ArplLNP3UmQFU1AmQwe7lm7siHAhF/q8tywcc3
 pgLtrDUP5iIeuuK5+b27cAwQnlxcor+zFSDpxrK8PDnTc6iPXA==
X-Google-Smtp-Source: ABdhPJwpHv3ssiXTnh0CV2Uu9MXcQNHrUhB/Ptgeo2bpT7YZ0lb8qQGQaZwvSS5e9qnBXKZoScj31xtFNmFWkzCml/U=
X-Received: by 2002:a2e:86d7:: with SMTP id n23mr9192683ljj.123.1589811067696; 
 Mon, 18 May 2020 07:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYu2ruH-8uxBHE0pdE6RgRTSx4QuQPAN=Nv3BCdRd2ouYA@mail.gmail.com>
 <20200501135806.4eebf0b92f84ab60bba3e1e7@linux-foundation.org>
In-Reply-To: <20200501135806.4eebf0b92f84ab60bba3e1e7@linux-foundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 18 May 2020 19:40:55 +0530
Message-ID: <CA+G9fYsiZ81pmawUY62K30B6ue+RXYod854RS91R2+F8ZO7Xvw@mail.gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net, 
 linux-ext4 <linux-ext4@vger.kernel.org>,
 linux-block <linux-block@vger.kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jagU7-00H1Ke-So
Subject: Re: [f2fs-dev] mm: mkfs.ext4 invoked oom-killer on i386 -
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
 open list <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
 linux-mm <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, lkft-triage@lists.linaro.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Thanks for looking into this problem.

On Sat, 2 May 2020 at 02:28, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Fri, 1 May 2020 18:08:28 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> > mkfs -t ext4 invoked oom-killer on i386 kernel running on x86_64 device
> > and started happening on linux -next master branch kernel tag next-20200430
> > and next-20200501. We did not bisect this problem.
>
> It would be wonderful if you could do so, please.  I can't immediately see
> any MM change in this area which might cause this.

We are planning a bisection soon on this problem.

>
> > metadata
> >   git branch: master
> >   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >   git commit: e4a08b64261ab411b15580c369a3b8fbed28bbc1
> >   git describe: next-20200430
> >   make_kernelversion: 5.7.0-rc3
> >   kernel-config:
> > https://builds.tuxbuild.com/1YrE_XUQ6odA52tSBM919w/kernel.config
> >
> > Steps to reproduce: (always reproducible)
>
> Reproducibility helps!
>
> > oom-killer: gfp_mask=0x101cc0(GFP_USER|__GFP_WRITE), order=0,
>
> > [   34.793430]  pagecache_get_page+0xae/0x260
>
> > [   34.897923] active_anon:5366 inactive_anon:2172 isolated_anon:0
> > [   34.897923]  active_file:4151 inactive_file:212494 isolated_file:0
> > [   34.897923]  unevictable:0 dirty:16505 writeback:6520 unstable:0
>
> > [ 34.987678] Normal free:3948kB min:7732kB low:8640kB high:9548kB
> > reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB
> > active_file:1096kB inactive_file:786400kB unevictable:0kB
> > writepending:65432kB present:884728kB managed:845576kB mlocked:0kB
> > kernel_stack:1112kB pagetables:0kB bounce:0kB free_pcp:2908kB
> > local_pcp:500kB free_cma:0kB
>
> ZONE_NORMAL has a huge amount of clean pagecache stuck on the
> inactive list, not being reclaimed.

FYI,
This issue is already reported here.
Now this problem is happening and easily reproducible on i386
and arm beagleboard x15 devices.

mkfs -t ext4 /dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190703A01414
mke2fs 1.43.8 (1-Jan-2018)
Discarding device blocks:     4096/29306880
2625536/29306880
9441280/29306880                 16257024/29306880
23072768/29306880
                                 done
Creating filesystem with 29306880 4k blocks and 7331840 inodes
Filesystem UUID: a838d994-0a1e-403a-88d5-444d75aecc5a
Superblock backups stored on blocks:
32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
4096000, 7962624, 11239424, 20480000, 23887872
Allocating group tables:   0/895                     done
Writing inode tables:   0/895                     done
Creating journal (131072 blocks): [   31.251333] mkfs.ext4 invoked
oom-killer: gfp_mask=0x101cc0(GFP_USER|__GFP_WRITE), order=0,
oom_score_adj=0
[   31.261172] CPU: 0 PID: 397 Comm: mkfs.ext4 Not tainted
5.7.0-rc6-next-20200518 #1
[   31.268771] Hardware name: Generic DRA74X (Flattened Device Tree)
[   31.274904] [<c0411500>] (unwind_backtrace) from [<c040b66c>]
(show_stack+0x10/0x14)
[   31.282685] [<c040b66c>] (show_stack) from [<c08b1b14>]
(dump_stack+0xc4/0xd8)
[   31.289940] [<c08b1b14>] (dump_stack) from [<c0547bf8>]
(dump_header+0x54/0x1ec)
[   31.297367] [<c0547bf8>] (dump_header) from [<c0547008>]
(oom_kill_process+0x18c/0x198)
[   31.305405] [<c0547008>] (oom_kill_process) from [<c0547a0c>]
(out_of_memory+0x250/0x368)
[   31.313619] [<c0547a0c>] (out_of_memory) from [<c0599d80>]
(__alloc_pages_nodemask+0xce8/0x10bc)
[   31.322445] [<c0599d80>] (__alloc_pages_nodemask) from [<c0541bb4>]
(pagecache_get_page+0x128/0x358)
[   31.331619] [<c0541bb4>] (pagecache_get_page) from [<c0543a8c>]
(grab_cache_page_write_begin+0x18/0x2c)
[   31.341054] [<c0543a8c>] (grab_cache_page_write_begin) from
[<c0619fb0>] (block_write_begin+0x20/0xc4)
[   31.350401] [<c0619fb0>] (block_write_begin) from [<c053e718>]
(generic_perform_write+0xb8/0x1d8)
[   31.359312] [<c053e718>] (generic_perform_write) from [<c054496c>]
(__generic_file_write_iter+0x164/0x1ec)
[   31.369007] [<c054496c>] (__generic_file_write_iter) from
[<c061c8a4>] (blkdev_write_iter+0xc8/0x1a4)
[   31.378269] [<c061c8a4>] (blkdev_write_iter) from [<c05d50d0>]
(__vfs_write+0x13c/0x1cc)
[   31.386397] [<c05d50d0>] (__vfs_write) from [<c05d81d4>]
(vfs_write+0xb0/0x1bc)
[   31.393738] [<c05d81d4>] (vfs_write) from [<c05d85e4>]
(ksys_pwrite64+0x60/0x8c)
[   31.401167] [<c05d85e4>] (ksys_pwrite64) from [<c04001a0>]
(ret_fast_syscall+0x0/0x4c)
[   31.409115] Exception stack(0xe810dfa8 to 0xe810dff0)
[   31.414185] dfa0:                   a2000000 0000000d 00000003
b6952008 00400000 00000000
[   31.422395] dfc0: a2000000 0000000d a2000000 000000b5 00400000
0003b768 b6952008 00da2000
[   31.430604] dfe0: 00000064 beb891b8 b6f85108 b6e38f2c
[   31.435809] Mem-Info:
[   31.438098] active_anon:5813 inactive_anon:4129 isolated_anon:0
[   31.438098]  active_file:6080 inactive_file:118548 isolated_file:0
[   31.438098]  unevictable:0 dirty:13674 writeback:7440 unstable:0
[   31.438098]  slab_reclaimable:5651 slab_unreclaimable:4566
[   31.438098]  mapped:5585 shmem:4468 pagetables:182 bounce:0
[   31.438098]  free:347556 free_pcp:608 free_cma:57235
[   31.472362] Node 0 active_anon:23252kB inactive_anon:16516kB
active_file:24320kB inactive_file:474192kB unevictable:0kB
isolated(anon):0kB isolated(file):0kB mapped:22340kB dirty:54696kB
writeback:11196kB shmem:17872kB shmem_thp: 0kB shmem_pmdmapped: 0kB
anon_thp: 0kB writeback_tmp:0kB unstable:0kB all_unreclaimable? yes
[   31.500943] DMA free:187396kB min:22528kB low:28160kB high:33792kB
reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB
active_file:4736kB inactive_file:431688kB unevictable:0kB
writepending:62020kB present:783360kB managed:668264kB mlocked:0kB
kernel_stack:888kB pagetables:0kB bounce:0kB free_pcp:880kB
local_pcp:216kB free_cma:163840kB
[   31.531339] lowmem_reserve[]: 0 0 1216 0
[   31.535289] HighMem free:1203904kB min:512kB low:11592kB
high:22672kB reserved_highatomic:0KB active_anon:23252kB
inactive_anon:16516kB active_file:19584kB inactive_file:42420kB
unevictable:0kB writepending:0kB present:1310720kB managed:1310720kB
mlocked:0kB kernel_stack:0kB pagetables:728kB bounce:0kB
free_pcp:1584kB local_pcp:1232kB free_cma:65100kB
[   31.566540] lowmem_reserve[]: 0 0 0 0
[   31.570244] DMA: 87*4kB (UME) 53*8kB (UME) 26*16kB (UE) 6*32kB (UM)
1*64kB (E) 1*128kB (U) 5*256kB (ME) 5*512kB (ME) 4*1024kB (ME)
5*2048kB (M) 1*4096kB (M) 20*8192kB (C) = 187684kB
[   31.586520] HighMem: 2*4kB (MC) 1*8kB (C) 1*16kB (M) 5*32kB (UM)
4*64kB (UMC) 2*128kB (UM) 2*256kB (UM) 1*512kB (C) 2*1024kB (MC)
2*2048kB (MC) 2*4096kB (UC) 145*8192kB (MC) = 1203904kB
[   31.603150] Node 0 hugepages_total=0 hugepages_free=0
hugepages_surp=0 hugepages_size=2048kB
[   31.611637] 129102 total pagecache pages
[   31.615577] 0 pages in swap cache
[   31.618902] Swap cache stats: add 0, delete 0, find 0/0
[   31.624162] Free swap  = 0kB
[   31.627053] Total swap = 0kB
[   31.629955] 523520 pages RAM
[   31.632846] 327680 pages HighMem/MovableOnly
[   31.637128] 28774 pages reserved
[   31.640381] 57344 pages cma reserved
[   31.643971] Tasks state (memory values in pages):
[   31.648691] [  pid  ]   uid  tgid total_vm      rss pgtables_bytes
swapents oom_score_adj name
[   31.657367] [    183]     0   183     7370     1082    36864
0             0 systemd-journal
[   31.666466] [    209]   994   209     3742      326    40960
0             0 systemd-timesyn
[   31.675570] [    217]     0   217     3398      817    32768
0         -1000 systemd-udevd
[   31.684498] [    230]   993   230     1411      737    32768
0             0 systemd-network
[   31.693598] [    231]   992   231     1496      712    32768
0             0 systemd-resolve
[   31.702702] [    236]   996   236     1112      742    24576
0          -900 dbus-daemon
[   31.711454] [    241]     0   241     1895     1045    36864
0             0 haveged
[   31.719857] [    242]     0   242     1362      906    28672
0             0 systemd-logind
[   31.728855] [    243]     0   243    13412     2571    69632
0             0 NetworkManager
[   31.737867] [    244]   995   244     1197      608    28672
0             0 avahi-daemon
[   31.746707] [    245]   995   245     1164       59    28672
0             0 avahi-daemon
[   31.755545] [    246]     0   246      594      332    28672
0             0 atd
[   31.763601] [    248]     0   248      699       99    24576
0             0 syslogd
[   31.772001] [    251]     0   251      699      102    24576
0             0 klogd
[   31.780231] [    252]     0   252      676      365    24576
0             0 crond
[   31.788443] [    254]     0   254     1172      240    32768
0             0 systemd-hostnam
[   31.797547] [    264] 65534   264      605       32    24576
0             0 dnsmasq
[   31.805948] [    265]     0   265      556      357    28672
0             0 agetty
[   31.814262] [    266]     0   266     1131      613    32768
0             0 login
[   31.822492] [    268]   998   268    18201     2629    81920
0             0 polkitd
[   31.830895] [    350]     0   350     1840     1161    32768
0             0 systemd
[   31.839286] [    351]     0   351     2403      473    36864
0             0 (sd-pam)
[   31.847774] [    355]     0   355      827      611    24576
0             0 sh
[   31.855742] [    364]     0   364     7341     1145    53248
0             0 nm-dispatcher
[   31.864667] [    377]     0   377      711      510    28672
0             0 lava-test-runne
[   31.873770] [    387]     0   387      711      138    20480
0             0 lava-test-shell
[   31.882869] [    388]     0   388      711      523    20480
0             0 sh
[   31.890837] [    397]     0   397     1785     1518    36864
0             0 mkfs.ext4
[   31.899397] oom-kill:constraint=CONSTRAINT_NONE,nodemask=(null),global_oom,task_memcg=/,task=polkitd,pid=268,uid=998
[   31.910012] Out of memory: Killed process 268 (polkitd)
total-vm:72804kB, anon-rss:2948kB, file-rss:7568kB, shmem-rss:0kB,
UID:998 pgtables:80kB oom_score_adj:0
[   31.927948] oom_reaper: reaped process 268 (polkitd), now
anon-rss:0kB, file-rss:0kB, shmem-rss:0kB
[   31.937461] mkfs.ext4 invoked oom-killer:
gfp_mask=0x101cc0(GFP_USER|__GFP_WRITE), order=0, oom_score_adj=0
[   31.947273] CPU: 1 PID: 397 Comm: mkfs.ext4 Not tainted
5.7.0-rc6-next-20200518 #1
[   31.954871] Hardware name: Generic DRA74X (Flattened Device Tree)
[   31.961000] [<c0411500>] (unwind_backtrace) from [<c040b66c>]
(show_stack+0x10/0x14)
[   31.968778] [<c040b66c>] (show_stack) from [<c08b1b14>]
(dump_stack+0xc4/0xd8)
[   31.976032] [<c08b1b14>] (dump_stack) from [<c0547bf8>]
(dump_header+0x54/0x1ec)
[   31.983458] [<c0547bf8>] (dump_header) from [<c0547008>]
(oom_kill_process+0x18c/0x198)
[   31.991495] [<c0547008>] (oom_kill_process) from [<c0547a0c>]
(out_of_memory+0x250/0x368)
[   31.999706] [<c0547a0c>] (out_of_memory) from [<c0599d80>]
(__alloc_pages_nodemask+0xce8/0x10bc)
[   32.008532] [<c0599d80>] (__alloc_pages_nodemask) from [<c0541bb4>]
(pagecache_get_page+0x128/0x358)
[   32.017704] [<c0541bb4>] (pagecache_get_page) from [<c0543a8c>]
(grab_cache_page_write_begin+0x18/0x2c)
[   32.027138] [<c0543a8c>] (grab_cache_page_write_begin) from
[<c0619fb0>] (block_write_begin+0x20/0xc4)
[   32.036484] [<c0619fb0>] (block_write_begin) from [<c053e718>]
(generic_perform_write+0xb8/0x1d8)
[   32.045395] [<c053e718>] (generic_perform_write) from [<c054496c>]
(__generic_file_write_iter+0x164/0x1ec)
[   32.055090] [<c054496c>] (__generic_file_write_iter) from
[<c061c8a4>] (blkdev_write_iter+0xc8/0x1a4)
[   32.064350] [<c061c8a4>] (blkdev_write_iter) from [<c05d50d0>]
(__vfs_write+0x13c/0x1cc)
[   32.072476] [<c05d50d0>] (__vfs_write) from [<c05d81d4>]
(vfs_write+0xb0/0x1bc)
[   32.079814] [<c05d81d4>] (vfs_write) from [<c05d85e4>]
(ksys_pwrite64+0x60/0x8c)
[   32.087241] [<c05d85e4>] (ksys_pwrite64) from [<c04001a0>]
(ret_fast_syscall+0x0/0x4c)
[   32.095187] Exception stack(0xe810dfa8 to 0xe810dff0)
[   32.100256] dfa0:                   a2000000 0000000d 00000003
b6952008 00400000 00000000
[   32.108466] dfc0: a2000000 0000000d a2000000 000000b5 00400000
0003b768 b6952008 00da2000
[   32.116673] dfe0: 00000064 beb891b8 b6f85108 b6e38f2c
[   32.121786] Mem-Info:
[   32.124070] active_anon:5056 inactive_anon:4129 isolated_anon:0
[   32.124070]  active_file:6289 inactive_file:118790 isolated_file:0
[   32.124070]  unevictable:0 dirty:14118 writeback:6 unstable:0
[   32.124070]  slab_reclaimable:5653 slab_unreclaimable:4209
[   32.124070]  mapped:4839 shmem:4468 pagetables:165 bounce:0
[   32.124070]  free:348249 free_pcp:562 free_cma:57235
[   32.158031] Node 0 active_anon:20224kB inactive_anon:16516kB
active_file:25156kB inactive_file:475160kB unevictable:0kB
isolated(anon):0kB isolated(file):0kB mapped:19356kB dirty:56472kB
writeback:24kB shmem:17872kB shmem_thp: 0kB shmem_pmdmapped: 0kB
anon_thp: 0kB writeback_tmp:0kB unstable:0kB all_unreclaimable? yes
[   32.186324] DMA free:186320kB min:22528kB low:28160kB high:33792kB
reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB
active_file:4736kB inactive_file:433580kB unevictable:0kB
writepending:56468kB present:783360kB managed:668264kB mlocked:0kB
kernel_stack:888kB pagetables:0kB bounce:0kB free_pcp:420kB
local_pcp:220kB free_cma:163840kB
[   32.216693] lowmem_reserve[]: 0 0 1216 0
[   32.220652] HighMem free:1206676kB min:512kB low:11592kB
high:22672kB reserved_highatomic:0KB active_anon:20224kB
inactive_anon:16516kB active_file:20420kB inactive_file:41584kB
unevictable:0kB writepending:0kB present:1310720kB managed:1310720kB
mlocked:0kB kernel_stack:0kB pagetables:660kB bounce:0kB
free_pcp:1816kB local_pcp:340kB free_cma:65100kB
[   32.251805] lowmem_reserve[]: 0 0 0 0
[   32.255482] DMA: 2*4kB (UM) 3*8kB (UME) 1*16kB (U) 1*32kB (M)
0*64kB 1*128kB (U) 5*256kB (ME) 5*512kB (ME) 4*1024kB (ME) 5*2048kB
(M) 1*4096kB (M) 20*8192kB (C) = 186320kB
[   32.270871] HighMem: 183*4kB (UMC) 65*8kB (UMC) 21*16kB (M) 11*32kB
(UM) 6*64kB (UMC) 3*128kB (UM) 3*256kB (UM) 2*512kB (MC) 2*1024kB (MC)
2*2048kB (MC) 2*4096kB (UC) 145*8192kB (MC) = 1206676kB
[   32.288273] Node 0 hugepages_total=0 hugepages_free=0
hugepages_surp=0 hugepages_size=2048kB
[   32.296751] 129546 total pagecache pages
[   32.300695] 0 pages in swap cache
[   32.304019] Swap cache stats: add 0, delete 0, find 0/0
[   32.309260] Free swap  = 0kB
[   32.312155] Total swap = 0kB
[   32.315045] 523520 pages RAM
[   32.317932] 327680 pages HighMem/MovableOnly
[   32.322221] 28774 pages reserved
[   32.325457] 57344 pages cma reserved
[   32.329043] Tasks state (memory values in pages):
[   32.333771] [  pid  ]   uid  tgid total_vm      rss pgtables_bytes
swapents oom_score_adj name
[   32.342436] [    183]     0   183     7370     1082    36864
0             0 systemd-journal
[   32.351529] [    209]   994   209     3742      326    40960
0             0 systemd-timesyn
[   32.360620] [    217]     0   217     3398      817    32768
0         -1000 systemd-udevd
[   32.369528] [    230]   993   230     1411      737    32768
0             0 systemd-network
[   32.378620] [    231]   992   231     1496      712    32768
0             0 systemd-resolve
[   32.387713] [    236]   996   236     1112      742    24576
0          -900 dbus-daemon
[   32.396456] [    241]     0   241     1895     1045    36864
0             0 haveged
[   32.404850] [    242]     0   242     1362      906    28672
0             0 systemd-logind
[   32.413852] [    243]     0   243    13412     2571    69632
0             0 NetworkManager
[   32.422858] [    244]   995   244     1197      608    28672
0             0 avahi-daemon
[   32.431687] [    245]   995   245     1164       59    28672
0             0 avahi-daemon
[   32.440518] [    246]     0   246      594      332    28672
0             0 atd
[   32.448553] [    248]     0   248      699       99    24576
0             0 syslogd
[   32.456945] [    251]     0   251      699      102    24576
0             0 klogd
[   32.465171] [    252]     0   252      676      365    24576
0             0 crond
[   32.473390] [    254]     0   254     1172      240    32768
0             0 systemd-hostnam
[   32.482481] [    264] 65534   264      605       32    24576
0             0 dnsmasq
[   32.490876] [    265]     0   265      556      357    28672
0             0 agetty
[   32.499175] [    266]     0   266     1131      613    32768
0             0 login
[   32.507394] [    350]     0   350     1840     1161    32768
0             0 systemd
[   32.515788] [    351]     0   351     2403      473    36864
0             0 (sd-pam)
[   32.524268] [    355]     0   355      827      611    24576
0             0 sh
[   32.532227] [    364]     0   364     7341     1145    53248
0             0 nm-dispatcher
[   32.541142] [    377]     0   377      711      510    28672
0             0 lava-test-runne
[   32.550234] [    387]     0   387      711      138    20480
0             0 lava-test-shell
[   32.559316] [    388]     0   388      711      523    20480
0             0 sh
[   32.567273] [    397]     0   397     1785     1518    36864
0             0 mkfs.ext4

ref:
https://lkft.validation.linaro.org/scheduler/job/1436647#L4261
https://lkft.validation.linaro.org/scheduler/job/1436562#L1247

--
Linaro LKFT
https://lkft.linaro.org


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
