Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 004076530BA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Dec 2022 13:23:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p7y7u-00051n-GI;
	Wed, 21 Dec 2022 12:23:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p7y7m-00051c-K3
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 12:23:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2K+lUn2FmsbGwsAeM6dpLb1N/eZrPny7c/jAJ8HPq4U=; b=ZExBnwbiuX1T+xRgCFYDQjxJwv
 bGYiBrUzxcPjUeJsSbdEUqmrmKthE6L4udRjRb3N6prH7YKsxSjxtPkWUumT1Llx4XPkBD1gkKO5Q
 wowE14vZbAdbyz0vcQcvH6LjJ0mZMNLyXdP7uxzEQCXJgSpckcbJZoPHtMrvhNo7fuIk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2K+lUn2FmsbGwsAeM6dpLb1N/eZrPny7c/jAJ8HPq4U=; b=Jp6ZxfEyD6CFuOWhylDCkZtMz5
 rL3nIQY4s5H+om4U7AtSr/YimzlMF24d+KPEdf3UabNEMtbAJkoE8TOrWRFyK8oDzp+oEwBTA4ElA
 3gWCN6nSwtJqwmBWAYgGERPRq95OJqxtmosgc60a7BXDMxDhxo9TWPyZAUuaX45XP1KI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p7y7g-00082E-DF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 12:23:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 24FADB81B80;
 Wed, 21 Dec 2022 12:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4451BC433D2;
 Wed, 21 Dec 2022 12:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671625372;
 bh=86zn9ID89LU74PHOfOsS5psGybVPMcvEnopWgcvty0s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rdAeIz07QIAUdqOucb9Tgkyle8Obme/kVNIiKdCDGl/65TK4jW/1LmpdygupL0cCi
 yNkq2jbExEJM5aSI7ua6aH4g6hcZfm53rVlhaqMSfVqMdsSntReOLb4R/4LFJz4iWP
 IauiEBDURTJgXrvDWMpLco2Cd/cPi/dUWm3oJzxdD5Bo20MvuzAoa0jO0escHB4CLQ
 WL3OM6Z2wA276X2eEWNOEAM5oI3wa90Er8+wQJ9NOKJlqdfHv++ce7XmcYx2YaUFlN
 ibvxel9A0/zZ9LC3hNpDPRMiYJzHT38awVKKH1p0uDVfkipAzhJ8c65/Bb4wiWNLaf
 lvbeDDfu2uRDw==
Message-ID: <c7beb24c-a4fc-0c03-5007-b9d2cc26ef55@kernel.org>
Date: Wed, 21 Dec 2022 20:22:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
References: <38010b42-afd3-5394-09df-2378b7b5d10f@omp.ru>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <38010b42-afd3-5394-09df-2378b7b5d10f@omp.ru>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/21 1:17,
 Sergey Shtylyov wrote: > In expand_inode_data(), 
 the 'new_size' local variable is initialized to > the result of i_size_read(), 
 however this value isn't ever used, so we > can drop [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
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
X-Headers-End: 1p7y7g-00082E-DF
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
Cc: lvc-patches@linuxtesting.org, lvc-project@linuxtesting.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/12/21 1:17, Sergey Shtylyov wrote:
> In expand_inode_data(), the 'new_size' local variable is initialized to
> the result of i_size_read(), however this value isn't ever used,  so we
> can drop this initializer...
> 
> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
> analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
