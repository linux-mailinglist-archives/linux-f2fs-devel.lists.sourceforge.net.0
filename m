Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EB54E5704
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Mar 2022 18:00:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nX4Dg-0008Vm-LR; Wed, 23 Mar 2022 17:00:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nX4Df-0008VY-Kk
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 17:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IiwvHkfbqnF6OZgqOqPFcJ4RnXVjY6gMGYz96LH8K8c=; b=XOk+oa1869bSKO+fCeLg7BQT3g
 AK27BLZMF4XVtSXaK3FbVeYygIn9+T5vPUZCbLWnJsT+iJQtUSFd1SDxS8SiIjkItugWO/WHCPMqg
 g/Ev0YAUGMZ8R93/9UeT54sMVl6PTtHLwGXlOEHU2hjzjMkbuP5ySGJwXG9C2EC4JgxA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IiwvHkfbqnF6OZgqOqPFcJ4RnXVjY6gMGYz96LH8K8c=; b=coQd8C9WSUI1LBzdQ6kCBL0qWw
 1PxHdZE2u0UaD59VCB4z4qPQcczvRspOafUnvcIawdMAr5SHSoerKC7oW9I8+amxjkfU5EdZYGmho
 WgiqAbo5H+qRVga/le675ZBxHE3Nc9FPGf9bwpc4eBqhQxCAv+8i6K5RwPwTqEs3TRuI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nX4LZ-0007PT-EU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 17:00:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F088AB81FB4;
 Wed, 23 Mar 2022 17:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746BAC340E8;
 Wed, 23 Mar 2022 17:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648054823;
 bh=YAquSOcRUC+gYTS9VpyVU22HjPExypfghULoDcZfSf8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FZ9BRlBYbOHGBfM59Egi3Xf3r07BBeufdqhF6ZXakOodWBx8No7zKF6ajnXpXPb+G
 GhBbtiLY7sn4IL33+sUM9AOZQ6GZHbEXiT/24pZqqDd2VUycbVb0zeNB79y5QNMpZ1
 ZZd7pzNoFkkOPAT979o8svtxXwi7SweVyMmhl58q1X8FQFYXbH+AvDcuZQfjMICD6z
 GbbPCr+CeXO9ygj+sJgvdMtGt8Lt9xr0cIg1kvwducCXHjfL1r3rxmKc4SuUlJvcd5
 Ra3yFlyVBsxatVObHU2M2cLwjpLZvYbVJ0F0lsM/4aDVgyjSFoYXSl5/5vnqmratmF
 SZLJ71lhhbfTw==
Date: Wed, 23 Mar 2022 10:00:21 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YjtSJaG6KQ3zvzUs@google.com>
References: <YjjihIZuvZpUjaSs@google.com>
 <CAHk-=wgsmvoJFKFWxQ2orEVUOWH1agk9iUNZ=-DFh5OXZL=Ldw@mail.gmail.com>
 <YjrNRpbo/i3tgbAA@infradead.org> <YjtPUec8jiqUXGuf@google.com>
 <YjtPq1V7hbxc93aj@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YjtPq1V7hbxc93aj@infradead.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/23, Christoph Hellwig wrote: > On Wed, Mar 23, 2022
 at 09:48:17AM -0700, Jaegeuk Kim wrote: > > Christoph, I proposed, > > > >
 "I've been waiting for a generic solution as suggested here. Until [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nX4LZ-0007PT-EU
Subject: Re: [f2fs-dev] [GIT PULL] f2fs for 5.18
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
Cc: Peter Zijlstra <peterz@infradead.org>, Waiman Long <longman@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/23, Christoph Hellwig wrote:
> On Wed, Mar 23, 2022 at 09:48:17AM -0700, Jaegeuk Kim wrote:
> > Christoph, I proposed,
> > 
> > "I've been waiting for a generic solution as suggested here. Until then, I'd like
> > to keep this in f2fs *only* in order to ship the fix in products. Once there's
> > a right fix, let me drop or revise this patch again."
> > 
> > https://lore.kernel.org/linux-f2fs-devel/YhZzV11+BlgI1PBd@google.com/
> 
> That counts as ignoring the advice to me.

My apologies that you felt like that. Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
