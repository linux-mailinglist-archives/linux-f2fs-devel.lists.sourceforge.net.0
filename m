Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 919F91DCCD0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2020 14:25:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:Message-ID:
	In-Reply-To:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pct0Nl7v5XZav+hPf/PdPJvwMXO4YQziVjUwh7E443w=; b=GxnxMGbSSaOhf8AjqydiZGrrT
	Nb92ryQstT/bWU2qzOJFXU+zmy68GyxLvanBU5u/qFSBvfg+/HUARC420NAMuifR/9DuU4ov+iVN0
	ANI4OHA88Mh2h1iskwQJnZE07svoLmiz6lvoVhGAyngFVPWKLXNZwjWWnV3QiCeqo6eoo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jbkGM-0003pF-UZ; Thu, 21 May 2020 12:25:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hughd@google.com>) id 1jbkGE-0003ow-FL
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 12:25:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:Message-ID:
 In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PhDrJCxRBSBAodlC1XBnNa5He6+juNPIjvBJ9yPZkZU=; b=EOKM4MhWlQ4nAUhg86WC3L2yKy
 9av7XMXeBQgWuL4AqgYRfOp0ZCSyRGl1PIve4T5a49zWogG/ayjiNcX0kni2NZNHNhLKMy0qsZavA
 gezhuIW44C7NFhUsIidhyc8fPeyod+uFcXxzBENxqzBZmQwTfkaCQqjL4Ojh4aSirAYY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PhDrJCxRBSBAodlC1XBnNa5He6+juNPIjvBJ9yPZkZU=; b=IJVs79QhD8Df+CJPXzylo3Dvf9
 vTIWkWqrdeaj2LPvPmRJLS6mYC1fQTPtSUw1/mmAZPz9ky3MOWtixqIMVlSSMtLnAa32SfvIvtcKJ
 pAad/KUQunyn7MGkNRvu1YW94M4o84i/sq2gbwd1w4Lmyez5GG62kg8Q31WYlB804yTQ=;
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbkGD-003qw0-3n
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 12:25:18 +0000
Received: by mail-ot1-f66.google.com with SMTP id z3so5321325otp.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 May 2020 05:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=PhDrJCxRBSBAodlC1XBnNa5He6+juNPIjvBJ9yPZkZU=;
 b=GAwoCLbWD9HuyBSQd0wB8YF9zAyMXx8NbeSM7sRIrSyCwgXCk1LyqZeRL1KKYDxGpO
 SfcyL7WWrKzTySa7jQ2M5Ts1LnWUm3g/Qx1L8g5kC2IoeCBruc4gzU1F4CJxlTlthFwn
 8cQLzuQJ8GunRzg6SAVUB5eWIOoS/I4/3TvmOl6Os6sL6dq8+TYnF4G2BikWZZdixt6Z
 8YGeoGhg3eET12atEyxNGeStgzAZYgEGop4eXnXIT8ch1u4jTGjXtDWtipmKoMC+brMH
 7uiUWwSCg6szqJOXce1pc6s7/tvySaQmynhC56Uz1zN68+slGilfarrZouXqBlszBgta
 PC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=PhDrJCxRBSBAodlC1XBnNa5He6+juNPIjvBJ9yPZkZU=;
 b=JykdnGMf7S5BRT7PCkcTTh7dt3Plxns4ot11ThNhlxIB0c6cX2xCCaX+zuJYKeFTom
 Bu4Eya8KJEq5dt15AFNlSbCbsOK3OGgNDX0Q7b/RxpWKk2vPBW6ezWPjrbpRx65DkyAI
 6LhWFvDLKjhFzlJdRRb5poXsXl7gjxOHK1FD3NmeK5Z76U5KIVxqO21tp9fylpSlJHWz
 a9s/Yvd/pQl6mXttNkfM60Hnp5hxLJKzrv4o36sUBPEZTKfcwTbk5A4nBrz4dkPB3p/S
 2ljGeUrwebfo19/ki/jWHlejrkyrG3EtRGXH7vmGBswYUtI/fN6sSibTqM6r7+aoKkj5
 koYA==
X-Gm-Message-State: AOAM533sdmjLGSVs986ktv/cA6E0rhe101uWku5N8Y8D4sJifp3O6KU6
 05jhYrUuSDXR/sHHfTQ8Cm8E0Q==
X-Google-Smtp-Source: ABdhPJz8i6R3+Gpl88cFFCjChR4peNI0ajEE177NOVIpwi4jQ1mVyOkilLJaymEulOMfcKdQ7NDNgg==
X-Received: by 2002:a05:6830:1de3:: with SMTP id
 b3mr6316659otj.71.1590063911088; 
 Thu, 21 May 2020 05:25:11 -0700 (PDT)
