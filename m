Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C463C7EC65A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Nov 2023 15:52:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r3HFy-0003yc-9v;
	Wed, 15 Nov 2023 14:52:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r3HFv-0003yV-AF
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Nov 2023 14:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zuPEzervu7zJ8vhDOsN3IkJy0wmpU29IEsB3LKQIFGo=; b=eZS58cNhgkl4X2B3UjiHjPc0UC
 X9XM3Fde3HrVpd8UTGUWsIPoYtWCP8Iop1ZJRr71bkvzG0Od4SdEKw+U3ZnT5+NO2jkg0pVfbmsWL
 PfYmxFVxAcIkVQxCouxN41l5FSnK63BEZtWJVB/tnoFkgZKhkVslNzvzshoJ8KCLqP8Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zuPEzervu7zJ8vhDOsN3IkJy0wmpU29IEsB3LKQIFGo=; b=gqMs1ug6WIRnosjLWhM23SbI9X
 Fu7XWcEhV594bq9AVTFQmWwbVwY7OSoZPzNqU9UM9CMer5yYHtcfX7XZL7nHGD6IUHWy5iWy6WH8R
 Ti1u+Zs1ufB6yKcFPYAkVytYe8/MTh48+XzADzKcq6RHsBM9wJSAO5mgYE29EdAqcWPY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r3HFv-0002oz-38 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Nov 2023 14:52:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B16966166F;
 Wed, 15 Nov 2023 14:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A45C433C8;
 Wed, 15 Nov 2023 14:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700059953;
 bh=7qrZK4ggcFRaOA/zhECZHHj8eddVbuixMF/Jksd0y/U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AgklWTk0BSaawUGJ+5SzMBVsrTYyhwM6e1+ts9tWmQvCLvEXSh2HFsPjE5dYX8i0r
 Q6KlXuzUI8kfx5pdPb+re0KxV9PXODsFlCksI9RbLQ5ZEb6MlbG3NTEzbeJWJvxbIB
 /s5zG0p9xOsPQ/mD5XWHzFrZaid6xV03Nk9/HX7O4HfcE2pu34dRALX2AHxH2Efiw2
 wMYHA6AzqtwyCL0Mbbl/tYvf3LnwRmyjPfm8+SXQVN0vCcXtHVOi1MSRGGJZaPBhgn
 YDmEM501u9WOF5HeqyDVn68PC6ALxTcUVm0MGJmxDpWTNsuf8fUVoWEXhpVG00uaS4
 ArKrLODnXZIjA==
Message-ID: <4dfab9ac-8d62-3a7e-04f1-219d496f97fe@kernel.org>
Date: Wed, 15 Nov 2023 22:52:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20231027153043.1381438-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231027153043.1381438-1-daeho43@gmail.com>
X-Spam-Score: -7.2 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/10/27 23:30, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > We might allocate more node blocks than
 total_valid_node_count, 
 when we > recreate quota files. > > Signed-off-b [...] 
 Content analysis details:   (-7.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.9 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r3HFv-0002oz-38
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: use total_node_count when
 creating a new node block in fsck
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/10/27 23:30, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> We might allocate more node blocks than total_valid_node_count, when we
> recreate quota files.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
