Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A432B85B2E9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Feb 2024 07:29:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcJcx-000578-Ru;
	Tue, 20 Feb 2024 06:29:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rcJcw-00056t-9D
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 06:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f/cX0Xb+suXKEP+eoJpTnCJw48yCFcQJWk46D5ossts=; b=Evm4GsvN7eXJsbtnUC/3BG++dU
 oPc4n4zTyKPqDC6O2CevMVSEsWUVBRxERgxVLUv0LB2/v7dFdiq1zt5FxZ5dzJyKlXFBofo+ZB37x
 wrU/xrUd8ynQCjAlwwrK5Efv7fk0zcIkTmX8kIsN8mUx6+QAKRXf09p73DsZV8OicoNw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f/cX0Xb+suXKEP+eoJpTnCJw48yCFcQJWk46D5ossts=; b=lTQpngEAaIBPp99Sqcz7q3rHz6
 ySj3aVGQ8iUxqb7iA9mmGiSz/U2nQLnmrZHhVWqvoXor3ZMzLGkVsZexPLwHx1N1sharmwBILuXAT
 p/BCWkkrBsQgK5q+gTEnrv1Cc3bMaJpyIRzxAjmO+Sjkk4Yy7r86SiWt+2IS3n/0yR+A=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcJcq-0006EB-3c for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 06:29:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1AD8161046;
 Tue, 20 Feb 2024 06:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB4BEC43394;
 Tue, 20 Feb 2024 06:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708410538;
 bh=Ikjos80Zh4ll9+FUW8GvMvm0wxmlexe33zUqOA66Oe4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Mq4C/18lAi4M7zsAm4LZ/+yCdlf1E4TTdePQzBVcrGiEM+51rNbUfT5llkiwyaf1J
 zr1YL0j+kZg6cFhsnRDru4TiXgAmO7KYH8XEY6ZiTk02lt6g10Sl9NTOMUGolUH/dO
 xmqd8eGOWpIxMrYpDz8Dt+KNJzDdTgFe2Qgplie2bR97Ch2y1l19N24fukS2hSCAfQ
 Pa29ZgiUyrKTELJqSUsPEvMys4IYsE1fjjJ/zv64q+OkP7bm9y1GaI9aTDUTJc3KK4
 GHSCH3eIhi7BVWXEu+waTfomTQeNlJZZxCSqkig/jfvDZqZslAhNbblSxo76ViR9Mh
 +3y2WG+i7YfJg==
Message-ID: <3c8a3170-3a73-4c97-aeac-0d86356a0f03@kernel.org>
Date: Tue, 20 Feb 2024 14:28:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1708409484-27326-1-git-send-email-zhiguo.niu@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1708409484-27326-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/20 14:11,
 Zhiguo Niu wrote: > There is low probability
 that an out-of-bounds segment will be got > on a small-capacity device. In
 order to prevent subsequent write requests > allocating bloc [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcJcq-0006EB-3c
Subject: Re: [f2fs-dev] [PATCH v4 4/4] f2fs: stop checkpoint when get a
 out-of-bounds segment
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
Cc: hongyu.jin@unisoc.com, ke.wang@unisoc.com, niuzhiguo84@gmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/2/20 14:11, Zhiguo Niu wrote:
> There is low probability that an out-of-bounds segment will be got
> on a small-capacity device. In order to prevent subsequent write requests
> allocating block address from this invalid segment, which may cause
> unexpected issue, stop checkpoint should be performed.
> 
> Also introduce a new stop cp reason: STOP_CP_REASON_NO_SEGMENT.

Can you please adjust f2fs-tools as well?

> 
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
