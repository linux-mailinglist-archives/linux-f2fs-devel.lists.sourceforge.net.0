Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F61D71911F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 05:13:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4Yl2-0007tP-5H;
	Thu, 01 Jun 2023 03:13:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q4Yl0-0007tC-BG
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 03:13:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lKySPhDaAFZidx0r5KCqZj3O3c6/3PILy5K6TsBjT04=; b=liE6+kjc5XgSimwbAD/bzdbrTk
 hv0jw90xmcnkg7XWy7zZ2OtFFUMHtwZJxKb9kw+n025kv8YtSKmmjuvUdhIIwGqqC6VcHTaYxrZTK
 U2n6hHHVkJXN2ZJv2N9l72J38VbT77Y+v93USR9FLMx+ds05qhshgph6hThYMd2BSLJ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lKySPhDaAFZidx0r5KCqZj3O3c6/3PILy5K6TsBjT04=; b=iUvNSfX70//6Y6ECHpOaavtuza
 4sITA0r0WiQFpjzZp9fNeLhP4zg7kmgNLUycLBavRPR1A4AZn3o+e/zSfs+1a/iXV/xVNH+jh+xma
 pz43Ig+s84Eg5Vr+tD6syuZ2KspbVdFzvXZS5iDVKZcuxto5mP87tBTxeC7o6kPzEOKA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4Ykz-007y7p-Or for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 03:13:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5538B60DE3;
 Thu,  1 Jun 2023 03:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E49C433EF;
 Thu,  1 Jun 2023 03:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685589215;
 bh=lKySPhDaAFZidx0r5KCqZj3O3c6/3PILy5K6TsBjT04=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sBiVpraafTY8EFRPOkJzwAet2B/XIou7Zl9My/WGnMkfZqLGK9UtR5T6XkYYXOfqT
 tpieVQzH6GjH45aMUYlg5Bis+RmOAmIxhYnb8HifLYEs6FuTvf338TIiR7GU8W/BRH
 ckJL4NEfhJhhkjBOnVQXs5Bhy/gesiUS+CWfhF7OQxTYV4rzy20NTGOjQQ8sl7DoXp
 P9X+lpDVeqLI9kdZEIlaLThq7rHRonvVtC9hc8LqmLC2kRZBvZsNTdTpBgmVXu2X+e
 f3rNfP5y3XLbkUpBLAJuUMm7mwxPbm1W7rTVBRsPciHauOEu9hm2hq0Pc4uVQYDBzQ
 HBZsSeBJUbLHQ==
Message-ID: <e49e9c41-19c7-7cc5-897e-136ebc027f3e@kernel.org>
Date: Thu, 1 Jun 2023 11:13:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20230529013502.2230810-1-shengyong@oppo.com>
 <20230529013502.2230810-2-shengyong@oppo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230529013502.2230810-2-shengyong@oppo.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/29 9:35,
 Sheng Yong wrote: > This patch adds get_attr
 and set_attr to access inode's extra > attributes. It needs to update
 f2fs_io(8) manual as well? Thanks, 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4Ykz-007y7p-Or
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs_io: add [get|set_attr] to access
 inode extra attributes
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

On 2023/5/29 9:35, Sheng Yong wrote:
> This patch adds get_attr and set_attr to access inode's extra
> attributes.

It needs to update f2fs_io(8) manual as well?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
