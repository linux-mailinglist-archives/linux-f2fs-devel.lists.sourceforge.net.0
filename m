Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C68C590C0E1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Jun 2024 03:02:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sJNEl-0006q0-9T;
	Tue, 18 Jun 2024 01:02:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sJNEk-0006pu-5R
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tgBnCxe3sOcZVGKOf26rTeMSqoh+k5fbCtix2ox1j0M=; b=Ax8nUuYMIv18vLvv8dg/lRv6Bi
 S9MRmRndiLNkRYfy7mc85X0uL9m8K4wRcNRMJUFp2SXDv2BZBkn+EdpQkDkmGv0OVYt5c6802dGPE
 UTVBroO1ywn0Kv+KFs/9pFwznWtJg1hIJpxny+qF2h++oCPx3RvNHD0rQNizDjOMtZuo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tgBnCxe3sOcZVGKOf26rTeMSqoh+k5fbCtix2ox1j0M=; b=ifRrUT18QoKaCSDqNrelHy+iVf
 2AcXKVCPSljhSUiZMcz5RTNyRM0ixsDODVyxlmNTj3nCicYUvnn3iGHZZGqII1Redv7DRPjjos2/p
 HeC8ggUrSnZDWy+osQWJ8d1CQ8evKE8Ht/ZfbwEX4zHC+kn6SDzDaVvDc2LCdVCg7k8A=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sJNEl-000639-Bh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:02:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DE0FACE13F9;
 Tue, 18 Jun 2024 01:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE69C2BD10;
 Tue, 18 Jun 2024 01:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718672522;
 bh=lydhvMk1/cTBLc9nkGWn8WKi5PQNxBQkD4/oF9bwnq4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Vn4xzXW9qBc+/0mEK8hTzSpHbMEh9OAfBqx3fgCr3bmVyJByt+qYOLEfwYhH/OoHs
 nLABGnKfoLL8ZtvhpuAaGNAsleK30zSOKcI5ALS2QK9in2774n+5BMB1vPqNdZS1M1
 e2FJNcpMVoqdaaa8BNM2D8cCmINFO3mWdDRd/NZAWSO+td/dVj8FFEPYeRTc0jtsa/
 7FW8cRW8S//slPgoHtQ+cAHV+jDl8LcGmN6gxHMoFp9lGnBYZbF/KTqHKt3G2av+Ek
 2y4DowGZK4CXqCWAlepQJIS3zdPqjA6G3tH2ewaDv+Xh7llr2MqI4FZKpfAS70GUaM
 6qznEPD0tT/5Q==
Message-ID: <5eb12aeb-a898-4fcc-9f60-037458905929@kernel.org>
Date: Tue, 18 Jun 2024 09:01:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1718271333-32179-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1718271333-32179-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/6/13 17:35, Zhiguo Niu wrote: > mnt_{want,
 drop}_write_file
 is more suitable than > file_{start,end}_wrtie and also is consistent with
 > other ioctl operations. > > Signed-off-by: Zhiguo Niu <z [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJNEl-000639-Bh
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to use mnt_{want,
 drop}_write_file replace file_{start, end}_wrtie
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
Cc: Hao_hao.Wang@unisoc.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/6/13 17:35, Zhiguo Niu wrote:
> mnt_{want,drop}_write_file is more suitable than
> file_{start,end}_wrtie and also is consistent with
> other ioctl operations.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
