Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7148E5774EF
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Jul 2022 09:23:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oCycI-0005rE-Ou; Sun, 17 Jul 2022 07:23:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oCycH-0005qp-T1
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 07:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q1yxR5CxsGKAunykF7WLC9SwyNMEC8tW59SP/bXVo14=; b=N3rxpN9IDFXA6iwQDdEinmHvr7
 aHOl/WHTLZqJxUfc0zTdMU8/HVSgK5Oh4yScWMvgqPoiNtLloy9XODmA2sT2YLC+rhEkSWm1V1wkx
 D6u0FSkgAA5gk7sjapo5/GD50sh9C66vPGKAEwJzbRs9PRbZo8NgbaAnBakNgQLIFLI8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q1yxR5CxsGKAunykF7WLC9SwyNMEC8tW59SP/bXVo14=; b=lBKpBL95JnG3ltbtQjOQDHEYHV
 57pc+9rSrIf1/R29vHwwJpFK+vjHganQYS9Ww5ClMaKBX01pIkDZkoCdehdAlePCUmkxU+sinq9fT
 hg+YSJ2I+whVmkwybfo363/iQ4HoVCwJpno9hXVGeJRtVR/6jTiJtG48pf6cxedcFJKU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oCycE-001cgs-Kr
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 07:23:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E3DB60FD7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 17 Jul 2022 07:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054A4C3411E;
 Sun, 17 Jul 2022 07:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658042563;
 bh=uowBzTAtI0/7jqB0RPR1OcIA4voVXuqAMxbVN+P/1WI=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=HULUngCpkNemnED4/Sj1y39sLFVZwtYsM955a3BEqiBcsnmjSyP7X2Cbe/gnVY82o
 9qNYYP7SN6RwAe5N+CotE0c7bWNlwdLXL1sYOhEnwuDxtEX4WU7THJmd/6WVBMZcfm
 DY1FhyvqSIUEJf9n/nhnHIa1m4fRAAtw3SgF+ltbzs+Vaevw7VkN+81HWw6Je07xEW
 U6pOvSzley87wcWtWf2cIra806qX7fjjUfkBaVfkaWz1bTN0EzwlFIg6wuje3PWb3R
 COUI1w4UHmIsEd1OSy2n71TPcz86CGx4emfVkkx8gnDUILvPlmm5qT532nQ8SGUvXX
 uKF7Beo/1jG6w==
Message-ID: <b1a70a93-6773-ba7b-5e15-259a6e23793f@kernel.org>
Date: Sun, 17 Jul 2022 15:22:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220628234733.3330502-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220628234733.3330502-1-jaegeuk@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/29 7:47, Jaegeuk Kim wrote: > In order to simplify
 the complicated per-zone capacity, let's support > only one capacity for
 entire zoned device. > > Signed-off-by: Jaegeuk Kim <jaegeuk@kerne [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oCycE-001cgs-Kr
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: enforce single zone capacity
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

On 2022/6/29 7:47, Jaegeuk Kim wrote:
> In order to simplify the complicated per-zone capacity, let's support
> only one capacity for entire zoned device.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
