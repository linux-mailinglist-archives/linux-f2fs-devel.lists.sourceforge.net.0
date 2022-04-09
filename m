Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C3E4FA575
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Apr 2022 08:43:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nd4oN-0003fB-Aq; Sat, 09 Apr 2022 06:43:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mudongliangabcd@gmail.com>) id 1nd4oL-0003f5-Vi
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Apr 2022 06:43:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2F/NiylbSnlTwbMHYz60q2+JT/Z/4lfxU2QxIerjfG0=; b=Q+o6JI0yICWA38kssDWPffMlg2
 zrSGTkzDFBZJAsOYcCn48nUJPBV2jOH5emluyRBzUmB7r+y3sDSy9IXjZu3JS40DJRTm+dJ8FtEdv
 3zXJzryzMXtDCIgY47ndMdfSH60P0k0NPPBfeot67QKY65maOi4WZemQ9N7EiJYEqZdM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2F/NiylbSnlTwbMHYz60q2+JT/Z/4lfxU2QxIerjfG0=; b=cPFPTow1Ro17Wnr33JP4Cn60Ki
 9uHF4Hi3A+aK7ieT0DDpVJGzdYe/GBZ34h6TMUsOQscvi87kLfs0D1QJlxy9Pw+EWvLWVRYes2DNb
 U2fiD3BkBH4RQ0fMAme6an4NbK3qaOXuWXGQzog6pIUUrxSjSJKa4JtSBrqsnbfz5QSw=;
