Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A4F3DDED9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Aug 2021 20:04:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mAcIG-0000zn-I4; Mon, 02 Aug 2021 18:04:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1mAcIF-0000zh-EG
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Aug 2021 18:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pQIWDGP9a0rhAC9UG6X6wi+nYPn1YEkcLjzQtEoPIo0=; b=G9N7375rjKIWN6hGjBBw+it/Q5
 xekc+8eFuuAAPUD6EY8abuMrbayNL8Alrwxs+6GeVRwCdfV/cVik0EDHoUaxj/0fS6Te3kWyzR61a
 OTe0Pns0Fzw5qDRwGf0s33FqyR+d9oGwzmCC+NgTouCJweBwqLcc8k5EhMM+w+H1xofg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pQIWDGP9a0rhAC9UG6X6wi+nYPn1YEkcLjzQtEoPIo0=; b=E2zxfknvb8SC3FAh2vcntkG7df
 +xp4wBeLZaVGrkeKEQtLl5qL9wTcPqwMYgVMfGsJDKaIr8E5sfHR0Ou0apMoDOYYuNN2qFbVo2hMZ
 PTDkw35kdMzNxB+ytUZUWRXS67iYUsPcER4st+RKLG+5/+bAIONnVOGdvw4O0HyerTes=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mAcID-00ASdj-SN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Aug 2021 18:04:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5418360F51;
 Mon,  2 Aug 2021 18:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627927436;
 bh=lTMHKpuQuKT3SAkLzzKq9A7yZ9z33kMa3cREBEPph/Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IKsQ/MxE3IMEJr7tj0WH6znzJGoVVtYVPVKrJtKNyvPZQOYS8QTpgQS0tIFDTs79N
 HTeUSB89LKM6zdu0IkYHDEZjVrNw00677BAHZm1yxuKgjL81AEinp2l+EqDA4LAqTP
 Y2Hv/EzQBXddSgZRpKb/yBJHHzfh1vlDFNsEto+bY/8zxVkS/vymDbFNAB0oELOSUV
 qhSAVMAWimLJe46bwhNHRwN62fN3YJy9z35nTnkT2I3Fb6tT1NNkh7Dy1oWOyvKFDy
 Ht4PZgGbwoQHCpMr0CEGSIjENHgfrb7qrinq5WtDSQeVgE/bB3fAMGSBhgKXl4JDvm
 N0OrdaB3j1eaw==
Date: Mon, 2 Aug 2021 11:03:54 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YQgziuikMr0fvlT7@google.com>
References: <20210707015815.1978-1-chao@kernel.org>
 <YQRQ4kHvdRTBnb10@google.com>
 <51565c85-a475-bcb8-bbb2-e3125c5223a3@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51565c85-a475-bcb8-bbb2-e3125c5223a3@kernel.org>
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mAcID-00ASdj-SN
Subject: Re: [f2fs-dev] [RFC NO MERGE] f2fs: extent cache: support unaligned
 extent
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/01, Chao Yu wrote:
> On 2021/7/31 3:20, Jaegeuk Kim wrote:
> > On 07/07, Chao Yu wrote:
> > > Currently, it only works in readonly format f2fs image.
> 
> There wouldn't be any race condition because unaligned extent only works
> for ro feature now?

Isn't your patch proposing on writable partition?

> 
> > Is there any race condition between the address in extent_cache and the one in
> > dnode? I feel that we could synchronize it by locking its dnode block.
> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
