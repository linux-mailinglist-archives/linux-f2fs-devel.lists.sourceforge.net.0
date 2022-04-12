Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4AF4FD348
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Apr 2022 11:25:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neCmV-0006Xl-GG; Tue, 12 Apr 2022 09:25:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mudongliangabcd@gmail.com>) id 1neCmT-0006Xf-Pi
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 09:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X3YNHPaCJ0j6J7AgyeqSNpvtgtUHrIrd+cUv59gmDdw=; b=lNgnaxnhVgmnixUvX7csaYrz2I
 s+QP57UAN8BZCccp0MO+98A8wl9SOMAEiBN2bsxSn6hTvWL5ab4Rz6HNODhHQ9+LXPFkOGg3tuKeC
 RYZIs8qSxTAYJHEHaIb0lFighqDebCyH5oKh+ZHubY+tSFoYmxEldxl/BQzjCqPN+G4k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X3YNHPaCJ0j6J7AgyeqSNpvtgtUHrIrd+cUv59gmDdw=; b=HTbWIzGrIOAiBX9pO1m/8Qzaxu
 t3mQJ6Yfj3YeOKjdTSt+waBcmyrHj4QMBjwp0c14dApgwzBhCtDqsHV+4HAJFijFp63Ai9wlMEfxW
 9BbMlYs1voKpE+eiFxtOgwF+MqAK3hngylzBTf7IOmo8/vvZIHoCU5xWdjh+0HMRLm8c=;
Received: from mail-ej1-f44.google.com ([209.85.218.44])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1neCmQ-00Dsgq-J7
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 09:25:48 +0000
Received: by mail-ej1-f44.google.com with SMTP id p15so36077745ejc.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Apr 2022 02:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X3YNHPaCJ0j6J7AgyeqSNpvtgtUHrIrd+cUv59gmDdw=;
 b=VDmPWsFhmRDehPDyMetWshMjV0aZT1SEh3ZvGVJlflnm8d84DzneF+d9o2XKkbbkOJ
 /lvK8KKFLduChzyolt0Ln3fsQHpjlFOlwNPW0h945g1CRhI7iiDEtkLU/nsZKJUC9KiR
 8DQncwuLk6UdZA/HGp0Ve/2q+uovgoLrD4RB9EbHiVswxU1MN7un0J7cbvnfcFAzTaxS
 MpKfhWbdjYjS1ufX/R4/k7ZB1xwawDdO21viIotcT4DWbpzR6zukClEn+PkmYCZwynKw
 DTArIWvs1+fSxPGUpZki8xbuQrNRtW3vhoUti9/7UqU88slSL1ifx3ThSeBAD05ZcEzW
 MBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X3YNHPaCJ0j6J7AgyeqSNpvtgtUHrIrd+cUv59gmDdw=;
 b=ZTWwKZPf0P+Qz4bCPAOBKJV974e8IjSQfBoK9JVNoYXnYsfRY0kezwS9ytFP/Riz77
 ZLnd/dBx0jgu4UOhHoY+lvaK9Jp6CaKSZ8MhneBUBDFEJLBpkKfddGmwyQfIgbHtWNKd
 yRdyaBPcy5cpuqlzAnzUjLQ/pw8LLzaH+suDORh+RTk0PsrTEsDo4TZ893znyR/8dDB+
 6AH0XHNLbew4YDYBUWHHbOJmsWaORh0UvEYvroHWaCY2Y6Wzw6eGb1KqeThRsTbnbMAZ
 bPtIEO6iOfyplLdezU2J/HF9lROkYRecFmPuZT5VO95N0hysD0CXVvPAWlhj70wHBKqY
 X1Hw==
X-Gm-Message-State: AOAM532O/03mKU2g2nT8l0S5geDwz8lii2c4FOkysqJ7OYfE4PJEK578
 IpBg3KjgBNurJC6SStagbDhdyPRyEppHsnw9YiE=
X-Google-Smtp-Source: ABdhPJyOaUXGrfelcS+wdxAvMUvh4iGL4B43HTVL/dE8NDiNrkZdvrJKneNEM5Q6Hsisd4g2s0OHs2NgcPmFTA8u37Q=
X-Received: by 2002:a17:906:1be1:b0:6ce:b0a8:17d with SMTP id
 t1-20020a1709061be100b006ceb0a8017dmr33419444ejg.413.1649755538517; Tue, 12
 Apr 2022 02:25:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220408052207.209856-1-dzm91@hust.edu.cn>
 <f125ece9-872e-39d9-48a5-15b85508f6b6@kernel.org>
 <CAD-N9QV7RUfBreaVOmC0JUwVfieM3kOYigOav8=vpAoak6Uc6A@mail.gmail.com>
 <7e896205-027d-32e2-32b5-8951231132ac@kernel.org>
 <CAD-N9QXM_xds692Lh-QZc5aL01uRivLGrNnxJys41hiTUfKE5w@mail.gmail.com>
 <2f5b7291-da06-0895-8e75-c7a37251b47e@kernel.org>
 <CAD-N9QX7wKN_x88w7p6t1KWeTGodeF-o0i-1d0Sq4Ja1OzPFoA@mail.gmail.com>
 <YlPHWaSlk21cc32p@sol.localdomain>
 <a25bac9c-188b-4ab4-21e2-d34e20c92524@kernel.org>
