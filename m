Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A3C62835D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Nov 2022 16:00:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ouawP-0006IV-Vo;
	Mon, 14 Nov 2022 15:00:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ouawO-0006IO-EY
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 15:00:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g8YJzLjsD7lWp7wc1/OWmbclEYwTW/MqOscrb6HT2G8=; b=BYs3E3EtV4sx7VVtvDrLtEZoV7
 CnJ9rYJ1VLGC6OKgYDk0W1QyiiInXsO63MDQEOOodkER53ZzcynzMIKNj6kUtS44nhAsQXdt6GzAu
 NFoiL5wszxvKS76ORbfalyAmqYRAmFB62U5b4g5SgCCwUJMFod6tOy5MpclN0QvxqVvo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g8YJzLjsD7lWp7wc1/OWmbclEYwTW/MqOscrb6HT2G8=; b=MLGnFIHJfBL3XPIjb8RCwJKFCv
 VwRGS/7Q6RYdPnH1Qu3kYT0784fU3ezbxV/kRiE0fKDBNA1L1cOm2Rm5bSV97lUgIIVoMKhl9GYIO
 LWhGNgWhS3Z5bv0YKX671azch9R515T2llaD3D/3ttjraOrpCi5e4jRxqIFh+4HhroZU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ouawN-0005ov-So for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 15:00:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E49F611CE;
 Mon, 14 Nov 2022 14:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2377AC433C1;
 Mon, 14 Nov 2022 14:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668437998;
 bh=sITkKjGlUDOGb4htxFTEW3fCbbUPvKi/wzeGDD9bkkc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Xl5hzGEYNh2xnUmKaxA3Gd6ZZJXh8vlcxdc3e88AQrRK5eCjzgNTpLtvzhPXSdgnu
 l2s3VBOgglKbm2k3ghrG7qN2AWxcfcEwiKr7yXp+ObuGHJwSID4aZrNdFyRxWF0ikJ
 rmR503HkU1EPuX8rxIOXjNTr1mb4HGXIKAmSZ4MD+9+8YquRPnuFKZiyeyLuRMNTDj
 4mGUs5uawOuCTFGGHziVLJyLuUPHFec5lJfjbulaIF47Wa2rWSwbDDjbBnip+g+11u
 l+oJ9/fpBqAsFdgw7cdjxWkRO56LvBZ6tgry3e3YyApeBmPh309KFzmMsFaaLrWvcS
 05G3zlXwRKreg==
Message-ID: <59636098-e64f-96f6-e423-3e6746be8158@kernel.org>
Date: Mon, 14 Nov 2022 22:59:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: Sheng Yong <shengyong@oppo.com>
References: <12baae96-c00f-a127-3db5-49160cdc46e3@kernel.org>
 <20221114141700.435589-1-shengyong@oppo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221114141700.435589-1-shengyong@oppo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/14 22:17, Sheng Yong wrote: > There is no need
 to recalculate ADDRS_PER_INODE and ADDRS_PER_BLOCK, > especially in a for
 loop. > > Signed-off-by: Sheng Yong <shengyong@oppo.com> Reviewed-by: Chao
 Yu <chao@kernel.org> 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ouawN-0005ov-So
Subject: Re: [f2fs-dev] [PATCH v2] fsck.f2fs: avoid uncessary recalculation
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/11/14 22:17, Sheng Yong wrote:
> There is no need to recalculate ADDRS_PER_INODE and ADDRS_PER_BLOCK,
> especially in a for loop.
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
