Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6A896E73F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Sep 2024 03:21:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1smNfG-0000nU-6z;
	Fri, 06 Sep 2024 01:21:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <SRS0=+ApI=QE=oppo.com=chao.yu@kernel.org>)
 id 1smNfE-0000nK-0q for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 01:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=76h1tDLnL79PBXDV1w5EM06K6hxOwgrV47t3JReSa50=; b=cCm04uv2Rk0DAb6voVyOMGZaAD
 YEMJnme6gVzCJToYgHY9lD72yu4EiFb0l/XxysuGl9P3Enmu9HQZu4CetCH6txswaYiwwW4aYlTaQ
 fmOyui13KlCIROBSqjqAqSYB4t+iiD9RX3sF4fQgvGlSeZ151AS28m91+ucEs5kOS0W4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=76h1tDLnL79PBXDV1w5EM06K6hxOwgrV47t3JReSa50=; b=l+bGOSqibA7fgrfA2sxMjByBZE
 Kt01RRhZwk+tFiwoR+yKJhGrtWTnVSp0PkMHwFOpJcDX4w3TB5s7muVgrZhyOv7PMpRLUtCMIBdv1
 z93RIewqXlKFFG1gua3zQjK5M9eCDSRc6L7V78kG3f/0MlmUEoKS2RY3+MyiUTyaQsX8=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1smNfC-0006bC-F5 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Sep 2024 01:21:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3CB84A44473;
 Fri,  6 Sep 2024 01:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1401EC4CEC3;
 Fri,  6 Sep 2024 01:21:13 +0000 (UTC)
Message-ID: <fcc7ac5f-98e8-4f30-bb95-9cda52856cba@oppo.com>
Date: Fri, 6 Sep 2024 09:21:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240905212014.1094170-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20240905212014.1094170-1-daeho43@gmail.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/6 5:20,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > Fixed wrong endian conversions related to i_flags. > > Signed-off-by:
 Daeho Jeong <daehojeong@google.com> Reviewed-by: Chao Yu <chao@kernel.org>
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1smNfC-0006bC-F5
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: fix wrong endian conversion
 related to i_flags
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
Reply-To: Chao Yu <chao.yu@oppo.com>
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/9/6 5:20, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Fixed wrong endian conversions related to i_flags.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
