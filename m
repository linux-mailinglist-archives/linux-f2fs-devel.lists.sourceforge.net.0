Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9774A1DD7F8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2020 22:06:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:Message-ID:
	In-Reply-To:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j1LbEwVZ7HBuc0RIZejXC1e48GTA4k3xdp6PYeUwq/E=; b=JegZhGaBp/CsqYpfHvGNnIrE4
	y+2SyURq1NPG3/Y6hnrJCX01HCP1JMan7KR8l4JgnQzCU58fq7XR9MSkWnXvmhbspSEZIp0lfKg9F
	D4qb6EVpmzdTd1TcD7x58uhrh1OO29kEjtf14wHOzdsdO/LhXnAMKwC9Vv+pZ9j6ibsj8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jbrSj-0001cn-Pk; Thu, 21 May 2020 20:06:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hughd@google.com>) id 1jbrSi-0001cg-9c
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 20:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:Message-ID:
 In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q6rxcBNQ1zsmubc3wyT3H/0+GkcW6r2VdtQUO7eVpuM=; b=PA5/JmaX3tcUrzYWSSVMy38xBL
 NoXexB14k9U1RhqYjSOPfN778Yt9xdfPu0C8aVDNr4Gur1G+duIVob9KzvtmUXlBJhVL9I7gqjOrt
 wg2TNkmnVzFXsYevCuKs0LKm5GZiMh2Q5Fk+nwRht4algjV2nH0ZhobL92NTX30TpBGw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q6rxcBNQ1zsmubc3wyT3H/0+GkcW6r2VdtQUO7eVpuM=; b=PH2asZ8mbb94xn7Nl7zAvzSuS5
 n5zWCMz13AecTje+Lgl+9X1YmXUJXsiN4M4G50PEira8Z0JyRF8Z81wMttAMkmVixXRAVR890wEZk
 jW3RZsmstACS94Gaj/1LXohuxanLp/u8klRFr1H36Fglpio2mR54k71Rn8A2/nl680BY=;
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbrSg-004J2l-T6
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 20:06:40 +0000
Received: by mail-oi1-f196.google.com with SMTP id 23so6080081oiq.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 May 2020 13:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Q6rxcBNQ1zsmubc3wyT3H/0+GkcW6r2VdtQUO7eVpuM=;
 b=Fome3a6tpm2IBqz3WvlZB/B1A/bMjQGR4Zj3VuvRR2fGI5zsqnypeM4EFXp7Zf/dkf
 +TfItzJkD9hawgb5bm56vbw/g3jnHiB3MwuunQxVQjjZPIBQa+DE+UeLxTQdkjyeyK9E
 x9CwJpKLbls0MHOlo3DaVuOy9Q7wDf57b/LcBKb7miliwlmT1d2yLr9Al0TiVh3Cz84s
 WtKQPSMPPIYL4P/iG+aJez3B20kIsGbSVnjHdAVcDONHn6cMfLgdb1vknLDIxjVEPS/R
 9Kd1gWxXLudP3tpFVm0rQ1Rfv/WcdUi26P5BKq6QVYrtI8P/sdU9Laq+iPU2tKeNmFe+
 S5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Q6rxcBNQ1zsmubc3wyT3H/0+GkcW6r2VdtQUO7eVpuM=;
 b=RRJHWFGIX1UuZmWSYmS/UAs641gC68KpCa8ccNFp2jmzePqRAREGlxNsZyaTyIlnen
 IHyyM6eC7wFGyCai5tk9SCdsLhZfJB988vzVA1fDaqQjxkHeKeIibzIEuRV2KVJR4hFq
 b1613xeUwe8RSY59j1bsxlWVzQAW/aNUnb3ScnPVV69ozyD6d/BY1/vaYe0gEhukRpmO
 hoCdbAbPwzkKhmW7S3R1FxygSUR0Vy0vX7PkbG32VH+bZ7k/H4YyGLLra7iF3fQEfemc
 4FHNkfgbviKKMFmTXRb2UDsBixFucJWXXCjDtOHxPzQBvivYhTpJOEYS9+O6F26cBohU
 dWpg==
X-Gm-Message-State: AOAM5338RphQCITGLXtKa8Mu23s1w9P7R3HeBkmJouD+7J3IN2UW68Rn
 H+KtEgeyRzu6eNJIAqKkPkCNEQ==
X-Google-Smtp-Source: ABdhPJyurkLvqoLB0FS3u7uDnzUJ3zFnGkEHZFMCyOcuHt/P1JS+m1iswp90fepgyFfu89MnmgrFtQ==
X-Received: by 2002:aca:3bc3:: with SMTP id i186mr193576oia.122.1590091592807; 
 Thu, 21 May 2020 13:06:32 -0700 (PDT)
