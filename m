Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F202B1469A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Jul 2025 05:07:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jO5PDLNHOvW/eIFtzhEvgIZNb9gCY24pz9aFyhUy8IM=; b=PpjsxbnwUjHx5WOYRZQ8i+cqJN
	wQ2oT0rrG/KTE2+BW9lT1kj8p02u8iUC6QXEcAq0E0W4HX6YT8VkMaqKLrPJ8dB2+jeyImC4wG2Uz
	byNUngLCKxUoNzG7dARmJ5IHD8hYzTaWdRO6QLQZS+GQkEvOZbuxq37IoXQRI0L5t/gs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugagC-0003PK-Q1;
	Tue, 29 Jul 2025 03:07:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ugagB-0003P8-MW
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Jul 2025 03:07:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ydHp55je5ipMaybGZ3PRgf1tTcAitqzPRnjs+Vt6rYA=; b=AGPfyDxfrAQ7nva12XyCjiD3zh
 BtiRPNo/oiTpjRDFSPcrgGmRcJckIg10x1rzB/kAQBboo7GNNQu1zByw0OCDKv+35weAdIhHYMya2
 xfoicmpAHDCfKcCyA+zVMj/sccuJW128SmsWC65mYdzoPIljDkmPjx4ge+CtY6A7hPh8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ydHp55je5ipMaybGZ3PRgf1tTcAitqzPRnjs+Vt6rYA=; b=knbsmPRWllDIsJNmtuZ4DDntUt
 kc2p/sDu82aCFR43MeEBmGEsJUgzCT6p5suuT88LnjbsYeuF3dA0YssvHkgdWMx9g0oJTBYCdu02M
 GSt80529mWFzVKZ1ypnTDFvo7S98VlU4TsS5l4C/CrCRf0Ysp7DurWTEkUk1ANhPvB2o=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ugagB-0003NB-VF for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Jul 2025 03:07:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 287935C57D4;
 Tue, 29 Jul 2025 03:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C032C4CEE7;
 Tue, 29 Jul 2025 03:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753758411;
 bh=vckEhDztamPT2ztafM7NGX8lZ4VHy1pJroP6LRG6KAY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Rcq48nOXA5b5V0xPytSI8n3odO4x+m6f20jwEf8gi6Z7HMZDQueYQspaaT7YTA0oJ
 hCplI+7ZwOBXhtSei7m8ZAg5bVF1IUGcxohOxMBNLcG90a7j6Xk3rllSkmHaLMOZ8X
 jUc85DHiJLNuB7ltiGVFkF5/2WsIlI7vkBQEyZrNQA74prGqnthXDtg3xbTcLqwmUA
 HvpnKuFJxFM8BLrdr7bBYxB1dE3E9NQhEouTeAPYV+g51H9/kUVQinEmO/QOXr99TH
 G6GJFOnt39I+Gf+MJFdzxtlLQdtWmxPkT8rzTJw4HE4H3ujliBku0016dkoadu3zAA
 YGtYal5f6ko/A==
Message-ID: <b61fae81-ec51-4fb5-8974-76236e9eb858@kernel.org>
Date: Tue, 29 Jul 2025 11:06:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250728164544.1051653-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20250728164544.1051653-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/29/25 00:45,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > Add a sysfs knob to set a multiplier for the background GC migration
 > window when F2FS Garbage Collection is boost [...] 
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
X-Headers-End: 1ugagB-0003NB-VF
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add gc_boost_gc_multiple sysfs node
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/29/25 00:45, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Add a sysfs knob to set a multiplier for the background GC migration
> window when F2FS Garbage Collection is boosted.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
