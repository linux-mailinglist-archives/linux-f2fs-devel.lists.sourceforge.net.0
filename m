Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 186B91D9254
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 May 2020 10:45:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jaxsh-0005H2-04; Tue, 19 May 2020 08:45:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mstsxfx@gmail.com>) id 1jaxsf-0005GI-88
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 May 2020 08:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VLlTscmlbpCKZ4nor9NSeLRkKjW9ch72hYbKNbV2XL8=; b=IshEd9zqvpvOLW4kMhpgrZZ/G2
 /jv2aOuCMzayO7gs4KMM65us5tK8rO5OiaZUYujKE/vVzMI5QsS3uifdPeuQ85kVPRFQcsoH1lxlP
 sUO3J9zEXudw/0OKvUqMyvsGEWBo0hm7MqVM0EmzY3yGWmPISxicr7Avtql8hjoQcGsE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VLlTscmlbpCKZ4nor9NSeLRkKjW9ch72hYbKNbV2XL8=; b=F97gN1BuSYqWscmk+odqHQ/gAC
 EBz7v2bYu7FCXJxEvxlxhQpdXWEfgqZL1AKeb/EugZlXyCW1L+xoMyqWLA+Th+Hmf7RInqPjm1pLj
 7my7isZSAov3npKUA7sGlJ9JyhGnr/ZJ8y+v/eTvrd0HEpVaWohzGjClGuO55bX8Nrh4=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jaxsd-0073ag-PP
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 May 2020 08:45:45 +0000
Received: by mail-wr1-f66.google.com with SMTP id e16so14888807wra.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 May 2020 01:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VLlTscmlbpCKZ4nor9NSeLRkKjW9ch72hYbKNbV2XL8=;
 b=MXikr5gctooh8966E5YZSZKZCyAoYrhxFqXXnYx4X8O8DpZ1beMW+Ak7SCSnWm9e16
 wnm4N37kFvsLneulfh7Lpsl4rou6kvh5/42T8PatDf/oy4EA4RIMPY0te4+TelY3pLiL
 bnY+0I9ZIQOICDrRXnJw3yJ+PL+lGSlsUTtnG9IkcPy6YGLwyOixQeynUafzyLvISP9t
 8Y8Zae/yI6IByOX+u2InLIHr0FrClp98X7b5nzafsVgFwy9QEHq6xJVsYXkeU10r+W+D
 x8f0AZ4QjAZ4yRws7aqsHSAAlMblUVQBKGQXc9b+XWDXCZkTrlsiQcz5bKBiSHCozUKs
 5kCA==
X-Gm-Message-State: AOAM531Jlyv9V3qqOeHRxYOSHhTZOfUGBJKror3K8c4E8mBH0v3OsNRP
 eRKYvlZsBGnSLH40xa4u0nE=
X-Google-Smtp-Source: ABdhPJwX9uniXfChgB/t9L9lwBsmYEKUSMJMO45yp0yCMYOVHIGMwp7lYEjNDLfh+Oj66I63vmhbKw==
X-Received: by 2002:adf:ed06:: with SMTP id a6mr23890678wro.8.1589877937465;
 Tue, 19 May 2020 01:45:37 -0700 (PDT)
Received: from localhost (ip-37-188-176-234.eurotel.cz. [37.188.176.234])
 by smtp.gmail.com with ESMTPSA id j2sm19737914wrp.47.2020.05.19.01.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 01:45:36 -0700 (PDT)
