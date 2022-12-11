Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7CF649214
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Dec 2022 03:53:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4CSk-0002oI-6y;
	Sun, 11 Dec 2022 02:53:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p4CSj-0002oC-2j
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 02:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aqp3COK2fKuUQA8475eqWxXViDyVr1CqSOxAI1kEZMY=; b=LlEx6uJFFvFr/6SvCX/r6t6XdD
 kuzCAU24uufUCP9cArF4npPpNJPCU5qlmXMecEMDvpXnnn67Q9qN0zQx1jrTJazPng0q0h30aiQcy
 BZGfOQZxIRAQJukKaaYgogBfM2FNh9iCjgnjXTBHMWgJNvzZOPSNnToM68ohn37A/JI8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aqp3COK2fKuUQA8475eqWxXViDyVr1CqSOxAI1kEZMY=; b=QvBhNXs8ZiXYweXhyhQ1Nn847I
 6rgG6wPAujGFNwJ3QX7xI0+HAi9QjNzKIrvBtQXy7W0WrjGoTOCxrwYDzc0eWbLvWweY8XYTvlt7a
 IwX7bSAnhqnMG5k2F5Qonr9v7jANrb6plb8UUCO4Opmz+ksvaCPopGRiqdFEhtICyDgM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4CSf-00DSct-My for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 02:53:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8EC53CE09F1;
 Sun, 11 Dec 2022 02:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C4DC433D2;
 Sun, 11 Dec 2022 02:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670727173;
 bh=nisRq5p9DLzuzSIWJsSZIki1q8UKQxwkg+jqQ5Nd/z4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KBrkA6E0LlP7rdNpvJYHcbH78mclYWwZnnWXVPxvPK2SN8d+yucpszYOSymv9ckJw
 wd5jd40VkSTbYl/Jm1WXLKeX0xb23ZtCH0wKn+BUCUq7bMRFpTt3u8i12Bq8om49lW
 W0JvNzZ1oDLjSHhQp41EkchugLTdtwyotUci5Yifx1/+TWI02mUkvTHypWMSWsiJ/8
 qYozze92W5noFHYkIdvqqQ0gO9wKS7t4BlDwk7Br3H8wu8fe5rDdei24+5+sZCvOvY
 PzHGKY7+yv3v7dWQwQhzttzigKVstDD5Lud/k4+GO0sobzi/BbKxXdb9XhWsNUS2Ja
 Bovk4VXNIR3RA==
Message-ID: <6c258bab-84fd-6515-6af1-d9fced65c34f@kernel.org>
Date: Sun, 11 Dec 2022 10:52:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20221207134217.2325189-1-colin.i.king@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221207134217.2325189-1-colin.i.king@gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/7 21:42,
 Colin Ian King wrote: > There is a spelling
 mistake in a label name. Fix it. > > Signed-off-by: Colin Ian King
 <colin.i.king@gmail.com>
 Reviewed-by: Chao Yu <chao@kernel.org> Thanks, 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p4CSf-00DSct-My
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix spelling mistake in label:
 free_bio_enrty_cache -> free_bio_entry_cache
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/12/7 21:42, Colin Ian King wrote:
> There is a spelling mistake in a label name. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
