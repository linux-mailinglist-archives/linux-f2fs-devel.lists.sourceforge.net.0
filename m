Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AA51FF5FE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 17:00:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlw1t-000167-RG; Thu, 18 Jun 2020 15:00:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <laoar.shao@gmail.com>) id 1jlw1r-00015y-WF
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 15:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NtwtfirPIaj3hQKqt5NnTqLzfoXadlYH6xaXhH3mB+s=; b=k+cpJOUr42LfXl6cxPmL4rQXY7
 eUU1yLHhghmEciqiY+wRSTQC9B41L6QTR0Ns9OY6ZUhjJ1O3rCpQkj9onOvfoy/xksomA/o6nj/VR
 WsbPg/Njuht46YTSxDMFtS+WLZIWmocsRzyLmWyPVDiigxPfTvbZQ5FPI2MGfUQ0tQhQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NtwtfirPIaj3hQKqt5NnTqLzfoXadlYH6xaXhH3mB+s=; b=RxXNlEXq0/04R6Xsd3g/K+FaCt
 ZYQIasej4aCz+bstWpsDRxHS3ekGWPNbKO/3OeMQOgzbrQ41f53C1wRc2dLbTXo6luk0wyY9HIWdN
 uFQmZEOHJINs0+losnJ4f9U/oTLqXdLydzVxp9+66CerJ/UT3/SU0x0K8a6gMjRiQrWQ=;
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jlw1c-008bc5-0j
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 15:00:35 +0000
Received: by mail-io1-f67.google.com with SMTP id x189so7346170iof.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 Jun 2020 08:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NtwtfirPIaj3hQKqt5NnTqLzfoXadlYH6xaXhH3mB+s=;
 b=kYwPKZdp0pHLg9nzSkXLUjXIWhhGSDK+lUsX3kvZKhpx/abFTtNYjkojW4sVVt7bHm
 qZGTxARuFd3WI6EfU1eBN6+4gj/yCc7G3VU2n21gea6aS3fkUz/uMmbZ6zjhs6dF/ctG
 mtQLDzrh6EKtHb9OSOEmMjo3N7fWi8hwmYyXXXcwlEWheXzJEY46FsRDyYJ/YXapbZEL
 GAjWeoKd6sh4vm2KkDp99cfVll6l6Xz1jcMVSif5RsT91SxuUdRKKCZShkXiMxJfDPO2
 mEQ03gbiIGbBmN1vxaEfCsHPJle351uahP3BtuY+Amj/uplhgSOrlPpU1WHGNLMkS4iC
 lVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NtwtfirPIaj3hQKqt5NnTqLzfoXadlYH6xaXhH3mB+s=;
 b=fIhf9OunC5dGO6tRiXkDFtrwOz8oIIc1pFyccFg7SpsrAjqphOKMw8+frnANOXPDVF
 hMAEA5iXEbCh11Kykf1x+cmUbhO/tq/uAPYS05gNO8PloFN6nq33eOuUgWt6uUV63+1Y
 X3C3NPK6usCDToe7QfZ/XW+kpbZEhSiMgFN0xEMU5HUreXX2lDfajZRLWa6G4BsWepVJ
 JbypFRmw++j98jr4txnVAq5sKRVTkZRsEop5YKWnbM9BlLvoeoKI9Jej0vxR3boGviMG
 R+P8hXOUx3DYqJ3YjeizHZ8YQXw8FVIj0GHk/Ce4FFqO78ebGlKt2jqBCgvIb+Rso/jI
 RWeA==
X-Gm-Message-State: AOAM531jVMxDjyUwm3BVuZ+cY2chZbra9EI2H69R90nW3Fhk6NlyX0Xl
 vwN34GmFvKnHNvONjYygjKgT6Yril9PdlgflAOtjoZVQq/GmvSEG
X-Google-Smtp-Source: ABdhPJyxduBF4FPnbsePTb+IJMrnaO574t87lgH7MXGDrxKnm7Fm0uPL20a9JpNnhO5AEW9mefqTwucGCC8avIECgKo=
X-Received: by 2002:a05:6602:2dd4:: with SMTP id
 l20mr5412675iow.13.1592492407237; 
 Thu, 18 Jun 2020 08:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200521095515.GK6462@dhcp22.suse.cz>
 <20200521163450.GV6462@dhcp22.suse.cz>
 <CA+G9fYsdsgRmwLtSKJSzB1eWcUQ1z-_aaU+BNcQpker34XT6_w@mail.gmail.com>
 <20200617135758.GA548179@chrisdown.name>
 <20200617141155.GQ9499@dhcp22.suse.cz>
 <CA+G9fYu+FB1PE0AMmE-9MrHpayE9kChwTyc3zfM6V83uQ0zcQA@mail.gmail.com>
 <20200617160624.GS9499@dhcp22.suse.cz>
 <CA+G9fYtCXrVGVtRTwxiqgfFNDDf_H4aNH=VpWLhsV4n_mCTLGg@mail.gmail.com>
 <20200617210935.GA578452@chrisdown.name>
 <CALOAHbBp7Ytd-Hta9NH-_HJtVTAsR5Pw2RYrVScp7PPezCEv2w@mail.gmail.com>
 <20200618123743.GA694719@chrisdown.name>
In-Reply-To: <20200618123743.GA694719@chrisdown.name>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 18 Jun 2020 22:59:28 +0800
Message-ID: <CALOAHbCPd407z45e809VE5c8vP6ewqwkDkY9nrMP5TyP5cjG+A@mail.gmail.com>
To: Chris Down <chris@chrisdown.name>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (laoar.shao[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.67 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chrisdown.name]
 0.0 DKIM_ADSP_CUSTOM_MED   No valid author signature, adsp_override is
 CUSTOM_MED
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1jlw1c-008bc5-0j
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
 linux-mm <linux-mm@kvack.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
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

On Thu, Jun 18, 2020 at 8:37 PM Chris Down <chris@chrisdown.name> wrote:
>
> Yafang Shao writes:
> >On Thu, Jun 18, 2020 at 5:09 AM Chris Down <chris@chrisdown.name> wrote:
> >>
> >> Naresh Kamboju writes:
> >> >After this patch applied the reported issue got fixed.
> >>
> >> Great! Thank you Naresh and Michal for helping to get to the bottom of this :-)
> >>
> >> I'll send out a new version tomorrow with the fixes applied and both of you
> >> credited in the changelog for the detection and fix.
> >
> >As we have already found that the usage around memory.{emin, elow} has
> >many limitations, I think memory.{emin, elow} should be used for
> >memcg-tree internally only, that means they can only be used to
> >calculate the protection of a memcg in a specified memcg-tree but
> >should not be exposed to other MM parts.
>
> I agree that the current semantics are mentally taxing and we should generally
> avoid exposing the implementation details outside of memcg where possible. Do
> you have a suggested rework? :-)

Keeping the mem_cgroup_protected() as-is is my suggestion. Anyway I
think it is bad to put memory.{emin, elow} here and there.
If we don't have any better idea by now, just putting all the
references of memory.{emin, elow}  into one
wrapper(mem_cgroup_protected()) is the reasonable solution.

-- 
Thanks
Yafang


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
