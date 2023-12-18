Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFDD816DDA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Dec 2023 13:22:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFCdb-0007CQ-FQ;
	Mon, 18 Dec 2023 12:22:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rFCdX-0007CK-7H
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Dec 2023 12:22:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TrtGHWM7El+r/la5tKI3bFB607iy5g+ENeW6/T3zybY=; b=c/aPodGCkqUPfV3km7lb9sVf+7
 bmqScFVfwXhOiHBMH8YnIiPRcL5DSIcI6aTM7MF/1CZfUl8RAfbbDaBofo2MS4jDjdafiYn+BLRT+
 790GutFVSgL+MwAFbOsF21fbQOBjELWDJ2Q317tg43vTnQoxUn2gWBmjdbVkC2Dy6FrU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TrtGHWM7El+r/la5tKI3bFB607iy5g+ENeW6/T3zybY=; b=W9OG34GDbsZZFJnbnYTSVcrIVN
 ghN1zEnHk9zA2/aWxGhAGRJkw9g8xCFT4xi4ucBryxQOOgZC0q6pQzeIHL8Wn45T6cJAOA07YCs0S
 a0H7wF9GwCg6EohrPPxHLFmqSnZPkMEciWNlWnXzab92mWRXxTDmh+/clLnWn2Ssa+p0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rFCdR-0006hU-7h for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Dec 2023 12:22:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C88D060BC9;
 Mon, 18 Dec 2023 12:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7AECC433C8;
 Mon, 18 Dec 2023 12:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702902122;
 bh=3mazpgyORGhF3jEjGhny3Nxv5ONTjfktTe319AXAMV4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uxto+SCHCEvQ4kQpuRaIQeQkRGn/Lw1oA1OO/T0Ioi9OgyVHpwzlrz7aD263PgRJI
 EsoywLyVqgWXo2qCKxq998DNlHi7OjIUZzHg45/SMii204Zwj/7ADBSxWEW76Qge4O
 4PgHqeB/hxhZ9m1oZj6UCct2mM5OaTWbtn557w0hGGQiQ4iI1PmPkiD9VOmavCKDC0
 08pKD+qPq4fnN5Kg7ij1ObbNredrL3ocXwTgYI2XW64KBR/cM6k4NpiX/8krFW61eY
 6S1lsUTkWDKRTkknuH4HbBPaeGbAlwIYM79r3hKBha4mAwnuJhq6IWHnQBiYjc7PR0
 7vkWcieSrqYoQ==
Message-ID: <15ed1a61-a707-4ec6-8783-205388d8345f@kernel.org>
Date: Mon, 18 Dec 2023 20:21:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1702897676-12851-1-git-send-email-zhiguo.niu@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1702897676-12851-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/12/18 19:07,
 Zhiguo Niu wrote: > The current pending_discard
 attr just only shows the discard_cmd_cnt > information. More discard status
 can be shown so that we can check > them through sysfs [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rFCdR-0006hU-7h
Subject: Re: [f2fs-dev] [PATCH V3] f2fs: show more discard status by sysfs
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
Cc: ke.wang@unisoc.com, niuzhiguo84@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/12/18 19:07, Zhiguo Niu wrote:
> The current pending_discard attr just only shows the discard_cmd_cnt
> information. More discard status can be shown so that we can check
> them through sysfs when needed.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
