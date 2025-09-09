Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6782B4A033
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Sep 2025 05:44:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqI1Sjx54dTWVbixXEHWa8CsXjHr6ITdz/bZvSytouk=; b=HrymZizGYrdZ11T87iXPau4foS
	xi51jKgnVgesZ9zyY3TISvM7ij5WqHGcgtM9h3rYy4i+M8c7CVi2L2xuDFGe3r5795HvvP3kI4MIM
	0msrN5k6BKmj+K/rwd3n7pyV7zhtcsUuMl/SkiTOmDX9gyBHwzDills57u5It4csJM6Y=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uvpH2-0007AN-Np;
	Tue, 09 Sep 2025 03:44:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uvpH1-0007AH-KG
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Sep 2025 03:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RgMw/bPDcOS3zSxoSLg8Wh6eDq8LimAXypmRqZD5IUs=; b=hBI8CpHMRb/FSQ57bn/HzTHpyY
 QZh6nGbp14cRWHI/1IcXmWmcRiPilY0k4iCLG2c881uAjVrnAYc96JU70jUfzwTFCioOFGFGXGWKI
 VLFK3QpEvBIPx19tt0FrHu7RHDzIyFY5+sw0Xm/77rhcsJhcxSFXBYm51Fmc5BDFQ8io=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RgMw/bPDcOS3zSxoSLg8Wh6eDq8LimAXypmRqZD5IUs=; b=MvfP0EwreZG4rLtwchWFG5WiYK
 yt5Pq8NedZd10csqpFgq+HbqHZyls8lQ3PVz/A0nLPPTqWoarX/K1TyeBareYLpOGNZxvJGhQbNZw
 z44NPsfhoUq9GOZc/WBdTU8XkX3HskcR29+Iua+LKEFdwPef5gxsD7S3nSBawsJ12AK8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uvpH1-00020r-9Q for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Sep 2025 03:44:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DDBBD437A6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  9 Sep 2025 03:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC91BC4CEF4;
 Tue,  9 Sep 2025 03:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757389437;
 bh=XnNTeZJeJVCkIGkBxwan1qyQTZSdfU+eF5WhtD7p8xs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=eSLN7TPJPD01w/uQckPv5DdswYgYLUBQGA7rkxe+1B0aLHNsQx/LzxWj0f2Shq7t+
 hGu3Sp1hxrbABpnxOsO4y7Ham1HUbamA8GLOtlfUvSIs1rzJSAsGalqsbnBkfCbkEu
 r1VQgWk8eMAyBu3AeMqaj+3/FWMmUHUrQrUIH5V4OJjzIX9EZarF+BeSNqvBt5EWXy
 08+aVKGwDB6rAkMn3EAdLK4DDcVHIi7Ywdfm1KJ8W2hLbRJkF1+P0vtMd9p62fLDaY
 jeWqUzSZ3aES4YtF+oql24AdtM9fnq7T6Bkf2jMtC8dz1cB38tXxJSAZXp6uDu3pS2
 IxnwRc5ztJ41g==
Message-ID: <1a99407c-053f-4404-b47f-878b241ce07c@kernel.org>
Date: Tue, 9 Sep 2025 11:43:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250909002717.829981-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250909002717.829981-1-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/9/25 08:27, Jaegeuk Kim via Linux-f2fs-devel wrote: >
 This patch fixes to support different block size. > > Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu <chao@kernel.org> 
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uvpH1-00020r-9Q
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix wrong layout information on 16KB
 page
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/9/25 08:27, Jaegeuk Kim via Linux-f2fs-devel wrote:
> This patch fixes to support different block size.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
