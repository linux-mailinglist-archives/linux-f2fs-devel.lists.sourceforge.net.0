Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 484BE9A5F4F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Oct 2024 10:51:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t2o8a-0003ug-CM;
	Mon, 21 Oct 2024 08:51:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t2o8R-0003u2-T3
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 08:51:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3gODwRWaEQ4Bn881czLoo43aIenORaVlD6L+sLOeu6k=; b=UXlOhmXK89frxCeUZviQCJtjCe
 eL0JTAQLXfOaHRxWJyKh8zUM/HUDCjbVk+tBMSgnuABgKx46t4FFFdx6CyCcKW9CGLU7r3DgN3poL
 2i0hxK3+CHQNCboU74qvHhn5WXyrlaR2hen8hNmm/DEob8/70rpgHu6RBJAoBN5CwgjY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3gODwRWaEQ4Bn881czLoo43aIenORaVlD6L+sLOeu6k=; b=C5y2tT8sO67BOdupjI6gQ0tsdY
 1pkPITLabVPZvlkw5mpyxf13fCELxmSKEEydtIJ0udJiypaWtgAj7wr0dLlACWegeuTyCIu6a04f+
 Y7yiOsb6a2Eu0T2a01a7JSfb+4pNob/13e7BEX1W/GlBhnL24ftQkUeUgXQicI/MGE8Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t2o8P-00022R-Hq for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 08:51:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A64955C5BDD;
 Mon, 21 Oct 2024 08:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F53C4CEC3;
 Mon, 21 Oct 2024 08:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729500683;
 bh=1I0br2HiF0j0KBXELdrYizZ+kEXyiCOF8ytNefcQou8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=pWfhTq2MtvLJbttpKJ4ayFXv7ZJNqiNnrAp6iWygR15OJqRgcJl9ncLQxmm4NUz+o
 jjs/FjvUFd5g0TeS8I6AM4vsio7hSprOjcVb3KTJsIWFzlZOA/y2Vn5zR3R24vDYZ6
 EpAfemZH4EF7rvzXz1zMmf+CHCnbMjy/Y7YU3f6H4+SpHr+zoU9nGFz+K3XtP8jR5L
 AvN/Ju8logdnBIPGW4oFygWk7SvS1NmEyBlaiCfHhAajXozUdCNBqNM+MYXLj5ZAkA
 k8F/FpFB/DXuJia7aGPl1Gxi7GIY2xwmzpUiUMevInuZeq7JdDNFpPnTYqvEt47gL8
 z+nH87PzqbQew==
Message-ID: <76a783e6-dd5f-498e-99a7-0a7863b6e2e0@kernel.org>
Date: Mon, 21 Oct 2024 16:51:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: LongPing Wei <weilongping@oppo.com>, jaegeuk@kernel.org
References: <20241021023147.1774412-1-weilongping@oppo.com>
Content-Language: en-US
In-Reply-To: <20241021023147.1774412-1-weilongping@oppo.com>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/21 10:31, LongPing Wei wrote: > This f2fs_bug_on
 was introduced by commit 2c1905042c8c ("f2fs: check > segment type in
 __f2fs_replace_block")
 when there were only 6 curseg types. > After co [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t2o8P-00022R-Hq
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix the wrong f2fs_bug_on condition
 in f2fs_do_replace_block
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/10/21 10:31, LongPing Wei wrote:
> This f2fs_bug_on was introduced by commit 2c1905042c8c ("f2fs: check
> segment type in __f2fs_replace_block") when there were only 6 curseg types.
> After commit d0b9e42ab615 ("f2fs: introduce inmem curseg") was introduced,
> the condition should be changed to checking curseg->seg_type.
> 
> Fixes: d0b9e42ab615 ("f2fs: introduce inmem curseg")
> Signed-off-by: LongPing Wei <weilongping@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
