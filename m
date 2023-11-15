Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9457EBE9E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Nov 2023 09:34:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r3BMJ-0008Iu-80;
	Wed, 15 Nov 2023 08:34:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r3BMH-0008Ik-TS
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Nov 2023 08:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dIxiHztINaVJQVMxnFsCi6moERFTDesNBvaNCIt3J4w=; b=LKdSWSyO+vMs+wv3GjBwUe/1EC
 uLWxVnQMuyWbo4Gek88wpvHWrLHpA67ERkORzp7pu8hCyAHv3ZeQyPob237DSVPrre3GzmQW19Szm
 ddV+oDrf8g3xnFueke6VS96v0HPPg75U/QKM2O5mhlW76jmnijqHFZgqy5o/v53w/AvI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dIxiHztINaVJQVMxnFsCi6moERFTDesNBvaNCIt3J4w=; b=ZwIa47G9FymjX4OyQtg1cNNUZe
 ESOXjk/U4rCWLYrfF7L4EBJGNmtY/XWjrQBG8MOKZKEZg6BtbeJ1NL1eEcdYmb3KM3K1ZSn1cagps
 ou64u8uUWUoKqrqejthZQp/HtGWzrJc2ijxG6PtkHAs/W5vEDkMFJVNiMwAY9DO0H9gU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r3BMG-006Fja-35 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Nov 2023 08:34:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AF1C861549;
 Wed, 15 Nov 2023 08:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7EFC433C8;
 Wed, 15 Nov 2023 08:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700037282;
 bh=N1a4mTOSVCHetkbOrkJvHOlhQp/PM7yblpp3l1VHjoA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V5EmAEiSaRVro9W+7q3EDFnF+bl32STA84PvY6IKXM3tN+lNi81pedYJsUvgKAnOF
 vqv9zkTeFO2D19PuIXZ8pfZKAiT5ZBC75eN9osqZQGgkfUYKc+WGfPxZs4iDd0gZdg
 Vn7Qs1LRBZgnesOCwnSeYQanoIGePIqc8/oOLc/uK16D8Snwx5v3Dv/NIqNdNGLMuc
 MK8yIgqi100YCXy8J4ulHEPk1+tWi2lg5+EPJ1TyGe9oMDIyjBXz5LjgPtKOUxPwLe
 lbsGeNGCPp2Z84TXrtw/rjZdNAwYvRjHBMqHnXpH7qqUYpDW4maIgeKlnAiTwvrAl8
 D+Xtltf+l+BGg==
Message-ID: <7b059c31-f9ce-ef49-a7d1-259f76be5270@kernel.org>
Date: Wed, 15 Nov 2023 16:34:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20231023155005.2259554-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231023155005.2259554-1-jaegeuk@kernel.org>
X-Spam-Score: -7.2 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/10/23 23:50, Jaegeuk Kim wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Detect and fix a corrupted xattr entry. > >
 Signed-off-by:
 Daeho Jeong <daehojeong@google.com> Reviewed-by: Chao Yu <chao@kernel.org>
 Content analysis details:   (-7.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.9 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r3BMG-006Fja-35
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: fix corrupted xattr entry
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/10/23 23:50, Jaegeuk Kim wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Detect and fix a corrupted xattr entry.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
