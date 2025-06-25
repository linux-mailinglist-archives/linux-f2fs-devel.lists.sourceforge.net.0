Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7908CAE74BA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Jun 2025 04:20:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWnyII6m0Ag2dtPFj/wz4ThSXBY3Tmyn7cYYaQvMm5U=; b=FA9b9wxRLH4K99tSh0g6Smlnwt
	qP01GjCQqYoIC1OcOaKmm2eqUylVwhIy2LEBFLbfYmSDjNiqw4cQoZDZB7jZxBqoRp6s5/svtBGQT
	XKUcUAeB097Acut/sbpQttYTaegCAQHz7U/92iX8zpiBbJ1cf1IKDl3kNq4ricUY0gqk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uUFkN-0002UW-Or;
	Wed, 25 Jun 2025 02:20:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uUFk3-0002U8-Ka
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 02:20:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=omuxE7p1J8jjP0sXAtdWES0+dzbBH8RJ7xyoWGmrZc0=; b=iWGUKQBrAiiOp7FNorsR2GGvTU
 Df6hynnXtf42UvvOETvw70ZNQoOwiYIMPs7ph6Agyhg5QIuh1Cuk2ouCYQ/QHtAKq+5OV+SengwvI
 Uc6nT41CPmwVjZJMJFxXLa8hr5ZSTD/MZzZO0c39FAWHsUQ3HqDNjS4EWXZYLQGzJp0k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=omuxE7p1J8jjP0sXAtdWES0+dzbBH8RJ7xyoWGmrZc0=; b=arZxnvialYWf4bvhvqnuhVGjY1
 NljiXc+uuOEO+UXtDPi87B+oBxdzpzZgbDUFg1EWdm/GJGr5xlVVlAOfZnulvxLrI5mHOWAZhQJ+H
 TinLgDshBbUmZEgVcCjVyEjPhuDDWa842lnO9+/Zx9irQBT6RS/KgQOGxViNrxjNGYsM=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uUFk3-0001y1-73 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 02:20:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7E13FA5240E;
 Wed, 25 Jun 2025 02:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E97C4CEE3;
 Wed, 25 Jun 2025 02:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750817997;
 bh=sUlXBOh/RWWAZudBpnTBpz6oydGeyM6tmekluLDS8kM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=D75KGG22sNrrXwO4nKe9OBj2PSKSK3MvKPCOmzJ/dcPHeauaFTMriV90/bVOYmg2w
 DBmL1WWCGFuDy3t3V90MVkgl+czeKoIne+GiThedV78spFTco9nfrbQ3uY0BHYQU0A
 k76oPP/nWZpgDXVgFfiW23GY74CGN7ONr42SD3hUy6n74m/LNIiEOH88Yr2ikaSpth
 LHQ0oSbCj+WDuF6YV7XCOjLU36pscxxriH5b/sRL74CLdAv3ajdmk0XM80uFOWO3cR
 O2odFpjKyolHHAfs+mFuO/v87Cwp9uhaf+BytvuUGRFlm8khCeK0iBAU0S8NCemcPF
 ddw6ZU2aFvQUw==
Message-ID: <d598f60a-a276-4033-bb26-08ac74c28042@kernel.org>
Date: Wed, 25 Jun 2025 10:19:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org
References: <20250625001336.1937-1-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250625001336.1937-1-yohan.joung@sk.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/25/25 08:13,
 yohan.joung wrote: > to allow users to dynamically
 tune > the boost_zoned_gc_percent parameter > > Signed-off-by: yohan.joung
 <yohan.joung@sk.com> Reviewed-by: Chao Yu <chao@kernel.org> 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uUFk3-0001y1-73
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: enable tuning of
 boost_zoned_gc_percent via sysfs
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/25/25 08:13, yohan.joung wrote:
> to allow users to dynamically tune
> the boost_zoned_gc_percent parameter
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
