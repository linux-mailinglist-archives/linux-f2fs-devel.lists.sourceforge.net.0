Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E6A2B227
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 May 2019 12:32:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hVCvX-0007mi-1T; Mon, 27 May 2019 10:32:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jgross@suse.com>) id 1hVCvV-0007mD-65
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 May 2019 10:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=85jYBj5PrQroZXLJZVx54g7mT2EDKdxV/uZBxsrFsL0=; b=FNmJdPrXu2Ay8HRgUGaBLe3s7T
 0KjB+4XxSLJ8ddOmjVIKv4gF0esDwglrHbg92hKeyCb9br3BFWmkX3LvzwtnF+IYKJq4nMZ6uVU5h
 nETCLghvaIMF7TRBQl6X6qv19RwyQBVd4+JEcc0AmzSl1TsAfkv8C9fhzWRc5Tix21DA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=85jYBj5PrQroZXLJZVx54g7mT2EDKdxV/uZBxsrFsL0=; b=gE2nTwnM7fjvLpRRDDC6MNn+sN
 86ruFCZa8lUZZzVosMDFXNL++KE7e+DpJoRXuUKR2cDEGTt4mYV9CS7e0ETGrFUr2qQsm2MCLGOTm
 8AN8TAy6HEJ0NPUuLcDEEMzdpd0zE2YdBsv5j+Sac0xrjU07cTHiTmCTI5d1gKi0Rpnw=;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hVCvT-00F5Jy-Ko
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 May 2019 10:32:21 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4502AAE27;
 Mon, 27 May 2019 10:32:12 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, devel@driverdev.osuosl.org,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org
Date: Mon, 27 May 2019 12:32:04 +0200
Message-Id: <20190527103207.13287-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hVCvT-00F5Jy-Ko
Subject: [f2fs-dev] [PATCH 0/3] remove tmem and code depending on it
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Fasheh <mark@fasheh.com>,
 Josef Bacik <josef@toxicpanda.com>, Theodore Ts'o <tytso@mit.edu>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, ocfs2-devel@oss.oracle.com,
 Joel Becker <jlbec@evilplan.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Tmem has been an experimental Xen feature which has been dropped
recently due to security problems and lack of maintainership.

So it is time now to drop it in Linux kernel, too.

Juergen Gross (3):
  xen: remove tmem driver
  mm: remove cleancache.c
  mm: remove tmem specifics from frontswap

 Documentation/admin-guide/kernel-parameters.txt |  21 -
 Documentation/vm/cleancache.rst                 | 296 ------------
 Documentation/vm/frontswap.rst                  |  27 +-
 Documentation/vm/index.rst                      |   1 -
 MAINTAINERS                                     |   7 -
 drivers/staging/erofs/data.c                    |   6 -
 drivers/staging/erofs/internal.h                |   1 -
 drivers/xen/Kconfig                             |  23 -
 drivers/xen/Makefile                            |   2 -
 drivers/xen/tmem.c                              | 419 -----------------
 drivers/xen/xen-balloon.c                       |   2 -
 drivers/xen/xen-selfballoon.c                   | 579 ------------------------
 fs/block_dev.c                                  |   5 -
 fs/btrfs/extent_io.c                            |   9 -
 fs/btrfs/super.c                                |   2 -
 fs/ext4/readpage.c                              |   6 -
 fs/ext4/super.c                                 |   2 -
 fs/f2fs/data.c                                  |   3 +-
 fs/mpage.c                                      |   7 -
 fs/ocfs2/super.c                                |   2 -
 fs/super.c                                      |   3 -
 include/linux/cleancache.h                      | 124 -----
 include/linux/frontswap.h                       |   5 -
 include/linux/fs.h                              |   5 -
 include/xen/balloon.h                           |   8 -
 include/xen/tmem.h                              |  18 -
 mm/Kconfig                                      |  38 +-
 mm/Makefile                                     |   1 -
 mm/cleancache.c                                 | 317 -------------
 mm/filemap.c                                    |  11 -
 mm/frontswap.c                                  | 156 +------
 mm/truncate.c                                   |  15 +-
 32 files changed, 17 insertions(+), 2104 deletions(-)
 delete mode 100644 Documentation/vm/cleancache.rst
 delete mode 100644 drivers/xen/tmem.c
 delete mode 100644 drivers/xen/xen-selfballoon.c
 delete mode 100644 include/linux/cleancache.h
 delete mode 100644 include/xen/tmem.h
 delete mode 100644 mm/cleancache.c

-- 
2.16.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
