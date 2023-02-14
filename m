Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E70D695615
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Feb 2023 02:47:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pRkPr-0004zP-Nj;
	Tue, 14 Feb 2023 01:47:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pRkPq-0004zI-JL
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 01:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uXFNZPkoKkW+cQJtlcWqZy5zCIq5cdigcWjavtxPyyM=; b=B8eHAP9dDqt3R4dp6EybB4U3o9
 ZwrX6WcbzbAtjdG0oApcgQdfgu32i7VWfvG9weXLekV4I8SoZ0XMcmsYceuVDOUmndKEIB99nqmJN
 o/a/qFS9uFjEIDzyPoA5m+9xOaRsbzNgmH99gulLL3ddFa28Ze20L2sQGhneLxrb3mAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uXFNZPkoKkW+cQJtlcWqZy5zCIq5cdigcWjavtxPyyM=; b=SRyym4+l7rdQUKifuBjoLfKCBP
 WGbTJzCKocMJ9Td7/s6Va9wVYOHu28UX/MY43YTNUAsLNmtY31vYRQv8qXuN1XQYDg5lOuG5g4VTi
 vTsG6e5/0ln/l/bBPvDaNbRQTIQ0rhocKXdKmx3QBCMGMUwjxMZmhfy2EK1oQstErhnc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pRkPp-0005B9-5m for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 01:47:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A1D1CB81A3C;
 Tue, 14 Feb 2023 01:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C9DC433EF;
 Tue, 14 Feb 2023 01:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676339242;
 bh=rZbOO6fi0qlXqZxxlVYOUHBpebE6n/8vf1D0V3jhIio=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NxGQLaDQsJz5BGuW145xpgLE6yRpq0gVjihbwsIaQ3GsdlWssEwzEMgWi5VwDO7Jh
 L3P1q9lZfdzfsGOl4g+s7gnWWcImHUjv1RiLnouPs2eU1KOKZgJPGDktqPJ/EoGkqQ
 5ygtYf9pNC1LTELSgKWe8iAd9dnctp4g/HiT6X22az1rX0NXCgjV0Gy4h+J+8DI4MK
 MlOgPDkMCNnSNqglHl3xSS7WBAtklYOWXfoWC2RXYoS323RxntwEYVCsHVonecZZkj
 EAIqTvsrIhEUwQlv0II5TDx2Zioz4Wn4C/l5rTQOqsCx0WMtlixsxNN6pDykvO/0cO
 c+koKE99z5HjA==
Message-ID: <8de864c2-c055-584b-f3d2-9240d0115785@kernel.org>
Date: Tue, 14 Feb 2023 09:47:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20230209181819.2333522-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230209181819.2333522-1-daeho43@gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/2/10 2:18, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > To fix a race condition between atomic write
 aborts, 
 I use the inode > lock and make COW inode to be re-usable tho [...] 
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
X-Headers-End: 1pRkPp-0005B9-5m
Subject: Re: [f2fs-dev] [PATCH] f2fs: synchronize atomic write aborts
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
Cc: Daeho Jeong <daehojeong@google.com>,
 syzbot+823000d23b3400619f7c@syzkaller.appspotmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/2/10 2:18, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> To fix a race condition between atomic write aborts, I use the inode
> lock and make COW inode to be re-usable thoroughout the whole
> atomic file inode lifetime.
> 
> Reported-by: syzbot+823000d23b3400619f7c@syzkaller.appspotmail.com
> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
