Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB2B213BA3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Jul 2020 16:14:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jrMS6-0003qu-5B; Fri, 03 Jul 2020 14:14:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1jrMS4-0003qn-Ug
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jul 2020 14:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u+gpTnkYAnNsVZQwtMPSe0ZFnSOa/OUqPW48RJAccnM=; b=h9GXFJZE9XQpnUm/f53gIHEMo5
 Nx0aTL9BRb9ra2t7UAUO7Q3JGuhAfbqx0McBAzUqwmpXvsc7Df2ZHpnjiYjzXbayY/9nSEk7hQ9jl
 5np6HUttriJ66H2FKuvdT0ez8Rz5fknrek9mSsE9vVEkHMKsgJhGoi2i3i+YAu67mm2w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u+gpTnkYAnNsVZQwtMPSe0ZFnSOa/OUqPW48RJAccnM=; b=apCHH6apdRaAhAcOuX2StwGZsI
 QuHiMWXMPHHiHPVEa2cU+tbgJr8RHp7OOzn+aUpYgryPa5YvzNjMqj82sjnMeV2zi9IAfcTVf9wJk
 4OjjMHY/85ihOM1RDUrrgss/NB84zQKIahpTtuqUrB5MFqEsjPKAAyCtctQMaKgmP+xs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jrMS3-00C136-Mx
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jul 2020 14:14:04 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F1D46206BE;
 Fri,  3 Jul 2020 14:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593785636;
 bh=PsIKumf3rYwghoEYKnSPlB30VQJPntaNJu+MX4yG8zU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wz2RQlj56qd9dwtqd+LeV7sedWyVH2ZPMf1HK2LvrTbdZ/TkJjSZboqSrWkT3CbsY
 M/j5gN40UqBhZTJdjMBXNnwzN+hZ6ZA3JraAyIADJHmIi8shJNlL5uXryraYIwSYKv
 kfDYLyjG0YPFnDAzP/3JXd/j7j2aSBwvyL0O26Hg=
Date: Fri, 3 Jul 2020 16:13:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20200703141359.GA2953162@kroah.com>
References: <20200703065420.3544269-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703065420.3544269-1-daeho43@gmail.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jrMS3-00C136-Mx
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add symbolic link to kobject in
 sysfs
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 03, 2020 at 03:54:20PM +0900, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added a symbolic link to directory of sysfs. It will
> create a symbolic link such as "mount_0" and "mount_1" to
> each f2fs mount in the order of mounting filesystem. But
> once one mount point was umounted, that sequential number
> @x in "mount_@x" could be reused by later newly mounted
> point. It will provide easy access to sysfs node even if
> not knowing the specific device node name like sda19 and
> dm-3.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  Documentation/filesystems/f2fs.rst | 13 ++++++++++++-

No Documentation/ABI/ entry for your new sysfs file/link?

And what does this help with?

If it's really needed, why don't we do this for all filesystem types?

thanks,

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
