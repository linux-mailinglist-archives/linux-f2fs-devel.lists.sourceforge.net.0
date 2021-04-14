Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F65B35FB17
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Apr 2021 20:54:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lWkeW-0007SI-7f; Wed, 14 Apr 2021 18:54:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1lWkeU-0007S8-FN; Wed, 14 Apr 2021 18:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=flmIDluCNeh75YeiVOPif0ZTE+n5s/nCyOwAZlpQU7o=; b=H+6Wq1eDQZBzgYnCGOT/3hF9Fk
 NbFYY/kRTgu8lTVv/8sPdFVGVT4N0r4cKFoB6Y/caVY0caUB15X429awPouUkBJ69vfFay6fWY3T2
 czz5+4poSbdnKfG1I2PRjW8J+pucBOvTL1Nx6rftXHMggsIROhq23T/LA/9nR4gn17kQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=flmIDluCNeh75YeiVOPif0ZTE+n5s/nCyOwAZlpQU7o=; b=X0thpp2Mb9hvTpRPYUUPfc4+k7
 SsC6+Bn1694eJhc9hBFXYlq63xaJRMTvjiYQ7OrKjIJlKHmloBw2Bi/G04BpY48cy82AkyD1SUo7e
 Ur+Q8mSfs11YAmxocf2JbYP8r/3g1DSxdzUMwPpxbSfq8XfytzfbI1srNE3vR+TFEw6Q=;
Received: from mail-yb1-f174.google.com ([209.85.219.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lWkeN-004xtB-SI; Wed, 14 Apr 2021 18:54:14 +0000
Received: by mail-yb1-f174.google.com with SMTP id v3so20947177ybi.1;
 Wed, 14 Apr 2021 11:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=flmIDluCNeh75YeiVOPif0ZTE+n5s/nCyOwAZlpQU7o=;
 b=kekdDeOjmHaMG2fuZJyLFX5hme1rCH1Tdsme1LNpWtdEAw2Pgtl48jeDVEDfhr75st
 SCl9q0WjhPR+SDZfbO/tCseQn9B384gU1QGqu7hJgmDi3wyzdAdTu61oolRZ1ul7IkMq
 EbKZpP6wE9m9YWFO0XW8L6i7S5vA0KmX7MlCeswOoWHhvb0YGKdruCdo0QAsqyxnfDBK
 qGbkTib8gzxtXVvgYVPbkpGzhLJsV1Gsq5BI1wLZN9Sbx20AbBn+mNkanZip6rBPA6+H
 aN/w0f/DCnVpuTwtoBcvAdyMp6BDkoeSQDGDuioOXGVlSDQsJsycqP9psTE1sdhqLY4G
 9iHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=flmIDluCNeh75YeiVOPif0ZTE+n5s/nCyOwAZlpQU7o=;
 b=MEPCYfvTF7ID1/NsfG0d6OmpSMqeQH1ciBf/P1FJiXjvWa1/R5k3l+H4p0YTA7CKwc
 95l3jZH3hy5crm7gM/NY1cDmSsXVK2H0YzQM55AQ0emzZ22UN4TaUAGsOxzwQMa+3cam
 7ERTWmFPu12RuGz8au3uRemSlAtkEt86KHc/y2PpKaxLOHEoJHPKm38Z0J880dwrB9ei
 caWiYfo38mjV8rA3WH7PqP7vnklSQA18zheXtmNgWpnOwkxaigRG3Gd6lAUWYmB+f3w5
 5D6bWUfKhODnd2vWsgYMcmHd1Zc4vqepAz6wJL6vTFpngDO8kMKRPXgSrC4dAIfRcfNa
 uJjQ==
X-Gm-Message-State: AOAM533Q+EOrQMJRXPDq75wdzbG3J0iYGwgdT6rt9irIWm0VNKLoQsUN
 dq7ic+PzoIXiB2H8X33tfYB2Vu9s1PJQoU8U+ic=
X-Google-Smtp-Source: ABdhPJyrW3O8NO3th8zugZp2JKtf2V5GrYLoUcTLB9FXu+ENrG2LNJFpEF3qEdvn+wO3N1wM0QysC8QWV4luIxIw/Hk=
X-Received: by 2002:a25:becf:: with SMTP id k15mr41711527ybm.83.1618426442030; 
 Wed, 14 Apr 2021 11:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210330225112.496213-1-nickrterrell@gmail.com>
 <CANr2DbfL2B5Tx+k1AwVh-5dQZ+fNpucJKu9QVQat7QVvK-5AbQ@mail.gmail.com>
 <CANr2DbfZ+fV+GN7CfDi1AFmfsdnX+kGnTA6kayEchtGwfoAE-A@mail.gmail.com>
 <YHc16rz4Y/PkzNH1@gmail.com>
In-Reply-To: <YHc16rz4Y/PkzNH1@gmail.com>
From: Nick Terrell <nickrterrell@gmail.com>
Date: Wed, 14 Apr 2021 11:53:51 -0700
Message-ID: <CANr2Dbc+2rS7seuXGtU6Y+x0Qv+hrtwz71r+akKeQUXECZaJZA@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.174 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nickrterrell[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.174 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lWkeN-004xtB-SI
Subject: Re: [f2fs-dev] [GIT PULL][PATCH v9 0/3] Update to zstd-1.4.10
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
Cc: squashfs-devel@lists.sourceforge.net,
 Herbert Xu <herbert@gondor.apana.org.au>, Yann Collet <cyan@fb.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Petr Malat <oss@malat.biz>, David Sterba <dsterba@suse.cz>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Chris Mason <clm@fb.com>, Nick Terrell <terrelln@fb.com>,
 linux-crypto@vger.kernel.org, Oleksandr Natalenko <oleksandr@natalenko.name>,
 Kernel Team <Kernel-team@fb.com>, linux-f2fs-devel@lists.sourceforge.net,
 Niket Agarwal <niketa@fb.com>, linux-btrfs@vger.kernel.org,
 Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 14, 2021 at 11:35 AM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Wed, Apr 14, 2021 at 11:01:29AM -0700, Nick Terrell wrote:
> > Hi all,
> >
> > I would really like to make some progress on this and get it merged.
> > This patchset offsers:
> > * 15-30% better decompression speed
> > * 3 years of zstd bug fixes and code improvements
> > * Allows us to import zstd directly from upstream so we don't fall 3
> > years out of date again
> >
> > Thanks,
> > Nick
> >
>
> I think it would help get it merged if someone actually volunteered to maintain
> it.  As-is there is no entry in MAINTAINERS for this code.

I was discussing with Chris Mason about volunteering to maintain the
code myself.
We wanted to wait until this series got merged before going that
route, because there
was already a lot of comments about it, and I didn't want to appear to
be trying to bypass
any review or criticisms. But, please let me know what you think.

Best,
Nick

> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
