Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F62A13844
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Jan 2025 11:48:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tYNQ0-0000BK-4X;
	Thu, 16 Jan 2025 10:48:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tYNPv-0000BA-5f
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Jan 2025 10:48:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/GgMHemO27YJNvrywuinfElFC6qf3f2y0aGTvmAtMYs=; b=lWvLuGIEPOZe1t3h2aU5Rgn4A0
 SU63OT0q6FKbqYMxjiKQbT8P9ZWy+RD/6kkFW8vQXRImFH3Lq9g8B4Qm+sMo3R8p6P2Ex/6WTvd/j
 1HdTMnZ/nBzprXKNTiL9oWi/2U6huwEcGF91Y3ERiOYMleL7jw9LSlav3p83pB9jrojc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/GgMHemO27YJNvrywuinfElFC6qf3f2y0aGTvmAtMYs=; b=QBI7ZuPm62JlUQ9ATC1kf49wMP
 WM7qOr8mqK4j7f9LSyAu12bvxltyDwNi9g09oijl+/zzcZRf4CK//6nJyR8P2h28dNlFMILj6IZVr
 lBKSriE+5VtCw5rLRuXDOTAB7+shuBIG0/7dNUp4ImqJcVWGigtHU1vevTvTbtiivpNA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tYNPr-0005AA-8D for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Jan 2025 10:48:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2FE665C5CFB;
 Thu, 16 Jan 2025 10:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2BAC4CEE2;
 Thu, 16 Jan 2025 10:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737024473;
 bh=eS7al2cDQe608MXxrKRwyBoDCAaNPo9MlgP1bRQ4/Jw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=gX2Rp0BQLFJK3RhlEKDhYuzcB0yU3Qaee0qeEqjUDtUcSXqSwN6jM9HktDeIgK4lT
 7iefoefcZLSWLP2OjEFiiNei0NGY2rxNYvmZqp/N/u3mXBWUURyN0Mc0jzW1iFWS0G
 gg/eccqQwmlRrmbhH6sLYmQZLe230gti8G2widIStq4TRl8SupvLxaUiOni/w9X+97
 h8cthv9GzA6y1rRNxrYkWhj6Do6ZNQpX7ibYxAp0cfCPCC9SH5MQpsVgUpTiarziNs
 brdjV/Yb3S1K7b5kQskfYnBehukN/6nDiMZZpheVIHfmoeis1ACbniNdjyOPd0icZZ
 1301jQlnq34gw==
Message-ID: <c1b1bac3-38f1-40f0-bfde-dfaf462459b5@kernel.org>
Date: Thu, 16 Jan 2025 18:47:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yi Sun <yi.sun@unisoc.com>, jaegeuk@kernel.org
References: <20250115053943.2450661-1-yi.sun@unisoc.com>
Content-Language: en-US
In-Reply-To: <20250115053943.2450661-1-yi.sun@unisoc.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/15/25 13:39,
 Yi Sun wrote: > Function f2fs_invalidate_blocks()
 can process consecutive > blocks at a time,
 so f2fs_truncate_data_blocks_range()
 is > optimized to use the new functionality of > f2 [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tYNPr-0005AA-8D
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: Optimize
 f2fs_truncate_data_blocks_range()
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
Cc: Ke.Wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/15/25 13:39, Yi Sun wrote:
> Function f2fs_invalidate_blocks() can process consecutive
> blocks at a time, so f2fs_truncate_data_blocks_range() is
> optimized to use the new functionality of
> f2fs_invalidate_blocks().
> 
> Add two variables @blkstart and @blklen, @blkstart records
> the first address of the consecutive blocks, and @blkstart
> records the number of consecutive blocks.
> 
> Signed-off-by: Yi Sun <yi.sun@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
