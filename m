Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 449FB1DCB87
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2020 12:58:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jbity-00009i-H0; Thu, 21 May 2020 10:58:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mstsxfx@gmail.com>) id 1jbitx-00009M-4K
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 10:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XNawhknjOIKR4nsDknlNKTgt07zaj8UbYNFvZIbzSoA=; b=GwYnvX+JUnM75K0WKVkf9jhLhF
 JaKHWgi5uZNFgx5HwbXMR6hH73B0iH5fYfDB+qtvj8DuxVehjwyGHzDBK61JYs1Zi36iGDxtMk8jj
 Y+L/g6VAIUk+nWYuoQ0oJAEGEf0HsoW63pAAtisi4t+8zYa3D3/efkMNxgKXe9QcYkv8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XNawhknjOIKR4nsDknlNKTgt07zaj8UbYNFvZIbzSoA=; b=iS3WdsQFZjt5TQ57zef7TlWerJ
 FeFMXBPdJbbv3JB18CHnQhT+YrMyVAFmlohrqeA3oG13mOhdX/b52tfsGuxKSWHBsv5eadG4oOAXD
 W1SRDivEu9jE5nGZ31JBLHJsImhY1bi8Wn14UqyBQl6W94FXGNj8bSg3jvDN7J4ek8HQ=;
Received: from mail-ed1-f67.google.com ([209.85.208.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbitv-000jp4-Tn
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 10:58:13 +0000
Received: by mail-ed1-f67.google.com with SMTP id k19so6368410edv.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 May 2020 03:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XNawhknjOIKR4nsDknlNKTgt07zaj8UbYNFvZIbzSoA=;
 b=Se8lj6x631bhf+oJfW6+ndE1WveSJA8Gkthnce8YMlTAABlsM5QC+dM/s3/1PGzlWA
 qj+cPrtL3EtxerD7Nz14NrhEfQ9BWnq8HL1PM/IQcCHv6gY5t3pjy/fdKi16KbnEOzuR
 /qQ3GmJrVQSjNWkB9hLxoTaPSwfvej+W4Jzh+/bzwKqAFlqSuFm3IisEreOnFOKSku7S
 +agNwhEfRWUWn65jMGuBFPr4TddZhwDTldwXk+orkUskAdfBBiPSR1vDuOQY16e0x2og
 d7MJaIC29LGceutStyBNkVAgsspukQx9SUJPBReQqs3rkPluUaeRtNkVj+666bfAnvJ+
 MX3g==
X-Gm-Message-State: AOAM532anhqnWd5C+DUlhVDz+r+bv+wrUUYbJA+UcTAaSNfe7vWizAUl
 YD0+R0otxSKQZ+9/BD1Ag1E=
X-Google-Smtp-Source: ABdhPJz5cmzkqGt/VjxJ/B57BbRDLsfEshniDGeSG3hqEi0TKwBN20Zmnf3zg4J2qyGDodX/TUsadw==
X-Received: by 2002:a50:ee15:: with SMTP id g21mr7048744eds.170.1590058685348; 
 Thu, 21 May 2020 03:58:05 -0700 (PDT)
Received: from localhost (ip-37-188-180-112.eurotel.cz. [37.188.180.112])
 by smtp.gmail.com with ESMTPSA id dc13sm4285623edb.97.2020.05.21.03.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 03:58:04 -0700 (PDT)
Date: Thu, 21 May 2020 12:58:01 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200521105801.GL6462@dhcp22.suse.cz>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYvAB9F+Xo0vUsSveKnExkv3cV9-oOG9gBqGEcXsO95m0w@mail.gmail.com>
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.67 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (mstsxfx[at]gmail.com)
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jbitv-000jp4-Tn
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

On Thu 21-05-20 16:11:11, Naresh Kamboju wrote:
> On Thu, 21 May 2020 at 15:25, Michal Hocko <mhocko@kernel.org> wrote:
> >
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
> > effectively a nop. Btw. do you see the problem when booting with
> > cgroup_disable=memory kernel command line parameter?
> 
> With extra kernel command line parameters, cgroup_disable=memory
> I have noticed a differ problem now.
> 
> + mkfs -t ext4 /dev/disk/by-id/ata-TOSHIBA_MG04ACA100N_Y8NRK0BPF6XF
> mke2fs 1.43.8 (1-Jan-2018)
> Creating filesystem with 244190646 4k blocks and 61054976 inodes
> Filesystem UUID: 3bb1a285-2cb4-44b4-b6e8-62548f3ac620
> Superblock backups stored on blocks:
> 32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
> 4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
> 102400000, 214990848
> Allocating group tables:    0/7453                           done
> Writing inode tables:    0/7453                           done
> Creating journal (262144 blocks): [   35.502102] BUG: kernel NULL
> pointer dereference, address: 000000c8
> [   35.508372] #PF: supervisor read access in kernel mode
> [   35.513506] #PF: error_code(0x0000) - not-present page
> [   35.518638] *pde = 00000000
> [   35.521514] Oops: 0000 [#1] SMP
> [   35.524652] CPU: 0 PID: 145 Comm: kswapd0 Not tainted
> 5.7.0-rc6-next-20200519+ #1
> [   35.532121] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
> 2.2 05/23/2018
> [   35.539507] EIP: mem_cgroup_get_nr_swap_pages+0x28/0x60

Could you get faddr2line for this offset?

-- 
Michal Hocko
SUSE Labs


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
