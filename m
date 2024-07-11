Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9FE92DE14
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2024 03:40:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRinB-00041b-0Y;
	Thu, 11 Jul 2024 01:40:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sRin9-00041U-1r
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jul 2024 01:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7NwSYk+dfrW3IbiEK+58ycMIS7BOKGpfXh8lgcHfoIw=; b=XSofLT2HzM+z/HadIfXhnkXeQq
 uD55S+2rYqvcQNntDB68KB64+xwbDaFyqiomqcJImZNV2sc7nH5Zg2kOro01Ff4/ehbOKxnEQPNT7
 3mq9Zj1ZITyy4WQadViF/ore0V6nRkWjQt10UKOtUB/tPoQpX9+ML+zngrrZ/1JFK4i8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7NwSYk+dfrW3IbiEK+58ycMIS7BOKGpfXh8lgcHfoIw=; b=T4PGtV/VvJpUdaEDVqho0b4hzn
 4qV/wrwCpK7FimRBgYKES47b7GsnfL4JYZ5EB7coUVxasl7Iz9mkA+xz6u6nC5nlrSphk7YQ7+Tz8
 Jg5IdLvOXzLMZh8cw5ahCbdEQq2ZqhBBYAo+9578DiSV5+zUN5mR7dohRfHkBOMIulEA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sRin8-0003r8-NY for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jul 2024 01:40:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4079ACE13C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Jul 2024 01:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA804C32781;
 Thu, 11 Jul 2024 01:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720662001;
 bh=7NwSYk+dfrW3IbiEK+58ycMIS7BOKGpfXh8lgcHfoIw=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=I7wWTUh4xZnAfoK4mvRjc9V6Qit8MWQYfLN921n45x3exSlNFQw1jNaIhhg4Yklzu
 +2E/Jb9ld5X6E1Sj/FCFcRcRpqc0l1A2muwjxuc25ubziMkReKacsQvAM95ZvDOpTW
 rtFI2027nRMstgb/H3zgw4RqgkGVNDMC07iq7sS95Rn26jTykNKteN/UH3khjMLIlY
 ABLanozKGKlTz6Fa9VksqmvYPW58k3gaTU6l+6zS7KK3C5wjbEYN94aYC0Onqxf60H
 qPEBYy2steaCuE6+uXOqez1UrA6WNDkzIdKEZ5LHD6Z/9GgdtSHK3rtTwYBqek7NMg
 UL4e5b73SAh0g==
Message-ID: <9b151131-98ff-4f0c-8595-07c4eb5dc759@kernel.org>
Date: Thu, 11 Jul 2024 09:39:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20240710230319.33025-1-jaegeuk@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240710230319.33025-1-jaegeuk@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/11 7:03,
 Jaegeuk Kim wrote: > Signed-off-by: Jaegeuk
 Kim <jaegeuk@kernel.org> Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sRin8-0003r8-NY
Subject: Re: [f2fs-dev] [PATCH] inject.f2fs: install makefile
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

On 2024/7/11 7:03, Jaegeuk Kim wrote:
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
