Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F15C5B135D6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Jul 2025 09:47:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jH6908dmGyxR9gtPI+nizpDAmaRxKAPrAUme3l58KL8=; b=NeMb6iOqU6v9qH5gNr7NwzckHE
	2TU/GnMpItBhH/TNZpqvevDSYh6plMVnEquv5/uaf6k71rU83nKyOX1LqgStP03uV6NcepGOs2wDk
	mWRAgwqdWB9t5AasS6KE3OoioRVZpVqTG+792Xj4bSGxg2M3AIqL06RMvL299KjmTv70=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugIa4-0004Sa-Qy;
	Mon, 28 Jul 2025 07:47:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ugIa3-0004SO-62
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 07:47:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8qt16v7o/sDFNpBPZ5OiKFbPwmG1DhzsmNc0p2IvzFA=; b=lVppXBQKTFXmVvbH5ngvJGiyYk
 +mmdPaEt1M85kznxcGk0ByVMvJB8hlkQ0lucJh62Kw2QS0UZWxJS4rRYERDoO0DnlNSEpfxzKOKQw
 HLL/4+9+RbtkVxhWByFN1YJdNttvklRVui0Bfd9S020LpzCZRaH6/XRu1FXH2EDkHb2w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8qt16v7o/sDFNpBPZ5OiKFbPwmG1DhzsmNc0p2IvzFA=; b=IGXSU+RYnywnuJoOr5GwCM3Nan
 OMVc20O3zCY3GP54l5pMMrogjBe0DymuMyWMYz+l9h+35ipYhNPszbNqH7hFqqVjAacsLna7DvJh6
 feUMniMnco3tCeunzVMSwN/g5Z4IfRydC9W/x/yZTKRtz9wsgWg13e4MU4CfX0zCFnK8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ugIa3-0004EB-Ho for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 07:47:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1150D4583B;
 Mon, 28 Jul 2025 07:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772F8C4CEE7;
 Mon, 28 Jul 2025 07:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753688840;
 bh=igx3BzKiRhulOujJ8kiBh4dCLudD9fUfFdXzya6UUjA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=azJISXrWZFcPH/TwYUhUAwiJL0hB9W6hq4Ix56iEovmaKoOSkeCEu4CrtBsC2awnV
 YY49tYIYLjm8eiAMN3qH2uc362n+xbAwnKHYwOX9XCU/cAkbYps5E21K1Nz6NDBEVR
 xGLRoFqcVfv/r91n5a3cJ0mMHvu0GRG+2masFU4REgNrPeoErg8DnATh583q1Vx4WI
 5iMq8wd+wZ8IRFsXrnBIkAjqWE6lpQ2MnlzQNAyL7ALjmYUOxP6nsY6k8mKo5Z7VTP
 /t1OBYJd0gioO9mDvpWZxeCOjT6YBGghiXQBTXqbpAfFNl+5+kAf6ZKUlK4b360uvP
 fgYew0AO4iqFQ==
Message-ID: <8c9eb0b3-0297-4a86-a7b0-3d9d884fedcd@kernel.org>
Date: Mon, 28 Jul 2025 15:47:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250728050237.1563560-1-wangzijie1@honor.com>
 <20250728050237.1563560-2-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250728050237.1563560-2-wangzijie1@honor.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/28/25 13:02, wangzijie wrote: > When we need to alloc
 nat entry and set it dirty, we can directly add it to > dirty set list(or
 initialize its list_head for new_ne) instead of adding it > to clea [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ugIa3-0004EB-Ho
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs: directly add newly allocated
 pre-dirty nat entry to dirty set list
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
Cc: linux-kernel@vger.kernel.org, feng.han@honor.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/28/25 13:02, wangzijie wrote:
> When we need to alloc nat entry and set it dirty, we can directly add it to
> dirty set list(or initialize its list_head for new_ne) instead of adding it
> to clean list and make a move. Introduce init_dirty flag to do it.
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
