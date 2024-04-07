Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4144989AE3F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Apr 2024 05:19:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rtJ3Y-0003Rg-D2;
	Sun, 07 Apr 2024 03:18:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rtJ3W-0003RL-Ni
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 07 Apr 2024 03:18:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U/YfNSkvuQnVHTfi3qY1kFAU8bNwQF7uMtlObGRKIYk=; b=GcHpVJJ/5M7UJFnCQIHVeCL9qY
 OCOkj6J0yJPjLWcYh5L0BLr7dFDncWWZHmNiKSouvYalgXH01JqX+14vREUm4PTXGCGbFQT04EXWz
 Q/lOE7zeY3aoIBnuUl+xwL/687aSte+RDZ7p69nkuPMnpzBSBPzzB/hosByrR0uzuJfI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U/YfNSkvuQnVHTfi3qY1kFAU8bNwQF7uMtlObGRKIYk=; b=Mucq6U5ZqX8GlNBCxErztkNdFf
 TA+64I6bkCEkCHGYesX6ylUX3r6NLrziMmB6BTTWeRe8YU4GCTYh5wW4rDCdG9S9eVjAv9GP2I4sL
 JW8aFh2NeBAqCWkhX78232m5Tg0t1x2zJJRb4Wl2SrD8KJXvkk8hNDI51g9omfgJvoPA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rtJ3S-0005FL-Of for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 07 Apr 2024 03:18:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BBCF960B67;
 Sun,  7 Apr 2024 03:18:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDD9C433F1;
 Sun,  7 Apr 2024 03:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712459924;
 bh=GfHdM845LVYN0VF6JBM4aQ/V9T9fVQ4Q9Q1cqF4MPfs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CsY5VSIXCwd9RjyKto8s+bj5xSu9koFkrbsW3JSFb9Lgjf4dp2FLBXM51Y6t6WWLO
 DyVJGPTWPh8Ku4mCHD68+a07fcPntCkegZVFlorwFC/IFOZGtcRS7PEAoei/t8TAfA
 OcBtS5Pi0CB1f4B5iqzwLcueBWPSyNIa8ke0B5ZucFcogEdmBjK8kzg3va2V87W3+d
 T6CYH+o/VYHblE13Xz/oQaa4j9O1r2qK8ZltMbPnBCYw+pJTjkj+/I/ynLQuz6wleu
 hBuMNQozMSL3xzvZmTO7T3XSVzYnw1ozReplSMss89Nn9JEeHFy5HXlz4WdDkMBo1j
 l10rbrGpwrmeg==
Message-ID: <d6546291-53af-480f-87d1-6ef06e8fe58e@kernel.org>
Date: Sun, 7 Apr 2024 11:18:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240401151351.248913-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240401151351.248913-1-daeho43@gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/1 23:13, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > In a case writing without fallocate(), we can't
 guarantee it's allocated > in the conventional area for zoned stro [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rtJ3S-0005FL-Of
Subject: Re: [f2fs-dev] [PATCH v7] f2fs: prevent writing without fallocate()
 for pinned files
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

On 2024/4/1 23:13, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> In a case writing without fallocate(), we can't guarantee it's allocated
> in the conventional area for zoned stroage. To make it consistent across
> storage devices, we disallow it regardless of storage device types.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