Date: Tue, 19 May 2020 10:45:35 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200519084535.GG32497@dhcp22.suse.cz>
References: <CA+G9fYu2ruH-8uxBHE0pdE6RgRTSx4QuQPAN=Nv3BCdRd2ouYA@mail.gmail.com>
 <20200501135806.4eebf0b92f84ab60bba3e1e7@linux-foundation.org>
 <CA+G9fYsiZ81pmawUY62K30B6ue+RXYod854RS91R2+F8ZO7Xvw@mail.gmail.com>
 <20200519075213.GF32497@dhcp22.suse.cz>
 <CAK8P3a2T_j-Ynvhsqe_FCqS2-ZdLbo0oMbHhHChzMbryE0izAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2T_j-Ynvhsqe_FCqS2-ZdLbo0oMbHhHChzMbryE0izAQ@mail.gmail.com>
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (mstsxfx[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.66 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
X-Headers-End: 1jaxsd-0073ag-PP
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
 Naresh Kamboju <naresh.kamboju@linaro.org>, Hugh Dickins <hughd@google.com>,
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

On Tue 19-05-20 10:11:25, Arnd Bergmann wrote:
> On Tue, May 19, 2020 at 9:52 AM Michal Hocko <mhocko@kernel.org> wrote:
> >
> > On Mon 18-05-20 19:40:55, Naresh Kamboju wrote:
> > > Thanks for looking into this problem.
> > >
> > > On Sat, 2 May 2020 at 02:28, Andrew Morton <akpm@linux-foundation.org> wrote:
> > > >
> > > > On Fri, 1 May 2020 18:08:28 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > >
> > > > > mkfs -t ext4 invoked oom-killer on i386 kernel running on x86_64 device
> > > > > and started happening on linux -next master branch kernel tag next-20200430
> > > > > and next-20200501. We did not bisect this problem.
> > [...]
> > > Creating journal (131072 blocks): [   31.251333] mkfs.ext4 invoked
> > > oom-killer: gfp_mask=0x101cc0(GFP_USER|__GFP_WRITE), order=0,
> > > oom_score_adj=0
> > [...]
> > > [   31.500943] DMA free:187396kB min:22528kB low:28160kB high:33792kB
> > > reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB
> > > active_file:4736kB inactive_file:431688kB unevictable:0kB
> > > writepending:62020kB present:783360kB managed:668264kB mlocked:0kB
> > > kernel_stack:888kB pagetables:0kB bounce:0kB free_pcp:880kB
> > > local_pcp:216kB free_cma:163840kB
> >
> > This is really unexpected. You are saying this is a regular i386 and DMA
> > should be bottom 16MB while yours is 780MB and the rest of the low mem
> > is in the Normal zone which is completely missing here. How have you got
> > to that configuration? I have to say I haven't seen anything like that
> > on i386.
> 
> I think that line comes from an ARM32 beaglebone-X15 machine showing
> the same symptom. The i386 line from the log file that Naresh linked to at
> https://lkft.validation.linaro.org/scheduler/job/1406110#L1223  is less
> unusual:

OK, that makes more sense! At least for the memory layout.
 
> [   34.931663] Node 0 active_anon:21464kB inactive_anon:8688kB
> active_file:16604kB inactive_file:849976kB unevictable:0kB
> isolated(anon):0kB isolated(file):0kB mapped:25284kB dirty:58952kB
> writeback:27772kB shmem:8944kB writeback_tmp:0kB unstable:0kB
> all_unreclaimable? yes
> [   34.955523] DMA free:3356kB min:68kB low:84kB high:100kB
> reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB
> active_file:0kB inactive_file:11964kB unevictable:0kB
> writepending:11980kB present:15964kB managed:15876kB mlocked:0kB
> kernel_stack:0kB pagetables:0kB bounce:0kB free_pcp:0kB local_pcp:0kB
> free_cma:0kB
> [   34.983385] lowmem_reserve[]: 0 825 1947 825
> [   34.987678] Normal free:3948kB min:7732kB low:8640kB high:9548kB
> reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB
> active_file:1096kB inactive_file:786400kB unevictable:0kB
> writepending:65432kB present:884728kB managed:845576kB mlocked:0kB
> kernel_stack:1112kB pagetables:0kB bounce:0kB free_pcp:2908kB
> local_pcp:500kB free_cma:0kB

The lowmem is really low (way below the min watermark so even memory
reserves for high priority and atomic requests are depleted. There is
still 786MB of inactive page cache to be reclaimed. It doesn't seem to
be dirty or under the writeback but it still might be pinned by the
filesystem. I would suggest watching vmscan reclaim tracepoints and
check why the reclaim fails to reclaim anything.
-- 
Michal Hocko
SUSE Labs


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
