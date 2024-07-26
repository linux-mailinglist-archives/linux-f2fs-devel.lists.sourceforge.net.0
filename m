Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C816D93CC42
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jul 2024 03:11:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sX9Ue-0001pV-6C;
	Fri, 26 Jul 2024 01:11:35 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sX9Ub-0001pL-R4
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 01:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L2gT90mlwN16/qr5Uy87u2NSmqNTfZBRCRkGUzKGDPE=; b=nTPgORQm8rpb20H05mgvR4oZvs
 b7hUTukeZwwjnoheQ+Q+dFzxHRWaOMCcXbQr1Wahw9ze42lKv3R1qrgZcp3/N3NGoE8JXHGynaZP6
 RD0ref1QtK+l5JtzKMRbnT9jxu/rmivxlC83FKKWSXupYz6TXAx9+CH94gdjrySu7L1o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L2gT90mlwN16/qr5Uy87u2NSmqNTfZBRCRkGUzKGDPE=; b=BwBQ65Sg3BYw7KJNqXAjIrLNsO
 1VRnbPyfK23VQPkhmvXfNcsEkRPjJJ3STZ/PHKbSFo/hhSZcqXm2A4jrgiBLJMbc5mMEiEHxsN9zF
 6bj1NAzq1au7C+gn47i/zha6AZuMGPzPtJsCfYSL78Vc0JHYv+94dwwObISvW0nql75M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sX9Ua-0002oZ-JM for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 01:11:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3B54761465;
 Fri, 26 Jul 2024 01:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19EA7C116B1;
 Fri, 26 Jul 2024 01:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721956281;
 bh=YAjNvOSyogpSV3tNmzLeEiynMECc4iXr9l9KsxOPfHU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hytIS8OD3f93Kzs95TSfaRO/FM3hbL3fE01E4/pX+pR76+WAlkOFM7pCRVwANTYEd
 yoryZ4Xnc3uOsNwZSjUOOyGt2fxOxgA1vVOHnETywWhqUJvh90YfOPk3nMq2oNDVXa
 QJPm+kX635TB8hYSDMSmGbYfw2BiRp0NZdHztSFLutmwQ6Kz1CBpLW81B7QdUhH2lq
 naG2CFKYfp1gQmG2u4XMAex7JOzWe3Cb1pWMVKGG2A5Vswiv+WxWVSfvJEsSQ+Aeas
 N37jT4aE1A3XSkjz3D7LwazK9Y8VZJjVadws4n7YlupjjLcHIGTtW3dDI2Qar5XFWz
 gv8HKZLvrPXRw==
Message-ID: <29af5371-5bd9-452b-9562-089971b6c1ce@kernel.org>
Date: Fri, 26 Jul 2024 09:11:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julian Sun <sunjunchao2870@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240722023913.54788-1-sunjunchao2870@gmail.com>
 <20240722023913.54788-2-sunjunchao2870@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240722023913.54788-2-sunjunchao2870@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/22 10:39,
 Julian Sun wrote: > The macro stat_inc_cp_count
 accepts a parameter si, > but it was not used, rather the variable sbi was
 directly used, > which may be a local variable inside a f [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sX9Ua-0002oZ-JM
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: fix macro definition
 stat_inc_cp_count
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
Cc: jaegeuk@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/7/22 10:39, Julian Sun wrote:
> The macro stat_inc_cp_count accepts a parameter si,
> but it was not used, rather the variable sbi was directly used,
> which may be a local variable inside a function that calls the macros.
> 
> Signed-off-by: Julian Sun <sunjunchao2870@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
