Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B860052D182
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 May 2022 13:32:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nreOM-0007BT-Qq; Thu, 19 May 2022 11:32:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nreOL-0007BM-Ft
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 11:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uz1DbQlDD0A6fDdTvWFQLojU7ChLx+yf08SDx6Bk/UE=; b=GhQtuJmZpvM1YQPnOrZmxkiG1O
 wnEesKXqb3Xb3bT6ln7aL8B2qBAvcaT0vS5Rjay+vZZRCOPzlTk9FvoKySj6/SmqlaUKBZaYL5iky
 NmTWXSmy9HHD0BQhRbWgvmsgS9oVEzUST/bRGveC6eavZuid6M4VY3fxMGlxEL+GsQss=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uz1DbQlDD0A6fDdTvWFQLojU7ChLx+yf08SDx6Bk/UE=; b=i9w/+frDPDNYsFPi/qdZ1ohM2T
 eXzua+aHasyGWoh7hkDrsMlthZaoozv/LgnQtMDi/Dv0aLCq3AZMOMEigQhYbEGGzi/xhAlS8O4p9
 mZo0x5ufcCgGk89Xk7d1GYOdC9qWRPxuvRJ9KfMHSEaYHqXSeAyRs8FESGwhmDFMAgOU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nreOJ-0093ch-B5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 11:32:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F187361B16;
 Thu, 19 May 2022 11:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58262C385AA;
 Thu, 19 May 2022 11:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652959941;
 bh=WSNgrScdYVOb8PdRhLZZOPUGsXRXWVNeSAmafVM+6aI=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=UGmFtSrBgYjFe/4zU7wHMc7NBG/UIVMQHNY2OXI++U9C+jtLXDxSco1laf133iBu0
 RU3/xC/xBgohjg3CY/eLKJRfhoPxKmPad3eA1wxTyW0IgfxsS285p9TWtizGSvNTWK
 /Eo++nJC+o9M6L3MTt9vp5L8jziYRQ3zN7th50lg4yMIbvS3kqwAdpVJVIHQjWjEfp
 7ZaD2tPkycWVEfQnoVD6yI/K2CJJjdMCJBtlOpoMwumx0qoP90YK2BjSewtslPh0/+
 ZiNZE7mz7gE611OFqnqErVlJApOnLu90Q2v+2KMhrP3yxCH76l0OHY1nwccbBOFEUz
 Y1Lxm5if0EOPA==
Message-ID: <86fa68bb-e80d-7fc1-a96e-18595e02247d@kernel.org>
Date: Thu, 19 May 2022 19:32:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>, tytso@mit.edu,
 adilger.kernel@dilger.ca, jaegeuk@kernel.org, ebiggers@kernel.org
References: <20220518172320.333617-1-krisman@collabora.com>
 <20220518172320.333617-3-krisman@collabora.com>
 <fb8aaa09-7bfd-7e2a-4cb1-de691fdb6408@kernel.org>
In-Reply-To: <fb8aaa09-7bfd-7e2a-4cb1-de691fdb6408@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/19 19:27, Chao Yu wrote: > On 2022/5/19 1:23,
 Gabriel
 Krisman Bertazi wrote: >> Keeping it as qstr avoids the unnecessary conversion
 in f2fs_match >> >> Signed-off-by: Gabriel Krisman Bertaz [...] 
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
X-Headers-End: 1nreOJ-0093ch-B5
Subject: Re: [f2fs-dev] [PATCH v5 2/8] f2fs: Simplify the handling of cached
 insensitive names
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
Cc: linux-ext4@vger.kernel.org, kernel@collabora.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/5/19 19:27, Chao Yu wrote:
> On 2022/5/19 1:23, Gabriel Krisman Bertazi wrote:
>> Keeping it as qstr avoids the unnecessary conversion in f2fs_match
>>
>> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> 
> Reviewed-by: Chao Yu <chao@kernel.org>

Oh, this should be replied to v6, sorry.

Thanks,

> 
> Thanks,
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
