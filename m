Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FF63A9569
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Jun 2021 10:53:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ltRIc-0005FO-6u; Wed, 16 Jun 2021 08:53:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1ltRIa-0005F1-By
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 08:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oxGdDHsozXNdxVBcMTnfRLsug90r69T25ARBDtbntyA=; b=KfbQTzr1CgBXM2Ms5lDNBrTkp8
 h2oYS5eT8mmDOMLCxsjoqw97JDTh+0NLlUCSem9w5RNgaGKFGNgcDOu2G1FnGJsAnVTMSmMGUihiU
 Wj4JJI7e3kfp9+4++JCN6+om42AQWBJ410hAllaO/KJif6McHQqbatOF37oXMEZ9IP8Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oxGdDHsozXNdxVBcMTnfRLsug90r69T25ARBDtbntyA=; b=jccjxHNQ9E+2qOryrBM0GyKqzS
 P6EW+YA1WOGnHBWlpTArQ3fk+xlEzY68+gV5Veg49ip8ok3RP67PXw1z4W26Hv5rTMn0UbhgRxiRW
 UPtC9UNMGXDxv4rrokDe2xYthDx+Tiw0sZx6SKmvUm8s6ovpq4unt5T2oFM2f+lV28k8=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1ltRIR-00BwjZ-Sg
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 08:53:25 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 3785121A24;
 Wed, 16 Jun 2021 08:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623833587; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oxGdDHsozXNdxVBcMTnfRLsug90r69T25ARBDtbntyA=;
 b=LsIoyQo3y3jZK6iYT6qpOHtEBnsukk3Vi+/RWO+92uZkR0q03c6TBQ0B5CU8KM+QrgFTs3
 E8iil+lsQ0ADkqJyjlPsKpGDzT7V3B1ZwTbzwok6Utjw25vol8hEatNgGKqz0HDDDpVozi
 RBw73kTkulONM8nvb2UKyszzcHS4CwU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623833587;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oxGdDHsozXNdxVBcMTnfRLsug90r69T25ARBDtbntyA=;
 b=Cd/rE56FeKGW7aufMXqVHJ9XF4xj24JOWYzVHMVZjsuoQRzk9nxMDxtS1jr5muCo1d29ir
 FblE0OV602i/3qDw==
Received: from quack2.suse.cz (unknown [10.100.200.198])
 by relay2.suse.de (Postfix) with ESMTP id 687ABA3B9B;
 Wed, 16 Jun 2021 08:53:06 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id D7E651F2C88; Wed, 16 Jun 2021 10:53:04 +0200 (CEST)
Date: Wed, 16 Jun 2021 10:53:04 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20210616085304.GA28250@quack2.suse.cz>
References: <20210615090844.6045-1-jack@suse.cz>
 <20210615091814.28626-7-jack@suse.cz>
 <YMmOCK4wHc9lerEc@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMmOCK4wHc9lerEc@infradead.org>
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
X-Headers-End: 1ltRIR-00BwjZ-Sg
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

On Wed 16-06-21 06:37:12, Christoph Hellwig wrote:
> On Tue, Jun 15, 2021 at 11:17:57AM +0200, Jan Kara wrote:
> > From: Pavel Reichl <preichl@redhat.com>
> > 
> > Refactor xfs_isilocked() to use newly introduced __xfs_rwsem_islocked().
> > __xfs_rwsem_islocked() is a helper function which encapsulates checking
> > state of rw_semaphores hold by inode.
> 
> __xfs_rwsem_islocked doesn't seem to actually existing in any tree I
> checked yet?

__xfs_rwsem_islocked is introduced by this patch so I'm not sure what are
you asking about... :)

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
