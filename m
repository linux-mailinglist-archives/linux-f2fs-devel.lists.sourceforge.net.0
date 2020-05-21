Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 150841DDB17
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2020 01:36:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:Message-ID:
	In-Reply-To:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LDqii1wOqgeycH5G4P/vn3Ai+nXafTPmkDdmGhmlBrM=; b=nFuvsH0rfmcCDeEb72OlY8PeW
	OUO8v3xWJWRw3rphR7h/tDnaXWnvEEUew3FWkxaK25x7TvcWcGBkmxjS60jlMZWd7Y/tfItwWPyk8
	UyELfRqwZyLiwzkfA+pq9curYIBrW2Kw8B7R3bP4xKnxGIretDuehGdpcdXfOjvPM+Q9Q=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jbuja-0002vJ-IF; Thu, 21 May 2020 23:36:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hughd@google.com>) id 1jbujY-0002vA-IN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 23:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:Message-ID:
 In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kuLdeOsDjtq4btndvocDjcU9xa/QKpm/ZAFygkLZQD0=; b=ZBwpEWhGVQvG/dEqZhWFGr0d8l
 F2S3fXmN4JhEhZi95I+Ojr3uNGvyWtVSvwv5d0smPsYxrk6pwkm51rww0CW10E7tqwyA876c1wlbB
 zlWDHuzQ8EHcBvBmZcoPTjuHoWljKTLJW+VoqQmhTlEPd14hmqchDPWeVJqYUnjcodMU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kuLdeOsDjtq4btndvocDjcU9xa/QKpm/ZAFygkLZQD0=; b=gYzYZGLQ1at/YffmCTrxwNGzw0
 j3rJxyKzYw+Gl+0S+b2P5SvJXzkIrurATRA+iy3Inzeoxp7B6AXd/5gF9UsPSe6VQ27/W1Lrl0754
 gMvipzrkmdzPKI/G30mY3fxf7s7usLTRSs8f4zEwbvBBDuxU9HSI4eVDlFpMly60Djbk=;
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbujU-001TLY-UC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 23:36:16 +0000
Received: by mail-ot1-f65.google.com with SMTP id f18so6895914otq.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 May 2020 16:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=kuLdeOsDjtq4btndvocDjcU9xa/QKpm/ZAFygkLZQD0=;
 b=rUoh0EqLHveWp3JmAv8austkXIK10h/ZbmP/iO2jGai2j9kfjNn19FlOu1A+s7cUi9
 WKX4MQfU1iBAXfYYg33aC5VonsRXKpCAEqIynepaFwo9iSQjpBKZMlz4YDXmr801D3Cw
 vyKrq7OhTWEPJUUu0gHafme14RPu6t2Cg7dhm2fldoChmvPt2iqzahr+o2f2vIsCYXWU
 7D16d20kDrhdyMA/altx7HLHOJ5YBOa6oOvNBQ6C4DMYVNuW3+WsAnBqnvLeXajBggif
 +vBJKox3zID8l9wuDMyr6f/2s3P38a+CAl6iZNwFPER1EaXyOjOWR0caKiFzOSEBoLpX
 xJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=kuLdeOsDjtq4btndvocDjcU9xa/QKpm/ZAFygkLZQD0=;
 b=kbCYIjrPRke+NJi7tckKjx2A3xNVbyTzpol2cohtsrkt5W22oZwEHjhcC1PvUzonqy
 Y/0zUjwtkZPhXzefqPqllx9pwabne+iGsSBAegDTqJdOpjiHjxSMx6+rjFlSDcf/lfSa
 6vjq3HBQ6SwdfcHfI02rOgRBFxbHe9xG7xV1oGbiLfNJEffCQ+bHFw18QDmhA1zz3JCu
 5PgKL+RZGvl0iRZLZwpqfUuXYKtTlD+TcXIZ0l5atHEjHxtOTRMvgyVZ1HQRXMUKK7bz
 qcjQJ/vpJ/My+LTh5v7yehrGRnwxCmFR0D+ok4VswewnawuOXUlZPvLRbeQI5KHXfk7s
 N3GA==
X-Gm-Message-State: AOAM533AnBGBe/lP/pEBAduXRVetGC//BAGCzWQEfH1ixE2TUc3eQZuD
 58P1BolbQ5pJPcs0jl8N0bNEAQ==
X-Google-Smtp-Source: ABdhPJxq9NYSUNqGk3KZgFuE6+bBS3i85hFHEJHqR05vwv+zm2qIzHoixf/P7AvUsZ/S1HLdwY2rYA==
X-Received: by 2002:a9d:4902:: with SMTP id e2mr8835571otf.86.1590104159617;
 Thu, 21 May 2020 16:35:59 -0700 (PDT)
