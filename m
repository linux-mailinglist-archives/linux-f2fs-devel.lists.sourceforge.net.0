Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEA08CF43
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2019 11:22:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hxpUL-0003l5-PE; Wed, 14 Aug 2019 09:22:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hxpUK-0003kw-78
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 09:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SAr1vcmf8/odyrGaz5y9j+yYPNLhagxFitwrgIM924E=; b=A9CgjURpk6U1D1Jd/7/ZNIz0MS
 fvo7YA2hhRsNSppfUFc5K4cXbJRgFb+kj2i5mL4MmhYZxAWSYl7hNvkPN7EnZrpQozeHDofR1aM33
 3v0N9iivb7+oLU7u/gMGRp8+kkvCJGzNAue9ANissDe4XoRb4iUrS1p2aLkSlc3W+Bio=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SAr1vcmf8/odyrGaz5y9j+yYPNLhagxFitwrgIM924E=; b=amH4RaQM8wlcyXy5YH1sGVEYDR
 wjXe326freh1SgovncN2327KhjJi3S9UKNEaNS8ohIq+3Dov+eoiA7LTmip3Y1/iu73Chr+qAjAxY
 8GeaI7SGGNfxlKjuCGbJONC2p4uo+Bw/ury5pKCsWNI5rJVbN5qJ3ayw6rLhZM/ZVX8E=;
Received: from mail-ua1-f65.google.com ([209.85.222.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hxpUI-003KLg-VZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 09:22:36 +0000
Received: by mail-ua1-f65.google.com with SMTP id o2so517935uae.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Aug 2019 02:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SAr1vcmf8/odyrGaz5y9j+yYPNLhagxFitwrgIM924E=;
 b=OUJ8PNsrF2CyfDJGFlbj8zuXyBbvYp+8I+5kcWwq5eYEEifrEbHaGlztfNLR6KD+db
 c5KmXVzBFX2BsK9aLZt/bFSyBfJ1rEvQ/qb29P0NsncQCgNkDlXTeH4HUCo0UV998AHG
 dH4U1wNqgd5io8X3HDOTAFEsxs93obVEeNAbgVL/qAgyRHhDr6BVIMEl47UbdrtvqZx5
 yodTRUmpCyTzUSDncoyVYZDXoPYlRhU8CywIqYHeToZOmdR7Az0fA5/tDqxOt9tBwfD3
 +eAyZHFs2GeJl2Og8HCQnA7xVkIEEdcw25H2dnvbsACe6d/aot8vPZreu3LzOeo1y+qe
 6yeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SAr1vcmf8/odyrGaz5y9j+yYPNLhagxFitwrgIM924E=;
 b=gZgjyIRmHFZpJQl9vw792TZCtgjKo1HFYUf61hIzULRDs2cLFllGuxv67mkZpdxS6s
 ynVWYFXwBJJfZFBXVUklDz+W0DOuVVEHYp6nmYrioaEcK2UqvqmLT9i+X+gHKaYpOCU7
 aDkNjbS+sMiBxF3euL9U2+SuWgD93SF/uVmiKW3vsnrPHIop4jqUy43PU0Y1kEr+zW92
 VHcNbr0GnIJkD8jXdiTm3FQZ4YzkfV8+1ad+qxaKn1bk642jvtnsU6ZnVKHQ1wDfkieT
 sYuQrJR1GkivYG+vVyC5EIHJ0j2T6MlRw6PIVsKPiWZli/EI4LjIF2ybMmN74J5NkY9e
 bsfw==
X-Gm-Message-State: APjAAAXd4t3At6L6zu80knbGLHBgR+DT28Dx/CbQlt+ckIoLN3urHza6
 0vQ03VbgXO8bh38rlLRzbnvtd9OSqLLyF3DbzYg=
X-Google-Smtp-Source: APXvYqwwD7Wde2I/B4TfdbFD276/X/5k/rT0dSj3vimz3P2EgzOL3gQewi2gMprXmYqzBxtgKlfbswmvvsWqvoJI9Tg=
X-Received: by 2002:ab0:3359:: with SMTP id h25mr1103908uap.132.1565774548883; 
 Wed, 14 Aug 2019 02:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190812225211.1737-1-qkrwngud825@gmail.com>
 <20190812225211.1737-2-qkrwngud825@gmail.com>
 <5761733a-ae6a-2bab-4a68-7f91823e775d@huawei.com>
In-Reply-To: <5761733a-ae6a-2bab-4a68-7f91823e775d@huawei.com>
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Wed, 14 Aug 2019 18:22:18 +0900
Message-ID: <CAD14+f1cTyUrj0a-vFaubR+309YUXQeSVNmOqDj9jjjbduEW3w@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 1.4 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 1.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.65 listed in list.dnswl.org]
 -0.4 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hxpUI-003KLg-VZ
Subject: Re: [f2fs-dev] [PATCH 2/2] mkfs.f2fs: add VM disk files to hot data
 types
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

Hi Chao,

You're right and Android will never use those types.

But then again, what's the point of separating the list?
I haven't encountered an Android user or an OEM that wants to
customize this list by passing an argument to mkfs.f2fs.

If an OEM want to customize this list, directly modifying the code for
mkfs.f2fs sounds better anyways.

Thanks.

On Wed, Aug 14, 2019 at 10:51 AM Chao Yu <yuchao0@huawei.com> wrote:
>
> On 2019/8/13 6:52, Park Ju Hyung wrote:
> > Similar to .db files, these are randomly updated extremely frequently.
>
> It looks android doesn't need this, how about adding them under "#ifndef
> WITH_ANDROID"?
>
> Thanks,
>
> >
> > Signed-off-by: Park Ju Hyung <qkrwngud825@gmail.com>
> > ---
> >  mkfs/f2fs_format.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> > index 37d82c3..1c08e3e 100644
> > --- a/mkfs/f2fs_format.c
> > +++ b/mkfs/f2fs_format.c
> > @@ -94,6 +94,11 @@ const char *media_ext_lists[] = {
> >
> >  const char *hot_ext_lists[] = {
> >       "db",
> > +
> > +     /* Virtual machines */
> > +     "vmdk", // VMware or VirtualBox
> > +     "vdi", // VirtualBox
> > +     "qcow2", // QEMU
> >       NULL
> >  };
> >
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
