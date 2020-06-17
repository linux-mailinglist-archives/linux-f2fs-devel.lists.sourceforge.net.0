Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B921FCE8E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2020 15:37:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlYGA-00064u-Fb; Wed, 17 Jun 2020 13:37:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <naresh.kamboju@linaro.org>) id 1jlYG9-00064j-7P
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 13:37:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fqR44w8izx/KE5EkQ1Ws5ETNchnRTHELluIzCKgLjZQ=; b=Hf5EmjoHaQ3FywO1su0nhQ6fci
 IX647RQMuI08zPefYQnoKjFS+1/Vq3pjyLCUDH2+ZsYuBI1/T9KLxWvEtF5tptby10JBEhlw5IvPm
 /E2zU1zl0Hupt0nzyZMQ+WEqAtORbcse8HY+4tk8qzZuW3NMl09TobpkVfu2QdfDZb+A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fqR44w8izx/KE5EkQ1Ws5ETNchnRTHELluIzCKgLjZQ=; b=fR2Ls47qJ9N2q769z721EbKzxD
 CXjT8J1wX+XQS/SPnR3MHVJoFlGY3J0n8a8gBmOg60mkocQ0Mbwi2bZGWGjo5Xi8D+pi0OEnUp9rC
 9zsMzAq2LfhoO2A2Sq+1Yk/dxfKeoBLuYIlSfrkoSp/uOGpGJgeiSfXDmQ7jrF6IyIBI=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jlYG3-006vCc-II
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 13:37:45 +0000
Received: by mail-lj1-f193.google.com with SMTP id x18so2921853lji.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Jun 2020 06:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fqR44w8izx/KE5EkQ1Ws5ETNchnRTHELluIzCKgLjZQ=;
 b=AQDHF9j1wumEdOF8jW/1ZD+wMd/8SpKXUSrLOHAhi0A44X1JaVVNvxPIvK23AWFQl1
 lcfd2qLeHyI1mOR56hQwvpPqFkxdvrqlLEDd85my4N1iUDfAlgcF8AzsgKWBK3zrgNCe
 FfcZd/NGkaf2Mw5/0Wi7/NN8GlYj/dE1H3Y2K/UdByyIhfAVRQSJIdp1UXJN3EirQcCx
 gGhwwgc+eOdRDRZohnKU4obNcVnQwSt7TB0Y31V6blCHXIgexA++Mbo6gO8D5gHDGqpn
 e08UA7hYCS3YGjFr+hICEEExE+bXh2EV+2ZuVFnYmW334FTROJKMWUws6mNfrG1VlVfC
 NXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fqR44w8izx/KE5EkQ1Ws5ETNchnRTHELluIzCKgLjZQ=;
 b=mzp4Ns9ZiXBNw2ghMgRGVom2Hj9w9xWvXM43AhVuRmOkUQlE0gkehpIVHjc2Bp/xr/
 a+BEkeH1DDA+mOUBR9DL4lJvKV4cKMFUQjfuU/fMYdUWCQzptmLMFv9kDe0ZVgV8ZHNB
 vUAG8aoawqhdznJtL8R1ZOguL56WHD2gW12k/X+u8u8OPYShFQlOwV/UoO0zzZLdlgn9
 LDAElRzws0MYnS5yNxE1xPRoggB8+tN3Eelzx64yFEJOn7AJ+rOtGPdFHOKPi3rtdAQG
 0g26TzEMgeGjWtibLmdW+fVa8bMOgVNGXJJaAJx/pbpYHYnIIGVPiQlv2PZ7GB+XmnCH
 yQcA==
X-Gm-Message-State: AOAM532QBi0Q6H5Az0hRm/ZXMeFzkYRA3tRf/BaQFL9YWMIcl14BDYxM
 Xjd0w+GWwTNbGXbofuWQoPS6bm4ZEb0CGfL1Ev+jlw==
X-Google-Smtp-Source: ABdhPJwA6fF2gcH8wQw09CP/KfWtNPcawF+FUlNNP2wgH6FMgwt35Wa0rYTio1e8v/dCRtNDcHsmii7KXDmm4uILcaA=
X-Received: by 2002:a2e:911:: with SMTP id 17mr4347007ljj.411.1592401052747;
 Wed, 17 Jun 2020 06:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYu2ruH-8uxBHE0pdE6RgRTSx4QuQPAN=Nv3BCdRd2ouYA@mail.gmail.com>
 <20200501135806.4eebf0b92f84ab60bba3e1e7@linux-foundation.org>
 <CA+G9fYsiZ81pmawUY62K30B6ue+RXYod854RS91R2+F8ZO7Xvw@mail.gmail.com>
 <20200519075213.GF32497@dhcp22.suse.cz>
 <CAK8P3a2T_j-Ynvhsqe_FCqS2-ZdLbo0oMbHhHChzMbryE0izAQ@mail.gmail.com>
 <20200519084535.GG32497@dhcp22.suse.cz>
 <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
 <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
 <20200520190906.GA558281@chrisdown.name>
 <20200521095515.GK6462@dhcp22.suse.cz>
 <20200521163450.GV6462@dhcp22.suse.cz>
