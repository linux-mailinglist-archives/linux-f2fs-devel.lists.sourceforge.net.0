Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F283ADDB26
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 20:10:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1eN0k4B5JLKczn9jjYY8GOJWTj/qOjBoJ9mVob6bxu4=; b=XdDqNWzOPRe0j/BnOECglllu1U
	A5M9ACMKiktgyvLZMiG8a2VQW88Weelh78Ct9AD+Old6i09T8j5CQu6/owEEvT4L4V3N0hGXgAnck
	UhauBoGLTwO1D1Houb6/nJY6GyxaDhHiZvidJJ0ynEEw6SNmxjNpnI5Ke65AxxKompeE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRakk-0003SK-5H;
	Tue, 17 Jun 2025 18:09:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mcgrof@kernel.org>) id 1uRakj-0003SE-Hj
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 18:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i95oRY/Z/HeBd9r0pmEU13s4hQggKGI92l7ynXFpsZs=; b=Ai39ZpkzWVSld9BInkiHiAqNqq
 xgBogEcXuuOJxwDRNaCRVqZoorv421DB75oau6Sww5y0K2KU1Cf/hLd45RZt9W9MRXbbAmkRbL5iu
 Ts/FOiayGGTReMUpQYrLy3rT6gnhV1jKaqmLvBCVRsP53sxaThupAbfBnjvdzmqVHJcE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i95oRY/Z/HeBd9r0pmEU13s4hQggKGI92l7ynXFpsZs=; b=KZZG7qPdLWifL9uinMQMwMQOT3
 /OdPzuzzP1uUrlLabwDwJbn/Hay6Y1y93jnn5vU/gtWbkC3VpVNTXE7OeLL+7T9Z1NZlGLifPMhjO
 NF3+ky3PkNustx5uvIm34F1aCSMZjFxuaMIIw2iJr3+FKtcim6N5p8vIqQ/Ums1JP6FQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRakj-0007TU-6j for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jun 2025 18:09:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 831EF614BC;
 Tue, 17 Jun 2025 18:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3D2C4CEE7;
 Tue, 17 Jun 2025 18:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750183778;
 bh=nZYqAWDytvS+0LQwGh1wwaatc6b3/h7nEo7rW1y5/iU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OvvRYre+qAMBvIB3I/O8ihgQB5ioRWRKIZVJSZVwo65GjQNK3HqY8Pb85KjyeYFgr
 Uu9D7DvekBxJyuDDg5tZiPf6JwoLZWjaWezBomvzLaEnlKUYxjjyOVFYlj3MFon/u5
 g5J1QYxYulI269Y+E0J8h/rR0De81luyiyxDAfYVj8uRgC/dFJZF3HrSFBPd925Bd4
 FIZqf+be2HsYlN0gOq8P7YQ3sT0QUM8jpqLYMgX1XROfmcTp6CVTlKiv5yj5tQ3A/7
 c3sOGkOyWvuBi8uxUyEhglriK93/3R46C7SiUdMwE7czmAgLzMD2QMFuCfptWeNHqJ
 tndxwNWOUi7fw==
Date: Tue, 17 Jun 2025 11:09:37 -0700
To: Swarna Prabhu <sw.prabhu6@gmail.com>
Message-ID: <aFGvYWE19kztdhQy@bombadil.infradead.org>
References: <20250617174047.1511951-1-s.prabhu@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250617174047.1511951-1-s.prabhu@samsung.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 17, 2025 at 05:40:47PM +0000,
 Swarna Prabhu wrote:
 > This patch fixes minor typos in comments in f2fs. > > Signed-off-by: Swarna
 Prabhu <s.prabhu@samsung.com> Reviewed-by: Luis Chamberlain
 <mcgrof@kernel.org>
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uRakj-0007TU-6j
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix the typos in comments
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
From: Luis Chamberlain via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Luis Chamberlain <mcgrof@kernel.org>
Cc: gost.dev@samsung.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Swarna Prabhu <s.prabhu@samsung.com>,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 17, 2025 at 05:40:47PM +0000, Swarna Prabhu wrote:
> This patch fixes minor typos in comments in f2fs.
> 
> Signed-off-by: Swarna Prabhu <s.prabhu@samsung.com>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
