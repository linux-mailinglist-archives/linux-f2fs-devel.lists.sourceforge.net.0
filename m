Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A68977185F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 04:34:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qSq4Z-0006Wn-Aj;
	Mon, 07 Aug 2023 02:34:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qSq4X-0006Wf-Os
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 02:34:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VORas6zs4k3jSrTdDnDeRzH7BS82gBZHs2UUdvxKmJ0=; b=XawouIm070RJ9wh0PGjpU/8T2G
 67FKGpjrxaH2du/LMdlIzj8/yjwbFQuOtMQ6BhPdFdHIPDWlW/bWMF4hd5DXckL1GAi7wCQUb/D6K
 bui8L2mW+5N+pBovpMtkqJupT+mHBymmXBcepMyZIW5ffw9C6M8wNzgWv6Uo+UC44W9A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VORas6zs4k3jSrTdDnDeRzH7BS82gBZHs2UUdvxKmJ0=; b=MbuFlVCe85FfZydx6qA6CZ179C
 yTilglEsvBP4t8JzrvwZNP8n7F1y9J9ZkOUZ/kru5nQ7IBb1ZU3PwdBv0H98hZbFL5He/Xku1jS6Q
 ufbuWLKeEvdqfKUaDGIoHhylAdqpLbY9PdjnAcpZAKGlAQS/SwteEiwk12XqB43pTyDs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qSq4X-00008S-J6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 02:34:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D963561305;
 Mon,  7 Aug 2023 02:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F6FC433C7;
 Mon,  7 Aug 2023 02:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691375651;
 bh=61vgtDgDvmwOmVwPj/z54MsMRRdw0Zj4dM/8ZURrlos=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LHDWyd2Uiblcne4LguBEt+SuPu4ctHHQRbEtokn9moD6iik6Bi0oAJmzFRxVHQiWH
 gOCulZKdQWJMZkvxfZ6k8MTO1qe4lWEvE5XUXzQ4ijYEifO8hsW2BqmN+xTyN3oYgA
 0AyWblmw5M58b1efassXhLcwvFZ4Pwq/uKNh7urFFwAXCxyipo9SpAMoiT9eLl+0Ge
 VhMrc6LiumzOkahYT6ztGJ3UKr5rN+LR3XJw+NXTk9s2g88t30y/fxVBTTaogpeLn8
 MT9fZI8GBL+KQOa2KHtNISgysxv1IXlzU17Jql3BM1/6pVat25AKSwwQDaa8WfiLd7
 GryXTTgdESeXw==
Message-ID: <28573a98-beed-b8af-dfa5-9c5c891cce24@kernel.org>
Date: Mon, 7 Aug 2023 10:34:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20230804091556.2372567-1-shinichiro.kawasaki@wdc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230804091556.2372567-1-shinichiro.kawasaki@wdc.com>
X-Spam-Score: -9.3 (---------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/8/4 17:15, Shin'ichiro Kawasaki via Linux-f2fs-devel
 wrote: > The commit 25f9080576b9 ("f2fs: add async reset zone command
 support")
 > introduced "async reset zone commands" by calling > __sub [...] 
 Content analysis details:   (-9.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -4.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qSq4X-00008S-J6
Subject: Re: [f2fs-dev] [PATCH] f2fs: check zone type before sending async
 reset zone command
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
Cc: Damien Le Moal <dlemoal@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/8/4 17:15, Shin'ichiro Kawasaki via Linux-f2fs-devel wrote:
> The commit 25f9080576b9 ("f2fs: add async reset zone command support")
> introduced "async reset zone commands" by calling
> __submit_zone_reset_cmd() in async discard operations. However,
> __submit_zone_reset_cmd() is called regardless of zone type of discard
> target zone. When devices have conventional zones, zone reset commands
> are sent to the conventional zones and cause I/O errors.
> 
> Avoid the I/O errors by checking that the discard target zone type is
> sequential write required. If not, handle the discard operation in same
> manner as non-zoned, regular block devices. For that purpose, add a new
> helper function f2fs_bdev_index() which gets index of the zone reset
> target device.
> 
> Fixes: 25f9080576b9 ("f2fs: add async reset zone command support")
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