In-Reply-To: <20200521163450.GV6462@dhcp22.suse.cz>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 17 Jun 2020 19:07:20 +0530
Message-ID: <CA+G9fYsdsgRmwLtSKJSzB1eWcUQ1z-_aaU+BNcQpker34XT6_w@mail.gmail.com>
To: Michal Hocko <mhocko@kernel.org>, Chris Down <chris@chrisdown.name>, 
 Yafang Shao <laoar.shao@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jlYG3-006vCc-II
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Cgroups <cgroups@vger.kernel.org>, Hugh Dickins <hughd@google.com>,
 open list <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
 "Linux F2FS DEV, Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-block <linux-block@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Theodore Ts'o <tytso@mit.edu>,
 lkft-triage@lists.linaro.org, Johannes Weiner <hannes@cmpxchg.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 21 May 2020 at 22:04, Michal Hocko <mhocko@kernel.org> wrote:
>
> On Thu 21-05-20 11:55:16, Michal Hocko wrote:
> > On Wed 20-05-20 20:09:06, Chris Down wrote:
> > > Hi Naresh,
> > >
> > > Naresh Kamboju writes:
> > > > As a part of investigation on this issue LKFT teammate Anders Roxell
> > > > git bisected the problem and found bad commit(s) which caused this problem.
> > > >
> > > > The following two patches have been reverted on next-20200519 and retested the
> > > > reproducible steps and confirmed the test case mkfs -t ext4 got PASS.
> > > > ( invoked oom-killer is gone now)
> > > >
> > > > Revert "mm, memcg: avoid stale protection values when cgroup is above
> > > > protection"
> > > >    This reverts commit 23a53e1c02006120f89383270d46cbd040a70bc6.
> > > >
> > > > Revert "mm, memcg: decouple e{low,min} state mutations from protection
> > > > checks"
> > > >    This reverts commit 7b88906ab7399b58bb088c28befe50bcce076d82.
> > >
> > > Thanks Anders and Naresh for tracking this down and reverting.
> > >
> > > I'll take a look tomorrow. I don't see anything immediately obviously wrong
> > > in either of those commits from a (very) cursory glance, but they should
> > > only be taking effect if protections are set.
> >
> > Agreed. If memory.{low,min} is not used then the patch should be
> > effectively a nop.
>
> I was staring into the code and do not see anything.  Could you give the
> following debugging patch a try and see whether it triggers?
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index cc555903a332..df2e8df0eb71 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -2404,6 +2404,8 @@ static void get_scan_count(struct lruvec *lruvec, struct scan_control *sc,
>                          * sc->priority further than desirable.
>                          */
>                         scan = max(scan, SWAP_CLUSTER_MAX);
> +
> +                       trace_printk("scan:%lu protection:%lu\n", scan, protection);
>                 } else {
>                         scan = lruvec_size;
>                 }
> @@ -2648,6 +2650,7 @@ static void shrink_node_memcgs(pg_data_t *pgdat, struct scan_control *sc)
>                 mem_cgroup_calculate_protection(target_memcg, memcg);
>
>                 if (mem_cgroup_below_min(memcg)) {
> +                       trace_printk("under min:%lu emin:%lu\n", memcg->memory.min, memcg->memory.emin);
>                         /*
>                          * Hard protection.
>                          * If there is no reclaimable memory, OOM.
> @@ -2660,6 +2663,7 @@ static void shrink_node_memcgs(pg_data_t *pgdat, struct scan_control *sc)
>                          * there is an unprotected supply
>                          * of reclaimable memory from other cgroups.
>                          */
> +                       trace_printk("under low:%lu elow:%lu\n", memcg->memory.low, memcg->memory.elow);
>                         if (!sc->memcg_low_reclaim) {
>                                 sc->memcg_low_skipped = 1;
>                                 continue;

As per your suggestions on debugging this problem,
trace_printk is replaced with printk and applied to your patch on top of the
problematic kernel and here is the test output and link.

mkfs -t ext4 /dev/disk/by-id/ata-TOSHIBA_MG04ACA100N_Y8RQK14KF6XF
mke2fs 1.43.8 (1-Jan-2018)
Creating filesystem with 244190646 4k blocks and 61054976 inodes
Filesystem UUID: 7c380766-0ed8-41ba-a0de-3c08e78f1891
Superblock backups stored on blocks:
32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
102400000, 214990848
Allocating group tables:    0/7453 done
Writing inode tables:    0/7453 done
Creating journal (262144 blocks): [   51.544525] under min:0 emin:0
[   51.845304] under min:0 emin:0
[   51.848738] under min:0 emin:0
[   51.858147] under min:0 emin:0
[   51.861333] under min:0 emin:0
[   51.862034] under min:0 emin:0
[   51.862442] under min:0 emin:0
[   51.862763] under min:0 emin:0

Full test log link,
https://lkft.validation.linaro.org/scheduler/job/1497412#L1451

- Naresh


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
