Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64875734B40
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jun 2023 07:16:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qB7FR-00062e-Iy;
	Mon, 19 Jun 2023 05:16:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qB7FQ-00062Y-C1
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 05:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CPPOEjh18EOVfQRRXRFfMmHQWZB77fB6/bZqhtpx+so=; b=gRVvofRg5Ml7jw3tLBGPqPvc0L
 LSE7aqXX1VOSm/QPLFVM0t1CEOSmS35v0XSgZAtGqcxOf788y2KQQdYvwW+TSbxtJohWaMIuY9P9Z
 10HHNajBMHvNUTG34OgFWr6K68ghI+AgXCEmwwUoWiAWfOgVbOdGMnJCFbq5a5QMdSe8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CPPOEjh18EOVfQRRXRFfMmHQWZB77fB6/bZqhtpx+so=; b=Dy2myg5Ymx87WtETC4IMjacdo/
 WmXSFkpmzlqycvteX4/coeR/+X+uKvpZLVncxRqLQgPhiK8+HjB/ygHUWhAkAC7PMWiFtXXcM2Ie2
 Dqi5oruVp04/gP+XsEZC+jEDkFjwltqMlBn68GTWYAOM2jwgzAqq17yZc73V1kHx6f1s=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qB7FM-008L1h-FU for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 05:16:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D98D360C77;
 Mon, 19 Jun 2023 05:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E704C433C8;
 Mon, 19 Jun 2023 05:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687151759;
 bh=oh/Uy30JLFAXHrBdALilEBTlFzZjO4BfoHPSTJ8+6OU=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=sB0CZ2Te9T2ZsTLS2qzTUhYWS2j3GnZIgXAoG3R+zG5JjMfYMmnfMWgdsuecW/NGU
 gEO9AfIt9H1iZ8AIOxDdJ3J/QrQ/eKrMGtvzjsfbO21MM7/k29GOeu5sh/q9U+zB/C
 qSnOrYG7mD+KrkKDvPdqDa2MVq3zANrmANAyKZuyMBxX26y7r+WVOXxyP/zbatV6Ea
 3UwtPhg5Hmq0tJcOEgzQxSRV/H+nH1tdBjiY+bVKhV/OwyCY4tQ0FjZDUQ9rXZTXou
 6bucWqBF2xIsGzPrPGk3ZmN7ukCCptYo+WFuE30CtzdM8MIfShL22V+rx25SteGhe1
 /cfEPBts6bzzg==
Message-ID: <1616c3a1-fe0f-c5f3-c6ee-e1298efee992@kernel.org>
Date: Mon, 19 Jun 2023 13:15:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230613075157.41065-1-frank.li@vivo.com>
 <20230613075157.41065-2-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230613075157.41065-2-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/13 15:51, Yangtao Li wrote: > F2FS_I_SB(inode) is
 redundant. > > Signed-off-by: Yangtao Li <frank.li@vivo.com> Reviewed-by:
 Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qB7FM-008L1h-FU
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: convert to use sbi directly
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

On 2023/6/13 15:51, Yangtao Li wrote:
> F2FS_I_SB(inode) is redundant.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
