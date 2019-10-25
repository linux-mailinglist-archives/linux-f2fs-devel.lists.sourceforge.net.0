Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D70E422F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Oct 2019 05:52:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uP7qwPTYkNmuKDh+KslwFSEJtyWhxvVioCqavpNtlTs=; b=E8b6ifP3tpEzhiBvO8ENeh9R7w
	RW8brI2mllaMXvdAIwVGZSFlP5STsuZyf58mOfUapqD2WixslWcIrW69Vyi+v+8CH9FiMlnu68p1O
	Ov+Ji1gCXW0rjWRKH298vSZ/L+zwit3Q/vqJE2XE1JiNbQ6xgjAtznW4ah728X2vurKE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iNqdt-0003jy-2Q; Fri, 25 Oct 2019 03:52:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hridya@google.com>) id 1iNqdr-0003jr-PO
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Oct 2019 03:51:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ABWD4JUlwawnG2qiFtveO+db3hIzWEPH+BypeNf0bRY=; b=ArqQkjREARHpf35cq1NUdCf4W4
 b+tQxe4qT4tM7RyhkY7SBKGSDv58CPRfSSrF+A33E6HVQ/HxDT0oqdDly+2DLUvUVSg4i60EJbrO9
 OPK5p6we8jeMpdkZB4T2nr7U+aHpAZiYSZeFWDNjySomrMSZ1H+7ZkBG2R/85GMY+cgs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ABWD4JUlwawnG2qiFtveO+db3hIzWEPH+BypeNf0bRY=; b=ExnjMxge8CDrrUyvulQ5Sy+KlW
 NP1iHlpBV/kXUe88KtecyLxWcz5hYQMSx8o9XnkAzADPZT/aLIoLTYOKA1WjaUwQ9MAubSmcRVBhU
 O0+E7Ju7IJVF1hpBj9T4OpiLcebARdPrk8NPt3wlO/2RTcLokK/s7ppWDSBSg+TJ6ZnA=;
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iNqdq-002yNp-F6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Oct 2019 03:51:59 +0000
Received: by mail-oi1-f193.google.com with SMTP id i185so539518oif.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Oct 2019 20:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ABWD4JUlwawnG2qiFtveO+db3hIzWEPH+BypeNf0bRY=;
 b=Yq7HXJZBl+RA4hgkn6HB0lx+lYHPMmKUAVjvxLn+ZL4KAGdNHXsCfTq6DmV9AGIl+z
 kJjLciMvGivbyOB4ExC7SRjS8/IZwaNeV0r6/HFwY9bQdYGCDfTjDpKxb3SrC0uyw9vG
 zoGfp8OJE3jCJPciSrkAp+je6+CbM6uMfF1gRE3J/3VNsmb0p06VKmHIiIGGRHOImgZI
 D6WEr+riL1TOBpypwSw2J4tHpGeq4+huDYNELUPtQocL71Cjhs0cY01cf/iqyRPvqhem
 khUOjCy0Mp5/7aMXX0oQJ1R3LF5EChHfQVSEU49ZAxFexYR7RR6I+jH6WFm0TsHqzAug
 eQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ABWD4JUlwawnG2qiFtveO+db3hIzWEPH+BypeNf0bRY=;
 b=goGYtb2dB4gXhLARqoXMPPAefBk8tq1YMVoHkiFony00S0hlJa1HB0y3EyrrDcHmsC
 F2Z4C1+W/5c2S19/eSitTQruqAa73mesXAlVWSnO5f+t30UvdMDDvEcArVcOZGDib1Hr
 ngrhlkV++jy+GGP+cvx30bcevQz4Fzk8X9hM8/bjbyKYeckNJ4IiSSTMG7ZyOayC1W9P
 y/5jaDNkXVfOOWd9LO6+iJWqUfsHRp3/+4l1DFf4Pv11Db09eUrHa9JLIIpC/rVKuu4L
 baWaA6n1+6baGY3kwVl1yuEOxfcq5HEMwPssl0m5fvyj6NeCclgHFjb4lZq9Xb+xqGBA
 CB+Q==
X-Gm-Message-State: APjAAAX/9p+pCrDP+lCBYDogAQ3cy/lCa1DWIgCLM3zon6+SeMOx/WfZ
 NOOmkvGCjFBv6TaUxVuT+wZauag8Wtd3u6j/AiKaXA==
X-Google-Smtp-Source: APXvYqwp9zH01jLrvIbTsVmItix9HesiPp94IEFA7G7RNVJ8AV+W8rh1y9KxtIERGkFBYLMjB+kKorgQ2RgVKNzjic0=
X-Received: by 2002:a05:6808:1d4:: with SMTP id
 x20mr1174301oic.36.1571975512248; 
 Thu, 24 Oct 2019 20:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191023214821.107615-1-hridya@google.com>
 <20191023214821.107615-2-hridya@google.com>
 <e61510b8-c8d7-349f-b297-9df367c26a9f@huawei.com>
In-Reply-To: <e61510b8-c8d7-349f-b297-9df367c26a9f@huawei.com>
Date: Thu, 24 Oct 2019 20:51:16 -0700
Message-ID: <CA+wgaPNas7ixNtepJE_6e7b6Dcutb9a1Who4WrUfKSw1ZnQhTA@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.193 listed in wl.mailspike.net]
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
X-Headers-End: 1iNqdq-002yNp-F6
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: Add f2fs stats to sysfs
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
From: Hridya Valsaraju via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Hridya Valsaraju <hridya@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
 Android Kernel Team <kernel-team@android.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Oct 24, 2019 at 2:26 AM Chao Yu <yuchao0@huawei.com> wrote:
>
> On 2019/10/24 5:48, Hridya Valsaraju wrote:
> > Currently f2fs stats are only available from /d/f2fs/status. This patch
> > adds some of the f2fs stats to sysfs so that they are accessible even
> > when debugfs is not mounted.
>
> Why don't we mount debugfs first?

Thank you for taking a look at the patch Chao. We will not be mounting
debugfs for security reasons.

Regards,
Hridya

>
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
