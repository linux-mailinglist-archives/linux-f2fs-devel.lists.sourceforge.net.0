Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E150690008A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Jun 2024 12:20:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sFWhV-0003Fj-Pz;
	Fri, 07 Jun 2024 10:20:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sFWhU-0003Fb-4B
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 10:19:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fXVzFA8ekCaOObhktETICjicafpGnFxfMLMDPDZ6d8M=; b=cMY0PMWMhFzufDKTvRR9CTN2TZ
 nWXSm16uah2D6amGbKw+BMwnHGAWi4K1kK79TwZVhU+V8mY235u880Kp38p8yb2UkFK++TjVQdl8R
 /wBjtn8NQRCBFuvp5RELbTxxkXJXzyIs/iKUHdfGZNw7T9SYOWvGgewov7StWnfBCaBE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fXVzFA8ekCaOObhktETICjicafpGnFxfMLMDPDZ6d8M=; b=nOJgQwnYaOruke0HNNdyePKit+
 J6GK9L/sCZxpgklA6p7Moj+tBNSZ5p9WabZsX6M3m1G8EAkWBfc9zoX85GRfo3KUtNlx/aoiOGT0d
 1TvBi98FNp+k2KQnr5ScgbIDJqJZLTtypP+TIyAZbvG+FKmN31peEL1xk0zVDejyZZbA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sFWhT-0008IH-Iw for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Jun 2024 10:19:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 185BACE1CCA;
 Fri,  7 Jun 2024 10:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809D7C2BBFC;
 Fri,  7 Jun 2024 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717755586;
 bh=UDRdVHfoeHw5GgESiTH5mQcIZFVsyDUAxraCIbMR2oA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=U9hMoU0qNRHOQN2vMmeLVwX8p2pufe+zrcuKIWL9+lJw0Pis0791dIqdpjeStjeZQ
 RIoCHCZ1IfgYyV1OUqfbP9HXZIXBkU3+QFLsJ1f4+ci7taYUdu4xjo24Txl+dy+sxi
 r7hXR1o/PKRB+ao4caQDvOjuHFJF2O04b1UD760+dB8JvW8YAVEqUrlk1SV47zMXDz
 XvmFWRgNdQ5bQ18mTdD+PPcbdurqYSjiMFy3djsLv5niCKBQtfjhufpkgL19sld3DD
 diKavsWdsXsaOIrPi9I8CWncGP0DyEKFpQBfknCd0wRPt7apdwClLLs6AE/oAPKD1N
 t6WKWBOLEndJA==
Message-ID: <d9869426-a1ac-48b9-8d47-3f68375ff98b@kernel.org>
Date: Fri, 7 Jun 2024 18:19:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1717750830-15423-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1717750830-15423-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/6/7 17:00, Zhiguo Niu wrote: > Now atgc can only be
 enabled when umounted->mounted device > even related conditions have reached.
 If the device has not > be umounted->mounted for a long time, [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sFWhT-0008IH-Iw
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: enable atgc dynamically if
 conditions are met
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

On 2024/6/7 17:00, Zhiguo Niu wrote:
> Now atgc can only be enabled when umounted->mounted device
> even related conditions have reached. If the device has not
> be umounted->mounted for a long time, atgc can not work.
> 
> So enable atgc dynamically when atgc_age_threshold is less than
> elapsed_time and ATGC mount option is on.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
