Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BC4523AE6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 May 2022 18:54:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nopbP-0005rA-8X; Wed, 11 May 2022 16:54:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daehojeong@google.com>) id 1nopbN-0005r3-Vf
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 16:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mW0tZMhSaetyG4D+/2DPQZ0SVjaxvyIVnvfCsq7/P10=; b=d77HVBfLFMULRbWjDSSFEx0o1f
 ACXTVLfNMDiPY/CWRZNbXIAvz8+GP4CF/I9wT13wwhKBSlHemPf8lfzceSWAZsXo/vL6YipvZ8I7M
 ftTI7e5JdNu7ShM55gZC2RKC4SA0Q4O6I53EUVpQGHQQ9EOhMASwiHf88DlDBfzRSQcI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mW0tZMhSaetyG4D+/2DPQZ0SVjaxvyIVnvfCsq7/P10=; b=ievACJyW0Wm2Ui5N/oi+ajuDi3
 R/xH2FBeacuKfdT1E6bnoZW7aH6rcFWmNu78iawW1xvgASXEQ/OJesiVGC/yHdAVsK56WAXXCp29W
 0A0w9q6CbcujlNitaCckwUn7zi+51vsufWQXYweIh60scP7hpglGpUm3Vf7nIS3amcAY=;
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nopbI-0000Xs-Om
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 16:54:16 +0000
Received: by mail-oi1-f179.google.com with SMTP id r1so3413382oie.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 May 2022 09:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mW0tZMhSaetyG4D+/2DPQZ0SVjaxvyIVnvfCsq7/P10=;
 b=nPnln1EM6IFKFYOjU2Gck+lGStnIUKlvR+OkEkTwXYJYcz07fJSnnI+xt33uLCuPjU
 WYGpBMLkYyjsBU3z2pINn/fMt9Lus3bsbv96/BQxSQZ5fEz9YIybVOHYbZPymqslkHDl
 qaxny3KOnp7Xdc6qfEMQoFA9IRvhAgJw/0pfQ4FaknDpE/WpvNd2bbG95usy1JqPMnd8
 2QN+QPOM+sNJTXVp3SJ8TA+hmp7TNBC3G9pA6l3wVWtvwlAC9R+K2psiwceQcQgl6n1e
 RdfFtdYGAPxN1ku4mLWwVq4ZDyj1YmZYKPvy45K7IdKg8yxqikpHsB/FsKFKSbPfLbEL
 hv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mW0tZMhSaetyG4D+/2DPQZ0SVjaxvyIVnvfCsq7/P10=;
 b=3KBeHzR18cjC9IDIDTlZPtU6XbV5Xx3bQe4AGGn2TdtRxJS9qbzk2pwzUsfH/Vilfu
 80WFvr8GBgi7xNIHS7PEhT9OND/dfYPvdevGwNAd62Ckdy+QPaEbal7L8MoOFNlVU90w
 2D2OB6lOz/vNzFVCaY9g/2RhLC7YOG2uimser9V29prqk1zIgitUTylNTu7G58kK+S1e
 4dEptFt4sLPczG5/j6i0WAhCw5zs6hw05vK2mUqptUPf/czefonXLPVdI5lMpaalAVvg
 aBQMUF/cYldt5XKXMyElqpEbpxnYxviNEYTyBgSHUWf9t6Euad6S72ICT6hE/qI88qwR
 8wGA==
X-Gm-Message-State: AOAM533AzmaXPiQARIrOIgr3/GG8mvEPbvTQhPv2u5A387fA6pSG3Z7t
 XBcvdqBYpNN1/+jlZNAd8s/FSHSjvR2lrQo/zeLklmJ2+m0=
X-Google-Smtp-Source: ABdhPJzRj5A2cmCGUSIH06kXpMBYZbCT3UffjWY0qh676mZulcSqQOqyD4pfEIrkuMiQlQGkTeh5ImDkdVjVVMojL0A=
X-Received: by 2002:a05:6870:9725:b0:f1:1c3a:4a56 with SMTP id
 n37-20020a056870972500b000f11c3a4a56mr1039784oaq.112.1652287607142; Wed, 11
 May 2022 09:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <Ynu4CGiqiU4l2vdf@kili>
In-Reply-To: <Ynu4CGiqiU4l2vdf@kili>
Date: Wed, 11 May 2022 09:46:11 -0700
Message-ID: <CABdZyexoAEhiHF8aGZvfxjmRo7kFN7-ZPapEzd3zmKvUtm7KqA@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Oh, right. Thanks~! On Wed, May 11,
 2022 at 6:20 AM Dan Carpenter
 <dan.carpenter@oracle.com> wrote: > > Return an error code if f2fs_iget()
 fails. Currently it returns > success. > > Fixes: 3d7ad9c30607 ("f2fs: change
 th [...] 
 Content analysis details:   (-15.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 white-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.179 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.179 listed in list.dnswl.org]
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1nopbI-0000Xs-Om
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix error code in
 f2fs_ioc_start_atomic_write()
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
From: Daeho Jeong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daeho Jeong <daehojeong@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Oh, right. Thanks~!


On Wed, May 11, 2022 at 6:20 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Return an error code if f2fs_iget() fails.  Currently it returns
> success.
>
> Fixes: 3d7ad9c30607 ("f2fs: change the current atomic write way")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  fs/f2fs/file.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 79d1a20fbda9..cd768fadfd67 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2047,6 +2047,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>         pinode = f2fs_iget(inode->i_sb, fi->i_pino);
>         if (IS_ERR(pinode)) {
>                 f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +               ret = PTR_ERR(pinode);
>                 goto out;
>         }
>
> --
> 2.35.1
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
