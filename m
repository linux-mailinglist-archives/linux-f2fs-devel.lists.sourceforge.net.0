Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 181B11EC528
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Jun 2020 00:38:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jgFYD-0003zK-72; Tue, 02 Jun 2020 22:38:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mchehab@kernel.org>) id 1jgFYA-0003yd-60
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Jun 2020 22:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PYUSoAUOZMGTDejsXnqapV3xQTMW6dV+TiH8o4EmLJA=; b=ObFaQ4HB1Xo/6aRm+hRTALPc9a
 0Xel4oYxDBqGvvDakAfvZBZ8DaRP8VScjVYm+IGGcVNfvFQKukUXlpd4UgUnhxJTLwEaUObpSQ/Tj
 D80CXQzkmSJ5mHEDy2KLmpYEvXboLNOPYJ3JUBb7AWrqZQcsGPKnr2dWm0E6EBhZwOtw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PYUSoAUOZMGTDejsXnqapV3xQTMW6dV+TiH8o4EmLJA=; b=Q
 3HcuSKoTQ/xpWxpRJxCME6BjG5WthLCP1bTh3HZqB+PCiWfk7B2h9GNQqdBKR8AD0CvIaxp6+ertD
 QYouZEs8SHVHYSNWwVJRdkY5K79aWxUdrkdTJYMHX9uqjVSOgRjvgw8Idq3sgQfYEIfqCSGZE3cTV
 jYvXyU8L/8UIXKZ4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jgFY8-003Ag4-Eg
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Jun 2020 22:38:26 +0000
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EA6C4207D5;
 Tue,  2 Jun 2020 22:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591137498;
 bh=w2DKDgUltB1bfWvKLY4YW3KtQ5ji1bpmbDm7KgFHUOQ=;
 h=From:To:Cc:Subject:Date:From;
 b=I6a94wv3fCWUC+NITMcn3INWfhf1qbCzTBbu9KhGxO32uicdm3zKtCYWOG0GgtjT2
 JIhOsH3uGQlAopTRmSB8yrioke6ERHqn6++QCYnVu5NwrSKpJNwAMOYOuLRdiF08zX
 t+/MQJuHEDsE5oXGyobjBN41L1whDimPEmMZBmVI=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
 (envelope-from <mchehab@kernel.org>)
 id 1jgFXz-004aX9-Hm; Wed, 03 Jun 2020 00:38:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Wed,  3 Jun 2020 00:38:12 +0200
Message-Id: <cover.1591137229.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jgFY8-003Ag4-Eg
Subject: [f2fs-dev] [PATCH 0/2] a couple documentation fixes
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
Cc: Yang Shi <yang.shi@linux.alibaba.com>, Kees Cook <keescook@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Aubrey Li <aubrey.li@linux.intel.com>, linux-kernel@vger.kernel.org,
 Alexey Dobriyan <adobriyan@gmail.com>, NeilBrown <neilb@suse.de>,
 Luigi Semenzato <semenzato@chromium.org>, Mark Brown <broonie@kernel.org>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Daniel Kiss <daniel.kiss@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jon,

It follows a couple of fixes for two tables that got broken, probably due to
some conflict between the ReST conversion patches and ungoing updates.

IMO, it would be nice to have those two applied during the merge window,
as they produce a too noisy output.

I have a few more fixes somewhere on my trees, but my plan is to send
you probably after the merge window, as I'm currently busy with some
other stuff (too much work at atomisp side). 

Mauro Carvalho Chehab (2):
  fs: docs: f2fs.rst: fix a broken table
  docs: fs: proc.rst: fix a warning due to a merge conflict

 Documentation/filesystems/f2fs.rst | 150 +++++++++++++++++++----------
 Documentation/filesystems/proc.rst |   2 +-
 2 files changed, 99 insertions(+), 53 deletions(-)

-- 
2.26.2




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
