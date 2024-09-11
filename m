Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 510FC974815
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Sep 2024 04:12:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soCq5-0003cO-3d;
	Wed, 11 Sep 2024 02:12:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1soCq2-0003cG-Jf
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 02:12:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+/ISS7V63FPE+/V658JzQaSPETBMqmN3IURZEJLfGb4=; b=KdEMQIMSZEi69GXBMo62vBMEY/
 Oji/D/kaF7UkBS/gJvzyPnFulAXSiifcx5PfoWtje8CVqw/DotxmT5IGYpL4JHuY5qjEAOVXrXInf
 S3ONWKLm3SgyMNt/DPHzC9bvOxieMTI6p1uzGMJfYLcNEfhzgjsTYSiNgmai+laE9x6Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+/ISS7V63FPE+/V658JzQaSPETBMqmN3IURZEJLfGb4=; b=fMvuSiDini789Q9Nl1+PZ/CDQ7
 LMioHciUGEIPFG/a+8x1SWV8qM3sOqv0cbjYz7wI3/8GcYrHC426LVynQA1jHYyhm7WMQaOxntjYH
 SR8LNPbC6+GmZcWS8pyZbc1ZnQcY5ZOX1Z2uHBm5NkSoceLuCsfSRmf9iPAHNYZvoB98=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soCq1-0004rN-Pz for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 02:12:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E365A5C0534;
 Wed, 11 Sep 2024 02:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70242C4CEC3;
 Wed, 11 Sep 2024 02:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726020719;
 bh=XD3xU71GufM2mam+Bj4b7+0w5mWce4gp07uM3VRrjSc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=GBkkQBwz2sdnZ8OQ2J/aw49QN7rsmPKVZFDZd0/PIcFCffgLjNHEgOccqA5nYDQKv
 x7D+4Yg9oPQ4MwMETng0bP4Y43b88ofCiBrOLrlcQjnjrHg4oRUgu/hPKMZ4/OeVKr
 ndVLmG948HoPtA0NDMQT05thK0vM2qPkqZ+FZJaJMB9/jvfIXoLNH/gOaI3QVB/oEl
 hVkK+ZZeLT4R9W41esBVevbfZX/jTWgw7xdQumipIZ5D3QZBeNUU6aJFT90TMxw0xm
 ffcVfMbEz3LR58Gr2SrW1F0TWrJfxg13WYTn2/OSfU0QyfpNCZ5L9V2zNEeV0B3NjO
 D0FVx2DK1gaug==
Message-ID: <9b9ee9a3-af25-45eb-a85b-eb86234a4463@kernel.org>
Date: Wed, 11 Sep 2024 10:11:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240909221946.2004046-1-daeho43@gmail.com>
 <20240909221946.2004046-3-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20240909221946.2004046-3-daeho43@gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/10 6:19, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > For the fine tuning of GC behavior,
 add reserved_segments
 sysfs node. > > Signed-off-by: Daeho Jeong <daehojeong@g [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1soCq1-0004rN-Pz
Subject: Re: [f2fs-dev] [PATCH v2 3/7] f2fs: add reserved_segments sysfs node
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/9/10 6:19, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> For the fine tuning of GC behavior, add reserved_segments sysfs node.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
