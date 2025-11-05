Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F263AC3470C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 05 Nov 2025 09:21:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjuDZkf/2DBk9Rir5Guh9kSS5stsyPKHoqSmle2zlhw=; b=CAHR2J5SqtlmQAKzJN0DnrItud
	RFwxCPfbhF4gm8W/Ix1SxLaVopj/BTBBks4LRXU0lN0RYbZuTPgDAeJSyvjVlvRLbuaD/5GxrnWtp
	mri4v+8pGDTtlNdccElSlCa68RSMnb+4ugWPdWIdKgkVh6qAvN0dtcCbuogFrLMF9XfE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vGYlI-0006Ro-Kc;
	Wed, 05 Nov 2025 08:21:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vGYlH-0006Rg-2W
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 08:20:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nf08htm6ztN2n1Xv1Ebh48/T27OYpL8wuhzSF124eSM=; b=E27byQ6AT7i7EgxbN/CAek0yNN
 57+cIM9RRkrRzT/oxIl+StlAYoPaqyQSqgVbD6f3rnxrx6WCaiDLo5ve3S0LC+1fEHx7q+KpsWk7r
 DlLqUJx8Y6oiMDmpkoqcRyJgQSFolCKIYO+9l0hQqfBVlTemtBitij8d1ArfZfhjFaQI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nf08htm6ztN2n1Xv1Ebh48/T27OYpL8wuhzSF124eSM=; b=C8QZAcQ90EcMkJJM0LZ7UueC2f
 nnsZeJVFJzlot+YPuKNaLQoBN6HcZx/K7psE4wQucVDupPql1YTh7xSn0gZe1RLtMGg6sM5itPQmj
 cCbv2mPqwGSQYIkuVYL5n/FytEaN1YzbVSbaPEpFEGB8hS0p85F7F3jxsVIBvxYvfNLs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vGYlG-0001oC-6Q for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Nov 2025 08:20:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 77A20601FF;
 Wed,  5 Nov 2025 08:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF717C4CEF8;
 Wed,  5 Nov 2025 08:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762330847;
 bh=SU3xXnJ3tFjhlwJLcJ9BD1p3BJovvHZH4JOUp/Jg5RI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Y4UChklmd6dvtVjMtbZ2rKoq+qKtfvtBs3wRFIfsuN3aUFx9DawDKazZvGYPgaFCh
 OOPFEGmptS+lCJHcoCCocaS3YnjjQnRASioiGx1aAunwl3Pe2W5wBKJR430wOXgD4W
 MRQvQStpRh2m0rcvAzmCRJJqXJKMS9G6Lu6rwVW7PuzlXJMkSSidgTZTpUUf9Ntu2I
 zGob/mN20C2YWZH9mGOSBLiCgSs4SmWQrrK0kglOBvBEE2sxwk87Vif4YTMvEbr2aU
 2qGJsCZU6aJn8lqcBdkXEaKdWKpYn5yYpsGvNjloy+vmzbaRuKEwcH/lY2PxoTKtnH
 6c/khjy84Vb0g==
Message-ID: <7e0f34bc-0caf-4d56-a5ba-ef28b947cce8@kernel.org>
Date: Wed, 5 Nov 2025 16:20:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20251104162402.928582-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20251104162402.928582-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/5/25 00:24,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > The recent increase in the number of Segment Summary Area (SSA) entries
 > from 512 to 2048 was an unintentional cha [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vGYlG-0001oC-6Q
Subject: Re: [f2fs-dev] [PATCH] f2fs: revert summary entry count from 2048
 to 512 in 16kb block support
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

On 11/5/25 00:24, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> The recent increase in the number of Segment Summary Area (SSA) entries
> from 512 to 2048 was an unintentional change in logic of 16kb block
> support. This commit corrects the issue.
> 
> To better utilize the space available from the erroneous 2048-entry
> calculation, we are implementing a solution to share the currently
> unused SSA space with neighboring segments. This enhances overall
> SSA utilization without impacting the established 8MB segment size.
> 
> Fixes: d7e9a9037de2 ("f2fs: Support Block Size == Page Size")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
