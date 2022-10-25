Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C01260C90F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 11:55:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onGeY-0000PU-EP;
	Tue, 25 Oct 2022 09:55:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1onGeJ-0000PD-4K
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 09:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N+Xm9s+Q55rjqHqWFu9t7Ne/9FKGe6qKceR+v+CDTjA=; b=fti7XZHHVxANuAUdOTM9HMua0L
 TyWC/4BdKcB0zWtAwYVbKhQ3aiSHWxpSbDRVRdfNEKeDXYEwwmkoPnPehCCpfYax8EyrGCTPGbUOs
 Wx0SdjVLSlD9ycVxl2WovCA6HXUf0RrugiOiZvI9mWaBj5t7J+MtU9x8agvLW59qtYfA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N+Xm9s+Q55rjqHqWFu9t7Ne/9FKGe6qKceR+v+CDTjA=; b=VLRLZDkV/lOoO8o07tffK5brmX
 dTZKrcxWK6lmo3WirQ+29Adw9TicY2f6cDzuEZFi0lqu34irfQLWNr/8+4jIRK76NR91YFpzG7JQ6
 OknGh4dVWZLXWVOQOtpspTN6KQpO/MKuGah9caZLB+M3eRHH7W4N1KbfmEXl1IVsAmMU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onGeD-00Gn2P-UD for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 09:55:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7CA1E61841;
 Tue, 25 Oct 2022 09:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE6CC433C1;
 Tue, 25 Oct 2022 09:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666691695;
 bh=Sn5QxHUGW0MLxrbMYVVS6I63hpzFrJ1YWuKaNZyOvS8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YHVpMCJMF0uOk2HMwX+HJOl3KTD/hatY7LAC+l1uKyFN4Nto1lmHY0iJ52cMa/jdU
 4ygFcDKm4xhCOp61ntTub1YFFnnSwreArUgKgjH1KYqEmdim2doGT/gZzWkXgtNSRD
 AYkyotinH5HZ3aFs0okM5T7un8T1klvltA1L6JQ0grPtGzazlzSRTL2NKrXi4N3KAy
 1NOEjkkIMkx2j/08HnJhc1pPsXSybJYMcW4nox2USpujeocx3CafFNLTiIJR5yg8eM
 UIICr8jEkGMmXEpcovyy3vJXJTFqzj/6E14BUrLFDQLnyAhW0bjuqVO8koQ/dgtFa9
 ZLueJ6IYRxuig==
Message-ID: <7d0e122b-763e-300a-0f14-5903f788ab56@kernel.org>
Date: Tue, 25 Oct 2022 17:54:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: zhangdongdong <zhangdongdong1@oppo.com>, jaegeuk@kernel.org
References: <1666690836-388913-1-git-send-email-zhangdongdong1@oppo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1666690836-388913-1-git-send-email-zhangdongdong1@oppo.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/25 17:40, zhangdongdong wrote: > From: Dongdong
 Zhang <zhangdongdong1@oppo.com> > > In the DPOLICY_BG mode, there is a conflict
 between > the two conditions "i + 1 < dpolicy->granularity" a [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1onGeD-00Gn2P-UD
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix normal discard process
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/10/25 17:40, zhangdongdong wrote:
> From: Dongdong Zhang <zhangdongdong1@oppo.com>
> 
> In the DPOLICY_BG mode, there is a conflict between
> the two conditions "i + 1 < dpolicy->granularity" and
> "i < DEFAULT_DISCARD_GRANULARITY". If i = 15, the first
> condition is false, it will enter the second condition
> and dispatch all small granularity discards in function
>   __issue_discard_cmd_orderly. The restrictive effect
> of the first condition to small discards will be
> invalidated. These two conditions should align.
> 
> Fixes: 20ee4382322c ("f2fs: issue small discard by LBA order")
> Signed-off-by: Dongdong Zhang <zhangdongdong1@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
