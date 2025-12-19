Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 796CCCCE501
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Dec 2025 04:06:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEdsV7kP4rwEseQ82Sm+XBksrp1gtdtNusToF5MtE4M=; b=lL8YBA+EvmgYmuJY+BIZq5nXJE
	DANlD4dt6Kcj1IeHMu6wjfHEwBtycsBIMEtvFrduDiWhNo1mcqfoqoMfoSuwD9WI+J5cAFq2feNKP
	R8vOowH2syJ/9Y7OoC8ZL9zIHOgtV3LQHQNKVA0kHhOKhVNCfBsEBveUoQcP/Qqnhnc8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vWQoY-0005Yx-2y;
	Fri, 19 Dec 2025 03:05:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vWQoX-0005Yo-BK
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Dec 2025 03:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sv4/fJ85SpETd+W+6EavkIeZ/pCfKYzlY/ey84A1Snc=; b=GQGmzzANcjsyiGdJgc5f2etq2s
 JadSUOxzBcv5RzmuUeeqkr887qkjdI0nsK84U2G3sg1gxghHLfl7LovdsbjKhScPOWzExNWKpc22b
 a7qjkX+JAziwz67MjJkYg24FyO7Eia9t7tvqywfT0nY61OsfwGHG3ETnNMIEDeVBVpyc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sv4/fJ85SpETd+W+6EavkIeZ/pCfKYzlY/ey84A1Snc=; b=gM+OAmXMNI8akk2IZQab2XMFJ2
 jxed0E0n4IYKW/FewiqFOPXi5xLXAJ78U2XADoY3AKddS5eMjV8SriGl05qUduFo+DQTvud/U8qf6
 2WXkWiT6s++g8F5giQ1BW5XoMpE28kDC+Mg5NMCdeJ16ZrB5WBJ9E1B7wTVcHDUDkG38=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vWQoW-0001T9-Q0 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Dec 2025 03:05:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 84B52436E5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 19 Dec 2025 03:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C098DC4CEFB;
 Fri, 19 Dec 2025 03:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766113546;
 bh=sv4/fJ85SpETd+W+6EavkIeZ/pCfKYzlY/ey84A1Snc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=LF64FKY1gc3ZcLm3Gjb1Ufga91zjIg8MtF7jCHueU7Gh+fkXs4kIQNT/Dgz0GegoR
 n8bm/Ic1qKkWDhrtkdpUxabfJD3vCVXtMnF+KEHbBiuGr19HKfKO5t8Yr49WpAwD4x
 ghbmBe4kCabYO3ePcf5Bdv2+Rbut6c3s5M9s50PT7Ki1Hn9FcDGcT8vqW7PUOn1iGo
 92nIFfmXhL1/lLsIWpbFI/hSAjlJ21H/VYH4fDy4aAG0GxtmhxTE5Ehq5ExDZflwSW
 YHKLeT9R3WDtHvYxh+/bD7OO8VBy6Xuv8sU81SRlu3j5ciyD4NaMqyKa6nyOrRhORU
 vyWgoCEmrQUug==
Message-ID: <6172746f-c6ec-445a-b503-85cb97e92573@kernel.org>
Date: Fri, 19 Dec 2025 11:05:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251212005545.3912333-1-jaegeuk@kernel.org>
 <1a169058-245a-4ce7-8f95-83dc96fd90c2@kernel.org>
 <aUH8eoMdDeK7uMbj@google.com>
Content-Language: en-US
In-Reply-To: <aUH8eoMdDeK7uMbj@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/17/2025 8:42 AM, Jaegeuk Kim wrote: > Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu <chao@kernel.org> Thanks,
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vWQoW-0001T9-Q0
Subject: Re: [f2fs-dev] [PATCH 1/2 v2] f2fs_io: add mlock() option in the
 read test
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

On 12/17/2025 8:42 AM, Jaegeuk Kim wrote:
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
