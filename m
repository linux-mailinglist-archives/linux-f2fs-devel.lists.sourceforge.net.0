Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C7F8B671D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Apr 2024 03:04:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s1buZ-0005sX-5s;
	Tue, 30 Apr 2024 01:03:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s1buX-0005sQ-Lp
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Apr 2024 01:03:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nb5RipBKYp5U5dLcbxdGa0n+tTYxIUo6H7x/LI1sM7M=; b=kD+GPnUKPsavn8nHMLIqienusa
 MzBS1dnUNuwRsgMgzcKN+4knYE+R5wZ3JqFVE5tiqoytdi9yPIfgmzTCVBsraTnFbJMZD42BUrql2
 0Lf7YuHDfM7SeDI9uX5ImFIiytxcAFX76gi2CKnIpiAsOpHWzCayXhUeI1d6tErXD/qc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nb5RipBKYp5U5dLcbxdGa0n+tTYxIUo6H7x/LI1sM7M=; b=MDGFqCR3av3wkEfJgefp+b++mU
 y/IxSo8Ya/CuBG03NbKT62/OEgShvaBbG9ewf9Bb4/WLnzUe5mk/Yo9KfMwgixE2CG5a77txsFGck
 tHfTsu7qBGp+9JG5U2KLjzjgXrBHNehnvBG/MxqVYB1nacwu0FNejclNHtvEcnrtZNGw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s1buW-0002cl-Ub for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Apr 2024 01:03:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0390A61152;
 Tue, 30 Apr 2024 01:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFE5C113CD;
 Tue, 30 Apr 2024 01:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714439026;
 bh=PAF4WJyIaNmkSTXqrUHajPaMbgSU+MVEoA5oBCMbMss=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cWnOuI9I7bJdf1KJ4tARP4Y9TptaMirUt76PQX1sJOdxmBmU1Pvu+Okv90iKIvDek
 LPwapDjjQkvWR8N5NtEIIMepCioFORlsiPPebil+3+fnDqA+8nMmJKhIvHqbwCHJ6g
 oHlXa+l0UueGyeGQEsefWLywDSYgj/30PhhU0wY5IvYbAftVnAIulnDTxfGOn3aJEu
 OdY7MD2bWQFIB+zO0H9fAlZQNWronPrpfG8CZEVK6PByKg4f2sd/2ETvScON7qA+8f
 wBhO2UIxAh/1E2XRscyct282libujl9/Mz0O7Rs1Yn9nOLjltHoMfv9GNp4EN3hfZ4
 U5qiqnmF6jgOw==
Message-ID: <8ecd9ebe-8ca3-4829-96a8-0a4da3f58b94@kernel.org>
Date: Tue, 30 Apr 2024 09:03:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wu Bo <bo.wu@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240429035142.706356-1-bo.wu@vivo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240429035142.706356-1-bo.wu@vivo.com>
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/29 11:51, Wu Bo wrote: > As for zoned-UFS, f2fs
 section size is forced to zone size. And zone > size may not aligned to pow2.
 > > Fixes: 859fca6b706e ("f2fs: swap: support migrating swapfile [...] 
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s1buW-0002cl-Ub
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix block migration when section is
 not aligned to pow2
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
Cc: Wu Bo <wubo.oduw@gmail.com>, linux-kernel@vger.kernel.org,
 Liao Yuanhong <liaoyuanhong@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/4/29 11:51, Wu Bo wrote:
> As for zoned-UFS, f2fs section size is forced to zone size. And zone
> size may not aligned to pow2.
> 
> Fixes: 859fca6b706e ("f2fs: swap: support migrating swapfile in aligned write mode")
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> Signed-off-by: Wu Bo <bo.wu@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
