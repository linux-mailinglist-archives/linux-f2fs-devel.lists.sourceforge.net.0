Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6899F8D5AD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2019 16:11:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hxtzL-0007pD-Nx; Wed, 14 Aug 2019 14:10:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hxtzK-0007oh-8l
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 14:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mPe9ARqrES1gnwqE4C0Z2IPnSqvv+rbRj+7dgNReoMA=; b=KJXizmrvYZHs/YtK8p3SyquzFS
 0bTxdjANC9rwocMRLSelXLUN0jeZCwGBor+nsPm12G/w/uaqys2FoXIa/JDRsV5lslepnq3CggRwB
 6whvR6Ylrh6IOUp0nP7MuecP5b8JDnHbMiIn6UEu/t3Hj73qi6Cxh98ME83syRiDLjZw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mPe9ARqrES1gnwqE4C0Z2IPnSqvv+rbRj+7dgNReoMA=; b=hCNUPU8z6laEODRXrU4tN+Dij1
 MarQlkaAeHkofHX0SWunoNl8k4C0f7E9CQfwuwmT0dnwZ7e3Vqc/EwEXi0jZxZGh8Ep7bM1yioL5f
 BhU8+gYx9hh/+cSkDbyQ4gW2UZgw51G4FZWt3Fm6coXWUdYtii1p2rsXDlNDQJR0qwzA=;
Received: from mail-vs1-f68.google.com ([209.85.217.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hxtzJ-003VNx-25
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 14:10:54 +0000
Received: by mail-vs1-f68.google.com with SMTP id 190so6269838vsf.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Aug 2019 07:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mPe9ARqrES1gnwqE4C0Z2IPnSqvv+rbRj+7dgNReoMA=;
 b=g5oHTH7Jo1YwVFgcCPVE6Xn3pnvH3rqRpSmLEIq7Xz0o4zd9FToLuf7GTQfwEwyTvo
 rZjWZN/02t5kaxbfHLUlKAkB33PvpRC5wMp4jSKwKWSUpBh8cowMErZyay8F+67THHe1
 rgSxfUB0RFKAb6z5rUihxzXLc6B/KzG8NmSeYU2bAot5oth0q8DKfLOps0UKpQYGkQFr
 L9OAhLsjf4lHF4DI+d2/wZG3GlEXKH41ftDeNSppQaPTCS0mbcXKpnEdeKVtqv21PCcJ
 djRf2cWMoh60f08mAz/1wGCSg+fIlTPJbIbypS2fi8RqDNzB0KUFQzgxeZVKV5Imj4Qt
 5lUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mPe9ARqrES1gnwqE4C0Z2IPnSqvv+rbRj+7dgNReoMA=;
 b=ZTR03qxg8Ha2yKnH2TZDM+XpNl7iu2r5ZaloLqNlYzddFhP6U/Xk/ugncmzOpz13/o
 Yn0z4m67R8IA6j8CNI18MAv90mfiNmHd669XK3zOwaWpVbHdXmQvoekXPEkiCUOY5sDO
 21iKu7XXyI5YYYapLgZvSRbDfFcwtNeBvgNzZm5rj99MwdLQhmRC815zaqbvBaofsIZ9
 8U1HO+NMavz6DH52UeALIIYBJENuzl8hX6523u+Ndx93MkB8eEaZxOTvIHp8DqBViQLd
 /ufmnyOr8jWY5JxcnfvxpnMOWkEnuj954Krp6jODz/08VUsXxO2PhVNZFsx7rfMSliJg
 9Kfw==
X-Gm-Message-State: APjAAAUiNDn/KVY1TgGBTmo7pS/e7iZmJuOywcfAFx4+ytaTAk9OAmvK
 LxH3EvtJa6SMAgg6HveYVoCHU2RWGMDaWM6Ckqw=
X-Google-Smtp-Source: APXvYqyeGEUnFNzaLJj/NZphh+9pteX8th3tkOdCBbRApujLVJORIB/4Osb4PWhSWQ6jMU7jt5UPEMOh/uiEEao4xb4=
X-Received: by 2002:a67:3046:: with SMTP id w67mr15518617vsw.214.1565791846697; 
 Wed, 14 Aug 2019 07:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190812225211.1737-1-qkrwngud825@gmail.com>
 <c5fbcb16-c7b2-988d-2110-8ce53a6137f6@huawei.com>
 <CAD14+f3bu8WqCE5jAqR968p=DvUqronR8QCg_EhgFD9x2PJQeA@mail.gmail.com>
 <aea1a700-7d31-9b39-8f30-b6acf1fd8a21@huawei.com>
In-Reply-To: <aea1a700-7d31-9b39-8f30-b6acf1fd8a21@huawei.com>
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Wed, 14 Aug 2019 23:10:35 +0900
Message-ID: <CAD14+f0PkiuFkg04eGVJQkeeG+JjFdas6hWCc_FazGK5VQh0KA@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 1.4 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.68 listed in list.dnswl.org]
 1.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.68 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
X-Headers-End: 1hxtzJ-003VNx-25
Subject: Re: [f2fs-dev] [PATCH 1/2] mkfs.f2fs: add "zip" to cold data types
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

/data/log isn't even here.
I think it must be specific to EMUI.

Thanks.

On Wed, Aug 14, 2019 at 6:48 PM Chao Yu <yuchao0@huawei.com> wrote:
>
> Hi Ju Hyung,
>
> On 2019/8/14 17:20, Ju Hyung Park wrote:
> > Hi Chao,
> >
> > On Wed, Aug 14, 2019 at 10:47 AM Chao Yu <yuchao0@huawei.com> wrote:
> >> In android, as I see, most zip file is small-sized log type, and will be removed
> >> after a roll-back, such as:
> >>
> >> time1: create log1.zip
> >> time2: create log2.zip
> >> time3: create log3.zip
> >> time4: remove log1.zip, rename log2.zip -> log1.zip; rename log3.zip ->
> >> log2.zip; create log3.zip
> >>
> >> I suggest we can keep zip type in android as warm type with IPU mode to avoid
> >> fragmentation caused by small holes in cold area. In linux distro, I agreed to
> >> treat zip as cold type.
> >
> > I actually thought your original suggestion of adding "zip" was to
> > handle big zip files under /sdcard(/data/media).
> >
> > The one case you've mentioned will be entirely dependent on which apps
> > user's using.
>
> Yeah, actually, now I didn't see much large zip file in my external storage,
> most of them are xxxKB or xMB, some of them looks very old tho. :)
>
> > In case of mine, I don't have any zip files under /data that's
> > seemingly used for logs.
>
> Huawei cell phone has log file with .zip/.gz type locating in /data/log/... can
> you search that directory?
>
> If we relocate them into cold area, they will make holes in cold area crazily,
> as they have small size and will be created/unlinked frequently.
>
> Thanks,
>
> >
> > Thanks,
> > .
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
