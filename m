Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B308A62420F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Nov 2022 13:14:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ot6Ru-0001Yo-9C;
	Thu, 10 Nov 2022 12:14:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ot6Rs-0001YU-7X
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 12:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ugosg5ERslpuzDeg0hO8qMVyMRpoYwT2hziSbron8kA=; b=Imhjc9TESvQQt6TL8M5cSISf7G
 +rYX7YATb/q4onTzqFJHHs1/mjy/DZh12FSmJIg5627D995RQ6D4dbLdYvBFywGNBmT/i8/OiiPkS
 wWZez6mmC75yMTWb+8Qv+ZyQ2r/3pAA2WEQ/r1zwSYV4K37s++tOsenfixzjRIQI5608=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ugosg5ERslpuzDeg0hO8qMVyMRpoYwT2hziSbron8kA=; b=WDw1tbct2v5s1PF9X/QjlY6nQX
 ApwGmOa1wHArAbvBwCBX4Kq8G3k7DP9dIJdLJvuf8g4pnpZ+6R3x1O6BwMjVduq1dC/UyQuRhivey
 UVAeeUtbady5Domo7TINfSbnKPsvQgOMb37+EpHa3yYhdd1VEW9MR8IFWC1malASboCM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ot6Ro-0034NF-RE for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 12:14:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 86D10B821A1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Nov 2022 12:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982AFC433C1;
 Thu, 10 Nov 2022 12:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668082453;
 bh=B22pu69Nba3mL3bh+uHOYfeSCh+5ORe8ehgV90spvS8=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Pe6d8PvNJ9WEf5Cs6pnSBdOT2VA3oZE3XfgN9soS/kpLedvfIfav48SsMLbd1L80V
 ezFwc+MUzf9VwkFHHSBcI/MRsPDrJ2KQu9eijEgwkdxNvoferHhVzqcwIbRSqKg7gA
 aWX2wT8SJwKMYyuE9WV1JCCnngxKMg/XKWGhK37+Jw2Czb+D8xi9MG4eYSqcex29Em
 jx8O6rHrhoSMkCcscvSduPznpvDBaIXC3LRR77xO3lSvhlUq07BPOEk5srJllzHWGo
 9LeGJGhMLe8FH7Ukf7YHl63l7OoT+ylLCo3PBbuCGITkM1IS+VrOyxL8AMVwkj8n7j
 TR3TKu0jQqhhw==
Message-ID: <79264aa9-c78d-5768-bfd2-91be34f78ad8@kernel.org>
Date: Thu, 10 Nov 2022 20:14:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20221109020917.4121067-1-jaegeuk@kernel.org>
 <Y2sMWrKXJtGSmUz7@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y2sMWrKXJtGSmUz7@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/9 10:11, Jaegeuk Kim wrote: > If block address
 is still alive,
 we should give a valid node block even after > shutdown. Otherwise, 
 we can see zero data when reading out a file. > > Cc: stab [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ot6Ro-0034NF-RE
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: allow to read node block after
 shutdown
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/11/9 10:11, Jaegeuk Kim wrote:
> If block address is still alive, we should give a valid node block even after
> shutdown. Otherwise, we can see zero data when reading out a file.
> 
> Cc: stable@vger.kernel.org
> Fixes: 83a3bfdb5a8 ("f2fs: indicate shutdown f2fs to allow unmount successfully")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
