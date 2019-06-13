Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB47C432EF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Jun 2019 08:21:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hbJ6Z-0000FZ-91; Thu, 13 Jun 2019 06:20:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hbJ6Y-0000FP-1D
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 06:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n1RCMk85eNKqmeHxue8sDL3dYUAV+aiOn87uR0P4nLk=; b=W5fd8dmiSFjcvWCCPhZV2czBak
 YKFA6yfSHBoxaqjmmrOjDhCR6Fa5XeuEZfG6cAezke6+xTtdVDgiqjvuMMmNurhqMrlBeYWlw5AMo
 Ile2m7ehnqyV34S7/O6/UeeLRrvxjesdWEWR9/4DZpSC+C1PjGIZp61o0ze85rBqYW1g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n1RCMk85eNKqmeHxue8sDL3dYUAV+aiOn87uR0P4nLk=; b=OEvjlmNP2wbqnwb6HN/18dDHrd
 6KkQ3gtPs3egJTjIM+BIN+qodmD94i5r/qtLySZsVpGh8OV4Jo+vXV0yi85hRvHGiEdac9GV47W/e
 6gwT1jv/caZNbcwEEV4KE5NTB8Sct5BsBOthNqrG6+AchaKTXDx27Lb0ZwzcAv2vyPCc=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hbJ6U-00B9y1-I0
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 06:20:56 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 075ACC0A727863C1FC1C;
 Thu, 13 Jun 2019 14:20:46 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 13 Jun
 2019 14:20:42 +0800
To: Eric Biggers <ebiggers@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20190605055904.4039-1-ebiggers@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <ac9370d1-82a2-bb8a-4d9d-fe2e763df789@huawei.com>
Date: Thu, 13 Jun 2019 14:20:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190605055904.4039-1-ebiggers@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hbJ6U-00B9y1-I0
Subject: Re: [f2fs-dev] [PATCH] f2fs: separate f2fs i_flags from fs_flags
 and ext4 i_flags
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
Cc: linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/6/5 13:59, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> f2fs copied all the on-disk i_flags from ext4, and along with it the
> assumption that the on-disk i_flags are the same as the bits used by
> FS_IOC_GETFLAGS and FS_IOC_SETFLAGS.  This is problematic because
> reserving an on-disk inode flag in either filesystem's i_flags or in
> these ioctls effectively reserves it in all the other places too.  In
> fact, most of the "f2fs i_flags" are not used by f2fs at all.
> 
> Fix this by separating f2fs's i_flags from the ioctl bits and ext4's
> i_flags.
> 
> In the process, un-reserve all "f2fs i_flags" that aren't actually
> supported by f2fs.  This included various flags that were not settable
> at all, as well as various flags that were settable by FS_IOC_SETFLAGS
> but didn't actually do anything.
> 
> There's a slight chance we'll need to add some flag(s) back to
> FS_IOC_SETFLAGS in order to avoid breaking users who expect f2fs to
> accept some random flag(s).  But hopefully such users don't exist.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good to me, thanks for cleaning all mess up. :)

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