In-Reply-To: <a25bac9c-188b-4ab4-21e2-d34e20c92524@kernel.org>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Tue, 12 Apr 2022 17:25:12 +0800
Message-ID: <CAD-N9QWCHZ46wL5zOzWSeesGRk0xzKC4oGy2f8E08FTJhE5UCA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Apr 11,
 2022 at 5:53 PM Chao Yu wrote: > > On 2022/4/11
 14:14, Eric Biggers wrote: > > On Mon, Apr 11, 2022 at 01:06:09PM +0800,
 Dongliang Mu wrote: > >> On Mon, Apr 11, 2022 at 11:10 AM Cha [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [mudongliangabcd[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.44 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.218.44 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1neCmQ-00Dsgq-J7
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
Cc: syzbot+763ae12a2ede1d99d4dc@syzkaller.appspotmail.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 Dongliang Mu <dzm91@hust.edu.cn>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Apr 11, 2022 at 5:53 PM Chao Yu <chao@kernel.org> wrote:
>
> On 2022/4/11 14:14, Eric Biggers wrote:
> > On Mon, Apr 11, 2022 at 01:06:09PM +0800, Dongliang Mu wrote:
> >> On Mon, Apr 11, 2022 at 11:10 AM Chao Yu <chao@kernel.org> wrote:
> >>>
> >>> On 2022/4/9 14:42, Dongliang Mu wrote:
> >>>> On Sat, Apr 9, 2022 at 11:46 AM Chao Yu <chao@kernel.org> wrote:
> >>>>>
> >>>>> On 2022/4/9 9:34, Dongliang Mu wrote:
> >>>>>> On Sat, Apr 9, 2022 at 8:27 AM Chao Yu <chao@kernel.org> wrote:
> >>>>>>>
> >>>>>>> On 2022/4/8 13:22, Dongliang Mu wrote:
> >>>>>>>> From: Dongliang Mu <mudongliangabcd@gmail.com>
> >>>>>>>>
> >>>>>>>> In f2fs_is_valid_blkaddr, if type is DATA_GENERIC_ENHANCE or
> >>>>>>>> DATA_GENERIC_ENHANCE_READ, it invokes WARN_ON(1) not matter
> >>>>>>>> blkaddr is in the range or not.
> >>>>>>>
> >>>>>>> If we run into the path where we invoke WARN_ON(1) in f2fs_is_valid_blkaddr(),
> >>>>>>> It means f2fs image may be broken, or there is a bug in f2fs.
> >>>>>>>
> >>>>>>> So, do you suffer any related issue in your environment?
> >>>>>>
> >>>>>> related issue? Can you explain a little?
> >>>>>>
> >>>>>> If you mean if this warning occurs, any other issues or crash
> >>>>>
> >>>>> I mean have you seen any warning info printed in the path of
> >>>>> f2fs_is_valid_blkaddr() before applying this patch, and if so, w/ what
> >>>>> reproducer? or you just figure out this patch from perspective of code
> >>>>> review?
> >>>>
> >>>> Yes, I have seen both warning information from Syzbot [1] and my local
> >>>> syzkaller instance.
> >>>>
> >>>> In f2fs_is_valid_blkaddr, if the following condition is satisfied,
> >>>> i.e., blkaddr is not in the right range [2], it will directly invoke
> >>>> one WARN_ON.
> >>>>
> >>>> if (unlikely(blkaddr >= MAX_BLKADDR(sbi) ||
> >>>>                    blkaddr < MAIN_BLKADDR(sbi))) {
> >>>>
> >>>> This is the case on Syzbot.
> >>>>
> >>>> Otherwise, it will jump into __is_bitmap_valid. And if the following
> >>>> condition is satisfied [3], it will trigger another WARN_ON.
> >>>>
> >>>> exist = f2fs_test_bit(offset, se->cur_valid_map);
> >>>> if (!exist && type == DATA_GENERIC_ENHANCE) {
> >>>>
> >>>> This appears in my local syzbot instance, but unfortunately it does
> >>>> not get any reproducer.
> >>>
> >>> Oh, it occurs in syzbot test, I guess it is possible that f2fs prints such
> >>> warning info after blkaddr of node/data block was fuzzed to invalid one.
> >>>
> >>> I prefer to keep WARN_ON() to catch more info of bugs found by non-fuzzed
> >>> type test.
> >>>
> >>> Thoughts?
> >>
> >> I am fine with both options. I can remove the WARN_ON in my local
> >> syzkaller instance and continue fuzzing Linux kernel.
> >>
> >> +Dmitry Vyukov how do you think? If WARN_ON is kept, this crash will
> >> occur on Syzbot from time to time.
> >
> > WARN_ON is for kernel bugs; please refer to the documentation in
> > include/asm-generic/bug.h.  If this is a kernel bug, then the kernel bug needs
> > to be fixed.  Otherwise, the WARN_ON needs to be removed.
>
> Alright, so how about using dump_stack() instead as suggested in doc?

I agree. Let's change WARN_ON to dump_stack().

>
> Thanks,
>
> >
> > - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
