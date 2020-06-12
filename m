Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7241F77B6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2020 14:09:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jjiUn-0006kw-13; Fri, 12 Jun 2020 12:09:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mstsxfx@gmail.com>) id 1jjiUl-0006kp-UF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jun 2020 12:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0z8NpPBTC8fx2bnuG8Z/NmM1px6+WjPFa2BhCesn7bM=; b=Q3n4IBqh5iYn2Z1C0Eipq/JCed
 XYN4n4uvnt76RtJoUjrYLFTdOJKxHEGqOti4bxK/SaN7PZG2iPvDvhKq1eKfVdy/MbKwsBcbRC94F
 r7jKZ5NwpjiBa8N7XAAAVRMQaSd0UeTcrsiP3OUbdzVIxGAtekxhhEIUSJSjFznJJTWo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0z8NpPBTC8fx2bnuG8Z/NmM1px6+WjPFa2BhCesn7bM=; b=S5BAdKWDK3BvJgXbK0WAbzNRb2
 R5FFqsXnkIIy6EYjJoNJVM7UXcqD69YRxwYXk/UOIA3wz77/9m9XCCKuGw5aB59kYuMe1vhvU2gFi
 RIlWFTy04iL0EyzmisflnM5tLOlH+2cU/RoW1EJqrW4JeGt3mz9LXluOXoUvLqq3HDXk=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jjiUk-0038XX-KI
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jun 2020 12:09:15 +0000
Received: by mail-wr1-f67.google.com with SMTP id h5so9503880wrc.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Jun 2020 05:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0z8NpPBTC8fx2bnuG8Z/NmM1px6+WjPFa2BhCesn7bM=;
 b=fzqJmet95W2dGX4ZTPFG2Ly34nYWHw+irH8IVfArhCKtbAnejnUu1dCdYjr6gvQsfS
 ilGijpKTI4gOzo6NvFF4ZrsjruNWxadZ7fVf+4pHBGzXCEm9DAhTLjtG3AOP2X+sotR2
 AjdyKMW0UxNmDMldXYPXQoZVkk1SvAH17NYm2+JKTekVG9UhWGWZHlj9cL0aCFhkwI+w
 X7xi38wonSZHznJlb+DdRuo6CLeJpt8/oeM6eXbj/Ubou0krvxzTUt0Ds4K0KpknIcKz
 yMhlJvAkV5BtBMRr8A0ykwJ4wI0I6Yky8c2hAyq0iq12hpNSAUj8FJCIG7YkwEM5wUgS
 mRkQ==
X-Gm-Message-State: AOAM531s6ciT1jvITLbCww3zcWHTztKJrtTIjanvwqptSFY+7jJweJaN
 tHZyzJIS89wwMHx1gnDJvc7/5Ms3
X-Google-Smtp-Source: ABdhPJz1sL62XzpDAGQuQcumUUzvpkSfg7su7rAnvTQ7e/vCPEMTYoz1QoY8w+Uh8QVrBnRvZKmM4A==
X-Received: by 2002:a05:6000:1104:: with SMTP id
 z4mr14545075wrw.272.1591963748046; 
 Fri, 12 Jun 2020 05:09:08 -0700 (PDT)
Received: from localhost (ip-37-188-174-201.eurotel.cz. [37.188.174.201])
 by smtp.gmail.com with ESMTPSA id a3sm9652169wrp.91.2020.06.12.05.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 05:09:06 -0700 (PDT)
Date: Fri, 12 Jun 2020 14:09:04 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200612120904.GA8641@dhcp22.suse.cz>
References: <CA+G9fYuDWGZx50UpD+WcsDeHX9vi3hpksvBAWbMgRZadb0Pkww@mail.gmail.com>
 <CA+G9fYs2jg-j_5fdb0OW0G-JzDjN7b8d9qnX7uuk9p4c7mVSig@mail.gmail.com>
 <20200528150310.GG27484@dhcp22.suse.cz>
 <CA+G9fYvDXiZ9E9EfU6h0gsJ+xaXY77mRu9Jg+J7C=X4gJ3qvLg@mail.gmail.com>
 <20200528164121.GA839178@chrisdown.name>
 <CALOAHbAHGOsAUUM7qn=9L1u8kAf6Gztqt=SyHSmZ9XuYZWcKmg@mail.gmail.com>
 <20200529015644.GA84588@chrisdown.name>
 <20200529094910.GH4406@dhcp22.suse.cz>
 <20200611095514.GD20450@dhcp22.suse.cz>
 <CA+G9fYsjH8vOTkSKGa5vgC=0fEXuC5UnGsZOirHxH9nOJSHPdA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYsjH8vOTkSKGa5vgC=0fEXuC5UnGsZOirHxH9nOJSHPdA@mail.gmail.com>
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (mstsxfx[at]gmail.com)
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
X-Headers-End: 1jjiUk-0038XX-KI
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

On Fri 12-06-20 15:13:22, Naresh Kamboju wrote:
> On Thu, 11 Jun 2020 at 15:25, Michal Hocko <mhocko@kernel.org> wrote:
> >
> > On Fri 29-05-20 11:49:20, Michal Hocko wrote:
> > > On Fri 29-05-20 02:56:44, Chris Down wrote:
> > > > Yafang Shao writes:
> > > Agreed. Even if e{low,min} might still have some rough edges I am
> > > completely puzzled how we could end up oom if none of the protection
> > > path triggers which the additional debugging should confirm. Maybe my
> > > debugging patch is incomplete or used incorrectly (maybe it would be
> > > esier to use printk rather than trace_printk?).
> >
> > It would be really great if we could move forward. While the fix (which
> > has been dropped from mmotm) is not super urgent I would really like to
> > understand how it could hit the observed behavior. Can we double check
> > that the debugging patch really doesn't trigger (e.g.
> > s@trace_printk@printk in the first step)?
> 
> Please suggest to me the way to get more debug information
> by providing kernel debug patches and extra kernel configs.
> 
> I have applied your debug patch and tested on top on linux next 20200612
> but did not find any printk output while running mkfs -t ext4 /drive test case.

Have you tried s@trace_printk@printk@ in the patch? AFAIK trace_printk
doesn't dump anything into the printk ring buffer. You would have to
look into trace ring buffer.
-- 
Michal Hocko
SUSE Labs


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
