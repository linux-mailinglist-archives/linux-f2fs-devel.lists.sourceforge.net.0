Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FADB8025DE
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  3 Dec 2023 18:08:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r9pxb-0001ft-Mb;
	Sun, 03 Dec 2023 17:08:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hsiangkao@linux.alibaba.com>) id 1r9pxX-0001fk-GQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Dec 2023 17:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FowQ/5sWrP2WT5J/Mx1Lbri0pmb1bWbatWSIzB8moBY=; b=T0vR7V1eRQjpiXUP34JYavdzNX
 xAQocrLSNtQA8jzs6i3hiaQ9wbWkcZr2LGDsxh/cww0Lb5DfN/whc48Z2tn0lFOgbgyY5IY1OkXCO
 y8ULrFSqm5mfLCok3F50xJwHR82DBUOgG+T6LqseQMuHlt4wGJaoA0n1pYvCABkAy9ok=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FowQ/5sWrP2WT5J/Mx1Lbri0pmb1bWbatWSIzB8moBY=; b=GXizPz2/lUVTnj8iJh+TI9xEbO
 jX42s1zfgiNc+bNyLpUmpfWh262lk4faWLXUcMEgzrzLk8RwODbq/WpaDWeOW+FephgdliaYGZ2Cs
 BzeUg7+FSyAh2z/1iNtz4Aa0DpXGNseAVi+ovHPT4hz0VVkXJjZLa5jOOVPuCOSc4a7k=;
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r9pxW-0002LF-FU for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Dec 2023 17:08:48 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R411e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VxgSxzN_1701622352; 
Received: from 30.27.64.151(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0VxgSxzN_1701622352) by smtp.aliyun-inc.com;
 Mon, 04 Dec 2023 00:52:34 +0800
Message-ID: <5a0e8b44-6feb-b489-cdea-e3be3811804a@linux.alibaba.com>
Date: Mon, 4 Dec 2023 00:52:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
To: Juhyung Park <qkrwngud825@gmail.com>, Gao Xiang <xiang@kernel.org>,
 linux-erofs@lists.ozlabs.org
References: <CAD14+f2AVKf8Fa2OO1aAUdDNTDsVzzR6ctU_oJSmTyd6zSYR2Q@mail.gmail.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <CAD14+f2AVKf8Fa2OO1aAUdDNTDsVzzR6ctU_oJSmTyd6zSYR2Q@mail.gmail.com>
X-Spam-Score: -9.8 (---------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Juhyung, On 2023/12/4 00:22, Juhyung Park wrote: > (Cc'ing
 f2fs and crypto as I've noticed something similar with f2fs a > while ago,
 which may mean that this is not specific to EROFS: > https://lore.kernel.or
 [...] Content analysis details:   (-9.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [115.124.30.118 listed in list.dnswl.org]
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1r9pxW-0002LF-FU
Subject: Re: [f2fs-dev] Weird EROFS data corruption
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
Cc: Yann Collet <yann.collet.73@gmail.com>, linux-crypto@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Juhyung,

On 2023/12/4 00:22, Juhyung Park wrote:
> (Cc'ing f2fs and crypto as I've noticed something similar with f2fs a
> while ago, which may mean that this is not specific to EROFS:
> https://lore.kernel.org/all/CAD14+f2nBZtLfLC6CwNjgCOuRRRjwzttp3D3iK4Of+1EEjK+cw@mail.gmail.com/
> )
> 
> Hi.
> 
> I'm encountering a very weird EROFS data corruption.
> 
> I noticed when I build an EROFS image for AOSP development, the device
> would randomly not boot from a certain build.
> After inspecting the log, I noticed that a file got corrupted.

Is it observed on your laptop (i7-1185G7), yes? or some other arm64
device?

> 
> After adding a hash check during the build flow, I noticed that EROFS
> would randomly read data wrong.
> 
> I now have a reliable method of reproducing the issue, but here's the
> funny/weird part: it's only happening on my laptop (i7-1185G7). This
> is not happening with my 128 cores buildfarm machine (Threadripper
> 3990X).> 
> I first suspected a hardware issue, but:
> a. The laptop had its motherboard replaced recently (due to a failing
> physical Type-C port).
> b. The laptop passes memory test (memtest86).
> c. This happens on all kernel versions from v5.4 to the latest v6.6
> including my personal custom builds and Canonical's official Ubuntu
> kernels.
> d. This happens on different host SSDs and file-system combinations.
> e. This only happens on LZ4. LZ4HC doesn't trigger the issue.
> f. This only happens when mounting the image natively by the kernel.
> Using fuse with erofsfuse is fine.

I think it's a weird issue with inplace decompression because you said
it depends on the hardware.  In addition, with your dataset sadly I
cannot reproduce on my local server (Xeon(R) CPU E5-2682 v4).

What is the difference between these two machines? just different CPU or
they have some other difference like different compliers?

Thanks,
Gao Xiang


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
