Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9874D8D2D97
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 May 2024 08:48:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sCD6x-0005sx-Ru;
	Wed, 29 May 2024 06:48:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sCD6w-0005sr-Og
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 06:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IY7IeLIPghZQOx+4kRvU7GD3xyrKoH6Ss1EPpQyj/LU=; b=lwYYyBekiik6ae4LPc+SS2iNr7
 OBnsTMpGVVBoP+OY1hbnk+QjC19BjgMfB8CK/XGCI28Hnx+75i0x7gvfawAMKvMQ2sOyglNzs7Roz
 aOQHKKZ8iXSdSf0LGkiPP+dbQ9u//J7Ug4ackUJ8sjil6B+finbQlf640IvWSIrEHs7s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IY7IeLIPghZQOx+4kRvU7GD3xyrKoH6Ss1EPpQyj/LU=; b=I0VcnV6hcPYbImGLgrbGir71Wa
 8B+NDWBBMSp3AXMYVTniVbZSrdpT4wtpyofPBadQL7XN9kmDiGyocQxEppqKUjbyCDv8IS/6sNU6q
 F5dESx6958Ueogg5gtiK3UH6qgUOfylFDv91BIUTTP2MatI1LQjz6nlunUiYKRQC/n+Q=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sCD6x-0001f9-TY for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 06:48:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6810FCE1693;
 Wed, 29 May 2024 06:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056E3C32781;
 Wed, 29 May 2024 06:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716965302;
 bh=LT37b7htbeGcJpL05GnAj6ZWtS5APGOieNQzOw+t71M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Q2kMBwfFJwD8J04rF88WnQYTzdU815ETS8wfQQpL8tE7cP0tl0dI764MLu+TJn3jh
 9zxOOpKl5Zvf5Xl42HuezUGHLGKaMkjShEpMz6ePYTN3kuEOGZ9JoK74MwKJMLDHrB
 yzHJJbw4LxHOWh4c8JjUrRh+uO1ZztY8qOcKsOWE4LemaMtzZxQmC8FqMCaViJ1fcI
 zz7w3bJs5x0a47ZsTERFpHEfBWgbdnXDTOQmS/iX+LaicDtNoxWGVhHIARuOCwPxJC
 m7zWAARV8o4EK2wIqyESTY+d+p/e3C7Ze4mJv+ji5/QVfFqdKv7XHoOH+g1NhDfPRP
 +SDXrQLqUs4TQ==
Message-ID: <4ffa785f-3fb6-4289-8a7f-1b7c586aba0e@kernel.org>
Date: Wed, 29 May 2024 14:48:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1716808357-7161-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1716808357-7161-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/5/27 19:12,
 Zhiguo Niu wrote: > Subsequent f2fs_stop_checkpoint
 will set cp_err, so this > SBI_NEED_FSCK flag set action is invalid. > >
 Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com> Reviewed-by: Chao Yu
 <chao@kernel.org>
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sCD6x-0001f9-TY
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to remove redundant SBI_NEED_FSCK
 flag set
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/5/27 19:12, Zhiguo Niu wrote:
> Subsequent f2fs_stop_checkpoint will set cp_err, so this
> SBI_NEED_FSCK flag set action is invalid.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
