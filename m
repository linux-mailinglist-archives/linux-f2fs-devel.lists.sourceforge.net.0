Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F380A942866
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jul 2024 09:54:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sZ49f-0002H3-T0;
	Wed, 31 Jul 2024 07:53:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sZ49e-0002Gu-CI
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jul 2024 07:53:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KcP75DP0srAD16OD9DYUomUAuV60xkdg/b5TVyFyt0M=; b=AGS45qFrpTyiWwJy8SZ08MPbys
 nPhq2jKZNMI5Y7z3gCMh6ImSFXIvURnUUQ/nxE45NsG0Ym4cOmfZ/N8bxmKhbCh6RPbxUAl0Zdrlr
 gV9IRyKAK1ctB5rRxNFIp1b3BdEiWD8mBu0AwrZgx0zJIGFiyttwSPc1AMrHiKpaxPbA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KcP75DP0srAD16OD9DYUomUAuV60xkdg/b5TVyFyt0M=; b=F9T5XkBA52K/xV/qcxx3PuPQPr
 OQg7U/KH4vAX/LNIEcFYKWdwJBPlKT2iwgLJiENSzek7zWB2a6llxaIloYOk4C8GO95XNmfTlrJCg
 k5391osPb8yAZfhcABWkXV+VtlFpT7USK5J0GnbFrFkabIkLgEm752kSKSXJ0dU73Ovs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sZ49d-0005Wv-QS for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jul 2024 07:53:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 73C176220D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 31 Jul 2024 07:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86CAAC116B1;
 Wed, 31 Jul 2024 07:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722412419;
 bh=KcP75DP0srAD16OD9DYUomUAuV60xkdg/b5TVyFyt0M=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=XJ/grmOZGHi5WanhVke0RNYkqqkXbpNv+ql8ALrJaO4ocubrCwrz48t6S2gyq+nPi
 mH+PNQDFgxaywQIAC8CzJ4u/uOlSR8KKvqiS8Kj+ia/AC7Wlz1N6dqzUhPBa/m8/21
 cBD+7szVmWrCaf7A3xojBsiUPHHWb+p+Io7aIEN0pSrvHBfiHU77IKX7PRF+GkXl3k
 mYB3mSmq5TmPbloiLAzxJvDOM+Ab3LHg08O8//epn4zTYSHJ6qFHNcF5CCgMY25KO/
 QfEkucc6Q/+uDh0mr/zKUrKg8HWve1gz38Iiv9D5PfAsUaprv6eeOB6nQdKOotLdG8
 F99BHsjYSo/cw==
Message-ID: <5540d539-bac6-448f-896f-1bc2b6700a4b@kernel.org>
Date: Wed, 31 Jul 2024 15:53:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20240725183941.655356-1-jaegeuk@kernel.org>
 <ZqlA2aMjz5x4GpJP@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZqlA2aMjz5x4GpJP@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/31 3:36,
 Jaegeuk Kim wrote: > Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sZ49d-0005Wv-QS
Subject: Re: [f2fs-dev] [PATCH v2] inject.f2fs: fix some build errors
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/7/31 3:36, Jaegeuk Kim wrote:
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
