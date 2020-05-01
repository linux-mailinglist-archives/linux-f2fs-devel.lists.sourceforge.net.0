Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AD01C1F13
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 May 2020 22:58:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jUcjn-0005PK-Fk; Fri, 01 May 2020 20:58:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <akpm@linux-foundation.org>) id 1jUcjm-0005PC-4N
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 May 2020 20:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=anY1t++TYfe8lj2ggI2dV8W2DbMMj8yfyXJW+IQHW6U=; b=ag1yOc3bNBJUAGDtSHeoETX+u9
 flDv783L1Doi1tBpOJkk7fgyzB94onaa+mv7oYJpD/aP0FDbFepyCmf0bsNEtkbb1fWx2O/pr+Bt1
 XIvltvAQuKwMMZ1+7upGhfvqIgedKvqS7DPKFIljZXOc4oOI2w4qblNjjbnhSR3i4B1U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=anY1t++TYfe8lj2ggI2dV8W2DbMMj8yfyXJW+IQHW6U=; b=YxsmZ2SRjHTkz6H8DU6ULoNZBL
 ppWCe22rx765QAKju5fxgNHjJIUrv6j+P9axFa62SDVQsD5L+DqZsgeJ+LTN597YZwRpZg0KAZzoE
 jaZY9RWnEidgl/3xcE+XPjQ/HfabjNYiN+1NtM7iP/qevrsEBpt42f7ZqSa4hTeZghvc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jUcjh-0079lV-RW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 May 2020 20:58:22 +0000
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A53E3216FD;
 Fri,  1 May 2020 20:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588366687;
 bh=PHAeuAjto7YSPUcW9IpDpIz6jTr+6+rE49PpUYBb17o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iBbqAgH/8G5kCVKRHKmsayQJh12Ske4yDZYyRWiSbMac1qjEi90aavUHh0afBsqR2
 9b2wMVEluTKDUehCxsaBSkmWlBZUqA3R2Tgc4CVEM8Y4zm0ooqXv/G256MzCeXWp/V
 sn5RY0Y6djNBT/M7VKJ6c65X4E7PnY5aH0OcUQz8=
Date: Fri, 1 May 2020 13:58:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-Id: <20200501135806.4eebf0b92f84ab60bba3e1e7@linux-foundation.org>
In-Reply-To: <CA+G9fYu2ruH-8uxBHE0pdE6RgRTSx4QuQPAN=Nv3BCdRd2ouYA@mail.gmail.com>
References: <CA+G9fYu2ruH-8uxBHE0pdE6RgRTSx4QuQPAN=Nv3BCdRd2ouYA@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: tuxbuild.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jUcjh-0079lV-RW
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
 linux-f2fs-devel@lists.sourceforge.net, linux-mm <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, lkft-triage@lists.linaro.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4 <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, 1 May 2020 18:08:28 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:

> mkfs -t ext4 invoked oom-killer on i386 kernel running on x86_64 device
> and started happening on linux -next master branch kernel tag next-20200430
> and next-20200501. We did not bisect this problem.

It would be wonderful if you could do so, please.  I can't immediately see
any MM change in this area which might cause this.

> metadata
>   git branch: master
>   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   git commit: e4a08b64261ab411b15580c369a3b8fbed28bbc1
>   git describe: next-20200430
>   make_kernelversion: 5.7.0-rc3
>   kernel-config:
> https://builds.tuxbuild.com/1YrE_XUQ6odA52tSBM919w/kernel.config
> 
> Steps to reproduce: (always reproducible)

Reproducibility helps!

> oom-killer: gfp_mask=0x101cc0(GFP_USER|__GFP_WRITE), order=0,

> [   34.793430]  pagecache_get_page+0xae/0x260

> [   34.897923] active_anon:5366 inactive_anon:2172 isolated_anon:0
> [   34.897923]  active_file:4151 inactive_file:212494 isolated_file:0
> [   34.897923]  unevictable:0 dirty:16505 writeback:6520 unstable:0

> [ 34.987678] Normal free:3948kB min:7732kB low:8640kB high:9548kB
> reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB
> active_file:1096kB inactive_file:786400kB unevictable:0kB
> writepending:65432kB present:884728kB managed:845576kB mlocked:0kB
> kernel_stack:1112kB pagetables:0kB bounce:0kB free_pcp:2908kB
> local_pcp:500kB free_cma:0kB

ZONE_NORMAL has a huge amount of clean pagecache stuck on the
inactive list, not being reclaimed.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