Received: from eggly.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id y23sm1861280otk.10.2020.05.21.13.06.30
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Thu, 21 May 2020 13:06:31 -0700 (PDT)
Date: Thu, 21 May 2020 13:06:28 -0700 (PDT)
X-X-Sender: hugh@eggly.anvils
To: Johannes Weiner <hannes@cmpxchg.org>
In-Reply-To: <20200521191746.GB815980@cmpxchg.org>
Message-ID: <alpine.LSU.2.11.2005211250130.1158@eggly.anvils>
References: <CAK8P3a2T_j-Ynvhsqe_FCqS2-ZdLbo0oMbHhHChzMbryE0izAQ@mail.gmail.com>
 <20200519084535.GG32497@dhcp22.suse.cz>
 <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
 <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
 <20200520190906.GA558281@chrisdown.name>
 <20200521095515.GK6462@dhcp22.suse.cz>
 <CA+G9fYvAB9F+Xo0vUsSveKnExkv3cV9-oOG9gBqGEcXsO95m0w@mail.gmail.com>
 <20200521105801.GL6462@dhcp22.suse.cz>
 <alpine.LSU.2.11.2005210504110.1185@eggly.anvils>
 <20200521124444.GP6462@dhcp22.suse.cz> <20200521191746.GB815980@cmpxchg.org>
User-Agent: Alpine 2.11 (LSU 23 2013-08-11)
MIME-Version: 1.0
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.196 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jbrSg-004J2l-T6
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
Cc: lkft-triage@lists.linaro.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm <linux-mm@kvack.org>, Yafang Shao <laoar.shao@gmail.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Cgroups <cgroups@vger.kernel.org>,
 Andrea Arcangeli <aarcange@redhat.com>,
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

On Thu, 21 May 2020, Johannes Weiner wrote:
> 
> Very much appreciate you guys tracking it down so quickly. Sorry about
> the breakage.
> 
> I think mem_cgroup_disabled() checks are pretty good markers of public
> entry points to the memcg API, so I'd prefer that even if a bit more
> verbose. What do you think?

An explicit mem_cgroup_disabled() check would be fine, but I must admit,
the patch below is rather too verbose for my own taste.  Your call.

