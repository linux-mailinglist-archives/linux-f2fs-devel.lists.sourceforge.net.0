Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A185B87BC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Sep 2022 14:01:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oYR4o-0000UB-D2;
	Wed, 14 Sep 2022 12:01:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oYR4n-0000U1-JI
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Sep 2022 12:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qYW4Lr1Tg+nyQ2LcAgJqdhmCPnnCquWKy0kLJpwC3y4=; b=Bo5yFa+Iz+FInS5zofXMMXwD6x
 Du4QiEReDgz42CcvS7U7QC6VWPOL+a2HAzEqD/pghj+9zISYRm7E1/R/PhxZQUWDMvw7O0x2HoPWA
 S70ZKf+29YCmBzynO0GUNBJ3fTRRWoi6u5z54j66BQ5vJKTzQsEgmu74aug6MwL7PLRc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qYW4Lr1Tg+nyQ2LcAgJqdhmCPnnCquWKy0kLJpwC3y4=; b=OlYlSS6YDP9fWXXxCWSPxy/rex
 6dzmvln9vuFbBiSlY6Qf0cnVLBDn2/VhDPErSiDnD2EdG2ovcK8X24gAzbj39Yq7IRqaHDbQb76A2
 I4M1TpSO9HGacRgd1bnncHgbGnrj35YLYZqhxr+pjDyLfalzFyAsZWHvNPHxUjGKSnIA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oYR4m-007ymr-U7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Sep 2022 12:01:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB03A61C9A;
 Wed, 14 Sep 2022 12:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7541C433C1;
 Wed, 14 Sep 2022 12:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663156858;
 bh=oKRFavWenN+ytzY8AzXRM7VfgxqFkGOUkxfCZUfKgBg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=o8nmeF529De22eXTKQaRKmKJsE7Bsv7cH3fuLKVz7WSV1Fyx0+lvGz0gbNX6S8lGN
 ie4eMBKADmJz5FD5xp4WNiPbk7K+lCBY0O7Pz7jwCNzyflHNupE28Bu1Ldxwr4QjiR
 dqJAJ9dVvfxlPV3HepIGKJPHBGtzDVKTct6zebdTxXuYRfRQm4NZ2xH0HfEAnS9e84
 cu0hwuyqjmqZZSWUfz8P6v9WL38xQ+4oMTjfEof2OFw9jP8M11uAw0NnDZvnSHCnfQ
 pCyBUO7UKYTq7r82+YjKjOVCyxppNgcbx9kvi2nDjn1Yk7T6Aobo/JY93cQMY3SHRg
 r1OT49LAe2/7w==
Message-ID: <8cf54dbe-46af-44ed-8f52-321074912a15@kernel.org>
Date: Wed, 14 Sep 2022 20:00:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <YyHBF99sC/vQdI3v@debian>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YyHBF99sC/vQdI3v@debian>
X-Spam-Score: -6.8 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/14 19:55, Sudip Mukherjee (Codethink) wrote: > Hi
 All, > > The builds of arm64 allmodconfig with clang have failed to build
 > next-20220914 with the error: My bad, I've fixed this issue in v2: 
 Content analysis details:   (-6.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.6 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oYR4m-007ymr-U7
Subject: Re: [f2fs-dev] build failure of next-20220914 due to 64c11570d64d
 ("f2fs: fix to do sanity check on summary info")
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
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/9/14 19:55, Sudip Mukherjee (Codethink) wrote:
> Hi All,
> 
> The builds of arm64 allmodconfig with clang have failed to build
> next-20220914 with the error:

My bad, I've fixed this issue in v2:

https://lore.kernel.org/linux-f2fs-devel/20220914115151.2994632-1-chao@kernel.org/T/#u

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
