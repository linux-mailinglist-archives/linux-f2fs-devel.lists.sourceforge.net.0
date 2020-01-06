Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D29131759
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jan 2020 19:16:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ioWvl-0005X8-8U; Mon, 06 Jan 2020 18:16:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ioWvi-0005Wz-Uk
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jan 2020 18:16:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IzCact7oDdkI+A9GlRmIgj2ScuRsDffITH23qNRr3DU=; b=Qm9/RLznvSPiQqb7di3h4hvrmO
 M39hP2XKvFDSA7PVFVdNAewsvBN7KN7Lu2i8lQwZM/BuYGi06a8/S3JqBIuDtEERhulE1M82/50a/
 JRVAtDLY5/QB85/+yoZIrqw5NOGZV3PDrT/aA1d0Hk45bVHb5tM43/mRjsctl6xcC54I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IzCact7oDdkI+A9GlRmIgj2ScuRsDffITH23qNRr3DU=; b=CiIjpqFyXX8g2AJKdzaoxstKAL
 ToFR+jYTs2n3JT0XTSUTZYoiagCEF9Qo/wa0dNeCfYUCZdXJthrPIvg+zWWHYe02KrBjEE06x3mSP
 WeXJXAw+ivYh1OECRleJZoJoQ+/6BFXXThhaT+B6pVg073wBv/5yZ8lwlJpDr/LWy8Io=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ioWvS-00BfgJ-TA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jan 2020 18:16:42 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4181D2072C;
 Mon,  6 Jan 2020 18:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578334581;
 bh=fH5EwCq6AaxG0YJmz1AOmBC/ME6Sk1bbhiEMQkJniao=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AtSs5ivBqHXdw6gdrjAdPCMS7A0vqxZp9kiT+HGjA5sUGpPt+F0jhro4LW0v235Vu
 QwSknE6d/4zCpF+cNlO2CYv9fDFMHFwNj+NIMhyMWDe3P2c92O2TiWtTuYcw6RCeyI
 AlkO+GqR0ktDZa75XjQi3xDU4yp6cY+GS8/xm1wM=
Date: Mon, 6 Jan 2020 10:16:20 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200106181620.GB50058@jaegeuk-macbookpro.roam.corp.google.com>
References: <20191216062806.112361-1-yuchao0@huawei.com>
 <20191218214619.GA20072@jaegeuk-macbookpro.roam.corp.google.com>
 <c7035795-73b3-d832-948f-deb36213ba07@huawei.com>
 <20191231004633.GA85441@jaegeuk-macbookpro.roam.corp.google.com>
 <7a579223-39d4-7e51-c361-4aa592b2500d@huawei.com>
 <20200102181832.GA1953@jaegeuk-macbookpro.roam.corp.google.com>
 <20200102190003.GA7597@jaegeuk-macbookpro.roam.corp.google.com>
 <d51f0325-6879-9aa6-f549-133b96e3eef5@huawei.com>
 <94786408-219d-c343-70f2-70a2cc68dd38@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <94786408-219d-c343-70f2-70a2cc68dd38@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ioWvS-00BfgJ-TA
Subject: Re: [f2fs-dev] [RFC PATCH v5] f2fs: support data compression
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/06, Chao Yu wrote:
> On 2020/1/3 14:50, Chao Yu wrote:
> > This works to me. Could you run fsstress tests on compressed root directory?
> > It seems still there are some bugs.
> 
> Jaegeuk,
> 
> Did you mean running por_fsstress testcase?
> 
> Now, at least I didn't hit any problem for normal fsstress case.

Yup. por_fsstress

> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
