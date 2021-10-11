Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4259842941B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Oct 2021 18:03:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mZxle-00024X-OF; Mon, 11 Oct 2021 16:03:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mZxld-00024I-J6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Oct 2021 16:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kR8cVcJwKF9GXGV4SLswTft9R5wnSnYpe56HVAjGBfY=; b=IWt4WrQQvvre0vmxlSQjYYPt4E
 lpgUYTbVkHZdXqRtJjarw5OCSJsVqhPOwqngguYW9BkGBMfN2ZkRhILDy90HnCbHwa0s6sf8cShQe
 Jui5DJCOPwmjcGt+LU4qmTwuv2CPYztmUEDu/9OdFQjh2jqBAFGV3Kni/6i13kgY3AFs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kR8cVcJwKF9GXGV4SLswTft9R5wnSnYpe56HVAjGBfY=; b=G9vL2bS7e/frLw14s1WvQXzHX1
 bDd1LxDSq+psu/GryToqOCIa7+tyM3FmggG6J2xkKFwosWYtiYcA+pXAUdl1NlKgNF+jFK/tCMrsR
 26+8zwHfPjzuktua8z0lIjESeGLRD61X6j5vZwGrJbI1qAbVON2JN4YzvsF+t41gLBpM=;
Received: from mail-lf1-f47.google.com ([209.85.167.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mZxlb-0001Xs-So
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Oct 2021 16:03:09 +0000
Received: by mail-lf1-f47.google.com with SMTP id x27so75473477lfa.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 Oct 2021 09:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kR8cVcJwKF9GXGV4SLswTft9R5wnSnYpe56HVAjGBfY=;
 b=AiFUgJZSg8qAETiAOyE9EP8tqDeBADXJ6UHtIVcK8TABuDZtWkbDhwKSTJKRegrrDW
 9Ek4iDhd9druNdgiNpgDzrd7A3mMNenBuoJ2fvKrC1jEjLW6AQE3/JCsWAR3Xo2Ds1Gi
 6ihck35sDRZTUOFg8MuMTD3+/ynHUdixAKUEZ6Fj7fpz9Au6TlqwFIraM6QOIkkw7UEg
 q4tPcOvY0GmBAtbgFBP42lYXIK3+uZq+8Uq0b1fkDRfWTDMcsMRBowYgM3J1dCBVYuij
 v5a4Gn/SylpYgXlv81ncLbOEsIy+SvovpaaQ/1o+fm2tYHOfNyjX5UlPE4OIqoTqfURQ
 Lk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kR8cVcJwKF9GXGV4SLswTft9R5wnSnYpe56HVAjGBfY=;
 b=BTAfxMGJBY2RiMSK32kL+cqAQW1pE1ImNWyKQg5DE9xdEbRifh6ITrfToUh79qqhWg
 kPFJt46LMTcOdhqDEwmBbe5pAWZq0/aZKPhbDLY/2zQQCV+BeE0kXmOL1Ri2G8zGZ8re
 Dg5WXx/bNPti0LKAWrFDLCtExnx4tBgvlJNKtROAtA0L0/d1/T5KBfagphrl/BN9WD8j
 HejsR2NmHAP+U4hrNm6J1RfD+mcqxr4u9YX0qcSA8O2KSk4iqZf41+Jwv8ASsZhnwB90
 IF9vRwlMspzxz41dWT9hWmzUaq55v4JXzK0GIPkhCFEb4bwzSDxshW9iaV2i7DTT8+Ti
 7sBw==
X-Gm-Message-State: AOAM532COC0uTrnrUIX8SMOwXJNx6WQTiV5NUM+BEuc45Yv2vd9g3JMi
 CeGiUHP12cloLFKa1DG0nQq4SrYLuMwQ8xhtRQs=
X-Google-Smtp-Source: ABdhPJxzTdsG5f3qJEq39X5L95WWGuXKApuuacxL9M0wV/cZyW5NowI/jafTFnq3xkTBsGQepLEKzoRs1P7BspxatHY=
X-Received: by 2002:a05:6512:1056:: with SMTP id
 c22mr1305274lfb.26.1633968178827; 
 Mon, 11 Oct 2021 09:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20211006174910.2964885-1-daeho43@gmail.com>
 <5743eeca-a6e8-87d4-5799-c622fbada429@kernel.org>
In-Reply-To: <5743eeca-a6e8-87d4-5799-c622fbada429@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 11 Oct 2021 09:02:47 -0700
Message-ID: <CACOAw_zfDZMB4pLEuHWU5YcKnAtfBBTSuXwXy+L2rNJxXC3ysg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c >
 > index c1bf9ad4c220..9b663eaf4805 100644 > > --- a/fs/f2fs/compress.c >
 > +++ b/fs/f2fs/compress.c > > @@ -1530,6 +1530,7 @@ int f2fs_write_ [...]
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.47 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.47 listed in wl.mailspike.net]
X-Headers-End: 1mZxlb-0001Xs-So
Subject: Re: [f2fs-dev] [PATCH] f2fs: include non-compressed blocks in
 compr_written_block
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

> > diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> > index c1bf9ad4c220..9b663eaf4805 100644
> > --- a/fs/f2fs/compress.c
> > +++ b/fs/f2fs/compress.c
> > @@ -1530,6 +1530,7 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
> >       if (cluster_may_compress(cc)) {
> >               err = f2fs_compress_pages(cc);
> >               if (err == -EAGAIN) {
> > +                     add_compr_block_stat(cc->inode, cc->cluster_size);
>
> Shouldn't we relocate this after 'write' label?
>
> One more concern, it looks we've changed what compr_block stat indicated,
> literally, the block we account should be compressed..., how about accounting
> it by introducing .presist_blocks, used_blocks or occupied_blocks.... thoughts?
>

What I wanted to add here is just one case in which compression was
tried, but couldn't save any block, so gave up.
If we put this below the "write" label, we will count blocks, even if
the file is turned off for compression in "user-controlled
compression" mode.
Like the commit comment says, I want to estimate the overall compression rate.
But, if we include every other compression disabled condition, it
won't work like that.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
