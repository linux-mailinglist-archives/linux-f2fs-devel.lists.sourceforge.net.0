Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EFBAB2E4A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 May 2025 06:03:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMLHakJlAnH8FvK2Xm9Lfc5H3kX5d/PFmJOkf0wyE7U=; b=Q8wpO7kni3NlDGmsQn62XYL8Nw
	jlbMCkwt0KYV8qy+hCsckDn0PvbkMDTk1vw/WZURdhQ2h1d7cw6Q+h6Qb0QPJ0FhrW1NkGGWMRkwu
	dfih2VuOUkjv94xItdJ2OF+rjG8bO7I9QkHKhB7O/Id1k4rRvfbDSuGsqjmsynDIh9/I=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEKNZ-0000uB-M6;
	Mon, 12 May 2025 04:03:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uEKNY-0000u4-AP
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 04:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2smRvuIebMVJ4/hGyDYxaz934AnGGVkrxhFdtuSrryA=; b=EqPxPP6sc751EO9ZHrb/sCP4Uq
 TbQ3XDLLWDwjO9F+2KzUFTLIT9q47SEpX+KUQyckaJ6dhC/0fOf2A/c8JxzuE46Hlsx6gy2owMIaa
 mwbohM/7/I43KSQnEvfy5ttCXBzkoNYRbhF6SHdgFtJf2PznX1ZxmQu2KWQdTL2Axnwo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2smRvuIebMVJ4/hGyDYxaz934AnGGVkrxhFdtuSrryA=; b=aVXVdCqT1qONMihV9BsTwWuKbP
 f2atMI7YjDYLoYCzhhZfB+WEpjGYkvdrwzXLddiZUaj16eHpeuX/FG7JBi49dClmgZM+vyelpVxht
 0eby54pmmjO8t9TdtkZc5pOKujgyETl6w0fdv19VMFwgmYtRnlfZZFaDI0BZwwjm7gXg=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEKNX-0000Dn-QP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 04:03:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2FC7CA40309;
 Mon, 12 May 2025 04:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D69E0C4CEE7;
 Mon, 12 May 2025 04:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747022568;
 bh=2smRvuIebMVJ4/hGyDYxaz934AnGGVkrxhFdtuSrryA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=SlBXXbUY6iRVZgPJGzdsovw3xzuKZBLncmsrEtybFW5FukBr4S5U0NUxS50KpLX7R
 66zNzdxdvqdp/FFb/cgCJ7pPDuHcSAuy8Bzo5D2SZ1/1EriC/+hgp0UfVGQhsQaeug
 afYpLrpbbPoKzYWtq91P5g/nJTiLYsN6F7SzNNjkB1TjC/kxNPozDAdlQq2yrDZzHd
 cbkNFp6IfgqqKcs0WDvPeh64Bt7jJjDtRZ6gAaTBElQj6jjlhCt6vg8lGI4V0Iz7U2
 9LpZB24chCGV25t+W/Y00KHSY8uC0rbcFyAi9FQ8pazth/W4TF6khcxhfSUI+8r1oQ
 W73+S7dhpJL5A==
Message-ID: <9548f8d2-ead8-4176-8e28-ce3b6047bf06@kernel.org>
Date: Mon, 12 May 2025 12:02:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jianan Huang <huangjianan@xiaomi.com>, jaegeuk@kernel.org
References: <20250512033359.304795-1-huangjianan@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20250512033359.304795-1-huangjianan@xiaomi.com>
X-Spam-Score: -3.9 (---)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/12/25 11:33, Jianan Huang wrote: > Signed-off-by: Jianan
 Huang <huangjianan@xiaomi.com> Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-3.9 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uEKNX-0000Dn-QP
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: print errno for flag operations
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
Cc: wanghui33@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/12/25 11:33, Jianan Huang wrote:
> Signed-off-by: Jianan Huang <huangjianan@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
