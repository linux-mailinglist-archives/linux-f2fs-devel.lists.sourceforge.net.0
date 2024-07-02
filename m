Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9C291EF25
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jul 2024 08:39:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sOXAi-0002Eg-I7;
	Tue, 02 Jul 2024 06:39:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sOXAg-0002EY-NE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 06:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DzkMFgQvxpIjTkW4Mw9VosgByJnhFeS1iaLZIhvvvxQ=; b=QeebMXIDV79QbMURnFAPIPIF1B
 KgZXtQqZKSTlkkaM5Lshuh1EiLbr/b1u750TmVm6ctTEda+L7Lhk07k73UrKBNxYxFWOIHmxOgn1+
 xuMYGx2LLSsKG6XPk+lwMT7drFBIGSN+S8qIxGf2LH/2N3rHuuu8CMj+IQiwfoQcLU9U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DzkMFgQvxpIjTkW4Mw9VosgByJnhFeS1iaLZIhvvvxQ=; b=UT4AN2BpgtZfbepWVVmizoev5z
 Hn77eh5FkvTQdg49lT48bs3VkbuYpprImXJ6+4KJrfViSniPcQBTG8hBbPfe23dFWQh0QCMZy1vKj
 kynzDa6jqJDJjQxgCnkzpxemZl8s0/LoQ4K9XjG7AYL5KkH3KRP1kFyJdWauJLGMkrzI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sOXAh-0002ZF-7j for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 06:39:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 22A0261750;
 Tue,  2 Jul 2024 06:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FDCC116B1;
 Tue,  2 Jul 2024 06:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719902356;
 bh=ShBkZ5RBfJLbPaZ98qa+p0dGqHl040XmVhP78ahllGQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lS4Meqr5U/P7yhmCZPmYY6qxdKLF7yqjXeUxbwXXF0QgkYM1WHfV4DWaRpFRA3qvY
 YsvooHHhhpxkEUoZLy3JN5dDBxNckdDXulfFwBSptrDUXglXUlwlE++jSBKvw1+KN4
 6a+tkq2LtO5H/gafPcJ7w1oar7Pgp4Dh9NJB3C7Fi7P0I0A4gV3tPaggTzqzRem3yx
 coWcczjXg2ae6WGDU77ndhKAM/uj4m5gfFOahR0t4odq3dz4bTK+sEk6SLx2KvnQTP
 7/xAASS9WrLPw5cwBHQMTvzWRt5muCtyYdKe7Iw3hy3HBoFbgwTbvyEPXng40Ebvkr
 tn0J5ktjk4XhA==
Message-ID: <f4004929-61eb-46b4-97cf-41376e3e6031@kernel.org>
Date: Tue, 2 Jul 2024 14:39:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20240628013140.2444209-1-shengyong@oppo.com>
 <20240628013140.2444209-9-shengyong@oppo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240628013140.2444209-9-shengyong@oppo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/6/28 9:31, Sheng Yong wrote: > This patch enables
 injecting node block. print_node_footer_info() is > added to show values of
 node footer. > > The meanings of options are: > * node: means node [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sOXAh-0002ZF-7j
Subject: Re: [f2fs-dev] [RFC PATCH v2 08/10] inject.f2fs: add node injection
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/6/28 9:31, Sheng Yong wrote:
> This patch enables injecting node block. print_node_footer_info() is
> added to show values of node footer.
> 
> The meanings of options are:
>   * node: means node is injected.
> 
> The members could be injected in cp contains:
>   * nid: node footer nid
>   * ino: node footer ino
>   * flag: node footer flag
>   * cp_ver: node footer cp_ver
>   * next_blkaddr: node footer next_blkaddr
>   * i_mode: inode i_mode
>   * i_advise: inode i_advise
>   * i_inline: inode i_inline
>   * i_links: inode i_links
>   * i_size: inode i_size
>   * i_blocks: inode i_blocks
>   * i_extra_isize: inode i_extra_isize
>   * i_inode_checksum: inode i_inode_checksum
>   * i_addr: inode i_addr array
>   * i_nid: inode i_nid array
>   * addr: {in}direct node nid/addr array
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
