Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 676547FB1E7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Nov 2023 07:24:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7rWa-0007uB-3p;
	Tue, 28 Nov 2023 06:24:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r7rWX-0007u0-S1
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 06:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q2gA5M0Ch//UFxAkahlsGH9QU9zjkn4kpQTmFW/n5wc=; b=IHkMYjEPye2L1ql/ahbho4NmCo
 myqDvy3n1x9r2TdsQWZJMlafIqCpGx2nPZte9M8a4bY0Uaa3gAzMrARmxznpudVUaTGFAdTBDV6aG
 rTfva33h5GpjxMbJsVa1XFEF4/U0w7AN11RmzMN3gsRR1W5HlSnONNPpUe7BSRelwhws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q2gA5M0Ch//UFxAkahlsGH9QU9zjkn4kpQTmFW/n5wc=; b=iE3enmE3nBNitrfq22k6vU/wpW
 ruK6MqEYGOwRp6IBbrG4ms4864mI1MSPhZ8QJXWn/obKGtW6NkJdRc1/BTXKindvlOx51ECIEbTtp
 Lh7HCURr0sOdkfm5xbROLh6z2RPs7LWDwFQCA0gq8kpJkRwtW48p0nYYGeHpPAaevLTU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r7rWX-00072Y-LQ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 06:24:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5D623CE1133;
 Tue, 28 Nov 2023 06:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE2AC433C8;
 Tue, 28 Nov 2023 06:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701152662;
 bh=q2gA5M0Ch//UFxAkahlsGH9QU9zjkn4kpQTmFW/n5wc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HGArxZdm+RvT19KXe5Cu3uBMvgGbj+DMA86lZk9q4YIcKfpa6djAuryjVcqMylzA9
 suNzAWYV0vQq4XolZmKbJOKs+ydh5O/HfFK/BtmMDcO54/ZPvpQ+matnFT2mKy4z1G
 bORaQGZnD0Xp13NcC7J5DV7GkBHLkvk6DfB13Djeoipgdw4JoQfR898xc4P63t7zac
 nWeUW2medufxCPvkuORZRWLfU4oT4cc5DGhTIfXaEsicfgmmZwU+9DfYc4/egJF2hB
 trVn7ZwR+NLigl6WaC3ttrZggJe4HjkhuxiOKlklHMv3vRYsgoWEOVKdoqO6HaZ/5D
 MAPkJQZv6JUyQ==
Message-ID: <419fca3a-660a-262a-da9e-b8d5bcfdbb24@kernel.org>
Date: Tue, 28 Nov 2023 14:24:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Maxim Korotkov <korotkov.maxim.s@gmail.com>,
 Aravind Ramesh <aravind.ramesh@wdc.com>
References: <20231120065507.423065-1-korotkov.maxim.s@gmail.com>
 <20231120075504.455510-1-korotkov.maxim.s@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231120075504.455510-1-korotkov.maxim.s@gmail.com>
X-Spam-Score: -4.4 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/11/20 15:55, Maxim Korotkov wrote: > Case of failed
 memory allocation of dev->zone_cap_blocks > doesn't release heap allocated
 rep > Found by RASU JSC > Fixes: f8410857b7a8(f2fs-tools: zns zon [...] 
 Content analysis details:   (-4.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.9 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r7rWX-00072Y-LQ
Subject: Re: [f2fs-dev] [PATCH v2] f2fs-tools: fixed incorrect error handling
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Maxim Korotkov <maskorotkov@rasu.ru>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/11/20 15:55, Maxim Korotkov wrote:
> Case of failed memory allocation of dev->zone_cap_blocks
> doesn't release heap allocated rep
> Found by RASU JSC
> Fixes: f8410857b7a8(f2fs-tools: zns zone-capacity support)
> Signed-off-by: Maxim Korotkov <maskorotkov@rasu.ru>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
