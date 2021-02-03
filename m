Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D1030DEA4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Feb 2021 16:50:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l7KPj-0005Tq-Oc; Wed, 03 Feb 2021 15:49:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1l7KPi-0005Tj-Oc
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Feb 2021 15:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uuvIatCMk+iu6Dn3ZTjBJYQ2r/DcUA+baf68VuW2eU0=; b=eJPex1ZDtXEFs4aLPEH1AhvRuK
 8uYexl81ojjWBUoR8qOOW2qQFXU5PXIxKm8eQuTHMRFt9MGkOPBRa/Lxy+mpvV0dQkoGg0HpziHsO
 5y1iAIxBvltipiuTpgtDlB776KMFtK7tO4TasgJR+VpScva47ibocOiqJ+/ZELcX1LM4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uuvIatCMk+iu6Dn3ZTjBJYQ2r/DcUA+baf68VuW2eU0=; b=R0uaGdlfjY7a/VHWhYFS/Wf4Tw
 wtOz2u5D33fMgGuYEeXMaTnTdG1yg5XmClISSBHDRGxJuT3Xomrzh2FoRM2fGaV+trnFu5IAsqjL/
 Qo+nVBqVmGeOl26xFXjCVwV7Vihu5yDnTRU3FtkTrZA9B90B6iEsXMr1g5FI83XnL8Cw=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l7KPa-001unY-Rp
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Feb 2021 15:49:54 +0000
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 113FnXoE016131
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 Feb 2021 10:49:34 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id B364015C39E2; Wed,  3 Feb 2021 10:49:33 -0500 (EST)
Date: Wed, 3 Feb 2021 10:49:33 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YBrGDQ0eDOfz/14r@mit.edu>
References: <20210109075903.208222-1-ebiggers@kernel.org>
 <20210111151517.GK18475@quack2.suse.cz>
 <X/y4s12YrXiUwWfN@sol.localdomain> <YBowmPPHfZUTBgz1@mit.edu>
 <YBozCMnv1BT8ZyXG@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YBozCMnv1BT8ZyXG@sol.localdomain>
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
X-Headers-End: 1l7KPa-001unY-Rp
Subject: Re: [f2fs-dev] [PATCH v2 00/12] lazytime fix and cleanups
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
Cc: Jan Kara <jack@suse.cz>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Feb 02, 2021 at 09:22:16PM -0800, Eric Biggers wrote:
> 
> I already sent out v3 of this series several weeks ago
> (https://lkml.kernel.org/r/20210112190253.64307-1-ebiggers@kernel.org),
> and Jan applied it already.

Great, thanks.  Sorry, I missed it.

       		       	 	- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
