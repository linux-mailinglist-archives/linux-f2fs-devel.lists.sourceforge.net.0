Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC5A786A7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2019 09:48:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hs0Ou-0004WQ-UF; Mon, 29 Jul 2019 07:48:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hs0Ot-0004WC-4c
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 07:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AJ+ChDlm/y9szBuND2FC99y6NjNZAHWB4cIUUumgTuo=; b=buzMa6mHerIR2qApeuHh0qLx0H
 qJghbidL1JSj44wz6fBYDsVepY76Q8JyDXI1myy7rfvWDRLHC2VZ4Rk6VyYxwqCAdMcBtz/IP7V8V
 GSTosqCmXaoByuRNRjXCxD6SAAt3rXn2bHSNbcz1/drkMr7xLNzuIvIoSzhai8DqZ7jA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AJ+ChDlm/y9szBuND2FC99y6NjNZAHWB4cIUUumgTuo=; b=bpKyKBF+TtHHx8HER+qBxJkyEg
 499u2jMERX0S1TYuwE0xCx3B1iQcWmZ+mFL08imYtcnwX8pJpIzti1uWSVxZffyCcb1hsDZBwHMJx
 eMYY4neci0SN9EinjHwP45gTpb0W/ey+xvSmNcgQsT6viiAC7P4M1aenaWaG1mhDo2Yc=;
Received: from mail-ua1-f67.google.com ([209.85.222.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hs0Oq-00DRE2-MN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 07:48:54 +0000
Received: by mail-ua1-f67.google.com with SMTP id o2so23617847uae.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Jul 2019 00:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AJ+ChDlm/y9szBuND2FC99y6NjNZAHWB4cIUUumgTuo=;
 b=dUjgpbBYov/d9JYBfB0v24rUVlxaA/6i7LmZ3ycYva+NI8zLcVPzbyMIo6jIAty/UN
 mQxZX78mtPUPq62P4VboWcryoDRBmVky88GgJp6ddIp32bfG77p/CTLtDgbMgYafRlHL
 yILZr3el6fiM2NGmYy+WChIDGE+jX59BIXQ9Qvb+6v9IgC+iL1OLhC3oW1fyJgg7XE4T
 uhacJdkVy3okjKev8nLA3ZbFSCV4DlMkb8FvDY2hmX9m2TAKHMGzEBhyd68jyehEuRKJ
 6pITemQBwqhBky8kMI/N9pVhLJfYo4us2vf9OptpGK3w1mZ/57huAYRxO6xgJdy0wHOs
 ibVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AJ+ChDlm/y9szBuND2FC99y6NjNZAHWB4cIUUumgTuo=;
 b=Q4B8bO5MigVYkKdicjn61a/AaYhdHMZMNTe1TfdBOd7lr2ouwz/bWjnthMnF9JDNnP
 CnVQ8btnlyJx/3YKKMsP5GVug8KYtC1hC08YETALeVIdS0VUYyVXPObEBszxmn4faU3r
 HbqR20dOeJt4UQPfRmh9zwavGmoq54hBwr6g7PkKZb/lA3R48MzYMXqHD/ZDHS9gVO4S
 1cojlVeZwv8F+jtMEFHIEUnQ/h+S1l89tsBNNaPEsQQWEmgDKdJlgYNQDPGFQ3QqvKcG
 B10nO5YpZz6t6d+MsHGadzfk27WcDVvFBWMT6K8ETO64h0Hx85IbVY59udGrP0sbcZF/
 3wbQ==
X-Gm-Message-State: APjAAAVy/q59B8co64sxR5OWBvAlEVje8v1Zt3r6N5h1LAIM1JeJAr/f
 mM50W3XYx5h4buv+e6HrDcoKF97dkmTxrT++QW8=
X-Google-Smtp-Source: APXvYqyrCG3S5O49YZ3qRqUbPupSTtyexlnM/m1cB4cj29myUKJ53DxlyhXo+iO18lawn/VrF8CY5VVfbKUvPXF5lPQ=
X-Received: by 2002:ab0:6798:: with SMTP id v24mr37676212uar.43.1564386526377; 
 Mon, 29 Jul 2019 00:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190711150617.124660-1-qkrwngud825@gmail.com>
 <CAD14+f3pxEqC-Kqt0-9+Xb_+Jwr_=NjQmsVoLXz9YTAZJo12zg@mail.gmail.com>
 <20190711170647.GA65508@jaegeuk-macbookpro.roam.corp.google.com>
 <24f7940d-325c-c2b3-608e-ce311db2dc7d@huawei.com>
In-Reply-To: <24f7940d-325c-c2b3-608e-ce311db2dc7d@huawei.com>
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Mon, 29 Jul 2019 16:48:35 +0900
Message-ID: <CAD14+f3ZGaY5jM+A5Bv=cSZNUeYaY=hywaG44SsotMNVz=D09g@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hs0Oq-00DRE2-MN
Subject: Re: [f2fs-dev] [PATCH] f2fs: use kmem_cache pool during xattr
 lookups
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

Hi Chao and Jaegeuk,

I have no idea how that patch got merged.

We(me and Yaro) were supposed to work on doing some finishing touches
to the patch before sending it to upstream.

I'll personally check with Yaro.

Jaegeuk, please remove the patch.
That patch has numerous issues, biggest one being hardcoded size(SZ_256).

Also, I need to figure out how to allocate kmem cache per mounts.

Thanks.

On Mon, Jul 29, 2019 at 4:28 PM Chao Yu <yuchao0@huawei.com> wrote:
>
> Hi Jaegeuk, Ju Hyung, Yaroslav,
>
> I can see "f2fs: xattr: reserve cache for xattr allocations" has been merged in
> dev-test branch, however, it doesn't exist in f2fs mailing list, so I can not
> comment on it.... Can anyone send it to the list?
>
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