Received: from eggly.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id t2sm1553308otq.54.2020.05.21.05.25.07
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Thu, 21 May 2020 05:25:09 -0700 (PDT)
Date: Thu, 21 May 2020 05:24:27 -0700 (PDT)
X-X-Sender: hugh@eggly.anvils
To: Michal Hocko <mhocko@kernel.org>
In-Reply-To: <20200521105801.GL6462@dhcp22.suse.cz>
Message-ID: <alpine.LSU.2.11.2005210504110.1185@eggly.anvils>
References: <20200501135806.4eebf0b92f84ab60bba3e1e7@linux-foundation.org>
 <CA+G9fYsiZ81pmawUY62K30B6ue+RXYod854RS91R2+F8ZO7Xvw@mail.gmail.com>
 <20200519075213.GF32497@dhcp22.suse.cz>
 <CAK8P3a2T_j-Ynvhsqe_FCqS2-ZdLbo0oMbHhHChzMbryE0izAQ@mail.gmail.com>
 <20200519084535.GG32497@dhcp22.suse.cz>
 <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
 <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
 <20200520190906.GA558281@chrisdown.name>
 <20200521095515.GK6462@dhcp22.suse.cz>
 <CA+G9fYvAB9F+Xo0vUsSveKnExkv3cV9-oOG9gBqGEcXsO95m0w@mail.gmail.com>
 <20200521105801.GL6462@dhcp22.suse.cz>
User-Agent: Alpine 2.11 (LSU 23 2013-08-11)
MIME-Version: 1.0
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.66 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1jbkGD-003qw0-3n
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
From: Hugh Dickins via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Hugh Dickins <hughd@google.com>
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
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 21 May 2020, Michal Hocko wrote:
> On Thu 21-05-20 16:11:11, Naresh Kamboju wrote:
> > On Thu, 21 May 2020 at 15:25, Michal Hocko <mhocko@kernel.org> wrote:
> > >
> > > On Wed 20-05-20 20:09:06, Chris Down wrote:
> > > > Hi Naresh,
> > > >
> > > > Naresh Kamboju writes:
> > > > > As a part of investigation on this issue LKFT teammate Anders Roxell
> > > > > git bisected the problem and found bad commit(s) which caused this problem.
> > > > >
> > > > > The following two patches have been reverted on next-20200519 and retested the
> > > > > reproducible steps and confirmed the test case mkfs -t ext4 got PASS.
> > > > > ( invoked oom-killer is gone now)
> > > > >
> > > > > Revert "mm, memcg: avoid stale protection values when cgroup is above
> > > > > protection"
> > > > >    This reverts commit 23a53e1c02006120f89383270d46cbd040a70bc6.
> > > > >
> > > > > Revert "mm, memcg: decouple e{low,min} state mutations from protection
> > > > > checks"
> > > > >    This reverts commit 7b88906ab7399b58bb088c28befe50bcce076d82.
> > > >
> > > > Thanks Anders and Naresh for tracking this down and reverting.
> > > >
> > > > I'll take a look tomorrow. I don't see anything immediately obviously wrong
> > > > in either of those commits from a (very) cursory glance, but they should
> > > > only be taking effect if protections are set.
> > >
> > > Agreed. If memory.{low,min} is not used then the patch should be
> > > effectively a nop. Btw. do you see the problem when booting with
> > > cgroup_disable=memory kernel command line parameter?
> > 
> > With extra kernel command line parameters, cgroup_disable=memory
> > I have noticed a differ problem now.
> > 
> > + mkfs -t ext4 /dev/disk/by-id/ata-TOSHIBA_MG04ACA100N_Y8NRK0BPF6XF
> > mke2fs 1.43.8 (1-Jan-2018)
> > Creating filesystem with 244190646 4k blocks and 61054976 inodes
> > Filesystem UUID: 3bb1a285-2cb4-44b4-b6e8-62548f3ac620
> > Superblock backups stored on blocks:
> > 32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
> > 4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
> > 102400000, 214990848
> > Allocating group tables:    0/7453                           done
> > Writing inode tables:    0/7453                           done
> > Creating journal (262144 blocks): [   35.502102] BUG: kernel NULL
> > pointer dereference, address: 000000c8
> > [   35.508372] #PF: supervisor read access in kernel mode
> > [   35.513506] #PF: error_code(0x0000) - not-present page
> > [   35.518638] *pde = 00000000
> > [   35.521514] Oops: 0000 [#1] SMP
> > [   35.524652] CPU: 0 PID: 145 Comm: kswapd0 Not tainted
> > 5.7.0-rc6-next-20200519+ #1
> > [   35.532121] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
> > 2.2 05/23/2018
> > [   35.539507] EIP: mem_cgroup_get_nr_swap_pages+0x28/0x60
> 
> Could you get faddr2line for this offset?

No need for that, I can help with the "cgroup_disabled=memory" crash:
I've been happily running with the fixup below, but haven't got to
send it in yet (and wouldn't normally be reading mail at this time!)
because of busy chasing a couple of other bugs (not necessarily mm);
and maybe the fix would be better with explicit mem_cgroup_disabled()
test, or maybe that should be where cgroup_memory_noswap is decided -
up to Johannes.

---

 mm/memcontrol.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- 5.7-rc6-mm1/mm/memcontrol.c	2020-05-20 12:21:56.109693740 -0700
+++ linux/mm/memcontrol.c	2020-05-20 12:26:15.500478753 -0700
@@ -6954,7 +6954,8 @@ long mem_cgroup_get_nr_swap_pages(struct
 {
 	long nr_swap_pages = get_nr_swap_pages();
 
-	if (cgroup_memory_noswap || !cgroup_subsys_on_dfl(memory_cgrp_subsys))
+	if (!memcg || cgroup_memory_noswap ||
+            !cgroup_subsys_on_dfl(memory_cgrp_subsys))
 		return nr_swap_pages;
 	for (; memcg != root_mem_cgroup; memcg = parent_mem_cgroup(memcg))
 		nr_swap_pages = min_t(long, nr_swap_pages,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
