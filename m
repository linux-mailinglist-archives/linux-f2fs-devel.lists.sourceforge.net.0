Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7508994A475
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Aug 2024 11:36:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sbd5Y-0005oR-85;
	Wed, 07 Aug 2024 09:36:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1sbd5W-0005o8-LC;
 Wed, 07 Aug 2024 09:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=60H60kILv9Bav9pTakzp3GjJPhswXxdFsUwDJslrUzY=; b=JM4UjAgzeg8eykM5cAZzvzVNL8
 sO0923Mbo1fRLq5GZWmHMoExJg3mQFZPZ5vvbrI0Joh8XzE3E9/pEBOv4TY2dkOnXwVXONwblowrK
 sRQiQIo+X1ZzgmEcazzQndyJsmUrb+/rzhv8j3O0AftK8Hb209Do7X7TBuL7nYvKQKVU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=60H60kILv9Bav9pTakzp3GjJPhswXxdFsUwDJslrUzY=; b=EmuZk3Gd73h4pYw5hphr6J6fjd
 PAhCjDmlYMXHepJZjxPeBC8Y7dwE/g65rSLpkMrS2/q825Di4DE4CGtZfjTuaihoc1+7N7KDA0CCM
 FFCcDTmkgzZ8CyBUXB40RYNY7Md8gpZFXRExiTEk0UVKvdZkfbYjzKTFxfuJcG4NC8L0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sbd5W-0003SJ-0e; Wed, 07 Aug 2024 09:36:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A161561127;
 Wed,  7 Aug 2024 09:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42EDC4AF0B;
 Wed,  7 Aug 2024 09:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723023364;
 bh=SIN474AVw4y1MoDQyBN2l9zLDxAG8yJpM+IZg/xSlBk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=btbhCRAZArjLvUl8j5Ej+vHzQoO1vTjwqrNsQBIT0/x406nNG6tlbPi9O+sN17d4Y
 QICBpuxQ5Bjmn0gXNfW6CQYVZcH8G9ejnTHAA9QFo2zZkYlDWAI6Ot2tDmga9anM+b
 WGgtBA/ZIv47FtykXIpoPT2AFtuvlcGoPU21CF4LWL98hI/ZRbIPlQfOtpM6SjubXy
 OlCR91eQljQjrJdxLmEtfQYDLsvKApDB3/uWNI88bc+X4QiyQeaPCNomUP+ive0rEL
 gGm3BEKgE3wm60LcEtCDTOpcEofl8MTOn6i7t19oigLeiBJBu3URtJDBmLKsiEuJyf
 nO0JARebaxVPA==
Date: Wed, 7 Aug 2024 11:35:56 +0200
From: Christian Brauner <brauner@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20240807-fazit-bergbahn-25781f6167b7@brauner>
References: <202408062249.2194d51b-lkp@intel.com>
 <ZrLuBz1eBdgFzIyC@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZrLuBz1eBdgFzIyC@casper.infradead.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 07, 2024 at 04:46:15AM GMT, Matthew Wilcox wrote:
 > On Tue, Aug 06, 2024 at 10:26:17PM +0800, kernel test robot wrote: > >
 kernel test robot noticed "kernel_BUG_at_include/linux/page-flags [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sbd5W-0003SJ-0e
Subject: Re: [f2fs-dev] [linux-next:master] [fs] cdc4ad36a8:
 kernel_BUG_at_include/linux/page-flags.h
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
Cc: jfs-discussion@lists.sourceforge.net, oe-lkp@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-mtd@lists.infradead.org, linux-nilfs@vger.kernel.org, lkp@intel.com,
 linux-bcachefs@vger.kernel.org, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, Ryan Roberts <ryan.roberts@arm.com>,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-um@lists.infradead.org, reiserfs-devel@vger.kernel.org,
 linux-block@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel test robot <oliver.sang@intel.com>, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-karma-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 07, 2024 at 04:46:15AM GMT, Matthew Wilcox wrote:
> On Tue, Aug 06, 2024 at 10:26:17PM +0800, kernel test robot wrote:
> > kernel test robot noticed "kernel_BUG_at_include/linux/page-flags.h" on:
> > 
> > commit: cdc4ad36a871b7ac43fcc6b2891058d332ce60ce ("fs: Convert aops->write_begin to take a folio")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> > 
> > [test failed on linux-next/master 1e391b34f6aa043c7afa40a2103163a0ef06d179]
> > 
> > in testcase: boot
> 
> This patch should fix it.
> 
> Christian, can you squash the fix in?

Yep, done!


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
