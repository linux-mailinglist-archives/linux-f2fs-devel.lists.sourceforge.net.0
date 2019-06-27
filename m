Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D10F57F07
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jun 2019 11:12:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hgQSC-0001vt-4L; Thu, 27 Jun 2019 09:12:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hgQSA-0001va-4P
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jun 2019 09:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qKIBl751AXqODXd7GAEvTiqsTGcSW0dxpnjr57435q0=; b=VfJt1/F7K56QdyfObGHrKmrg2P
 Syrsl4qXMF3lGB4IErl9GrBaPjtDW4SRxjJ7tUPRCjuZe/4wzupN1Zcn8azFKAzm022qVldlgUyfn
 am11rYr1pK1ROuf4J4A5MoLNqgzKSu9O3leZReX4mM4UmC5zShnGJOhYe+Z6VHJ5X4XY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qKIBl751AXqODXd7GAEvTiqsTGcSW0dxpnjr57435q0=; b=NcBGoKVG6zwXTBORD9kqyG7liE
 LE2RLg5gyB6oIUcd6BIXV2xt5a02LcpVX2mCZQd7YA5M0KfcKG0xQR6DlnO30bUOo+EnwlFO5km+M
 n37mYmv11tH+scShs72N+lEpGDAYuweuqXj1QiDdM7JFTSqXJQtBASynGe4fh619W/YQ=;
Received: from mail-ua1-f65.google.com ([209.85.222.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hgQSL-00D9f6-UD
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jun 2019 09:12:39 +0000
Received: by mail-ua1-f65.google.com with SMTP id a97so563544uaa.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Jun 2019 02:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qKIBl751AXqODXd7GAEvTiqsTGcSW0dxpnjr57435q0=;
 b=H7dMUp+fqyujXhus2SVHsQTcSsTnEYVJZnMyBKqAIYl+WaL6BoFjdgTSNiVpPHFhw+
 GqjERzwPtj5TM3eOvcTJqUGjCuDlXXlFA7GDtLvAC6Xok/OBQa3v6E0pY5BEMC8q6s/u
 mKVFmCZrRK9GpgruDfjCu/MWPSTXr1jvarJZETCWQlbcD+90JSHkkByT6aBRtnklBbpg
 g81E69n+eT4010s0bRLqGOiJd0tqntuFK0jfiictta66ViTqbULS/4rJDQt9UgnvSt+h
 hputUYJRnX8NmBdi9tU01Ft4FlxB4G0/sQzmsbXuLkEUXHqOpBaYbMVf+GAcV8dZZ7BD
 XMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qKIBl751AXqODXd7GAEvTiqsTGcSW0dxpnjr57435q0=;
 b=gPLRb7hwJeHdXoenJVk5zycP6748MlOlZUZGXTCRh+3QBZeQKlczU+EWnm2vlZm4jX
 6QcGU/zGTgY8S7vlH6unkw/+XzQpY2cSNXYIf43YEAR6pVgm8jTxisgTlph+hMK7Z3qQ
 GpZgCYn6H2ud63H/o9CiK2mY6dzSoebh/vrHRMiW2WzV3K765lxSrIoRRdqAk9p6k5ME
 EJ943BkHI/fLqcNuCXot86zRyeTcvP3sPeD8JZdjeut/x/EMxs6BBJ3jg1VlkJg4iljd
 D194/SI0O6FDZi3/sNb022oaiEAys+wS2kTGgXAyelGacje7Sd+X5nMIRv/hl6x+ttlz
 tFsw==
X-Gm-Message-State: APjAAAXZ7+bd6p59lMHHfxIct9LmLZ+ieCZOu82cMKg8t15iTbdfgl5a
 wE+G6EcoS0cEH3IWP4i7exELt21bcrUD2SozJ+Y=
X-Google-Smtp-Source: APXvYqxZQoV0cIqpRNPiSFF/nynb1pFUAZ4DDGYUDIpM0XZe0KqctihYkh/h9TQ13jKXN2B+2hbVyAQlDBYDzUc5XMU=
X-Received: by 2002:ab0:72d7:: with SMTP id g23mr1615582uap.75.1561626751823; 
 Thu, 27 Jun 2019 02:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAD14+f2ckNUv9n-Zb9UL_ojX8=24tYBhT-SsrcpVNogqee2tkA@mail.gmail.com>
 <6bcbb5e8-55ad-49c1-bb77-f7f677ceb526@huawei.com>
 <CAD14+f3NHosrL=5UOBSMbFxQ91x-AuWOj_w=JYkJSnmfDgTkvA@mail.gmail.com>
 <CAD14+f0ZTmmLBXtmHF_Kz23JLSJy+UzpNxwSMV4rvSCse3y7EA@mail.gmail.com>
 <7e1bfa07-5ee8-a276-fe6a-6d79bd9270c3@huawei.com>
 <CAD14+f1+puy4M6rL_SbGt9vej=7LgK+qEjq71_878=oqSvjJ2Q@mail.gmail.com>
 <0f89b0b6-5cc5-6618-72e5-8a2f81947161@kernel.org>
 <CAD14+f1xgYKAnzqLb-ZpzbeskZegGHXbrJ+vEHZe19_Jp3pBTQ@mail.gmail.com>
 <e3303318-758e-b263-f6ed-d55e98bdea78@kernel.org>
 <CAD14+f2XWeWvYXTjKbReJa7uZROvnp_-V419sBkpmWFp5L5BtA@mail.gmail.com>
 <20190603202719.GC34729@jaegeuk-macbookpro.roam.corp.google.com>
 <249aff47-cb24-291b-37f7-6ed2d854a207@huawei.com>
In-Reply-To: <249aff47-cb24-291b-37f7-6ed2d854a207@huawei.com>
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Thu, 27 Jun 2019 18:12:20 +0900
Message-ID: <CAD14+f13+fKvo+-vOwu79O-mSwKS7r0g=gbVL65qv+MXPc+gZg@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.65 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hgQSL-00D9f6-UD
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs-tools: relocate chksum_offset
 for large_nat_bitmap feature
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk and Chao.

A little bump here.

We still need to tag a new version of fsck and update f2fs kernel code
to tell which version users should use as we discussed earlier.
-rc is closing soon, so I felt I needed to remind you.

Thanks.

On Tue, Jun 4, 2019 at 10:48 AM Chao Yu <yuchao0@huawei.com> wrote:
>
> On 2019/6/4 4:27, Jaegeuk Kim wrote:
> > On 06/04, Ju Hyung Park wrote:
> >> Hi Jaegeuk and Chao,
> >>
> >> A little update I thought I might share.
> >>
> >> Just went through migrating my laptop to another SSD and I've setup
> >> f2fs from the beginning with mkfs -i from the master branch.
> >> No issue as of yet and the kernel is working fine as expected :)
> >
> > Cool, thanks for your test. :)
>
> Great, thanks for the continuous test and report. :)
>
> Thanks,
>
> >
> >>
> >> Thanks.
> >>
> >>
> >> _______________________________________________
> >> Linux-f2fs-devel mailing list
> >> Linux-f2fs-devel@lists.sourceforge.net
> >> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> >
> >
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > .
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
