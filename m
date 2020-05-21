Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C50231DD790
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2020 21:47:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jbrA1-00081C-RD; Thu, 21 May 2020 19:47:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hannes@cmpxchg.org>) id 1jbrA0-00080z-Ng
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 19:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3saNR5c+6VNupgYjih4e3CSZVXxO/Uu/tqHqOuV8bQg=; b=XWZrEueU8MydGikgKnoO0MRZvr
 lzVL3T9CwR+oLkhiZsYjoi7THk465PRlHIyGquQkaBdoWNSKqNZ/Ahox9s5Ey5JpXvMUuSrb4WGtV
 qDzLCeM/m9qYrJGL+yjrm00UqBbJDVaR8OsbaxDWUH5YRfzYJHJHaXtpr43EZg0ABlLc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3saNR5c+6VNupgYjih4e3CSZVXxO/Uu/tqHqOuV8bQg=; b=civwxRDPTnpw9YLa6wDmHg9rug
 x9YNUSuBCyfxbxXx8Bt7oOYGsPlfmuf30Bkki9FhPgjyLR76yg7YHK0QcdmqG4Trsz+b2OPY4xx5W
 O8aE1NRj85iV/kSGvhSDHS9IQtstkFFaJPuOp4b1YVrpgh3/+18E62fNhjI9qzuHCazE=;
Received: from mail-qt1-f194.google.com ([209.85.160.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbr9y-00BaLS-F4
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 19:47:20 +0000
Received: by mail-qt1-f194.google.com with SMTP id c24so6493055qtw.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 May 2020 12:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3saNR5c+6VNupgYjih4e3CSZVXxO/Uu/tqHqOuV8bQg=;
 b=IZHHDCMOyktHFom60CWiiTZknilhOZz2yQd0nUXDZoj4AWiZZoLpX54YbH1BHJEwAr
 ISqrRSXko4V4gmriEkRFbmWgaTiJhYeOIhuVFGVBsr6kIs7FuL9BVTwQYgvv+cUQcCvI
 cwPKnifZ6trujNffSOBlfNAYuzfnTyCo6H0wEwK6htR8qWlsCT6Thi3pVTHSSd8Q3dmO
 vB2eX0uQX772TtB9QLPUkTOvgnp78QZH5zqVyMRVI3OCix8duRSLLcl+31RlEbr9l7r1
 /8hPAk5zNBB3jfH2nGYdBaa2EKHPtHMy7KVXRqQpSf3UYQs1mKQaWvJRJTz7wNJ7NIuX
 0EFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3saNR5c+6VNupgYjih4e3CSZVXxO/Uu/tqHqOuV8bQg=;
 b=p8uR97J7MlhL9c3ftwmcDC24kRZ2cMD9U8tRk5bJb2pknVvB2vD8A0XmfwVHHNJbU3
 ldGhPIkRyQda4xNZL2dwyTkWc9BZ7K8C5uQEZqI+3EA+NdvdvgBBlyBS4/rXJyFB+JCx
 8DmXF6Mz407ohGXNdEY0fYYUSdaTAR7DZHiUWseCm1DbYpS1vopgDzN54dhmW2XSuNbq
 UpEzj6aZulpgix3pFn0LVto/o99M6PPXItxw59wFicqutSzBV48qtHUixyxaoZGkGJMf
 bgaDLa4TvyM7lY2+kWn/IgDxmqQ2ipf0ah5m94HZO4A0KFZlOLwojfzRadnnTOXD+3JQ
 9Lhw==
X-Gm-Message-State: AOAM533Zca+JOYaCY2r6JhAON2HaALXftZKrRKmUyw3n/X5adFjZYwd5
 VU5rSE1B5HaAsOPMu8KVMFBb+6RdNGk=
X-Google-Smtp-Source: ABdhPJzVWP1hA7wiiSGD2yjVWj4mcyrIqhfmshAaGG5iJui8AOs5vLOi37iHWy6Hm3r3/Z1bDOTdTg==
X-Received: by 2002:ac8:17f0:: with SMTP id r45mr12186357qtk.114.1590088690329; 
 Thu, 21 May 2020 12:18:10 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:4708])
 by smtp.gmail.com with ESMTPSA id j3sm5380605qkf.9.2020.05.21.12.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 12:18:09 -0700 (PDT)
