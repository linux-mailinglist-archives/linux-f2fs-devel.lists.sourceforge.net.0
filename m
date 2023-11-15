Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD2D7EBD72
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Nov 2023 08:16:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r3A7z-00051l-GD;
	Wed, 15 Nov 2023 07:15:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r3A7v-00051c-0u
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Nov 2023 07:15:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YUv8emRs3L8izzmSvdUg0SzBvzRvlL4iHkZIEVuPu8w=; b=VaHOoXS8C4ZQvShd+diz/5Yl3P
 /ijnihmpC2Mjp84XrOuS6hQv1jRLHJfrFMrFvVr4s26Wq+8Juj1gDCP7RmQdVvJva9HTZDJ/DVcCq
 3PyvcNezg80Bd9aldbBthboNvKi9e/uL/N1+1xrs9ekPWFo/HY90vksdjAT0jEdbaDnc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YUv8emRs3L8izzmSvdUg0SzBvzRvlL4iHkZIEVuPu8w=; b=Wj/4o2X81yfNLRrpw2g5X9O25N
 CvelqVrAa6ZJDak5Ado0noir7lWkx3zwxNuTDwQKOno1RNUdI6qCDQ01TEpOK0jiK12rRLbQBfa/l
 Rz8w6RgkyTiiRnp3kTsUoTs8eKhp7LZCY9ZbLOhJKWEiZzoFs+v4Yho3HLFKCaEFsbSA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r3A7t-006Csb-4l for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Nov 2023 07:15:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BEF6361508
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Nov 2023 07:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71E0C433C7;
 Wed, 15 Nov 2023 07:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700032547;
 bh=Pmsm7wI4cKyqDY1veGF+/GZTEJTnSFT4upasF/7TBIM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=FgjVHuisNy8EUz5faP71+Z8j4+hm5VAJ3R60X9gUDXKS1ic1Ua+hw8Y39S/MXJqYC
 2yDOsYcBz95e+MNy7LwJ9k7IZQKY8aSXhzyHu+dq+M+mcht4piU3atbwtSK/aLs6fx
 YU+pm7zyXF/OSuH3fm2jzd6ebaRIbVOj0s+RrQBX2AfFYIFaYXo8tn20orwnlroxQM
 a9rV1Gb3WTzYO2h5r8kC2h5/J4LhHXZcTowItarpJv1+3R5D9zVAMD9OSXeY7zn+hn
 NM0HWeiX2DZRnwWrPq+o1TVJgMt3pUNI8Nkh0N1AzJ4IZ2YMLZN83WOLf4Ny7VQhCm
 tO4ikAnpzSFRg==
Message-ID: <330cdffa-faf9-5660-4d8a-abb0ff94fbb9@kernel.org>
Date: Wed, 15 Nov 2023 15:15:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20231016215849.639313-1-jaegeuk@kernel.org>
 <20231016215849.639313-2-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231016215849.639313-2-jaegeuk@kernel.org>
X-Spam-Score: -7.2 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/10/17 5:58, Jaegeuk Kim wrote: > The cache offset
 should have been considered multiple partitions per fd. > Let's fix. > >
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu <chao@kernel.org> 
 Content analysis details:   (-7.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.9 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r3A7t-006Csb-4l
Subject: Re: [f2fs-dev] [PATCH 2/2] fsck.f2fs: fix cache offset for multiple
 partitions
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

On 2023/10/17 5:58, Jaegeuk Kim wrote:
> The cache offset should have been considered multiple partitions per fd.
> Let's fix.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
