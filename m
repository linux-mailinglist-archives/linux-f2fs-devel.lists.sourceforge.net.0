Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9E92ED323
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Jan 2021 16:01:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kxWn8-0004pE-Su; Thu, 07 Jan 2021 15:01:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1kxWn8-0004p7-0S
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Jan 2021 15:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rlt23EkBPxKCTsUQC+ORG3e/Em19JiHhSLMj3woiVuo=; b=YJgwkpz32CrWn1HkCWWVT9xwx4
 d7nEfaxiHbw9JwoqUTFtk56qqk2LGv8JM1VpRTqTae5N6a7XY0aooHQpUr9t2dIVQa0yLkwZZbJYt
 y/rZnLKzVaE3TXcFC2Q3ARgKFjsophOiW64+Plt2HH7vVCK4ouQeffypXCnLvpBn5Y2w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rlt23EkBPxKCTsUQC+ORG3e/Em19JiHhSLMj3woiVuo=; b=b+2cl1/CFevsE15qKavPM8cvA5
 333nphvWsG24pvYaImAnodnvn9KvSHRj8zzASFy2puOE+n36IZuJtBb7H3dIbRNe9rdCDDShe8zVA
 Pb8NIyHeZnZTGHMQyFuhieSfwW69Wm4YUrlqm55bIZBErgDAPUYwS/LQQ1EIR8mNLD38=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kxWmt-004U0O-Bo
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Jan 2021 15:01:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rlt23EkBPxKCTsUQC+ORG3e/Em19JiHhSLMj3woiVuo=; b=vLipm221NPJuEUlgaq3Ay399v4
 TNZP5WpHweX3MPFQvCCsidDC20GzcGPuQfqv0OSzrrwx6IZNsf0baeD20EQJhHMSzJeeLB75hzYJI
 tfM94Emz3mKv/mXPn5iWdqGB35Il0rUSLpZWlMciAozBUV4IUywvuIU4w2gUermQjkH8Iyf2pvLoi
 L2FeDcbj+XoJJKUmGroW6WMmoUB2eHVo5+VOL+BCLDEAhpuU3/JbgeDWUXnn6ikjUpADaddGjIeeu
 XRnWEdnKilwM7+O/9iw5XT2v9qwsOE+/MhOwbQfePjCsyL+2Ji7B0KIGxNeQtQvmQ1F6m5+kbx6kj
 7rOEkooQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1kxWkH-0009Mi-0g; Thu, 07 Jan 2021 14:59:13 +0000
Date: Thu, 7 Jan 2021 14:58:37 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20210107145837.GA5270@casper.infradead.org>
References: <20210105005452.92521-1-ebiggers@kernel.org>
 <20210105005452.92521-2-ebiggers@kernel.org>
 <20210107144709.GG12990@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107144709.GG12990@quack2.suse.cz>
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
X-Headers-End: 1kxWmt-004U0O-Bo
Subject: Re: [f2fs-dev] [PATCH 01/13] fs: avoid double-writing inodes on
 lazytime expiration
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
Cc: linux-xfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 07, 2021 at 03:47:09PM +0100, Jan Kara wrote:
> I think attached patch (compile-tested only) should actually fix the
> problem as well without this special ->dirty_inode() call. It basically
> only moves the mark_inode_dirty_sync() before inode->i_state clearing.
> Because conceptually mark_inode_dirty_sync() is IMO the right function to
> call. It will take care of clearing I_DIRTY_TIME flag (because we are
> setting I_DIRTY_SYNC), it will also not touch inode->i_io_list if the inode
> is queued for sync (I_SYNC_QUEUED is set in that case). The only problem
> with calling it was that it was called *after* clearing dirty bits from
> i_state... What do you think?

I like this patch far more, fwiw.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
