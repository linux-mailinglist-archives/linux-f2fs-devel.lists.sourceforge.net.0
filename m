Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B53AEECA5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Jul 2025 05:01:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JjaaOeU8LuDN4ORxIP//BjGwjUhwK+lRkGPknCrdFM=; b=fn+cIDxIZL3KJICLnOsRZe3vNT
	ccpm50q2GiUIMyPKBTza6gXYWoANp/Q4QsIQLE+YRTOiQIPEyJOg4Jl4orwUKFz+EsNxWBPPALbnD
	uSgb72INIJH12v8krx6Q/7BPXdHypW56iOygaX+/zYTEJKn9NRrV7OJFt8GLrMs35Yjw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWRFW-0003gM-NV;
	Tue, 01 Jul 2025 03:01:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uWRFV-0003gE-Hs
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 03:01:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V3CQzvi8nRfWddc2RTTX+LBXVbdOLezDuXh1EnsQMMk=; b=jBCsGi0vwLAMQmKLDOI8p17YLe
 KYgrpHQkAfWQr2MtPGPm3UVN4UgwVQ38dS8QkBvKLCNR8Dhtc9fyGx5d2QlqNDNUfuUwApLmSGh66
 Elc5qr3053fYr+/OsSYOag1S53q5UrUuH/G/Lt8d3ghSl5BnXAmfnIylZBW7KN0ZCKq8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V3CQzvi8nRfWddc2RTTX+LBXVbdOLezDuXh1EnsQMMk=; b=YGJdPzUsYXGRJ/WonplFx9xUro
 nox89iXP5D8b81DhiYYmk9+wtHdEoQJpsA58j+i3jGYxvdspoc1SmVrlSI4HY/gFKh9A14xYPUPtW
 blGo2WulogCWJ+TbSVSmY5uwu3SOhEf6ae69qw1IWTbg1+ZNrINXHyEkFdQECuD1lvlg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWRFV-00042U-4N for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 03:01:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6FA4560053;
 Tue,  1 Jul 2025 03:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED6CC4CEE3;
 Tue,  1 Jul 2025 03:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751338887;
 bh=hdnApl4/Gk5OHftwPeg37vTcl2zebPR9fDoMLMAMFxY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=jvxGnFJT5tW0hbt0rkiFLAohxHl7f5GP4w7pyytqpGcRbYJk6bAg3Kr/PytlY2bUO
 w7rJGMcTmMCkCYlIhyoGFvlnZIfNOUagOzsM8fv4HrVPAmhh2j7Z1eGgqn66JR1a3t
 +OOFBBQcEYt0VjiC4Bk9mLb58e1hK4u+rxNNctZ56OVmZ5wPnRgxyXi/a2E6c+dEOP
 J6Fhs/ldO12ZyzOeE1M9V0N6QoqIv+7okmUZybTIJyIU68qjOif81F0zLoP54dWmMK
 r8z96eqrnSUdC6Ep1NmP0fdk6EhOu3t6llyLmgdhVVhZxjl1DnBMXVGPjY2dpr/QSn
 gpsAHj26ZUqKQ==
Message-ID: <c5a47888-9a6d-4a2c-9861-c9503cc55701@kernel.org>
Date: Tue, 1 Jul 2025 11:01:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jianan Huang <huangjianan@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
References: <20250630125753.650630-1-huangjianan@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20250630125753.650630-1-huangjianan@xiaomi.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/30/25 20:57, Jianan Huang wrote: > When fewer pages are
 read, nr_pages may be smaller than nr_cpages. Due > to the nr_vecs limit,
 the compressed pages will be split into multiple > bios and then [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uWRFV-00042U-4N
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: avoid splitting bio when reading
 multiple pages
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Sheng Yong <shengyong1@xiaomi.com>, linux-kernel@vger.kernel.org,
 wanghui33@xiaomi.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/30/25 20:57, Jianan Huang wrote:
> When fewer pages are read, nr_pages may be smaller than nr_cpages. Due
> to the nr_vecs limit, the compressed pages will be split into multiple
> bios and then merged at the block level. In this case, nr_cpages should
> be used to pre-allocate bvecs.
> To handle this case, align max_nr_pages to cluster_size, which should be
> enough for all compressed pages.
> 
> Signed-off-by: Jianan Huang <huangjianan@xiaomi.com>
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