> 
> ---
> From cd373ec232942a9bc43ee5e7d2171352019a58fb Mon Sep 17 00:00:00 2001
> From: Hugh Dickins <hughd@google.com>
> Date: Thu, 21 May 2020 14:58:36 -0400
> Subject: [PATCH] mm: memcontrol: prepare swap controller setup for integration
>  fix
> 
> Fix crash with cgroup_disable=memory:
> 
> > > > > + mkfs -t ext4 /dev/disk/by-id/ata-TOSHIBA_MG04ACA100N_Y8NRK0BPF6XF
> > > > > mke2fs 1.43.8 (1-Jan-2018)
> > > > > Creating filesystem with 244190646 4k blocks and 61054976 inodes
> > > > > Filesystem UUID: 3bb1a285-2cb4-44b4-b6e8-62548f3ac620
> > > > > Superblock backups stored on blocks:
> > > > > 32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
> > > > > 4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
> > > > > 102400000, 214990848
> > > > > Allocating group tables:    0/7453                           done
> > > > > Writing inode tables:    0/7453                           done
> > > > > Creating journal (262144 blocks): [   35.502102] BUG: kernel NULL
> > > > > pointer dereference, address: 000000c8
> > > > > [   35.508372] #PF: supervisor read access in kernel mode
> > > > > [   35.513506] #PF: error_code(0x0000) - not-present page
> > > > > [   35.518638] *pde = 00000000
> > > > > [   35.521514] Oops: 0000 [#1] SMP
> > > > > [   35.524652] CPU: 0 PID: 145 Comm: kswapd0 Not tainted
> > > > > 5.7.0-rc6-next-20200519+ #1
> > > > > [   35.532121] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
> > > > > 2.2 05/23/2018
> > > > > [   35.539507] EIP: mem_cgroup_get_nr_swap_pages+0x28/0x60
> 
> do_memsw_account() used to be automatically false when the cgroup
> controller was disabled. Now that it's replaced by
> cgroup_memory_noswap, for which this isn't true, make the
> mem_cgroup_disabled() checks explicit in the swap control API.
> 
> [hannes@cmpxchg.org: use mem_cgroup_disabled() in all API functions]
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Debugged-by: Hugh Dickins <hughd@google.com>
> Debugged-by: Michal Hocko <mhocko@kernel.org>
> Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
> ---
>  mm/memcontrol.c | 47 +++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 41 insertions(+), 6 deletions(-)

I'm certainly not against a mem_cgroup_disabled() check in the only
place that's been observed to need it, as a fixup to merge into your
original patch; but this seems rather an over-reaction - and I'm a
little surprised that setting mem_cgroup_disabled() doesn't just
force cgroup_memory_noswap, saving repetitious checks elsewhere
(perhaps there's a difficulty in that, I haven't looked).

Historically, I think we've added mem_cgroup_disabled() checks
(accessing a cacheline we'd rather avoid) where they're necessary,
rather than at every "interface".

And you seem to be in a very "goto out" mood today - we all have
our "goto out" days, alternating with our "return 0" days :)

Hugh

> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 3e000a316b59..850bca380562 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -6811,6 +6811,9 @@ void mem_cgroup_swapout(struct page *page, swp_entry_t entry)
>  	VM_BUG_ON_PAGE(PageLRU(page), page);
>  	VM_BUG_ON_PAGE(page_count(page), page);
>  
> +	if (mem_cgroup_disabled())
> +		return;
> +
>  	if (cgroup_subsys_on_dfl(memory_cgrp_subsys))
>  		return;
>  
> @@ -6876,6 +6879,10 @@ int mem_cgroup_try_charge_swap(struct page *page, swp_entry_t entry)
>  	struct mem_cgroup *memcg;
>  	unsigned short oldid;
>  
> +	if (mem_cgroup_disabled())
> +		return 0;
> +
> +	/* Only cgroup2 has swap.max */
>  	if (!cgroup_subsys_on_dfl(memory_cgrp_subsys))
>  		return 0;
>  
> @@ -6920,6 +6927,9 @@ void mem_cgroup_uncharge_swap(swp_entry_t entry, unsigned int nr_pages)
>  	struct mem_cgroup *memcg;
>  	unsigned short id;
>  
> +	if (mem_cgroup_disabled())
> +		return;
> +
>  	id = swap_cgroup_record(entry, 0, nr_pages);
>  	rcu_read_lock();
>  	memcg = mem_cgroup_from_id(id);
> @@ -6940,12 +6950,25 @@ long mem_cgroup_get_nr_swap_pages(struct mem_cgroup *memcg)
>  {
>  	long nr_swap_pages = get_nr_swap_pages();
>  
> -	if (cgroup_memory_noswap || !cgroup_subsys_on_dfl(memory_cgrp_subsys))
> -		return nr_swap_pages;
> +	if (mem_cgroup_disabled())
> +		goto out;
> +
> +	/* Swap control disabled */
> +	if (cgroup_memory_noswap)
> +		goto out;
> +
> +	/*
> +	 * Only cgroup2 has swap.max, cgroup1 does mem+sw accounting,
> +	 * which does not place restrictions specifically on swap.
> +	 */
> +	if (!cgroup_subsys_on_dfl(memory_cgrp_subsys))
> +		goto out;
> +
>  	for (; memcg != root_mem_cgroup; memcg = parent_mem_cgroup(memcg))
>  		nr_swap_pages = min_t(long, nr_swap_pages,
>  				      READ_ONCE(memcg->swap.max) -
>  				      page_counter_read(&memcg->swap));
> +out:
>  	return nr_swap_pages;
>  }
>  
> @@ -6957,18 +6980,30 @@ bool mem_cgroup_swap_full(struct page *page)
>  
>  	if (vm_swap_full())
>  		return true;
> -	if (cgroup_memory_noswap || !cgroup_subsys_on_dfl(memory_cgrp_subsys))
> -		return false;
> +
> +	if (mem_cgroup_disabled())
> +		goto out;
> +
> +	/* Swap control disabled */
> +	if (cgroup_memory_noswap)
> +		goto out;
> +
> +	/*
> +	 * Only cgroup2 has swap.max, cgroup1 does mem+sw accounting,
> +	 * which does not place restrictions specifically on swap.
> +	 */
> +	if (!cgroup_subsys_on_dfl(memory_cgrp_subsys))
> +		goto out;
>  
>  	memcg = page->mem_cgroup;
>  	if (!memcg)
> -		return false;
> +		goto out;
>  
>  	for (; memcg != root_mem_cgroup; memcg = parent_mem_cgroup(memcg))
>  		if (page_counter_read(&memcg->swap) * 2 >=
>  		    READ_ONCE(memcg->swap.max))
>  			return true;
> -
> +out:
>  	return false;
>  }
>  
> -- 
> 2.26.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
