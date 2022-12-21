Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4B16530DA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Dec 2022 13:34:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p7yIl-0005C9-Tc;
	Wed, 21 Dec 2022 12:34:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p7yIk-0005C2-WD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 12:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ihaKuc9L1/NDMSiOp8AopQQLQt9u3ZLYi0S2+JPRHFw=; b=Iiy1ZNkUSJjxit5djSCLHaJZEw
 Qp2dVwwl7jtg/DwcuHmkqf3FeypMtA+siVs5KH35MRc088rjNe+jg7nNeCiOdQRfvTmV+Th0vVUMC
 JvN/ss1KWV8N9MFiav1nwvszxqMXeM8A7JgBoSG2PSLawLjVv66pq5hws3EGCATXVtBU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ihaKuc9L1/NDMSiOp8AopQQLQt9u3ZLYi0S2+JPRHFw=; b=EFz2j9NzY3mlbmK1H2Ls0DSOFm
 a3urBQvOdW46gubNZtb1dINV+MyWGT3fBAeL7T6NZ4jSTP/9ZOw+D2HiF7kAYw5BbsRV3uROgVpt2
 PWfAYA36Ye1qgEeYurRbuHtT/PWgjVLo0vMfJ1auZE0CJLNvslLtoJd1Nr+rNr70UMq8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p7yIk-0008W7-91 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 12:34:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0C859B81B6A;
 Wed, 21 Dec 2022 12:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0A2C433D2;
 Wed, 21 Dec 2022 12:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671626058;
 bh=S/O6ux2v6aPfNcNVslK998HVTz/7pVCS2/8Ewlu4WHM=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=VMuwgOYr4JUNQEiz784JqTKrMgf9DQlsvwACaQi4uMCVO9t8lZFQYSCcxDiUu7YkI
 lWNfB+2J/FydC9dPf+X2wMNcMgfdaTmeoUEnsqkzDlTFjqkxIlEAmsREXuHT9aL83K
 YcatceSjgBBmaN7ibI0DnrAN9eXS8miXOos+JxBnQ6LWCNFyfCG3I/kl34cj1Uvfl3
 sc8cP2FyyPbnQAoenb/B9HK/nIl5ijTlrFwnBqUd3YEUXa6zv2YcN7IaASBfiEiUnx
 vwD7EURTyPbKmsxWZZ5CQLKwnKFvtcBmCcy8RnythY1FoUtKkvw0q4cL6v6wD+/Bcm
 0E9eXivW0h3DA==
Message-ID: <c532ee2b-66bb-9227-ebd7-a070599fe3ae@kernel.org>
Date: Wed, 21 Dec 2022 20:34:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, s.shtylyov@omp.ru
References: <20221221033021.36615-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221221033021.36615-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all, On 2022/12/21 11:30, Yangtao Li wrote: > Hi Sergey, 
 > >> In expand_inode_data(), the 'new_size' local variable is initialized
 to >> the result of i_size_read(), however this value isn't ever used, so
 [...] Content analysis details:   (-7.9 points, 6.0 required)
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p7yIk-0008W7-91
Subject: Re: [f2fs-dev] [PATCH REPOST] f2fs: file: drop useless initializer
 in expand_inode_data()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi all,

On 2022/12/21 11:30, Yangtao Li wrote:
> Hi Sergey,
> 
>> In expand_inode_data(), the 'new_size' local variable is initialized to
>> the result of i_size_read(), however this value isn't ever used,  so we
>> can drop this initializer...
>>
>> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
>> analysis tool.
>>
>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>
>> ---
>> This patch is against the 'dev' branch of Jaegeuk Kim's F2FS repo...
>> Reposting with ISP RAS mailing lists CC'ed now...
> 
> Why do you repeatedly send a patch that cannot be applied, and this does not have

The format is weired, but still I can apply this into my git repo...

> a CC on linux-kernel.vger.kernel.org.

I guess linux-kernel.vger.kernel.org is not mandatory, feel free
to Cc this mailing list.

Thanks,

> 
> Otherwise, code modification looks good to me.
> 
> Thx,
> Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
