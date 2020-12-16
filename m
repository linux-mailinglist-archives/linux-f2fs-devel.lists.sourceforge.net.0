Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 212862DBDD0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Dec 2020 10:44:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpTLj-0001yX-89; Wed, 16 Dec 2020 09:43:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1kpTLh-0001y6-VW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Dec 2020 09:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wy5FLAZiJnyHzyf/bNy5QaGE9EJCI/Cy2YLJV0B9NdU=; b=Kn223oUtd4qUjY4OHR9xP0UhUV
 iDE4r0Gc5JIJ/3nvC8NPl67qkBfEjc3taH3vnt94i3ZhoWcrZwl3RW93cTD3UtPzeNfbyD6op4wer
 3r6m4EPqpjq6yrzsxjAxjLUmOd2iNzOgP9O3fghhc63QFyKNwUUU1h8YPOiRnD5x1D1A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wy5FLAZiJnyHzyf/bNy5QaGE9EJCI/Cy2YLJV0B9NdU=; b=Khb8uLstzFTBknfX2SqqN9u3IE
 nt6SEbIIqlELtKnSSwYwC3L0J1z5NQW4T5V2x12/pPUXRXkGrJT7nv14XHfUmcYaK3dSWOwSPiXzz
 O48yC9KuTWYHGfQm+GOFenBPb11puHCZaIrDiorIiGj73g+A+yJP7tsRJ+I6YpSaAGUA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kpTLa-00GDHR-IU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Dec 2020 09:43:57 +0000
Date: Wed, 16 Dec 2020 10:44:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1608111820;
 bh=660qYIfVRVWxXtwPu2TkAHoXad8Rf9XKFmlXmuCsho8=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=0tnZWtFCpBAZLTEQ9XwwxzAXFAreJS5H6KHnaGfzmhomc8gHAfsQ41HtoFWNDKcnr
 taR3qJMEhF64ppdPOM9kWon8p0FTMUVUD5LGyT/ZuHZ1pyqYyRRmXZbB1H8BvpnnYz
 w/TQd5m0fj+7wDROirot6+xXkNCVYukozOvNqvws=
From: Greg KH <gregkh@linuxfoundation.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X9nXCdp1ssMHKdNI@kroah.com>
References: <20201216091523.21411-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216091523.21411-1-yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kpTLa-00GDHR-IU
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix out-of-repair __setattr_copy()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 16, 2020 at 05:15:23PM +0800, Chao Yu wrote:
> __setattr_copy() was copied from setattr_copy() in fs/attr.c, there is
> two missing patches doesn't cover this inner function, fix it.
> 
> Commit 7fa294c8991c ("userns: Allow chown and setgid preservation")
> Commit 23adbe12ef7d ("fs,userns: Change inode_capable to capable_wrt_inode_uidgid")

Are these lines supposed to be "Fixes:" instead of "Commit "?

thanks,

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
