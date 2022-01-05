Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAEC485826
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Jan 2022 19:25:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n5Ayn-0007IB-Nr; Wed, 05 Jan 2022 18:25:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1n5Aym-0007I5-3y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Jan 2022 18:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ni67H81lWOvFjfZrxSLPKXtVwmqdcadcfvPcwzWrUlc=; b=N9NoZNkL52c8fThv2t7LwhZRns
 yftly2MPdvW1ICuDFUDnhP+DIx2nDweYxHZdfJQBnbAn1VpfmdOgkOXj6G7KojzOS1T7nngvQbtrR
 kwLE5oSgVwaa8hQeHcGr6hDQLHmQ2f+puI7r3PlBrUbU0oYeiGiJDp6hMYd9h4aYsbmg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ni67H81lWOvFjfZrxSLPKXtVwmqdcadcfvPcwzWrUlc=; b=hpmY9OU6Bhrd/w03QP6JGrAzwO
 7XD1Wt/CCfI7pD+6bKoMIVq1lrVjHxzylVa0/spDhmCx1s97wc4mqOFQXw5TFYdizEMXkoJCds3PJ
 iw6+Wpf9m1nI431WNrBna9H8TD4Clm4I2lpQJzX65ZYTajjQAbojVkd3uROJF7dO4wpQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n5Ayl-00043S-Ap
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Jan 2022 18:25:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EF8FD61859
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  5 Jan 2022 18:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4D4C36AE0;
 Wed,  5 Jan 2022 18:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641407137;
 bh=UhbgZ6yAolUgL+vJbB+aKnkVpV4hja3dxMxdnicNqzM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SpE/9Xi+1rs7/qKEzh/VWq+4uaeG0sElXWOZXpqgJW+HcUwmXgtR0WGPjkyubpz58
 cZuR2RSuNS6TgAdSO6EpjYfCGztsf+swifgmbQoYkqSYmzP2B8maLOz3fWyE/HQ/lv
 gOyOQ+0uLm/7x/hs643uXKw/AW3GOrFmvyY7z8F00taVZ/ojv40XNvyswRnkZnyszA
 oPvVl4HpszCtk+kDVp1Gv9Zm9xmWkoL/BxkFnl3jey9+BMqmum5sO2/uipHm1i3bjK
 h5+rjwPNAC42lYbr+Dy1JMBX3NGXp/QyqlkFOh2yZqtIEXjoMePdRzw56Sd/gHLY1G
 29K3sO4qRM6cQ==
Date: Wed, 5 Jan 2022 10:25:35 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YdXin0epwgAX295L@google.com>
References: <20220104212419.1879225-1-jaegeuk@kernel.org>
 <20220104212419.1879225-3-jaegeuk@kernel.org>
 <a2036978-81f9-fad4-90ce-15dadf048693@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a2036978-81f9-fad4-90ce-15dadf048693@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/05, Chao Yu wrote: > On 2022/1/5 5:24,
 Jaegeuk Kim wrote:
 > > DIO preallocates physical blocks before writing data, but if an error
 occurrs > > or power-cut happens, we can see block contents fr [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1n5Ayl-00043S-Ap
Subject: Re: [f2fs-dev] [PATCH 3/6] f2fs: do not expose unwritten blocks to
 user by DIO
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/05, Chao Yu wrote:
> On 2022/1/5 5:24, Jaegeuk Kim wrote:
> > DIO preallocates physical blocks before writing data, but if an error occurrs
> > or power-cut happens, we can see block contents from the disk. This patch tries
> > to fix it by 1) turning to buffered writes for DIO into holes, 2) truncating
> > unwritten blocks from error or power-cut.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> 
> Reviewed-by: Chao Yu <chao@kernel.org>

Thank you for the review tho, I can't ruin the one month git history. Please
chime in if there's any bug in the patch.

> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
