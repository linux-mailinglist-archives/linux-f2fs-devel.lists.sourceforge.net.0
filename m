Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B81774FB321
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Apr 2022 07:06:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ndmGC-0008IY-V7; Mon, 11 Apr 2022 05:06:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mudongliangabcd@gmail.com>) id 1ndmGC-0008IS-1w
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Apr 2022 05:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8YwA6QxP083/UCgyRAzMQGDlD5kZcDoyElaQeGpUgkE=; b=Pjscw7fG6IBhwVAvwujcQJThDQ
 zsyMDn2i63aArHd7OyLke61YpS0j3+cXUsDkn8zzNR+soqZf92bP88qwjMYp2oGO0+6qpWdd3gACx
 me0cCbNwAsw/qdbyzpt5mZ3kHhg6aDCrqcYC9Gti2FdK5DSVXyrQMzvA5GFVAYNmyu5c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8YwA6QxP083/UCgyRAzMQGDlD5kZcDoyElaQeGpUgkE=; b=M5G/TQHBfKorS30JMD7qPp3Ht/
 UnvidOsqzU7tVm5XJS42bmp4Eu4McWNC0dUAMsQgGUPcOT/+q/2X6bu8dUz3B+h88XGDf/c24ABR4
 KdY2X65Pbts8Myf9A+oA1qLt/dat9QetmNTeFfXcX6ABQkklPr4dPwmZsHFMTnQ60Bcs=;
