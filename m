Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A793DE878
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Aug 2021 10:31:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mAppm-00043h-Nx; Tue, 03 Aug 2021 08:31:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mAppl-00043a-DY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Aug 2021 08:31:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OHWun8Dj1CcwtIVWkrW+3HjY5MJeXrkLiGaAqMp3wpI=; b=UWpAYQFJvpwMpwpmMamRpt98Iy
 xtPwR/MWSuLOBG53c82wSJ5rXAYfvrHKdDO1u6NT3LKGo9DeM9Sp0RHhHTa6pPrYX+45Nmii1LX3R
 yuwEmefJY4iCtS1/4DDfKNHMtir6ZPL1bruxNxfuZ5ST1sOw6w27RUNUWdo2xRYXuY/c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OHWun8Dj1CcwtIVWkrW+3HjY5MJeXrkLiGaAqMp3wpI=; b=mkMRrIjh5LtEHgx7NSa6MYBn3Y
 kAwTp7BA9nv3yBxlFPYbnJD3xj64DQPjfzO3uaMRgfMvV/Etp45PFsQWY6BKEjfsvicAfu3xcdmCC
 GMUwx9lXPEE/m69jyFjKgKLN0XXNgKWU2MRo/NnNAq1BKx6PK/e27CJIFHFYCxiIrp9U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mAppj-0001UN-3h
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Aug 2021 08:31:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A916D60249;
 Tue,  3 Aug 2021 08:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627979484;
 bh=kaFiBCMyltN5FpAyAo2YUnCHUvxKizCTit1xdiH0r2s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=AZoz65hjBICpIy2wfNjGs7LizvOEARyYte6SP16y2QrehZtzH3KKtiw2MxojoO4fr
 ew9xBp/e8sTeSiVtvsRCtaNH8NzW2raH8lslTUU/nWBT/ardQQQoCHJQ8rAgt1yuou
 rxpNxJh4k6NrJT9kk5PVY60Fm36Gnc4QFk1bM+tZwGLSSvFfvJek1/FGbEjcAY9phZ
 2cwnYd9rWbbV2TTGVJP2QrV51C1koS1FV3MhsRMS/U3vCvENty0aoNtwIXuZA9fkVZ
 0fhbkLfspeE9zAxTyfEhQQIWtKh6Rg6r66oXzxZSt9GrCcg9CGnSXdQ3E5BJtPoTIM
 UkcR5if4FGv2g==
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20210803042245.2297259-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <e7683629-d862-aab2-18a1-4bee84acee48@kernel.org>
Date: Tue, 3 Aug 2021 16:31:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210803042245.2297259-1-daeho43@gmail.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mAppj-0001UN-3h
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add sysfs node to control ra_pages
 for fadvise seq file
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/3 12:22, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> fadvise() allows the user to expand the readahead window to double with
> POSIX_FADV_SEQUENTIAL, now. But, in some use cases, it is not that
> sufficient and we need to meet the need in a restricted way. We can
> control the multiplier value of bdi device readahead between 2 (default)
> and 256 for POSIX_FADV_SEQUENTIAL advise option.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

I guess you can add below tag directly in v3. :)

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
