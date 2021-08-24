Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3443F557F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Aug 2021 03:32:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mILID-0001jy-PH; Tue, 24 Aug 2021 01:31:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mILIC-0001jo-BD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Aug 2021 01:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5dk9KAdjFTwMIemab6BmTVmu3uoE+I1lsFn8Gd18PME=; b=QakvN2Jhpd2A5lP56g9REitqgj
 e3Y7gD4Vr6YeuUWCc+wlV4hqX4Tk/AjY1WDyGN09WCXKVQjfI6P0c18tGQTPge0x4rcUIsQ56JzWN
 OPpf2SSPBT6DJRiIrcOeKcYjHBy8GqYQiChsr+NstUv6zaC4doCJAmUR82WTIz7ibi0I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5dk9KAdjFTwMIemab6BmTVmu3uoE+I1lsFn8Gd18PME=; b=gdC/lv+LSvbtuAw2Suf/RSOkt2
 QynmIEtdWCSnZY92l8BeNoAspJ3mnPm89ciwh0LgFUuGGEt/H0TNKVXv3BqzzZKaOr4ewplRWmow6
 cmUB2bOaUydxValhs7aK/eELmXeqQvspC2xpefwnSq4LmGYvgEdTuhBAGt80krYyxeeI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mILIB-0005l1-5f
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Aug 2021 01:31:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2452613B1;
 Tue, 24 Aug 2021 01:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629768708;
 bh=3ypYGUhqc1Arh9dmrLMyzzsqCNrdZMllCVgunLULrzk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qnRlTkiMe2IQ+BM060szoD41+CMcBT7Ex3asL4USZCC/hyA4p61EwmxvdHBFBk2JK
 JQR/rs23nz/G2zFr3bdibs8jrq6JpQ8TTW2f2zIQUj0epyjItxTFD2DSHRrMVnaJSA
 IFI7fq4MLrFH1bYM3AMAxXXj4kr/0eplIWe19ZRRh6u6RcH1A0kkR/FtL4NoxsrOMN
 3M7hEql4/iu73Tr8JbRZO6Lkbw1fqcZ4UmyKheORqUnkPu81ytmJIlTg7q/1m47E08
 5x1Kwh0Nn5gWx7nGv2ygZNJ526iJzspHwslll9XF53Q1iIdgp1fbJdKnPQ2ZU49icu
 IsxpttNHxiz4A==
To: jaegeuk@kernel.org
References: <20210824011948.15408-1-chao@kernel.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <eadccf3a-057f-4d79-895d-140927167b69@kernel.org>
Date: Tue, 24 Aug 2021 09:31:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210824011948.15408-1-chao@kernel.org>
Content-Language: en-US
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mILIB-0005l1-5f
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix wrong option name printed by
 parse_options()
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/24 9:19, Chao Yu wrote:
> It prints below kernel message during mounting w/ checkpoint=disable
> option:
> 
> "F2FS-fs (pmem0): checkpoint=merge cannot be used with checkpoint=disable"

Oops, this message should have been removed by

"f2fs: rename checkpoint=merge mount option to checkpoint_merge"

I may used old f2fs module, please ignore this...


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
