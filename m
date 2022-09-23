Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A7C5E7291
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Sep 2022 05:49:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1obZga-0007uA-LI;
	Fri, 23 Sep 2022 03:49:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1obZgS-0007tq-59
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Sep 2022 03:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8q2l4xojuuBiYN/VbjMNdtw6txtw3PgvF4ZhLb49mp8=; b=HPV5l9vNvXu5VnGAvM4/NyJEmH
 ZWs0+D3xmaM49UVGZAgJg65pfmicMDPFYpfXpI5hNZkghbDY6VSov316E1BhVPpkU6SUi5HIi/zWo
 +tHKd3NmNZjmvtzeqbl0sg9WxTK3b5qFkSZAglyTZf7vYhuLXsOla7XbtDLwrbHc4Emk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8q2l4xojuuBiYN/VbjMNdtw6txtw3PgvF4ZhLb49mp8=; b=fKZyvwbzMcAp4m9M+DzpvTZzvS
 2tM0oqQcn+kTN+eSaolFulU80OCGFAjcA0/dGKiU/GCDR40DdL78Q4cBrzYfhzd1Cr3LtzLKhFfcK
 sCoIAmVcfcowCvJLGzry6CymnG0tUDlnpobY2Du4kcOC5vu5eTtksXhUshgv5lhv3ZMU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1obZgK-0004Bw-3M for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Sep 2022 03:48:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B645B61137;
 Fri, 23 Sep 2022 03:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E123AC433C1;
 Fri, 23 Sep 2022 03:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663904926;
 bh=+Q6aM8zRScMQ2iGfiaiyZLKK4o8MFTRoU/8COnemOPs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QnpbsClmfb04NpMflLccEzDO4mH4k4XIK7/Gmrmco139wpNzgmh4kahmkGWQLi1Zr
 iQASs7IboeOiZzRlNykeekuhqyul+tH9QhLGPPQTyXv55lvTcMtX8NWaLiP7jdxIH1
 zeBYSen8kwQ0//cUVukq3dNdIs5aawFAt8teaJQZPRipqF4Q2JxFAysRBTdFG15lVY
 nRFktK2/1kSSY17d5zOYIl7otCJvOw6V7zg2BpWw+dMN9BF1jECviMzgj46xAD3Lxc
 ShGZmgLDzOpX1TfExaeYPhkAkuqxuHkeu4J+WhAJWAhR72xesrl6UxjJc9/UYtsbL1
 6qfjUOX8+krJA==
Date: Thu, 22 Sep 2022 20:48:44 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <Yy0snGZYtLKtORT7@sol.localdomain>
References: <20220913234150.513075-1-krisman@collabora.com>
 <20220913234150.513075-5-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220913234150.513075-5-krisman@collabora.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Sep 13, 2022 at 07:41:46PM -0400, Gabriel Krisman
 Bertazi wrote: > Instead of reimplementing ext4_match_ci, use the new libfs
 helper. > > It also adds a comment explaining why fname->cf_name.n [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1obZgK-0004Bw-3M
Subject: Re: [f2fs-dev] [PATCH v9 4/8] ext4: Reuse generic_ci_match for ci
 comparisons
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
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Sep 13, 2022 at 07:41:46PM -0400, Gabriel Krisman Bertazi wrote:
> Instead of reimplementing ext4_match_ci, use the new libfs helper.
> 
> It also adds a comment explaining why fname->cf_name.name must be
> checked prior to the encryption hash optimization, because that tripped
> me before.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
