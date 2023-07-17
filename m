Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 128CC756763
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Jul 2023 17:19:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qLQ0I-0001xi-Qv;
	Mon, 17 Jul 2023 15:19:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qLQ0G-0001xc-6U
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Jul 2023 15:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xfeiprq15LsWNa08i6gdpwLgID4HT4BK6WMxQG+saZs=; b=V57bEibPajFvxSpsWpuRiMNk8n
 U8R/BPpWMvlXwDCvZJ0CqjY+m2D80918vBkNNCTmkAhuXAzXFRlEeGsIDdZjwrfPAwWGlFnv0rex/
 mOU6bwwGutB1eOtA9mnWtRbe1i5Y+Jt4X8aomZOt79SpL96rWKmiv4hUUzv3JDzG/b6s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xfeiprq15LsWNa08i6gdpwLgID4HT4BK6WMxQG+saZs=; b=Yx/8qYhhQ1XMPEy6dtlgzi2EFM
 SHVrs5eB4DRFK4IWzk5hOz3ChmyzXhpqCGzSdJfBBMki/ZmKBgPJ4PzZz/DaubGHw4jUWDDH/nrir
 Sl0ricxR/zPuT32cpFwi6kthkhwaiDw3dEOKQVy2U2mYRkrXPsaD4Kdbuz7TxCwqo4po=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qLQ0H-00068X-Oh for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Jul 2023 15:19:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B85C61092;
 Mon, 17 Jul 2023 15:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7191DC433C8;
 Mon, 17 Jul 2023 15:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689607145;
 bh=KZkJQmp84AEhU+9W80T72BVYGL/vqRsduvamQgjr4+4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PrkGFTdW7lDnX29XedL5ivguwIMELF6VOhi8fjHtqBJ7w+kZfLASICujOitnRih6b
 YzOdKmG8LZEL0SDbuG6r2CbRAFvSlHnpTyqQHJQGRbWDt8tcoapczwCy2XSO7rABmb
 v9BUB/wIYsITtkLzfEZy5Vy852RFThOm+C+e+35JkSfGFXPVu6JiB+thbfWNVJYsVj
 G7szRZJplB7z0SGrr2k9BX5/gGd/eB0kYxyPT6v7svnLvEBSgr8vCKyxmp6U7SoioN
 h7ah0i1qdD0qxJJYDIm6I8P2AexiGxHJuyKp1LO7DgkkCd+O+uyW0zHEy6j/rrNpSh
 pQYEGQiyYm3fg==
Message-ID: <3a1c7b67-cec3-791a-ead1-9ee3f2a0d36e@kernel.org>
Date: Mon, 17 Jul 2023 23:19:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Weichao Guo <guoweichao@oppo.com>, jaegeuk@kernel.org, ebiggers@kernel.org
References: <20230717105218.610616-1-guoweichao@oppo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230717105218.610616-1-guoweichao@oppo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/7/17 18:52,
 Weichao Guo wrote: > As the fscrypt context
 has two versions now, this patch adds the > support of fscrypt_context_v2
 for print_xattr_entry. > > Signed-off-by: Weichao Guo <guoweic [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qLQ0H-00068X-Oh
Subject: Re: [f2fs-dev] [PATCH v6] f2fs-tools: support to show
 fscrypt_context_v2 in print_xattr_entry
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/7/17 18:52, Weichao Guo wrote:
> As the fscrypt context has two versions now, this patch adds the
> support of fscrypt_context_v2 for print_xattr_entry.
> 
> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
> Signed-off-by: Sheng Yong <shengyong@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
