Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 761B11E6551
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2020 17:03:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jeK41-00064X-UT; Thu, 28 May 2020 15:03:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mstsxfx@gmail.com>) id 1jeK40-00064Q-Uu
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 15:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=evz1lutsdd2Eqt9o4+KgC57g/gR26qB8cQ2KV6NODWs=; b=UA3mngKSUhi/+OvcDIa5HuVxop
 +2LHVnu/kMcPN/PcgxGFXZ2aduEtrYbZKBn50zLSm6oQS8nfwSquP5voWlSNQIhUtxronyQQCunEI
 sohu+i8uw+PHEZrH8LlnhK7YSSZWvw5fThkGFs0nT3IJciyA2JqBrXpq3fLBcO+9Eu2Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=evz1lutsdd2Eqt9o4+KgC57g/gR26qB8cQ2KV6NODWs=; b=lqWDe8ANXoilvNnOSu+WVSCI6e
 DEf5zvjOEAqv2Gp37cmPtg+46H+37RmpPOEwd9FctNIIGYFxeA8QwSEijcKNz+JiP16SS43SDSwbA
 pUhoY4ra210xkQRrS0puQ/YBQ7Yll9zCMCxC45ZkNFWiEUyYj1aavKuhzHVh+90d/z6Q=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jeK3z-001cnH-DE
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 15:03:20 +0000
Received: by mail-wm1-f68.google.com with SMTP id d128so2413627wmc.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 May 2020 08:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=evz1lutsdd2Eqt9o4+KgC57g/gR26qB8cQ2KV6NODWs=;
 b=Ij3+4PcnV+6d1PN/a47xhQXJDtpkVCqQ9/dYY3URJTe9KpJyIO2xpDUpQSgF4CYW9B
 hVk+52gK7SyWrDk0dYVrHZ6JaaQE07c+zBXEtOT4e4itmTLgsLXjGMUbS9clDUQGtIV1
 FApof/7gYQV61KsF80x4X9lFfk2V5cyWBamkZVd/V/f9s/gr4l2Bu4OsASR5P/H6zyF3
 DXlEZROVcwIw3V/OeQ19/Rjs9GwvMfxUOvvCHDg5hSrJ0AM25I4b6EljVlKNEX+TwVN7
 ehUJe3U4DR5VKRrNRL7GLj7+qJGgFKc06RIVfA/87DJBG/IuofIjCPhpf0ezyuBHzCOf
 Jcvw==
X-Gm-Message-State: AOAM533Lr+u7TNiVSwUDA45TmM1XgqZCrnPdQf9QjhsYCSzPC9uo3g6b
 alYw9r0h8EhHSFsi31IiQPw=
X-Google-Smtp-Source: ABdhPJzniI6Aw1b/FqGaEPNB/a6M/vRt8hKQ5Zx5UYlLdgljMoGjhh+KSxCloB6yCJzH8NHlfHrceg==
X-Received: by 2002:a1c:b0c8:: with SMTP id z191mr3947280wme.165.1590678193035; 
 Thu, 28 May 2020 08:03:13 -0700 (PDT)
Received: from localhost (ip-37-188-185-40.eurotel.cz. [37.188.185.40])
 by smtp.gmail.com with ESMTPSA id k14sm6163539wrq.97.2020.05.28.08.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 08:03:11 -0700 (PDT)
Date: Thu, 28 May 2020 17:03:10 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200528150310.GG27484@dhcp22.suse.cz>
References: <20200519075213.GF32497@dhcp22.suse.cz>
 <CAK8P3a2T_j-Ynvhsqe_FCqS2-ZdLbo0oMbHhHChzMbryE0izAQ@mail.gmail.com>
 <20200519084535.GG32497@dhcp22.suse.cz>
 <CA+G9fYvzLm7n1BE7AJXd8_49fOgPgWWTiQ7sXkVre_zoERjQKg@mail.gmail.com>
 <CA+G9fYsXnwyGetj-vztAKPt8=jXrkY8QWe74u5EEA3XPW7aikQ@mail.gmail.com>
 <20200520190906.GA558281@chrisdown.name>
 <20200521095515.GK6462@dhcp22.suse.cz>
 <20200521163450.GV6462@dhcp22.suse.cz>
 <CA+G9fYuDWGZx50UpD+WcsDeHX9vi3hpksvBAWbMgRZadb0Pkww@mail.gmail.com>
 <CA+G9fYs2jg-j_5fdb0OW0G-JzDjN7b8d9qnX7uuk9p4c7mVSig@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYs2jg-j_5fdb0OW0G-JzDjN7b8d9qnX7uuk9p4c7mVSig@mail.gmail.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (mstsxfx[at]gmail.com)
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jeK3z-001cnH-DE
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

On Fri 22-05-20 02:23:09, Naresh Kamboju wrote:
> My apology !
> As per the test results history this problem started happening from
> Bad : next-20200430 (still reproducible on next-20200519)
> Good : next-20200429
> 
> The git tree / tag used for testing is from linux next-20200430 tag and reverted
> following three patches and oom-killer problem fixed.
> 
> Revert "mm, memcg: avoid stale protection values when cgroup is above
> protection"
> Revert "mm, memcg: decouple e{low,min} state mutations from protectinn checks"
> Revert "mm-memcg-decouple-elowmin-state-mutations-from-protection-checks-fix"

The discussion has fragmented and I got lost TBH.
In http://lkml.kernel.org/r/CA+G9fYuDWGZx50UpD+WcsDeHX9vi3hpksvBAWbMgRZadb0Pkww@mail.gmail.com
you have said that none of the added tracing output has triggered. Does
this still hold? Because I still have a hard time to understand how
those three patches could have the observed effects.
-- 
Michal Hocko
SUSE Labs


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
