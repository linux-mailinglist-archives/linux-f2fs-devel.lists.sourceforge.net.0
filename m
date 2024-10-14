Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 007EE99D4FC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Oct 2024 18:52:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t0OIV-0007Yi-NV;
	Mon, 14 Oct 2024 16:51:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1t0OIT-0007Ya-PL
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Oct 2024 16:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dTGSFHONK2iPAE5RV00F6PtrW1LfwcavZrqLw00C+jA=; b=bt9cKvZMAvEZoYD/e1oP/nTTVK
 wtcZfhF9LFH4J0tIeWWYmWuDlkLsWcvoSOLguGgoVcBnLiqxHgx0X1UZy9wbaCCa+scyygjIz22v+
 L46OLMqRG8uQ3c9ZtjxlGKTCuXzxHuaPbAT+f4fK+bs9XoNncTiplrODEm7uzErtSudg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dTGSFHONK2iPAE5RV00F6PtrW1LfwcavZrqLw00C+jA=; b=c
 eQdDo90t0Xq1mX+JuxA2MPZApy5u85X17/5o/DtOX4TG05xs/ThN0+SThdPBPw1u6lrExnzLQe92T
 ftHGjrF02nYcwk2vnqN9ZkXUuvtAYLCIdC9tK1cmg9u/ZJ5FYk8JLru5sWZwU3kaJWRZcB7fvphOy
 SLK3eWvG9YvyrlnE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t0OIT-0001OD-Sd for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Oct 2024 16:51:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 229015C58CD;
 Mon, 14 Oct 2024 16:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9BCC4CEC3;
 Mon, 14 Oct 2024 16:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728924703;
 bh=xSiLdWCKW0d4kOhTcAew6y0uEJ0fLcClKUQ6HGQMe7s=;
 h=Date:From:To:Cc:Subject:From;
 b=CDxIQvYkzps2tEUA1nid3QnaaScefKoVsxxJ/YsVq2hJw/Tm8jEvmgFq4DLcghoib
 UDO/d0S4UNBUGlje6uldHURjTnWlwEIhjy7v5QrAdTZyJje1Fkzof1xe8vcR+u/APY
 gMhg/dDM+jytA2ZIJeyh3Jww9h68fUWGLJm7BCwey1C2Ut6ycKBH3BYH7Fm9n+lXvR
 4lGGpqUMxbGJd0AoQIvEfZFiGSgXlxwLTbLn5CthzykzH2brR6CypieYyNT6s27/Z5
 bfSctjGEBQMajfb6hPrFIcSaqE33Zbyv0jXGN2hEUqgcQoCEn47PXyflXogDEiO8hx
 LooI8mqA6TMmw==
Date: Mon, 14 Oct 2024 16:51:41 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <Zw1MHWwr3fRgJpLr@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider applying this patch in
 f2fs? Thanks, 
 Content analysis details:   (-5.3 points, 6.0 required)
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t0OIT-0001OD-Sd
Subject: [f2fs-dev] [GIT PULL] f2fs fix for 6.12-rc4
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Linus,

Could you please consider applying this patch in f2fs?

Thanks,

The following changes since commit 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b:

  Linux 6.12-rc2 (2024-10-06 15:32:27 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-6.12-rc4

for you to fetch changes up to 332fade75d0ecd88cd19556fce0f9cc8322de434:

  f2fs: allow parallel DIO reads (2024-10-11 15:12:07 +0000)

----------------------------------------------------------------
f2fs fix for 6.12-rc4

This includes an urgent fix to resolve DIO read performance regression caused by
0cac51185e65 ("f2fs: fix to avoid racing in between read and OPU dio write").

----------------------------------------------------------------
Jaegeuk Kim (1):
      f2fs: allow parallel DIO reads

 fs/f2fs/file.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
