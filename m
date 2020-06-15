Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5041FA0FA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2020 22:12:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jkvSW-0006jz-HE; Mon, 15 Jun 2020 20:11:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <keescook@chromium.org>) id 1jkvSV-0006jq-4H
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 20:11:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yrq+7tIQLTLfowElVM/LAUx+j6R1G8S30nvCECShhQQ=; b=cC2DluV1N8lqsFc/5tu6lFQ3Lj
 maa4mweccsE9w19cCJg6A9RsiIlAKwqy1hQ/tg6J5J3m6WsI0+5wIekuDVV5Ug9OwiE5+lk/T4nff
 jHPjoqJI4AireiyxtW8kBgJLy5+OWyJi8idiymq7DDt13oOE3sCs6RpV4u4MxGW0LRrg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yrq+7tIQLTLfowElVM/LAUx+j6R1G8S30nvCECShhQQ=; b=OM+7oJ/+McSpikVjNg0hihjduQ
 pG8Jz0acGqCdWfrljf8774tGvMfjdXuTqGnudZylXZBDP5TgIniZUnquNSacxrL+Br/pEAySbmFD2
 ybOXi4is4HtSJBv8xG8cFeHySleCk7jPiPvk/jOyJPk4HOm0QYDA6jAHkVMGFgwaVidY=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jkvST-0043dH-8Y
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 20:11:55 +0000
Received: by mail-pf1-f193.google.com with SMTP id 23so8288681pfw.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2020 13:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Yrq+7tIQLTLfowElVM/LAUx+j6R1G8S30nvCECShhQQ=;
 b=l6YV1FGo7TU7pAG9+qw2VIKRm2zpVhJYfNx5Q3J6oTPJYQgyGzOfcrhTa0eJoLKTfn
 6NfDhsnF08XkpsSWX1cIl04wPTRWtjc8sLkIwWt83YoJPjzvbq0i2dqsxkNArhbh3t0Y
 BD6QOc6aFvItzd5w5V1qKCCHaAGNorfpDSIn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Yrq+7tIQLTLfowElVM/LAUx+j6R1G8S30nvCECShhQQ=;
 b=pBc5xHOehMK364a4kVIxjcNeW131ONF3PG4blhXQy3JWZFUiOWxRVZkCsNjQXCq0wN
 G/z7yAMt0+YQrseMjZZTGI/+wNv4XoA+R7Rf55fP/vHx1FVOy4r6/n9wCq3dTCOVlIyd
 fqvfPP5RUEayA5fVfxAN5gvxHdvhi9JZf4kJ1v4kK3TMuYC+3HGLMA/Ani14dJY2vYBP
 i0BZICv8UubrAqDSDXrGjfiJWIGuaUiqjg07sL2k3DUKH9S+MabHOu4I4tWY7ttY0k30
 he/rDakiyF0hq7OvBMYyU19XVR4K7PR5TDoJvyivNiOVTlYg2CrFUHmGMSHrp9x2ZY8G
 A2KA==
X-Gm-Message-State: AOAM530Jhwu6bZaEeQ/KncpjYmUOv3XYY+APrnMg1yUz7t2p1r1F0gEu
 HRn3cvodNARIqVO39LQpYurXGw==
X-Google-Smtp-Source: ABdhPJwhR93Vg5Nwqs2HYvPt9tQ/0LeMR6QDPhfir7kLCDe1EmntTkidhoi/vgyMd2V+CJ/mzmlt1g==
X-Received: by 2002:a63:925a:: with SMTP id s26mr14310236pgn.21.1592251900590; 
 Mon, 15 Jun 2020 13:11:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id n4sm15282175pfq.9.2020.06.15.13.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 13:11:39 -0700 (PDT)
Date: Mon, 15 Jun 2020 13:11:38 -0700
From: Kees Cook <keescook@chromium.org>
To: Jason Yan <yanaijie@huawei.com>
Message-ID: <202006151311.138CD1D@keescook>
References: <20200615085132.166470-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615085132.166470-1-yanaijie@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jkvST-0043dH-8Y
Subject: Re: [f2fs-dev] [PATCH] f2fs: Eliminate usage of uninitialized_var()
 macro
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
Cc: kernel-hardening@lists.openwall.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 15, 2020 at 04:51:32PM +0800, Jason Yan wrote:
> This is an effort to eliminate the uninitialized_var() macro[1].
> 
> The use of this macro is the wrong solution because it forces off ANY
> analysis by the compiler for a given variable. It even masks "unused
> variable" warnings.
> 
> Quoted from Linus[2]:
> 
> "It's a horrible thing to use, in that it adds extra cruft to the
> source code, and then shuts up a compiler warning (even the _reliable_
> warnings from gcc)."
> 
> Fix it by remove this variable since it is not needed at all.
> 
> [1] https://github.com/KSPP/linux/issues/81
> [2] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/
> 
> Cc: Kees Cook <keescook@chromium.org>
> Suggested-by: Chao Yu <yuchao0@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>  v2: Directly remove this variable.

Thanks! I've applied this to my uninitialized_var() macro removal
series.

-- 
Kees Cook


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
