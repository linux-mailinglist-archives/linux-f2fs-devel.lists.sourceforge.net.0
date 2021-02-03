Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8CA30D2D1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Feb 2021 06:17:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l7AXY-0001fs-JM; Wed, 03 Feb 2021 05:17:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1l7AXV-0001fj-Ev
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Feb 2021 05:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C/7go9fcBY/rpT0lHBcAmO850/XHywfyeP56eau9ZKA=; b=XXkDg7DklpK1KEv5nI7mKpDUs1
 uGxGEdVwz1p6J332Hm9iQxvBRdeDUPxMY4yMcoyQ1DmFuQSKDFs44i8zei1NzeOvk7EKzjkbkQgG6
 XitHrZijzVuzIHmQqme9SIEE6sKPEr2np0qpgbFG3/85/AI9O4iA8TAm48ojWp3WLfAM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C/7go9fcBY/rpT0lHBcAmO850/XHywfyeP56eau9ZKA=; b=XyyQby9DAOhHPKWJ654gzfjcdS
 6VpBPmC1tIzk8UugIhSdgfCiPTpVkTGlw9/hfS4xWY742wAi9LkD37nSUMt6Po6nl64bs+IbaZzCB
 NMQSNKjFIjKSxntnHoAovqL4k9cWdAAVl2h4JWlVrrGT7DRufSqsU+TW1Ib3DBfkYtP8=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l7AXK-000K8H-AE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Feb 2021 05:17:17 +0000
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 1135GvnR020171
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 Feb 2021 00:16:58 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 80C2F15C39E2; Wed,  3 Feb 2021 00:16:57 -0500 (EST)
Date: Wed, 3 Feb 2021 00:16:57 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YBoxyQIdqRQT3jX5@mit.edu>
References: <20210109075903.208222-1-ebiggers@kernel.org>
 <20210109075903.208222-12-ebiggers@kernel.org>
 <20210111105342.GE2502@lst.de> <X/yzzKhysdFUY/6o@sol.localdomain>
 <20210112132521.GB13780@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210112132521.GB13780@lst.de>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [18.9.28.11 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [18.9.28.11 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1l7AXK-000K8H-AE
Subject: Re: [f2fs-dev] [PATCH v2 11/12] ext4: simplify i_state checks in
 __ext4_update_other_inode_time()
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jan 12, 2021 at 02:25:21PM +0100, Christoph Hellwig wrote:
> > We could add:
> > 
> > 	static inline bool other_inode_has_dirtytime(struct inode *inode)
> > 	{
> > 		return (inode->state & (I_FREEING | I_WILL_FREE |
> > 					I_NEW | I_DIRTY_TIME)) == I_DIRTY_TIME;
> > 	}
> > 
> > But it seems a bit weird when it's specific to ext4 at the moment.
> > 
> > Are you thinking that other filesystems will implement the same sort of
> > opportunistic update, so we should add the helper now?
> 
> For my taste these checks for flags is way too much black magic and will
> trivially break when people add new flags.  So having a helper next to
> the definition of the I_* flags that is well documented would be very,
> very helpful.  My preferred naming would be something along the lines
> of 'inode_is_dirty_lazytime_only()'.

The name makes sense to me.  I'm not sure it's likely that there will
be new types of dirtiness --- as near I can tell the I_DIRTY_TIME was
the first time there has been any changes in a _really_ long time, but
I agree that how the flags interact (even before we added
I_DIRTY_TIME) involved no small amount of black magic, and it's the
kind of thing that requires deep meditation before trying to make any
changes, and then immediately slips out of one's L1 cache very shortly
afterwards.  :-)

					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
