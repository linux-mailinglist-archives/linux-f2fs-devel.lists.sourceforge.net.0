Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6834F7B684
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jul 2019 02:08:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hscAk-0004MM-QT; Wed, 31 Jul 2019 00:08:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <deepa.kernel@gmail.com>)
 id 1hscAj-0004MC-Jo; Wed, 31 Jul 2019 00:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8JheWTgIzFxYJeqUL2EvPnkBwvWfIxP2sSvvMHXbZc4=; b=V7zrScOq6aYo+Jcd+nOZDnS14x
 WCeTZICVNXVfJNBsJ+IGRCRlR+CSftgjQl+0VJqxEUYG79XObQAA95z4AxMTJOX+VptguWkvJh+of
 0Ge1PQ+hrw2ReKoZWgUDmVVHmgqvP0JzDZuzhCqht5MaUvkbOThU5B+vKT8NP6TwZZBo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8JheWTgIzFxYJeqUL2EvPnkBwvWfIxP2sSvvMHXbZc4=; b=CT9p6QQl5mFag/wfa9P0MWpEfm
 KG6KSemI9Vn2xQ4AhYXYEJpVeNXe6FRBtBypLLT8IEZrwHaFvBfUAFJt2j1maNA+8UxPEFBSbG1aj
 ev+x5DNyGTLoCbBj6pBN9XVOc4bWhiEFLdOm40u6ByoMeidgTJ/HcPvOT6gWqtjIDYc0=;
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hscAi-001quw-22; Wed, 31 Jul 2019 00:08:49 +0000
Received: by mail-io1-f68.google.com with SMTP id k8so132369254iot.1;
 Tue, 30 Jul 2019 17:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8JheWTgIzFxYJeqUL2EvPnkBwvWfIxP2sSvvMHXbZc4=;
 b=hWYJ5Hswuxo5q6pljdWc5Msm3VQGPE+o0HSCQmzoXmEPpO4Z+T78LSXBhG2RqlKjA5
 uuHQ1vElZ+CI1PYhfIjSjVmxF+yXKi/O93nZMTrtRa0m21fyg2+JGse6k3wFoGXup9lP
 bNxdr5XyabSWOxZ8nS3tsaecozIcnxczcu71Ko1/opKV8LhMDy/bdSgSXTlDA6nVnGe/
 WJDgjLIInCFxEFkHKUpjj3ok4lp9ISYt3dlugX7qNuFCQQ4EvmiL+mkFCY/ZEY+MfL+y
 CacADCQ3DvEVeKzsAjzKyhLQ216WFCimRRRaOv5irGoCAMZUXg8xpKt9CYWu6jV/L5OK
 Iadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8JheWTgIzFxYJeqUL2EvPnkBwvWfIxP2sSvvMHXbZc4=;
 b=b/glBYAuKxadwVSAfN7iunMw4qGfbMcEN7tOhuPtZlxTWolg3qWwHDCJqrI8jtKlnK
 Tcd9E2aZwRDI3I4MqtJ3PX30FsN4blH8zmr4eI+6LMfdxqFtPaHp943QVCaTIOkEpWOj
 0pwWy/GujJsfDLMIU1JiB+CaoJ6TMaV4anfQlgNHzjYDa9L9cjxepkwlnP2i8cI/1wFI
 o8SnUsusXb9mn96MXu22WUW10Ks0BTw27vJw/itEkHM0tpIAIZVnu6yURRWHicp6ZHsX
 FBbdK+eSDuliSB08MOwtEn/tl8i4GMU4n1L8dVAmamFuoq2TGEsR9PZ4I2toSmF9pMqa
 xIDA==
X-Gm-Message-State: APjAAAXl0xGxtTZ+sPSiGNOoByjJBbGmggYHfr/CDPNdFybsutQHXMCA
 a2ErlGYHR/0XTg9eqGrmLjhgsuAWi/CCVEZYY4c=
