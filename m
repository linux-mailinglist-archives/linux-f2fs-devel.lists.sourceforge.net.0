Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EFF4E212A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Mar 2022 08:21:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nWCLY-0005Wd-5W; Mon, 21 Mar 2022 07:20:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nWCLD-0005LI-ET
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Mar 2022 07:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TLFrfpFu1Xkk4dIYL6e8IxXN2L4QE+iiK00JeIt6Gcc=; b=g7kJkoT5nAaufmV/L6L7lzsRJ1
 B8f/REd7Ge/6EQQZMYeh30p6yan7yPdx+0IgzbSdUAtSREGc3JOdtufcPfS72u6bBZplAyABW0hZE
 PUcFaFUk9HPPHAZP/kxYoLoXJgF0Z4njSHDn08x/519ojkaM+aNympBGsUU9av2uTGwk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TLFrfpFu1Xkk4dIYL6e8IxXN2L4QE+iiK00JeIt6Gcc=; b=gL4kRoM3qo8pfF/JPBgLA77tdS
 fHvkN8hmt8jAYfXpPk6FeCvGXA/P9C4er19/5UZOPCxw5s8xH3+Lz/U69ePoKGzIcihdatv6v9kbe
 +Uu5xiReN4aFx3fGTQd645H3/SRggT8MG1t4/X3mrJIMDajfJ/Jz6957fQn0oIecvwss=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nWCLB-0000cr-HJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Mar 2022 07:20:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 27BE160F4F;
 Mon, 21 Mar 2022 07:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD2FC340E8;
 Mon, 21 Mar 2022 07:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647847222;
 bh=X01V1jvi1hwJYC/3cIWgPiSEexz6hipgqZUepTSMngc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JEGoKuzf8BFGfgtf4oT5RcZH71zz2eJ/YWPYKKexodh+XmtXDmym3pMluhIunM6Iq
 xI+sY1O6NPrzfPxn6Cr7vNIb3XKAHiQFHZpHbq6+6lS5rS25qb4+ZnlObIUI6uIHQp
 PzeQUYZSXjhuzSimwJVklQ3drgpVKj5yFFB4zlwUbKXQ8hHV7J+uS/Y3GfxYoguNPx
 kLK8qbUy5wWh97eMmMgyxzu0oJQG+HbcAROcmtPZEYLYjHgo2BLvBG1BYIutfm/z9p
 bAwzmrHJ7bUXcm9tV0Xlqg5ZZ/naeM97/HEio+4ddkvIiCJUulyAyZ7JSV+aW8pBqi
 FPyTVJwB0WqXg==
Message-ID: <3950654e-885a-e298-b553-64a63b7ab1ee@kernel.org>
Date: Mon, 21 Mar 2022 15:20:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20220318191323.4167565-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220318191323.4167565-1-daeho43@gmail.com>
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/19 3:13, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Changed a way of showing values of them to use
 strings. > > Signed-off-by: Daeho Jeong <daehojeong@google.com> Reviewed-by:
 Chao Yu <chao@kernel.org> 
 Content analysis details:   (-6.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nWCLB-0000cr-HJ
Subject: Re: [f2fs-dev] [PATCH] f2fs: make gc_urgent and gc_segment_mode
 sysfs node readable
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

On 2022/3/19 3:13, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Changed a way of showing values of them to use strings.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