Received: from eggly.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id l26sm2077279oos.43.2020.05.21.16.35.56
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Thu, 21 May 2020 16:35:58 -0700 (PDT)
Date: Thu, 21 May 2020 16:35:42 -0700 (PDT)
X-X-Sender: hugh@eggly.anvils
To: Johannes Weiner <hannes@cmpxchg.org>
In-Reply-To: <20200521215855.GB815153@cmpxchg.org>
Message-ID: <alpine.LSU.2.11.2005211614320.1102@eggly.anvils>
References: <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
 <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
 <20200520190906.GA558281@chrisdown.name>
 <20200521095515.GK6462@dhcp22.suse.cz>
 <CA+G9fYvAB9F+Xo0vUsSveKnExkv3cV9-oOG9gBqGEcXsO95m0w@mail.gmail.com>
 <20200521105801.GL6462@dhcp22.suse.cz>
 <alpine.LSU.2.11.2005210504110.1185@eggly.anvils>
 <20200521124444.GP6462@dhcp22.suse.cz> <20200521191746.GB815980@cmpxchg.org>
 <alpine.LSU.2.11.2005211250130.1158@eggly.anvils>
 <20200521215855.GB815153@cmpxchg.org>
User-Agent: Alpine 2.11 (LSU 23 2013-08-11)
MIME-Version: 1.0
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.65 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.65 listed in wl.mailspike.net]
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jbujU-001TLY-UC
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
> On Thu, May 21, 2020 at 01:06:28PM -0700, Hugh Dickins wrote:
> > On Thu, 21 May 2020, Johannes Weiner wrote:
> > > do_memsw_account() used to be automatically false when the cgroup
> > > controller was disabled. Now that it's replaced by
> > > cgroup_memory_noswap, for which this isn't true, make the
> > > mem_cgroup_disabled() checks explicit in the swap control API.
> > > 
> > > [hannes@cmpxchg.org: use mem_cgroup_disabled() in all API functions]
> > > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> > > Debugged-by: Hugh Dickins <hughd@google.com>
> > > Debugged-by: Michal Hocko <mhocko@kernel.org>
> > > Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
> > > ---
> > >  mm/memcontrol.c | 47 +++++++++++++++++++++++++++++++++++++++++------
> > >  1 file changed, 41 insertions(+), 6 deletions(-)
> > 
> > I'm certainly not against a mem_cgroup_disabled() check in the only
> > place that's been observed to need it, as a fixup to merge into your
> > original patch; but this seems rather an over-reaction - and I'm a
> > little surprised that setting mem_cgroup_disabled() doesn't just
> > force cgroup_memory_noswap, saving repetitious checks elsewhere
> > (perhaps there's a difficulty in that, I haven't looked).
> 
> Fair enough, I changed it to set the flag at initialization time if
> mem_cgroup_disabled(). I was never a fan of the old flags, where it
> was never clear what was commandline, and what was internal runtime
> state - do_swap_account? really_do_swap_account? But I think it's
> straight-forward in this case now.
> 
> > Historically, I think we've added mem_cgroup_disabled() checks
> > (accessing a cacheline we'd rather avoid) where they're necessary,
> > rather than at every "interface".
> 
> To me that always seemed like bugs waiting to happen. Like this one!
> 
> It's a jump label nowadays, so I've been liberal with these to avoid
> subtle bugs.
> 
> > And you seem to be in a very "goto out" mood today - we all have
> > our "goto out" days, alternating with our "return 0" days :)
> 
> :-)
> 
> But I agree, best to keep this fixup self-contained and defer anything
> else to separate cleanup patches.
> 
> How about the below? It survives a swaptest with cgroup_disable=memory
> for me.

I like this version *a lot*, thank you. I got worried for a bit by
the "#define cgroup_memory_noswap 1" when #ifndef CONFIG_MEMCG_SWAP,
but now realize that fits perfectly.

> 
> Hugh, I started with your patch, which is why I kept you as the
> author, but as the patch now (and arguably the previous one) is
> sufficiently different, I dropped that now. I hope that's okay.

Absolutely okay, these are yours: I was a little uncomfortable to
see me on the From line before, but it also seemed just too petty
to insist that my name be removed.

(By the way, off-topic for this particular issue, but advance warning
that I hope to post a couple of patches to __read_swap_cache_async()
before the end of the day, first being fixup to some of your mods -
I suspect you got it working well enough, and intended to come back
to check a few details later, but never quite got around to that.)

> 
> ---
> From d9e7ed15d1c9248a3fd99e35e82437549154dac7 Mon Sep 17 00:00:00 2001
> From: Johannes Weiner <hannes@cmpxchg.org>
> Date: Thu, 21 May 2020 17:44:25 -0400
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
> Swap accounting used to be implied-disabled when the cgroup controller
> was disabled. Restore that for the new cgroup_memory_noswap, so that
> we bail out of this function instead of dereferencing a NULL memcg.
> 
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Debugged-by: Hugh Dickins <hughd@google.com>
> Debugged-by: Michal Hocko <mhocko@kernel.org>
> Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>

Acked-by: Hugh Dickins <hughd@google.com>

> ---
>  mm/memcontrol.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 3e000a316b59..e3b785d6e771 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -7075,7 +7075,11 @@ static struct cftype memsw_files[] = {
>  
>  static int __init mem_cgroup_swap_init(void)
>  {
> -	if (mem_cgroup_disabled() || cgroup_memory_noswap)
> +	/* No memory control -> no swap control */
> +	if (mem_cgroup_disabled())
> +		cgroup_memory_noswap = true;
> +
> +	if (cgroup_memory_noswap)
>  		return 0;
>  
>  	WARN_ON(cgroup_add_dfl_cftypes(&memory_cgrp_subsys, swap_files));
> -- 
> 2.26.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
