Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 845F3B9E4C8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Sep 2025 11:24:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XztsBbhGZKPwEJQWDhsL5g0P2+SiHXWhzcWnEvV0tF0=; b=JTn6BIP9EjmZorK85TBVEx4S6E
	FF3VK6lo7am+Jt/IreV7urghj4PO6I9djp5ODoAsSR63Wz3L6OdLRuMKdPnUQbdeQPpZdQfdM9iR6
	hc+ySTWvVcbiWOrkJP2DKOOhrdvvdtD/8uvjBMFNRxVlHMQ6OM+LNR8vJiRQp2JKleOI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1iD8-00030T-4i;
	Thu, 25 Sep 2025 09:24:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v1iD6-00030M-RS
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 09:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3BVAzVXdn97gtXvpDdsT4dz5hyjjpLsCNzH3+jBJ1x0=; b=E5rLdYVB91SD+lQj66Kb7kpCep
 j2xnh0JKs41R68FMHlU3RtX2frkmD0ezLZRDWUdjwBdyxkn6XaGgzSgQLKdc61nK7Wewsv0M6zuL1
 r/0G0kbhLZ7/aRljdfyVv27yoPdoaYa4E2RdZUOdzL9YvYvV8f3vYNKle/olHmbTPK+0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3BVAzVXdn97gtXvpDdsT4dz5hyjjpLsCNzH3+jBJ1x0=; b=NNlAAL+VFYYDAxdPf3bXJBveoR
 rZWw00L6urAm/b/1csBA5qEjikwA6y9lOtZuOzL0IkDK5tMhmiWsZOzIrG1Gt4x1UCw4Z1dbdNc/F
 8mtTZEZCnYzeE6QSjvkSxszb8CWL+ZqBGwmFA5Qo085FF6VLVzPpllTPnwgno2pEkc1o=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v1iD4-0003IH-I7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 09:24:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4293F434A2;
 Thu, 25 Sep 2025 09:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D470DC4CEF0;
 Thu, 25 Sep 2025 09:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758792248;
 bh=3N4CJaD+M54WGTq3I7yxeqpASBZUqxkfBMhDjJwnE8A=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=I78H0gL5TUSNkY9Ols3abq3aJ8Kjtglr/5ilPXLO0iqaaqPY4sLn7TuQEhR3lhX+I
 AVipRP3Qq3+BnU5xSvN0buwFxr1wAnF+kOpzhPBLtm8vWlYWmgFqDI6OgqVqdTwMWo
 MZLJFPpFXLekjbkJZL7dKx5hD8Mdqah3hunblO236UpRMVnHzkvVj9Wo5/35gEMHkQ
 UvP7HqAKxuvCL+M5SVcYV1VVd+QdnHdvnAyS3uOmyO8nIQgK6/hMJM/MdYX5tuIGjr
 y1DyLIa6m2j67h52p3BTaq+zwAtxsCETzVn9nmGt/6sxeJpkOWky8DyZf7R/AYOhZ9
 PzqNLXMdkciZg==
Message-ID: <969225c5-c4b8-42d3-8cdf-66c1e949f681@kernel.org>
Date: Thu, 25 Sep 2025 17:24:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250924185423.1305104-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20250924185423.1305104-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/25/2025 2:54 AM, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > total_valid_blks_available is already a multiple
 of c.blks_per_seg. > So, we don't need an additional alignment [...] 
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
X-Headers-End: 1v1iD4-0003IH-I7
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: remove unnecessary alignment for
 blocks_for_ssa
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/25/2025 2:54 AM, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> total_valid_blks_available is already a multiple of c.blks_per_seg.
> So, we don't need an additional alignment adjustment.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
