Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04956A4B66F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Mar 2025 04:17:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1towJ9-0007H8-MU;
	Mon, 03 Mar 2025 03:17:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1towJ9-0007H2-2Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 03:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hYQRF10o1rlyK26JQAiawb4sms3BjNFBmdhCrqLwu9I=; b=fnDLJ8k2Iya978SwXTGmynaNtE
 MdJc+uplO+cm/kWm7OQkrNVhMjz8nl+8QPc/TUUjzTK0BVVnUnzl2OxPvaQV0Ss2b5S2O6c/Mg42e
 js3s21Tqyx56PDnb518PuP10PRq4VLZY5Rj4/BuBsJD1RKDcvxj9sNvg+5gzlHBwG0xI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hYQRF10o1rlyK26JQAiawb4sms3BjNFBmdhCrqLwu9I=; b=IjIsLylQQ7MwYcqULy+M9uxd6K
 WFGXinUo1/SGmAKl4krSjIUYHzmQnjICw7gAuCQXMc58BuMGrVL6rv7QyW9DBteHtWk/1VoXXvBml
 FyDzF0tAYrwZrVwleQP6T+CdUWBBzl03Yl3X3rBa4VK6QporPwMRzN3Vy1OsPAtbEOwc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1towJ2-0004yt-T2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Mar 2025 03:17:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A12775C4236;
 Mon,  3 Mar 2025 03:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C0AC4CED6;
 Mon,  3 Mar 2025 03:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740971834;
 bh=xU5JJtuoZOpfWjy3eZBFySpzJHmspTF01WDRNyO7QoM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Z8wh3aTQTZE3YLeJMJ3rsk+Y9ooPr5UGHrcsdC3XTaMS2W3mPzSkK+r+K2q0zkO2N
 l0JXGgiM6nLCwnZGaQZozhBHnhThtKRTbw4mZJhQRE6fh3vF14ES1TYudE8oqz98gn
 qu6FQKAqJHJ9abZgB6AQHFAFAudTt5D/Ap/uLN5ghbumNYALzOAl8S0SKUgk3aQWYF
 GAcJ6RfCkULS3m22jnOEHRRlxBrnSIdtleg8LPQhvhmbnmRjmRvr9EbKA2IuuOD8XH
 7pOWGNI/tRtixEwBCN6NxQXmHXJhE8XYUQZ6YtbczOuAG17EPk7Ilp7eMSxJLmG78D
 S2X7HtGDaTgrQ==
Message-ID: <f5e744d2-02b1-4f6c-9467-b3925368b9a7@kernel.org>
Date: Mon, 3 Mar 2025 11:17:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250228184752.1668252-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20250228184752.1668252-1-daeho43@gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/1/25 02:47,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > add ftruncate command to do file truncate. > > Signed-off-by: Daeho Jeong
 <daehojeong@google.com> Reviewed-by: Chao Yu <chao@kernel.org> 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1towJ2-0004yt-T2
Subject: Re: [f2fs-dev] [PATCH v2] f2fs-tools: add ftruncate command in
 f2fs_io
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/1/25 02:47, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> add ftruncate command to do file truncate.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
