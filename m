Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 925D53D4F60
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Jul 2021 20:01:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m7iRb-00027U-46; Sun, 25 Jul 2021 18:01:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1m7iRZ-00027H-NB
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Jul 2021 18:01:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=msKQ57fcuro8JEUiq5hDhPkGQc5QIJyPOwDsfIc6Uhw=; b=RWGXvSpa7YaVoRI5OWzQZeHbK6
 YOAw1vnmQMiCl76OOxGmCnLgo8pmE9KqLG+ElkQkK+O1I1Y4XSR9OyNXFwEMtm3P3TakEBBkWPOV0
 RxkBG3ufbF9Qh+tNxosggs7dQYEZSKwmweEQ1+cvvpHH4p8sVMR2ozRRB55CaiYqUYvM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=msKQ57fcuro8JEUiq5hDhPkGQc5QIJyPOwDsfIc6Uhw=; b=JR1jKym/UtIEh47uD9OXVfXtAr
 owMj3TUR38P0jZWS5XrYEkhrzLnNGsotZV9m8gFspkj4vz/i33/iYfgJS4fj3Q7PBDcaNjM3GNtgY
 HiofKXBKRBn0S+tTideqnvkTN0GfqoKLFrnU5Xk3X5smfG18HPFKNeLz9TJAn+CTcX/E=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m7iRO-002MKl-M9
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Jul 2021 18:01:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4717F60F23;
 Sun, 25 Jul 2021 18:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627236080;
 bh=DtWHvujPpIyKQBeKaHt8GyF9Ra/WfsnZ9uWNGMPtLUQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PLXAqHurm5qcA+X+pkwFg3SdcE9mo8AZnLFp/x1TEtMMB7CRs82OJYR8nk5X0eMpN
 vYq1pgwvaeoxLtWkhaPOsgm9Oq/t6lRShpGpj/86vxkuI6uecFj0kRBMIYLLo3iPoy
 ES/OVOsudcH5LV+RYseLdWuFJ9wtnCI4YMW0McEEyAhm/LdQLqgylPvMHCAi41a6Nm
 Yrso8PW82FDu6UOiEbNuU/J0397yakkLlE0iBqumuzNObmaB0NOQrG/aRsuvOe2VVy
 U5V2VN2v07qy5FuXQSnFA7fAGWsVSrtqBoNXeIVv0FGOLZ047WS7kYT+B4TzpU9hSv
 ml+hBuh1zqhsw==
Date: Sun, 25 Jul 2021 11:01:18 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <YP2m7lSqvenvxYIY@sol.localdomain>
References: <20210716143919.44373-1-ebiggers@kernel.org>
 <20210716143919.44373-4-ebiggers@kernel.org>
 <YP2Ew57ptGgYsD1Y@google.com> <YP2Hp5RcZfhKipfG@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YP2Hp5RcZfhKipfG@google.com>
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m7iRO-002MKl-M9
Subject: Re: [f2fs-dev] [PATCH 3/9] f2fs: rework write preallocations
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
Cc: Satya Tangirala <satyaprateek2357@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Changheun Lee <nanich.lee@samsung.com>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Jul 25, 2021 at 08:47:51AM -0700, Jaegeuk Kim wrote:
> On 07/25, Jaegeuk Kim wrote:
> > Note that, this patch is failing generic/250.
> 
> correction: it's failing in 4.14 and 4.19 after simple cherry-pick, but
> giving no failure on 5.4, 5.10, and mainline.
> 

For me, generic/250 fails on both mainline and f2fs/dev without my changes.
So it isn't a regression.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
