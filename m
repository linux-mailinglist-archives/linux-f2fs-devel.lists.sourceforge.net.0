Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 416B01DB26C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2020 13:56:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jbNL6-0006Ys-Cw; Wed, 20 May 2020 11:56:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <naresh.kamboju@linaro.org>) id 1jbNL5-0006Yj-6n
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 May 2020 11:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c8qp29x57Bnw83ildG5bfYkgdHVhrczJ6/NyvfJLqdw=; b=IEam9Zv3V/rilRKKESpX9zJ1lw
 iOzUbJ9sUW04fDYNktebnQVnO1e27Am+jJGMC/LWa0KG6Xutrcz/Fajw1TDBCmoRgFJAoZwPsu9tK
 JCSrSuEXvaMO77Nd0CMWnkdptNtSA1KamBZzsWCcsiyZuPfZtjqnerQCyZrgxo9skhnQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c8qp29x57Bnw83ildG5bfYkgdHVhrczJ6/NyvfJLqdw=; b=YulRwgQ2wyYhICcOHAr4v0/O4o
 F8dk+V0+SjeVtaTsxkgRbBBp/D3O/oF/rgKWl3/85zKe5E0a8a2OlDxzLYs9WI/C6GvMa5VxpYkYI
 F/6MaNtJ88C54OrJ3G1R49IBdMXEIgpQMFt9xDGAlTtyMoUycVL4XCPuQqwC7c9SyjMY=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbNL1-00GZXf-9S
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 May 2020 11:56:47 +0000
Received: by mail-lf1-f68.google.com with SMTP id z22so2161115lfd.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 May 2020 04:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c8qp29x57Bnw83ildG5bfYkgdHVhrczJ6/NyvfJLqdw=;
 b=qlgXHVmEwhlw8sQKewHDsuWMSreqtLqu7J0G2FobOqDX6oBRZuV/ovWE3ANMJBrQ/R
 VHSrnEzZvSTDxoGM3/zD4+VTvhNG0yaVzAa7lwGqABFXOzXetvh0ERA4i6G5tYAoy+YR
 Qr6jPv+xDkynFLCazHC8VGxm8nKlCbFmrG5Kj91mWASiJARiWqfoR7ILN0Zk3nndZglm
 xfojJ2HA3S+ljjrJhP5FQNxiCPqhXs7R18c5zKgCMh12Zewow13rinQNy8sr0PEtMvmD
 gPqjH0dG3srB+Q4snOOPhnSigEJYiArkGSq8les+OJeIhHLgVWpVkJPP+TTaSgnYuQhJ
 AIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c8qp29x57Bnw83ildG5bfYkgdHVhrczJ6/NyvfJLqdw=;
 b=HD8Zk3UStrua43iEMc6I3SrnQohkP9k8q6uT8serj9hskVUY6HzpLUCstz0zj8MDa2
 GaO7AxJL5YbpOHUvWGPt5GJVYBSFK8nCRt02sEGDmbe0QUg7W3yPf0EyOWPxNVmGiuW/
 C1ZcM5u9aX/gN8BO5gTu662mXYw14wqIlpDY1lrTQmGNFkwwyP4Jl+w0kC4y+WgNsQrQ
 KAZmX6D6DfP60wKYKJkph9Se6NNwa4Fq9UqcGez55AcSEpwzB8fs3HOxILze1G+fXyUJ
 qhuowP8fCWVcE9Mzv7qjgWdydd0YItN2scGuM4UWVHE3wCxZnxMimv8yOaxrU+O2bJx2
 6uJg==
X-Gm-Message-State: AOAM532xTTxOnp4e7Kn/5/BxjZAlW0NgDvXSeuJ+x4WLxq1jxggcRVLs
 /22Ph+IG+7nqIyxYyQofLNLtkbS6/7Xzc+6aWmuD5w==
X-Google-Smtp-Source: ABdhPJwm4d8MeeXVBkReCSgeKef0/TrHxDY6JMkbe05871VEuSEJIfm5/eJuCpE32/mb9LC8RnbJH+gDczs7BL2boVk=
X-Received: by 2002:a19:8453:: with SMTP id g80mr2422388lfd.167.1589975789287; 
 Wed, 20 May 2020 04:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYu2ruH-8uxBHE0pdE6RgRTSx4QuQPAN=Nv3BCdRd2ouYA@mail.gmail.com>
 <20200501135806.4eebf0b92f84ab60bba3e1e7@linux-foundation.org>
 <CA+G9fYsiZ81pmawUY62K30B6ue+RXYod854RS91R2+F8ZO7Xvw@mail.gmail.com>
 <20200519075213.GF32497@dhcp22.suse.cz>
 <CAK8P3a2T_j-Ynvhsqe_FCqS2-ZdLbo0oMbHhHChzMbryE0izAQ@mail.gmail.com>
 <20200519084535.GG32497@dhcp22.suse.cz>
