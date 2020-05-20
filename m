Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3DA1DBC2A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2020 20:00:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jbT0w-00056x-QM; Wed, 20 May 2020 18:00:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <naresh.kamboju@linaro.org>) id 1jbT0v-00056p-Gp
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 May 2020 18:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mtpCTLjeaytdekB4adxVz/e/JZwQHur4soi/tkekgkg=; b=J4mMl0Dj5Q6F/qhCVD/B1CqJiU
 3WK1Yum3ECWJ3GLKDnnBcRLgcgT35GaYt9ILPZFo/exlk8Sn5wtDLkB+SfXiBgO/OlF/hVhz2CvZ5
 +NyXruMhvR2W1CibRCzz7jO8FtRvlXOApp0UBQdCh2LZ00gtU7Jlnsy4Nlbb3jMRBw7A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mtpCTLjeaytdekB4adxVz/e/JZwQHur4soi/tkekgkg=; b=nS0lrYc6r1yI2985n5LEQYnF4d
 kqzrgQ3MnAPek9r9wxrBx7BbEsi4U1GadSvFkkg5qqslj0y56On+Zyz5YPUw/6/uK71GMvR32+YBu
 oJwmXfEkXpK7pPLHzYr364Dl9s8CT6UAVVfJcDxNuzOgWD0EvdqkEyexp7K5gluX0w18=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbT0o-00Gv4T-NU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 May 2020 18:00:20 +0000
Received: by mail-lj1-f193.google.com with SMTP id m12so2477759ljc.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 May 2020 11:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mtpCTLjeaytdekB4adxVz/e/JZwQHur4soi/tkekgkg=;
 b=RwL7kSM3fz9MR6t5Ar2hYTR0dC+a68qyUw6+z9033WeXCAUoxY8PEL7x2rcKx9bIWT
 l6A08Wjxs5sPfZMw5X09MFSUjE1qHLWgyYHW8VFFkTznN60/pkdMAWpnger7o85A8dVP
 qTXxWNl+c9c6DyvNDvC0ebMsh3xbuJUKuQ8Rz44tF4eOqCus/XLjH8vxAcgNxnvE6ECD
 vDEUVjfrmmgeklu12ukdEkM3ps7/O48UUdbhbzh08v+evhakhTrUIyOdzD4cM7odKyc2
 jWOem0ysPrATgUJg9nMtB+WUY+Ngyots1DIicBIYLP8IlhqZc/3YjYx7aeu0g0fnDMxE
 4bOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mtpCTLjeaytdekB4adxVz/e/JZwQHur4soi/tkekgkg=;
 b=JKuy35zVT/0gPjI/eYt98Wm/65dpGRP6LVzYUem6GclzPNQ69750c9PA6HcLEQGAQJ
 TOuIKAgiKm8qzrPF0JugXJB+vrRn/8fg/ZX45bPJ2h4ywkvJ2/q2WTwMx1JZ3UxHZGE7
 HYdM6wYeAjKlafahqArhE1al986rsv/KSVIGvmREVJLadK6mUI7/WjVydZxS1Scb/Gkg
 7Z981+DCOvEA46+Lpt7DIEsCzSkR+w7pxdNDaM9xsisQEjRc/7JCBMVhpT75nZhg358f
 yjDCV0x4ktTs2fi1yZIfysddS4wSXX7u3W+bFQzBsxi3PK1wjs2nit27s0e6q79d7Ymp
 vn4Q==
X-Gm-Message-State: AOAM5327fMmSMzScLUungICwh6MLVrI96gb53zLNzxhrDruo6F2s5Y3E
 wzrHYv05/gHSOLSmD4JeEWnCZvR10Gfel5xvnFXj4g==
X-Google-Smtp-Source: ABdhPJxMVT2aazzajf86PZFdGt2E7whHDnP+nICKDm4NC6feIw0z4SprtT2do+git6kUcT4Xo3qaJQi4N/SBczqLtpU=
X-Received: by 2002:a2e:3012:: with SMTP id w18mr3286415ljw.55.1589997600706; 
 Wed, 20 May 2020 11:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYu2ruH-8uxBHE0pdE6RgRTSx4QuQPAN=Nv3BCdRd2ouYA@mail.gmail.com>
 <20200501135806.4eebf0b92f84ab60bba3e1e7@linux-foundation.org>
 <CA+G9fYsiZ81pmawUY62K30B6ue+RXYod854RS91R2+F8ZO7Xvw@mail.gmail.com>
 <20200519075213.GF32497@dhcp22.suse.cz>
 <CAK8P3a2T_j-Ynvhsqe_FCqS2-ZdLbo0oMbHhHChzMbryE0izAQ@mail.gmail.com>
 <20200519084535.GG32497@dhcp22.suse.cz>
 <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
In-Reply-To: <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 20 May 2020 23:29:49 +0530
Message-ID: <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
To: Chris Down <chris@chrisdown.name>, Yafang Shao <laoar.shao@gmail.com>, 
 Michal Hocko <mhocko@kernel.org>, Anders Roxell <anders.roxell@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jbT0o-00Gv4T-NU
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Theodore Ts'o <tytso@mit.edu>,
 Arnd Bergmann <arnd@arndb.de>, cgroups@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, open list <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-block <linux-block@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, lkft-triage@lists.linaro.org,
 Johannes Weiner <hannes@cmpxchg.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 20 May 2020 at 17:26, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
>
> This issue is specific on 32-bit architectures i386 and arm on linux-next tree.
> As per the test results history this problem started happening from
> Bad : next-20200430
> Good : next-20200429
>
> steps to reproduce:
> dd if=/dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190504A00573
> of=/dev/null bs=1M count=2048
> or
> mkfs -t ext4 /dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190804A00BE5
>
>
> Problem:
> [   38.802375] dd invoked oom-killer: gfp_mask=0x100cc0(GFP_USER),
> order=0, oom_score_adj=0

As a part of investigation on this issue LKFT teammate Anders Roxell
git bisected the problem and found bad commit(s) which caused this problem.

The following two patches have been reverted on next-20200519 and retested the
reproducible steps and confirmed the test case mkfs -t ext4 got PASS.
( invoked oom-killer is gone now)

Revert "mm, memcg: avoid stale protection values when cgroup is above
protection"
    This reverts commit 23a53e1c02006120f89383270d46cbd040a70bc6.

Revert "mm, memcg: decouple e{low,min} state mutations from protection
checks"
    This reverts commit 7b88906ab7399b58bb088c28befe50bcce076d82.

i386 test log shows mkfs -t ext4 pass
https://lkft.validation.linaro.org/scheduler/job/1443405#L1200

ref:
https://lore.kernel.org/linux-mm/cover.1588092152.git.chris@chrisdown.name/
https://lore.kernel.org/linux-mm/CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com/T/#t

-- 
Linaro LKFT
https://lkft.linaro.org


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
