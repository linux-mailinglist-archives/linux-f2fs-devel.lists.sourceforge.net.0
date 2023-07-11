Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1A774E989
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Jul 2023 10:55:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qJ99P-0000bq-Hy;
	Tue, 11 Jul 2023 08:55:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qJ99O-0000bi-67
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Jul 2023 08:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pDs/IaifyXHFlduHoHmYBruCHPKPem8Fc/Lx/xaYc74=; b=S3N3IvdrlT3ep7h/jgHx/92Tk+
 tw31SnrTaAaHyQAhdinY4sU+3tJFnEECcxSFDs60gfflKMSK6IBcnfMhokQtbjbUgEmrBJi8V+3l0
 bNfVU+gKhaNOW9efy8jp4BF/b6a2xS9LxSgdB4yx0qQKzytHSU3AXvRTdRsdkm6su5Is=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pDs/IaifyXHFlduHoHmYBruCHPKPem8Fc/Lx/xaYc74=; b=GHj+GgZbf0Tz2+ZFuGL95Y0CIB
 5FCyHTOi0pZfXRm7iT1WWluUDXP2ZuioGMkuwdRj4LEyW3PC3JURMe5h2Q2U2b1et+8eZXUZxYCgn
 JttXseVMz3EQHHRD574mnY5T5LxhkqFB+i8kM8ZBURgPfc8DuS6gvH/iy32Jwn2aVaxM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qJ99N-004AU7-V1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Jul 2023 08:55:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8C7A861384;
 Tue, 11 Jul 2023 08:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 498A3C433C7;
 Tue, 11 Jul 2023 08:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689065708;
 bh=XvP89t3HHPBECt9VjL/sHSXNgZhO/iLWIawMuLuiRYQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Aa6IKtgfgiAOOnAqkzTnwcb34RBZLQMO4yt5mdNXg7gLjcb7U5xgthyRyrjzbavNu
 CeBVIQbAvthbUn7xv+gfeeubMdkNcfUw+SJY0wVQGacfkVOoYJ7E9Ei9coiEvQIoSj
 gEXuanncPmytzTmcR2PxrZRy4C2XtsAaPLKMgzwNZhNzh/yCZSHauFcMckgrGa0LKj
 clD/QPAD9Kl6wRieyvLPmXqzjyH7xAFEYpdVVLVbtCyXEqDA2qZ1eGDio4k5yHO2Ej
 0NyZk5luszfce9XxgzaDnzQstZN4gvQ+93b3cI4DfGm1t/yrTKi5Vuzw3sIlHoqfGb
 VTAXDVBw98kCw==
Message-ID: <02f16df4-e98b-9156-f0b1-52e86e5a8751@kernel.org>
Date: Tue, 11 Jul 2023 16:55:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20230710052324.2857-1-rdunlap@infradead.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230710052324.2857-1-rdunlap@infradead.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/7/10 13:23, Randy Dunlap wrote: > Correct spelling
 problems as identified by codespell. > > Fixes: 9e615dbba41e ("f2fs: add
 missing description for ipu_policy node") > Fixes: b2e4a2b300e5 ("f2 [...]
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qJ99N-004AU7-V1
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix spelling in ABI documentation
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Yangtao Li <frank.li@vivo.com>,
 Konstantin Vyshetsky <vkon@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/7/10 13:23, Randy Dunlap wrote:
> Correct spelling problems as identified by codespell.
> 
> Fixes: 9e615dbba41e ("f2fs: add missing description for ipu_policy node")
> Fixes: b2e4a2b300e5 ("f2fs: expose discard related parameters in sysfs")
> Fixes: 846ae671ad36 ("f2fs: expose extension_list sysfs entry")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Chao Yu <chao@kernel.org>
> Cc: linux-f2fs-devel@lists.sourceforge.net
> Cc: Yangtao Li <frank.li@vivo.com>
> Cc: Konstantin Vyshetsky <vkon@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
