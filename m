Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 062316E1128
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Apr 2023 17:30:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmytd-00075V-Ee;
	Thu, 13 Apr 2023 15:30:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pmytd-00075M-1Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 15:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PUZuMZ6CeyLoHpniuGz1HCJbIOfOuKdw3gEoM9mSeUA=; b=cd3OnXk15TxijROOdtaw8slDwF
 7K4VSTs0Hv898AMCneYUuWJnqnYl/t2m3MvrW7GLAOWko9+Q+IDPX5/NGhe0DJnXUkSixB4Rpc/Dy
 9r3QAvFOOYxpDK2F7YPoX5FRB1UP+vQZXxY5b7Y7StkRScXFQyokmPYnCEm8A6YhzOYM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PUZuMZ6CeyLoHpniuGz1HCJbIOfOuKdw3gEoM9mSeUA=; b=lNTnSorY9YquJPurigga+Q40fb
 djDjfW7zGMgybWIJ4YRerZk9qkEz/L6ZAtSyBtSFQDqjt5ibgcUsiwKQ16gf0xhXojy2aopTrhs/B
 WBAK8gAlx4GwZ2lyVFgrqraYpr87L2St7wpaFIreW38r/XFfUlw3v7NUBZt6S0fcEGxY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmyta-0004tP-N6 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 15:30:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4A7E762F83;
 Thu, 13 Apr 2023 15:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5C8C433EF;
 Thu, 13 Apr 2023 15:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681399792;
 bh=WCkepq/738+2orq7PK25GkvgPQBCXeI2AO6IC9nQw4M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pne8MER3zV/HpnSukmOpJ94bWO2mctP5nOkEfXOKtvGUS4XZVsuZGNNYvF/Br3Jf/
 7RbXaoKS1BdeQfi/Fx3kf3uOM/MTi6BIcUJh6FeaEtoOw2iUbfKFOB9L7i47dgJakP
 4lH3NdPSxUi0RWyHZi2STbTyCN+fUXwhnVMAekiJyALeYvdI3yyDr1Luy9YhUNNn5i
 qMgZhyvUeVfIpA7gJcs5scD48COYexmWEABWr+XZBU44KJ7t4FMMyrZdVgYNa1J27B
 JtrvKKGWszk4z78oU4+AwwKmGu9OzUPP3af6wQEQU5UKuonXg4W/t2p5XqPoc6FBq2
 1T1MsIpECeepQ==
Message-ID: <2bce1365-6971-7451-e894-0fb1fc31a641@kernel.org>
Date: Thu, 13 Apr 2023 23:29:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Wu Bo <bo.wu@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230413101711.13682-1-bo.wu@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230413101711.13682-1-bo.wu@vivo.com>
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/13 18:17, Wu Bo wrote: > Wire up the iopoll method
 to the common implementation. > As f2fs use common dio infrastructure: >
 commit a1e09b03e6f5 ("f2fs: use iomap for direct I/O") > > Signed- [...] 
 Content analysis details:   (-6.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pmyta-0004tP-N6
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: support iopoll method
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
Cc: wubo.oduw@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/4/13 18:17, Wu Bo wrote:
> Wire up the iopoll method to the common implementation.
> As f2fs use common dio infrastructure:
> commit a1e09b03e6f5 ("f2fs: use iomap for direct I/O")
> 
> Signed-off-by: Wu Bo <bo.wu@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
