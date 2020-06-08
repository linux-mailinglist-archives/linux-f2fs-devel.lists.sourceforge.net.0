Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E2D1F1BED
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Jun 2020 17:20:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jiJZq-0004uE-Rg; Mon, 08 Jun 2020 15:20:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <corbet@lwn.net>) id 1jiJZp-0004tt-Nn
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jun 2020 15:20:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L/72qhkV7j+UqHRZ0GMJj8rH3B+1FU3gmtPP1zUchj8=; b=Pg66F29k5+QMYgP3HOn/buNTD/
 y/857LelWOPaRYaeG6WjJA9j4EA03v1b9vNJkXsVPxYGKPn0i0pUcClBWzIAqLrLceYGckpFvRQMQ
 XqHhFf7EQHfdRO0AqvWMu9Ofyw+I3qurxxYAj0W5augtIhdn+kNntPbarvRmM4otJMrY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L/72qhkV7j+UqHRZ0GMJj8rH3B+1FU3gmtPP1zUchj8=; b=jALdY0OJW47RJqltZ/3Y3Pf87b
 /DD0f6HdZVMVaaiIXFS9F+uoJok4FbMlgYvHgyzxvQZCNSqwfFMyEsop33l2GQ+iC733fmQhni23s
 OGXO3rrkn5hGIDlO+4ge6yuc0B4iH4V+YgpvN2QmNbxcXwQro1FubcNG5sVv4dxgYZ+w=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jiJZo-00DbWM-FL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jun 2020 15:20:41 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id B580535A;
 Mon,  8 Jun 2020 15:20:28 +0000 (UTC)
Date: Mon, 8 Jun 2020 09:20:27 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <20200608092027.46363063@lwn.net>
In-Reply-To: <cover.1591137229.git.mchehab+huawei@kernel.org>
References: <cover.1591137229.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [45.79.88.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1jiJZo-00DbWM-FL
Subject: Re: [f2fs-dev] [PATCH 0/2] a couple documentation fixes
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
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, NeilBrown <neilb@suse.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Aubrey Li <aubrey.li@linux.intel.com>, linux-kernel@vger.kernel.org,
 Alexey Dobriyan <adobriyan@gmail.com>,
 Luigi Semenzato <semenzato@chromium.org>, Mark Brown <broonie@kernel.org>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net, Thomas Gleixner <tglx@linutronix.de>,
 Daniel Kiss <daniel.kiss@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed,  3 Jun 2020 00:38:12 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> It follows a couple of fixes for two tables that got broken, probably due to
> some conflict between the ReST conversion patches and ungoing updates.
> 
> IMO, it would be nice to have those two applied during the merge window,
> as they produce a too noisy output.

The problems all came from trees other than docs-next, so the patch
doesn't apply there now.  I'll merge with mainline after -rc1 and, if the
problems haven't been fixed elsewhere, I'll apply the patches then.

Thanks,

jon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
