Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 466429D5B1B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Nov 2024 09:39:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tEPBz-00081h-Dr;
	Fri, 22 Nov 2024 08:39:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tEPBx-00081a-6y
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Nov 2024 08:39:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hUDTkIf8Ob7QDcL1keKtzRRwcn+XOE0MRxR5Ragzd7w=; b=lllzyaTpwcIAkZwkHKacrS4oib
 rhQwrksyGWM7DQiR+vUla8i4fMnB5YYx//p2bdihc53/n6w9eRZihoBRRgxR4KS99X+ESX6e/96l0
 /3Yd0v5xIVnLDSg9S0ArqvFW9LqEyeOGLPVM4dgFAPcDovxBCueJPmmJNbFgGxNzNuGs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hUDTkIf8Ob7QDcL1keKtzRRwcn+XOE0MRxR5Ragzd7w=; b=B0BNhbojBsWvcTJRfsT5eNHIC4
 sIBMsRm9dk4Vpapj+QB59q++QhMRYgtaYLmCD+WZiK18q00Z74zKRCTmqFdHu6/AnXrOIYmCC07b1
 +NEGFnR2lpaWHL0UUx0r8dTNliZ7uWa/dNjCeFNMdpY5DjRpVyoxD4WSI+a85B1qCtbw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tEPBw-0008Sc-0q for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Nov 2024 08:39:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D91F35C037C;
 Fri, 22 Nov 2024 08:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49ABEC4CECE;
 Fri, 22 Nov 2024 08:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732264738;
 bh=Nc7CApd4MrHjmS7f8qqx7Yf5v+GWZ8jx1Pd9NTTkK90=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ZoT5nWn3QWW7OgJEUD+Icg/ISDiYIMpOiIoYVIibVp9Z3b3vHwCy5B7eJGP0H/zhR
 6TLPhlMl2hBKk7+g4NoS0Z97Gkc0Q/Thyr8hMOhG2SUp0HL/PtT4hRTuHfpalyLQrU
 TJMEH+9/Di4VOMN7Q5Ht4W4/oJzt0V2PXqsmNPEJ3WwrN4y3Cd/qi8dK+WXnx+XQ92
 SsiV9znwFk1K51SjqSIWPerR/fcsQuxlAKaL4PZgtxHOjvqvIS1sg7ExhAbfksgAhH
 IG1AXqWgG7US7cCl38OjXn6lLbzFh7LJS20DQSPMx4PP11RGvB7lT34Erm2gQfkDDi
 ci6dlgSbqvWCQ==
Message-ID: <80b3ece4-b162-4d0c-9a1f-e9cc3de5bb96@kernel.org>
Date: Fri, 22 Nov 2024 16:38:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: zangyangyang1 <zangyangyang1@xiaomi.com>
References: <20241111043106.864722-1-zangyangyang1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20241111043106.864722-1-zangyangyang1@xiaomi.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/11/11 12:31,
 zangyangyang1 wrote: > f2fs_find_data_page
 is used to find dentry pages, > I think we should cache more dentry pages.
 How about? "While traversing dir entries in dentry page, it's better to refresh
 current accessed page in lru list by using FGP_ACCESSED flag, otherwise,
 such page may has less chance to survive during memory rec [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tEPBw-0008Sc-0q
Subject: Re: [f2fs-dev] [PATCH] f2fs: cache more dentry pages
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/11/11 12:31, zangyangyang1 wrote:
> f2fs_find_data_page is used to find dentry pages,
> I think we should cache more dentry pages.

How about?

"While traversing dir entries in dentry page, it's better to refresh current
accessed page in lru list by using FGP_ACCESSED flag, otherwise, such page
may has less chance to survive during memory reclaim, result in causing
additional IO when revisiting dentry page."

> 
> Signed-off-by: zangyangyang1 <zangyangyang1@xiaomi.com>

I think it's better to improve commit description, anyway, code part looks
good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