Received: from mail-ej1-f44.google.com ([209.85.218.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1ndmG9-00CPeO-RH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Apr 2022 05:06:42 +0000
Received: by mail-ej1-f44.google.com with SMTP id bg10so28452684ejb.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 Apr 2022 22:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8YwA6QxP083/UCgyRAzMQGDlD5kZcDoyElaQeGpUgkE=;
 b=L2+00FLogMppoFXHFg3E8356ujGOz3c9PzPvknX62TvrV3yADOQ3iduXpQ65HZ6NTP
 bdHV/APDthmmVL35XIxLShGmCg/1CilV1e199jKpu88yq7qmMywK8FNagibdFYpAEY2d
 Pc4aRsiSnr8miNFi/l7jh854vwqv1T/9riQNuQpxHrLzEcJ+42LHz2qg5J7b1Q2ONKdF
 Vr3np310NqNIUZe12x3Rl0i2PXqqVFgFoRAirsRliKZCdr8jACAzmoKMMUTT9FOR2ZVS
 6e3uqwfGh7dO5GZbXThTBbzQSGKqwrBLZd2EQTw2IwYhkHRire1+mrGQ2wgvp85RMe2S
 hOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8YwA6QxP083/UCgyRAzMQGDlD5kZcDoyElaQeGpUgkE=;
 b=CXquh1HJCEs//h033LyydkACZRJP7d15L17QSfMcJ5k50cCiTnLz7cftZedivpwsdJ
 dVACIj1ij0GYbgPI2Z8HMpt4ZDsZgPa47cYdNWk2bA6GKj9INfP45eMEL8FsKitkjX4I
 ZpU7jLWtXl75SyO6IRkr+h1Gvbdf78xUQN19S4ltJgH60vTD+5ysDYtgm9B9l2v6mOP6
 NbnwdckFIrJhdMT0Y5YQQSPBMylXLsAI3ULB8R7mYJq0/GAmTy6Ee9pRUEiqkhI3m9E5
 yqTay0UtMPdzeo+I2kucvDcDCBiH0CEbp3ArxLV63O3BBe2w4Xb6Ae3Kr4xRt7rJ+sow
 /cQg==
X-Gm-Message-State: AOAM531ysD78AOMpgzowMf0V12ofRhB3XG46pPM/u6muf2dZ16uxhPGW
 x4xBexMEcEBFF5MAQXhlyWTT8mD2fnYKA5taFD058Ker
X-Google-Smtp-Source: ABdhPJxyuZ7pyS7zfRraE4aR/p3QWt5REA4NQkHtEaZOUVcQL/yHATvFUd5zb7sTRztjATSXfjWfLtazljD7Hak0srs=
X-Received: by 2002:a17:906:1be1:b0:6ce:b0a8:17d with SMTP id
 t1-20020a1709061be100b006ceb0a8017dmr28152658ejg.413.1649653595243; Sun, 10
 Apr 2022 22:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220408052207.209856-1-dzm91@hust.edu.cn>
 <f125ece9-872e-39d9-48a5-15b85508f6b6@kernel.org>
 <CAD-N9QV7RUfBreaVOmC0JUwVfieM3kOYigOav8=vpAoak6Uc6A@mail.gmail.com>
 <7e896205-027d-32e2-32b5-8951231132ac@kernel.org>
 <CAD-N9QXM_xds692Lh-QZc5aL01uRivLGrNnxJys41hiTUfKE5w@mail.gmail.com>
 <2f5b7291-da06-0895-8e75-c7a37251b47e@kernel.org>
In-Reply-To: <2f5b7291-da06-0895-8e75-c7a37251b47e@kernel.org>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Mon, 11 Apr 2022 13:06:09 +0800
Message-ID: <CAD-N9QX7wKN_x88w7p6t1KWeTGodeF-o0i-1d0Sq4Ja1OzPFoA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Apr 11,
 2022 at 11:10 AM Chao Yu wrote: > > On 2022/4/9
 14:42, Dongliang Mu wrote: > > On Sat, Apr 9, 2022 at 11:46 AM Chao Yu wrote:
 > >> > >> On 2022/4/9 9:34, Dongliang Mu wrote: > >>> [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.44 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [mudongliangabcd[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.44 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1ndmG9-00CPeO-RH
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

On Mon, Apr 11, 2022 at 11:10 AM Chao Yu <chao@kernel.org> wrote:
>
> On 2022/4/9 14:42, Dongliang Mu wrote:
> > On Sat, Apr 9, 2022 at 11:46 AM Chao Yu <chao@kernel.org> wrote:
> >>
> >> On 2022/4/9 9:34, Dongliang Mu wrote:
> >>> On Sat, Apr 9, 2022 at 8:27 AM Chao Yu <chao@kernel.org> wrote:
> >>>>
> >>>> On 2022/4/8 13:22, Dongliang Mu wrote:
> >>>>> From: Dongliang Mu <mudongliangabcd@gmail.com>
> >>>>>
> >>>>> In f2fs_is_valid_blkaddr, if type is DATA_GENERIC_ENHANCE or
> >>>>> DATA_GENERIC_ENHANCE_READ, it invokes WARN_ON(1) not matter
> >>>>> blkaddr is in the range or not.
> >>>>
> >>>> If we run into the path where we invoke WARN_ON(1) in f2fs_is_valid_blkaddr(),
> >>>> It means f2fs image may be broken, or there is a bug in f2fs.
> >>>>
> >>>> So, do you suffer any related issue in your environment?
> >>>
> >>> related issue? Can you explain a little?
> >>>
> >>> If you mean if this warning occurs, any other issues or crash
> >>
> >> I mean have you seen any warning info printed in the path of
> >> f2fs_is_valid_blkaddr() before applying this patch, and if so, w/ what
> >> reproducer? or you just figure out this patch from perspective of code
> >> review?
> >
> > Yes, I have seen both warning information from Syzbot [1] and my local
> > syzkaller instance.
> >
> > In f2fs_is_valid_blkaddr, if the following condition is satisfied,
> > i.e., blkaddr is not in the right range [2], it will directly invoke
> > one WARN_ON.
> >
> > if (unlikely(blkaddr >= MAX_BLKADDR(sbi) ||
> >                   blkaddr < MAIN_BLKADDR(sbi))) {
> >
> > This is the case on Syzbot.
> >
> > Otherwise, it will jump into __is_bitmap_valid. And if the following
> > condition is satisfied [3], it will trigger another WARN_ON.
> >
> > exist = f2fs_test_bit(offset, se->cur_valid_map);
> > if (!exist && type == DATA_GENERIC_ENHANCE) {
> >
> > This appears in my local syzbot instance, but unfortunately it does
> > not get any reproducer.
>
> Oh, it occurs in syzbot test, I guess it is possible that f2fs prints such
> warning info after blkaddr of node/data block was fuzzed to invalid one.
>
> I prefer to keep WARN_ON() to catch more info of bugs found by non-fuzzed
> type test.
>
> Thoughts?

I am fine with both options. I can remove the WARN_ON in my local
syzkaller instance and continue fuzzing Linux kernel.

+Dmitry Vyukov how do you think? If WARN_ON is kept, this crash will
occur on Syzbot from time to time.

>
> Thanks,
>
> >
> > [1] https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsyzkaller.appspot.com%2Fbug%3Fextid%3D763ae12a2ede1d99d4dc&amp;data=04%7C01%7Cchao.yu%40oppo.com%7Cff92e63621b24fc75a4908da19f45860%7Cf1905eb1c35341c5951662b4a54b5ee6%7C0%7C0%7C637850834521060840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=UVSSS9IknYLJHzqqJAN5HmPgJ8GNczvi6%2FuQf2n3vlY%3D&amp;reserved=0
> > [2] https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Flatest%2Fsource%2Ffs%2Ff2fs%2Fcheckpoint.c%23L187&amp;data=04%7C01%7Cchao.yu%40oppo.com%7Cff92e63621b24fc75a4908da19f45860%7Cf1905eb1c35341c5951662b4a54b5ee6%7C0%7C0%7C637850834521060840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=Sf%2Bx8WCAXf5c4%2Bins46saTsTN5uNTrnIceAP3oCWnQw%3D&amp;reserved=0
> > [3] https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Flatest%2Fsource%2Ffs%2Ff2fs%2Fcheckpoint.c%23L135&amp;data=04%7C01%7Cchao.yu%40oppo.com%7Cff92e63621b24fc75a4908da19f45860%7Cf1905eb1c35341c5951662b4a54b5ee6%7C0%7C0%7C637850834521060840%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=Ly%2FBL5oFAWZmXwbN6TaYCExroDE8%2Fsli1alaJwR4wvU%3D&amp;reserved=0
> >
> >
> >>
> >> Thanks,
> >>
> >>> behaviors are generated? I tested on the syzbot. After removing the
> >>> WARN_ON, there is no abnormal issue or crash behaviors followed with
> >>> the corresponding reproducer.
> >>>
> >>>
> >>>>
> >>>> Thanks,
> >>>>
> >>>>>
> >>>>> Fix this by removing WARN_ON.
> >>>>>
> >>>>> Note that, syzbot patch testing does not incur any further issues
> >>>>>
> >>>>> Reported-by: syzbot+763ae12a2ede1d99d4dc@syzkaller.appspotmail.com
> >>>>> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> >>>>> ---
> >>>>>     fs/f2fs/checkpoint.c | 2 --
> >>>>>     1 file changed, 2 deletions(-)
> >>>>>
> >>>>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> >>>>> index f5366feea82d..521498b2dd8c 100644
> >>>>> --- a/fs/f2fs/checkpoint.c
> >>>>> +++ b/fs/f2fs/checkpoint.c
> >>>>> @@ -158,7 +158,6 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
> >>>>>                 f2fs_err(sbi, "Inconsistent error blkaddr:%u, sit bitmap:%d",
> >>>>>                          blkaddr, exist);
> >>>>>                 set_sbi_flag(sbi, SBI_NEED_FSCK);
> >>>>> -             WARN_ON(1);
> >>>>>         }
> >>>>>         return exist;
> >>>>>     }
> >>>>> @@ -196,7 +195,6 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
> >>>>>                         f2fs_warn(sbi, "access invalid blkaddr:%u",
> >>>>>                                   blkaddr);
> >>>>>                         set_sbi_flag(sbi, SBI_NEED_FSCK);
> >>>>> -                     WARN_ON(1);
> >>>>>                         return false;
> >>>>>                 } else {
> >>>>>                         return __is_bitmap_valid(sbi, blkaddr, type);
> >
> >
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
