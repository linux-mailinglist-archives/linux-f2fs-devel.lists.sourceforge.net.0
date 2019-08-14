Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB368CF2B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2019 11:20:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hxpSS-0003fF-Gi; Wed, 14 Aug 2019 09:20:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hxpSQ-0003ez-U3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 09:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NXYOJ+mkeZ2MjDipWZ7HUnPL3a7h6niHMKvoFbEw1jQ=; b=MiRngVvzq0MVRWMmme7b7rC2Y+
 GsxGSxLRWsBYH93hdPCQTWjr1JZjgp6rHZFWOdbJB5C8wqe7rcWAlDybfAdQawWDatG199og6s3yG
 8JceVNOp2lSIZLsqWnz7kibffic60+5C/O6YPzfzUrcEe4D7TQCVT6q6DjV2fY+DMJSs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NXYOJ+mkeZ2MjDipWZ7HUnPL3a7h6niHMKvoFbEw1jQ=; b=dhzsFnj6GYmRJDkxm0g9ohJbm2
 K1bPj/MAi8iPRVtS1cXjWRojL4gw1fnAQX24279oyTY9dkrz4Rf5Dpkah1LoVKmRxvMIMIuevs6pK
 lW4Z2lsO0mUHt+s9/jNcP4w0NriEbb2cjPm0uAq9Vz/8Bh8kg6VWmu2PDLbX7IZO9Zsc=;
Received: from mail-ua1-f67.google.com ([209.85.222.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hxpSN-003jD1-0a
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 09:20:38 +0000
Received: by mail-ua1-f67.google.com with SMTP id 34so4808830uar.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Aug 2019 02:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NXYOJ+mkeZ2MjDipWZ7HUnPL3a7h6niHMKvoFbEw1jQ=;
 b=ahmVr8Sfnn7Hltidvby6BwHqwkep4J5DiPnN6CUmd0BpqMoHGgMTY0M4WyxS0XNPEQ
 kTsVTpnXx+4Wfkflxp/FC40U8UY8DeJzaW3eDWryEBRbfpJq5n9JsfoArhg6OTUreQ+q
 02F0GQyq47IrSR6yKwpWY4tSPF/p0d1Qk6TE69VtkmVr1LUOjYB3RhEHl6LfderbO+IM
 jCO1FEmn0ZMscLfWPdaHh8ma2mBomtRg8AikxUbvq1oEJi22S1X0uqtHSxSjbgtaTt3E
 bGjqxGuBTSGrmdwNh7jpSh/mo2OaM84iMiPdj9Rx5NgDSGHBM/ms1rphp0GLlzc6XrCI
 xE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NXYOJ+mkeZ2MjDipWZ7HUnPL3a7h6niHMKvoFbEw1jQ=;
 b=SML1V5yvMGrY2vY/1Bx1vJu1E+ncl3Qb2QjWIrZxesdNbAo0xLTNJ1KbJFOGeA16D4
 FUeIsfcm7QiZKL0fUi/qqEYoon2kR6uv1LxxTHLEeJaOIeuXxwxKJ0DkB+RgLks0tuYA
 9znGIr0UMq39RDjo8q9Gd+WNgftuO7fLtv8LzZImM3MrEcJhZyFCCmQ+t4/VxEn57ahf
 QYZhJWyI6eWAN2+oNCRJbL0IhbumTtr9yU9wmoE9X/Nlm5S7yJUW8i5Xn/Mqvlz477b2
 WTQldQXlROTMSSDp/pgCNYxwoAVppswbh6fxmTF9DGuQ/bP8a7AT9vnQskRNmKNPWxTl
 riGw==
X-Gm-Message-State: APjAAAXZ27OaaWLjy4uj+O75GPd4DD9/1SSAm80tj3oQ94jCAK4NexI0
 qfDp/I1ZXum3PykHIzkew9JxJBIErnQMFDmxpB0=
X-Google-Smtp-Source: APXvYqymtqNPUc2nLV9RY8Jd+nIJmu2sFjdateBDbU11OkOqR540yAuQVKX3hsGLYXUNt2TXP7/mV8jk6Hywx50cp38=
X-Received: by 2002:ab0:240c:: with SMTP id f12mr1047737uan.97.1565774428733; 
 Wed, 14 Aug 2019 02:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190812225211.1737-1-qkrwngud825@gmail.com>
 <c5fbcb16-c7b2-988d-2110-8ce53a6137f6@huawei.com>
In-Reply-To: <c5fbcb16-c7b2-988d-2110-8ce53a6137f6@huawei.com>
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Wed, 14 Aug 2019 18:20:17 +0900
Message-ID: <CAD14+f3bu8WqCE5jAqR968p=DvUqronR8QCg_EhgFD9x2PJQeA@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 1.4 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.4 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.67 listed in wl.mailspike.net]
X-Headers-End: 1hxpSN-003jD1-0a
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

On Wed, Aug 14, 2019 at 10:47 AM Chao Yu <yuchao0@huawei.com> wrote:
> In android, as I see, most zip file is small-sized log type, and will be removed
> after a roll-back, such as:
>
> time1: create log1.zip
> time2: create log2.zip
> time3: create log3.zip
> time4: remove log1.zip, rename log2.zip -> log1.zip; rename log3.zip ->
> log2.zip; create log3.zip
>
> I suggest we can keep zip type in android as warm type with IPU mode to avoid
> fragmentation caused by small holes in cold area. In linux distro, I agreed to
> treat zip as cold type.

I actually thought your original suggestion of adding "zip" was to
handle big zip files under /sdcard(/data/media).

The one case you've mentioned will be entirely dependent on which apps
user's using.
In case of mine, I don't have any zip files under /data that's
seemingly used for logs.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
