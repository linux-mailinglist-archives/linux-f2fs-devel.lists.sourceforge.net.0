Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 861A7835B24
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jan 2024 07:41:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rRnzf-0005qG-SO;
	Mon, 22 Jan 2024 06:41:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rRnze-0005qA-VN
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jan 2024 06:41:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0dHZiXcwMespCFLFGSMZjIK/eFnFbKoTeZ4nAFsZWKo=; b=K0KxIMylDHYIIQZVVYULciMVOU
 0iwqkNL7neYYHKHTxws8SlPaN6CoinqhuIIn36Bh0Gw7L49mPCi4JI/Vxo9AoDuAGtVXW+7DLB8Do
 9cUaAgp3gVPRHaxbb4lbl2Rdn3gmYhn9jT0wCXnBiRjU+SEYAJwc/aAM+RABv7VbV4rA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0dHZiXcwMespCFLFGSMZjIK/eFnFbKoTeZ4nAFsZWKo=; b=BjLKRXW3Gix4fC5W596408PeBn
 cv+0Hp5QT8tbdXXUBnrmiTfJQaRAxKfRzt9wuECO/1CXjbfe9sUwWJboAtHfDJj5GCE3lj2Wv8KA0
 NoCewCNolXdPNARqX9x8pL5Ok/fO4gPPvlXDQIdD5/zomC3eFATqTFnheJ152KtMffN4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rRnzV-00060F-0T for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jan 2024 06:41:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A2C46B80B77;
 Mon, 22 Jan 2024 06:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA6DC433C7;
 Mon, 22 Jan 2024 06:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705905653;
 bh=ESwAwHNR0KizEuBeTY7Ay/BPZ8adjrsgS5iwEFoTl94=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XGX5H/AIx66uCc8tuZhnqBID3S17b5a6COs4y9JN1drT8To4onRN4jgYEvk38e25Q
 GneFC3tr1IESHwzLLEDhWGN/N2PMI7cvewxXtqSkwlD22noRAOFL4DTTHa8iBlAOHz
 XaC9B58CXWcPRiiQ6I2ZZbuOl0RShk4X+A7ipBJSe077b9XMJzRTJfVCiDYRoEI0u7
 rHGVMYFEgRbIuE0rcjvtXdDfZoXLxefaKx0vl/9IcCX59s4WAnDNPbOOXblqVdIOt+
 f+Sp3QB8AiO3rd5uiFOgZ03Kj9KJRUUz7bPZhrbWTGaxoSFippWC9v9Gtm43+n2Pfo
 Yuh+rU2LkViVg==
Message-ID: <b0bd6cb0-bc0b-4cbd-a470-923bb2d11b47@kernel.org>
Date: Mon, 22 Jan 2024 14:40:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240117230032.2312067-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240117230032.2312067-1-daeho43@gmail.com>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/1/18 7:00, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Make to allocate logs after conventional area
 for HM zoned devices to > spare them for file pinning support. > > S [...]
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rRnzV-00060F-0T
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: allocate logs after conventional
 area for HM zoned devices
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/1/18 7:00, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Make to allocate logs after conventional area for HM zoned devices to
> spare them for file pinning support.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
