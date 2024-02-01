Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 069908454EF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Feb 2024 11:12:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rVU3t-00017w-HR;
	Thu, 01 Feb 2024 10:12:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rVU3r-00017q-WD
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Feb 2024 10:12:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1d8WP0xnOyw3b2o47vf5kpY8XxNP/ZHI0i1kQ0mBEAU=; b=X/hGkg/lClPSSzVpwVaMmSoar8
 +0Nzi/2+jLEIUlf4aoDYiB8wUyTO+Xz9OOcqe5zsgkqKZF9nFMRh4L51oDkbXZiO9FFxVeAVO0HKs
 +S3RRLGZSMhW8KeFKvHDpt8r33K8Gkwr9asgWTfUAfM4sa6fxHVoco3EhdvpJUGIjEgc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1d8WP0xnOyw3b2o47vf5kpY8XxNP/ZHI0i1kQ0mBEAU=; b=f4ECHxD0c4KhH74xlawbfHDs0m
 FGfjDhTNNXjDcpjqdV+bx/s+d5JIiQemUXHXBlc2WzMw6qNbGi9XXZVYAqZFUwraZiu+w42AMxLXR
 KfoBRgbmBvcgC5lmQ+1d5Z7GPEXmnam2YKKOdRgZxsil4WSIJaYLCxDiEpl+zk4GAEFE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rVU3o-00041i-P4 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Feb 2024 10:12:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 10ECA61625;
 Thu,  1 Feb 2024 10:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D16C43394;
 Thu,  1 Feb 2024 10:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706782359;
 bh=xgv/7hDr2uvhT7hu1oZd6ibQtw0XJlZmREdi4If0dxE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OeBRUtQjoGkGyIx+UPEsbNTOt5bobSGpbkfynd/vSy173VNN9xUKOwntk2GOFDXEX
 lCe4+Z48NGrn2/YWiSskdNeCzGGp2xdzT6uP/qtfwOAGM46sodToE38Lf+7bJTL8lW
 N+NNhsPYx1RCHrzO/M0qlxcVt9fUVhoKrmo6jEaovFJGkh+0Zmdei0Tv64aO0i15nt
 f6cMVU1n7spLN58C8YCLzRKibb2BN54pNcyn1w4I6SJDD8bfYYDkfjAYZNwgTCj+T1
 IFXEdEkrfv8lhOKkKocK8Cmbn3zUK66WVosQO3gXN6RTdNvO6vTR1fC7oeFFBeTrDT
 V/UbQUaywzqbA==
Message-ID: <e7809d8d-a8da-483b-a52e-cb3ee5583db8@kernel.org>
Date: Thu, 1 Feb 2024 18:12:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240131183306.536372-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240131183306.536372-1-daeho43@gmail.com>
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/1 2:33,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > Make to allocate logs after conventional area for HM zoned devices to
 > spare them for file pinning support. > > Si [...] 
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rVU3o-00041i-P4
Subject: Re: [f2fs-dev] [PATCH v2] f2fs-tools: allocate logs after
 conventional area for HM zoned devices
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/2/1 2:33, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Make to allocate logs after conventional area for HM zoned devices to
> spare them for file pinning support.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
