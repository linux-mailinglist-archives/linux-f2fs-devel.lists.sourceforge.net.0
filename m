Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 061466491CC
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Dec 2022 03:15:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4Bsh-0002pO-6q;
	Sun, 11 Dec 2022 02:15:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p4Bsf-0002pI-If
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 02:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b2BMti39H5/+cGss4tCmBMsKNUKmNFUSQpYylrXT4z4=; b=g8bWORETHyEkBM6YhtMIwzmkab
 I5rIm72mGqQlfCSzy6PIyGZ2gULT+ikeEeW5RCOOhgGunmekSWxgJRivdCtkoBxUwbCMu0hHEYhsr
 86INGZmgxMGxrSOyD5B8iWgXR7JuNTn+gmP8HX2o7dyPi2wsOlEpprEDX5d0nWJK8U9Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b2BMti39H5/+cGss4tCmBMsKNUKmNFUSQpYylrXT4z4=; b=I1h5dWTD6+b3hBwjHmJoNpVFKb
 Yqk9Aps+xGzwUBYQ7Z9nHDkK9l64prRnqpA7xSncAiekjsxinuSAQs5d1jeMXWBJDk3ghb3N3y3cq
 KbQLX8UrnmBmmk9TySHOzKpDKqFPptXbaKyfuhTkf0d460owuNEo19jWKJhtGexgmZmU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4Bse-0005Nr-Ud for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 02:15:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B0654B8095A;
 Sun, 11 Dec 2022 02:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9544CC433D2;
 Sun, 11 Dec 2022 02:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670724945;
 bh=ZKf+4o/V97273q0lMwldddaurWkXAWLL/7zTyt41EzU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uNZagrMJDnJ1kCfTcrPOjHiblSXjo2oFYhTHhA27spxGJC3YCnIRe9bM97Qxkzvsk
 CFkxNiNuHi8fFEkSKztq59WL8USUvPWSNM8vJCgEEV7FnHz7m92O9azd73nlDWnFaA
 wQvp3BKK/RS6RqI5/LLMzyQdo++s2eshZ6cAHtCLMdj4FAkWAKAcqaCQNh4OSa/soA
 qN8R4jFwjVHRs7GEf25v0rdp9gXZZv5MG8kNX3f2h19Nh4v8L9vRZi0TcEYWrk3nlL
 7Yy+xXNszKSPfZJKYXzX51Z45FIGDGS5vfhcM6CpBs0VZEigmrsjmzH3Nxqt7O51Wc
 /T3BJM67MItGA==
Message-ID: <04a1cbf0-30ac-11c0-91ec-84f47f9b77f6@kernel.org>
Date: Sun, 11 Dec 2022 10:15:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221124024842.4809-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221124024842.4809-1-frank.li@vivo.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/24 10:48,
 Yangtao Li wrote: > Introduce f2fs_is_readonly()
 and use it to simplify code. > > Signed-off-by: Yangtao Li <frank.li@vivo.com>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p4Bse-0005Nr-Ud
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce f2fs_is_readonly() for
 readability
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

On 2022/11/24 10:48, Yangtao Li wrote:
> Introduce f2fs_is_readonly() and use it to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
