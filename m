Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFE19B7556
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Oct 2024 08:27:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t6PaZ-0007TG-BS;
	Thu, 31 Oct 2024 07:27:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t6PaX-0007Sy-Do
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Oct 2024 07:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3tfbsTXSKdHya/Lg0SEtB8LEeZw6xephP4QG4BgJ9Es=; b=X2rPv4J2vEQwEH+5R+6QFEEOWl
 J0omMjnHL4CH4lX3ytAIjHyrNbkaUYM6K9HdWBMzKMKhJrWn0oNL23MeNtoUSTvNYVGf06tsVKxs5
 FWZWkAZHMF1lM+9bKcsWZgr5EfZCdai/IiUeKv6YIK+M6iZSjxL8bis/gbx9BNW2cE4Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3tfbsTXSKdHya/Lg0SEtB8LEeZw6xephP4QG4BgJ9Es=; b=b/TG+t1EnLlVY87kfCF3n56BEz
 BV7xw+3GBIiZUnAb1gQKylkEZ5JJUGxYy/xk6Cad5KMls54sSqdexqfNGCBWi2F6zFhBIF3tjFjRU
 QYnM8vGI/XWM4TWvz5JAqSi+aj+Pm0wEyrma0x3bFKS8rq3/uprwoLotyh3vRhZLeUSY=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t6PaW-0008Bz-Fu for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Oct 2024 07:27:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 26732A43242;
 Thu, 31 Oct 2024 07:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7629BC4CEC3;
 Thu, 31 Oct 2024 07:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730359633;
 bh=yazdEVDGHebAAg62eHSOa9TUi07+6ts74x3ynp+4AIQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=s6AzanjS6STfkhFqy+gdX2pANds+P2znn0onvayIFmLz94zgFM/sRItdY3Mbvtaqq
 2NU7t6H1A38DEOxFDNSgAmZyRLi7hDZIkhrmujRsvBC3cPWrRRYbSwSBuVvtnB2tl6
 T55Srgv17VW0s0VJxLEgcGKJ1d+mtF5kZu6GAru2YvPrK//TYlJ2iafrucChiSkhyF
 7K4cDc4ZRIgwws1lM3FoPB5e04GAxiGHIxuyyOrv8oDXXlw62kAfhMlLadEF7sy/xs
 ZYCe9xOgKkTQLoUemwdCYhzSrF/8gl5Sv3jyvcI2zetWKCS4e9UHAy1LDLF7gmxuMp
 an8EfVTYbTI7A==
Message-ID: <cf81df94-3ff3-44b8-97ad-e68b6315fcdc@kernel.org>
Date: Thu, 31 Oct 2024 15:27:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yi Sun <yi.sun@unisoc.com>, jaegeuk@kernel.org
References: <20241030103136.2874140-1-yi.sun@unisoc.com>
 <20241030103136.2874140-4-yi.sun@unisoc.com>
Content-Language: en-US
In-Reply-To: <20241030103136.2874140-4-yi.sun@unisoc.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/30 18:31, Yi Sun wrote: > New function can process
 some consecutive blocks at a time. > > Signed-off-by: Yi Sun
 <yi.sun@unisoc.com>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t6PaW-0008Bz-Fu
Subject: Re: [f2fs-dev] [PATCH v2 3/5] f2fs: add parameter @len to
 f2fs_invalidate_internal_cache()
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, sunyibuaa@gmail.com,
 hao_hao.wang@unisoc.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/10/30 18:31, Yi Sun wrote:
> New function can process some consecutive blocks at a time.
> 
> Signed-off-by: Yi Sun <yi.sun@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
