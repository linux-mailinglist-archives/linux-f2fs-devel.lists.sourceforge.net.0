Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E0977A457
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 13 Aug 2023 02:26:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qUywS-0001rk-6k;
	Sun, 13 Aug 2023 00:26:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qUywR-0001rb-BX
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 13 Aug 2023 00:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6h0KMZ1N2cFF6yc6G35DL+K6uZHzYdJpezNhD14gX1I=; b=JwFxQualmxrmCJkO71G2ORkgQg
 r2uRsQSYnSFei+Mqv85LbNCOpnLpYtJb8+2D/gXPm0CYvNX3GrwHUb/D28elVWmC+ndBCKXWzGxX/
 dMTUQUxT/KHtJV6YnaE00QO5DHOZFZVUjT+h7TQJwEeuTem+OQt56+oLphxQqubmzRTw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6h0KMZ1N2cFF6yc6G35DL+K6uZHzYdJpezNhD14gX1I=; b=ZKPPRjGK/O4SausnLFyu22pDZP
 WgdEHf3lBhQZiooJpAv3qZYw5dUebPkstWIXKmXOGwitdYd4BzjOiYpxaMRMJvXWNEtI1AaLnlua8
 0/jy8UsiLiofPl20P8DZcR7L7lPFwpNhIe86Ji1xorH3XB9JSdjOQXm18G1YzuGlbAx4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qUywP-0006UY-LL for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 13 Aug 2023 00:26:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 456826172F;
 Sun, 13 Aug 2023 00:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D6FC433C7;
 Sun, 13 Aug 2023 00:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691886399;
 bh=lk4ujpyD6hcWRHEtPzLbQveuf5POXSu2Rnzy7nxxUko=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bxLK+W8ON2OpMQpgGPf38ohj4WTKOwBOU4tue1v4k8Wznf8M4yLN7/u/4UWe5wAkR
 R94tLHXwqsFXnTnq+V6j/w2zp+bjKSH9LnyeIDc6YKE4DR2xBWwNLtxS6PQi3+q1bW
 YMcdWmzX6Urkia1n3fBmwmrycPUZM98v01ZJ5wc/F0k6OqczwW8SGWoI4jymuWtEGG
 cjepx4D+k4H3lqXPT6Y7HYHGrVUCflqNR7iaBed68KJ1WRQ/ekAh6uXFSEmmZfFXV6
 RNsTJcy1NpY6Ta2HPXlsvrLc/2fi1F4s6Qq3alANc9xEzEihIVPzPMLikkq/FxxGJq
 vQguKrARebhtQ==
Message-ID: <cf34c2e5-8218-871b-750e-319c1b5482d3@kernel.org>
Date: Sun, 13 Aug 2023 08:26:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1691656800-21616-1-git-send-email-zhiguo.niu@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1691656800-21616-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/8/10 16:40, Zhiguo Niu wrote: > The sending interval
 of discard and GC should also > consider direct write requests; filesystem
 is not > idle if there is direct write. > > Signed-off-by: Zhigu [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qUywP-0006UY-LL
Subject: Re: [f2fs-dev] [PATCH] f2fs: should update REQ_TIME for direct write
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
Cc: niuzhiguo84@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/8/10 16:40, Zhiguo Niu wrote:
> The sending interval of discard and GC should also
> consider direct write requests; filesystem is not
> idle if there is direct write.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
