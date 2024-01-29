Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C4E83FC2C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 03:25:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUHKT-0002wi-1E;
	Mon, 29 Jan 2024 02:24:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rUHKR-0002wN-G5
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 02:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VL2ZDzjj0umGSKPKuUkz7Bbs2QArhdM0WfVsDQeuT1s=; b=cMKwU0RYtmwU6gpfdgPX7qHFAP
 lA8i3EYkGCYg0uSGabF027fI1OrRxSNpCiXKtyR+BjefzUeFiAeh7mIOK84pfuzyxH/1qQTzzp9l3
 mBevPmqxJVvM5BZ3ulWWBLpZE7uACkUrAgnmhMNjq8drqK+2h4GPQmXto1I8y17pPNyg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VL2ZDzjj0umGSKPKuUkz7Bbs2QArhdM0WfVsDQeuT1s=; b=BuZu+E9XMEgwa1d3j8iWX+WYGD
 S2rCSnSlwql35uWIMnR0cQGE2NN5SIXuXnY962NrhEnC5/IzSlZWvepx7DQAmF4CtUvU04b9s3yg6
 MqQ4bo9ALjdS49O5y4vGkADmp6+xLiWNrtSGoxYvb40vj3/pdk4aji3u6dzGxW+fgcl8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUHKP-0004Nl-V6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 02:24:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4523261D4B;
 Mon, 29 Jan 2024 02:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0174FC433C7;
 Mon, 29 Jan 2024 02:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706495086;
 bh=QM0Apf5YM/YhV2MIMFE6WuZ8GatbXGGqiCs5MMKo5/E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cqZZocFjY2MUmwZm6fI1QIsoKiI8+JNYh78Oz9XteTp9GFejix6cMn8cMmDYZsPrI
 1w+5Q7wOiP0Oz4IIgL69EDooU3XocX6a6gPvGYMTaETCOr+xH2SxAZfba+6tU+V/VS
 ziWlKTItg2sVxrSIZoagVltnzwZV2h7yS2cuDj1EckYHjAJXdqv/nXbCzdQBpNAbGV
 20V19/h0Oi6iQIvjOMDN4O6APWgvPoqXMKITkUj+41JifFfd7m8601g3kYuoIxv88p
 1l4LD7V4HA0pVRs2r4zuXXqrJcj1tec538pmBjCX9m/1/th8LbqmYTlS6FtNGV7wja
 Jy22ky5cx9zNA==
Message-ID: <1d80ae9f-7252-4262-9216-4e25742b1f63@kernel.org>
Date: Mon, 29 Jan 2024 10:24:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1706011734-1617-1-git-send-email-zhiguo.niu@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1706011734-1617-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/1/23 20:08, Zhiguo Niu wrote: > There are some cases
 of f2fs_is_valid_blkaddr not handled as > ERROR_INVALID_BLKADDR,so unify
 the error handling about all of > f2fs_is_valid_blkaddr. > > Signe [...] 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rUHKP-0004Nl-V6
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: unify the error handling of
 f2fs_is_valid_blkaddr
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
Cc: hongyu.jin@unisoc.com, ke.wang@unisoc.com, niuzhiguo84@gmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/1/23 20:08, Zhiguo Niu wrote:
> There are some cases of f2fs_is_valid_blkaddr not handled as
> ERROR_INVALID_BLKADDR,so unify the error handling about all of
> f2fs_is_valid_blkaddr.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
