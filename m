Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2D16D3B70
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Apr 2023 03:22:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pj8to-00006Y-TT;
	Mon, 03 Apr 2023 01:22:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pj8tn-00006R-Mk
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 01:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vq3meEfVALEsBBZwbhHHOz4f21+3fAlMxYKkExq8F4o=; b=SDhzuiAPQABK+sUv67ow6u5rrM
 0fgZbBJsa1+A8OeHgLQ7lzHCDpFPNqqfC0SS7OGnrqYdOD6lff9khve3POsNOuskDZVE9Ha784AUG
 ejf6NIkvadv1TOuohDSwb/jREeWLixnBg0AFtRvYidlWuETVv9VKFQiNvzKQBQUFHxD8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vq3meEfVALEsBBZwbhHHOz4f21+3fAlMxYKkExq8F4o=; b=JEthTADvEasxxchKNqQz9RqTwX
 G9ae9TqZZptdUWhAJsDmOWOPT6bO661ODPDJtadsMt0BqCwKfe0mb8GfK5aSfqmdM81raPAunE7ID
 rE2TtEWXIAqNg2U7ts8uJEDRdt9ossg/iZeQchGJCdsba33yham+pXQPg+NxffbbN0JU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pj8tm-00DGHT-No for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 01:22:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 185AA61303;
 Mon,  3 Apr 2023 01:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B443C433EF;
 Mon,  3 Apr 2023 01:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680484929;
 bh=vq3meEfVALEsBBZwbhHHOz4f21+3fAlMxYKkExq8F4o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=d+mlQC511tiET5KQC6WLBW+REjP2kps5koa6Mx6XqUtzJN3Cou+TdGNfkuGTgtbWJ
 q7OaXM0brsN/McY+OrLjyV58lT6HOyUCe5rPdDwWSL8r/19U0D0K/g2MUYXW1H2ESv
 uGiltclUTvvPQOdaDWzP0VhAaJ+SOd9nlSfIfSLYRk44fJVnZfjR3LThtqh3JpdIVE
 6LhygwBwn2cbSm1YpCPuIihFUsUpJJqMeJWQObqJ9uNrkapC6GpeyBWTezh/7huer6
 PvCs+Sxq+/bL28ide2XVlLj3D5R4YGuIg9S9NGgIp7+ppf9tc6YyZPZ/ubqQZHbVQy
 /L/l8Zm+qcWDg==
Message-ID: <d1bbd9b1-9fcb-526b-30b1-efa4b1b92c4c@kernel.org>
Date: Mon, 3 Apr 2023 09:22:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
To: Yangtao Li <frank.li@vivo.com>
References: <cc346bd6-16bb-a38d-d0d8-ec7e928b27e9@kernel.org>
 <20230331185505.58726-1-frank.li@vivo.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230331185505.58726-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/1 2:55, Yangtao Li wrote: >> I guess we can cover
 all trylock w/ FAULT_LOCK_OP type fault injection, Oops, there is a typo,
 s/FAULT_LOCK_OP/FAULT_LOCK. I meant introducing FAULT_LOCK to cover all below
 functions, and keep FAULT_LOCK_OP as it is to just cover f2fs_trylock_op...
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pj8tm-00DGHT-No
Subject: Re: [f2fs-dev] f2fs: support fault injection for
 f2fs_down_write_trylock()
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

On 2023/4/1 2:55, Yangtao Li wrote:
>> I guess we can cover all trylock w/ FAULT_LOCK_OP type fault injection,

Oops, there is a typo, s/FAULT_LOCK_OP/FAULT_LOCK.

I meant introducing FAULT_LOCK to cover all below functions, and keep
FAULT_LOCK_OP as it is to just cover f2fs_trylock_op...

- inode_trylock
- down_read_trylock
- down_write_trylock
- mutex_trylock
- sb_start_write_trylock
- trylock_page

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
