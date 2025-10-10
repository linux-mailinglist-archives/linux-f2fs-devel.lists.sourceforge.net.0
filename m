Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F93BCCBC8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Oct 2025 13:22:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=daor6q/RH5QO8AzHKpZWY5V0swg/f+5nthEv06a9xVs=; b=dk0AN9WcEFdV5HjyCu3bsU98++
	xDMTgBNGgdHurw1IkSMuESSj+V2pG1XOWJD6rMQa6xB4adeOIb0wXJcpzUBRyxm86/v7TNYUbXyF6
	+ivO08/gLAsvAvAHJ3R3/XpyjADJmpX5ttvwyanviMUO9cfNtL9vBh0B9Kc1AyfixQus=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v7BCg-0005bq-KE;
	Fri, 10 Oct 2025 11:22:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v7BCg-0005bd-1Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Oct 2025 11:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qi9/CuMjzaZp3nLmFDWzDRgHJ7B1hTDxK2PhfrZYIPw=; b=i8HHT3vGCaic0UROz9X/YkZ4rn
 PimX6fDv62qaCoXAQWsodX8pQugrD0hSCBv66h7w7x4wngd/f3A1cR9jJmqV57a4n3iArOJ05EYEg
 pPJ9107Ahnj9fFObbEJDAyyllK94b1pRvCCPMiEkVCSv/hHT5QGCYiIVPzM0lKwkJK5U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qi9/CuMjzaZp3nLmFDWzDRgHJ7B1hTDxK2PhfrZYIPw=; b=huyciwKn6utSLriFYjpO/IjNwU
 jzwkpj9V40qkTUQsMGCmmnHuoixwxV+NGl75OO3C/0+/bAex3YEXFT2AxCWH2kO8PS78CAsRAOGxA
 gpIxt0Qzjz7/B5bIZX5XqtwkIpapRzMt1tHhpK4HXBe/H7Wip/Wtu9Y/O585YS42aRTs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v7BCf-0001l1-LT for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Oct 2025 11:22:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CC7966028C;
 Fri, 10 Oct 2025 11:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11799C4CEF1;
 Fri, 10 Oct 2025 11:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760095343;
 bh=ipDFmTZaSzTUHl8DLEVjC9m2bvCsB+Elcb4FVEuSNYI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=QgV4fAzf4CKD/BUuqB1aLHDeP2Pn+8ah410jvVwNwjW0o4RRbFUwe1CgqmINLX4I5
 OGhg1yLuj2moTJAqxGBOLaqCjQbpYohg8d05v9XOazJaRz6h50I0vt0l221k5vCD81
 xWxlwSG9r6y5QchxohIOZpo4gffP1JNJTjiI9MJKALDwg6SP1bd6UKE2mWtkoRc8ux
 vgcm0C6rAfGsIyVPh2MxMbT3wV7auWa+HtzFT98gdWEWhkx8SScmAMbB+shzmSXfwU
 396TAmPKOJ6guf2zTnkGgVa8EOZfl94IMVdltZeyu4tNC0dRneQnK2n/0ruPjPy0mS
 +D2cqXXYzB9pA==
Message-ID: <1a46c78e-86b2-4e26-971f-c7716143f6af@kernel.org>
Date: Fri, 10 Oct 2025 19:22:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jiucheng.xu@amlogic.com, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251010-origin-dev-v2-1-952a3c98cd9c@amlogic.com>
Content-Language: en-US
In-Reply-To: <20251010-origin-dev-v2-1-952a3c98cd9c@amlogic.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/10/25 18:45, Jiucheng Xu via B4 Relay wrote: > From:
 Jiucheng Xu <jiucheng.xu@amlogic.com> > > On 32-bit architectures,
 when GFP_NOFS
 is used, the file cache for write > operations cannot be all [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v7BCf-0001l1-LT
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Use mapping->gfp_mask to get file
 cache for writing
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
Cc: tuan.zhang@amlogic.com, linux-kernel@vger.kernel.org,
 jianxin.pan@amlogic.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/10/25 18:45, Jiucheng Xu via B4 Relay wrote:
> From: Jiucheng Xu <jiucheng.xu@amlogic.com>
> 
> On 32-bit architectures, when GFP_NOFS is used, the file cache for write
> operations cannot be allocated from the highmem and CMA.
> 
> Since mapping->gfp_mask is set to GFP_HIGHUSER_MOVABLE during inode
> allocation, using mapping_gfp_mask(mapping) as the GFP flag of getting file
> cache for writing is more efficient for 32-bit architectures.
> 
> Additionally, use FGP_NOFS to avoid potential deadlock issues caused by
> GFP_FS in GFP_HIGHUSER_MOVABLE
> 
> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
