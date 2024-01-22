Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DE383595B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jan 2024 03:30:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rRk4a-00027v-U7;
	Mon, 22 Jan 2024 02:30:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rRk4a-00027p-1t
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jan 2024 02:30:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pr65PvAzlhsL8Eu6ySDsOfLYG3Z90UVXvtP6jdoMxc0=; b=L6LuSCaHkVYIeDZzbza0R+xHtv
 P2/o0B0CIw1GLAOydCJPjOLZozsAg7RzDE/lHmAYF6ncuYiPB1qGSL/OA1mSRnWapWs9vUdzj4uTD
 V2ty+8YGXFXxDS7U1kcCVm50byxjHX6GJEAztWEH0ubkYcs2ASbYjVdqgpUgewSQJOO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pr65PvAzlhsL8Eu6ySDsOfLYG3Z90UVXvtP6jdoMxc0=; b=AI4BX74NQoaMqOKL/6cnfo1dce
 59hA/HoJ6G1lHJFS0tcH8JZUb8SLSoIK+SIFEn9KKYUHoJt/LLILRd2jmOHW8jQiSMzp7qiq4lhh0
 xrNTX/DfUQYIWFL8ldBkZohNkZLH9DhrxGnjWl00w6xVziI/sFL/bUJpRpMbDGRVkjos=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rRk4Z-00060P-9Y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jan 2024 02:30:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2DD8CCE1F9C;
 Mon, 22 Jan 2024 02:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71701C433C7;
 Mon, 22 Jan 2024 02:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705890590;
 bh=0ndaqSJHXHsabTfP/R6mMY5mO1aB0RONGWu88rSVFrk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VyH2fHqL4rtXTlbrKqV/CQAHPFjT+x/WLwXIbwyQKQNhdVwGHt51iPeZzfCGNRThA
 o+6VzSOJyMw8EA/QImJG8pUKPuEz6yVsnLbEkWWkf8TEIt9oK/kJ1jozWQLYEKLbH5
 9iF9axcOrGFdh6PR99rIadmHxZYTdcwtAv9bnvCTplHcpFe7tUPEP7jdesiFwGTP6+
 g71G2NhIQF3ebRHvIOzOVgylT5vWDyVhTJOxr7TzbysPxcQ+xS9dHUpYrRdBOTKKVp
 dPVy4UiJ18az2lyRbrPdnWFLpXsFv7oSrDrlZDCGDBQjBp/BOddtIVjl8Bj6TNjBYB
 5w8HFJvJGOJRQ==
Message-ID: <20ad68dc-beb4-4de3-bece-95231135c881@kernel.org>
Date: Mon, 22 Jan 2024 10:29:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1705556911-24117-1-git-send-email-zhiguo.niu@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1705556911-24117-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/1/18 13:48,
 Zhiguo Niu wrote: > Just remove some redundant
 codes, no logic change. > > Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rRk4Z-00060P-9Y
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: remove some redundant codes
 in f2fs_cache_compressed_page
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

On 2024/1/18 13:48, Zhiguo Niu wrote:
> Just remove some redundant codes, no logic change.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
