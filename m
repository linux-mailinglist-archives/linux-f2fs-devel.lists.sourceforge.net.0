Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E127391927
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 May 2021 15:45:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lltqk-0002OS-3C; Wed, 26 May 2021 13:45:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1lltqi-0002OB-Rc
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 13:45:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=apm9jbJQFRD4udYNHoSzxdprqFqLA7k3RsYAIC55tFw=; b=W8Ghus4P3nvSPuVZleRWJZKuE0
 tbiMZmc+q65RohcLbV8A8cXXO8oK8AQygozlDTOkL9JUXf92j36V9Ajf5ha+c4mBAaSQ+imwOrJDI
 05wVuG9mS6sLFsitIxrmGCbCQc/c8UIBHuYHoh7vmpLWFzfmbgTa53gLrzRHhk9ZPwFw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=apm9jbJQFRD4udYNHoSzxdprqFqLA7k3RsYAIC55tFw=; b=NNduzFVPVVn5OCQWpl1/zrVZ7n
 fqH8tUpGegl/m1is25uENL6mysA99I4lIEcHCHXbG+ZpEBnAKPrK0oICJAHjEg0xnyXUoUTTx93Yn
 nyhRsMRuFHtEcW5SB9o3yROuifMxpbKgliRUJ8fK1gR4YldSpnWzggP7STE0wo7lfWOk=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lltqf-006afa-2o
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 13:45:29 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622036718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=apm9jbJQFRD4udYNHoSzxdprqFqLA7k3RsYAIC55tFw=;
 b=cnmntof33GWZpibKaFYSeM4Gk6TxfRLz+4s4t8LuFWXfJvqQIlVA1wtA5H2WpPVs2aXVM1
 90Ovx5JwBzEDtXH60rKQnNRznZfWICKqqqpBlDuoCFGc+WBiqDSjzlvvoZgCb1wcIen8S4
 mznQOxzR6nPyM4QN4jw0ZLesgEvJAVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622036718;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=apm9jbJQFRD4udYNHoSzxdprqFqLA7k3RsYAIC55tFw=;
 b=hkwnkRmSuFFvaSrY4e0OIjbNBgSv/k9RwujrcIU4D0drYeNryY1g/BkIYM5sV632oIA/us
 5BEXA3EzHyDAf1CA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B9FCDB275;
 Wed, 26 May 2021 13:45:18 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 4146A1F2CAC; Wed, 26 May 2021 15:45:18 +0200 (CEST)
Date: Wed, 26 May 2021 15:45:18 +0200
From: Jan Kara <jack@suse.cz>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20210526134518.GF30369@quack2.suse.cz>
References: <20210525125652.20457-1-jack@suse.cz>
 <20210525135100.11221-4-jack@suse.cz>
 <20210525204805.GM202121@locust>
 <20210526100702.GB30369@quack2.suse.cz>
 <DM6PR04MB7081EBE7CE3404AB53F62795E7249@DM6PR04MB7081.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM6PR04MB7081EBE7CE3404AB53F62795E7249@DM6PR04MB7081.namprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lltqf-006afa-2o
Subject: Re: [f2fs-dev] [PATCH 04/13] mm: Add functions to lock
 invalidate_lock for two mappings
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
Cc: Jeff Layton <jlayton@kernel.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 "Darrick J. Wong" <djwong@kernel.org>, Steve French <sfrench@samba.org>,
 Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "hch@infradead.org" <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Ted Tso <tytso@mit.edu>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 Johannes Thumshirn <jth@kernel.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed 26-05-21 12:11:43, Damien Le Moal wrote:
> On 2021/05/26 19:07, Jan Kara wrote:
> > On Tue 25-05-21 13:48:05, Darrick J. Wong wrote:
> >> On Tue, May 25, 2021 at 03:50:41PM +0200, Jan Kara wrote:
> >>> Some operations such as reflinking blocks among files will need to lock
> >>> invalidate_lock for two mappings. Add helper functions to do that.
> >>>
> >>> Signed-off-by: Jan Kara <jack@suse.cz>
> >>> ---
> >>>  include/linux/fs.h |  6 ++++++
> >>>  mm/filemap.c       | 38 ++++++++++++++++++++++++++++++++++++++
> >>>  2 files changed, 44 insertions(+)
> >>>
> >>> diff --git a/include/linux/fs.h b/include/linux/fs.h
> >>> index 897238d9f1e0..e6f7447505f5 100644
> >>> --- a/include/linux/fs.h
> >>> +++ b/include/linux/fs.h
> >>> @@ -822,6 +822,12 @@ static inline void inode_lock_shared_nested(struct inode *inode, unsigned subcla
> >>>  void lock_two_nondirectories(struct inode *, struct inode*);
> >>>  void unlock_two_nondirectories(struct inode *, struct inode*);
> >>>  
> >>> +void filemap_invalidate_down_write_two(struct address_space *mapping1,
> >>> +				       struct address_space *mapping2);
> >>> +void filemap_invalidate_up_write_two(struct address_space *mapping1,
> >>
> >> TBH I find myself wishing that the invalidate_lock used the same
> >> lock/unlock style wrappers that we use for i_rwsem.
> >>
> >> filemap_invalidate_lock(inode1->mapping);
> >> filemap_invalidate_lock_two(inode1->i_mapping, inode2->i_mapping);
> > 
> > OK, and filemap_invalidate_lock_shared() for down_read()? I guess that
> > works for me.
> 
> What about filemap_invalidate_lock_read() and filemap_invalidate_lock_write() ?
> That reminds the down_read()/down_write() without the slightly confusing down/up.

Well, if we go for lock wrappers as Darrick suggested, I'd mirror naming
used for inode_lock(). That is IMO the least confusing option... And that
naming has _lock and _lock_shared suffixes.

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