In-Reply-To: <20200519084535.GG32497@dhcp22.suse.cz>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 20 May 2020 17:26:17 +0530
Message-ID: <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
To: Michal Hocko <mhocko@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jbNL1-00GZXf-9S
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
 Arnd Bergmann <arnd@arndb.de>, Hugh Dickins <hughd@google.com>,
 open list <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
 "Linux F2FS DEV, Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-block <linux-block@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, lkft-triage@lists.linaro.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

FYI,

This issue is specific on 32-bit architectures i386 and arm on linux-next tree.
As per the test results history this problem started happening from
Bad : next-20200430
Good : next-20200429

steps to reproduce:
dd if=/dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190504A00573
of=/dev/null bs=1M count=2048
or
mkfs -t ext4 /dev/disk/by-id/ata-SanDisk_SSD_PLUS_120GB_190804A00BE5


Problem:
[   38.802375] dd invoked oom-killer: gfp_mask=0x100cc0(GFP_USER),
order=0, oom_score_adj=0

i386 crash log:  https://pastebin.com/Hb8U89vU
arm crash log: https://pastebin.com/BD9t3JTm

On Tue, 19 May 2020 at 14:15, Michal Hocko <mhocko@kernel.org> wrote:
>
> On Tue 19-05-20 10:11:25, Arnd Bergmann wrote:
> > On Tue, May 19, 2020 at 9:52 AM Michal Hocko <mhocko@kernel.org> wrote:
> > >
> > > On Mon 18-05-20 19:40:55, Naresh Kamboju wrote:
> > > > Thanks for looking into this problem.
> > > >
> > > > On Sat, 2 May 2020 at 02:28, Andrew Morton <akpm@linux-foundation.org> wrote:
> > > > >
> > > > > On Fri, 1 May 2020 18:08:28 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > > >
> > > > > > mkfs -t ext4 invoked oom-killer on i386 kernel running on x86_64 device
> > > > > > and started happening on linux -next master branch kernel tag next-20200430
> > > > > > and next-20200501. We did not bisect this problem.
> > > [...]
> > > > Creating journal (131072 blocks): [   31.251333] mkfs.ext4 invoked
> > > > oom-killer: gfp_mask=0x101cc0(GFP_USER|__GFP_WRITE), order=0,
> > > > oom_score_adj=0
> > > [...]
> > > > [   31.500943] DMA free:187396kB min:22528kB low:28160kB high:33792kB
> > > > reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB
> > > > active_file:4736kB inactive_file:431688kB unevictable:0kB
> > > > writepending:62020kB present:783360kB managed:668264kB mlocked:0kB
> > > > kernel_stack:888kB pagetables:0kB bounce:0kB free_pcp:880kB
> > > > local_pcp:216kB free_cma:163840kB
> > >
> > > This is really unexpected. You are saying this is a regular i386 and DMA
> > > should be bottom 16MB while yours is 780MB and the rest of the low mem
> > > is in the Normal zone which is completely missing here. How have you got
> > > to that configuration? I have to say I haven't seen anything like that
> > > on i386.
> >
> > I think that line comes from an ARM32 beaglebone-X15 machine showing
> > the same symptom. The i386 line from the log file that Naresh linked to at
> > https://lkft.validation.linaro.org/scheduler/job/1406110#L1223  is less
> > unusual:
>
> OK, that makes more sense! At least for the memory layout.
>
> > [   34.931663] Node 0 active_anon:21464kB inactive_anon:8688kB
> > active_file:16604kB inactive_file:849976kB unevictable:0kB
> > isolated(anon):0kB isolated(file):0kB mapped:25284kB dirty:58952kB
> > writeback:27772kB shmem:8944kB writeback_tmp:0kB unstable:0kB
> > all_unreclaimable? yes
> > [   34.955523] DMA free:3356kB min:68kB low:84kB high:100kB
> > reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB
> > active_file:0kB inactive_file:11964kB unevictable:0kB
> > writepending:11980kB present:15964kB managed:15876kB mlocked:0kB
> > kernel_stack:0kB pagetables:0kB bounce:0kB free_pcp:0kB local_pcp:0kB
> > free_cma:0kB
> > [   34.983385] lowmem_reserve[]: 0 825 1947 825
> > [   34.987678] Normal free:3948kB min:7732kB low:8640kB high:9548kB
> > reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB
> > active_file:1096kB inactive_file:786400kB unevictable:0kB
> > writepending:65432kB present:884728kB managed:845576kB mlocked:0kB
> > kernel_stack:1112kB pagetables:0kB bounce:0kB free_pcp:2908kB
> > local_pcp:500kB free_cma:0kB
>
> The lowmem is really low (way below the min watermark so even memory
> reserves for high priority and atomic requests are depleted. There is
> still 786MB of inactive page cache to be reclaimed. It doesn't seem to
> be dirty or under the writeback but it still might be pinned by the
> filesystem. I would suggest watching vmscan reclaim tracepoints and
> check why the reclaim fails to reclaim anything.
> --
> Michal Hocko
> SUSE Labs


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
