Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E4F1E6740
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2020 18:17:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jeLDh-00016I-Ty; Thu, 28 May 2020 16:17:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <naresh.kamboju@linaro.org>) id 1jeLDg-000166-Tm
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 16:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IuyHwLJRnB6jxTc1IB7c0ys/rrbHpiCHBZYkZOd5+aA=; b=Fiii662OE87wYXRVNNX2Z65hij
 r+wq2HFWdgGgs4AngQpQ6KmMaPw2B9HnUxvbqvhrJgPaI0793tpxabZVNVd6W6Xw61ZXL76tY1yE2
 M68JxeM4EMxg8jii29SQ4LpBczOIHknaWh+Jc5FdJJBAFwcl6nS00j6/zD8bev6NQuTc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IuyHwLJRnB6jxTc1IB7c0ys/rrbHpiCHBZYkZOd5+aA=; b=H3BwocSNJ7dfIfxv4zD7y2tW2Q
 YnjuLEP8vrBaUaQMqh/UcoTk0PWl/mivz/hZZg3CHDnPheogQXgFTNGeVqjFWEfu1Wxs55DGXXiZi
 EI2uoaK0cwQOXEZJYUdep1sfZcBGCsWZ82hFSLbKmYGGVc+oAGCq6YB0cNhuFptxQ6ZI=;
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jeLDb-001goS-L5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 16:17:24 +0000
Received: by mail-lf1-f65.google.com with SMTP id r125so16868805lff.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 May 2020 09:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IuyHwLJRnB6jxTc1IB7c0ys/rrbHpiCHBZYkZOd5+aA=;
 b=dnY861HISlW7Skc3gzpG3vW0s3QiWx9O4snM0Q63YTXMKM+DTDIREHzF4vRDxhIvbZ
 dYi7yQdeWR7/U7kdlDUHwOi9DdY7WbtDafHbadPk2OPyvMhIIkEiiUHeUss1TwcHy759
 AkF2Q3ZVo/VG5Bdc4OEnX9FsUtb9Iw0ZFZ7YKTkSRlM9J0Gonu/ZDOEK5W9Y3RZ86gJk
 S1HLfVmE5rjKgkr2zLBllzghwb3k4F7KnbS94qnb1iZAADxYXmu+D8Da7yx7DAEi6qD0
 X7sm5OjbS/W1CtcsJY4DpGOA0rwpitIt381IGnI44rO6i4hfyMb9laFfBPVIGGQELoEg
 Iv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IuyHwLJRnB6jxTc1IB7c0ys/rrbHpiCHBZYkZOd5+aA=;
 b=rLczm2A/EHv8jt+LdeVlv7wmXgq9WRmxJisxjcr15MW7LDijY7y07uzJrnbgpCb88H
 YJx/HuJqUwZlLoSzpOLzeg9tkr5FtXgTx0+RWqqP969Ay/Xq9b50Y/nHP2BNrBUZfbXo
 9dDOyVl7Dp8hpCpZ6p6uCT8au5knd+UXyGqN9VSECWQeDhjnPTbAQnmcleT68QYaPG23
 eMY3t2pH0BS9VMmjyLqQCoR//B+zBI22+eW5DcABj6DZMA/buTHOnVS0wmpKHu/hZaSM
 VtqdkNjvLD3eR0M7XoNcRHREp+JG7ruR1iGDp9QxZ5pOv1KpJtJles1yGp0usib6zEP5
 /OCA==
X-Gm-Message-State: AOAM532BhWdgrRd/5uZJxaGSruJctI1xlDQ/BqJD2OqlLoJMagY1dAzp
 6nH8oYNNgiNn+HG1LuzYn4TPPYIT5VRsgAAv0ggKBg==
X-Google-Smtp-Source: ABdhPJzEYvmxkKtNlYwKn0L9QLyYj9aEx1L7dHIVoXaEJGqWJSEwrWbMRGZQUlzYp/hC+LakUnqJ3RfWneyXxhcdcOs=
X-Received: by 2002:a05:6512:533:: with SMTP id
 o19mr2029203lfc.6.1590682632866; 
 Thu, 28 May 2020 09:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200519075213.GF32497@dhcp22.suse.cz>
 <CAK8P3a2T_j-Ynvhsqe_FCqS2-ZdLbo0oMbHhHChzMbryE0izAQ@mail.gmail.com>
 <20200519084535.GG32497@dhcp22.suse.cz>
 <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
 <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
 <20200520190906.GA558281@chrisdown.name>
 <20200521095515.GK6462@dhcp22.suse.cz>
 <20200521163450.GV6462@dhcp22.suse.cz>
 <CA+G9fYuDWGZx50UpD+WcsDeHX9vi3hpksvBAWbMgRZadb0Pkww@mail.gmail.com>
 <CA+G9fYs2jg-j_5fdb0OW0G-JzDjN7b8d9qnX7uuk9p4c7mVSig@mail.gmail.com>
 <20200528150310.GG27484@dhcp22.suse.cz>
In-Reply-To: <20200528150310.GG27484@dhcp22.suse.cz>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 28 May 2020 21:47:00 +0530
Message-ID: <CA+G9fYvDXiZ9E9EfU6h0gsJ+xaXY77mRu9Jg+J7C=X4gJ3qvLg@mail.gmail.com>
To: Michal Hocko <mhocko@kernel.org>, Yafang Shao <laoar.shao@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jeLDb-001goS-L5
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
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-block <linux-block@vger.kernel.org>, Cgroups <cgroups@vger.kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Chris Down <chris@chrisdown.name>,
 open list <linux-kernel@vger.kernel.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 28 May 2020 at 20:33, Michal Hocko <mhocko@kernel.org> wrote:
>
> On Fri 22-05-20 02:23:09, Naresh Kamboju wrote:
> > My apology !
> > As per the test results history this problem started happening from
> > Bad : next-20200430 (still reproducible on next-20200519)
> > Good : next-20200429
> >
> > The git tree / tag used for testing is from linux next-20200430 tag and reverted
> > following three patches and oom-killer problem fixed.
> >
> > Revert "mm, memcg: avoid stale protection values when cgroup is above
> > protection"
> > Revert "mm, memcg: decouple e{low,min} state mutations from protectinn checks"
> > Revert "mm-memcg-decouple-elowmin-state-mutations-from-protection-checks-fix"
>
> The discussion has fragmented and I got lost TBH.
> In http://lkml.kernel.org/r/CA+G9fYuDWGZx50UpD+WcsDeHX9vi3hpksvBAWbMgRZadb0Pkww@mail.gmail.com
> you have said that none of the added tracing output has triggered. Does
> this still hold? Because I still have a hard time to understand how
> those three patches could have the observed effects.

On the other email thread [1] this issue is concluded.

Yafang wrote on May 22 2020,

Regarding the root cause, my guess is it makes a similar mistake that
I tried to fix in the previous patch that the direct reclaimer read a
stale protection value.  But I don't think it is worth to add another
fix. The best way is to revert this commit.


[1]  [PATCH v3 2/2] mm, memcg: Decouple e{low,min} state mutations
from protection checks
https://lore.kernel.org/linux-mm/CALOAHbArZ3NsuR3mCnx_kbSF8ktpjhUF2kaaTa7Mb7ocJajsQg@mail.gmail.com/

- Naresh

> --
> Michal Hocko
> SUSE Labs


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
