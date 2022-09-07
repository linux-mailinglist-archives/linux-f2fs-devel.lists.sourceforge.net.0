Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 220AB5B00B0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Sep 2022 11:39:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oVrX8-0001fK-Lq;
	Wed, 07 Sep 2022 09:39:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1oVrX7-0001fD-CU
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Sep 2022 09:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IQDmIoryeV4Y/gyr/mdBzB4Uyv7fIM69zVtCy4PIvbg=; b=QYO6HHzgid1Kt/djstrENABX7e
 uvDSb01zVraDaZUlXioyKZGr83+pfF4PVMO15TnRdR2fgJt/jgkXGOqAT59MeniE2JthxT7tibHw+
 lLgssqzEA7l4VQssqIx7Zd+0BEodvhkxuK9KGbP16QXJZODBc9mxu282dUYhSA+l5Kn8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IQDmIoryeV4Y/gyr/mdBzB4Uyv7fIM69zVtCy4PIvbg=; b=ITWAZ2Dp6PeiQMRZSRLyO0Zxn5
 nbY3jqmCN5/0btoNg1jyRX9flpUgizYkTaCI+i+kZz9gpUh4KZd7tM9Vttz61YwhR2EjJ7R0zpMN7
 ZxXi7cXRWJvCrvoOlIRRlYPbaETzhUVJZXJL1Ay2VrVJdw0UukB0vtl+rR2sNA151jSs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oVr3f-0000wY-VG for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Sep 2022 09:09:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DC4D4B81BBC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 Sep 2022 09:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20CB2C43140;
 Wed,  7 Sep 2022 09:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662541746;
 bh=626PJkIvKnC04r4L1Ir30UYXOHHnLvLYV03pC1ltMio=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PF0ZWY2OQKuqDZR1fc4EAZXGcnI/fj5AIP+EW4gn9y6nuDGpX5/YiigQL+E2SCeyv
 uhTe0nxraWrL5npEyBgEgeI3g9OaYA3dhZD/GUN20LKgpfL4n7evmTzVSsLOpZXCso
 rrWyBmIAGLE+MfLGmrM4th7cTVY4z7+cbj2vSJokL+I4oF0kGQBz5CZMMp77gYzhmk
 sakrwjsNDuMkqPzFHrjT6p34So7oNACwGNmmn8HDO0TJ2OTyrgO30PLA3ehsr92oPH
 YJ6lwKDGVIsPDStZ2LN8+CO4WehvCPiKFGYl5gBpMFsnqCCIKsEVwQgjWH8jHHNmmO
 9aO+hYpAyq5YA==
Date: Wed, 7 Sep 2022 11:09:00 +0200
From: Christian Brauner <brauner@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20220907090900.ji3ilhyxbftptdma@wittgenstein>
References: <20220827065851.135710-1-ebiggers@kernel.org>
 <20220827065851.135710-3-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220827065851.135710-3-ebiggers@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 26, 2022 at 11:58:45PM -0700, Eric Biggers wrote:
 > From: Eric Biggers <ebiggers@google.com> > > Add support for STATX_DIOALIGN
 to block devices, so that direct I/O > alignment restriction [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oVr3f-0000wY-VG
Subject: Re: [f2fs-dev] [PATCH v5 2/8] vfs: support STATX_DIOALIGN on block
 devices
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 26, 2022 at 11:58:45PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add support for STATX_DIOALIGN to block devices, so that direct I/O
> alignment restrictions are exposed to userspace in a generic way.
> 
> Note that this breaks the tradition of stat operating only on the block
> device node, not the block device itself.  However, it was felt that
> doing this is preferable, in order to make the interface useful and
> avoid needing separate interfaces for regular files and block devices.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---

Looks good to me,
Reviewed-by: Christian Brauner (Microsoft) <brauner@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
