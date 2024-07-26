Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CD793CC45
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jul 2024 03:12:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sX9VH-0005It-I9;
	Fri, 26 Jul 2024 01:12:16 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sX9VF-0005Il-FN
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 01:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hVEoZmcpHQtvZ/1yjwxuQlcu1w890mumGAYZypNIl04=; b=XPs7d58Ur7gAVXu9QaJL/yd6MG
 OsvgqNQESwpYAlO8RIALWO+un2wnsV9+ObwsayJZLhu/FfmQe8LfAV1gStDon+OjJfWbsv3FuGseH
 qhBscEBRLG/uTReMX+B4gwhPTmi9IzywMiuUkm+lsW1BEvGKIgY68nN2nUTpUMIZZKQM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hVEoZmcpHQtvZ/1yjwxuQlcu1w890mumGAYZypNIl04=; b=CyQ873j36IAQw6RvTj4KwGKXoi
 LRXIJJzEw7wpW4RNzc1HUlpRevPsNgWwuYk25jyWbNaKc0HjS1J6HkHCbRN6pYkEwAhTZep8puHQx
 UEY0gUFumW2mZ7X11vuoQ/onU5PyCgz88KRMG2kB8PPOQ8RAMUVcENIY1kB9wl7KIfGI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sX9VF-0002s6-JA for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 01:12:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 383FE6059A;
 Fri, 26 Jul 2024 01:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE76C116B1;
 Fri, 26 Jul 2024 01:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721956322;
 bh=xjkTZ5UAPen9/U6tg1G2eBQrpopwtj5Nrz5YhcDI61c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Rzq8OKTnAUBfcar/ecaNbW+7743+wbv39keE/8eot41vGVWD3wzmVlHhqTdjVizVf
 ON5AVnQnIAi7gyucFtOhD0ZF6+0or1LG/+FWvs7AwCKSPH/2VLLO+z1gvIOSAqGvRf
 YSyOyg3NYVr1zhkiqjMZUDPJnF39FMeE+pXk5ehz8CCS/a0eFUrqtM+eLU8w2hEK8o
 ed/1jTwSEy03s5pSG/a8q7ZpO8P96fkuoQ9Xy3xhqTkoD6bOTZA0Si6XMY1FCLoIqb
 hgNkv5Hgb/ROCbaLrGZ4oWncN5v8wj0yRroaWHpTyQ5lxREzoiaVBVYurNdDabYucc
 Nswmuw1HzSVKg==
Message-ID: <4c0f1578-09ea-40be-af0d-60ba968b9672@kernel.org>
Date: Fri, 26 Jul 2024 09:11:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wenjie Cheng <cwjhust@gmail.com>, jaegeuk@kernel.org
References: <20240614004841.103114-1-cwjhust@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240614004841.103114-1-cwjhust@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/6/14 8:48, Wenjie Cheng wrote: > This reverts commit
 c550e25bca660ed2554cbb48d32b82d0bb98e4b1. > > Commit
 c550e25bca660ed2554cbb48d32b82d0bb98e4b1
 ("f2fs: use flush > command instead of FUA fo [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sX9VF-0002s6-JA
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: use flush command instead of
 FUA for zoned device"
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
Cc: qwjhust@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/6/14 8:48, Wenjie Cheng wrote:
> This reverts commit c550e25bca660ed2554cbb48d32b82d0bb98e4b1.
> 
> Commit c550e25bca660ed2554cbb48d32b82d0bb98e4b1 ("f2fs: use flush
> command instead of FUA for zoned device") used additional flush
> command to keep write order.
> 
> Since Commit dd291d77cc90eb6a86e9860ba8e6e38eebd57d12 ("block:
> Introduce zone write plugging") has enabled the block layer to
> handle this order issue, there is no need to use flush command.
> 
> Signed-off-by: Wenjie Cheng <cwjhust@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
