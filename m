Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8998E6D8B9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jul 2019 04:01:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hoIDQ-0002xO-Cb; Fri, 19 Jul 2019 02:01:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hoIDN-0002xB-Gl
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jul 2019 02:01:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TssCGOlneL6blW5L2MkGUuI1FojzwLzT66ZAavmYXNg=; b=MERQYvo7E+fY4OGJHWYpEBawqu
 5E6VKsIFjh4pBPC0jC+7jMRzRHsSv92vDaSk9cBT1O54UMhiri9Oe+MjBHBgvH1vchXb0e3fBnLEa
 FNNbOj4GqdL4ayAMl8eSRA5DNpefxEDMQBxpTlsyhwmQT/MffdJOOA1pRYjd2gufr2vw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TssCGOlneL6blW5L2MkGUuI1FojzwLzT66ZAavmYXNg=; b=PjiwiebQwu3TI/OYdgrxb0X1lp
 S5QeBSk0/2St2lQ0GeG25hKTpCcfdOAZjah1AAsgYXqjJa0lCquilwfwahVM/CJ2dSGcGEFBSgoYF
 UgU+jyyZlAM3xRSDBgvQkZQ4MsHIJ8+dUKZP2q7G5fDQ6Aj8rC1UnDk+5+QPx9JGWZAg=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hoIDJ-006OmQ-Ro
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jul 2019 02:01:41 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id EEFA8E4162363BA56F5F;
 Fri, 19 Jul 2019 10:01:30 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul
 2019 10:01:26 +0800
To: Daniel Rosenberg <drosen@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20190717031408.114104-1-drosen@google.com>
 <20190717031408.114104-3-drosen@google.com>
 <cbaf59d4-0bd3-6980-4750-fbab14941bdb@huawei.com>
 <4ef17922-d1e9-1b83-9e89-d332ea6fb7ae@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <8f1c8f28-9afa-94b0-05b2-12df71db201c@huawei.com>
Date: Fri, 19 Jul 2019 10:01:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <4ef17922-d1e9-1b83-9e89-d332ea6fb7ae@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hoIDJ-006OmQ-Ro
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: Support case-insensitive file
 name lookups
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
Cc: linux-fsdevel@vger.kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/7/19 5:31, Daniel Rosenberg wrote:
> 
> On 7/17/19 3:11 AM, Chao Yu wrote:
>> We need to add one more entry f2fs_fsflags_map[] to map F2FS_CASEFOLD_FL to
>> FS_CASEFOLD_FL correctly and adapt F2FS_GETTABLE_FS_FL/F2FS_SETTABLE_FS_FL as well.
> 
> I don't see FS_CASEFOLD_FL. It would make sense for it to exist, but unless it's in some recent patch I don't think that's currently in the kernel. Or are you suggesting adding it in this patch?

Yeah, I think we can use a separated patch to propose uplifting the flag to a
common one in fs.h, and then adjust
f2fs_fsflags_map/F2FS_GETTABLE_FS_FL/F2FS_SETTABLE_FS_FL mapping. Otherwise we
will fail to set CASEFOLD flag to inode.

Thanks,

> 
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