X-Google-Smtp-Source: APXvYqw7z/G000E74naYRSALQNnmNRrw0cRjYs2C5wAzrF9FiInot9iHNesX21g3d95n0NHpLL9UMtgt3fxiJGInFeE=
X-Received: by 2002:a6b:f406:: with SMTP id i6mr38634089iog.110.1564531722141; 
 Tue, 30 Jul 2019 17:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190730014924.2193-1-deepa.kernel@gmail.com>
 <20190730014924.2193-4-deepa.kernel@gmail.com>
 <87d0hsapwr.fsf@mail.parknet.co.jp>
 <CABeXuvqgaxDSR8N_D1Tdw06g_5PGinZS--6nx-bPtAWP4v+mwg@mail.gmail.com>
 <5340224D-5625-48A6-909E-70B24D2084BC@tuxera.com>
In-Reply-To: <5340224D-5625-48A6-909E-70B24D2084BC@tuxera.com>
From: Deepa Dinamani <deepa.kernel@gmail.com>
Date: Tue, 30 Jul 2019 17:08:30 -0700
Message-ID: <CABeXuvq_9YTTGZwmxO1WuEivuttDesNHKxeSQL5SsvkBSR884Q@mail.gmail.com>
To: Anton Altaparmakov <anton@tuxera.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lkml.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.68 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (deepa.kernel[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hscAi-001quw-22
Subject: Re: [f2fs-dev] [PATCH 03/20] timestamp_truncate: Replace users of
 timespec64_trunc
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
Cc: Arnd Bergmann <arnd@arndb.de>, Artem Bityutskiy <dedekind1@gmail.com>,
 y2038 Mailman List <y2038@lists.linaro.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Tejun Heo <tj@kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Richard Weinberger <richard@nod.at>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>,
 stoph Hellwig <hch@lst.de>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 30, 2019 at 3:28 PM Anton Altaparmakov <anton@tuxera.com> wrote:
>
> Hi Deepa,
>
> > On 30 Jul 2019, at 18:26, Deepa Dinamani <deepa.kernel@gmail.com> wrote:
> >
> > On Tue, Jul 30, 2019 at 1:27 AM OGAWA Hirofumi
> > <hirofumi@mail.parknet.co.jp> wrote:
> >>
> >> Deepa Dinamani <deepa.kernel@gmail.com> writes:
> >>
> >>> diff --git a/fs/fat/misc.c b/fs/fat/misc.c
> >>> index 1e08bd54c5fb..53bb7c6bf993 100644
> >>> --- a/fs/fat/misc.c
> >>> +++ b/fs/fat/misc.c
> >>> @@ -307,8 +307,9 @@ int fat_truncate_time(struct inode *inode, struct timespec64 *now, int flags)
> >>>              inode->i_atime = (struct timespec64){ seconds, 0 };
> >>>      }
> >>>      if (flags & S_CTIME) {
> >>> -             if (sbi->options.isvfat)
> >>> -                     inode->i_ctime = timespec64_trunc(*now, 10000000);
> >>> +             if (sbi->options.isvfat) {
> >>> +                     inode->i_ctime = timestamp_truncate(*now, inode);
> >>> +             }
> >>>              else
> >>>                      inode->i_ctime = fat_timespec64_trunc_2secs(*now);
> >>>      }
> >>
> >> Looks like broken. It changed to sb->s_time_gran from 10000000, and
> >> changed coding style.
> >
> > This is using a new api: timestamp_truncate(). granularity is gotten
> > by inode->sb->s_time_gran. See Patch [2/20]:
> > https://lkml.org/lkml/2019/7/29/1853
> >
> > So this is not broken if fat is filling in the right granularity in the sb.
>
> It is broken for FAT because FAT has different granularities for different timestamps so it cannot put the correct value in the sb as that only allows one granularity.  Your patch is totally broken for fat as it would be immediately obvious if you spent a few minutes looking at the code...

It seemed to me that FAT had already covered the special cases (2s and
1d) granularities by using internal functions. This one could also be
an inlined calculation, but I will just drop the FAT part from this
patch and leave it as is for now.

Thanks,
Deepa


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
