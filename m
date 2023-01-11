Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39884665C13
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jan 2023 14:03:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFall-0001td-78;
	Wed, 11 Jan 2023 13:03:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pFalj-0001tX-Ef
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 13:03:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JFFeJwsNL7vrFPoOZYxHa6dFxzRfKiuqL0X9VI6nNoM=; b=WddoZ0RaDQcnIToRbAubxvrjvQ
 Ca4nzPOY/ALxZs+e1GHH3c5eB0JY76P/e5Nzw6eIf9vs4853vrVVcPoV+5M9/tIJ+eOE2Ys08dTDG
 r54aVOElhB7dsIFtKf8pUotnHK/Bsf76unVuEs23ofqTPoz2kxxzMnMg5v5YZebbW1II=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JFFeJwsNL7vrFPoOZYxHa6dFxzRfKiuqL0X9VI6nNoM=; b=mtQjQImhitKFfUXmh0eZqJCHE0
 5DD5vShFVgFBCKubaK6kfrsSzf6F1Up0/ifDmGgbzJWKrrpblu5UAdK2EBvYkD370LVNBBXVsbtxW
 99QS3oqaHSKOVWfKMO0ZUkBeDCVLOddIXeVcZYtVPj+eba2XxeLDkYq1sxKWZFw/MY7g=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pFalf-00DtAR-5C for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 13:03:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B874E61CCE;
 Wed, 11 Jan 2023 13:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A200C433D2;
 Wed, 11 Jan 2023 13:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673442221;
 bh=VlfO6Qwp55YL1PrQbphBkIA56AcamC+zqqLztNevUI4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=REhrvEf3KC5Ha+kBM52fG+E1sLDzGKvmZZ31OWF0fAjrRneseABYu6Djq6kA35uaj
 +IFM3FLexUVcRRa1mu4QnoP608uiBhthLOaMqrXnzTRC2MRHijB1NLGPIXsmtKlaC7
 NwuWeBfOW8SPDlTW9CGl0h2mg/KPT7Idy2t3smu0mVdxZP0CGzPre1Kz00d8PDNR0F
 2XyU1wyqRF/v0ux0vct6kmRnrIz5zDw6I9Mj4Wu4J6dGd5+Ong0caslne49YwnQSWe
 SuqIPJqcG6QLHkVGLChMoEV0OoGCDv6cA6sycYFeeu2VhR1d7bSyMmnZzesnbc73nd
 J5HDxRxAh9HTA==
Message-ID: <f1c1894e-2899-9b7d-edd9-bbb13864424f@kernel.org>
Date: Wed, 11 Jan 2023 21:03:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221129122928.23730-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221129122928.23730-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/29 20:29, Yangtao Li wrote: > The current logic, 
 regardless of whether CONFIG_BLK_DEV_ZONED > is enabled or not, will judge
 whether discard_unit is SECTION, > when f2fs_sb_has_blkzoned. > > [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pFalf-00DtAR-5C
Subject: Re: [f2fs-dev] [PATCH] f2fs: judge whether discard_unit is section
 only when have CONFIG_BLK_DEV_ZONED
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

On 2022/11/29 20:29, Yangtao Li wrote:
> The current logic, regardless of whether CONFIG_BLK_DEV_ZONED
> is enabled or not, will judge whether discard_unit is SECTION,
> when f2fs_sb_has_blkzoned.
> 
> In fact, when CONFIG_BLK_DEV_ZONED is not enabled, this judgment
> is a path that will never be accessed. At this time, -EINVAL will
> be returned in the parse_options function, accompanied by the
> message "Zoned block device support is not enabled".
> 
> Let's wrap this discard_unit judgment with CONFIG_BLK_DEV_ZONED.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
