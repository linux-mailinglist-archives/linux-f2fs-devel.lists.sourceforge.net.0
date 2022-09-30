Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED4F5F0F8E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Sep 2022 18:04:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oeIVC-0006RE-Tb;
	Fri, 30 Sep 2022 16:04:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1oeIVA-0006R1-Fm
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Sep 2022 16:04:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P1gEZhNKaDm6D8ha6w3cHIovDhU070oj7JlZ7fmq3A4=; b=SQrGBLW/nGVFI+MDp1A1AXhDmb
 j1jDGgJWY7JKATzuZSithBraRNJ7GrkG0MAm5CVUXm2k4UC7BMkZ5ohvokcmZAbnRoheF5FI7o64r
 b9zZgJ8oMYFNOLgnIGCuuaTSSIGGR4O/p3tUx4e79cv4BOqXmIlw1wjQoxvZirmrtTOY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P1gEZhNKaDm6D8ha6w3cHIovDhU070oj7JlZ7fmq3A4=; b=jE28yVEbzQOUVyfnq93z1GXsoh
 NGYSHhmj0em98xW11Mc+TL/X6IeozLInvOs21fi/2ZUOloqPGuiOnV0wsvGU8Y7yoJ3X4BRoVrZX3
 XLpu8Tx1F3p2Byg/Bbo/6+7jN0dndY3S+JbUhDHyDzSYuMP9Lr2ZYRUgQSvTMAYXJzyE=;
Received: from mail-yb1-f170.google.com ([209.85.219.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oeIV9-0084P9-P9 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Sep 2022 16:04:36 +0000
Received: by mail-yb1-f170.google.com with SMTP id 207so2530093ybn.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 Sep 2022 09:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=P1gEZhNKaDm6D8ha6w3cHIovDhU070oj7JlZ7fmq3A4=;
 b=bjePujPzRlskjooOBqV8Lp6gqVCaEk41+Vz1BSH9r7H1FMx9rKzHRIYJQjHfsd3QT4
 iCpcpB6lO/vGV9ZKNkCaiDAIRaPRxWEmpgsu/0AgslJ39omODOVWVeSMzL0Zy255fU9+
 qZzS/e3q/+ODuXmskg9xC2IfBGjvFHeyOmgUwHCCnP1ar4ejmTnW/cKnau1L7wKmnkjZ
 WY5aBHheEpBJur8Ftze+0qr4vt13P7sLJaNvG+3yGJsBkWdE9rduWunxxrDMxj57QvLH
 zuqvVL1uXtUeanRDbQ0bn/vH4PzUyRSAsx4EhxuE7WJyLOcQt7UWtZICu+7DitY3qpD4
 jcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=P1gEZhNKaDm6D8ha6w3cHIovDhU070oj7JlZ7fmq3A4=;
 b=4GnbFhCinlz2vvjcZeGDdBRTn2+wbijM5wC9H8QJOBoIUBx/Fo9ezqJ1N4sORs/rGa
 0WioGKfwRAI+GLjmPhEZmUXu1GM4/ImPfxKR2+fnKTcyBYGwezo0iFuPUdhAs5NhTQEI
 6/vpvO9GiGfZ4jg/4YS5Kj+fZ5X2mLORXiT8mD096d2gbhvrYWXDX/jwbfScekdr+ov6
 ZBlIhaT3SVZZHL3DGa0ytpSNOCVClx/dJSf/yst5L04TkcJniW82pTZq6PjFdjs8iL97
 9xIul8LulgyF6eb8MC8UNbetn294+Q7I/7OU91iWI35EwI4gAA5Gd8fR/H6j4IefV9sk
 NvtQ==
X-Gm-Message-State: ACrzQf156t1HGhrkmDNLNOxEYFUKpxxO09qRg4MJ0BklfLmUQuiHEqdQ
 hrowwTxxMGx8OeWLvZ0lCnlCE+3jCZ8jK7rsVf0=
X-Google-Smtp-Source: AMsMyM6IvjvFmlvXh9MuO/cssBogu4g1kedppJq5VKyB1gsGuRnuYVbu4r387jCZa4tSdKqbc61jcysXfE73oKXn5Xk=
X-Received: by 2002:a5b:90:0:b0:68e:26dd:c4a7 with SMTP id
 b16-20020a5b0090000000b0068e26ddc4a7mr9264930ybp.6.1664553869964; 
 Fri, 30 Sep 2022 09:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220920014036.2295853-1-daeho43@gmail.com>
 <f4ce9486-f104-b0e2-25ed-f6de96316b76@kernel.org>
 <CACOAw_z=9H6jEQNd8C99c6xO55PJXWJOW7Q=78qtppgysebN2A@mail.gmail.com>
 <4aca0d00-d3b7-975f-6b72-ccd6f07d22e5@kernel.org>
 <CACOAw_wVU1gmH1gyWHYNqCpgy4KGKB+EZK6pbGL-h_1ToDV=vg@mail.gmail.com>
 <53df1b78-c611-6a22-88b1-74cc83a9e148@kernel.org>
In-Reply-To: <53df1b78-c611-6a22-88b1-74cc83a9e148@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 30 Sep 2022 09:04:19 -0700
Message-ID: <CACOAw_w_09sz8PxnSGzNmJwh1-y_3JoKbBu80VjgZgV1uxo7KA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > >>>> > >>>> Hi Daeho, > >>>> > >>>> isize should be updated
 after tagging inode as atomic_write one? > >>>> otherwise
 f2fs_mark_inode_dirty_sync()
 may update isize to inode page, > >>>> latter check [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.170 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1oeIV9-0084P9-P9
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce
 F2FS_IOC_START_ATOMIC_REPLACE
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> >>>>
> >>>> Hi Daeho,
> >>>>
> >>>> isize should be updated after tagging inode as atomic_write one?
> >>>> otherwise f2fs_mark_inode_dirty_sync() may update isize to inode page,
> >>>> latter checkpoint may persist that change? IIUC...
> >>>>
> >>>> Thanks,
> >>>
> >>> Hi Chao,
> >>>
> >>> The first patch of this patchset prevents the inode page from being
> >>> updated as dirty for atomic file cases.
> >>> Is there any other chances for the inode page to be marked as dirty?
> >>
> >> I mean:
> >>
> >> Thread A                                Thread B
> >> - f2fs_ioc_start_atomic_write
> >>    - f2fs_i_size_write(inode, 0)
> >>     - f2fs_mark_inode_dirty_sync
> >>                                          - checkpoint
> >>                                           - persist inode with incorrect zero isize
> >>
> >>    - set_inode_flag(inode, FI_ATOMIC_FILE)
> >>
> >> Am I missing something?
> >>
> >
> > So, f2fs_mark_inode_dirty_sync() will not work for atomic files
> > anymore, which means it doesn't make the inode dirty.
> > Plz, refer to the first patch of this patchset. Or I might be confused
> > with something. :(
>
> I mean FI_ATOMIC_FILE was set after f2fs_i_size_write(), so inode will be set
> as dirty.
>
> Thanks,
>

Oh, I was confused that f2fs_update_inode() is called in
f2fs_mark_inode_dirty_sync().
That is called in f2fs_write_inode(). Let me fix this.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
