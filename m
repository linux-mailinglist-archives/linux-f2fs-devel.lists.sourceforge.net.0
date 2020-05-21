Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C811DCA9D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2020 12:01:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jbi0v-000146-Pg; Thu, 21 May 2020 10:01:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <arnd@arndb.de>) id 1jbi0p-00010S-GQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 10:01:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5ioqhHu6KgsqlvNoK7ex4iziukVHfGS1C/a2VgXDRbM=; b=PMhfeOB2kcTYyRmnckVXpfgn8H
 B+B96dAruIhKsx+39xS4g0RjnFToeg3g5MPI4tr48jNEozxAlzD+K4aAh/ntZRMiY/YfHFthYsDSh
 x60H4lQOuyNexYMhw/2nhdW1eKdnUOMaWIs7wAKrq0p9Lz2ePe+DUkTsKS4m3cm4/9xI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5ioqhHu6KgsqlvNoK7ex4iziukVHfGS1C/a2VgXDRbM=; b=Ui27pqrlYp/6eqcgDZBTpC94KF
 qYUE3joBsCAnqxaR5hc77WgpmK3mA1nkPUWM2+ItlWDZxq0vLdQsJiZarCtbWoI+h9OFNTgcjC8x6
 LqBRvUynfA4FuOhdFgas+cnfLv3Kr3GrV9inuG0yR0lSkwMetNEZKRQpzw6oyC2V0Bws=;
Received: from mout.kundenserver.de ([217.72.192.75])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbi0k-000gN5-Sw
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 10:01:13 +0000
Received: from mail-qk1-f181.google.com ([209.85.222.181]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MTREY-1jTxsY2gqy-00Tljh for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 May 2020 11:36:06 +0200
Received: by mail-qk1-f181.google.com with SMTP id m11so6598461qka.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 May 2020 02:36:06 -0700 (PDT)
X-Gm-Message-State: AOAM530jV5ZX0yvWgi+DbgJ386GT28Bv+o32fMtF/4QEti41lCjBDS6E
 G4p9qDvMBcIxHYHetpcCJD8cYZgOxdGjRh4rwX0=
X-Google-Smtp-Source: ABdhPJws3KKBV0w5Mhpfv6LZKBqE10KcRtqFB/QC1e+qfkRLL99VkSqd9yoBmueLGwUSMY9q0aWGCr2HfWe2EBzpd8M=
X-Received: by 2002:a37:4c48:: with SMTP id z69mr8052116qka.138.1590053765528; 
 Thu, 21 May 2020 02:36:05 -0700 (PDT)
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
 <CA+G9fYt1qvGQTAdUZ4WgitY18cydgnNzqu_fyoTtSm3W8JhF3w@mail.gmail.com>
In-Reply-To: <CA+G9fYt1qvGQTAdUZ4WgitY18cydgnNzqu_fyoTtSm3W8JhF3w@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 May 2020 11:35:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Yna-BD+M6-+Y2Go_Y0ZXx8_7KMud7JxSfPbG8+-Q7Wg@mail.gmail.com>
Message-ID: <CAK8P3a2Yna-BD+M6-+Y2Go_Y0ZXx8_7KMud7JxSfPbG8+-Q7Wg@mail.gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
X-Provags-ID: V03:K1:JXjYXXOpa9EUsoi6fHD3O+dw+XraafyvsTQ9qOz3iOWyv/0LZIg
 YWSoBENOUGqyXp6EIvHgmWJEMPsjyyGd79FZr7l6tL0L2ah+hzKCLuNDR3W5sV5YhshD05i
 JTNwVaAUu6oJQcinH0TCZ42myftMphWint5w8ORf+c9cimUl58XRwPI6iX9XNVEu2Cd1lZv
 rQIRJTl7XF02TgWQ9pYpA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:j/XoCAUC//A=:1y3hSx7O5wSz0OOCROMi9i
 R2OmOITeUO6WoHCjyntqVlmSGphBSUtwuy3HHMKU4kSm2YPvthM0jglDNAKnzqHWyFkXi+a89
 ibgr8euOVT8DuVCR6SS/NrUHy/XlNWQYqZ6tkKoKt6cffbEZOK5S9OY0ubVwfN0W/rSRoszvv
 wW9ytluTSCr0X6VzLKvhNQjzKD/IGtimUj+A57vPQ+DTbJrDpEKJJ+tWXf2NF82lg4MP6ywbK
 EJbkkeYrJtvx+EmBaSEuVUGk75W1dLJxIRf/w8XaIMK4QfostXhnhV1rVj7qOBbenHcdIUAaQ
 W8wzvLEm4qmskyASwr7q6m5CCe+iSAcrhuVMvE3/BD9zC4BMaIZzWlN7jQT/E5ClvOxJ+JmuA
 Tg7oeWR5SrrUL9eIbypnYDufGG141RRs+jQe1+huna+hW7YyOkmaWdwmTD5GEhrqoUlATxXUz
 koWQJA+eA5/TRRE9Y9iwOKCpVIEmpe2USzs+4JptWsTy1XWaJUlklaupcItiQboVqdy6hNxYz
 14qaXLzSg5yDZqXepFX3+4Bv2JKwKYhx4ZwUjK+lu8Y31DWFHwuqJj7q1yuJLWQuJt/dY0j5K
 JhOekYJNuIo8DO1A20eFejo7V2oYuCWC6zAt1yUBNPN/hEaDd9wO3qcOOzw1FN8zn/mdrX21U
 fpd3FDeeACb5xWXnx+FErAuF70phs4yN1yUeLr5we+Nkv0PBQW9hj/3z9IpO400EowaJoMEnm
 bx2jNQYnWPeTLBLIJUk/XZQdXARsSVv0BOehoZlk5UGH/khNGQscZZgRRi3lGhJ9lkbyjY4/M
 1s2m7VPz4YHW8gvEqOXG9vPCOcbFArA/IrAQnPrFYtzdzfrW+0=
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [217.72.192.75 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [217.72.192.75 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jbi0k-000gN5-Sw
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
 linux-ext4 <linux-ext4@vger.kernel.org>,
 linux-block <linux-block@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Chris Down <chris@chrisdown.name>,
 open list <linux-kernel@vger.kernel.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, May 21, 2020 at 11:22 AM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
> On Thu, 21 May 2020 at 00:39, Chris Down <chris@chrisdown.name> wrote:
> > Since you have i386 hardware available, and I don't, could you please apply
> > only "avoid stale protection" again and check if it only happens with that
> > commit, or requires both? That would help narrow down the suspects.

Note that Naresh is running an i386 kernel on regular 64-bit hardware that
most people have access to.

> kernel config link,
> https://builds.tuxbuild.com/8lg6WQibcwtQRRtIa0bcFA/kernel.config

Do you know if the same bug shows up running a kernel with that
configuration in qemu? I would expect it to, and that would make
it much easier to reproduce.

I would also not be surprised if it happens on all architectures but only
shows up on the 32-bit arm and x86 machines first because they have
a rather limited amount of lowmem. Maybe booting a 64-bit kernel
with "mem=512M" and then running "dd if=/dev/sda of=/dev/null bs=1M"
will also trigger it. I did not attempt to run this myself.

       Arnd


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
