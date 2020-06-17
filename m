Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E7E1FCF00
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2020 16:00:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlYbj-0000II-Px; Wed, 17 Jun 2020 14:00:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mstsxfx@gmail.com>) id 1jlYbh-0000Hn-Mo
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 14:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RpItOWqOCv2p+qOj41TNq3/UacSSYUf9Nq97mewWfpw=; b=gpdHMb3lq+xiY5r7hmN4dSdChR
 IYuqomFnWh2cQvT4VPXbG+2oXljswhoNizjCcxI4zSgvtlo90GI71Fi5AnxlMSMPGiR/kpr+UUyYa
 4PNMtyGnOfK14UZ75/ASZTPl+h7Y1XA+uKFpnFwORYLLezygQFW4wb8s/BcxErakWlPI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RpItOWqOCv2p+qOj41TNq3/UacSSYUf9Nq97mewWfpw=; b=kNJ0g0rL/YPNfZ8CfDrhVhpr3/
 seDiX/OJUzTnBQh2coOvTXmEBkYid68LXbhEbFQai3KATtpKML09vpzACVO8+o9ltX6qJmg7YTg/p
 7jVjHafprSgfLfEnnVatImwRH7AInWAE4u8py6mFC7mAKNBPQboa4PNidsXXInKD5nGc=;
