Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A1CB0D19E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jul 2025 08:04:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NeMR19QvcSWkfQwvjxxv/YfI5iJ3CY/1Vt/XW1QChms=; b=Qo3XbweN+/GJ86rYwRPGXMlnfT
	Xtsk1QUcsOWq05bzOux9GI+MQTtPpzQFmrb9p+aNOE2DiUswUc9AxxJFeN+uUAe2B2qXsoTf4DDXN
	YDn859rrXplkE8WS0SgokekH5eFhNpbaI3XbTYpw7RbGD7BDUbBreo/Gbvd8uRsGEEn8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ue678-0003Go-KP;
	Tue, 22 Jul 2025 06:04:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ue676-0003GU-DQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 06:04:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fglel5iK4Q2FQOSDad6uDdx6ssaBt/enKc/SgVTq6RM=; b=Uh6erjamiMyxIp/6szLIxkvnBV
 wJ/pH7o+SapM52AJSUevcV6itxFbA0AU4YCzzY3VVjwosDdTdz17gbCjBkTuQ2zx5voBOme6JRgv3
 d0OtW9UpvpPKPf8uDMp3u5igqcItGkU9P7UBnK97rjisZnpg16r9IC/5UN/Qcj1p2LgY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fglel5iK4Q2FQOSDad6uDdx6ssaBt/enKc/SgVTq6RM=; b=m26nMzXpB6xIhmWcP7fa/Bvv3R
 9WajGybRg57tG4i13t1oCz6gvo4D6agLPiHujlqN3FNpki/le2l+54z9wy55qvyihhZAI0iwp7I5r
 IKATcOKyMmMNH8zTZrSFDxn8EhVtwxkxJwHzKPahD8AClOZfAN9P6uEuNOlfu6vD/avE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ue676-0003Si-SG for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 06:04:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8F22343959;
 Tue, 22 Jul 2025 06:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F734C4CEEB;
 Tue, 22 Jul 2025 06:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753164267;
 bh=/StEH3qJQKjWrvlSu2USI+wee4tETEn4s5xe3LCqlgc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=cQo6mWbDqXztLtf5kEsj9TIMNpiA2CIbm5wCZaNXZv2nf420imCoMm+O93cOWiD6b
 Y21zpk7fSQ1uz5LULF0DbuGimKPVxpqsFx+0X9Z/pGK3UFOzUAJht1YgC3VNLEkADK
 xKv1kWzqE7Qk0AtazpZm4laptwrbkpOmKLMRAmoevAUnKoh8I/w+DL1L6jGu1YDQbB
 T36movLGHpnkoFEr0IPGv3wiBxJ6axqfksd9Vlh8zkH8/u3qhpNjIk338HKBF8EfmZ
 iRU4/3P9K5RRFs3Sws7r1zT7Mby3W4SMY4/7op0u/1PM7GLMpWGdUB3t9jDb0DSoCO
 mvz0MBMyO2Xjg==
Message-ID: <0efcc474-4b44-4c38-a4ed-1ead3837c8b6@kernel.org>
Date: Tue, 22 Jul 2025 14:04:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org
References: <20250722060240.1469-1-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250722060240.1469-1-yohan.joung@sk.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/22/25 14:02, yohan.joung wrote: > read for the pinfile
 using Direct I/O do not wait for dio write. > > Signed-off-by: yohan.joung
 <yohan.joung@sk.com> Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ue676-0003Si-SG
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: zone: wait for inflight dio
 completion, excluding pinned files read using dio
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
Cc: pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/22/25 14:02, yohan.joung wrote:
> read for the pinfile using Direct I/O do not wait for dio write.
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
