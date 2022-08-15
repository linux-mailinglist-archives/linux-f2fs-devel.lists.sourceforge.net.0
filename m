Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E58EC592835
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Aug 2022 05:38:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oNQw4-0007Za-HR;
	Mon, 15 Aug 2022 03:38:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oNQw3-0007ZT-6T
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Aug 2022 03:38:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jzbfmeMfkixPPUNHLeCd1olh4Bdf2ComQ3IphUoKC+A=; b=PmoP1djvgFByTyU8vei6W+uppP
 IVckpWh1iIIiACZdeOxeGEYpMI7qiZ3t1Mbn1qqS63Nr5etSLZqQUmyZig01FEBmIOMoJ6xQzWDpB
 SaTR6fToeWCby8kGUiV1Ym3NNGRiAJ686W2Ptwfjr9Hb3xsgG+pE91dHAcG9wEKTm9Rg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jzbfmeMfkixPPUNHLeCd1olh4Bdf2ComQ3IphUoKC+A=; b=Wd0Qbstr1WMkZ6CPDeT6ZbkxJL
 XDS6467sAGXBcC+NJxSLKLM4TDRSDO4t5M/XSftoOECvbv+5+zkwJzbA1/gS8uwTIeS3Q3Gs2RD6m
 hEuRdA61objMoTLBsgFvdjf3OJRj64L3qOH0FO4GXV3xl2S1B7XUVue8mfXp3A2qLPgw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oNQw2-002cJA-Ea for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Aug 2022 03:38:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4856461005;
 Mon, 15 Aug 2022 03:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C068C433D6;
 Mon, 15 Aug 2022 03:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660534711;
 bh=x6Ufi6V+zV+UUHpBPP6UaIyCon1vDe5ntCtT10dbDSg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=T/vcgrY82TaK0Bu2sjuWgNHP1OpAsCtbX1NZ0T3Hc5UpKj116Wx11HGkSKmDUfcDj
 iU0ps796psBgVH7kvqBjAsoK515JLdUZPQ9rpdiy6NF25XRKutYYman4GwgUcwFUGz
 UlgkjqBGqi84+bUAkCNUGjaEnFe1p1r9aSuhQS3FNOuYHm6Bn2YIUe8fXDwMcNr5cx
 mk/26xk/xOAVCwTU/W2Q/HJvdz8w+9Iz5AIfPRAOhM69XnHwpR26RwWlEdYYn+LMDS
 xBjpHfxZtObq7J6LzL5ADQePmtG4jeaiC04/k+rwd5e9GNpdErV4Z/6A1RQ4+yq4dE
 V0uGUPqeeXKxA==
Message-ID: <e1e012c5-fad9-cad5-9b86-cb504db71751@kernel.org>
Date: Mon, 15 Aug 2022 11:38:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Weichao Guo <guoweichao@oppo.com>, jaegeuk@kernel.org
References: <1660281825-9623-1-git-send-email-guoweichao@oppo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1660281825-9623-1-git-send-email-guoweichao@oppo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/8/12 13:23, Weichao Guo wrote: > We now use walltime
 for monthly period check. However the walltime is: > * unstable(timestamp
 register reset) and settable(modified by user) > * unreasonable(e [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oNQw2-002cJA-Ea
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: use elapsed_time in checkpoint
 for period check
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
Cc: zhangshiming@oppo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/8/12 13:23, Weichao Guo wrote:
> We now use walltime for monthly period check. However the walltime is:
> * unstable(timestamp register reset) and settable(modified by user)
> * unreasonable(e.g: device power-off for one month, no data changed)
> 
> When the walltime changes to the past before one month or the future
> after one month, the period check in next fsck will fail to skip or
> start a full scan. So, let's use the elapsed_time in checkpoint as
> current time for period check.
> 
> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
> Signed-off-by: Chao Yu <chao@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
