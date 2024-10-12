Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D91DF99B02D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Oct 2024 04:41:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1szS3u-0000CV-Ps;
	Sat, 12 Oct 2024 02:40:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1szS3u-0000CL-2R
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Oct 2024 02:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NBAXEzYVxJpI+zDs6kx2k0h7aYXI7RZ1sJkmqJpq4Ck=; b=RDo0PXpDoXX5qJE+pgAkXmVj2h
 YitW/ozHB/9eSfir8QpXLvueNtTFaH0tDRf5cWg87XF7OtcihXTWzimUCHKEGvDFbmCazxyRO8ALl
 zDaiuUuv1LbMiWuEiUEFgaaTDoDK8xB6D/qb0iQAp5JMCufMwQla1pdBpma83/qtRTB0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NBAXEzYVxJpI+zDs6kx2k0h7aYXI7RZ1sJkmqJpq4Ck=; b=C31y0N5OckTAS08K5/t2P0fqjS
 LyikYyLO5eGoMc8hIso56KzkQqQXPMAa48LeBzORvP/A3offEzBp8IHVpA/dyDS/m2DLtK13ly/w7
 vFde92Y7JpAnz79hY2GF3kzpsQh3vDoH0JtFFEWmrZY4ymMNjI6LhmcR3ScfyYwW8Gyo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1szS3s-0002vS-P3 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Oct 2024 02:40:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 137405C0409;
 Sat, 12 Oct 2024 02:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B53CC4CEC3;
 Sat, 12 Oct 2024 02:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728700846;
 bh=51zs2tkWqRZZcFAKIWaq/hBNo7OiVYRdIgURsxXA+VE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=uBobiBMBmW9NqfiAfqSxYBmEkJnS0OEq5W3CgyWE0rBZXjEtBJDh4McCgbr1v21Rr
 diF3+/vBEuVK87BRTUci/0daWjogwOZUSNrJg5AAVA2aebVaK26cEAAvuN9aQpl7+h
 LGkobN26niS2UrHOjwGRhANj1sUGbMHXUoVdbx25hPKieUnpp7JfTYWD18XjXO66is
 hUaJ6ckX9/LPCrdMNerMwSNCymF3A4zbKdpMkl/yD5Akp4LXNxX1lnqgxHH3yQ/JcQ
 Ciq2iTsUkV32X4RspqJKOf2BO1r7ORxHYqA3+GVf4BcvImmf2pf4xE/IJreVapCj6e
 NXhmGlWf+fNaQ==
Message-ID: <54325522-b7fa-4629-bc90-ca5e5127ae85@kernel.org>
Date: Sat, 12 Oct 2024 10:40:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20241010192626.1597226-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20241010192626.1597226-1-daeho43@gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/11 3:26, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > F2FS should understand how the device aliasing
 file works and support > deleting the file after use. A device ali [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1szS3s-0002vS-P3
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: introduce device aliasing file
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/10/11 3:26, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> F2FS should understand how the device aliasing file works and support
> deleting the file after use. A device aliasing file can be created by
> mkfs.f2fs tool and it can map the whole device with an extrent, not
> using node blocks. The file space should be pinned and normally used for
> read-only usages.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Chao Yu <chao@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

> ---
> v5: added a ioctl to know whether a file is for device aliasing

IMO, maybe we need to add a common wrapper to export all trivial flags of
f2fs, which can improve scalability, it benefits the case whenever we want
to export new flags.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
