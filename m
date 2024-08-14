Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA0C951336
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2024 05:46:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1se4yF-0008QU-Cf;
	Wed, 14 Aug 2024 03:46:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1se4yD-0008QG-Nb
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 03:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+I+rhkV2raR597CYlZg55aBrLQoEGfgWJehZT64ek7Q=; b=fYATzzzO4dndT2ePeE/QFSYAGw
 5/rSsVz+cgt672AktPA6nH4fYWj0Nv+ShBQc9wtpRQ5XB526AH6j5REXno+kO3CJneMDSft1Vc/DC
 be8GDygygv3dVkgSxkjlf4MxWWl7JcfDFeSjt1lvbHpOlTyxAE2UCmzPodG3673SZvP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+I+rhkV2raR597CYlZg55aBrLQoEGfgWJehZT64ek7Q=; b=ed6l2lpcg9/VhV5n9bTbgxFyAF
 CkUocXqipfKShTZOrd1Y3JyTgl/wREKQ6GiKoQuAtaJRG9ew/iYhQdJ8n4tIKpGJZ8LmG/RQNwEOA
 97XqWn3xL9p4z3sJTanE31/RW0BRDlmI+5GzCn8FDJobUyKtFSzngMLbwZihNAE2D9HA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1se4yD-0000Gy-4T for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 03:46:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C0AEE61952;
 Wed, 14 Aug 2024 03:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1939C32782;
 Wed, 14 Aug 2024 03:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723607194;
 bh=QKqipaCiujhLLpOhsTkVEy6yCbaQiIY6pdBvzPXLQiE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=a03hsD1DeWZTfBF803fZF2XKKQgMWa1QTNW+Tp0G8KaTEbuQC+d/0hBatJ97JXbPX
 /Eb1e9zD/YnC/ugLjcd2rh56khJMmrwbZNZ6keDGLsa7KwbvPDG1xgRNsim+sxLX5m
 MUklPoLPI6oax+6/dqGFNYvxUguCXIrThqCvKnStlya57lG40/b8TaA4tZHY0rDZt1
 3fRFnUfNv7qY+GROFYwD//7pL4E7c+O/i/DpkEfvsSm8x+PrjUGZ4IM3itn1g1IURU
 tHtznCYLG8soJoEaLyizG53EqqTizkt5NUJcLViwnXTpBO74ks09MSRE5+cDxs3lnN
 M2qByBfrzA38w==
Message-ID: <cb97d276-7b3b-46b1-8f36-1bbcb066a117@kernel.org>
Date: Wed, 14 Aug 2024 11:46:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yeongjin Gil <youngjin.gil@samsung.com>, jaegeuk@kernel.org,
 daehojeong@google.com
References: <CGME20240813073246epcas1p4085b32d2b008b77119b811dc328b964e@epcas1p4.samsung.com>
 <20240813073244.9052-1-youngjin.gil@samsung.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240813073244.9052-1-youngjin.gil@samsung.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/13 15:32,
 Yeongjin Gil wrote: > The i_pino in f2fs_inode_info
 has the previous parent's i_ino when inode > was renamed, which may cause
 f2fs_ioc_start_atomic_write to fail. > If file_wrong_p [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1se4yD-0000Gy-4T
Subject: Re: [f2fs-dev] [PATCH] f2fs: Create COW inode from parent dentry
 for atomic write
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
Cc: Sungjong Seo <sj1557.seo@samsung.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/8/13 15:32, Yeongjin Gil wrote:
> The i_pino in f2fs_inode_info has the previous parent's i_ino when inode
> was renamed, which may cause f2fs_ioc_start_atomic_write to fail.
> If file_wrong_pino is true and i_nlink is 1, then to find a valid pino,
> we should refer to the dentry from inode.
> 
> To resolve this issue, let's get parent inode using parent dentry
> directly.
> 
> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
> Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
> Reviewed-by: Sunmin Jeong <s_min.jeong@samsung.com>
> Signed-off-by: Yeongjin Gil <youngjin.gil@samsung.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
