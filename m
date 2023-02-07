Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAD068D6E7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Feb 2023 13:38:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pPNEa-0002ro-Lz;
	Tue, 07 Feb 2023 12:38:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pPNEZ-0002ri-FG
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Feb 2023 12:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=icUTmd4+Vrhhq/Ld1Rfvru4EFePD+gJ3LJmTLiUBYpE=; b=OTpvbuF4Jv7RHErMEY7yVSOAOO
 fdlRVbzZ6TCQy6u7gf/SqJgXWKFWNBy5k/tK/oEQgLJTcQnz6z3FU2EfmorXvoiDUNS4He9Gv3Py6
 dS9eXSOER1m2ttJW12zzl+YaJSX4fB/LE7gpVoCjBb0et8qGjy4PDVd0rcJIgi6sM1ZQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=icUTmd4+Vrhhq/Ld1Rfvru4EFePD+gJ3LJmTLiUBYpE=; b=DW1B1eL+1JdmVHTo8LTHMpPtQy
 yoIfb+XEO3m2+D7IKrJPnwX1Une5cCaVZH0MmChHE7lh2igYE3Lq9mAmJy3fRxuekpbzlDPTYJO2t
 KGTLEdCvN0bT9q0sBIf9oY4zTJa3pMrNllGt5fuszAFFtwNMa9kNy191kHAe8rv3e8o8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pPNEY-00Ddo3-1a for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Feb 2023 12:38:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BCBE2B8197A;
 Tue,  7 Feb 2023 12:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64938C433EF;
 Tue,  7 Feb 2023 12:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675773474;
 bh=b9flB4uOxysA7XLZ81GSdAGuhvvYN16nX7ol1cEkayk=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=TuTS6aRz+0b2o1CLt1xTjIGFZIvZUs3bjPIdnIeTkgK43G4HcpkCT5f4oHnRgQ5O5
 k6mG2b5+QA4XU4XkIcqUZay4308yncWrYFByyVDREWq9Xn0tTvT4VsofVQXJVSycKx
 UCQZ7HVhRYAQ5IR8s8LENIzeKpAQCHko/T6j/sKaf7WBHWzmEg78M1BKAbVSEx4RD+
 dQTdf+55qZN+YKjPDG0mK5ZvfYDN+PsP8pS5RmGuB0tUvEVszwhiThz/qYhFLDrELp
 OYWbxTpJKb8pWf8AWM/oB401Xm4y7VZf5qqyC0RJMCTqGiHLDYbRVK3xFYEhttIu04
 ljLKFZIvniI5Q==
Message-ID: <27713531-1367-bf5a-1225-32cc83bbd545@kernel.org>
Date: Tue, 7 Feb 2023 20:37:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: j-young.choi@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CGME20230206115600epcms2p736f05524a361d5926dbb401bdd218f85@epcms2p7>
 <20230206115600epcms2p736f05524a361d5926dbb401bdd218f85@epcms2p7>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230206115600epcms2p736f05524a361d5926dbb401bdd218f85@epcms2p7>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/2/6 19:56, Jinyoung CHOI wrote: > This patch is to
 fix typos in f2fs files. > > Signed-off-by: Jinyoung Choi
 <j-young.choi@samsung.com>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pPNEY-00Ddo3-1a
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix typos in comments
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

On 2023/2/6 19:56, Jinyoung CHOI wrote:
> This patch is to fix typos in f2fs files.
> 
> Signed-off-by: Jinyoung Choi <j-young.choi@samsung.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
