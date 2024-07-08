Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E92929A99
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Jul 2024 03:49:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sQdVp-0003uy-6a;
	Mon, 08 Jul 2024 01:49:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sQdVn-0003ur-M2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Jul 2024 01:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WQqNNf2K4snhD8+LIbYkpXsuIJr6WHb0yr4LFxhK9Z0=; b=fYVCaOibmv7tDIDh1+iS1YdQe3
 6Dd+O9icNTy02ZDnuQYelt8RHIk5p5B2xAJTMkpKu++44QaWBBpic1kYj8odfvmoF1/JI8PFcCWbV
 tdeJurn4UlZ+ta6q8Hcx9d2Gebr1tiM4dGwq1zyAJ4pL0jNc+dn/28zEVbIe+Ovs8ZC0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WQqNNf2K4snhD8+LIbYkpXsuIJr6WHb0yr4LFxhK9Z0=; b=dHhUjkgAHKWz5dU4y9JGIQcu2Y
 UTGQw2NY/hJgB0h27lg/grIrUs/Vu8Vzy3ZJMAWHfNp0aIzXHLPGj1zmISjEDFO3j/RPMYebpYugs
 sFMdjtxoDGrbf6Gzgz9M2xNcAKBoETFrHd8iVPO3GjPm6YwrsB6nVuIqGGkCm1mCq9x4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sQdVn-00084k-6O for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Jul 2024 01:49:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0FD3760018;
 Mon,  8 Jul 2024 01:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF1BC3277B;
 Mon,  8 Jul 2024 01:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720403379;
 bh=FHtvJ9Ggpgn/fomoax1AtKWIQLssIUBxdD0VguZaEuk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lAKrdx/MRHk59KhuzVItjjjxN2hko8iGXVI0DEdEbFgr2wZykIIUSw4vZkfr6uHGz
 Z77X6iJ4isUMAXhTBrwC4Q1tQUnvP2B6sR3P9rs914hl0oVYo6jc8/LyJ/kg6FGCjU
 OKZsG5Rr2PAY5P0UXdbETzPlIVGF+RXY9IngFAmpMw2ejuT5CvOduXUkVqvlhg29fM
 R/UAkgkb7NNNdJhmWKszIiiVTPddct1CcWn1DVTWMoX2wVZy2RBU4nUgjSYKy/eeSD
 QCAh5FB7h2cWP1jfYf9XwrXQ6sscH+MqgKsDVBOM609aFDgW37PXhGOmhDqN0vpbjs
 BRs+ZIXa4UYFg==
Message-ID: <3f72cbd3-c2f1-4c76-b2a5-db91bdbc3e00@kernel.org>
Date: Mon, 8 Jul 2024 09:49:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sunmin Jeong <s_min.jeong@samsung.com>, jaegeuk@kernel.org
References: <CGME20240705082511epcas1p24b7b63d5e714a25213dbe07affa52f69@epcas1p2.samsung.com>
 <20240705082503.805358-1-s_min.jeong@samsung.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240705082503.805358-1-s_min.jeong@samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/5 16:25, Sunmin Jeong wrote: > In case of the COW
 file, new updates and GC writes are already > separated to page caches of
 the atomic file and COW file. As some cases > that use the meta in [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sQdVn-00084k-6O
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: use meta inode for GC of COW
 file
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
Cc: Sungjong Seo <sj1557.seo@samsung.com>, daehojeong@google.com,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/7/5 16:25, Sunmin Jeong wrote:
> In case of the COW file, new updates and GC writes are already
> separated to page caches of the atomic file and COW file. As some cases
> that use the meta inode for GC, there are some race issues between a
> foreground thread and GC thread.
> 
> To handle them, we need to take care when to invalidate and wait
> writeback of GC pages in COW files as the case of using the meta inode.
> Also, a pointer from the COW inode to the original inode is required to
> check the state of original pages.
> 
> For the former, we can solve the problem by using the meta inode for GC
> of COW files. Then let's get a page from the original inode in
> move_data_block when GCing the COW file to avoid race condition.
> 
> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
> Cc: stable@vger.kernel.org #v5.19+
> Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
> Reviewed-by: Yeongjin Gil <youngjin.gil@samsung.com>
> Signed-off-by: Sunmin Jeong <s_min.jeong@samsung.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
