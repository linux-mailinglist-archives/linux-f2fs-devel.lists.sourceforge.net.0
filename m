Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D274E73AE69
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jun 2023 03:42:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qCVof-0004To-KW;
	Fri, 23 Jun 2023 01:42:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qCVoe-0004Tg-CV
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jun 2023 01:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SqVUXlf/dHn0RZwU8tKAFLD1U0TC6UVKvT/Dotl5fAo=; b=iTQ3A0eYPAjnscnNYgNmsAFq1D
 hkZI29U6g9FJNbOrWj1kmM2vdENn+7/a59fXK2MPJVJzAm17TYhCp9k+lKaR+CRY1gXasP20gF40f
 lTQNz6DqvqU6NUHpIn1Abqj7vHHSIdF01lUshq03S4x5zaP2FFqEDSRiFzohGxCe/JwU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SqVUXlf/dHn0RZwU8tKAFLD1U0TC6UVKvT/Dotl5fAo=; b=ea4HTqAzDTEFkbZbQZfC+at5gc
 FqDGpjiv47nMJ06R5qLOYThPRXzTiABFo9VgEv7qs89hFfkYxOIIMWxw6fnBSOsF8BZT/zTUSru+1
 mSuO/YwySeCWCS5aumx1YFARUkq9F6lLIPL88GEwzi2a1zxos67uRCUeDRnzpCXvpdwI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qCVod-0000gv-ST for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jun 2023 01:42:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7BE7E61939;
 Fri, 23 Jun 2023 01:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAEF0C433C0;
 Fri, 23 Jun 2023 01:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687484537;
 bh=cJxVoMY9xjzzczcnG6Wx/YgMPUGQAZLGMTbwz1sVih0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sWB6/SsM+KGbb7N1cyDmOikfSV1uc7l8IUQzvSC8FcgIUfsHqZzsJKQGjP+ZY8Eyi
 6tUaamhpSsDfeFfZE9Rn/XkYh/9xXmDtSgL5P3HRKqF4Fxol0cykkMQL8T2NpAyqiv
 Mojz09Kk9KH4z+CIdBdr8H0Luc1L5NNMRqbcmCM7Voo+p4QPYBuN5AdHSuih+8o9oW
 N+WXDaudTZTeVXp3wwwU2HJ0pqvI/Bu5OT7gY5GDzVfdEsm7OndD9ZTCEdwanGLEHT
 CwmFYSbsJ1rrqv/UEi611So4AQmNvfufPtYFZkyPugB6f/XaoITtgmOjR9GBjmOvwG
 B7jyaaUmcWAcw==
Message-ID: <9a340123-1f11-44da-5090-b1acc669a309@kernel.org>
Date: Fri, 23 Jun 2023 09:42:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Yunlei He <heyunlei@oppo.com>, jaegeuk@kernel.org
References: <20230622161647.742012-1-heyunlei@oppo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230622161647.742012-1-heyunlei@oppo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/23 0:16, Yunlei He wrote: > Mtime and ctime stay
 old value without update after move > file range ioctl. This patch add time
 update. > > Signed-off-by: Yunlei He <heyunlei@oppo.com> Reviewed-by: Chao
 Yu <chao@kernel.org> 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qCVod-0000gv-ST
Subject: Re: [f2fs-dev] [PATCH 1/2 v2] f2fs: update mtime and ctime in move
 file range method
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

On 2023/6/23 0:16, Yunlei He wrote:
> Mtime and ctime stay old value without update after move
> file range ioctl. This patch add time update.
> 
> Signed-off-by: Yunlei He <heyunlei@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
