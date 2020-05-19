Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CCD1D916E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 May 2020 09:52:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jax3D-00067b-BO; Tue, 19 May 2020 07:52:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mstsxfx@gmail.com>) id 1jax3C-00067P-1v
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 May 2020 07:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q9ehllzv4GXD6PHjLq8rxZ0NEvwuAG+BryL3jyLoW3I=; b=cxxK+Q9Zr3TaHjKX5irdA7Btcq
 ER2diG8e30IAuyDi1D9zHfdu/lDHwjOuA40WfjAvCEnwmTRDnOQkvV785IWSuGfdRrk2ecENE88ti
 QSYTHd0yctVkszmOmrvOk27wmQbOjpqLdZteFqQBmcAmG4Uhrb5wI0Lwct5a4kxc2pi8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q9ehllzv4GXD6PHjLq8rxZ0NEvwuAG+BryL3jyLoW3I=; b=YdtYuVK1n3WIwlMHRns6lY/cpL
 W9e628za68DylyTq9HZTBlk+pfMMQAvsp8ZtEBw0OHmch9Uy5ACi59QHf/C6k9kTQluDEfh20pn7z
 l9KnB6oDcBefYqSWiIPQx7JOJ2PHMGQA1TSRiX2fZ+jiJVviIuXa0iltkClYrGmgKNGY=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jax38-000N3D-4X
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 May 2020 07:52:33 +0000
Received: by mail-wm1-f67.google.com with SMTP id h4so1985880wmb.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 May 2020 00:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q9ehllzv4GXD6PHjLq8rxZ0NEvwuAG+BryL3jyLoW3I=;
 b=rbQOwbcf1qfCd6TuSBz7/zk3GxnZDpJ/NMDKek/OtLPS/Zv3Z3aEqPSMfSvb7bp7X5
 qJImr3WHBGy3ZcHA0de/eXrFihGFUJQnJDnCX/dIqorJipkohkRUBLXuMe1/CbFtQ6q0
 kJesK5A+P75Zpy4oJpvFGieaO/5eJwoZJkUgctmBx8KyLqnDHaMg/lvObKEUzml4NXq/
 77nXzFoyOx5oqJgMqi6WxzJnbNcxMILb+PZrO1uHIUg/T7CMRYZMkMX0J3BvEMQbG30y
 +mr0se7OdFbCWL7nSoEy9o1avvJP2/d2cQGYlFQm2SmWkXmk0L2SEt91W6tpFPBpZY4q
 ZXZA==
X-Gm-Message-State: AOAM533r6vKn/5FHvXz4aGWxxQsTyN19kKxz5rxDEm6z4W83XGZmIIVr
 OWoANkVAXDdKE7/w9N7RQv8=
X-Google-Smtp-Source: ABdhPJzhMPJJ+bOTnb0XzxprTwcOOTMoZpRkuCsUFILfWTJFhfoKhfdBOE3Io5xf2x700pgQq1fN2w==
X-Received: by 2002:a1c:1902:: with SMTP id 2mr3881648wmz.178.1589874736792;
 Tue, 19 May 2020 00:52:16 -0700 (PDT)
Received: from localhost (ip-37-188-176-234.eurotel.cz. [37.188.176.234])
 by smtp.gmail.com with ESMTPSA id q2sm19274851wrx.60.2020.05.19.00.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 00:52:15 -0700 (PDT)
Date: Tue, 19 May 2020 09:52:13 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200519075213.GF32497@dhcp22.suse.cz>
References: <CA+G9fYu2ruH-8uxBHE0pdE6RgRTSx4QuQPAN=Nv3BCdRd2ouYA@mail.gmail.com>
 <20200501135806.4eebf0b92f84ab60bba3e1e7@linux-foundation.org>
 <CA+G9fYsiZ81pmawUY62K30B6ue+RXYod854RS91R2+F8ZO7Xvw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYsiZ81pmawUY62K30B6ue+RXYod854RS91R2+F8ZO7Xvw@mail.gmail.com>
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (mstsxfx[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.67 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
X-Headers-End: 1jax38-000N3D-4X
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
 linux-f2fs-devel@lists.sourceforge.net,
 linux-block <linux-block@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, lkft-triage@lists.linaro.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon 18-05-20 19:40:55, Naresh Kamboju wrote:
> Thanks for looking into this problem.
> 
> On Sat, 2 May 2020 at 02:28, Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Fri, 1 May 2020 18:08:28 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > > mkfs -t ext4 invoked oom-killer on i386 kernel running on x86_64 device
> > > and started happening on linux -next master branch kernel tag next-20200430
> > > and next-20200501. We did not bisect this problem.
[...]
> Creating journal (131072 blocks): [   31.251333] mkfs.ext4 invoked
> oom-killer: gfp_mask=0x101cc0(GFP_USER|__GFP_WRITE), order=0,
> oom_score_adj=0
[...]
> [   31.500943] DMA free:187396kB min:22528kB low:28160kB high:33792kB
> reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB
> active_file:4736kB inactive_file:431688kB unevictable:0kB
> writepending:62020kB present:783360kB managed:668264kB mlocked:0kB
> kernel_stack:888kB pagetables:0kB bounce:0kB free_pcp:880kB
> local_pcp:216kB free_cma:163840kB

This is really unexpected. You are saying this is a regular i386 and DMA
should be bottom 16MB while yours is 780MB and the rest of the low mem
is in the Normal zone which is completely missing here. How have you got
to that configuration? I have to say I haven't seen anything like that
on i386.

The failing request is GFP_USER so highmem is not really allowed but
free pages are way above watermarks so the allocation should have just
succeeded.

-- 
Michal Hocko
SUSE Labs


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
