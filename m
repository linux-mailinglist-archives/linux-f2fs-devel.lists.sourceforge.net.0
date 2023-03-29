Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFF46CCF2B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Mar 2023 03:02:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1phKCK-0000Mk-7E;
	Wed, 29 Mar 2023 01:01:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <SRS0=xcMY=7V=goodmis.org=rostedt@kernel.org>)
 id 1phKC9-0000MV-EK for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Mar 2023 01:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SR3RLB7pOaTxHD669azkqAK4Kxn/uwsueBHtteiZ87I=; b=fXjwOK2E9XNHw5Pj9/R0aQqA6c
 cszZd2F4ElT5pfnor3XIuNNmstORGbVxW45vi4lmhwPh/6matg0/h5YUGbscMRBRtBMuZiM30AUyF
 874yDCcANsdLrbCWD+YmveCnbXp69KVq6moKzp7IojaNCsTS64p/Qwdufsl1bTinXmbI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SR3RLB7pOaTxHD669azkqAK4Kxn/uwsueBHtteiZ87I=; b=VllqVE04xb2jW8fyoI5PSM8NBA
 QRgdJ41Q4/JboNDjnmJJUBhJ+sUl3Xas3PaVzWjK1adRyygM5TT1SCrEbP1eZp3cVQjFeOMEuMqhW
 Nq1FWqDb11zkNstNk19L2R7yU8UZpH0dD6UKzHRo164IxHPvDD6r9rOxQZLbLt6IJs08=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1phKC5-007jYw-Vd for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Mar 2023 01:01:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A51A0B81CC0;
 Wed, 29 Mar 2023 01:01:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 758E9C433EF;
 Wed, 29 Mar 2023 01:01:33 +0000 (UTC)
Date: Tue, 28 Mar 2023 21:01:31 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20230328210131.7a057a63@gandalf.local.home>
In-Reply-To: <ZCOH9pc3hBKU3G3Z@google.com>
References: <20230306122549.236561-1-douglas.raillard@arm.com>
 <167821082479.1693.18260840022075703789.git-patchwork-notify@kernel.org>
 <20230328190306.3337b7b0@gandalf.local.home>
 <ZCOH9pc3hBKU3G3Z@google.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -4.8 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue,
 28 Mar 2023 17:36:06 -0700 Jaegeuk Kim <jaegeuk@kernel.org>
 wrote: > > I'm hoping you are not waiting for the merge window to get this
 in. Please > > get it to Linus before rc5 is out, because I plan on adding
 my patch[1] > > which will cause this to fail the build a [...] 
 Content analysis details:   (-4.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
X-Headers-End: 1phKC5-007jYw-Vd
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix f2fs_truncate_partial_nodes ftrace
 event
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
Cc: patchwork-bot+f2fs@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, mhiramat@kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Douglas RAILLARD <douglas.raillard@arm.com>,
 linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, 28 Mar 2023 17:36:06 -0700
Jaegeuk Kim <jaegeuk@kernel.org> wrote:

> > I'm hoping you are not waiting for the merge window to get this in. Please
> > get it to Linus before rc5 is out, because I plan on adding my patch[1]
> > which will cause this to fail the build at rc5.
> > 
> > The above is a fix to bug that causes unwanted results. Please get it into
> > mainline ASAP.  
> 
> Thanks for heads-up. I sent a pull request having the above patch to Linus.
> 
> https://lore.kernel.org/linux-f2fs-devel/ZCOHd4jYn8zUCEZ0@google.com/T/#u

Much appreciated!

-- Steve


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
