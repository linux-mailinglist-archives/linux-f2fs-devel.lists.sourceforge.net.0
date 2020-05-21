Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED281DCA6C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2020 11:47:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jbhnq-000585-5d; Thu, 21 May 2020 09:47:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <laoar.shao@gmail.com>) id 1jbhnp-00057y-CB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 09:47:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ymu9blpYr7wMIvo/9N6YVP20hUwpDNvJoTH4FEafyGM=; b=CRrHiV4+xfCZgYX22gb65qhIwx
 aQf7uNfXNyirPuKElxKnBCeZSMeFN4pXB61Hb3m4eMLF+Sl247CDjRle0hGBuBSsrH9i68gppjPWq
 9W2/KNHB2LEu5yqzwivto9LPFA3kCvxxxDX2FeuCrmrb3EJ0xDB4qdQYOykod+wupZGw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ymu9blpYr7wMIvo/9N6YVP20hUwpDNvJoTH4FEafyGM=; b=Q5SFTjIRWH8FH5+h9570fGHbsQ
 UgU+/HHEBGSZO1+vQEPcwBNKxwuWiZq6Xj5D++nwOFcXqFcX19Nc7JgzudHOJpXvGLlXGMBfo9gK9
 SEoOu+Dr/RBV5JrKf1bwmSklTINPV9oYbxIS9Ha+yB6D4+dGWfwUfVhaPmx66K4rYMaU=;
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbhnn-00AtJk-FO
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 09:47:49 +0000
Received: by mail-il1-f193.google.com with SMTP id b15so6411388ilq.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 May 2020 02:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ymu9blpYr7wMIvo/9N6YVP20hUwpDNvJoTH4FEafyGM=;
 b=XvtlkGmIivvh64t3DeDAC5fFjWa6y9CfPos/zVbRStxg8uoviMH9Tr5QBJD8YvrMY0
 Vi8h7dBSN2N3OzkbIKNZObMBBgcv9dx6Kn1EEMoni1InJLN/Ttft9CfwFhKa/Pp1pnaq
 CE6H3bkrqM6VtMQgstD1dxJsRgINDDFIGMtmGULzDJ4J+XSXldhmcMnuq8qmQX0zODKO
 cAARiM7oaY6uyv4rtT1C1l87pahPb8oluSskB1Kr0GBXc1YnjeE5w0msCzTCHAceb+97
 o/HAe/QNqLtim36Y5zK27fjtzsGo7srWmEeeAhyxPODek+bN8k4G4Hf12vQ6sOchTCDa
 aJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ymu9blpYr7wMIvo/9N6YVP20hUwpDNvJoTH4FEafyGM=;
 b=m/GK6NJkEt8oN4U6+v8CowTiCsJ+wiaJ6mt51fITQF+DdHBtF/jmLwwBmWzsTdxAcD
 UxQM5R6aGzJC4GhaHpf515AF6HLtUs8yYvfjWV2yFCMtPnfL4Sp1ZaccM8Kawx8GLSVB
 dMzI4q+QZusnFU+wCIwxE6TfGBORkEUeULSN4KSaeOaIDMQc29a/vhMOBgwC1EooWNMb
 ZDJuT8/wEWiFoxB3eOyzlxfX1/DtWXtaRBLvH60ufHjVyjug6g86IuCJwubikxiikEBT
 bE4aL9sWUiV7mdLRH2E3RcatlHuirqBqnsWblMQN/cTjI5d4AyHZIx9ICx6HDJ+CvbTo
 CSGw==
X-Gm-Message-State: AOAM533b8fd+UO6sAe44UGQMBdRczkS1N8mBzKU0mpnAjLIZ6UJZnHEm
 SBZMq38Woj4LIBlAYVGWtMXNllvCZpdGWa0nALQ=
X-Google-Smtp-Source: ABdhPJynXC/p1+LD9wwbGVXsvvN1Mdw7bZZpQUpCEjz721K1VIPgRvjEcR0yyyowFhszidPt9C4M6OSPZtW3FxUCkWs=
X-Received: by 2002:a92:10a:: with SMTP id 10mr7786061ilb.203.1590054461661;
 Thu, 21 May 2020 02:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYu2ruH-8uxBHE0pdE6RgRTSx4QuQPAN=Nv3BCdRd2ouYA@mail.gmail.com>
 <20200501135806.4eebf0b92f84ab60bba3e1e7@linux-foundation.org>
 <CA+G9fYsiZ81pmawUY62K30B6ue+RXYod854RS91R2+F8ZO7Xvw@mail.gmail.com>
 <20200519075213.GF32497@dhcp22.suse.cz>
 <CAK8P3a2T_j-Ynvhsqe_FCqS2-ZdLbo0oMbHhHChzMbryE0izAQ@mail.gmail.com>
 <20200519084535.GG32497@dhcp22.suse.cz>
 <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
 <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
 <CALOAHbDMrHkNHTxeBWP22iTjJd+HfqfFhAfmC_m0jsVkhu5vEA@mail.gmail.com>
 <CA+G9fYsCaxJ5WyN8y=gCMvrZHCCYYkbzyCpHKspkqrEVwpgNoQ@mail.gmail.com>
