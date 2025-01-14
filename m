Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB65A10655
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jan 2025 13:14:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tXfo9-0002yC-FM;
	Tue, 14 Jan 2025 12:14:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tXfo4-0002y2-Sc
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jan 2025 12:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YiL3+ztai5BphHUGBEzL0s4BR4o6gB94qoNGnJzs1JQ=; b=ek84RDtLZXeU1ARYQ3GWyMDUb7
 na3nwpSS8S803xoe9TB4qW7ejG2IsAtsiNKF2UcjGE12BXN2Wioc6wfkIdlaleJOkdsEjcZN25Wp8
 B0Z+qnTd4NMJdv+v0bPXWBUJeCUC1YipzBcDuxH2tl1RKKQVXhzTsYTCfhHmAs9r60/4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YiL3+ztai5BphHUGBEzL0s4BR4o6gB94qoNGnJzs1JQ=; b=crc4G1ysigNVQUpU44S83P+kzs
 CRp1WSZqm60iG0pv0uJQ8m9H78TUCsnk1a0LMvkGgbj7yzOGQm7EytdzrY+08nPXCY09rEZWjGd+c
 wI4VgtHW3N24zYGF51PlPmLL7IvrNAzzNvTalnv9mW9QNOtVRTBIP9H+Lmpa5ym3iN2M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tXfo3-0000ZE-Jz for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Jan 2025 12:14:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 66D8E5C4D68
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Jan 2025 12:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2360EC4CEDD;
 Tue, 14 Jan 2025 12:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736856837;
 bh=EjCUYjTNkR1ofNQGE6VV9sm8XgJo0k7xoj4WRSdF4qY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=bJJkxx5g1OYY9me0/v9eI3XHKLinMvXdyy5bhYLCgFh8hBGioFp4l3O4ivTrHphNz
 xat9aHQDT/XcFLiKNkI7hzcSryVaPmivI+Nlz8nS0O/nEXTUngF3X0vBQwmkTuWgqF
 JF/fkKrYcfjjhHftY+HLos88sC4MOgNj9dIAhJbhXXbfB4Bi2rk2mu6JM8Qzly4Loc
 MHruTo0mMuhBhxompSWiIzPzprJVVtionokk3+cfQ/zR6PqzzNaJWYSDWzhmeC1CzV
 sfc68kstcruQjBVr30WFmxp/aBWVcPkOviJG6UCu3DhOfNF7m+tyog4Jqxc8iLEPhR
 KUZnTg+jH4VZw==
Message-ID: <a9874f06-a209-4f0f-b983-f7ff5d3cae6f@kernel.org>
Date: Tue, 14 Jan 2025 20:13:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250108181908.4148111-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250108181908.4148111-1-jaegeuk@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/9/25 02:19, Jaegeuk Kim via Linux-f2fs-devel wrote: >
 Let's remove unclear blk_finish_plug. > > Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tXfo3-0000ZE-Jz
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove blk_finish_plug
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

On 1/9/25 02:19, Jaegeuk Kim via Linux-f2fs-devel wrote:
> Let's remove unclear blk_finish_plug.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
