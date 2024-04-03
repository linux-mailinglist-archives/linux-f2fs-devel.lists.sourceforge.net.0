Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8E0896209
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 03:34:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rrpVt-00048E-Op;
	Wed, 03 Apr 2024 01:34:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rrpVr-00047r-At
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 01:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HVitcheKhNfxZFYW4mioKuyp7IgV9F2J+AGr2wLAPIs=; b=ADSwVl1ijuumDvhztb2agPRnkt
 2n2Q9gOc2A/uH1L6NWrYrzhy2xpT2r8mfivjwBKdBh/YRtYjxdsSSWA0eblSkAyFPdHznPVdeS8s0
 8spfsEM55WWjn8j6QaAcw6ltlD2k2TW2dtY5DOrhelqez3UYjaE/1LRdX42dqCD1Kw0E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HVitcheKhNfxZFYW4mioKuyp7IgV9F2J+AGr2wLAPIs=; b=MNNhoBACYhnyvDODz/bYNtw2VP
 1Jay0SXNjzuWfp/25F0jqusYE5IketD+gigxFjA1EdpRTRhAnZwJtuSllmrD77rSK33SJEO4ypAqZ
 Z8KiQw5zjlBhwAx4uerE4/cGz7RKN3EBT7jR6tBbDn3pVJva/q7vzi2HaI3GpbohXCJw=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rrpVr-00072L-1N for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 01:34:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 957AECE1F2D;
 Wed,  3 Apr 2024 01:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E806C433F1;
 Wed,  3 Apr 2024 01:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712108035;
 bh=C8sszQNY/WLlDhKfcbkKR7fRMCxjBLqA2FWczM45YG8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=N/gD7LKNv9xTOZE0YEWWY2DWR8yo/frfKk6sVSKI6Mdx0gJIXAtW+tWzxlzLVKdpb
 +CflV6ZUqiFJDeGUrOMhQQ/EgirdI0P3UMnTk5IzEXWqKedMFtu/9KI5DKQSlsxUD/
 7SYel0gBdfJTIvFnTGc8xHyWwwoR8qgsIa44+BZlpI0sDjcdfkV/NOYFURAbHVkijR
 XMcspL0LS8xE5cKIIFWk7RoaJ2PJdygPKgRr+yf/GgOHmTCTXGaeOsba1d0LqeSVYh
 eXup7BmEcGaqrcE4AYhLtr8XVVjW/fWa1+QWJZtfmGof/9p1BAfKvrnOuuAxAw34P4
 VUuvlx+ULR6zA==
Message-ID: <dc850b72-687c-43f6-887e-7587f7593d59@kernel.org>
Date: Wed, 3 Apr 2024 09:33:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <2073e8995f5444aeaf7133b87ec07de8@honor.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <2073e8995f5444aeaf7133b87ec07de8@honor.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/1 21:48,
 wangzijie wrote: > From: Zijie Wang <wangzijie1@honor.com>
 > Date: Mon, 1 Apr 2024 21:24:08 +0800 > Subject: [PATCH] [f2fs-dev] f2fs:
 use f2fs_get_node_page when write inline data > [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rrpVr-00072L-1N
Subject: Re: [f2fs-dev] [PATCH] f2fs: use f2fs_get_node_page when write
 inline data
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
Cc: "wangbintian\(BintianWang\)" <bintian.wang@honor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/4/1 21:48, wangzijie wrote:
> From: Zijie Wang <wangzijie1@honor.com>
> Date: Mon, 1 Apr 2024 21:24:08 +0800
> Subject: [PATCH] [f2fs-dev] f2fs: use f2fs_get_node_page when write inline data
> 
> We just need inode page when write inline data, use
> f2fs_get_node_page() to get it instead of using dnode_of_data,
> which can eliminate unnecessary struct use.
> 
> Signed-off-by: Zijie Wang <wangzijie1@honor.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
