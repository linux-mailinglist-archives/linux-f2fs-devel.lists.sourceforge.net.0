Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6586993D16
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Oct 2024 04:54:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sy0Mo-0007wQ-3j;
	Tue, 08 Oct 2024 02:54:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sy0Ml-0007wJ-8x
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Oct 2024 02:54:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oC/NTLbzbNIXx3jM+oHOPsAolcI6awFjjRt6tG2xAHg=; b=bLK+5AYSp/89E/xpq0ZcyYC8PU
 yrkM9lGTvlipZYb5bZZ9u7pP9/sRout9LiSlIaG6UZdAWzDmBVPPUgIPhTYm6TgcynC+VDk4SGT7f
 MUYXLuv5K2zISsuFKEAkzpW4FS9zAKf3gifVWOr3uGa6WLxRlQ00d80b6lgFuZBl4H5I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oC/NTLbzbNIXx3jM+oHOPsAolcI6awFjjRt6tG2xAHg=; b=h7LJhtMywUUYR87p6d7w2YUhIW
 vhTb21ifpfCbJw/Ov4sHQm66gq6Pavt+1DERe/PUfT9PN1lmFIBsYAPjWBMQWDBcmJyDDtM+fsAuJ
 +uMHRUfmuNwWXv0VTXmiJ8p3esx+2NuwmG53VLOiK4jwEzX8SWJarbmO48Za1jsdHAQ0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sy0Ml-0003Iw-Ez for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Oct 2024 02:54:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0DBFC5C5EAC;
 Tue,  8 Oct 2024 02:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E2EC4CEC6;
 Tue,  8 Oct 2024 02:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728356055;
 bh=oC/NTLbzbNIXx3jM+oHOPsAolcI6awFjjRt6tG2xAHg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ud+Fy46Llxj91KpDasjd2Wyu+Sz7Oj/fEMLDfDPXEIBzRKAbU+YDALfra54gS+qya
 67/2+K0LszKRMMXx0XisoSq6Z8GzI/mC0s+TqpJ2RCA5HPkeTQjm2G1zDtw3xsUjKW
 TuEpXRprEHXaqjsikmY/3kDD796XsHErF0O+6L9vnifQkPnSt6W5GAzPbt83RR2o09
 7OMW4gsEBz9NdeE7TZsRAdjEFEHiVlnD7br/171dhasAPJMYBkg/V3rOS96Ju9bIL7
 r94tBfwgj0mDLgkU1jk9SFybKJy5NOyrzteRs8htHLZGmIpca+wg/3t12eKlbNuv5f
 vY05+V5PCTntA==
Message-ID: <d286b29b-3851-4db7-96f6-bad359099201@kernel.org>
Date: Tue, 8 Oct 2024 10:54:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: LongPing Wei <weilongping@oppo.com>, jaegeuk@kernel.org
References: <85588954-f628-48ee-b860-9454b2c4fd1f@kernel.org>
 <c77bb0626adad3e7c7c0ef7b9e338b2b465dc3ed.1727582346.git.weilongping@oppo.com>
Content-Language: en-US
In-Reply-To: <c77bb0626adad3e7c7c0ef7b9e338b2b465dc3ed.1727582346.git.weilongping@oppo.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/29 14:17,
 LongPing Wei wrote: > Signed-off-by: LongPing
 Wei <weilongping@oppo.com> Reviewed-by: Chao Yu <chao@kernel.org> Thanks,
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sy0Ml-0003Iw-Ez
Subject: Re: [f2fs-dev] [PATCH v2] f2fs_io: add fdatasync
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

On 2024/9/29 14:17, LongPing Wei wrote:
> Signed-off-by: LongPing Wei <weilongping@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
