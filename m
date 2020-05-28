Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 958551E6518
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2020 16:59:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jeK0h-0005vG-Cx; Thu, 28 May 2020 14:59:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mstsxfx@gmail.com>) id 1jeK0f-0005v9-Fi
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 14:59:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HvdKpHF042iTNApEGGudMnbcuPPZ+JOhqsO7H3d0iMc=; b=YNo9RMQWjgTv6pi8yI0Yw7xRSs
 +KMTzG8I3B0x/hkZHff4X2VRA/FSFsNzBo/r6tWHG9f+KZyjZmfcLzAkb5vWDkefZVi3N9t9HwYXb
 yOV6785yqAD/QeJ3XzGHgHRX3VR+zUgSR18pnQiFPOVk7sR7dGnIbGAIM4otrgvzT0WE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HvdKpHF042iTNApEGGudMnbcuPPZ+JOhqsO7H3d0iMc=; b=LzUyGqS27pvGzHNHpdaklyAc2I
 F+4SYsCRTfTipeYRIYAQg86uxcWMQKa1WTHCftSvfPkv/Gifsdg6auZmmSq0n879WI0lJnVV7Gl1E
 WnrmM5rrzjc6Sly13gP3Luq30nZTWCxqmV5W4eKz05vLKWyhuPMaRbJ4GYTbag37TroA=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jeK0d-00AvZc-Fz
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 14:59:53 +0000
Received: by mail-wm1-f68.google.com with SMTP id u13so3491244wml.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 May 2020 07:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HvdKpHF042iTNApEGGudMnbcuPPZ+JOhqsO7H3d0iMc=;
 b=klbR4W78FHWZme8rhscY5oSIksjWNGlBuIrlehtF9vmTtp0TH/oZpKswGXNPwDmoSm
 hMgIivXyL+clobLzZvV9nryKb4fnOCYZ05WeLjYDPTt1Xo/vcvF/W4rx7+X0PmAlDAd8
 QeMi9h3CyPXp0SkSFU1ts2Yf1hjYFmQ21HJYrc72QIi0zzaJ6J8Ge4ZMNsgaanaPSNhB
 SY0xaJkIJurb+YZ8LddkJ8gAwPghNDvDo8IhWn5uX+wjRkSRdILWRmk7tIew6uwyZxPy
 nce7oyRehn6BYim53YW7Z4CKFUeVKSECyfAnrKNmlvZ02oTbtFrIRE6LU/khyTLnlE5C
 hVSg==
X-Gm-Message-State: AOAM533sbpQs8n0e+/DslAtGqaeTANt5pH8cruUtBai2i874mT4yCrgz
 +iEDR3wZpWnojmLeMWMC2sI=
X-Google-Smtp-Source: ABdhPJwLdJXj9IDbExOvEPWylXBWigVlYHMkRhO6O5dzYmOl704Ju6Ewl0cUi5F1r49EwVynvlA5Tw==
X-Received: by 2002:a1c:230a:: with SMTP id j10mr3748329wmj.124.1590677985101; 
 Thu, 28 May 2020 07:59:45 -0700 (PDT)
Received: from localhost (ip-37-188-185-40.eurotel.cz. [37.188.185.40])
 by smtp.gmail.com with ESMTPSA id t129sm2060873wmf.41.2020.05.28.07.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 07:59:44 -0700 (PDT)
Date: Thu, 28 May 2020 16:59:42 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Johannes Weiner <hannes@cmpxchg.org>
Message-ID: <20200528145942.GF27484@dhcp22.suse.cz>
References: <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
 <20200520190906.GA558281@chrisdown.name>
 <20200521095515.GK6462@dhcp22.suse.cz>
 <CA+G9fYvAB9F+Xo0vUsSveKnExkv3cV9-oOG9gBqGEcXsO95m0w@mail.gmail.com>
 <20200521105801.GL6462@dhcp22.suse.cz>
 <alpine.LSU.2.11.2005210504110.1185@eggly.anvils>
 <20200521124444.GP6462@dhcp22.suse.cz>
 <20200521191746.GB815980@cmpxchg.org>
 <alpine.LSU.2.11.2005211250130.1158@eggly.anvils>
 <20200521215855.GB815153@cmpxchg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521215855.GB815153@cmpxchg.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (mstsxfx[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: cmpxchg.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jeK0d-00AvZc-Fz
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

[Sorry for a late reply - was offline for few days]

On Thu 21-05-20 17:58:55, Johannes Weiner wrote:
> On Thu, May 21, 2020 at 01:06:28PM -0700, Hugh Dickins wrote:
[...]
> >From d9e7ed15d1c9248a3fd99e35e82437549154dac7 Mon Sep 17 00:00:00 2001
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

Yes this looks better. I hope to get to your series soon to have the
full picture finally.

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

-- 
Michal Hocko
SUSE Labs


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
