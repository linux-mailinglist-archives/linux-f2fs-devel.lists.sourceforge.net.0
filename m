Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 824D699DE3A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Oct 2024 08:25:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t0azF-0006ZX-S8;
	Tue, 15 Oct 2024 06:24:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t0azD-0006ZN-Fm
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 06:24:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a/Cd5/hD4QgDmfz/FPkNhZTB/rDG24uFRt4DyoHrUGQ=; b=knQoEJ3B3EhIHsww3LzqQan9zP
 r37wiRsPEgK8PMA7CLcIPLspUCJjZDlydskLVk7ekcWf/lyrnjAGHRArZubBTQU+TzaXjVDgKPWXl
 /8aFg+BNbgYGemegKIszJNQXogE8rJ8lmcYpn34QRQwbX1pE6QbdxM4ZUPhxRK7P9Ixw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a/Cd5/hD4QgDmfz/FPkNhZTB/rDG24uFRt4DyoHrUGQ=; b=OrCo1rpPyWcknqt+MRIBPWuIH/
 FnaENwc3vF1M/6c+U/NqcQsZcZ7lLm9ymORoH9WGbW5JeCLe4oKZ+VU+0M7yUtfHUsor4C+eQCG7j
 MhpsFMZxFkOruGR1j22jHqk3zfoA/xEgia3piZLAc5Dz0jsakTPJpJFKqYWIGNcn8Ing=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t0azC-0005PB-2e for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 06:24:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 748ADA40BF8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Oct 2024 06:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7109EC4CEC7;
 Tue, 15 Oct 2024 06:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728973484;
 bh=rrXPckSLlY4Aov00NodywdaWr1qiQFlRnW3UGJHfZlo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=sIy6sjtiGbzj29vBaVz/QmLB6Bx3DjHKww/8ISx4+MOtqS/BcYR+cXjIeHmLNcTef
 NlWhc5BuHm6U39iQTaUUsLc/G4sK2SLvYqSiO6VVhboxYdXnBvEtKMWUUfJnXo27IH
 7ArY6ACt6PxdDkbiYetspcg/mjuwT/1zsmIwi0ALDESSWIugCvymH0/eOhz37k1w2K
 mM7GB49Uhq8EwyPKtKFRWU3+dy1ykfBRvpeKJXeSRdVogbooBjuzG64qDCfYjRwLdR
 Fx+Vyk5eeQeaIHY4WExpIRUlu/MG9l9okiQnqBl1EWLN0NkYktYxmFnSO3a+5jzBwH
 I1eSQGs+kzt/Q==
Message-ID: <5cc2f50d-79b6-4aaa-931b-7a41e3bf6cb6@kernel.org>
Date: Tue, 15 Oct 2024 14:24:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-f2fs-devel@lists.sourceforge.net
References: <20241015002331.2724827-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20241015002331.2724827-1-jaegeuk@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/15 8:23, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > It's complicated to address libc and kernel headers. > > Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu <chao@kernel.org> 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t0azC-0005PB-2e
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: remove linux/fcntl.h but define
 the hint directly
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/10/15 8:23, Jaegeuk Kim via Linux-f2fs-devel wrote:
> It's complicated to address libc and kernel headers.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
