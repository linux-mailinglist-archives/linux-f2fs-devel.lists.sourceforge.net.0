Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3F12498F3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Aug 2020 11:01:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9EPk5a0fPW3on1mshEx2nCL+wYYXbZsC+vJx2yCxdg8=; b=mPUd5zBG67wXNLHZD3lYMcOUH+
	lD475vWTk12/VccTu/nR8Sl8AHzhu96SJh0C36Mm9SYxpL1V/ENlxNy/zCBowfT9gEGGE8WPbWSJk
	b1yF7eje+AtDzXtv+Bt6Bp3Sy3SSmT8k9Lasmve0Wl8m+y0fM55MSbZoruLehFfL6yUE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k8Jy7-00032K-Nl; Wed, 19 Aug 2020 09:01:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tcombes@google.com>) id 1k8Jy7-00032A-Ch
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Aug 2020 09:01:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DKl+ZuirhDPBLRjVVbylZfRy1YySTcbohoiuShlTnJw=; b=FHWfn+xF9ZoJdbU4cbzyVnOLQ6
 ctpklMoEbWZ1dwODH+qjh1wgXyIX1LtvZHfaGasa/MGXsKylOI3pvJcg+xtx1HjyCLnnKKXj38dkF
 ry4zx/1b72MGQcvnd04LeZSbk6RtCgcXuIby7bmgZvobVARAce0eTj/SOyB6TEvBU8uE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DKl+ZuirhDPBLRjVVbylZfRy1YySTcbohoiuShlTnJw=; b=GVku4u5IiMCMeAIDEt11fv+ZMe
 wxhRhEQWmFWa64DrmP4h4iqbSD9tbxvEkKj2sbJfo1KOIvEHNZaaiCqPfiPo6kEPzP6WiPrV0GahL
 XiRzrfh+suZfrMFjfvHM8rcQDmVJkvNe4Kgko00AeQwmNP97Zj5VMvUYsnakY+c8uufk=;
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k8Jy6-001AvR-5x
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Aug 2020 09:01:15 +0000
Received: by mail-il1-f194.google.com with SMTP id v2so292311ilq.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 19 Aug 2020 02:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DKl+ZuirhDPBLRjVVbylZfRy1YySTcbohoiuShlTnJw=;
 b=PKwTGfOoWmzd49WpUaevhovgjG/UvDYpffoArUNPkmZO9swHno59fkXCxEUGc5N88v
 lzOsQ++MqkYBsdf1XcsQTr4KNyEDKQjAJvluOdUmbhZjbNJPisKIy4TogAYrg6P6ajNq
 0iQhtEyLW8ND5k0jOZILkLyr861I9d+gZQ5jySe9FvLglcdQna6T2qAe1P3nDktdHegL
 DtuUVuE0WLtTPLitm+f5AD57vh7fFpuUjlZDbzWsH+Rq5oEsVjCNIFzXczG1TCudMC+K
 aZJPcM/6hGcRIRrQDz0ppRE10GmQlFWGTlzMUv2JJ1NA/6iCBMTir+vxdcFxsDFQpWWr
 Tkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DKl+ZuirhDPBLRjVVbylZfRy1YySTcbohoiuShlTnJw=;
 b=t3Fg5Us7K9ulqPPf+IGUqtS3/Dg4wlok73OH1OTnBNWSP52cfh8U7jzn3kKPnaLh06
 YK3PhFUbnauKBxbWKSqa9fDVz46ShLhpLXt9BdhNaZYTP6dy55qTXczN2pNZWK35xDDR
 lXAGfBRLmjpiScpQ2WXMssTMoX9LZGlC/E+6/TbxypyCR2CWYeCUR7movB03iH2XYoV7
 NLPbejMdE67kmQG9XNPnDzRHcF2Pz3Pp+rdWN1oRsMU2WwGss2GilVNy1CIYBKq7BLF1
 oAyYhM/SwglC8yvdBKYGIBHv/vwF4GDDzqoj67NFbkPp1hWR1N0PeAJxRQqndQ3IQTEq
 h1MA==
X-Gm-Message-State: AOAM530bsjpRGENpHy6MBB64wXOzUnri4idxSjTDcYMm0UydUjblI0GW
 Rm171R0MJnbsPb79gixGJegJokCwVn8KLJNNPSaE
X-Google-Smtp-Source: ABdhPJybQkHT6HjnGscex9B9/mIQLDzWJT639EDAapluKKubCTzLAYU38jo9/R7/gmjUgXmVLCtR4yAzrzAXV15rAEU=
X-Received: by 2002:a05:6e02:587:: with SMTP id
 c7mr21859073ils.84.1597827661170; 
 Wed, 19 Aug 2020 02:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200818111850.3288644-1-tcombes@google.com>
 <fdf38720-242a-fd09-b838-186575a0a0d7@huawei.com>
In-Reply-To: <fdf38720-242a-fd09-b838-186575a0a0d7@huawei.com>
Date: Wed, 19 Aug 2020 11:00:50 +0200
Message-ID: <CACGU_wDM7kjfGDFdyon1=XJH0U1oZAV4MhSKWB9+RxRE8kT7Ng@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.194 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1k8Jy6-001AvR-5x
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: add -T flag
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
From: Theotime Combes via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Theotime Combes <tcombes@google.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 19, 2020 at 3:51 AM Chao Yu <yuchao0@huawei.com> wrote:
>
> On 2020/8/18 19:18, Theotime Combes via Linux-f2fs-devel wrote:
> > T flag sets timestamps to a given value
>
> I'm curious about why do we need to configure timestamp of root/qf/lpf
> inode.
>
Thanks for the review.
It is also for APEX generation (see my reply to the fakeseed thread :)),
we need to have a deterministic output when we generate an apex given
a set of files.
Configuring these timestamps is the other part of solving this problem.

> >
> > Signed-off-by: Theotime Combes <tcombes@google.com>
>
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
>
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
