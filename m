Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8E65BECD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2019 16:55:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hhxho-0006cg-0o; Mon, 01 Jul 2019 14:54:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <arndbergmann@gmail.com>) id 1hhxhm-0006cE-K7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 14:54:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bQADhpdv0AdcGJ5CxSSj7Vw+/Bpl7IHt15JAe9Y6HL4=; b=hpSyIIHSffC66N5HwdKxu/DEZL
 pU1LvvCIXMAiJsg2IoTMujFhJC1LIsNV0OzcZ+HkIsEV6ZwUKQeKgfUpH5a0b13HmOumDZMwfrUKU
 DitT6Urb3Dkv1OTGEp5XnsABirvdnuF7TRPongRYYrb9P60R7WvYmBsJ780en/ZOPQUg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bQADhpdv0AdcGJ5CxSSj7Vw+/Bpl7IHt15JAe9Y6HL4=; b=m8I6cLUIwkrPhrgT42RpSW5m7H
 Dss1JRgv/YVGG9deBseX0Wrr85+E0UN55F3GU6ivoWNvw11jHd3cMCS2XOe7U0mswUa6qLt9GMNqY
 0pp+EDyCHbUyb1DJ5hx78WfmaKLX5nb4jrI/M5YSg5S2ltKDrmHIeat+5fXur3wfDtqc=;
Received: from mail-qt1-f194.google.com ([209.85.160.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hhxht-000jNG-2o
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 14:55:03 +0000
Received: by mail-qt1-f194.google.com with SMTP id p15so14955629qtl.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 01 Jul 2019 07:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bQADhpdv0AdcGJ5CxSSj7Vw+/Bpl7IHt15JAe9Y6HL4=;
 b=lCgZCbYGVVNksh6hEw7Z0B4vYPUk/t5xK0LLOuuHit1bK1//GWmiB4jaDQeZG6o+Rb
 h/YqldCH23mpqQQnEbhOLx/mqg+P//IqzQDYnzM3XRjtdIsPXE4o42RmAmVcOKnWsECx
 QakVIRJJupoaQ0XuWBnFs9zZQ8X2uUCb6zfW2wN3pafczf0jKd9Rzv/gHzD/eqdIH3K+
 Vn8yXeV0v3KwSHxokuLyUMHAwtqemSSFP5e38BupPk2DtwKaUTNaX9XkoZt0eAIOOZO+
 QhAF414E2KhZGFkDd0TASLJx2KsQVWKp8ndPaqryoyJ4Kkz7uPVw4sKFjjvuheo8rU+Z
 IpgQ==
X-Gm-Message-State: APjAAAV7r2Jw/WCMdQ6yC5keIaO+t5Lf27QpBIK10jksUMGhtWVux9lB
 15rxlgKRupAWBK/WqfJJ3vt7T19T+AUgb/svNr8=
X-Google-Smtp-Source: APXvYqx4jXql4g92uWjBRrGcOulzgb4ho0B27u92U6CQir5dPriC+ckt+BJrI8qUUAGd8rINuInxBQyW2plUqW4nLbw=
X-Received: by 2002:ac8:5311:: with SMTP id t17mr20326781qtn.304.1561992895019; 
 Mon, 01 Jul 2019 07:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190628104007.2721479-1-arnd@arndb.de>
 <20190628155956.GB27114@jaegeuk-macbookpro.roam.corp.google.com>
In-Reply-To: <20190628155956.GB27114@jaegeuk-macbookpro.roam.corp.google.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 1 Jul 2019 16:54:38 +0200
Message-ID: <CAK8P3a3c_=3NggcqUBy87ytLVtvGxZiGWmipkgCCGdodYETs9A@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (arndbergmann[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.194 listed in wl.mailspike.net]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hhxht-000jNG-2o
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix 32-bit linking
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
Cc: Eric Biggers <ebiggers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wang Shilong <wangshilong1991@gmail.com>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 Qiuyang Sun <sunqiuyang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 28, 2019 at 5:59 PM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>
> Hi Arnd,
>
> If you don't mind, can I integrate this into the original patch in the queue?

Yes, I think that would be good anyway, it may take a little longer to fix all
the architectures.

        Arnd


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
