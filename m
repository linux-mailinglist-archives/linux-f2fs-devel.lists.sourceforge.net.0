Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 064B992ADBB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Jul 2024 03:17:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sQzU8-0003Wn-4S;
	Tue, 09 Jul 2024 01:17:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sQzU6-0003Wg-9y
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Jul 2024 01:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yS7gDSMC4N+35Fp7rTIwdWlrJvanr0S4GbZxQjJ7Reg=; b=YfpiSB2PLi004Mx/fegrAcxrjA
 00fl/2FUdWv8PHPIiHpzOqa3qea6EjcsT9eL8dgAu2P8+RpfmHhM9nMm+CeHSuTu+AZS7YO4MYbCU
 t4RslMxaBLsNP0Zq/L+fSGbg8oXOGLaWA0Qh/8NriIenIEvJtVMiAFePkDIClwYeG+fQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yS7gDSMC4N+35Fp7rTIwdWlrJvanr0S4GbZxQjJ7Reg=; b=CpbhsSoXOtpQjLAEqGNwEcWHE6
 irCCVmBXfqDeS/U8XNc5P8e85RWj1UgITplrCW9e1INa4onXg5CB3H/vQq38S+c1Dp2Lo2mcDZFNg
 6wU2Sct49XLvNNY4Ai79pIjzD9/RSH6+5anvZb4mjFNLbdrfCMvgyClxBU3fkyNgutTs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sQzU6-0004Jr-Qq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Jul 2024 01:17:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B0B3461227;
 Tue,  9 Jul 2024 01:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532BDC116B1;
 Tue,  9 Jul 2024 01:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720487843;
 bh=obnbwPM8Tpsz4jf1AHrjx4tSMl96mYa3Fvrpjx+z21I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sN0P/x4D+9+rWA8LmSrSb+ki4i4/8WyLjMaBr4Brqk+fek8mLeHFGzLVUB0HyD5QX
 r9Ogl3gfqGbI5ubQko4odU4EQ+Rqbyktb/y312R+hxdwU0XLab3lHj2/HYGyorp2qN
 jyStudvaUxObIYjXLE6H1j8OmBt9I9qsuOYDdunXxpdFqn+m9Blbt1oiXZtV6Cxvg1
 fRRTvPtdzmFGtUHM8isOFVScq7aymwkXjrjf8XTIEsbJYScAWyQ5dSBW4sSCYjiUkH
 dMxgp6gSJlXptrorUeyuOwdVKJD64p9EGu+4x2trP9QqOYEd47A7AOYgIhemQnAu2I
 ZYsxIy7TbEtSQ==
Message-ID: <2627d1bc-17bb-467b-8ba0-fefbbe9c7c44@kernel.org>
Date: Tue, 9 Jul 2024 09:17:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20240708120407.2807639-1-shengyong@oppo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240708120407.2807639-1-shengyong@oppo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/8 20:04,
 Sheng Yong wrote: > get_ckpt_valid_blocks()
 checks valid ckpt blocks in current section. > It counts all vblocks from
 the first to the last segment in the > large section. However, [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sQzU6-0004Jr-Qq
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix start segno of large section
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

On 2024/7/8 20:04, Sheng Yong wrote:
> get_ckpt_valid_blocks() checks valid ckpt blocks in current section.
> It counts all vblocks from the first to the last segment in the
> large section. However, START_SEGNO() is used to get the first segno
> in an SIT block. This patch fixes that to get the correct start segno.
> 
> Fixes: 61461fc921b7 ("f2fs: fix to avoid touching checkpointed data in get_victim()")
> Signed-off-by: Sheng Yong <shengyong@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
