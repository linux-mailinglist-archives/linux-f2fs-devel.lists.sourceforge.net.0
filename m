Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D416C3CBAD3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jul 2021 18:57:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m4R9n-0005iy-HR; Fri, 16 Jul 2021 16:57:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1m4R9m-0005is-8U
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 16:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pxtS5Oudgec4rEwV+dOqiY1lV684Qv1oXIm2Do6XZfk=; b=eYO6vkAKXYR4xKOJOYQaggv1tg
 jD6JQHPk6izQCtS3ncSfJHs1ms+EVnnjvfZtBeXCPsaG7hpTRdGf3vDBP4oJJOnHzTD0EFb4ULrkm
 oQsujaCgFXLQNXPAl32SmtDAtP7PadOJNd/rR60b+d23rKpmaik0mxKW3/F+MFVC/MUo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pxtS5Oudgec4rEwV+dOqiY1lV684Qv1oXIm2Do6XZfk=; b=GIpz0oXt4WbfTvuiXTzg4BX6BU
 6a0iEvfvUfqu+DWPeWiSLUTZmzh7XXeh+IbrkR1vex9/OCS+1978ceKXZdOSJMSg44y48yoZAQEp0
 UCadAlmEMri9gb9f5TmLbmtQdBSeZs1pxniwsArVUld8TmoK+50iieReBfhLmng7KcGM=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m4R9c-0004gy-8B
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 16:57:46 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 490BB22B0B;
 Fri, 16 Jul 2021 16:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626454644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pxtS5Oudgec4rEwV+dOqiY1lV684Qv1oXIm2Do6XZfk=;
 b=hiFNsQSKFHqkGL/hKshmGNpZ5ZjicXOhEN/YtCsK88lEdh0idp4zsblQzEdVglXoiKYrdc
 p6thMlpmVE41Yxl0KhkO7rimQTZLZLGojpDdoiJ9mLxNfdVo5NksjmOqEElW2p9FcTO/dc
 rWtidrEtmI2xNoBjWEUHSwW4bb+gIwg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626454644;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pxtS5Oudgec4rEwV+dOqiY1lV684Qv1oXIm2Do6XZfk=;
 b=s2c+8kdjfyur3gk7j7C5XyvF5JLV7mAnIM52+3ast7hDDkz7BxCQcxzHI0oLCb040Bok4p
 kH2nrdw58zKz0qCw==
Received: from quack2.suse.cz (unknown [10.100.200.198])
 by relay2.suse.de (Postfix) with ESMTP id 3725FA3BB9;
 Fri, 16 Jul 2021 16:57:24 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 12D411E0BF2; Fri, 16 Jul 2021 18:57:24 +0200 (CEST)
Date: Fri, 16 Jul 2021 18:57:24 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20210716165724.GH31920@quack2.suse.cz>
References: <20210715133202.5975-1-jack@suse.cz>
 <YPEg63TU0pPzK5xB@infradead.org> <20210716164311.GA22357@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210716164311.GA22357@magnolia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m4R9c-0004gy-8B
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
Cc: linux-xfs@vger.kernel.org, Jan Kara <jack@suse.cz>,
 linux-cifs@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri 16-07-21 09:43:11, Darrick J. Wong wrote:
> On Fri, Jul 16, 2021 at 07:02:19AM +0100, Christoph Hellwig wrote:
> > On Thu, Jul 15, 2021 at 03:40:10PM +0200, Jan Kara wrote:
> > > Hello,
> > > 
> > > here is another version of my patches to address races between hole punching
> > > and page cache filling functions for ext4 and other filesystems. The only
> > > change since the last time is a small cleanup applied to changes of
> > > filemap_fault() in patch 3/14 based on Christoph's & Darrick's feedback (thanks
> > > guys!).  Darrick, Christoph, is the patch fine now?
> > 
> > Looks fine to me.
> 
> Me too.

Thanks guys! I've pushed the patches to linux-next.

									Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
