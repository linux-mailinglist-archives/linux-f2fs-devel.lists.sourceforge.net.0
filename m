Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8FDA4B671
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Mar 2025 04:18:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1towKJ-0003fG-7X;
	Mon, 03 Mar 2025 03:18:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1towKF-0003f5-6D
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 03:18:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o3H8TOkwKSPrYXZx6QTbiRvkes4l3cvLIrDQMXlwFuw=; b=hs74r6e6jH3gkQXkolmOY1u3k/
 UvbqB2M8WoZIUBrADd7fgsCGEWrYTvRiisXQ6txOQEz3GhPQcEF5xnZdha1MYNb8zCT9oK79ap5Uh
 tTv6c+ytIdpgQFIm55RI36yEidZl0UeWoh4WUOnZQ8xX18zQ6SSbyR697uU/aa02ZBt8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o3H8TOkwKSPrYXZx6QTbiRvkes4l3cvLIrDQMXlwFuw=; b=aHQkXSOjoMOyIxJi9P2Sbp7kIu
 edf5XfOgflp3hh4A69d6uqybILT/qGaPGhRbHZ71HV4DksWUF2vW49uhVhBPcd/5KO7J7PVv6zo6i
 FtoToEEJ4TSE2xhaiSnXc3cAnViYWc78k/xzvz60F9kXhVVcRecFY4ZhqeneWzNJMd/M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1towKA-00054x-3k for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 03:18:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E68985C1008
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  3 Mar 2025 03:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DB0C4CED6;
 Mon,  3 Mar 2025 03:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740971903;
 bh=upBHyi5jjEffFgAacRtFBIMOktUNnKpZaTDp9pfP3zg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=cQ3EDlnL3PqwfJhYU9tSL5iqafL4QH/IPVAShQ0Svj4uaEe3PNatbhkqB/J+6ZoWG
 qNtJwueaXGObnHG1Rgo15+v8TGOwttM0YTs+oJwf1F4lHfwqJioiLqwV4uRNhokczb
 koKQ8W4jcHwKnA/sZHrR2DPYQrRF/YSxtIGH0e45RaYHn+N7ICAuCxtqY53X5BQZsO
 pOnHlADSpzwxDBe+aKZFNbvGKkAoKfFmFRHRE8rayElRXbPK7HmtlJMdPvQ/BWO/67
 J4Xa9Z0Qgr5bSJM26OwHrnCb8JY5dANfhADOTlaFcQSyg11RZQyaZPAxkRRehS4jI4
 nuIKyop4cPqTQ==
Message-ID: <c0f962c9-4946-4347-b26f-5bd4863aad47@kernel.org>
Date: Mon, 3 Mar 2025 11:18:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20250228190854.422890-1-jaegeuk@kernel.org>
 <20250228190854.422890-2-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250228190854.422890-2-jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/1/25 03:08, Jaegeuk Kim via Linux-f2fs-devel wrote: >
 This adds a command to call ioctl(F2FS_IOC_IO_PRIO). > > Signed-off-by:
 Jaegeuk
 Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu <chao@kernel.org> 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1towKA-00054x-3k
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs_io: add ioprio command to give a io
 priority hint
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/1/25 03:08, Jaegeuk Kim via Linux-f2fs-devel wrote:
> This adds a command to call ioctl(F2FS_IOC_IO_PRIO).
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
