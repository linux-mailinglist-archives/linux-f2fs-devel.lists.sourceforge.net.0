Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB2C1A2D93
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Apr 2020 04:20:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jMMnm-0003gw-NW; Thu, 09 Apr 2020 02:20:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jMMnk-0003gp-NH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Apr 2020 02:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5B3/1lxiR7tGX58dHoWRwHdYoLWjDQIqa2ei9mV0dXk=; b=EpgOVRBJDu/HP0VDIVqKI9/lKl
 xwCxBwIx+27Qi0glcUpmAkWsohHlG1NXJeapTCZU41idn+53FVej3X19e1ciw4AcueqCt1DbetY3X
 yHCC4FnYfuEn95Xl1VTrnBwlJWnjsHA/qb0fz0wo33qCNWtBnFvtOOLyFsBgyCbWwPGg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5B3/1lxiR7tGX58dHoWRwHdYoLWjDQIqa2ei9mV0dXk=; b=KQjWhigUamDmZozVylSJrqPGFY
 yXfu7q4P7qmWmZCnEvCsHRH9j+3EsBY8FEGTc8t0dGOaxGJKIe8yJQFa6++mrxSsgPBoie4Dc5iwo
 g8hVvizt+BXQF6EuLfr9oZnFKm+BkSgGLTRLjOVjGrF9HlqDd4kWElhCuFXVf/YBXEeI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jMMng-009DNj-Q2
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Apr 2020 02:20:20 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3BE0320787;
 Thu,  9 Apr 2020 02:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586398806;
 bh=iRS5nfmtHWdMeMQ5MMWQ1/T5MoTdMmVI2Mbi5yLgKhQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ACbBXXd38FtV4VhKl0MWHR0q4Y+e4IV7cslrqwoctBNV5vZT16q3K93cC0sjOYJod
 tPk8p1+2u9zCVFnSQv0R/xTEWctzYjj5vYSt915BjPzL3QXcyD9sybo+Tj6K5RfGg5
 +o0cSPAEOKYjeA8MgfVzMWPw8Vyx+5yHySijxdUg=
Date: Wed, 8 Apr 2020 19:20:05 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200409022005.GA110440@google.com>
References: <20200403161249.68385-1-jaegeuk@kernel.org>
 <0e627c29-7fb0-5bd6-c1d9-b96a94df62ae@huawei.com>
 <20200407025913.GB137081@google.com>
 <2ca452cd-073a-29fa-1884-99ad1199bb97@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ca452cd-073a-29fa-1884-99ad1199bb97@huawei.com>
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
X-Headers-End: 1jMMng-009DNj-Q2
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce sysfs/data_io_flag to attach
 REQ_META/FUA
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/07, Chao Yu wrote:
> On 2020/4/7 10:59, Jaegeuk Kim wrote:
> > On 04/07, Chao Yu wrote:
> >> On 2020/4/4 0:12, Jaegeuk Kim wrote:
> >>> This patch introduces a way to attach REQ_META/FUA explicitly
> >>> to all the data writes given temperature.
> >>>
> >>> -> attach REQ_FUA to Hot Data writes
> >>>
> >>> -> attach REQ_FUA to Hot|Warm Data writes
> >>>
> >>> -> attach REQ_FUA to Hot|Warm|Cold Data writes
> >>>
> >>> -> attach REQ_FUA to Hot|Warm|Cold Data writes as well as
> >>>           REQ_META to Hot Data writes
> >>
> >> Out of curiosity, what scenario it is used for?
> > 
> > It's testing purpose to compare the bandwidths per different IO flags.
> 
> Thanks for the hint. :)
> 
> As nobarrier was set in Android, so REQ_PREFLUSH will not be considered in
> this sysfs interface?

I don't see any diff on performance, so not interesting. :)

> 
> Thanks,
> 
> > 
> >>
> >> Thanks,
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