Received: from mail-ed1-f66.google.com ([209.85.208.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jlYbg-006whw-BS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 14:00:01 +0000
Received: by mail-ed1-f66.google.com with SMTP id y6so2037536edi.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Jun 2020 07:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RpItOWqOCv2p+qOj41TNq3/UacSSYUf9Nq97mewWfpw=;
 b=mQp5UTMlxAJfBz26T5fsnTrOc7yVaDFqelo/Xevcqiztszha8jPBRlEKKvB0OMkXiA
 pxLgewuWxknBHS7KO5P8JhWiAA0a85W35H/9HbJtzrWxTa67c/oXVsFQeQaon4D/f+Wa
 Xe1Hcfct+L9vcxxPPlpqj+iMSPbdQmSOCiuneveGkppqOJb785jgDy7rDodnc6Dz1rT6
 NPiCVC46j9zthQia4GlZgvqI1KmK/2tgBtxk8nhX5lsSlD/ybCDCMOy0BUazrnBF1VNb
 MgKOCzW0nIbzkVIKBJ9xMtXl/nCAqPuXoqyEmQrqz9rkLkKiBnICrh8WPuBVJwu3ziTn
 Qe9w==
X-Gm-Message-State: AOAM532UOfQOAb1DD8mmWoW0c9moccqD6Bfl4GdJ2+As0KVSwD1+HIYL
 pOJoWHoWXawgO4IBac3LAl8=
X-Google-Smtp-Source: ABdhPJwoxdVikISMAUb7wioR733/T+n1aieGFGWSsheowKtsKPI7XosyomEKuGtzw9AQuGmNgWVhWQ==
X-Received: by 2002:aa7:d054:: with SMTP id n20mr7264496edo.344.1592402393986; 
 Wed, 17 Jun 2020 06:59:53 -0700 (PDT)
Received: from localhost (ip-37-188-158-19.eurotel.cz. [37.188.158.19])
 by smtp.gmail.com with ESMTPSA id m30sm12372931eda.16.2020.06.17.06.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 06:59:52 -0700 (PDT)
Date: Wed, 17 Jun 2020 15:59:51 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200617135951.GP9499@dhcp22.suse.cz>
References: <CA+G9fYsiZ81pmawUY62K30B6ue+RXYod854RS91R2+F8ZO7Xvw@mail.gmail.com>
 <20200519075213.GF32497@dhcp22.suse.cz>
 <CAK8P3a2T_j-Ynvhsqe_FCqS2-ZdLbo0oMbHhHChzMbryE0izAQ@mail.gmail.com>
 <20200519084535.GG32497@dhcp22.suse.cz>
 <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
 <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
 <20200520190906.GA558281@chrisdown.name>
 <20200521095515.GK6462@dhcp22.suse.cz>
 <20200521163450.GV6462@dhcp22.suse.cz>
 <CA+G9fYsdsgRmwLtSKJSzB1eWcUQ1z-_aaU+BNcQpker34XT6_w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYsdsgRmwLtSKJSzB1eWcUQ1z-_aaU+BNcQpker34XT6_w@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (mstsxfx[at]gmail.com)
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.66 listed in list.dnswl.org]
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jlYbg-006whw-BS
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

On Wed 17-06-20 19:07:20, Naresh Kamboju wrote:
> On Thu, 21 May 2020 at 22:04, Michal Hocko <mhocko@kernel.org> wrote:
> >
> > On Thu 21-05-20 11:55:16, Michal Hocko wrote:
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
> > > effectively a nop.
> >
> > I was staring into the code and do not see anything.  Could you give the
> > following debugging patch a try and see whether it triggers?
> >
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index cc555903a332..df2e8df0eb71 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -2404,6 +2404,8 @@ static void get_scan_count(struct lruvec *lruvec, struct scan_control *sc,
> >                          * sc->priority further than desirable.
> >                          */
> >                         scan = max(scan, SWAP_CLUSTER_MAX);
> > +
> > +                       trace_printk("scan:%lu protection:%lu\n", scan, protection);
> >                 } else {
> >                         scan = lruvec_size;
> >                 }
> > @@ -2648,6 +2650,7 @@ static void shrink_node_memcgs(pg_data_t *pgdat, struct scan_control *sc)
> >                 mem_cgroup_calculate_protection(target_memcg, memcg);
> >
> >                 if (mem_cgroup_below_min(memcg)) {
> > +                       trace_printk("under min:%lu emin:%lu\n", memcg->memory.min, memcg->memory.emin);
> >                         /*
> >                          * Hard protection.
> >                          * If there is no reclaimable memory, OOM.
> > @@ -2660,6 +2663,7 @@ static void shrink_node_memcgs(pg_data_t *pgdat, struct scan_control *sc)
> >                          * there is an unprotected supply
> >                          * of reclaimable memory from other cgroups.
> >                          */
> > +                       trace_printk("under low:%lu elow:%lu\n", memcg->memory.low, memcg->memory.elow);
> >                         if (!sc->memcg_low_reclaim) {
> >                                 sc->memcg_low_skipped = 1;
> >                                 continue;
> 
> As per your suggestions on debugging this problem,
> trace_printk is replaced with printk and applied to your patch on top of the
> problematic kernel and here is the test output and link.
> 
> mkfs -t ext4 /dev/disk/by-id/ata-TOSHIBA_MG04ACA100N_Y8RQK14KF6XF
> mke2fs 1.43.8 (1-Jan-2018)
> Creating filesystem with 244190646 4k blocks and 61054976 inodes
> Filesystem UUID: 7c380766-0ed8-41ba-a0de-3c08e78f1891
> Superblock backups stored on blocks:
> 32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
> 4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
> 102400000, 214990848
> Allocating group tables:    0/7453 done
> Writing inode tables:    0/7453 done
> Creating journal (262144 blocks): [   51.544525] under min:0 emin:0
> [   51.845304] under min:0 emin:0
> [   51.848738] under min:0 emin:0
> [   51.858147] under min:0 emin:0
> [   51.861333] under min:0 emin:0
> [   51.862034] under min:0 emin:0
> [   51.862442] under min:0 emin:0
> [   51.862763] under min:0 emin:0
> 
> Full test log link,
> https://lkft.validation.linaro.org/scheduler/job/1497412#L1451

Thanks a lot. So it is clear that mem_cgroup_below_min got confused and
reported protected cgroup. Both effective and real limits are 0 so there
is no garbage in them. The problem is in mem_cgroup_below_* and it is
quite obvious.

We are doing the following
+static inline bool mem_cgroup_below_min(struct mem_cgroup *memcg)
+{
+       if (mem_cgroup_disabled())
+               return false;
+
+       return READ_ONCE(memcg->memory.emin) >=
+               page_counter_read(&memcg->memory);
+}

and it makes some sense. Except for the root memcg where we do not
account any memory. Adding if (mem_cgroup_is_root(memcg)) return false;
should do the trick. The same is the case for mem_cgroup_below_low.
Could you give it a try please just to confirm?
-- 
Michal Hocko
SUSE Labs


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
