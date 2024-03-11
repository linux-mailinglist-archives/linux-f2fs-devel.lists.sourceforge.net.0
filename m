Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC84A877A32
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Mar 2024 04:51:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rjWge-0004Ka-Je;
	Mon, 11 Mar 2024 03:50:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rjWgd-0004KR-CP
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Mar 2024 03:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d6EPVzTLxVGVR/idnYVEnC/kEd87/TFvlTeFNfDn1hs=; b=AliB2qF7ulywaPeAmK94FTVnIm
 kksYvBQ56swZvTZJU/Mg52JJHbZY86xKKEDqSDOeHiSTIrHyUcWJCOArRdAtXVd6tcKOk4tWDPmSK
 3LCXBwzSZ+XQ0xpB+qtvXtl95IVHHLq7xGW0Ton/2A9Wi5ySxpl7JuVaM22h4o+5uzOY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d6EPVzTLxVGVR/idnYVEnC/kEd87/TFvlTeFNfDn1hs=; b=l8QlvMpf0YmetGNjkD4fZmQ24R
 VvvjcA3XzPeGv4jEPsgkVsdrVQ/phh29mb5l3PtDWnk1uGCCUAfOJkLeH4XRqo0Vz9iOxJaum3o+O
 KsmSw1mQFMCIy32gNIMZrfs0ZF+h5mLeepDGEB/u9Bg/x0+aMZ+7Sa17NOknkThFyJ9M=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rjWgT-0003Di-60 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Mar 2024 03:50:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 81844CE0B57;
 Mon, 11 Mar 2024 03:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB53DC433C7;
 Mon, 11 Mar 2024 03:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710129034;
 bh=W+4Sfk9+nuHnW8aLHz34FpkrVlLiz/zJEGeiijQZNcw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Glp0MAwdBKX9w2i13VoX/xD6FHJOXNDoicz0GLPtX59QsySdSzq8US4zme6w4b6Pz
 HtS610j49I435APdmlZLEq8fbzUexLj6sZFvw5aarZ357C6EuS1qHELzXpJpOaq+4I
 2jz7f2Wu1Hxo8f/qrUasVY15TA96+qmduAecC2dKiIP5e6O72XWgPhDxrOnqgGAelo
 HXaYuEjnP8sVALBJIrXszAomnd9HYwE1tgYm7HvnJMR8FcW6VtwwBLLZamqCHCV1F6
 294zi8UVPwguYY4bTcLiTwHoX8NEJHEaZKhYs8uAb+gToJmTdmIxeaRtU8wg+hShq9
 43HeSnCFRY5Gg==
Message-ID: <01beda7d-5f53-4dda-8df4-8a1cd71f3bfc@kernel.org>
Date: Mon, 11 Mar 2024 11:50:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1709879125-24671-1-git-send-email-zhiguo.niu@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1709879125-24671-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/8 14:25, Zhiguo Niu wrote: > There are some cases
 of f2fs_is_valid_blkaddr not handled as > ERROR_INVALID_BLKADDR,so unify
 the error handling about all of > f2fs_is_valid_blkaddr. > Do f2fs_ [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rjWgT-0003Di-60
Subject: Re: [f2fs-dev] [PATCH V8] f2fs: unify the error handling of
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
Cc: hongyu.jin@unisoc.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/3/8 14:25, Zhiguo Niu wrote:
> There are some cases of f2fs_is_valid_blkaddr not handled as
> ERROR_INVALID_BLKADDR,so unify the error handling about all of
> f2fs_is_valid_blkaddr.
> Do f2fs_handle_error in __f2fs_is_valid_blkaddr for cleanup.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> Signed-off-by: Chao Yu <chao@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
