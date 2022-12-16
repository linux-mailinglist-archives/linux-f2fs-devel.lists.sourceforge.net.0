Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C009064E585
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Dec 2022 02:04:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5z9F-0005oZ-FD;
	Fri, 16 Dec 2022 01:04:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p5z9D-0005oT-HL
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Dec 2022 01:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=46DCp3guI1pdy6qP1WhV2q71moF/Spb9y1UohygO1I0=; b=gq4rbNsckRdkTiKUlaJlr+5Brz
 ThW1q5+87lQXPKMTTjS2zQFo63Plv9KZRqz0UX53sByPKh69YiwCA2Bh0IpSJCqbC+wftE/AwhYIT
 yHE76tBjOC+g+iHSoKDV2MnJBJ8MCE77kG5oyiZIqjujD+s/AywXQFwCYKBsjhigwKSg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=46DCp3guI1pdy6qP1WhV2q71moF/Spb9y1UohygO1I0=; b=Zcj/lz1UKGYM0VrYKrd2Tcx2MX
 kDkX+c61jwz9Bih8FBBFwoFtkTgjg6kMo+egtRkt0Qf+j+09kfh632qlWXiSga/HPHbEQY77f4x9n
 Vmt9cqKsxwSJboIIg+8101LmhT2b6kN0BIuRTVeuKPG6QhbVYdG4NX1/waLOEMo5+ibE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5z9C-0006nz-RD for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Dec 2022 01:04:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 62A66B81C3A;
 Fri, 16 Dec 2022 01:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DDFAC433D2;
 Fri, 16 Dec 2022 01:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671152652;
 bh=nvkUZQB3nczQlExkyxmnbzlqOWSqUB3d8faxu0BP5Ao=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rZ4XkhKssN7yrkLPvnWbdNzBqwg3kumeBZoNbOYLijf3eiz8p/oq6Hu03PU7xohLm
 GPEPdAgjculaWCx9KcCCa/erZyLgmbWPP1J6fKDEAzMlsED6NtChJ5Jvxd57533iO9
 DMApm1fdyDSP/vaT0YhThnr4XFiAzLHprpcxYmQsAT518BHjsnb7r+0xqDMuOyilKM
 M8WuzgJeEnrdf6kwVVmh1zdNAharrObY4+2sdwU7M7YyDEFEExVhCNf1R44s8OFFCZ
 Kmu90PZ/AtFaxkK3IdZFCN7e8iGiu1uLXME7gYLqnMcoOjqZqPbPyx2BvQ5u2L3mUU
 w5nkGYyhpDDfw==
Message-ID: <65a6b4e0-fe25-f341-0095-40c28d690eb1@kernel.org>
Date: Fri, 16 Dec 2022 09:04:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Yangtao Li <frank.li@vivo.com>
References: <Y5jPyEiAtDPx7VSI@google.com>
 <20221214072830.32911-1-frank.li@vivo.com> <Y5pFmv4AUDxw9GI9@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Y5pFmv4AUDxw9GI9@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/15 5:52, Jaegeuk Kim wrote: >>
 https://korg.wiki.kernel.org/userdoc/patchwork#adding_patchwork-bot_integration
 > > Good idea. I requested to add f2fs project there. :) Let's see. The
 website is available now, cool... :) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p5z9C-0006nz-RD
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add support for counting time of
 submit discard cmd
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

On 2022/12/15 5:52, Jaegeuk Kim wrote:
>> https://korg.wiki.kernel.org/userdoc/patchwork#adding_patchwork-bot_integration
> 
> Good idea. I requested to add f2fs project there. :) Let's see.

The website is available now, cool... :)

https://patchwork.kernel.org/project/f2fs/

Jaegeuk, your email address is out-of-update in above link, it needs to
be updated.

Maintainer	Jaegeuk Kim <jaegeuk.kim@samsung.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
