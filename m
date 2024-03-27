Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B56E388D720
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Mar 2024 08:20:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rpNaC-00034G-UX;
	Wed, 27 Mar 2024 07:20:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rpNaB-000343-0u
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Mar 2024 07:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BsP/AgJ8xZj70oaQVowzb7zW+rcDU7+yke6Os385SWY=; b=Sxq2/Osq4pqWeI+kKXdkOvElni
 W5a648NW9BOE5TcNDThCnaV8bWIjg0EaLP0mNo91PkoeVgY1NQFaRwvTOAJgIBcg/Kw9pWf8t0hY9
 TNjK2gA1ZBE20Kj0lxn6lK9sy2CFXGtadDMSGpt/oIihGvIAJ+hOfMAxvBNvxG+hpWxk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BsP/AgJ8xZj70oaQVowzb7zW+rcDU7+yke6Os385SWY=; b=PFaWx7q1qTLaXJvBALIUIZOSLR
 Mrm2Prt8jtN2ug9nCXqogcRapaJ9dmU2YkFKrMaXBeFUYSrjyiDv/yr064GBi7xBwi0JsRP4RBMyy
 hbQmynI4vU69NfcY2Wiowv69vm2W/2LwUGZn5wKl410NpKsAkzW5ye63rU8d2c5Vvdy0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rpNaA-0002JL-N8 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Mar 2024 07:20:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5A893CE2562;
 Wed, 27 Mar 2024 07:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B6DC433C7;
 Wed, 27 Mar 2024 07:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711524010;
 bh=YLnhyl+DuTiGSNHL/SLgokjNx6Ju9/zKm+uMo/gE9RM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=YaSNWP5CCFH1JwbCTZ+uh3b0Wq4BdrxQRi7T7OJp3UXPP8miOZFHtsXVwG8m7VmFP
 +knUE0GJOZnfga9Kvv0XCjzfsNlQx1GLYl3eLZfTM2Bjw6+hKYGb2dgqYFhKALDRYj
 J7oP9B2eYYWAcN3iNTFf9SiLYmlRa3M39B0EJeoZgCf3GxYCIvRgcEbQ3qnnUE4xUj
 tditCqatCga/DphZr/GbFPx/RapY+pJpEvKr6JT9V2o0PIIJ4r9qxlIwsTOtqVCllX
 fsrQzxj4TpTcKUKKIqrO9X5X42t39WcFV7h0lqcuBP4EF0MJlddKgqN8MhhOjRhE7W
 mEC9FzBBF+hMQ==
Message-ID: <58725332-bced-4af8-948a-9e9f5f10fb98@kernel.org>
Date: Wed, 27 Mar 2024 15:20:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yunlei He <heyunlei@oppo.com>, linux-f2fs-devel@lists.sourceforge.net,
 jaegeuk@kernel.org
References: <20240326061043.1348968-1-heyunlei@oppo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240326061043.1348968-1-heyunlei@oppo.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/26 14:10, Yunlei He wrote: > In f2fs_remount,
 SB_INLINECRYPT
 flag will be clear and re-set. > If create new file or open file during this
 gap, these files > will not use inlinecrypt. Worse c [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rpNaA-0002JL-N8
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove clear SB_INLINECRYPT flag in
 default_options
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

On 2024/3/26 14:10, Yunlei He wrote:
> In f2fs_remount, SB_INLINECRYPT flag will be clear and re-set.
> If create new file or open file during this gap, these files
> will not use inlinecrypt. Worse case, it may lead to data
> corruption if wrappedkey_v0 is enable.
> 
> Thread A:                               Thread B:
> 
> -f2fs_remount				-f2fs_file_open or f2fs_new_inode
>    -default_options
> 	<- clear SB_INLINECRYPT flag
> 
>                                            -fscrypt_select_encryption_impl
> 
>    -parse_options
> 	<- set SB_INLINECRYPT again
> 
> Signed-off-by: Yunlei He <heyunlei@oppo.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
