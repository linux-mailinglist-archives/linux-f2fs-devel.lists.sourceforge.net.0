Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA021DCD30
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2020 14:45:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jbkZG-0005Mi-PH; Thu, 21 May 2020 12:44:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mstsxfx@gmail.com>) id 1jbkZF-0005MK-Cj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 12:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7B+zSNVUKDMX+EtrLfhKx/b5Dlg1GLXsdTK5UK1C/wA=; b=GjglrwTHOKyBiVj2+AUQoyQBfy
 VRN9GIqdc9NY7KlHYLpFER7NPGGAZsmVSSzLrwuXM1tuHcRYxa9eDC10c5BX7I4iVFEZoBKyVoPNl
 r4O4Ia06rpugI7JSvXAvL+oeAzv51HZEVWrYL7Fut0EC5VQQVaS3zvX4M1otALUlJCOU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7B+zSNVUKDMX+EtrLfhKx/b5Dlg1GLXsdTK5UK1C/wA=; b=EDiKsP0WRK9odEjxeQZZYT3PBw
 vPbrk+bSNZApcdlKLH0Y7FQIm/FmWhj3+Y18FCns6C62wM4M8UlmeoiVInMl7+/riW8fPUBjViiUq
 luOi7/IDrzW67DQuVTpvoc8Rlb7fCwL47Cp4mpsiwD+I4MGMhD7GPSOKhIw4grD/9ics=;
