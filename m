Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1923E637C8F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Nov 2022 16:11:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oyDss-0000n6-W8;
	Thu, 24 Nov 2022 15:11:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oyDsr-0000ms-NY
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Nov 2022 15:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WqEm0nMyQPjC7Ih6PxVMZn9+EOVGiLfH4GAfcTTRIr0=; b=OrhWhMF98ZMRfKxz0Mb7E7PGu6
 aO2b8/lnxByHuNpRhFzYT/HnQJQMv3tHZZNDPF5vB4bg7t3AlxBMVdN94Jy93Hw/Y2uCRBDjQOnoq
 9mDumtN5t28yaN8oE0VH/NN6LkSVS+lAy11CguV6nwC4ODpsxvYtX+daZM5O3r99A8zE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WqEm0nMyQPjC7Ih6PxVMZn9+EOVGiLfH4GAfcTTRIr0=; b=ZD9X9IX3D6BOFs/ObxieMw8DYR
 V2baThwZ0A7NowIFQ2wcLOsz4ManHfw/+MzcaSuMPyMGgQdVZKmVTG+t96BpTCjtnXtum6kqxZT5F
 me88ZsmP4Rr8R5vldDqS6ziH847CvyowYmoMaLHO8iFNUp28y1j0wUmfaqHCJYHwAI1M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oyDsr-0050aB-39 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Nov 2022 15:11:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B0584621AF;
 Thu, 24 Nov 2022 15:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E910CC433D6;
 Thu, 24 Nov 2022 15:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669302679;
 bh=WqEm0nMyQPjC7Ih6PxVMZn9+EOVGiLfH4GAfcTTRIr0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ES21AQCHdqI+F4UZC8dgHpk8oYKgfLmvwQVfvyFtykUDTcByw9W2r7B46vhrBLA+5
 LUhxy+tXQXQL+8CHc8uDCWurrMZRJ4YRc4xSfK8b+FBWyHdQyn8/Tq9UPXS0hTkXhT
 a2GNyvH3rp4N17sXasIZ9xtxt2sP+iGUxg0N01qsXve53UEhippMRTMp8KH6F1gxJF
 xGgciE8s7m3RWfmjFNmEIBEuRwvJRQwsDGc5giKAMsVnmilKEuTKY/uPwC5gpxyzpZ
 3vU97c7j+n+H09wo5nrlBynX8VRZ7BxIQzS5bdmK52E+rw6cqs1pFyWn1IWRhopyGq
 4rm2WgHelmVFg==
Message-ID: <9e3d185b-6453-f5d5-e1f4-bcf176c2b93c@kernel.org>
Date: Thu, 24 Nov 2022 23:11:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20221117151054.2232946-1-shengyong@oppo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221117151054.2232946-1-shengyong@oppo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/17 23:10, Sheng Yong wrote: > Fixes: cf30f6a5f0c6
 ("lib: zstd: Add kernel-specific API") > Signed-off-by: Sheng Yong
 <shengyong@oppo.com>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oyDsr-0050aB-39
Subject: Re: [f2fs-dev] [PATCH] f2fs: set zstd compress level correctly
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
Cc: terrelln@fb.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/11/17 23:10, Sheng Yong wrote:
> Fixes: cf30f6a5f0c6 ("lib: zstd: Add kernel-specific API")
> Signed-off-by: Sheng Yong <shengyong@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
