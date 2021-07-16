Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 463C13CBAB1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jul 2021 18:43:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m4Qw2-0001jN-0c; Fri, 16 Jul 2021 16:43:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <djwong@kernel.org>) id 1m4Qw0-0001j6-Rs
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 16:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rWWf+zDwu+Do2QNiJySi0XD6nJzM4RK8fj9tnzDP+24=; b=AfyJGAR6by5mLZZdB4Gwp+Krd8
 1Nds2Rj1zDbMLmmZfrB63ncQw3dJxC59WPuc2ITK7PH/elFcRkWzlmJM7OGQco0PLvRpdcHHrGC6m
 IlLjSCz6OvUmHAqBn6pYjAZ8v/lx1z9H0wKgeBtoPDYnCjEoB5U3+cX0YzvaahTZ41io=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rWWf+zDwu+Do2QNiJySi0XD6nJzM4RK8fj9tnzDP+24=; b=aZX+PqW2BKWCDnJ9JiFTwo/cTA
 BAHdJDX/QrkM5XZVxJI0DFkvyCfv5a+ok2+/f2E48jwwReD5gHpDMHJxNpcYsU+B1oZoL8ni4X5BT
 yuuUViD6fIsSk793NTSBYrt3NhY+X7DJnQwb8cfVtqEaAdg5qpbPJIBVkVklZOr5qKwg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m4Qvr-0003sV-I1
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 16:43:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 35961613D0;
 Fri, 16 Jul 2021 16:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626453793;
 bh=4cf1AnF6M65jEKCZ4DUvlF+jXCvIQBpF34YgrerdDE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ER33OScu5jXxJL4bBbchkSb43icKDsitlTLzz/ULEuCKhDyvzfruACZnB7KEth/Ea
 CrHL2LSiOdJ48FNoGdUcRJPztvvlN2R9q/wJJKcgnB4F1BFPAddcRBz30NPyaVNVA/
 c13g+u1kfK1sYm4jZTlXTgZiWA4uk6IRkbh//2Bk3gR4M1niUW7g70cN+zj01sKUw5
 w11NLDR1ohyuzzNvoiRCItpM7Kwmua6Mzwh8IqK6FDO3uAqgbL4KU/TlVuM6lEEHgQ
 owdro4sa6g8ZVQZprvohZ8U0qKtbPZRfpQ+EtiAyzSrv0hMzf/nWGpv1wM1Qur2p+u
 KJcRDYSgBrojg==
Date: Fri, 16 Jul 2021 09:43:11 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20210716164311.GA22357@magnolia>
References: <20210715133202.5975-1-jack@suse.cz>
 <YPEg63TU0pPzK5xB@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPEg63TU0pPzK5xB@infradead.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m4Qvr-0003sV-I1
Subject: Re: [f2fs-dev] [PATCH 0/14 v10] fs: Hole punch vs page cache
 filling races
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
Cc: linux-cifs@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 16, 2021 at 07:02:19AM +0100, Christoph Hellwig wrote:
> On Thu, Jul 15, 2021 at 03:40:10PM +0200, Jan Kara wrote:
> > Hello,
> > 
> > here is another version of my patches to address races between hole punching
> > and page cache filling functions for ext4 and other filesystems. The only
> > change since the last time is a small cleanup applied to changes of
> > filemap_fault() in patch 3/14 based on Christoph's & Darrick's feedback (thanks
> > guys!).  Darrick, Christoph, is the patch fine now?
> 
> Looks fine to me.

Me too.

--D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
