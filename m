Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F34F71E79C5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2020 11:49:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jebdo-0008M4-PW; Fri, 29 May 2020 09:49:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mstsxfx@gmail.com>) id 1jebdn-0008LO-Jx
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 May 2020 09:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4SLMrx0MWc8j4vJRn7Kgzb3DUyQWlx2ZLRbxHmKbcbE=; b=hc6D9VkHE9/yS/qshiULvLk/0F
 fp8i63Xtun8m0Ua2kWPKq6s5NgwK772nHdinepzUpmf5MTjRMGTrgI3Trnn/0lQ/2646Jpq0PRNd2
 efEqE4QS5fO4AhskVysb9hEHqxfe++2DYeoLHbzOivGjvlnlTb4CCqlnDRH0qkIABjZk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4SLMrx0MWc8j4vJRn7Kgzb3DUyQWlx2ZLRbxHmKbcbE=; b=BKa7/cjNRFVPpKgbNmfiu6w8n/
 owlQIj1qyaVI4iQlCjyjz4Ls61WpXxievI2hm80pfyWi1K6mPuy2lIosGlYSkYcedi37Icc/Hvccv
 Kgfe/LeMsgqCehZmJiP6qXFo3vcNAvH0X6sCmil5spb2ztpCM/oBMEYrIzTzckoRqKnc=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jebdm-002YoD-C2
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 May 2020 09:49:27 +0000
Received: by mail-wr1-f68.google.com with SMTP id x13so2801093wrv.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 May 2020 02:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4SLMrx0MWc8j4vJRn7Kgzb3DUyQWlx2ZLRbxHmKbcbE=;
 b=tN3SsiaLED7s5hjbYgv0vsa9e50EU94nDjAK5Ao1pbUmjIrzw41XXwaDDp5ArrAOJL
 Sl3gPC0ox8VhRoL6/bU3SyY76lcMjkgnl2EhW9YSFmxgWUcLGmtG0NM80uCUPGbVqFLV
 czXxrJqaZ38XSRNTziwhboBXXL3GCEFbqjAHLg+GbczKq9PMgKd3KmuwzT4wujCWZlzu
 QjwOYIqTg3SqXIdYkrlOMgm+EU4MnJbUbIkzph0oFfaH8HrLKJUD4oPdFPpCrNcnZPkE
 LpvorjesGpi4pEPl/WIYIuTpzTQbxbUYAmrvA3jGetwh2jqw++vsIHGlQSMDgGabxZbK
 Pmlw==
X-Gm-Message-State: AOAM53177Da6sP+OAQyme6iGslLRezRqDuiynUEiZhc32om+avsvdGyq
 y0xIPw/BQ2rBHvutcPlQ8TqvrrX5
X-Google-Smtp-Source: ABdhPJynJWn/appsj5zHjc6kja0kVDlwDRUmuKllOuUorUMxNbkdmaKubkMD/idzdl3klO6z62m4Rg==
X-Received: by 2002:adf:f58b:: with SMTP id f11mr7947420wro.155.1590745760055; 
 Fri, 29 May 2020 02:49:20 -0700 (PDT)
Received: from localhost (ip-37-188-150-59.eurotel.cz. [37.188.150.59])
 by smtp.gmail.com with ESMTPSA id 5sm9907553wmd.19.2020.05.29.02.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 02:49:18 -0700 (PDT)
Date: Fri, 29 May 2020 11:49:10 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Chris Down <chris@chrisdown.name>
Message-ID: <20200529094910.GH4406@dhcp22.suse.cz>
References: <20200520190906.GA558281@chrisdown.name>
 <20200521095515.GK6462@dhcp22.suse.cz>
 <20200521163450.GV6462@dhcp22.suse.cz>
 <CA+G9fYuDWGZx50UpD+WcsDeHX9vi3hpksvBAWbMgRZadb0Pkww@mail.gmail.com>
 <CA+G9fYs2jg-j_5fdb0OW0G-JzDjN7b8d9qnX7uuk9p4c7mVSig@mail.gmail.com>
 <20200528150310.GG27484@dhcp22.suse.cz>
 <CA+G9fYvDXiZ9E9EfU6h0gsJ+xaXY77mRu9Jg+J7C=X4gJ3qvLg@mail.gmail.com>
 <20200528164121.GA839178@chrisdown.name>
 <CALOAHbAHGOsAUUM7qn=9L1u8kAf6Gztqt=SyHSmZ9XuYZWcKmg@mail.gmail.com>
 <20200529015644.GA84588@chrisdown.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200529015644.GA84588@chrisdown.name>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (mstsxfx[at]gmail.com)
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jebdm-002YoD-C2
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
 Anders Roxell <anders.roxell@linaro.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, Hugh Dickins <hughd@google.com>,
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

On Fri 29-05-20 02:56:44, Chris Down wrote:
> Yafang Shao writes:
> > Look at this patch[1] carefully you will find that it introduces the
> > same issue that I tried to fix in another patch [2]. Even more sad is
> > these two patches are in the same patchset. Although this issue isn't
> > related with the issue found by Naresh, we have to ask ourselves why
> > we always make the same mistake ?
> > One possible answer is that we always forget the lifecyle of
> > memory.emin before we read it. memory.emin doesn't have the same
> > lifecycle with the memcg, while it really has the same lifecyle with
> > the reclaimer. IOW, once a reclaimer begins the protetion value should
> > be set to 0, and after we traversal the memcg tree we calculate a
> > protection value for this reclaimer, finnaly it disapears after the
> > reclaimer stops. That is why I highly suggest to add an new protection
> > member in scan_control before.
> 
> I agree with you that the e{min,low} lifecycle is confusing for everyone --
> the only thing I've not seen confirmation of is any confirmed correlation
> with the i386 oom killer issue. If you've validated that, I'd like to see
> the data :-)

Agreed. Even if e{low,min} might still have some rough edges I am
completely puzzled how we could end up oom if none of the protection
path triggers which the additional debugging should confirm. Maybe my
debugging patch is incomplete or used incorrectly (maybe it would be
esier to use printk rather than trace_printk?).
-- 
Michal Hocko
SUSE Labs


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
