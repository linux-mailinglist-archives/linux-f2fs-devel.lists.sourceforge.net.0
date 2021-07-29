Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2D13D9AA2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Jul 2021 02:55:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m8uKZ-0006fa-1I; Thu, 29 Jul 2021 00:55:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m8uK7-0006cY-TK
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Jul 2021 00:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=epHRm1MPdCZ/8sEAyDU/l0p8OSyuJwUxffl4umSSVrg=; b=CVCajOO65cSmsypISk9nMgK4lc
 dtiasswgSn0maxTQN6tWvH7Rvr/6Jx9bYNcTOmgVk8AsF8Mtyq1KsLeLGAzlicxLZIX3TEVPa4jGM
 z0CM08+0BlciZPZXgw4Jmxf4bsfI/o1EqAZlFI/iZr5Y1ikMe4FUplRJfCepwuKHr0DI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=epHRm1MPdCZ/8sEAyDU/l0p8OSyuJwUxffl4umSSVrg=; b=dhq/sQwipk6alqmx8gVrsaraCJ
 ILOGcC1EYTrHoAP1hXM+NGbK4Xib0EkbDxBmCoEyrfD2fJ97h39rBWsvKQUIyvRJBE6SkVTvk4oym
 4mxZqsKobBb4qVd++amdibnDEcshnF7sDIT7s5fFk+ANbd4BT+Yh5pbEL4x9+jAuec2k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m8uK6-0007wM-Ln
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Jul 2021 00:54:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9EEC26101C;
 Thu, 29 Jul 2021 00:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627520089;
 bh=ySj2WLCx/U6vUSMi0vPV9bFB7St2XGwXoloT+C5A3Nw=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=SFP9YXncg5J/gGtO/esR7/KSWhcLNz1iJ5uG1SyKwNU7FtPsfj8o8gXd3BybRE4lF
 F9RpYK7o9OaHPVeBE82p8gZCA4coIrA2lTqV9gRrYygxFiHKdXIDLgLnRAaXZctbux
 s9eRq9YQn65n9TyZNVTHj7gBLxIRwgX+Ho7ajEEWjWkiKVKrxtMMBoqALXT3AMbulV
 w0MW5jgLNk4xWvOAFnCJw6YqxMMqmQA6R9aFuTwBERthv0KugWxLWSPgGiiX45FKrx
 XlWRpqJNzoJXiTsrPMPaqSnWjH3qtyS4OH3iCw3a2fR1zGp4LxH0kaBvPtV6f0GlJ8
 7MUmaPeW23Evw==
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210726161357.105332-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <26d8629e-ade4-43e7-b95a-073809d59936@kernel.org>
Date: Thu, 29 Jul 2021 08:54:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726161357.105332-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m8uK6-0007wM-Ln
Subject: Re: [f2fs-dev] [PATCH] f2fs: do not submit NEW_ADDR to read node
 block
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/7/27 0:13, Jaegeuk Kim wrote:
> After the below patch, give cp is errored, we drop dirty node pages. This
> can give NEW_ADDR to read node pages. Don't do WARN_ON() which gives
> generic/475 failure.
> 
> Fixes: 28607bf3aa6f ("f2fs: drop dirty node pages when cp is in error status")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
