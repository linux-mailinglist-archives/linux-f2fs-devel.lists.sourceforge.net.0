Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD32721D1E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Jun 2023 06:23:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q61kn-0005fR-AF;
	Mon, 05 Jun 2023 04:23:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q61km-0005fI-FA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jun 2023 04:23:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wvYtIDvoeR4E1coHiLMrMvQIZx/oeNjubhIP+pLItOU=; b=Rh/ydjooV4mO9ccPWuh3KoJKmz
 6DmRhsJLkjpv00NmX81m/bFEManT5lgdusbz8GrufNQ+1Xg48fOdhYOGpmsGjsk2MmE6sKpqBGR0m
 9Ppt5VnxU/OA3t4GWHCzU4RZSdl/SLMsTOy2xoswm9LP2+MR9bH9TpK6b/+1EQ761t28=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wvYtIDvoeR4E1coHiLMrMvQIZx/oeNjubhIP+pLItOU=; b=a/QL8kr75CbWT2eJmY71UzTGrX
 kHFC2iBck73kMcFJ3n+bmcbHUHCKfUPurt7W0IomUr64o+S/lUcvJ0rWoY4qELveoPTjYLaNvikyw
 dVhg4JoW2cCxGvpWvaj4Zh7+ZfmNH1Nzo+1AgsmoMTTXqrdWYoGBWkmID4q5QmDRpHyE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q61kl-0006nr-U2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jun 2023 04:23:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B356060B52;
 Mon,  5 Jun 2023 04:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A14EC433D2;
 Mon,  5 Jun 2023 04:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685939004;
 bh=WQm/G8rnRw4T32/JbPBiCLVq2WqdEuDsCladOCItvQ8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=V3c7pwj2/R+d36mSLkXw0PQZhxgtvs3KEMECjccoyVjHWi+J10mD04YKI+MLX0WKh
 iESu57hzD1jpsVfBmAQEmjTk26e4ZdinPP0gpwoBEHHJKJmS8xS46b/vKt2f0S0a+x
 EWygiioKHgLt9nJ2Vbcg12c8pEUmW1+vfyUHXYAnD41hk60VkU9kmf+xlUWl5TiYyc
 ix2B4fRtK83YdAriiNGj/MA8FArGZU0i3r5u/qzP/NHF65GvB2kca6hSGjz5Dm+Q35
 IPbyfHeupgK2euIesIz11gF/r2+1M/22CWZW7eY+LnCT16zJcTqlFz97IqW3UcVQTz
 al4Q/qySehUuw==
Message-ID: <e6c9118a-c509-6ba0-a485-454f1bf47083@kernel.org>
Date: Mon, 5 Jun 2023 12:23:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Maxim Korotkov <korotkov.maxim.s@gmail.com>
References: <20230602102607.602859-1-korotkov.maxim.s@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230602102607.602859-1-korotkov.maxim.s@gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/2 18:26, Maxim Korotkov wrote: > The input pointer
 "parent" was used unsafely > before checking against NULL > > Found by RASU
 JSC with Svace static analyzer > Fixes: 603f8f9d3(sload.f2fs: s [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q61kl-0006nr-U2
Subject: Re: [f2fs-dev] [PATCH v2] fsck.f2fs: fix potential NULL dereference
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
Cc: Maxim Korotkov <maskorotkov@rasu.ru>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/6/2 18:26, Maxim Korotkov wrote:
> The input pointer "parent" was used unsafely
> before checking against NULL
> 
> Found by RASU JSC with Svace static analyzer
> Fixes: 603f8f9d3(sload.f2fs: support loading files into partition directly)
> Reviewed-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Maxim Korotkov <maskorotkov@rasu.ru>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
