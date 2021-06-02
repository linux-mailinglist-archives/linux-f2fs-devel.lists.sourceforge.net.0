Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E49639964B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Jun 2021 01:23:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZICzdsF/09AoTWxuiGInVWMj2cScJEKns7NEQoNNwk=; b=QE1w8V/cKCYHhCbq2riaIY38+L
	z93GfH9havEpcAXvIB9d/xFK6KgX8AvpC0VO5RrvNUS3tKBfkWVlCZhMtL6TCBH0SdwQtTKD2SYcG
	Do+eegJQV6vFifdUXBKgi84BaBCHDNUGLQTEsQSRUjcziJKEmrDjA04paX005W4IC0tM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1loaCV-0001YH-B3; Wed, 02 Jun 2021 23:23:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <drosen@google.com>) id 1loaCT-0001Y6-U8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Jun 2021 23:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NWXfOWB2ZcUoziLC2rsM6+AWebQeH0STAUDFqx6ZI84=; b=JJzcfsbVo2g9exDeD+FuJViLd2
 GxMByWRIppMLmXSl8LkCL5dt7j7XowhqnzGxq2ZGWJn7pQ7q5ez6Yfx6YwaQqzYr3vq2BhXptrRR0
 LX42mkBNLZCZ9WK+3hJhwXAyVCUjPRN8qgEKFQjT1ypMRsTKDjE6pg3e0xHKdL3CniHQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NWXfOWB2ZcUoziLC2rsM6+AWebQeH0STAUDFqx6ZI84=; b=b5bkFwhXh1RmkVnedNcIzbHexY
 px0lSUTNLlxYS0VhnnZ9ZTDhDFHLi/xuaMWdmfAKKGQ/PpuwKyqsM6F2ZUee83RGOWdnvMZIHwLUv
 /uFPYErLoaRISS95wuVoypjjw+8R3PZpwWcXuq6zm9O6rfxl4wGu5YM/q/fN2S81Zhgc=;
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1loaCM-0006U8-NB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Jun 2021 23:23:03 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 5-20020a9d01050000b02903c700c45721so2973700otu.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Jun 2021 16:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NWXfOWB2ZcUoziLC2rsM6+AWebQeH0STAUDFqx6ZI84=;
 b=qgSswxigcNOrr2ZMNR8Uj2NB8i7JEi7f/0mfyEP0UOlTnuEMuu1/d+SWh8AD0DeMNf
 LiU69e1Sl+HGQw8xd17EXIkXIG7dfZpwgtALqnrZtvHJwNL0O1wyGr3n9VMYKIGuFrlM
 +nP6B4MWh/aAnXi4vY5APg1X/MMJ4KA8gAOu1awWf+mcxoW5BgYQ5IYXv56gZMbPoy8w
 tHd1WxutfII6lbPvMkF+f6/JR2mwNJ9CSVyPAdS89UaPT3+r4yyp0/jXFNlQUldtZ31J
 eaMhfNCsV1mydY4WRWuSgM1w4OIdyVzy1t7tUf9Z2Tv+TJCXUYKuO1dsIcVfUPfxQUHE
 1jSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NWXfOWB2ZcUoziLC2rsM6+AWebQeH0STAUDFqx6ZI84=;
 b=gytUkJF/8IYJKa7Bd7mqvRJ7mJR+RgDUsnNhgVAFRWkFlsD9Rrd0sn18idsZeEOsYl
 a7+CMQoUbSoIthc5IprqtunoSicXhnUHR0v9L4fHJuXGsY1ST1V6JldvRTkPRSbask+E
 CQttwr5j+9pHuFxhPX+HqzRw1ISyPFuggmBTGmYI8cIF5ihvpZR3m6VxE2V30+Ecs3Yg
 uBTDifITI/BEjleywDLl4QTmQ9rVIXhxji7YNO+X6llnALYus5j5I+MncjGIcvFgvpy9
 KV9oN7hKguwJOl9TG4bpMWnAjo1vHdwsEMMwCIwfNkpUg7KJ0AlvOlk2CWN7jyq48URo
 0Dow==
X-Gm-Message-State: AOAM531pvn0rklDsZX0N9C2gkdE2Cm/wZnpoZoD7KF7AoJcri/U6R0um
 F6d8QWqcF8EQVEOzkGYhg6PW0IPPDttNGAGaVG/9Cg==
X-Google-Smtp-Source: ABdhPJx7wYc6+kS658MCpIv4PAwdEIqryfutuR0j19Xo+t9HH4OQ3OJZIwxSQlDk5/DV95gV0+8Tq42zmpoW/H8UvhI=
X-Received: by 2002:a9d:5e8c:: with SMTP id f12mr27745872otl.18.1622676169637; 
 Wed, 02 Jun 2021 16:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210602041539.123097-1-drosen@google.com>
 <20210602041539.123097-3-drosen@google.com>
 <YLfh9pv1fDT+Q3pe@sol.localdomain>
In-Reply-To: <YLfh9pv1fDT+Q3pe@sol.localdomain>
Date: Wed, 2 Jun 2021 16:22:38 -0700
Message-ID: <CA+PiJmR1vWN7ij7ak4q=C0Wxa++t=SCnEFh_iDt7QVOAZy-VFw@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.51 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.51 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1loaCM-0006U8-NB
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: Advertise encrypted casefolding in
 sysfs
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: kernel-team@android.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 2, 2021 at 12:54 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Wed, Jun 02, 2021 at 04:15:39AM +0000, Daniel Rosenberg wrote:
> > +#ifdef CONFIG_UNICODE
> > +F2FS_FEATURE_RO_ATTR(encrypted_casefold, FEAT_ENCRYPTED_CASEFOLD);
> > +#endif
>
> Shouldn't it be defined(CONFIG_UNICODE) && defined(CONFIG_FS_ENCRYPTION)?
>
> >  #endif
> >  #ifdef CONFIG_BLK_DEV_ZONED
> >  F2FS_FEATURE_RO_ATTR(block_zoned, FEAT_BLKZONED);
> > @@ -815,6 +823,9 @@ static struct attribute *f2fs_feat_attrs[] = {
> >  #ifdef CONFIG_FS_ENCRYPTION
> >       ATTR_LIST(encryption),
> >       ATTR_LIST(test_dummy_encryption_v2),
> > +#ifdef CONFIG_UNICODE
> > +     ATTR_LIST(encrypted_casefold),
> > +#endif
>
> Likewise here.
>
> - Eric

Those are already within an #ifdef CONFIG_FS_ENCRYPTION, so it should
be covered already.
Should I send a v2 set with the

Fixes: 7ad08a58bf67 ("f2fs: Handle casefolding with Encryption")
Cc: stable@vger.kernel.org # v5.11+

appended?

-Daniel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
