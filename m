Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC721DD680
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2020 21:00:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jbqQx-0007AA-NB; Thu, 21 May 2020 19:00:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <naresh.kamboju@linaro.org>) id 1jbqQw-0007A3-MV
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 19:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AXqOJl5SmNS23EUn7DmXTUU6aYLgyfPvo+AUamH08Ps=; b=VA3QDCxpNK3eSl0+v+iGPkAK64
 ItgcUkquQdzzB4TuY12m+eIF/CiaFN1PwnsjOBEJEIFfSWh83SJCH9mUFmd/XhzQfqtT5kbZ3MZF0
 eOLX65izwv94A5TRhPbBNNjN6snIprItFhe5KxMk/9cKFDx02KPFh1X/nvsG9rQVcG8A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AXqOJl5SmNS23EUn7DmXTUU6aYLgyfPvo+AUamH08Ps=; b=MwjQgdKru4MHnAj9UG9TvE1H7f
 1ROu4CFTPB6WyV9TBz6KVEO/UOwApo0JCp84UU7LhcKzV0z7f/3utzhSDsk8jrbF+gNgIH7h1IwUI
 oKLfTRTNAnR9YKD5VZuOOURU9shvq1tACRqVGWIOFFcwQUG2UosxQMstGjo1kBbeNF4E=;
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbqQp-001CDB-EP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 19:00:46 +0000
Received: by mail-lj1-f195.google.com with SMTP id g1so9600302ljk.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 May 2020 12:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AXqOJl5SmNS23EUn7DmXTUU6aYLgyfPvo+AUamH08Ps=;
 b=EV5SVn70MuPiXaA+/GpI4b2qrg0jB93InY/vaKKkvXw3rt6V19F3iaEfufdWjb2vSa
 LFgwuEMLZ0kF+u4vLem/Ho+YYOlDTSymGzxy0FWxZiHOsB3Pb3GSFPQ6THq8MehoMw81
 61D12qPxoVMXCVN5YnrMpoSh0ZCOqjVhvK2/icCRVt/PPsd4BcWFGL0kAP/7zDq1hN3x
 a1rzoPThWH5HcKX0GiUC4cxi3kkuCMXpV76kYKiXipe6YgwkiIKVt/YehTDSxdT8FKMQ
 CKv5YcXmrRHEWyhnCcxlLCZV3yGZBNkQfBJxwnNbBjgGPVYWSZIk3apxM0beTrE2kQJt
 vtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AXqOJl5SmNS23EUn7DmXTUU6aYLgyfPvo+AUamH08Ps=;
 b=byy31EBW+R8Ilbo29fkwH67WKKV2Kp6lXtYTbJR3VN82inijvv4eK0og2xosejIbv3
 Fm6NTI/sS6tewXEp2g4WNpl2nRUKDyJ37apEb0AJ8FLmIF6Iu/dBwUdmbLcJvIAJmw/B
 TKWBKcyVQHJPyoE6yPK7Pj9EexAeEN++jQeuzQTuiJjWoyeXWNvm01kdv0j0BxW5uQVE
 4dkhpns/Ptq5FdS0vOX3RImTTSjW5TVQVkd1YUh4m7onMZMglu6b9tpoMz5nI4FYrqt5
 wPeSBUE5EOsMbQUx79T0zGV6c/4WeZx8P1PUng8RrCzjR0TojK16SNN0wYMnekQzFowH
 TjLA==
X-Gm-Message-State: AOAM532iso8w7gUcFmJ+YDbP8Pvap+kf/Hxp4oBrt18+EIGK4d32Zdpc
 w9lAli6AiqFgDJDK43Qt1MAwrsxDsQN9Wg9tzCgvuA==
X-Google-Smtp-Source: ABdhPJztzAYrR/hpe1uRAGQjKmg0ls00XHM6k9/5+3Vj5L9HrQE3V1E3er3ujQPjsfP8Tn3nR1o1fnGVTi8pnw7kWuo=
X-Received: by 2002:a2e:6c0c:: with SMTP id h12mr5664520ljc.266.1590087625478; 
 Thu, 21 May 2020 12:00:25 -0700 (PDT)
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
Date: Fri, 22 May 2020 00:30:13 +0530
Message-ID: <CA+G9fYuDWGZx50UpD+WcsDeHX9vi3hpksvBAWbMgRZadb0Pkww@mail.gmail.com>
To: Michal Hocko <mhocko@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jbqQp-001CDB-EP
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
> I was staring into the code and did not see anything.  Could you give the
> following debugging patch a try and see whether it triggers?

These code paths did not touch it seems. but still see the reported problem.
Please find a detailed test log output [1]

And
One more test log with cgroup_disable=memory [2]

Test log link,
[1] https://pastebin.com/XJU7We1g
[2] https://pastebin.com/BZ0BMUVt


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
