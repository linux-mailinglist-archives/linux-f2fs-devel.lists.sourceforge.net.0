Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D63F3B0FEEB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Jul 2025 04:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwQKT/eGDCf+MyuPWVwa80J/52EQP2+RaJnx6UuDJ5I=; b=WQFLNz2KWthA5BJI5NhUzFH43Z
	vW99+OjOH0Jf9AR94MVEN72R8gmZaJe5oOJdE2cBJ1rGcDZspWnRXWUtuEYHsWRMSWe7vq15BMQ0F
	03+J2mmgA3ykRFgeT3qAutLUzGDG9SiZ89xjOc5pPqsjnAzYHUwdgUnTtatmJH/gQzLQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uelyw-0003lJ-9l;
	Thu, 24 Jul 2025 02:46:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uelyv-0003lC-2O
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 02:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gm9Et5Bzab2kOMVMQtqeCQNadyiA0aTSI8YV0VKqYDU=; b=PRqX2S2ZtwxgAc5g+3MUb9e1+6
 iuUGoBZwtbh6ek8hchpv21uWugZf9ZPKIdVNt9/0C7PTRQs1JIfDFKk8Sy9PpTkjJM4AQ4fcODu1y
 hGC4wVMTt6oNUcNhvrYFwGT/4+EmLBGndxjFg1WhcvUft05tdoxN6yVx5Sj4+8twlmsE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gm9Et5Bzab2kOMVMQtqeCQNadyiA0aTSI8YV0VKqYDU=; b=YnaBoxM436yN4sukn+C9Xtgcxa
 1iToGx1rmXAKj0tJ7wUJUOWKqo9W5Kwj1z8Zj6256ggYNRObWuZjXOmgTD3tUkh/w1P6InIarWyjU
 VNdwW0dKQ7QxQ8lL3swJ/2E+Ea1+5e8/Ai39oKeVzCXHVNNE16/Qw/iKCnFWx3IvSxak=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uelyu-0004iR-MN for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 02:46:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0CFFC6020B;
 Thu, 24 Jul 2025 02:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E08C4CEE7;
 Thu, 24 Jul 2025 02:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753325201;
 bh=RoGREyvQX46BI4rqJDbPiq+FWilpC4T7ezMdDi9ps/g=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=p4LyW45QyOedF+O6tQkHww3GvG9xYjq+QBxGZXKDpzLoj7k/hEnqZTV1jtww0lMhW
 0K8/+ZyxJfUEPNuALyAWa1NVj00B1OsCIhGIPJa7W3+bCk7fFMe7cXNLTTJgiIeIoy
 6OBdIK6+XdPXJkP9XfYm6fHRkPntSMBI60Ukq+xHfGHVvkm6VPKv6C+tZBiiSUMhKv
 K9O3aIeLMh6fAzNyiTQTE63VnDIxDSBr0Xzhq+puQtKzT73/jTgNt3SsVZVeOb1jAD
 +ysQFheHkI7yJH+J4nkh/XR3UVT+DxRl7JUhR9ErqqMnPo3yYrlDbZJqvJwaveCu3r
 Cn6bxlFPu1g9Q==
Message-ID: <a42ac7e6-765a-448e-803c-ea4b8691f3a1@kernel.org>
Date: Thu, 24 Jul 2025 10:46:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong2021@gmail.com>, jaegeuk@kernel.org
References: <20250723142456.2328461-1-shengyong1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20250723142456.2328461-1-shengyong1@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/23/25 22:24,
 Sheng Yong wrote: > From: Sheng Yong <shengyong1@xiaomi.com>
 > > There is no extra work before trace_f2fs_[dataread|datawrite]_end(),
 > so there is no need to check trace_<tracepoint [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uelyu-0004iR-MN
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove unnecessary tracepoint enabled
 check
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
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/23/25 22:24, Sheng Yong wrote:
> From: Sheng Yong <shengyong1@xiaomi.com>
> 
> There is no extra work before trace_f2fs_[dataread|datawrite]_end(),
> so there is no need to check trace_<tracepoint>_enabled().
> 
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
