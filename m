Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C7E148DCD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jan 2020 19:31:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iv3jh-0000Kc-6U; Fri, 24 Jan 2020 18:31:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <viro@ftp.linux.org.uk>) id 1iv3jf-0000KF-MY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 18:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/WLEg1m9kfC6ZJ507mX96SPdg1lNtEJFPo5i4esDCzE=; b=f5ZLtrk7BOtNBfJ7Zdh/4otLM
 Y2JBY/0zx8lXJY7iJ2OjppepYQD+0Dl+qto0m4X7fB+HPyrCVuf9vfkxaYpuVkjXBC+liOmWJqURn
 n4n/dj7ns5x3jPe0v4WYpJZmMDB+gRW79dte0eUDfwMKCI3hvWlQz5CJneLWIPahXsvUM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/WLEg1m9kfC6ZJ507mX96SPdg1lNtEJFPo5i4esDCzE=; b=e4Ogl3+gaR9Bd3bSG/9rX8La0L
 g9fmUSkuXrL7wyoc4qOROy1vh3Bytzg4Je0dnPnmwlQexBGyGE5lvo0It2nGus7DmRCaC6RbZA8lz
 BaihvIfTzwrIp4DGXLRoREMtx8UhdFfpdjeVkEHK2N4anOY0xKMrfUh+AvIeIvs3bsak=;
Received: from zeniv.linux.org.uk ([195.92.253.2])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iv3jd-00HHLt-P0
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jan 2020 18:31:15 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1iv3jT-00237c-6W; Fri, 24 Jan 2020 18:31:03 +0000
Date: Fri, 24 Jan 2020 18:31:03 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200124183103.GJ23230@ZenIV.linux.org.uk>
References: <20200124041234.159740-1-ebiggers@kernel.org>
 <20200124050423.GA31271@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200124051601.GB832@sol.localdomain>
 <20200124053415.GC31271@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200124054256.GC832@sol.localdomain>
 <20200124061525.GA2407@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20200124181253.GA41762@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124181253.GA41762@gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.92.253.2 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iv3jd-00HHLt-P0
Subject: Re: [f2fs-dev] [PATCH] ext4: fix race conditions in ->d_compare()
 and ->d_hash()
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
Cc: Daniel Rosenberg <drosen@google.com>, Gao Xiang <hsiangkao@aol.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 24, 2020 at 10:12:54AM -0800, Eric Biggers wrote:

> > Thanks for your web reference, I will look into it. I think there
> > is no worry about dentry->d_parent here because of this only one
> > dereference on dentry->d_parent.
> > 
> > You could ignore my words anyway, just my little thought though.
> > Other part of the patch is ok.
> > 
> 
> While that does make it really unlikely to cause a real-world problem, it's
> still undefined behavior to not properly annotate a data race, it would make the
> code harder to understand as there would be no indication that there's a data
> race, and it would confuse tools that try to automatically detect data races.
> So let's keep the READ_ONCE() on d_parent.

*nod*

Note that on everything except alpha it'll generate the same code, unless
the compiler screws up an generates multiple loads.  On alpha it adds
a barrier and I really don't want to sit down and check if its absense
could lead to anything unpleasant.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
