Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E931DD8E9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2020 22:53:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jbsCD-0001Pa-FO; Thu, 21 May 2020 20:53:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <naresh.kamboju@linaro.org>) id 1jbsCC-0001PM-2t
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 20:53:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+fLCJ2GM93cwoKTZdZ4WFD0IYvwQ9ZS8NpXP6kyN8Oc=; b=GeiOsSU5/h8zShfuL44NsJ00ji
 yZSW1Q4PCQ1sQheQx/qeRI6h7iUgctVZHQj3tWnLmZ/70YUSaby5iVFoNrhUPRxY/WK3K2vWGPZGC
 2sq0NUf3rKYGUyFDu4h6mASJ+DuwXGb/kxFHj2LwcnTmX15KaVXFfJ9hFdyFFyOM7QEc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+fLCJ2GM93cwoKTZdZ4WFD0IYvwQ9ZS8NpXP6kyN8Oc=; b=dY5nAv3LojH5FAvVnTooXq8owG
 amwuyQaBn9vkhEBeGSdCUNtXvExzjdAlFFd2A4ICB8zWvDOarnQjt0uR/nuhXhdVTjivDZzS02u5B
 t/yYi3pXdmAw8JbEEaXjDcgNZGDTd9wVjY8+GZXFCbQDkkijQtSfWCeJj1FCvrzIq5Q4=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbsC7-001KI7-GV
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 May 2020 20:53:40 +0000
Received: by mail-lj1-f194.google.com with SMTP id l15so9644561lje.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 May 2020 13:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+fLCJ2GM93cwoKTZdZ4WFD0IYvwQ9ZS8NpXP6kyN8Oc=;
 b=TBv65LdWvJKhGaaNuo9NEb78jnL9BrQAOtPhzoDfCosM1uH7i74IqGHCHmYGaJPdHz
 CWCviqP1kSYaAcJp76r0NmD2UjTYe3MeXRUjZ7Gfj0csgNWpJcH5xbzTOLaFtf8uT5+3
 /uM6hI+J/Gq/ki4ylpSu3zLN9n1wTEPzv14fLIVPyhMmtfoFCL62Kx4yZeWDBbv/l5w1
 K39JR/uyz8X+Y20+CXNOcXbl3HbDDa7fsDpPrOTRV9Q5SbBB3Jb/BXIJzdJ9gGDiZkj+
 XTUH4ek9bRuZIljRPeGI/rG4e1ojQtcnYVTE/xIktlVknSWMIJfaLJsufV1okj576bpp
 EBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+fLCJ2GM93cwoKTZdZ4WFD0IYvwQ9ZS8NpXP6kyN8Oc=;
 b=thhE+t4wpNlkqwR52abGPMXoOXL7ii/ntFjHoBzvAbNELsE/lq0TN3gTCXe4O3E/bP
 TYbihvVhS29iKEdpNOokSFQQ8j4pVoIZ+YYAdLLfP8pkHRt04atJTxhhF7theVxtBGmt
 uVUNZj60nmckiiY1iakKZefPUdgynXmaox7h0QiAkxRDMtMqXV76TJ2uNmXJSZAsLH83
 f7FHU8a/BaLJpC/8V8x7+UgO3bDgIYVILh7yz1PheWo9CsQMjgCVVUtamY7JDV3bi++m
 FAOVd89YyCo9LmFhbrIG9EayLZNnM/H/bm1EPjijEXVc/tqWLGZ0mAB7//LS+mnkKMRg
 /Ghg==
X-Gm-Message-State: AOAM531MwXvG8IWyNtx07H120psUkFRQe0MbB6CMPHdAiqSWFqp5kp00
 nDgCBsLDps65Y+wVMZZn8dgOLRbNrpB5GUsQBgHgHg==
X-Google-Smtp-Source: ABdhPJyTC3xGMKlc4QlHWxkqxT2nu3F9ZLF51sSqylyADWoJHXSTsMzu0bqdTCQsW0drulE/TbXWWznw77y8lomSnQ4=
X-Received: by 2002:a2e:9684:: with SMTP id q4mr3903462lji.431.1590094401526; 
 Thu, 21 May 2020 13:53:21 -0700 (PDT)
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
 <20200521095515.GK6462@dhcp22.suse.cz>
 <20200521163450.GV6462@dhcp22.suse.cz>
 <CA+G9fYuDWGZx50UpD+WcsDeHX9vi3hpksvBAWbMgRZadb0Pkww@mail.gmail.com>
In-Reply-To: <CA+G9fYuDWGZx50UpD+WcsDeHX9vi3hpksvBAWbMgRZadb0Pkww@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 22 May 2020 02:23:09 +0530
Message-ID: <CA+G9fYs2jg-j_5fdb0OW0G-JzDjN7b8d9qnX7uuk9p4c7mVSig@mail.gmail.com>
To: Yafang Shao <laoar.shao@gmail.com>, Michal Hocko <mhocko@kernel.org>, 
 Chris Down <chris@chrisdown.name>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jbsC7-001KI7-GV
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Cgroups <cgroups@vger.kernel.org>, Hugh Dickins <hughd@google.com>,
 open list <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>,
 "Linux F2FS DEV, Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-block <linux-block@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Theodore Ts'o <tytso@mit.edu>,
 lkft-triage@lists.linaro.org, Johannes Weiner <hannes@cmpxchg.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

My apology !
As per the test results history this problem started happening from
Bad : next-20200430 (still reproducible on next-20200519)
Good : next-20200429

The git tree / tag used for testing is from linux next-20200430 tag and reverted
following three patches and oom-killer problem fixed.

Revert "mm, memcg: avoid stale protection values when cgroup is above
protection"
Revert "mm, memcg: decouple e{low,min} state mutations from protectinn checks"
Revert "mm-memcg-decouple-elowmin-state-mutations-from-protection-checks-fix"

Ref tree:
https://github.com/roxell/linux/commits/my-next-20200430

Build images:
https://builds.tuxbuild.com/whyTLI1O8s5HiILwpLTLtg/

Test log:
https://lkft.validation.linaro.org/scheduler/job/1444321#L1164

- Naresh


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
