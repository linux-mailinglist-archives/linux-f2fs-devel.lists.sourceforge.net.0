Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94122614E7D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Nov 2022 16:38:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1optLb-0005F0-Qq;
	Tue, 01 Nov 2022 15:38:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1optLa-0005Eq-Iv
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Nov 2022 15:38:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+qgJIBP+WfUFGan0H3FFQDG8E59nIenU+axObgJbwJU=; b=ApYZHIKXOM69OZO6kEkIXsTejK
 ByyOQ3MbMlhF0wH3vCZeKTTUq34VqENGJO2BjPbxzQEbXQXh1kgV8vn+BGsEtkH8va6mdmT/UqKKc
 LPV2hxOJF8ksPWxXECjR6rT/fCbb7M/GfA4M5EJ7RtYG3SWwDVSZdiYc0PJ7qMo6UWHM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+qgJIBP+WfUFGan0H3FFQDG8E59nIenU+axObgJbwJU=; b=lTq7+NQeroJr2QsqDLpYMNzAmB
 uIa5dgjU+uzydsLT+8V3QRpnpe8L2vrWzoKwihMMuqFT35NKMYOdQY9Tn7stwENsGFj60IX8FsxrH
 +1x6RjiGFKKNgYjtXwLmRYuXbjj6fMmvQLBBlhXGaw01ZZ4VU8jycd624JiiJ23L2Xd4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1optLW-008EZO-5X for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Nov 2022 15:38:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DF877B81E7D;
 Tue,  1 Nov 2022 15:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AD7C433C1;
 Tue,  1 Nov 2022 15:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667317106;
 bh=eLNcs9IHbuiYQVyORygDQfCWPOxlH6OpvBlG7I13D+Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ARUXTBIILZCmDTJunf4wCNgC12sbCi57dUsh0OextE0Kbq7AUrlpoCYB19J+BrAM+
 VLS5HcuiozLjG9QmI3CqaVknLtnuZqsIwv2UJORDT5+QltRLFLr5OFiyYj94/A/DjO
 2Cdb/XZJv7k7r7hHpXFGHZoqGhdI2aA9doo1WK8eKBAuLohdLTz++OA0oLDMO4hQT2
 WI+rkXyBO/tFIkhenkE3H0HCAKh6IExvd73qSZznTenbOa9strGavGebDnD+mIphMU
 dXDfFPsZSqBIufzl9XivGKqIULRgY1DF3xnCXEjDjfIJlcJYCTXrBo06H501QcW9hE
 O15nmsy4l2FVA==
Message-ID: <35eb365d-7465-95a7-d280-fd39d59f31f5@kernel.org>
Date: Tue, 1 Nov 2022 23:38:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: wangkailong@jari.cn, jaegeuk@kernel.org
References: <44b06118.3c.18424382765.Coremail.wangkailong@jari.cn>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <44b06118.3c.18424382765.Coremail.wangkailong@jari.cn>
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/29 22:49, wangkailong@jari.cn wrote: > Fix the
 following coccicheck warning: > > ./fs/f2fs/segment.c:877:24-25: WARNING
 opportunity
 for max() > > Signed-off-by: KaiLong Wang <wangkailong@ja [...] 
 Content analysis details:   (-6.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -1.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1optLW-008EZO-5X
Subject: Re: [f2fs-dev] [PATCH] f2fs: replace ternary operator with max()
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

On 2022/10/29 22:49, wangkailong@jari.cn wrote:
> Fix the following coccicheck warning:
> 
> ./fs/f2fs/segment.c:877:24-25: WARNING opportunity for max()
> 
> Signed-off-by: KaiLong Wang <wangkailong@jari.cn>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