In-Reply-To: <CA+G9fYsCaxJ5WyN8y=gCMvrZHCCYYkbzyCpHKspkqrEVwpgNoQ@mail.gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 21 May 2020 17:47:05 +0800
Message-ID: <CALOAHbB3qy7JQj7Rfqt2=jxX86yG+D42vRW8Npyr5927+4qcwQ@mail.gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.193 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (laoar.shao[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jbhnn-00AtJk-FO
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
Cc: lkft-triage@lists.linaro.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm <linux-mm@kvack.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Cgroups <cgroups@vger.kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-block <linux-block@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Chris Down <chris@chrisdown.name>,
 open list <linux-kernel@vger.kernel.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, May 21, 2020 at 4:59 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> On Thu, 21 May 2020 at 08:10, Yafang Shao <laoar.shao@gmail.com> wrote:
> >
> > On Thu, May 21, 2020 at 2:00 AM Naresh Kamboju
> > <naresh.kamboju@linaro.org> wrote:
> > >
> > > On Wed, 20 May 2020 at 17:26, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > >
> > > >
> > > > This issue is specific on 32-bit architectures i386 and arm on linux-next tree.
> > > > As per the test results history this problem started happening from
> > > > mkfs -t ext4 /dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190804A00BE5
> > > >
> > > >
> > > > Problem:
> > > > [   38.802375] dd invoked oom-killer: gfp_mask=0x100cc0(GFP_USER),
> > > > order=0, oom_score_adj=0
> > >
> > My guess is that we made the same mistake in commit "mm, memcg:
> > decouple e{low,min} state mutations from protection
> > checks" that it read a stale memcg protection in
> > mem_cgroup_below_low() and mem_cgroup_below_min().
> >
> > Bellow is a possble fix,
>
> Sorry. The proposed fix did not work.
> I have took your patch and applied on top of linux-next master branch and
> tested and mkfs -t ext4 invoked oom-killer.
>
> After patch applied test log link,
> https://lkft.validation.linaro.org/scheduler/job/1443936#L1168
>
>
> test  log,
> + mkfs -t ext4 /dev/disk/by-id/ata-TOSHIBA_MG04ACA100N_Y8NRK0BPF6XF
> mke2fs 1.43.8 (1-Jan-2018)
> Creating filesystem with 244190646 4k blocks and 61054976 inodes
> Filesystem UUID: ab107250-bf18-4357-a06a-67f2bfcc1048
> Superblock backups stored on blocks:
> 32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
> 4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
> 102400000, 214990848
> Allocating group tables:    0/7453                           done
> Writing inode tables:    0/7453                           done
> Creating journal (262144 blocks): [   34.423940] mkfs.ext4 invoked
> oom-killer: gfp_mask=0x101cc0(GFP_USER|__GFP_WRITE), order=0,
> oom_score_adj=0
> [   34.433694] CPU: 0 PID: 402 Comm: mkfs.ext4 Not tainted
> 5.7.0-rc6-next-20200519+ #1
> [   34.441342] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
> 2.2 05/23/2018
> [   34.448734] Call Trace:
> [   34.451196]  dump_stack+0x54/0x76
> [   34.454517]  dump_header+0x40/0x1f0
> [   34.458008]  ? oom_badness+0x1f/0x120
> [   34.461673]  ? ___ratelimit+0x6c/0xe0
> [   34.465332]  oom_kill_process+0xc9/0x110
> [   34.469255]  out_of_memory+0xd7/0x2f0
> [   34.472916]  __alloc_pages_nodemask+0xdd1/0xe90
> [   34.477446]  ? set_bh_page+0x33/0x50
> [   34.481016]  ? __xa_set_mark+0x4d/0x70
> [   34.484762]  pagecache_get_page+0xbe/0x250
> [   34.488859]  grab_cache_page_write_begin+0x1a/0x30
> [   34.493645]  block_write_begin+0x25/0x90
> [   34.497569]  blkdev_write_begin+0x1e/0x20
> [   34.501574]  ? bdev_evict_inode+0xc0/0xc0
> [   34.505578]  generic_perform_write+0x95/0x190
> [   34.509927]  __generic_file_write_iter+0xe0/0x1a0
> [   34.514626]  blkdev_write_iter+0xbf/0x1c0
> [   34.518630]  __vfs_write+0x122/0x1e0
> [   34.522200]  vfs_write+0x8f/0x1b0
> [   34.525510]  ksys_pwrite64+0x60/0x80
> [   34.529081]  __ia32_sys_ia32_pwrite64+0x16/0x20
> [   34.533604]  do_fast_syscall_32+0x66/0x240
> [   34.537697]  entry_SYSENTER_32+0xa5/0xf8
> [   34.541613] EIP: 0xb7f3c549
> [   34.544403] Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01
> 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f
> 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d 76 00 58 b8 77 00 00 00 cd 80 90
> 8d 76
> [   34.563140] EAX: ffffffda EBX: 00000003 ECX: b7830010 EDX: 00400000
> [   34.569397] ESI: 38400000 EDI: 00000074 EBP: 07438400 ESP: bff1e650
> [   34.575654] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000246
> [   34.582453] Mem-Info:
> [   34.584732] active_anon:5713 inactive_anon:2169 isolated_anon:0
> [   34.584732]  active_file:4040 inactive_file:211204 isolated_file:0
> [   34.584732]  unevictable:0 dirty:17270 writeback:6240 unstable:0
> [   34.584732]  slab_reclaimable:5856 slab_unreclaimable:3439
> [   34.584732]  mapped:6192 shmem:2258 pagetables:178 bounce:0
> [   34.584732]  free:265105 free_pcp:1330 free_cma:0
> [   34.618483] Node 0 active_anon:22852kB inactive_anon:8676kB
> active_file:16160kB inactive_file:844816kB unevictable:0kB
> isolated(anon):0kB isolated(file):0kB mapped:24768kB dirty:69080kB
> writeback:19628kB shmem:9032kB writeback_tmp:0kB unstable:0kB
> all_unreclaimable? yes
> [   34.642354] DMA free:3588kB min:68kB low:84kB high:100kB
> reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB
> active_file:0kB inactive_file:11848kB unevictable:0kB
> writepending:11856kB present:15964kB managed:15876kB mlocked:0kB
> kernel_stack:0kB pagetables:0kB bounce:0kB free_pcp:0kB local_pcp:0kB
> free_cma:0kB
> [   34.670194] lowmem_reserve[]: 0 824 1947 824
> [   34.674483] Normal free:4228kB min:3636kB low:4544kB high:5452kB
> reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB
> active_file:1136kB inactive_file:786456kB unevictable:0kB
> writepending:68084kB present:884728kB managed:845324kB mlocked:0kB
> kernel_stack:1104kB pagetables:0kB bounce:0kB free_pcp:3056kB
> local_pcp:388kB free_cma:0kB
> [   34.704243] lowmem_reserve[]: 0 0 8980 0
> [   34.708189] HighMem free:1053028kB min:512kB low:1748kB high:2984kB
> reserved_highatomic:0KB active_anon:22852kB inactive_anon:8676kB
> active_file:15024kB inactive_file:46596kB unevictable:0kB
> writepending:0kB present:1149544kB managed:1149544kB mlocked:0kB
> kernel_stack:0kB pagetables:712kB bounce:0kB free_pcp:2160kB
> local_pcp:736kB free_cma:0kB
> [   34.738563] lowmem_reserve[]: 0 0 0 0
> [   34.742245] DMA: 23*4kB (U) 2*8kB (U) 3*16kB (U) 2*32kB (UE) 2*64kB
> (U) 1*128kB (U) 1*256kB (E) 0*512kB 1*1024kB (E) 1*2048kB (E) 0*4096kB
> = 3804kB
> [   34.755479] Normal: 25*4kB (UM) 27*8kB (UME) 16*16kB (UME) 14*32kB
> (UME) 7*64kB (UME) 2*128kB (UM) 1*256kB (E) 1*512kB (E) 0*1024kB
> 1*2048kB (M) 0*4096kB = 4540kB
> [   34.770004] HighMem: 1*4kB (U) 0*8kB 0*16kB 1*32kB (U) 1*64kB (M)
> 2*128kB (UM) 2*256kB (UM) 1*512kB (U) 1*1024kB (U) 1*2048kB (U)
> 256*4096kB (M) = 1053028kB
> [   34.784010] Node 0 hugepages_total=0 hugepages_free=0
> hugepages_surp=0 hugepages_size=4096kB
> [   34.792466] 217507 total pagecache pages
> [   34.796387] 0 pages in swap cache
> [   34.799704] Swap cache stats: add 0, delete 0, find 0/0
> [   34.804923] Free swap  = 0kB
> [   34.807834] Total swap = 0kB
> [   34.810738] 512559 pages RAM
> [   34.813640] 287386 pages HighMem/MovableOnly
> [   34.817931] 9873 pages reserved
>
>
> - Naresh


Thanks for your work.
I just noticed that this is a system oom, rather than a memcg oom.
While this patch is against memcg oom.

As you have verified this oom is only caused by commit "mm, memcg:
decouple e{low,min} state mutations from protection checks",
this commit really introduce the issue of using the stale protection
value, but I haven't thought deeply why this occurs. This issue can
occur only  when you set memcg {min, low} protection, but
unfortunately memcg {min, low} isn't shown in the oom log.

Appreciat if you would like to check the memcg {min, low} protection
setting. If they are set, I think bellow workaround can avoid this
issue.

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 474815a..f6f794a 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -6380,6 +6380,9 @@ void mem_cgroup_calculate_protection(struct
mem_cgroup *root,
        if (mem_cgroup_disabled())
                return;

+       memcg->memory.elow = 0;
+       memcg->memory.emin = 0;
+
        if (!root)
                root = root_mem_cgroup;

But I think the right thing to do now is reverting the bad commit,
because the usage of memory.{emin, elow} is very subtle, we shouldn't
place them here and there at the risk of reading a stale value.

-- 
Thanks
Yafang


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
