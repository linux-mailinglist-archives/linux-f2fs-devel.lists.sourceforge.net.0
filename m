Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EE14FA108
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Apr 2022 03:34:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nczzr-0001Oy-AF; Sat, 09 Apr 2022 01:34:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mudongliangabcd@gmail.com>) id 1nczzp-0001Oq-6O
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Apr 2022 01:34:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zpo56anepGh1996ZVn2ynpiLSftI9+RsEzRBaVj4yg4=; b=Rs3qL9m57VHAkIKuy6xywaZHTi
 DvyqLdiD2yED5kJMxsS30yae6QMa+2/azmjesmqs1ebVJkGnpG8n4UZhHpLLGqbbM1k4JL3duJiFp
 zfhbGHKQBNh4sWc5FZv7Vv+MXWBko+pzn3xq845WNB8GQ/lwwU98o8+v0fe3qzOge3ic=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zpo56anepGh1996ZVn2ynpiLSftI9+RsEzRBaVj4yg4=; b=N3yMkH/k7L0iMrbXN++eMlm9I3
 22x98Go6d0GlB5UOCQOmvTqLg6S22C3sVk1DuPEoi2R7/fjMwcWC9cbCAtJOA08DDJ+DkaRyuM4d0
 m99d+KqS7vQtO2lwlJJOSTgQD5YWANlBR4w8YQJEQCgLaxM2YcyQ9yo+ugF8XLpvl/QM=;
Received: from mail-ed1-f42.google.com ([209.85.208.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nczzn-0000LC-Sc
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Apr 2022 01:34:37 +0000
Received: by mail-ed1-f42.google.com with SMTP id v15so1799095edb.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 08 Apr 2022 18:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zpo56anepGh1996ZVn2ynpiLSftI9+RsEzRBaVj4yg4=;
 b=INLGEH+vbKT+ECgiAZQ8C9Fwbb4Ob99aqXQUVcVZlQBciKqXZJiwwAQUePzVEghVm/
 tWvN94mruy6ucYM0CMQwryR8hvCHbFupHJjot82QO8BkCiK5Ka9PRxkE7HS2KBycVdEs
 OZKCiUK97EdIfnxWTjQ6gN9wLXadLkrpAm/SIa5t5D/OQ7TkPvlA0NbjV2gldv5qeIcu
 /ahC2E2aUxUs4fojmEvvksy78BvNiAZbXRq8N6MCMU/BnhuziZN9iUMa11Ec5NZL2qTT
 48mk7hbS5ANaPL0fajF1tSjPYeezVsNQXmgqq4vgJk9GABhlGpp8HkdmONg3hz7cFsh4
 jjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zpo56anepGh1996ZVn2ynpiLSftI9+RsEzRBaVj4yg4=;
 b=AZHFl2J6wOD5Kjep0Xu1ZcKEddPjOTpYnWz9OdQ18QDDdF+IPcDSkmZcygIxDyx+lx
 acEUht7OKXMSORE8h2hhC37BkAwb/tPv1P7B8gVTH4JvDASyDWnpx/sNP/1g5O6TEUG9
 xGKBluuwC026piKm5+IGdUVv3QCo+JoZg55ua9DRisrawQ7OID7hb7ULXWw1r0Zkdl2Z
 SyNO2e4ALvAUHFHFeyS2BePeChoylXBOJoZG/wmL5TpgJI8owMVOsjZEp+14aO3jjU5J
 CN0Y1OjeIHtJK+1j00dw7918V96Bv1DhpLq7kDJZifzFlVKzdR8n4lNo0ysRq+/GUTB1
 Mpfg==
X-Gm-Message-State: AOAM530uFM5mxpAejpq8dEWtPDvHQasDdzXRKggLS9nzog1yvtVcYqRR
 GfqBfM97Wt/rXn6CjzTzzHrRVhLbnq6YiTXsgncOB73P6e0=
X-Google-Smtp-Source: ABdhPJwsQzL7e5sUmjWOrWUQj/zvgUrqSodIKWDDRl2LEEuDh6ugBZhU7XQ7ASrJ3S9LsSJ8eI/TPh4VcvBbTJ2uIvw=
X-Received: by 2002:a05:6402:2945:b0:41d:aad:c824 with SMTP id
 ed5-20020a056402294500b0041d0aadc824mr10293856edb.364.1649468069444; Fri, 08
 Apr 2022 18:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220408052207.209856-1-dzm91@hust.edu.cn>
 <f125ece9-872e-39d9-48a5-15b85508f6b6@kernel.org>
In-Reply-To: <f125ece9-872e-39d9-48a5-15b85508f6b6@kernel.org>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Sat, 9 Apr 2022 09:34:02 +0800
Message-ID: <CAD-N9QV7RUfBreaVOmC0JUwVfieM3kOYigOav8=vpAoak6Uc6A@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Apr 9, 2022 at 8:27 AM Chao Yu wrote: > > On 2022/4/8
 13:22,
 Dongliang Mu wrote: > > From: Dongliang Mu > > > > In f2fs_is_valid_blkaddr, 
 if type is DATA_GENERIC_ENHANCE or > > DATA_GENERI [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.42 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [mudongliangabcd[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.42 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nczzn-0000LC-Sc
Subject: Re: [f2fs-dev] [PATCH] fs: f2fs: remove WARN_ON in
 f2fs_is_valid_blkaddr
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 syzbot+763ae12a2ede1d99d4dc@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Apr 9, 2022 at 8:27 AM Chao Yu <chao@kernel.org> wrote:
>
> On 2022/4/8 13:22, Dongliang Mu wrote:
> > From: Dongliang Mu <mudongliangabcd@gmail.com>
> >
> > In f2fs_is_valid_blkaddr, if type is DATA_GENERIC_ENHANCE or
> > DATA_GENERIC_ENHANCE_READ, it invokes WARN_ON(1) not matter
> > blkaddr is in the range or not.
>
> If we run into the path where we invoke WARN_ON(1) in f2fs_is_valid_blkaddr(),
> It means f2fs image may be broken, or there is a bug in f2fs.
>
> So, do you suffer any related issue in your environment?

related issue? Can you explain a little?

If you mean if this warning occurs, any other issues or crash
behaviors are generated? I tested on the syzbot. After removing the
WARN_ON, there is no abnormal issue or crash behaviors followed with
the corresponding reproducer.


>
> Thanks,
>
> >
> > Fix this by removing WARN_ON.
> >
> > Note that, syzbot patch testing does not incur any further issues
> >
> > Reported-by: syzbot+763ae12a2ede1d99d4dc@syzkaller.appspotmail.com
> > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > ---
> >   fs/f2fs/checkpoint.c | 2 --
> >   1 file changed, 2 deletions(-)
> >
> > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > index f5366feea82d..521498b2dd8c 100644
> > --- a/fs/f2fs/checkpoint.c
> > +++ b/fs/f2fs/checkpoint.c
> > @@ -158,7 +158,6 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
> >               f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
> >                        blkaddr, exist);
> >               set_sbi_flag(sbi, SBI_NEED_FSCK);
> > -             WARN_ON(1);
> >       }
> >       return exist;
> >   }
> > @@ -196,7 +195,6 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
> >                       f2fs_warn(sbi, "access invalid blkaddr:%u",
> >                                 blkaddr);
> >                       set_sbi_flag(sbi, SBI_NEED_FSCK);
> > -                     WARN_ON(1);
> >                       return false;
> >               } else {
> >                       return __is_bitmap_valid(sbi, blkaddr, type);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
