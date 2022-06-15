Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BE154CF26
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jun 2022 18:58:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1WLP-00005W-NZ; Wed, 15 Jun 2022 16:58:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1o1WLO-00005O-MC
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jun 2022 16:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jRSAOwvNQihCiyvsVl2Uihj3APjezv2P++IcLlfD+Ac=; b=WNziAHfmSCJA0Y14ee14uPTp2J
 ZB/zJJ602kNOkpSfHgfekBX/omQ4At1vxQB1Zvkx5PXGfDOv67rIocL7tu4ErG0C9ZzY6sVmq0v3U
 tfwpNWnJ6xV3XFPdm8NgFIgK4oMwkfSc9rSqdm35vZS71h8pQJfo767qlErdKkd61+q4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jRSAOwvNQihCiyvsVl2Uihj3APjezv2P++IcLlfD+Ac=; b=l5Rrb5jczKCajF669sHtYwfoDo
 kpyrEujt+xbd+8FKE/sYiUNI++i10uAM/gQwaiTdBgTMpvhfUZVQRhm0nvzZgeLWGUTOp0govYzM0
 R0KCmuF8xxsT80oEKbn+5erIpynon/GTR9A2YasqI+bGctTLEDNLR30gDFTqpFmI37TI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o1WLO-002dch-Hm
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jun 2022 16:58:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0D3E8B81FE2;
 Wed, 15 Jun 2022 16:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A1BC3411C;
 Wed, 15 Jun 2022 16:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655312283;
 bh=g3o9o6nLcDiwBJVOXlmEjq793sI8pojjnkX4rShgJyY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lFbkgo0Iugojb0rbMWY3tfWLnq92fXmkTvnz9wob3F7A2yVhthdL97QcOB0YWJpg+
 898NFuZVJNQk1lWYEQ/O86rzrm/6paF9fc8uT1kSsEuKI02MY2JfDNMhSdE1+3meAJ
 lXN7fxrQcL8XD5tpHLrDcrq3XzEntdcsA5XlfI3Vgstgl1pYQ3NGCEfeGqraa2DW6t
 /QCMwW1bu8Mzz5nYCQn5Fvdi36lKhyHMEVQd3e7RS9xRRr/5HzNuAJeqwn3HQSwEug
 DllhaX09j1YsPkkwzkLW1yhRj4o34uwnRzdmzx0EHQqvizRlGuzqhbLAppfP5pVdtn
 1cEs6msiNR6rg==
Date: Wed, 15 Jun 2022 09:58:02 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Bart Van Assche <bvanassche@acm.org>
Message-ID: <YqoPmgP5DbkXpMmh@google.com>
References: <20220614231724.776264-1-bvanassche@acm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220614231724.776264-1-bvanassche@acm.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Thanks, merged. On 06/14, Bart Van Assche wrote: > Hi Jaegeuk,
 > > This patch series fixes one issue reported by Peter Collingbourne and
 two > issues I discovered by reading the zoned block device source code.
 Please [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o1WLO-002dch-Hm
Subject: Re: [f2fs-dev] [PATCH 0/3] Three f2fs patches
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Thanks, merged.

On 06/14, Bart Van Assche wrote:
> Hi Jaegeuk,
> 
> This patch series fixes one issue reported by Peter Collingbourne and two
> issues I discovered by reading the zoned block device source code. Please
> consider these patches for inclusion in the official f2fs-tools repository.
> 
> Thanks,
> 
> Bart.
> 
> Bart Van Assche (3):
>   Fix the struct f2fs_dentry_block size check
>   Fix f2fs_report_zone()
>   Improve compile-time type checking for f2fs_report_zone()
> 
>  include/f2fs_fs.h   |  6 ++++--
>  lib/libf2fs_zoned.c | 21 +++++++++++++--------
>  2 files changed, 17 insertions(+), 10 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
