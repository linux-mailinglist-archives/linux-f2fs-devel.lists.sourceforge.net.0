Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A8AB05236
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Jul 2025 08:53:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAu+VP1hoXb7rG3kR8Rx9MSqOPz4FvLsGkLRSOb41Xo=; b=EvcINmuUJnZHHYPdvNOQgNqptB
	JBPG1pljH63TJC2ddMklUMYRvPrZkDygm3dqtkeB2VNZGd9KcUhZXC1P/dm/yhGqE8ZetQPS8Zh0D
	xg7Z1UeLKThnlCqmAundrks9cuO8Nw2EIxlOFgWg4lTWMppqNhZCUxI5ChFj09anrc00=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubZXO-000853-7k;
	Tue, 15 Jul 2025 06:53:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ubZXN-00084r-EZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 06:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w0YDxMx5PfIWOapuM8BgoL0J++A+gFAXtSimmzieKtE=; b=B4Iq1BXHluhbi1mE2kV5QOJ5VM
 EnVAhQ0Gt8ndFVyAr7SEoSVmSrw5MhK5tiJ/OA4GFybM0zZBXDvOwUWEM+PmXhMWg8xi0HbHA2zjd
 8AzelTEj2UsBdxkKx+9TxXW8KDAZDnGRA/BA8AZ2KzvYJn8gV76ahORRHAU8+a00xhwg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w0YDxMx5PfIWOapuM8BgoL0J++A+gFAXtSimmzieKtE=; b=m8ZyvXXE6S7VtR4OPHHfDV4+BP
 z9VaahqdIiTNXU3g8w7mWmgc+Kn1C4FvbNRDdZy4LtZ/stUOeNdXnT94fs5muTG5Al5sMW+fQBlIF
 uDmNbBH0uHpzZbOFkAOfS9PdF2eelQ38Gf+TdHuvErEIRg1A/ggBsOfYzEwOpbuDWzMI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ubZXN-0008Mo-TZ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 06:53:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 945F544EEA;
 Tue, 15 Jul 2025 06:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A62C4CEE3;
 Tue, 15 Jul 2025 06:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752562383;
 bh=gctr3UrrZmHgV9GHXNCIpomEZVRjbpV9dPhmuF19aVk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Hj2czy5GCGio5UT1hG42ewYMU/KLvtTssahBpdxXWoOiKxfX2K3zLpLRv9H3mFlZF
 e0IWn4y/sn98HpemFMnaDh9g82DePoZ7ltfgdcRNvRd+2+47JSNlz7USxEdT7uk3oB
 tpn9fcAllaNJHvzKUgusxnASC3xOuPfIZiixyWAbXY44YyL7X/WB3DEkpw1hv4O+kx
 CQO5wt+goiilMybXlUd9Kz3m4bAnLaaSkVr9OOBGfE+s+fSwoxXprjyIEaOV7BswVa
 2eDfRaSuqoVlqyjm1r7IHldTppGTRyxQVCYEwbD4ORp4ik35NoJ9c8c0nWLbyOaBwK
 3FgZu+Ne382Gw==
Message-ID: <5982c766-5170-4d0d-b49b-8f1adf6f506a@kernel.org>
Date: Tue, 15 Jul 2025 14:52:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1752486705-9498-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
In-Reply-To: <1752486705-9498-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/14/25 17:51,
 Zhiguo Niu wrote: > Should check these after
 c.devices[1].start_blkaddr is assigned > when c.ndevs > 1. > > Fixes:
 316e128fe3dc
 ("mkfs.f2fs: adjust zone alignment when using multi-pa [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ubZXN-0008Mo-TZ
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: adjust zone alignment check to
 correct position
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/14/25 17:51, Zhiguo Niu wrote:
> Should check these after c.devices[1].start_blkaddr is assigned
> when c.ndevs > 1.
> 
> Fixes: 316e128fe3dc ("mkfs.f2fs: adjust zone alignment when using multi-partitions")
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
