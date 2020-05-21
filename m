Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A79641DC9E7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2020 11:22:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jbhPX-0003rr-Nv; Thu, 21 May 2020 09:22:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <naresh.kamboju@linaro.org>) id 1jbhPW-0003rk-KX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 09:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FIbEyFSF9lKlh/sPieDWc1oRqrvi4vGBjOrvNTlDQgI=; b=iA5vElEmXzgO8qi05HC6SjhHVE
 6IPoOODCdRiwZVCB87xtlaAqVX6oHrNPyERXJADpZxNdDyb/3CQJ9DngKVCI3S5RhehZae86h7db0
 uIjyAwZ4WStPg04I0zx/clQEIlMFSK97csk6znotYEKn/eRDQ38DSrrK22VoBKHaODLQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FIbEyFSF9lKlh/sPieDWc1oRqrvi4vGBjOrvNTlDQgI=; b=kq7jsLsE/i2TAJUjGfeu99MCh+
 PrBnGCcf3YjCrjl4XD4PTRckPtfyDMguJsFhLiP8s8Qdlfj06sqLa1NpxFnyX7j1R9rrL+eIvZIWh
 xDNynMM71R534IZIn2q2JWneOCgtzCG3mRyYWeg3O+4vNutJfPPkzSx33a4cD2xpv0UE=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbhPQ-003g2V-Aj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 09:22:42 +0000
Received: by mail-lf1-f68.google.com with SMTP id z22so4099804lfd.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 May 2020 02:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FIbEyFSF9lKlh/sPieDWc1oRqrvi4vGBjOrvNTlDQgI=;
 b=Cr+vYd5dIpgIP1m+dtPF8wLQuyM7qoaALMgtSirDDMRRIgqxpytD0hrSF2zko/x5mk
 l/G2FXraKn8PMsmRDq4Un6jQXt2HJ4hL78VRPU+qdLES1+ToQVDFdGiGtpaOGLK7F2zM
 6MKEL1a7yiV4ickufkf1ggX7LbmfPLokTuBN2TG1x20EISryRLnvWvNBgcl/y8m7/sVI
 MO9cnUWS6iHrtzbq50+WiROYQCTdiEG/ExnjIv1i160UasocMEWgmgikQ3pbvdWCeIhi
 xdBAwAYfUkhH3wWYCwg1eVm4WzkttSXEgcgDwM0Fh/LeRJSCjz+QgsRbYOOK7ojMzFLX
 xICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FIbEyFSF9lKlh/sPieDWc1oRqrvi4vGBjOrvNTlDQgI=;
 b=qKZGVN81lfUfLzWdstgrYOZrZRkIJzxy1nVwaKKI8Z5oivhe0l2JMlKgn8r36h+27o
 yZ6zqFHzGVTIzx+fRYMwOKUW3bK7/8fdJ6WLbrPJcv/tbgFH4cDrFD+/cksEniJmW52i
 1Y7j3DNAqmYzhAwWz62o9VDCd9BINBS2JJe9lOUMJt2/MFTiDcfrM5DjMUznIgnAcc08
 bTHcZmW8QbMWmfJpYphkgNhlerwzdt84txptzMvfuve5cro8fNyKNDb2i/ShIDUx5WCa
 4KBpgvTm8WTZtPLkxfkZmDy/qzcQWvFlIuJszZM2P+ptjxmQSEkAvfEVgmTJ5+7FXfF5
 ubkA==
X-Gm-Message-State: AOAM533oE9Ph3texJFEoY1X97ZqI5kvvXA1sd5GZxcePB2lA/VYFbn/Z
 FvKa4lACxYBZ41YHrHdma281UoXfyl/aLSYVTWaG/g==
X-Google-Smtp-Source: ABdhPJxo0iMvxRymbhbSSmZbSlzo/jmqeHEAf6W0prqay+f+/zEUegDczxDDUgR2FE8lvoDDugzyWov/NH6f84fYzgY=
X-Received: by 2002:a19:641b:: with SMTP id y27mr372964lfb.74.1590052942272;
 Thu, 21 May 2020 02:22:22 -0700 (PDT)
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
In-Reply-To: <20200520190906.GA558281@chrisdown.name>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 21 May 2020 14:52:08 +0530
Message-ID: <CA+G9fYt1qvGQTAdUZ4WgitY18cydgnNzqu_fyoTtSm3W8JhF3w@mail.gmail.com>
To: Chris Down <chris@chrisdown.name>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jbhPQ-003g2V-Aj
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
Cc: lkft-triage@lists.linaro.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm <linux-mm@kvack.org>, Yafang Shao <laoar.shao@gmail.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Cgroups <cgroups@vger.kernel.org>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-block <linux-block@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, open list <linux-kernel@vger.kernel.org>,
 "Linux F2FS DEV, Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 21 May 2020 at 00:39, Chris Down <chris@chrisdown.name> wrote:
>
> Hi Naresh,
>
> Naresh Kamboju writes:
> >As a part of investigation on this issue LKFT teammate Anders Roxell
> >git bisected the problem and found bad commit(s) which caused this problem.
> >
> >The following two patches have been reverted on next-20200519 and retested the
> >reproducible steps and confirmed the test case mkfs -t ext4 got PASS.
> >( invoked oom-killer is gone now)
> >
> >Revert "mm, memcg: avoid stale protection values when cgroup is above
> >protection"
> >    This reverts commit 23a53e1c02006120f89383270d46cbd040a70bc6.
> >
> >Revert "mm, memcg: decouple e{low,min} state mutations from protection
> >checks"
> >    This reverts commit 7b88906ab7399b58bb088c28befe50bcce076d82.
>
> Thanks Anders and Naresh for tracking this down and reverting.
>
> I'll take a look tomorrow. I don't see anything immediately obviously wrong in
> either of those commits from a (very) cursory glance, but they should only be
> taking effect if protections are set.
>
> Since you have i386 hardware available, and I don't, could you please apply
> only "avoid stale protection" again and check if it only happens with that
> commit, or requires both? That would help narrow down the suspects.

Not both.
The bad commit is
"mm, memcg: decouple e{low,min} state mutations from protection checks"

>
> Do you use any memcg protections in these tests?
I see three MEMCG configs and please find the kernel config link
for more details.

CONFIG_MEMCG=y
CONFIG_MEMCG_SWAP=y
CONFIG_MEMCG_KMEM=y

kernel config link,
https://builds.tuxbuild.com/8lg6WQibcwtQRRtIa0bcFA/kernel.config

- Naresh


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
