Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D39F2B652
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 May 2019 15:24:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hVFbZ-0004pl-U0; Mon, 27 May 2019 13:23:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dsterba@suse.cz>) id 1hVFbY-0004pb-Qe
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 May 2019 13:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sliIN/6bT9A2L9h0yW4oubn7AriJkxfwz8z06mUi3Ro=; b=BTLBeGFBWHRS3XSKM6wLAGgzDd
 rDJX4fpoceKgTV70HUIO27Jh1Bn6nR6HR9hTrRDJrtBj+A3JdnlNAYCTGH/E9qQ88/ZHC7xe1EHeB
 LAuaM599u9WlC1KaCHK7RKsCIf2QWqbX2al7wYg3Q8bwJ++v/GJOQkz5Z1yKG4t2IIDs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sliIN/6bT9A2L9h0yW4oubn7AriJkxfwz8z06mUi3Ro=; b=QyY5TCxFCVVHqKISN3ZHfHbZ1R
 DIX5nglpONlTpRDk+Rp+mFpV7s4PffCYFM16BLS5Nh38hLG7bFUStjMaCXLHU+GMewKQQ8Q4QjX3s
 KSne4dXsZ+WBUiokAuptCdtBphbP+5Jy2+M6WG0LwlMQAvv4dQ0MyrbqLcVEYspJHk90=;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hVFbV-00FinL-G6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 May 2019 13:23:56 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E70CBAEBB;
 Mon, 27 May 2019 13:09:48 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 7E694DA85C; Mon, 27 May 2019 15:10:42 +0200 (CEST)
Date: Mon, 27 May 2019 15:10:41 +0200
From: David Sterba <dsterba@suse.cz>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190527131041.GH15290@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Juergen Gross <jgross@suse.com>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, devel@driverdev.osuosl.org,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, Jonathan Corbet <corbet@lwn.net>,
 Gao Xiang <gaoxiang25@huawei.com>, Chao Yu <yuchao0@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, ocfs2-devel@oss.oracle.com
References: <20190527103207.13287-1-jgross@suse.com>
 <20190527103207.13287-3-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527103207.13287-3-jgross@suse.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hVFbV-00FinL-G6
Subject: Re: [f2fs-dev] [PATCH 2/3] mm: remove cleancache.c
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
Reply-To: dsterba@suse.cz
Cc: linux-doc@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 devel@driverdev.osuosl.org, Jonathan Corbet <corbet@lwn.net>,
 Mark Fasheh <mark@fasheh.com>, linux-ext4@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, May 27, 2019 at 12:32:06PM +0200, Juergen Gross wrote:
> With the removal of tmem and xen-selfballoon the only user of
> cleancache is gone. Remove it, too.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  Documentation/vm/cleancache.rst  | 296 ------------------------------------
>  Documentation/vm/frontswap.rst   |  10 +-
>  Documentation/vm/index.rst       |   1 -
>  MAINTAINERS                      |   7 -
>  drivers/staging/erofs/data.c     |   6 -
>  drivers/staging/erofs/internal.h |   1 -
>  fs/block_dev.c                   |   5 -

For the btrfs part:

>  fs/btrfs/extent_io.c             |   9 --
>  fs/btrfs/super.c                 |   2 -

Acked-by: David Sterba <dsterba@suse.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
