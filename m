Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BCCAE6833
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jun 2025 16:19:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCMjukpO5E9ZQNaTz7hMTV0soAdtQ3GU2ePZxJLmqFw=; b=TUiLxIFC14wuW3xgKSITAEcESn
	x3NL5k7GRnDuNGCHgkUuk8abX4M2eSJ5kSa4DihCSlSH8CJfh5gCHcFqT/X+3Qmh0WTBoovck2TsZ
	Yspog7A2mUtf6HGUVVz4QD/8fhdH83xEIKI+FsLVJutlp+A196olSw25Wx/sl2vUOU2g=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uU4VA-0005p7-Oi;
	Tue, 24 Jun 2025 14:19:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uU4Ul-0005oM-7W
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 14:19:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lNrgYaWSgU3sh+UxYcPE0s3m1uqZCvkRgvEN9gkk2EU=; b=R+w/NNVkfjiJD48w70B1/iozws
 u32/uC67MTff2aGKKqUCjKfWFeUIZOd2xoDT+0ApKCWNuZbQkjOrqPUZk0xXIphHJlZDrh7FY/GH6
 IUF2JVk0XGpRpKw+NNDqimNLSc7u1pvgz0OfbRWxKK/R0/Bcvk+XPB7q5IOcEP8A9kWE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lNrgYaWSgU3sh+UxYcPE0s3m1uqZCvkRgvEN9gkk2EU=; b=O4FdKM6ynSKtAYDPm/XJ2YujDO
 CNPuqmbOAc06qTl3Ci1l6wJVJ3RUJny1aAfeW4ABqlX7Un9Fo+oLx1+B7dWn5nZSP1+NiwbkDedrd
 lsECU/h5QhcKUgmdNGvjnaO0d4TZ/xdYkVdjL7sbPqZ22r12JN6eX9FqVo6S2RtyQzI8=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uU4Uk-0004Z2-RD for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 14:19:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2A61CA51BF8;
 Tue, 24 Jun 2025 14:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC39C4CEE3;
 Tue, 24 Jun 2025 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750774759;
 bh=+O2XMJoIFYapG4jpDaxlSd2Kzerwe59/bvMlnOv9D9o=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=tWprPhtIjJVwH89Vitnol25HwtwQCcdvJv5BuEtOP/ugno79OURNQxg5hpHmN526z
 ZaIhB2CH+kBiq6EOKGVlHFa+vsnNqOw2tcPtHgi6bMZWP2mBRAa2xRIJ72iTEQy/tn
 jrR7RY/W1O3EjbnCC9gyRP65kYGHORjWLNpKWc83Kv67Or1+cV4gfDXhCKeNcHy+zx
 /hjiCFz0qjhfxQTXX1gkJvokcEwLnRZGc91FFUY2rXCiYAYgZOzUgxA01xpFUI+HIE
 M6yLIau/CZNtv5GykPUtDlJWKUaib58vHk2DJKrclkSwHEQ6pAqfxFxTtOpe1QNISD
 Rr6otHifx9uuw==
Message-ID: <1c6a9b6c-8bce-4a02-9dbb-a883e74c0045@kernel.org>
Date: Tue, 24 Jun 2025 22:19:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250624035938.3176350-1-wangzijie1@honor.com>
 <20250624035938.3176350-2-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250624035938.3176350-2-wangzijie1@honor.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/6/24 11:59, wangzijie wrote: > To prevent scattered
 pin block generation, don't allow non-section aligned truncation > to smaller
 or equal size on pinned file. But for truncation to larger siz [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uU4Uk-0004Z2-RD
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs: don't allow unaligned
 truncation to smaller/equal size on pinned file
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
Cc: feng.han@honor.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/6/24 11:59, wangzijie wrote:
> To prevent scattered pin block generation, don't allow non-section aligned truncation
> to smaller or equal size on pinned file. But for truncation to larger size, after
> commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned files"),
> we only support overwrite IO to pinned file, so we don't need to consider
> attr->ia_size > i_size case.
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
