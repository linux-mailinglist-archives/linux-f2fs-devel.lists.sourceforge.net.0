Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 971C48C5F08
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2024 03:58:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s73uk-0003a4-Kt;
	Wed, 15 May 2024 01:58:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s73uj-0003Zx-Nl
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 01:58:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yVwscAQXO+v+6eU3ur5SW6trmL/BeMJw5Cr5EEYgVHg=; b=RR7qWFr9WN4fLwn9IYRsJD681f
 jIMuCosS/w1eBrLJN9Vh/KN00HhsJ8fJe2jOjVgfpzmireq4Edh4i96KdQYbOwcpBTNvLBjBqADQL
 gtEqu2VYGV9qLeymtTPc9W8TR1OQD36MAzJgKS3M8DC/6CJQ4jfUY3sIdnIQT43R9PGM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yVwscAQXO+v+6eU3ur5SW6trmL/BeMJw5Cr5EEYgVHg=; b=f0HxoVGsNmk+xzaDOMSCTeyZhL
 54/g5SMmPyn7WBaIqJhl+5D9IErF09UXgbFmC4psW9CyVcwNhbXwns1+OlJGYCIpj0X+5SzeJMLpN
 4lOjR3ZcUhf6BI43l+UWMKDUVh6yV26qnI+zD5zCkLEKNMhxcpcplseotp21fjGK4iX4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s73uj-0000zR-6m for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 01:58:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 18A126140B;
 Wed, 15 May 2024 01:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C09C2BD10;
 Wed, 15 May 2024 01:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715738309;
 bh=eAMbTEJdG+oSP4Dopd7Go4TxUCJqOn9CQQtm4InVAXs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=klRP/KZZhpdHfFbVBNSMoJrqwTgROgjCzQI9rSP4T3RgPUZ6u6OCe0mTA2OaBEkrB
 D+/gwTkvuNJuMT9Xs/Mi2L3N9RFCnNlpAMSzMm707OOc3mDEyiNOqn8QSiSJHlvH5F
 c8s0RmowFf+94Pp9CVSffiLQhfqlcZIe4XtooubSPgnoUr9rxU19dmt4CZcUfK+gTZ
 ugAFVhQ0iwSKXzQFHxOqsIBnyVk43/ghZx4Lsxrngzcv+eRdOz6vMnzRpfagoXr/MU
 4XHxwRk4eK2s1hvQ/VUA2qFRHNLTz8OMouxyoJrgeWNd+ZgW24dR9QWUURO85nNk4H
 g9Tp9tbkJER4A==
Message-ID: <c56a8728-6207-44c7-9ac7-649dcc8f4c97@kernel.org>
Date: Wed, 15 May 2024 09:58:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wu Bo <bo.wu@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240514113529.1498545-1-bo.wu@vivo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240514113529.1498545-1-bo.wu@vivo.com>
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/5/14 19:35,
 Wu Bo wrote: > Initialize last_block_in_bio
 of struct f2fs_bio_info and clean up code. > > Signed-off-by: Wu Bo
 <bo.wu@vivo.com> Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s73uj-0000zR-6m
Subject: Re: [f2fs-dev] [PATCH] f2fs: initialize last_block_in_bio variable
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
Cc: Wu Bo <wubo.oduw@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/5/14 19:35, Wu Bo wrote:
> Initialize last_block_in_bio of struct f2fs_bio_info and clean up code.
> 
> Signed-off-by: Wu Bo <bo.wu@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
