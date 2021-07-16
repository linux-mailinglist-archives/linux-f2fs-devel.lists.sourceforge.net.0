Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 679B63CB231
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jul 2021 08:05:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m4Gxz-0008NA-3l; Fri, 16 Jul 2021 06:04:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+382ccfd9051a34597009+6536+infradead.org+hch@casper.srs.infradead.org>)
 id 1m4Gxj-0008My-S6
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 06:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VqN67i/AkXmoD+IiyttSlo//iBvW+McMPHFuPzEzzmk=; b=MzVoWzJdUz/ykOgc4R68MYjh8I
 ux3hU/yL2nTHg1KxXNqUivPmIh3Tljbc9vrHMXZG0EmSuFR0oa/IllYH4+Zh/mhC1+tqfoj1Qel1p
 wt+mfYJQ+4b/xf9HhGhPmbgAPvUb2PvkGmM7ZGdKwhHiYztSDkCWr1roozRIcq4HhLTc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VqN67i/AkXmoD+IiyttSlo//iBvW+McMPHFuPzEzzmk=; b=lYf4hXraDkhDsLmzZyGtsUJtL4
 Y1uP3zUsYwwzBS+mD92gBzgNA7YN5/WNDEAz2rNYRTQNTmgcsCbvzVROTCUxWFnsuRI9OkOJ/3Vb2
 bVG9QuHfVD8292Tu4OqoaCePcHyZaG3jNNMkOiJtotGo9TQbgL5CB4FyeXS9fmAi7Q70=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m4Gxc-00A6uu-Jv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 06:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=VqN67i/AkXmoD+IiyttSlo//iBvW+McMPHFuPzEzzmk=; b=GIT7UGi37zY+XOB7QjWwGW3XJ0
 7qEph9PTVYX9s67VHkRG4pM2K1Afby+1zcT4sTbChUk0zhwAyvHMDjwKoyuHqzaYVj4pcuJsfBlu6
 Fk8V41n3n/B4RnuWGC7pC0bjPas3++sTAW+DXsW4mH4PMi4H+qc1/Itqs3Mg1NFZmSqbSdLAtprKm
 VVBCaBmhmAez+Y8TKo54kjUBLyCv/f1C4pNSPf06xj04j6eN/evkGTDW44O/CcnUbF++coSL2tlTe
 ftIE700GhNS7KbxUeVi0HolIM7XBwDI02Q+6FWVRqI3LsSKOvFhS+z6sl0H15g4PPZ2DyJSyqWuFp
 6VB9QLWw==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m4GvT-004CGX-Py; Fri, 16 Jul 2021 06:02:31 +0000
Date: Fri, 16 Jul 2021 07:02:19 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <YPEg63TU0pPzK5xB@infradead.org>
References: <20210715133202.5975-1-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210715133202.5975-1-jack@suse.cz>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m4Gxc-00A6uu-Jv
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
Cc: linux-xfs@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 linux-cifs@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 15, 2021 at 03:40:10PM +0200, Jan Kara wrote:
> Hello,
> 
> here is another version of my patches to address races between hole punching
> and page cache filling functions for ext4 and other filesystems. The only
> change since the last time is a small cleanup applied to changes of
> filemap_fault() in patch 3/14 based on Christoph's & Darrick's feedback (thanks
> guys!).  Darrick, Christoph, is the patch fine now?

Looks fine to me.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
