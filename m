Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E784DBBC9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Mar 2022 01:30:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nUe23-0007Ov-BP; Thu, 17 Mar 2022 00:30:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nUe1j-0007OP-4Z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Mar 2022 00:30:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wUtyJlrlzOzEHs3bcvGXfhTEsAgNjuENR9M4EA1bF6M=; b=B4B9Am8oMNsHkf7SQACR98KxrT
 fHqlR6eZHcz2oSpJWZgUeq77DS34hWmUuD8Z5jyEEKKWwlCCrKIKpE08EK3g50MXTEvqZl3VFrs3Q
 GGDdu9gZOZGT1o/L1JK2q+pUjkr0hYIdl8mn+H70stVoARIpOnN08ZtiSTd1pytlNnSo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wUtyJlrlzOzEHs3bcvGXfhTEsAgNjuENR9M4EA1bF6M=; b=RjqqFI1Fn/e3zMhgTbjD32s7e2
 QYqdbnSdQiwNFHsdS1viMk4SU5YusJ6c0JHPrhxvdB+DxOMnrO7szev0qHs/WQejXRcYP1OYGoVtB
 5yho8hEs9/ES9gaAECieLpGYGCm9UBIFEFbg1QwhnzyaELtqacpLgt++V+QbS02JPF9U=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nUe1e-001RfW-0w
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Mar 2022 00:30:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 66500616C0;
 Thu, 17 Mar 2022 00:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B221C340E9;
 Thu, 17 Mar 2022 00:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647476982;
 bh=Hdocd/5ZlPbFYEa5t6OfwSG3tyIiffmqWFq4OlJz3SY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jBP2BpDbQ15WLaUz/QzJoCvZIjel395dOCiKEaIEbWj2MePoYbwilxiPPIPQ72iIj
 hrjr0N16ew2FI1KZYBBBSQOGt09TthdSB54ivZm/gbivL9AsyYElF2R4atSgywtjIu
 4MpPlCXW09KhzKZK0ZzWEWvNWcNkzJOSHuMdnfmnAHeLlnTiSAczQbmHz+wltGCzav
 4mXs+TOiT0tJ809/sQHx/K4N48fmvv27vzYqynTs0WNcqgS8lnLN16x2l+lAnypf2V
 ER2kb/U9dyVtd/BszdIKmpIKTHJXr2SabdepeHlM62n49hjrIYSDdOL5/ygnbiPhbn
 Fl8GLzOHwt9Qg==
Message-ID: <bfce3a4d-b937-de8e-84c9-418f34e3a0e0@kernel.org>
Date: Thu, 17 Mar 2022 08:29:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20220316041414.1738616-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220316041414.1738616-1-daeho43@gmail.com>
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/16 12:14, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > We need a mid level of gc urgent mode to do GC
 forcibly in a period > of given gc_urgent_sleep_time, but not like [...] 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nUe1e-001RfW-0w
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce gc_urgent_mid mode
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/3/16 12:14, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> We need a mid level of gc urgent mode to do GC forcibly in a period
> of given gc_urgent_sleep_time, but not like using greedy GC approach
> and switching to SSR mode such as gc urgent high mode. This can be
> used for more aggressive periodic storage clean up.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