Received: from mail-ej1-f45.google.com ([209.85.218.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nd4oJ-00060X-0u
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 09 Apr 2022 06:43:04 +0000
Received: by mail-ej1-f45.google.com with SMTP id bh17so21129828ejb.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 08 Apr 2022 23:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2F/NiylbSnlTwbMHYz60q2+JT/Z/4lfxU2QxIerjfG0=;
 b=gZjUk86s0gIdGuXwfNi9lv2EhGp2HrzptHB9qYB2U9AMrnEYm7TKJZLMSDU/h1B96X
 B1r0LPVI6Vv7HBEKMR+dyMASFXFpBbLEiTcyHu7jp5ifO/TptiP2e3fKmxX0fnwjHBpQ
 M1wqki+NWzZ/ycsKhItd6yzINm4JV+Xvh6kAOyBgQh26RscOfDbcvRbyFi93dgGrWoSu
 kCkLXbRMwZzEp83wF2ZsKQkZsJgoip0OasmG3CLCFMtGYrIG2QS0OItPVYQxQPottP8Z
 x2xPTIiS5IdlA1SrAch36UgaWJSLZM0+KIAN/Xricc/vedCLNK1wFgx0JJtmxLmXKPD8
 Rt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2F/NiylbSnlTwbMHYz60q2+JT/Z/4lfxU2QxIerjfG0=;
 b=l9tgdcahi+UDAOM0f/cIfEGg5SVuVtRfHc5lSHzz3upqLNPQlrOVg3B4urWrydDJ+G
 z1Bd3cUo+lff9KJtGGSGGMN22on+VaQ2SghLnBspigbgCq3r9JlOfHhRkvH35o6W5obf
 Zo86aJAUOPMQIHqIfS2070/Hsqg2x8vhaBtCp4v11GvrI7WndQG2mR3LJyf1lYaufH+r
 femks4ytHauk250sDF8+hduYZbXlMaa8jeBrIV8extnqLLtj6HmFBittWsFNQaVEFslw
 haY/gFoHH+xoG5fTJq9/J4lRS9TDZmoH7wU0CBF/WTT7xRIP7LhVeFyZBJ0cNtgr8Aj8
 Fe7w==
X-Gm-Message-State: AOAM532CU4FKkXy1Fspn56W/BB7ntKXP8uUQz49gStdfhoWtXS56+iIZ
 6/RdgGVhVREzK8EMoOvaRPc7X6lG03K93cgMEFA=
X-Google-Smtp-Source: ABdhPJx8qoqL+FbYtdeW6jN5xfqLHDYEKVYzM5xucpQpsFIqTOBoXZJ1lqWUYcA6QDQP7041JKouJjm9uFNUNz42wQM=
X-Received: by 2002:a17:906:3a15:b0:6cf:ea4e:a1cc with SMTP id
 z21-20020a1709063a1500b006cfea4ea1ccmr22478337eje.753.1649486575449; Fri, 08
 Apr 2022 23:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220408052207.209856-1-dzm91@hust.edu.cn>
 <f125ece9-872e-39d9-48a5-15b85508f6b6@kernel.org>
 <CAD-N9QV7RUfBreaVOmC0JUwVfieM3kOYigOav8=vpAoak6Uc6A@mail.gmail.com>
 <7e896205-027d-32e2-32b5-8951231132ac@kernel.org>
In-Reply-To: <7e896205-027d-32e2-32b5-8951231132ac@kernel.org>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Sat, 9 Apr 2022 14:42:29 +0800
Message-ID: <CAD-N9QXM_xds692Lh-QZc5aL01uRivLGrNnxJys41hiTUfKE5w@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Apr 9,
 2022 at 11:46 AM Chao Yu wrote: > > On 2022/4/9
 9:34, Dongliang Mu wrote: > > On Sat, Apr 9, 2022 at 8:27 AM Chao Yu wrote:
 > >> > >> On 2022/4/8 13:22, Dongliang Mu wrote: > >>> Fr [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [mudongliangabcd[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.45 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.45 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nd4oJ-00060X-0u
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

On Sat, Apr 9, 2022 at 11:46 AM Chao Yu <chao@kernel.org> wrote:
>
> On 2022/4/9 9:34, Dongliang Mu wrote:
> > On Sat, Apr 9, 2022 at 8:27 AM Chao Yu <chao@kernel.org> wrote:
> >>
> >> On 2022/4/8 13:22, Dongliang Mu wrote:
> >>> From: Dongliang Mu <mudongliangabcd@gmail.com>
> >>>
> >>> In f2fs_is_valid_blkaddr, if type is DATA_GENERIC_ENHANCE or
> >>> DATA_GENERIC_ENHANCE_READ, it invokes WARN_ON(1) not matter
> >>> blkaddr is in the range or not.
> >>
> >> If we run into the path where we invoke WARN_ON(1) in f2fs_is_valid_blkaddr(),
> >> It means f2fs image may be broken, or there is a bug in f2fs.
> >>
> >> So, do you suffer any related issue in your environment?
> >
> > related issue? Can you explain a little?
> >
> > If you mean if this warning occurs, any other issues or crash
>
> I mean have you seen any warning info printed in the path of
> f2fs_is_valid_blkaddr() before applying this patch, and if so, w/ what
> reproducer? or you just figure out this patch from perspective of code
> review?

Yes, I have seen both warning information from Syzbot [1] and my local
syzkaller instance.

In f2fs_is_valid_blkaddr, if the following condition is satisfied,
i.e., blkaddr is not in the right range [2], it will directly invoke
one WARN_ON.

if (unlikely(blkaddr >= MAX_BLKADDR(sbi) ||
                 blkaddr < MAIN_BLKADDR(sbi))) {

This is the case on Syzbot.

Otherwise, it will jump into __is_bitmap_valid. And if the following
condition is satisfied [3], it will trigger another WARN_ON.

exist = f2fs_test_bit(offset, se->cur_valid_map);
if (!exist && type == DATA_GENERIC_ENHANCE) {

This appears in my local syzbot instance, but unfortunately it does
not get any reproducer.

[1] https://syzkaller.appspot.com/bug?extid=763ae12a2ede1d99d4dc
[2] https://elixir.bootlin.com/linux/latest/source/fs/f2fs/checkpoint.c#L187
[3] https://elixir.bootlin.com/linux/latest/source/fs/f2fs/checkpoint.c#L135


>
> Thanks,
>
> > behaviors are generated? I tested on the syzbot. After removing the
> > WARN_ON, there is no abnormal issue or crash behaviors followed with
> > the corresponding reproducer.
> >
> >
> >>
> >> Thanks,
> >>
> >>>
> >>> Fix this by removing WARN_ON.
> >>>
> >>> Note that, syzbot patch testing does not incur any further issues
> >>>
> >>> Reported-by: syzbot+763ae12a2ede1d99d4dc@syzkaller.appspotmail.com
> >>> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> >>> ---
> >>>    fs/f2fs/checkpoint.c | 2 --
> >>>    1 file changed, 2 deletions(-)
> >>>
> >>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> >>> index f5366feea82d..521498b2dd8c 100644
> >>> --- a/fs/f2fs/checkpoint.c
> >>> +++ b/fs/f2fs/checkpoint.c
> >>> @@ -158,7 +158,6 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
> >>>                f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
> >>>                         blkaddr, exist);
> >>>                set_sbi_flag(sbi, SBI_NEED_FSCK);
> >>> -             WARN_ON(1);
> >>>        }
> >>>        return exist;
> >>>    }
> >>> @@ -196,7 +195,6 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
> >>>                        f2fs_warn(sbi, "access invalid blkaddr:%u",
> >>>                                  blkaddr);
> >>>                        set_sbi_flag(sbi, SBI_NEED_FSCK);
> >>> -                     WARN_ON(1);
> >>>                        return false;
> >>>                } else {
> >>>                        return __is_bitmap_valid(sbi, blkaddr, type);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
