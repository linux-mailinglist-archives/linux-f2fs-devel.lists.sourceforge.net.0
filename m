Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8061299DE39
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Oct 2024 08:24:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t0az2-0005ac-12;
	Tue, 15 Oct 2024 06:24:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t0az0-0005aV-E0
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 06:24:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D+WYB2e/BsUhcM2iKsksFekVqcj1/n+3VSIXuq3gBoI=; b=B84kxvpOXDCTFpFfbYXKx3SKc1
 KiQWMZXkS8vchFoPN9Cedwv9ZaTDMAty88JzOa3ZoEK0BJovIFKX92yVKjJrztqF3tJFvwJwz2hIn
 JNMYs/+mPy0eZEwgb1UCYEYUBV+IEzDiCDiCNMSppEtxCG2PIOYHVentNHcsWCI1s+XI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D+WYB2e/BsUhcM2iKsksFekVqcj1/n+3VSIXuq3gBoI=; b=gdeVOrnCF2frEtOj4lHlqxwAMl
 /+j2IfYDg5ggvpYdVpulgC51FNJr4sEnWUqZTyzG8y4Sq7LZvpMFICz0yXWr0i7tNSEHJzQYhP/gq
 at99Q4S+Mfz56cPjb+Up75yqg3gk65M1rF/GGhV39MfBKoTV8XAEBO/dF38h66KPwVnE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t0ayz-0005Ok-QN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 06:24:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 090325C5C84
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Oct 2024 06:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FFFC4CEC7;
 Tue, 15 Oct 2024 06:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728973467;
 bh=D+WYB2e/BsUhcM2iKsksFekVqcj1/n+3VSIXuq3gBoI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=hdDr6G+15JiYdszkN36PrV3sCv8PcdKiuIp2cPauXsxSTz95eEVaH4XRsba0wKxwk
 FRHkqnI/oqw9dMHrGjpLD/nE7uwQ6/mzr59fNRrVVNITCXyQvBosvuEhis2/glCgiz
 35+WN4KrX7Iva6/Be3uhE/K7InS1H9bnAUntLdg41bBQBt/JuTZb0FYSozmQc0v5jR
 0K5I6hr5T1Cjis3qHWQFY11TIAdHmiPP61Ailp7/Wz1itgljcOMRYB0+S9cmrrdUtp
 NzGnB1ZRTUxhmoAQVdzL2+sp6sgCAiwUsCWkHfoesWoDNQVR9V3sgw8uNTLxfZOrF6
 CrdRcxEdag91A==
Message-ID: <4354f4ed-d416-4f41-bf4b-5d49913bf529@kernel.org>
Date: Tue, 15 Oct 2024 14:24:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20241014213221.2599772-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20241014213221.2599772-1-jaegeuk@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/15 5:32, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu
 <chao@kernel.org> Thanks, 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
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
X-Headers-End: 1t0ayz-0005Ok-QN
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: choose MB/s instead of MiB/s
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

On 2024/10/15 5:32, Jaegeuk Kim via Linux-f2fs-devel wrote:
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
