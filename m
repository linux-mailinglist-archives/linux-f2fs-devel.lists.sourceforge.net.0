Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBC77AFD1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jul 2019 19:26:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hsVta-0000HC-PY; Tue, 30 Jul 2019 17:26:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <deepa.kernel@gmail.com>)
 id 1hsVtZ-0000H3-Py; Tue, 30 Jul 2019 17:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tsLPrLOcclqm31GATo5KG4DgL5WcwoSIYZV9oMmibkM=; b=U6vLi0c0fW5sUCGk+DDDrJjrOU
 QolgPkFL7HHeNjfWAOJwGClGOi/rVhgMsr/AdE21WIK2S37BfTed/Sds9bwe+UUXOhLOk0hAmHrpj
 jn8h/jwL+t3YPcH91RHzqmAABPrjeACDSM9O870QUI32jMoe5YJ8x8RL9Enk780ZB6q4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tsLPrLOcclqm31GATo5KG4DgL5WcwoSIYZV9oMmibkM=; b=jpwVnFWlTWdBZEajxsTs5P0mwf
 NW30kHHIWFTRRieucXZD37zKCdsSdy3aa6wSbQs6FC2ps6vbVcWYJ65oMySxRE0Ds67yutQs6vKBe
 CdNgKR8YVEhxevtGIeBY5VC9yKKWXG6Gnnybdzptn/EhBbrYtmHCtS2409+T92yegaeE=;
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hsVtY-004wRV-3A; Tue, 30 Jul 2019 17:26:41 +0000
Received: by mail-io1-f67.google.com with SMTP id h6so4767255iom.7;
 Tue, 30 Jul 2019 10:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tsLPrLOcclqm31GATo5KG4DgL5WcwoSIYZV9oMmibkM=;
 b=LUamGemkbRqnOVHbq7CXnlGi/lEYqOEEySiKtSrwXqEp6shA4gxXuseHjOaOiH3aa7
 q4CF5Eum/dqTa4wC00EDfSR4wSTPClq6Y3O6fnjnuTa8UISAGRv24/2prGpJP4yj+/5K
 pp6QgCoaOkGX8YfVQJvI0ldkf7g5Qtz5YPjBIm1MafS1QJbnmne2KPhWiFiOFjpLhpua
 9zkTIHWrBNLvn7Si20xo61CMzJCVm2tyy8IPzybo7iqfWECXz7HiHXR7qDV7Zs/ri977
 AjNYEbpGf5FVBSgWnRjBEI6oRswJ4WN7oBSH2Oh+cBt5ZquUgXtZtN3ILEA184MLtXtW
 bQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tsLPrLOcclqm31GATo5KG4DgL5WcwoSIYZV9oMmibkM=;
 b=OKY9WoGMacLXMe7hQlnQbWQVdTYK2E1Jnz1BPLCJ1GmJ151ytgIF6IIThaCz4//DcC
 xrJk4Ydxwwi/UMTTMOvfqPviCxr+mj5Qoz9t63jTLHIt5JAfuCIoYQcfxw1VwsTZb5AF
 U3iHPz9dsDmQC0/8z0OGTQ9CqaCGR7Kybh6MQc6ZFAwt9AAOP81yAFEFYFSHcvVinW39
 lM8YKikWGMCkMGcGcWRGHrO2PvlnvO0A+QjFU7LbWTp5bkiAcsWaidCpUOdlHy+0am7n
 4iQDBSD7JmsBmPVlrysRCvEPEca+X0p5o0NYO78E1l+9GVY4O+KcdpsQ/sTqLc6TiFgG
 OnoA==
X-Gm-Message-State: APjAAAUfGhpy1K8CegU0DgFyzR9NKSZ65MEw7s1dWyUgeal1JjCRX1ZF
 MGjFpybEE34MPeGQVKaU8WLO4q781rJWTXuRP0M=
X-Google-Smtp-Source: APXvYqy+9zDOTHm2OHuBLA2soclNQ3YwB8p18dgCUYzErzvrXdSDbEEW8GCwNV3FQCvXOrwwAN9MF+uqzNXPUM4I49E=
X-Received: by 2002:a5e:8210:: with SMTP id l16mr81558885iom.240.1564507594217; 
 Tue, 30 Jul 2019 10:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190730014924.2193-1-deepa.kernel@gmail.com>
 <20190730014924.2193-4-deepa.kernel@gmail.com>
 <87d0hsapwr.fsf@mail.parknet.co.jp>
In-Reply-To: <87d0hsapwr.fsf@mail.parknet.co.jp>
From: Deepa Dinamani <deepa.kernel@gmail.com>
Date: Tue, 30 Jul 2019 10:26:22 -0700
Message-ID: <CABeXuvqgaxDSR8N_D1Tdw06g_5PGinZS--6nx-bPtAWP4v+mwg@mail.gmail.com>
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.67 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (deepa.kernel[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lkml.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hsVtY-004wRV-3A
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
 Greg KH <gregkh@linuxfoundation.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tejun Heo <tj@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Richard Weinberger <richard@nod.at>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-ntfs-dev@lists.sourceforge.net, stoph Hellwig <hch@lst.de>,
 anton@tuxera.com, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 30, 2019 at 1:27 AM OGAWA Hirofumi
<hirofumi@mail.parknet.co.jp> wrote:
>
> Deepa Dinamani <deepa.kernel@gmail.com> writes:
>
> > diff --git a/fs/fat/misc.c b/fs/fat/misc.c
> > index 1e08bd54c5fb..53bb7c6bf993 100644
> > --- a/fs/fat/misc.c
> > +++ b/fs/fat/misc.c
> > @@ -307,8 +307,9 @@ int fat_truncate_time(struct inode *inode, struct timespec64 *now, int flags)
> >               inode->i_atime = (struct timespec64){ seconds, 0 };
> >       }
> >       if (flags & S_CTIME) {
> > -             if (sbi->options.isvfat)
> > -                     inode->i_ctime = timespec64_trunc(*now, 10000000);
> > +             if (sbi->options.isvfat) {
> > +                     inode->i_ctime = timestamp_truncate(*now, inode);
> > +             }
> >               else
> >                       inode->i_ctime = fat_timespec64_trunc_2secs(*now);
> >       }
>
> Looks like broken. It changed to sb->s_time_gran from 10000000, and
> changed coding style.

This is using a new api: timestamp_truncate(). granularity is gotten
by inode->sb->s_time_gran. See Patch [2/20]:
https://lkml.org/lkml/2019/7/29/1853

So this is not broken if fat is filling in the right granularity in the sb.

-Deepa


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
