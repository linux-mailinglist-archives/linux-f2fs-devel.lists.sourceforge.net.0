Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64579880EAE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Mar 2024 10:34:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rmsKe-0006aZ-Ip;
	Wed, 20 Mar 2024 09:34:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rmsKd-0006aG-0K
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Mar 2024 09:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FYRH9LQUO5Zy78zajfhq2GUcKuOKFIEFzG2dkQETMWc=; b=DdZxnA8fHpWFG+z0vSKLmU98zd
 4j4et0QXmRoYOFKQmJ2wxfBdMnDX6LzSk7Qo8V+vngJbmh6SU0yMF3Ch3rZ3uuOwsIFc4PtLV6r6+
 3/ShfBaIdteJ4V6VyJAMw3IWiZTc56AWZSVlR4VP0G2zzW5srGUaoATDhvXMIZ4k5FiU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FYRH9LQUO5Zy78zajfhq2GUcKuOKFIEFzG2dkQETMWc=; b=Wj/KvYz6iaFzmJDemsbC+RxvP0
 k2fod2+5CgaK9Zg3Sv3hd/Pcp6NAEOcgq1Ec25QU4MFpR2HlXy91fMteHRWVKOQrdZygUJ6yXYirb
 y/3VEB5UGpblZYgnz2av7GrZ2D30CwF/B5G0jJtrruHYLMqL6oL1Hxh8iofdAF7MPHmk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rmsKV-00039O-5R for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Mar 2024 09:33:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 62A1860EE1;
 Wed, 20 Mar 2024 09:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55712C433C7;
 Wed, 20 Mar 2024 09:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710927233;
 bh=IE+o1l0WGWEttVDnKe7FjFvkcYXmDz+elWeacfnwMZU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VOg3BRqKWZLSqHtq60RdJXWRP4F7nfsNUtfrDO3sbq5vIfcRIK88XmEZsS5EZnbvR
 Zrmwmw449xp4CrA+YFDAo85FUcRhLcFY2Z4jaaU6BtrNtwNcPsDSaN8SeZewxtI5c6
 OTjtia7ZVRaPyjYqwAIngNRe+156MfJLEyVBLbcpzoBKpmuosXzFr0Mli8+jTjwFjR
 6s3ZnETQ8ZgN99U4/ghylzk9NpdAmbzjxlzzq/aGEi5gTfAmGI6WfungbC6a1Vv5tY
 rZLZQQK/XoasuSaZD/00B1kNswaaNYN8qs/l/b4C4FSLDhUQ4X4rjHX+WvsoHvA8lk
 2P+kYv+clO1QQ==
Message-ID: <ee24b313-a168-471e-b60f-1404c69e61a7@kernel.org>
Date: Wed, 20 Mar 2024 17:33:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1710915736-31823-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1710915736-31823-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/20 14:22, Zhiguo Niu wrote: > some user behaviors
 requested filesystem operations, which > will cause filesystem not idle.
 > Meanwhile adjust some f2fs_update_time(REQ_TIME) positions. > > S [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rmsKV-00039O-5R
Subject: Re: [f2fs-dev] [PATCH V3] f2fs: add REQ_TIME time update for some
 user behaviors
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
Cc: hongyu.jin@unisoc.com, ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/3/20 14:22, Zhiguo Niu wrote:
> some user behaviors requested filesystem operations, which
> will cause filesystem not idle.
> Meanwhile adjust some f2fs_update_time(REQ_TIME) positions.
> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
