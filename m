Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4541FCF27
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2020 16:12:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlYnW-00058h-5Z; Wed, 17 Jun 2020 14:12:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mstsxfx@gmail.com>) id 1jlYnU-00058V-SY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 14:12:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FnLVx3mpNTRNn979KEIujDpuBEHdqJ/b/LKxqUKjo5U=; b=SNy0YJeyV7rjoil24XeUfACAp7
 P10PqZOVScW/dLH75iwx07OY5/iB5aY9KbGN6ERhAX64EFrnlfJ4cjQfEG/h6Fe7+ZqNoJP75Y6Xc
 R9tDjrrRILFFTHGuIWR6ZntD++KIEvMsP+i+9s5phua4pvUwQ4XmsmB5PE7w5yGU+ja8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FnLVx3mpNTRNn979KEIujDpuBEHdqJ/b/LKxqUKjo5U=; b=CLu0QX5H4Rm4/tOtwT5LlA6hC3
 eFjwubLhx1rLHSoLcdfF0VNndfcXijP0iwIpAnzV+Db9oBqrdDlUE3ndwJdrr417ulo6mqg4Y1bsQ
 pfNxb0ubKz6KdqSwWIfxyOofjr94I67rTq2UywrHNT8Y/YJm19vEuexIAn3BPDBgoZRg=;
Received: from mail-ed1-f65.google.com ([209.85.208.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jlYnT-006xeS-Kr
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 14:12:12 +0000
Received: by mail-ed1-f65.google.com with SMTP id p18so2046481eds.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Jun 2020 07:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FnLVx3mpNTRNn979KEIujDpuBEHdqJ/b/LKxqUKjo5U=;
 b=L7Ta/7eZesOs9swQETIjDqr3vFqy9oSMRl+6dwABGWrFvUtIpdZ4p4sh65L+Xcn1tc
 dasnvk1sXEhLIrRY5IVbkElhdlo6jmKwyjO5i0cGp0FxRR9KbXsAcgF9ARdeR4PALp9B
 bbNNed1erZ7Rl+SnpJ1AYg03sHquAn9OYaX7eAboF5B3E7uk9BBmJ4gxxcdhJ2fddsYN
 rbdMeO7RX87sQXSWoV8YyEEFLBvqd7iyDxyIUncIxoCQEsj64EF1/Q3YcuYtjYXbNj2o
 +FBxEXk7kr1G2bGftc5BDYpmyMRLC1UUHfFg/P2x0WeLxcthu8uV9wYN0UYzd2pKfCQW
 ii0w==
X-Gm-Message-State: AOAM530IYxBMSJ3me5r/KIORSPnCfnyRuesdJi9lhYV6eMvKBExG/WmP
 H1D1+Lqml4SPJvpPDsK2n1E=
X-Google-Smtp-Source: ABdhPJznS9MRNi7kFBPyQ0SPfnXV06mWSgLUfdEwyE6fs7gLQFQsvZDC9Kqw5DW5z+Zxjo6sXkZecQ==
X-Received: by 2002:a05:6402:6cc:: with SMTP id
 n12mr7166151edy.266.1592403118087; 
 Wed, 17 Jun 2020 07:11:58 -0700 (PDT)
Received: from localhost (ip-37-188-158-19.eurotel.cz. [37.188.158.19])
 by smtp.gmail.com with ESMTPSA id z20sm34596ejb.68.2020.06.17.07.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 07:11:57 -0700 (PDT)
Date: Wed, 17 Jun 2020 16:11:55 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Chris Down <chris@chrisdown.name>
Message-ID: <20200617141155.GQ9499@dhcp22.suse.cz>
References: <20200519075213.GF32497@dhcp22.suse.cz>
 <CAK8P3a2T_j-Ynvhsqe_FCqS2-ZdLbo0oMbHhHChzMbryE0izAQ@mail.gmail.com>
 <20200519084535.GG32497@dhcp22.suse.cz>
 <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
 <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
 <20200520190906.GA558281@chrisdown.name>
 <20200521095515.GK6462@dhcp22.suse.cz>
 <20200521163450.GV6462@dhcp22.suse.cz>
 <CA+G9fYsdsgRmwLtSKJSzB1eWcUQ1z-_aaU+BNcQpker34XT6_w@mail.gmail.com>
 <20200617135758.GA548179@chrisdown.name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200617135758.GA548179@chrisdown.name>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (mstsxfx[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.65 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jlYnT-006xeS-Kr
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

[Our emails have crossed]

On Wed 17-06-20 14:57:58, Chris Down wrote:
> Naresh Kamboju writes:
> > mkfs -t ext4 /dev/disk/by-id/ata-TOSHIBA_MG04ACA100N_Y8RQK14KF6XF
> > mke2fs 1.43.8 (1-Jan-2018)
> > Creating filesystem with 244190646 4k blocks and 61054976 inodes
> > Filesystem UUID: 7c380766-0ed8-41ba-a0de-3c08e78f1891
> > Superblock backups stored on blocks:
> > 32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
> > 4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
> > 102400000, 214990848
> > Allocating group tables:    0/7453 done
> > Writing inode tables:    0/7453 done
> > Creating journal (262144 blocks): [   51.544525] under min:0 emin:0
> > [   51.845304] under min:0 emin:0
> > [   51.848738] under min:0 emin:0
> > [   51.858147] under min:0 emin:0
> > [   51.861333] under min:0 emin:0
> > [   51.862034] under min:0 emin:0
> > [   51.862442] under min:0 emin:0
> > [   51.862763] under min:0 emin:0
> 
> Thanks, this helps a lot. Somehow we're entering mem_cgroup_below_min even
> when min/emin is 0 (which should indeed be the case if you haven't set them
> in the hierarchy).
> 
> My guess is that page_counter_read(&memcg->memory) is 0, which means
> mem_cgroup_below_min will return 1.

Yes this is the case because this is likely the root memcg which skips
all charges.

> However, I don't know for sure why that should then result in the OOM killer
> coming along. My guess is that since this memcg has 0 pages to scan anyway,
> we enter premature OOM under some conditions. I don't know why we wouldn't
> have hit that with the old version of mem_cgroup_protected that returned
> MEMCG_PROT_* members, though.

Not really. There is likely no other memcg to reclaim from and assuming
min limit protection will result in no reclaimable memory and thus the
OOM killer.

> Can you please try the patch with the `>=` checks in mem_cgroup_below_min
> and mem_cgroup_below_low changed to `>`? If that fixes it, then that gives a
> strong hint about what's going on here.

This would work but I believe an explicit check for the root memcg would
be easier to spot the reasoning.

-- 
Michal Hocko
SUSE Labs


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
