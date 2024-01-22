Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A57835962
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jan 2024 03:34:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rRk8i-0002yd-4m;
	Mon, 22 Jan 2024 02:34:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rRk8g-0002yX-Oc
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jan 2024 02:34:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y8ZAkSZPuVeAXfWGukIrq42qR8CkdhknoCkyQ+rp9eU=; b=c2hDruwQpzEdZaQf/KZ7xdQ8Rv
 0fXlampjV+n2tIr2x4/g9sSxy9wHkW1dg0KWx8hbgkC0mV9w41y7OcTy70YBGGLobnbwTexrnxf+r
 A/qqKb6IUcIC1GNVXHBGyyHDRH7s/A++Yc4c41ORGVvPikFQ2BQ8G99YcJ1t6sjSnAiU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y8ZAkSZPuVeAXfWGukIrq42qR8CkdhknoCkyQ+rp9eU=; b=IKRZ2yo1YwuslOTyykp4Pwkra8
 et35dN/dPLDcge3TtVfHAqC/zH28LHTrzSwbaALbRy74gk28XOEQb2UH+zWBCTlne3v8tHmTP0gmd
 FVcgQ7vPH1157Zz7qq2jdbVH4QlulFENSrVYXt5JdGaOrLVsiCIT8zxKNXRrlUpZnFYU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rRk8b-0006Io-Kq for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jan 2024 02:34:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D0ED460FC4;
 Mon, 22 Jan 2024 02:34:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33838C43399;
 Mon, 22 Jan 2024 02:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705890843;
 bh=UwYjuWCbVnv0zBlVv4pkaoZN54Ie0tuuwcikr3lhwrs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CjKh7hPcTBDqHYMLfNQpz9/Z2qZkvb93qRtGT0X+yAP9NvycurHw06E5cXy99DsOt
 hNw9CvjJe/vGBGbTDCIRRYp9ll9benWf8kxXNYG7dG9B/oodaNfmcuE7KF0dPhOAg8
 60SHvHtZlnWLq6rRfLoCi/xfj/ColIugpe9B9s8MWjmTOjK/Uq34JSTbhfu5Qn2CJ+
 IficEbrANFTUzdWQN2ExtDnrtYhrskuKeT6+xBIPMUTzAtiEQ9+Q2905JSalG2qqwM
 dGnKANcb/LnUzKIQrbpqxQGUnBZCbQv0UE3gFGfe6YBpl+W1V7EateITjXKhzTaR46
 aRIb2kUbTuDYQ==
Message-ID: <f9e0087e-afda-49a6-a5a2-1d5ba3098dfc@kernel.org>
Date: Mon, 22 Jan 2024 10:33:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1705478398-10890-1-git-send-email-zhiguo.niu@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1705478398-10890-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/1/17 15:59, Zhiguo Niu wrote: > Now IS_DNODE is used
 in f2fs_flush_inline_data and it has some problems: > 1. Just only inodes
 may include inline data,not all direct nodes > 2. When system IO [...] 
 Content analysis details:   (-6.5 points, 6.0 required)
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
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rRk8b-0006Io-Kq
Subject: Re: [f2fs-dev] [PATCH] f2fs: use IS_INODE replace IS_DNODE in
 f2fs_flush_inline_data
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
Cc: ke.wang@unisoc.com, niuzhiguo84@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/1/17 15:59, Zhiguo Niu wrote:
> Now IS_DNODE is used in f2fs_flush_inline_data and it has some problems:
> 1. Just only inodes may include inline data,not all direct nodes
> 2. When system IO is busy, it is inefficient to lock a direct node page
> but not an inode page. Besides, if this direct node page is being
> locked by others for IO, f2fs_flush_inline_data will be blocked here,
> which will affects the checkpoint process, this is unreasonable.
> 
> So IS_INODE should be used in f2fs_flush_inline_data.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
