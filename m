Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0245451EDDD
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  8 May 2022 15:57:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nnhPD-0004ba-15; Sun, 08 May 2022 13:57:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nnhPC-0004bL-Ez
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 May 2022 13:57:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SkRaiO1OlfUQCviVsKK7klG1HLkQMC1AWmlXcteNXk0=; b=bOSnjqJrIxI2dVE1Gt8nHTuh4H
 Hj7ZyvX2L9AkFlY9QG8+IdDaIMKDYbayY6W/6PJnBVqiH7TlutVJNSJOJRrrsQ9hbzkM4JGUALdBn
 Hnx3Sd3NS0qjTKWGMObxQT3YtKdzutenzB2xUAG8n0gC6ZS+V8u5vxID+tOjVpcVaiFM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SkRaiO1OlfUQCviVsKK7klG1HLkQMC1AWmlXcteNXk0=; b=ZOV0DrlGz9Wf9AHE3ClEJgkpVe
 YHVECF+pqE48jhAuP14doohPYPLG9pC8sL/0UQ18sL8AF3+5/4qozhGa6j6lcFeuPshFlScp1UNGS
 anLiLlQ8oDL0UgI18hjqTeGaDDegfjd0xus3MiBV49kdUBuZKUdn3TXCdiG7zzLxpRnc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nnhPA-005AB3-5e
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 May 2022 13:57:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA18561182
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  8 May 2022 13:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA88C385AC;
 Sun,  8 May 2022 13:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652018214;
 bh=KDUXg6wQIrBSossaHIc0SccEk18kHyqx02dOTOVJdjA=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=jKZqcHwaXEeRceMdiv9/HHDWuVo/vPyykTvxv0lzYlM3Cq7k68PHz8nPl6Yzr0El/
 rG3+SruZdMWsfP02uq1m1zwlGwGvQKaiUcRMo0SW1au9YLQQ6XUsdkEf8cbYjY/mOh
 +BIjwMw3vPxlaPdwfouAHr+i5MW/oDvL2q9d+LcJocEZ55QHMPn+1enFw4wYwNOEOz
 gEZD1YzrjVayJKOdoN/4hsMqBmw8WipWXH135EIpWagbM19+Je/c2SOS9T814iggBo
 V4sLZKOqeIG5OXHcWMAZ/7ebpiWnDos3cDzyf/oMf0hMUM+be6xeU0ujSMc8mEzYtl
 xxCxoDV2jrtJg==
Message-ID: <69976972-aa98-752c-88e4-95196762d7c1@kernel.org>
Date: Sun, 8 May 2022 21:56:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220506232032.1264078-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220506232032.1264078-1-jaegeuk@kernel.org>
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/7 7:20,
 Jaegeuk Kim wrote: > EAGAIN doesn't guarantee
 to have a free section. Let's report it. > > Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-7.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nnhPA-005AB3-5e
Subject: Re: [f2fs-dev] [PATCH 1/5] f2fs: stop allocating pinned sections if
 EAGAIN happens
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/5/7 7:20, Jaegeuk Kim wrote:
> EAGAIN doesn't guarantee to have a free section. Let's report it.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
