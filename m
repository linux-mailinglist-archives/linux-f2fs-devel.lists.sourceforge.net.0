Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BB773DB11
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jun 2023 11:15:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qDiJY-0007Y9-1X;
	Mon, 26 Jun 2023 09:15:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qDiJW-0007Y1-Ns
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jun 2023 09:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aA5b7HNw4QnoiQ2inwhMYUxgO80YMrPGbG9EpUqaB7s=; b=J+Cf25JmBUU0fGUewKrU8dGtiy
 WuHUcWriz7wUxKfhprs0z2kYwUb9F35dCrtpdWXQ6/GC+4EeEtH5Tl7+jcyhT2Ncz8F2ouWDblUK7
 fdDA7CIpTby+gJEnteUDiQFhN+zu5Y6eYXhVqWZnrGuyKVhuPpfyEGLKDKK3okybcKsY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aA5b7HNw4QnoiQ2inwhMYUxgO80YMrPGbG9EpUqaB7s=; b=ft5YHNypDKqEvZNh6x6q8omxVA
 29XirkHk9k7hdcFuYf0JQPWJv1Aa/OJzbPaxeMdipZeW9NgLrgCT1A5FhfGAgAGJ9ABvhiNE++t8e
 MuRGb0QBSUX+tFFcceyUAmkBFVbTX8QUEP9ixjkAO79vqnyyQ3Ly2aYFhiK88OXk+4DE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qDiJW-00Eurv-80 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jun 2023 09:15:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D6B6060D33;
 Mon, 26 Jun 2023 09:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B5D0C433C8;
 Mon, 26 Jun 2023 09:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687770908;
 bh=6FqM2iaonj+B+Cdl2KgW7ZGQZdUAPQHb9v+hfZzDZzU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sorggw8zXWu4XZ/+rgklCS2z+ZWyxJm1YLZcmz6zA9onA5/22mdM4UtLrpQ1jyNJC
 FRiSh0K4Xs4DmzkkOY20XtwtDsClPWxAa6K7zmcArokUETttaJfq29Rpvi3V+RHYMx
 tJHBM3kx8kN5ipSImvErFCS5wizxaa1pjeNfYtHTEOhEdETotPOyxDpp8tfRx2JIDo
 Yy1tCcr4EqfiPsBY430bKTyL1fRInHu0X82foIQsmQA4KjTsws2cV4BBtpuKI586qK
 7bsBbwmIb032BwEKHMJp4chhwXBnUn8QfE6JW63V4mn3y37rvBytx8OYbGqCqRIg6k
 Mr/QeFr7fptZA==
Message-ID: <b8f06eef-5249-d08f-b4f1-800ca14d770b@kernel.org>
Date: Mon, 26 Jun 2023 17:15:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Yunlei He <heyunlei@oppo.com>, jaegeuk@kernel.org
References: <20230625160627.4112651-1-heyunlei@oppo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230625160627.4112651-1-heyunlei@oppo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/26 0:06, Yunlei He wrote: > Mtime and ctime stay
 old value without update after move > file range ioctl. This patch add time
 update. > > Signed-off-by: Yunlei He <heyunlei@oppo.com> Reviewed-by: Chao
 Yu <chao@kernel.org> 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qDiJW-00Eurv-80
Subject: Re: [f2fs-dev] [PATCH 1/2 v2] f2fs: update mtime and ctime in move
 file range method
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/6/26 0:06, Yunlei He wrote:
> Mtime and ctime stay old value without update after move
> file range ioctl. This patch add time update.
> 
> Signed-off-by: Yunlei He <heyunlei@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
