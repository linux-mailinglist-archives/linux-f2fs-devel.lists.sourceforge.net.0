Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D1C3AAF22
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Jun 2021 10:53:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ltnmN-0004mR-4O; Thu, 17 Jun 2021 08:53:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1ltnmL-0004mI-Uu
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Jun 2021 08:53:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AqMZ6VDXQs8fACSxjEoTa3jWnXqlOeaX0ILKp41Ujpg=; b=PTNoCRbs/PPt5PhdSPKqb3YkSl
 9bQ0bgKkx5WrfVrP1P5LwTn4MQd2CDef6hR4Og1zdl9iIeRyyhtFdViHhxyLZr7Fy0O/aqZ+TGGue
 U3OpMeOdhL2kzQCKNmffj9qwpOTTeIKOtQ3CE+XxbYlTQOa8M7DEEye3UxrYALP26hh8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AqMZ6VDXQs8fACSxjEoTa3jWnXqlOeaX0ILKp41Ujpg=; b=fCw4fGtF6oTpNaelnoJ58qr7Gk
 C6FPLz2cqXZ6mb85N/5DBUtBrdXYKhs2IfFwMq0mkYotKqAizcTrZjpjwnlmCrBAgJyUFlM4CeiGv
 Zdv9x9G2US2QkQhJdgMTa40y4kRTfV903klMl7mZCqP+CmUBWPBl0hI9Mlf/Q9Ymn2fQ=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1ltnmF-00DTeV-98
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Jun 2021 08:53:41 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id D1E741FDBF;
 Thu, 17 Jun 2021 08:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623920001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AqMZ6VDXQs8fACSxjEoTa3jWnXqlOeaX0ILKp41Ujpg=;
 b=vt+nizqaqNppg74ojCy5P9EV49Hx8U+2xEiapBW704yiHrbUGgs/d6MGdqxK3PVg/GkS/e
 RmLG2VCA7qqBsKJQ7MGYHGTGsmziJNs06z1QldT/CEjXmHCCf36WDqS67BmefBDMgvjlUV
 srhgdjuc1NB9pzfw/X19pQ/TcfLcXeQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623920001;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AqMZ6VDXQs8fACSxjEoTa3jWnXqlOeaX0ILKp41Ujpg=;
 b=wNcM/bzZp+S6rae1Cjx+blaWgX6JIc/huCvNunJbz5gnULci61sK6dgac/Q02qOuAkVL3e
 V86JObPs0j//SiDQ==
Received: from quack2.suse.cz (unknown [10.100.200.198])
 by relay2.suse.de (Postfix) with ESMTP id 17E65A3BB7;
 Thu, 17 Jun 2021 08:53:20 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id E611F1F2C64; Thu, 17 Jun 2021 10:53:19 +0200 (CEST)
Date: Thu, 17 Jun 2021 10:53:19 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20210617085319.GD32587@quack2.suse.cz>
References: <20210615090844.6045-1-jack@suse.cz>
 <20210615091814.28626-7-jack@suse.cz>
 <YMr/eA3Eq2u6yUNw@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMr/eA3Eq2u6yUNw@infradead.org>
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
X-Headers-End: 1ltnmF-00DTeV-98
Subject: Re: [f2fs-dev] [PATCH 07/14] xfs: Refactor xfs_isilocked()
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
Cc: Jan Kara <jack@suse.cz>, Dave Chinner <david@fromorbit.com>,
 linux-mm@kvack.org, linux-cifs@vger.kernel.org,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, linux-ext4@vger.kernel.org,
 Eric Sandeen <sandeen@redhat.com>, Dave Chinner <dchinner@redhat.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 linux-xfs@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Ted Tso <tytso@mit.edu>, Miklos Szeredi <miklos@szeredi.hu>,
 Jeff Layton <jlayton@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org,
 Pavel Reichl <preichl@redhat.com>, Johannes Thumshirn <jth@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu 17-06-21 08:53:28, Christoph Hellwig wrote:
> On Tue, Jun 15, 2021 at 11:17:57AM +0200, Jan Kara wrote:
> > From: Pavel Reichl <preichl@redhat.com>
> > 
> > Refactor xfs_isilocked() to use newly introduced __xfs_rwsem_islocked().
> > __xfs_rwsem_islocked() is a helper function which encapsulates checking
> > state of rw_semaphores hold by inode.
> 
> Looks good with the updated commit log:
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

I suppose you mean Reviewed-by, don't you?

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
