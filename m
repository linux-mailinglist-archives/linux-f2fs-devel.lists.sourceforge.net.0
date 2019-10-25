Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB421E53C4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Oct 2019 20:23:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iO4FJ-00079Y-HA; Fri, 25 Oct 2019 18:23:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iO4FI-00079N-PS
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Oct 2019 18:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FZ/o1EUhXq5708Rr3H4nGzV2xNz4+5P0g4kUEgeiB6U=; b=Og7NGPqRKc6FIGSe0HLSX6FqkR
 B8fm4ELu7TZhVpJ+DrpPFlvfv9PHMmu+HAvB0hLOICNR1gXe7x8o1dTqPWwkBfgt/4Ik9t6NZmy2V
 TO3e9axLQRnSKO9b/2+4XK4agAxtK/L4ywdA3whozOfsKBqq92ivlVL5zWQlMFPlEwZQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FZ/o1EUhXq5708Rr3H4nGzV2xNz4+5P0g4kUEgeiB6U=; b=SFtA7CJ3dpjHOL1fw9WjjF2fHI
 7oFzlitZ1dcsg+M4ia1cdGWSo8Et/3si8MpEZxu175PFxd0ygGW7NtzFrWpyPjcewztbYGP9AeGO1
 vfKxbG23xP9dcw1i+UhZfZTgCElb669noSGdDkL92diXmObe7NtyxLlQYZkAwqLyACCU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iO4FH-003Spb-Nl
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Oct 2019 18:23:32 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 04A8321D7F;
 Fri, 25 Oct 2019 18:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572027806;
 bh=lLUWKlQSw6cbzfOx3ssw4CYUi+NPKxNn4RqhHEiesBU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ucTsJj1G3pBPc/qY/XwGEJUUh6jlAWOHfUj3edhnIoMnHpchOhy1PrE7ozqZTNFii
 JTGEvWlaWo4sxjaoyB07fYuu+AZCqVvtdgm1tOJNpypBYY6GN3yLkYtSxNkllWAr2X
 pVWj/FbNRXHX87yF94rTpuuwbWIJprwsOSpzNBN4=
Date: Fri, 25 Oct 2019 11:23:25 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20191025182325.GC24183@jaegeuk-macbookpro.roam.corp.google.com>
References: <20191023214821.107615-1-hridya@google.com>
 <edc52873-b40d-5047-dba0-d693548eb16d@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <edc52873-b40d-5047-dba0-d693548eb16d@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iO4FH-003Spb-Nl
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: delete duplicate information on
 sysfs nodes
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
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Hridya Valsaraju <hridya@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/24, Chao Yu wrote:
> On 2019/10/24 5:48, Hridya Valsaraju wrote:
> > This patch merges the sysfs node documentation present in
> > Documentation/filesystems/f2fs.txt and
> > Documentation/ABI/testing/sysfs-fs-f2fs
> > and deletes the duplicate information from
> > Documentation/filesystems/f2fs.txt. This is to prevent having to update
> > both files when a new sysfs node is added for f2fs.
> > The patch also makes minor formatting changes to
> > Documentation/ABI/testing/sysfs-fs-f2fs.
> 
> Jaegeuk, any particular reason to add duplicated description on f2fs.txt previously?

Not at all, thus, I asked Hridya to consolidate them. :P

> 
> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