Date: Thu, 21 May 2020 15:17:46 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Michal Hocko <mhocko@kernel.org>
Message-ID: <20200521191746.GB815980@cmpxchg.org>
References: <CAK8P3a2T_j-Ynvhsqe_FCqS2-ZdLbo0oMbHhHChzMbryE0izAQ@mail.gmail.com>
 <20200519084535.GG32497@dhcp22.suse.cz>
 <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
 <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
 <20200520190906.GA558281@chrisdown.name>
 <20200521095515.GK6462@dhcp22.suse.cz>
 <CA+G9fYvAB9F+Xo0vUsSveKnExkv3cV9-oOG9gBqGEcXsO95m0w@mail.gmail.com>
 <20200521105801.GL6462@dhcp22.suse.cz>
 <alpine.LSU.2.11.2005210504110.1185@eggly.anvils>
 <20200521124444.GP6462@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521124444.GP6462@dhcp22.suse.cz>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jbr9y-00BaLS-F4
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
 Naresh Kamboju <naresh.kamboju@linaro.org>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-block <linux-block@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Chris Down <chris@chrisdown.name>,
 open list <linux-kernel@vger.kernel.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, May 21, 2020 at 02:44:44PM +0200, Michal Hocko wrote:
> On Thu 21-05-20 05:24:27, Hugh Dickins wrote:
> > On Thu, 21 May 2020, Michal Hocko wrote:
> > > On Thu 21-05-20 16:11:11, Naresh Kamboju wrote:
> > > > On Thu, 21 May 2020 at 15:25, Michal Hocko <mhocko@kernel.org> wrote:
> > > > >
> > > > > On Wed 20-05-20 20:09:06, Chris Down wrote:
> > > > > > Hi Naresh,
> > > > > >
> > > > > > Naresh Kamboju writes:
> > > > > > > As a part of investigation on this issue LKFT teammate Anders Roxell
> > > > > > > git bisected the problem and found bad commit(s) which caused this problem.
> > > > > > >
> > > > > > > The following two patches have been reverted on next-20200519 and retested the
> > > > > > > reproducible steps and confirmed the test case mkfs -t ext4 got PASS.
> > > > > > > ( invoked oom-killer is gone now)
> > > > > > >
> > > > > > > Revert "mm, memcg: avoid stale protection values when cgroup is above
> > > > > > > protection"
> > > > > > >    This reverts commit 23a53e1c02006120f89383270d46cbd040a70bc6.
> > > > > > >
> > > > > > > Revert "mm, memcg: decouple e{low,min} state mutations from protection
> > > > > > > checks"
> > > > > > >    This reverts commit 7b88906ab7399b58bb088c28befe50bcce076d82.
> > > > > >
> > > > > > Thanks Anders and Naresh for tracking this down and reverting.
> > > > > >
> > > > > > I'll take a look tomorrow. I don't see anything immediately obviously wrong
> > > > > > in either of those commits from a (very) cursory glance, but they should
> > > > > > only be taking effect if protections are set.
> > > > >
> > > > > Agreed. If memory.{low,min} is not used then the patch should be
> > > > > effectively a nop. Btw. do you see the problem when booting with
> > > > > cgroup_disable=memory kernel command line parameter?
> > > > 
> > > > With extra kernel command line parameters, cgroup_disable=memory
> > > > I have noticed a differ problem now.
> > > > 
> > > > + mkfs -t ext4 /dev/disk/by-id/ata-TOSHIBA_MG04ACA100N_Y8NRK0BPF6XF
> > > > mke2fs 1.43.8 (1-Jan-2018)
> > > > Creating filesystem with 244190646 4k blocks and 61054976 inodes
> > > > Filesystem UUID: 3bb1a285-2cb4-44b4-b6e8-62548f3ac620
> > > > Superblock backups stored on blocks:
> > > > 32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
> > > > 4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
> > > > 102400000, 214990848
> > > > Allocating group tables:    0/7453                           done
> > > > Writing inode tables:    0/7453                           done
> > > > Creating journal (262144 blocks): [   35.502102] BUG: kernel NULL
> > > > pointer dereference, address: 000000c8
> > > > [   35.508372] #PF: supervisor read access in kernel mode
> > > > [   35.513506] #PF: error_code(0x0000) - not-present page
> > > > [   35.518638] *pde = 00000000
> > > > [   35.521514] Oops: 0000 [#1] SMP
> > > > [   35.524652] CPU: 0 PID: 145 Comm: kswapd0 Not tainted
> > > > 5.7.0-rc6-next-20200519+ #1
> > > > [   35.532121] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
> > > > 2.2 05/23/2018
> > > > [   35.539507] EIP: mem_cgroup_get_nr_swap_pages+0x28/0x60
> > > 
> > > Could you get faddr2line for this offset?
> > 
> > No need for that, I can help with the "cgroup_disabled=memory" crash:
> > I've been happily running with the fixup below, but haven't got to
> > send it in yet (and wouldn't normally be reading mail at this time!)
> > because of busy chasing a couple of other bugs (not necessarily mm);
> > and maybe the fix would be better with explicit mem_cgroup_disabled()
> > test, or maybe that should be where cgroup_memory_noswap is decided -
> > up to Johannes.
> 
> Thanks Hugh. I can see what is the problem now. I was looking at the
> Linus' tree and we have a different code there
> 
> 	long nr_swap_pages = get_nr_swap_pages();
> 
>         if (!do_swap_account || !cgroup_subsys_on_dfl(memory_cgrp_subsys))
>                 return nr_swap_pages;
> 
> which would be impossible to crash so I was really wondering what is
> going on here. But there are other changes in the mmotm which I haven't
> reviewed yet. Looking at the next tree now it is a fallout from "mm:
> memcontrol: prepare swap controller setup for integration".
> 
> !memcg check slightly more cryptic than an explicit mem_cgroup_disabled
> but I would just leave it to Johannes as well.

Very much appreciate you guys tracking it down so quickly. Sorry about
the breakage.

I think mem_cgroup_disabled() checks are pretty good markers of public
entry points to the memcg API, so I'd prefer that even if a bit more
verbose. What do you think?

---
From cd373ec232942a9bc43ee5e7d2171352019a58fb Mon Sep 17 00:00:00 2001
From: Hugh Dickins <hughd@google.com>
Date: Thu, 21 May 2020 14:58:36 -0400
Subject: [PATCH] mm: memcontrol: prepare swap controller setup for integration
 fix

Fix crash with cgroup_disable=memory:

> > > > + mkfs -t ext4 /dev/disk/by-id/ata-TOSHIBA_MG04ACA100N_Y8NRK0BPF6XF
> > > > mke2fs 1.43.8 (1-Jan-2018)
> > > > Creating filesystem with 244190646 4k blocks and 61054976 inodes
> > > > Filesystem UUID: 3bb1a285-2cb4-44b4-b6e8-62548f3ac620
> > > > Superblock backups stored on blocks:
> > > > 32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
> > > > 4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
> > > > 102400000, 214990848
> > > > Allocating group tables:    0/7453                           done
> > > > Writing inode tables:    0/7453                           done
> > > > Creating journal (262144 blocks): [   35.502102] BUG: kernel NULL
> > > > pointer dereference, address: 000000c8
> > > > [   35.508372] #PF: supervisor read access in kernel mode
> > > > [   35.513506] #PF: error_code(0x0000) - not-present page
> > > > [   35.518638] *pde = 00000000
> > > > [   35.521514] Oops: 0000 [#1] SMP
> > > > [   35.524652] CPU: 0 PID: 145 Comm: kswapd0 Not tainted
> > > > 5.7.0-rc6-next-20200519+ #1
> > > > [   35.532121] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
> > > > 2.2 05/23/2018
> > > > [   35.539507] EIP: mem_cgroup_get_nr_swap_pages+0x28/0x60

do_memsw_account() used to be automatically false when the cgroup
controller was disabled. Now that it's replaced by
cgroup_memory_noswap, for which this isn't true, make the
mem_cgroup_disabled() checks explicit in the swap control API.

[hannes@cmpxchg.org: use mem_cgroup_disabled() in all API functions]
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Debugged-by: Hugh Dickins <hughd@google.com>
Debugged-by: Michal Hocko <mhocko@kernel.org>
Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
---
 mm/memcontrol.c | 47 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 3e000a316b59..850bca380562 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -6811,6 +6811,9 @@ void mem_cgroup_swapout(struct page *page, swp_entry_t entry)
 	VM_BUG_ON_PAGE(PageLRU(page), page);
 	VM_BUG_ON_PAGE(page_count(page), page);
 
+	if (mem_cgroup_disabled())
+		return;
+
 	if (cgroup_subsys_on_dfl(memory_cgrp_subsys))
 		return;
 
@@ -6876,6 +6879,10 @@ int mem_cgroup_try_charge_swap(struct page *page, swp_entry_t entry)
 	struct mem_cgroup *memcg;
 	unsigned short oldid;
 
+	if (mem_cgroup_disabled())
+		return 0;
+
+	/* Only cgroup2 has swap.max */
 	if (!cgroup_subsys_on_dfl(memory_cgrp_subsys))
 		return 0;
 
@@ -6920,6 +6927,9 @@ void mem_cgroup_uncharge_swap(swp_entry_t entry, unsigned int nr_pages)
 	struct mem_cgroup *memcg;
 	unsigned short id;
 
+	if (mem_cgroup_disabled())
+		return;
+
 	id = swap_cgroup_record(entry, 0, nr_pages);
 	rcu_read_lock();
 	memcg = mem_cgroup_from_id(id);
@@ -6940,12 +6950,25 @@ long mem_cgroup_get_nr_swap_pages(struct mem_cgroup *memcg)
 {
 	long nr_swap_pages = get_nr_swap_pages();
 
-	if (cgroup_memory_noswap || !cgroup_subsys_on_dfl(memory_cgrp_subsys))
-		return nr_swap_pages;
+	if (mem_cgroup_disabled())
+		goto out;
+
+	/* Swap control disabled */
+	if (cgroup_memory_noswap)
+		goto out;
+
+	/*
+	 * Only cgroup2 has swap.max, cgroup1 does mem+sw accounting,
+	 * which does not place restrictions specifically on swap.
+	 */
+	if (!cgroup_subsys_on_dfl(memory_cgrp_subsys))
+		goto out;
+
 	for (; memcg != root_mem_cgroup; memcg = parent_mem_cgroup(memcg))
 		nr_swap_pages = min_t(long, nr_swap_pages,
 				      READ_ONCE(memcg->swap.max) -
 				      page_counter_read(&memcg->swap));
+out:
 	return nr_swap_pages;
 }
 
@@ -6957,18 +6980,30 @@ bool mem_cgroup_swap_full(struct page *page)
 
 	if (vm_swap_full())
 		return true;
-	if (cgroup_memory_noswap || !cgroup_subsys_on_dfl(memory_cgrp_subsys))
-		return false;
+
+	if (mem_cgroup_disabled())
+		goto out;
+
+	/* Swap control disabled */
+	if (cgroup_memory_noswap)
+		goto out;
+
+	/*
+	 * Only cgroup2 has swap.max, cgroup1 does mem+sw accounting,
+	 * which does not place restrictions specifically on swap.
+	 */
+	if (!cgroup_subsys_on_dfl(memory_cgrp_subsys))
+		goto out;
 
 	memcg = page->mem_cgroup;
 	if (!memcg)
-		return false;
+		goto out;
 
 	for (; memcg != root_mem_cgroup; memcg = parent_mem_cgroup(memcg))
 		if (page_counter_read(&memcg->swap) * 2 >=
 		    READ_ONCE(memcg->swap.max))
 			return true;
-
+out:
 	return false;
 }
 
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