Received: from mail-ed1-f65.google.com ([209.85.208.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbkZA-003sJu-Sd
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 12:44:57 +0000
Received: by mail-ed1-f65.google.com with SMTP id f13so5955999edr.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 May 2020 05:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7B+zSNVUKDMX+EtrLfhKx/b5Dlg1GLXsdTK5UK1C/wA=;
 b=sRo/d7LVverslpO8FLnrWhrbDNhR0dj6OnvSSzxcXoyFiYaMF4vx+QyyVpQaF+e0CE
 SAgnCPhk1hF+81G7IiKTU2FFYsCG2c0phsgp5vN3aZgEmPqXLddq7LgsY9T7Q86bf6QR
 3Hi596tGcuR63r1kpLsrnvC36aTblTZIqzRKokaSqgi+ioCaDJt9G0MTenRehyAEJmst
 s0vIY3fs0MM8EFuuiaSpMFgJYY5m4PQ2fMh3xkzXzYez87DAlwvASmdie0J7k60+nD5M
 QhD3TKjgYQNSKRu2E6WER+LyBB4fPc7z85MPQGEdHk2KmP1kOx1gVy8O3ZHm6Bv/RkMA
 XgCw==
X-Gm-Message-State: AOAM530LeZ/Q3ApJWQKDlqdyijhWZNXQy//EjUzkBcJ0cy8Ndk3ZNgB0
 lJifWjfeivzxUfVtH3s4yY8=
X-Google-Smtp-Source: ABdhPJyFmwAVPZkzShA2BCWpmRd1w2Y3qvQQ3fG96wsb/P2EJuekC35u1D4g78CqUn7CegdanQGqrg==
X-Received: by 2002:a05:6402:203a:: with SMTP id
 ay26mr7259622edb.205.1590065086406; 
 Thu, 21 May 2020 05:44:46 -0700 (PDT)
Received: from localhost (ip-37-188-180-112.eurotel.cz. [37.188.180.112])
 by smtp.gmail.com with ESMTPSA id rn17sm4757851ejb.115.2020.05.21.05.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 05:44:45 -0700 (PDT)
Date: Thu, 21 May 2020 14:44:44 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Hugh Dickins <hughd@google.com>
Message-ID: <20200521124444.GP6462@dhcp22.suse.cz>
References: <20200519075213.GF32497@dhcp22.suse.cz>
 <CAK8P3a2T_j-Ynvhsqe_FCqS2-ZdLbo0oMbHhHChzMbryE0izAQ@mail.gmail.com>
 <20200519084535.GG32497@dhcp22.suse.cz>
 <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
 <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
 <20200520190906.GA558281@chrisdown.name>
 <20200521095515.GK6462@dhcp22.suse.cz>
 <CA+G9fYvAB9F+Xo0vUsSveKnExkv3cV9-oOG9gBqGEcXsO95m0w@mail.gmail.com>
 <20200521105801.GL6462@dhcp22.suse.cz>
 <alpine.LSU.2.11.2005210504110.1185@eggly.anvils>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.11.2005210504110.1185@eggly.anvils>
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (mstsxfx[at]gmail.com)
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.65 listed in list.dnswl.org]
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jbkZA-003sJu-Sd
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
Cc: lkft-triage@lists.linaro.org, linux-mm <linux-mm@kvack.org>,
 Yafang Shao <laoar.shao@gmail.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Cgroups <cgroups@vger.kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
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

On Thu 21-05-20 05:24:27, Hugh Dickins wrote:
> On Thu, 21 May 2020, Michal Hocko wrote:
> > On Thu 21-05-20 16:11:11, Naresh Kamboju wrote:
> > > On Thu, 21 May 2020 at 15:25, Michal Hocko <mhocko@kernel.org> wrote:
> > > >
> > > > On Wed 20-05-20 20:09:06, Chris Down wrote:
> > > > > Hi Naresh,
> > > > >
> > > > > Naresh Kamboju writes:
> > > > > > As a part of investigation on this issue LKFT teammate Anders Roxell
> > > > > > git bisected the problem and found bad commit(s) which caused this problem.
> > > > > >
> > > > > > The following two patches have been reverted on next-20200519 and retested the
> > > > > > reproducible steps and confirmed the test case mkfs -t ext4 got PASS.
> > > > > > ( invoked oom-killer is gone now)
> > > > > >
> > > > > > Revert "mm, memcg: avoid stale protection values when cgroup is above
> > > > > > protection"
> > > > > >    This reverts commit 23a53e1c02006120f89383270d46cbd040a70bc6.
> > > > > >
> > > > > > Revert "mm, memcg: decouple e{low,min} state mutations from protection
> > > > > > checks"
> > > > > >    This reverts commit 7b88906ab7399b58bb088c28befe50bcce076d82.
> > > > >
> > > > > Thanks Anders and Naresh for tracking this down and reverting.
> > > > >
> > > > > I'll take a look tomorrow. I don't see anything immediately obviously wrong
> > > > > in either of those commits from a (very) cursory glance, but they should
> > > > > only be taking effect if protections are set.
> > > >
> > > > Agreed. If memory.{low,min} is not used then the patch should be
> > > > effectively a nop. Btw. do you see the problem when booting with
> > > > cgroup_disable=memory kernel command line parameter?
> > > 
> > > With extra kernel command line parameters, cgroup_disable=memory
> > > I have noticed a differ problem now.
> > > 
> > > + mkfs -t ext4 /dev/disk/by-id/ata-TOSHIBA_MG04ACA100N_Y8NRK0BPF6XF
> > > mke2fs 1.43.8 (1-Jan-2018)
> > > Creating filesystem with 244190646 4k blocks and 61054976 inodes
> > > Filesystem UUID: 3bb1a285-2cb4-44b4-b6e8-62548f3ac620
> > > Superblock backups stored on blocks:
> > > 32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
> > > 4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
> > > 102400000, 214990848
> > > Allocating group tables:    0/7453                           done
> > > Writing inode tables:    0/7453                           done
> > > Creating journal (262144 blocks): [   35.502102] BUG: kernel NULL
> > > pointer dereference, address: 000000c8
> > > [   35.508372] #PF: supervisor read access in kernel mode
> > > [   35.513506] #PF: error_code(0x0000) - not-present page
> > > [   35.518638] *pde = 00000000
> > > [   35.521514] Oops: 0000 [#1] SMP
> > > [   35.524652] CPU: 0 PID: 145 Comm: kswapd0 Not tainted
> > > 5.7.0-rc6-next-20200519+ #1
> > > [   35.532121] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
> > > 2.2 05/23/2018
> > > [   35.539507] EIP: mem_cgroup_get_nr_swap_pages+0x28/0x60
> > 
> > Could you get faddr2line for this offset?
> 
> No need for that, I can help with the "cgroup_disabled=memory" crash:
> I've been happily running with the fixup below, but haven't got to
> send it in yet (and wouldn't normally be reading mail at this time!)
> because of busy chasing a couple of other bugs (not necessarily mm);
> and maybe the fix would be better with explicit mem_cgroup_disabled()
> test, or maybe that should be where cgroup_memory_noswap is decided -
> up to Johannes.

Thanks Hugh. I can see what is the problem now. I was looking at the
Linus' tree and we have a different code there

	long nr_swap_pages = get_nr_swap_pages();

        if (!do_swap_account || !cgroup_subsys_on_dfl(memory_cgrp_subsys))
                return nr_swap_pages;

which would be impossible to crash so I was really wondering what is
going on here. But there are other changes in the mmotm which I haven't
reviewed yet. Looking at the next tree now it is a fallout from "mm:
memcontrol: prepare swap controller setup for integration".

!memcg check slightly more cryptic than an explicit mem_cgroup_disabled
but I would just leave it to Johannes as well.

> 
> ---
> 
>  mm/memcontrol.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> --- 5.7-rc6-mm1/mm/memcontrol.c	2020-05-20 12:21:56.109693740 -0700
> +++ linux/mm/memcontrol.c	2020-05-20 12:26:15.500478753 -0700
> @@ -6954,7 +6954,8 @@ long mem_cgroup_get_nr_swap_pages(struct
>  {
>  	long nr_swap_pages = get_nr_swap_pages();
>  
> -	if (cgroup_memory_noswap || !cgroup_subsys_on_dfl(memory_cgrp_subsys))
> +	if (!memcg || cgroup_memory_noswap ||
> +            !cgroup_subsys_on_dfl(memory_cgrp_subsys))
>  		return nr_swap_pages;
>  	for (; memcg != root_mem_cgroup; memcg = parent_mem_cgroup(memcg))
>  		nr_swap_pages = min_t(long, nr_swap_pages,

-- 
Michal Hocko
SUSE Labs


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
