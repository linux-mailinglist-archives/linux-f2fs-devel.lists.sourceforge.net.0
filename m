Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8321FCF0E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2020 16:04:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlYgK-0004oz-EF; Wed, 17 Jun 2020 14:04:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chris@chrisdown.name>) id 1jlYgJ-0004ot-JL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 14:04:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=czz/LMTUSEyCUOCBc2bpVTh7IggBB8ARvYVKv0fzm0w=; b=Mw6RH0Mz/J/gd9diBbhjMBxaE1
 Q3cf8QgcKmKv8QttGo6k1A8eFMbHiJqs7fVoPTpBzfnBmKuzRYZVvfH2Um/62HK3xT8D++Vb3A1w2
 G1C9pRFyyxCoTcTq8kBZ39+G2K8Wu0o74VbfBx4RL9ZAiCZYc5MB5etdea7iFVayohMM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=czz/LMTUSEyCUOCBc2bpVTh7IggBB8ARvYVKv0fzm0w=; b=TYUF6jARiXYVtgytbuuntE3/fw
 yim+HB4EDfiPCvMOR/PceB5+hkqrK2CIje++lYtsIz/PA622l62/wwKldOO4CBVAViaF1cFqLL4Gy
 DVvJvPRTBaTqRFxxDKAVWUdXgk2WalplDAnMJuhN57u6ueXlY6rWDcq5mUg29VaCTiMo=;
Received: from mail-ed1-f68.google.com ([209.85.208.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jlYgC-009RJ3-47
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 14:04:47 +0000
Received: by mail-ed1-f68.google.com with SMTP id c35so2036406edf.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Jun 2020 07:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chrisdown.name; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=czz/LMTUSEyCUOCBc2bpVTh7IggBB8ARvYVKv0fzm0w=;
 b=oHJZsmwDgazVpFYFy9f1b0DXnvsC0m5vxNXELt2qWUG2KfVfS0Fn9Az8Mm4tsT5Yun
 T0BN8K2g46PCiRW5Vtd3CYq9U6e5qZuldGsqUGrQVKibeXmeDBk6U6AB2EVkl4AOMQoQ
 bb1tNkHgfcvlaxd0Rj1tDcDG32lDe0/EQGnL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=czz/LMTUSEyCUOCBc2bpVTh7IggBB8ARvYVKv0fzm0w=;
 b=mMkmIgYa2dMGvuG2BN7BGOMbGidQ8voIQZdFgiK2PaENyyHcsKr9y059d+yYd0pUuA
 dfet4s237f/btMaY/Wnl6/ypHzTdHAm5wqxmuWhNLPye3dXMfgdK5w6EHVbfJ8n1FJb6
 PslnsdWWxx9txMYZFr+1l0tdZ6CvqLRFRHVa4Agu1piX6LIDtRz3NEPms8RR49qfYnvx
 xKHbNoIqs9gs4/ntrEKDBPfNDzR1FJRb57xRreXyWvXfOgMFMe/5ztE/vB1Vng5eXvrB
 TMpca97cJ+CkS1kA6DaRIAoAsCVU7ajfaaF86YpdLAwGbM4ls2fUrbR73OjJd3pg9e77
 Ch8Q==
X-Gm-Message-State: AOAM530cJaDfUAnzO0V5QKFlGUaaF4R5Jit7LZrliLmbsCCQ2kIjbp1w
 YdH6qJ/pQkWj0Py4UMeoKNM/h9TlA7VDpADA
X-Google-Smtp-Source: ABdhPJxEWNxFxNxnJ3uLML+OdoNnGyXOqpBVbo7UMqTkjK8aBRi7UkKmaFuOunrzbNW+H9nqkV6M+Q==
X-Received: by 2002:a5d:4286:: with SMTP id k6mr8336535wrq.140.1592402279710; 
 Wed, 17 Jun 2020 06:57:59 -0700 (PDT)
Received: from localhost ([2a01:4b00:8432:8a00:63de:dd93:20be:f460])
 by smtp.gmail.com with ESMTPSA id 67sm35206526wrk.49.2020.06.17.06.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 06:57:58 -0700 (PDT)
Date: Wed, 17 Jun 2020 14:57:58 +0100
From: Chris Down <chris@chrisdown.name>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200617135758.GA548179@chrisdown.name>
References: <CA+G9fYsiZ81pmawUY62K30B6ue+RXYod854RS91R2+F8ZO7Xvw@mail.gmail.com>
 <20200519075213.GF32497@dhcp22.suse.cz>
 <CAK8P3a2T_j-Ynvhsqe_FCqS2-ZdLbo0oMbHhHChzMbryE0izAQ@mail.gmail.com>
 <20200519084535.GG32497@dhcp22.suse.cz>
 <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
 <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
 <20200520190906.GA558281@chrisdown.name>
 <20200521095515.GK6462@dhcp22.suse.cz>
 <20200521163450.GV6462@dhcp22.suse.cz>
 <CA+G9fYsdsgRmwLtSKJSzB1eWcUQ1z-_aaU+BNcQpker34XT6_w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYsdsgRmwLtSKJSzB1eWcUQ1z-_aaU+BNcQpker34XT6_w@mail.gmail.com>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.68 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jlYgC-009RJ3-47
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Naresh Kamboju writes:
>mkfs -t ext4 /dev/disk/by-id/ata-TOSHIBA_MG04ACA100N_Y8RQK14KF6XF
>mke2fs 1.43.8 (1-Jan-2018)
>Creating filesystem with 244190646 4k blocks and 61054976 inodes
>Filesystem UUID: 7c380766-0ed8-41ba-a0de-3c08e78f1891
>Superblock backups stored on blocks:
>32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
>4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968,
>102400000, 214990848
>Allocating group tables:    0/7453 done
>Writing inode tables:    0/7453 done
>Creating journal (262144 blocks): [   51.544525] under min:0 emin:0
>[   51.845304] under min:0 emin:0
>[   51.848738] under min:0 emin:0
>[   51.858147] under min:0 emin:0
>[   51.861333] under min:0 emin:0
>[   51.862034] under min:0 emin:0
>[   51.862442] under min:0 emin:0
>[   51.862763] under min:0 emin:0

Thanks, this helps a lot. Somehow we're entering mem_cgroup_below_min even when 
min/emin is 0 (which should indeed be the case if you haven't set them in the 
hierarchy).

My guess is that page_counter_read(&memcg->memory) is 0, which means 
mem_cgroup_below_min will return 1.

However, I don't know for sure why that should then result in the OOM killer 
coming along. My guess is that since this memcg has 0 pages to scan anyway, we 
enter premature OOM under some conditions. I don't know why we wouldn't have 
hit that with the old version of mem_cgroup_protected that returned 
MEMCG_PROT_* members, though.

Can you please try the patch with the `>=` checks in mem_cgroup_below_min and 
mem_cgroup_below_low changed to `>`? If that fixes it, then that gives a strong 
hint about what's going on here.

Thanks for your help!


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
