Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D016EE2CFB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Oct 2019 11:15:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iNZDh-00020q-Bu; Thu, 24 Oct 2019 09:15:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iNZDg-00020f-OV
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Oct 2019 09:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GDFzcU0RuFLvjn2Hvcm9o+K7MxK7KAAtDFSi4gav1vY=; b=HErLzkPXJ+3zalZ5UOJvrA0yXC
 EzOANUryqnXGxzdKyrxLgf7Xp6+6h3/QsW/M34yYQ6GUu9zM02KOcLrkADCCu1grcSV3nWlxGmGzB
 WXfRUeeTuPgFWcv4l+OicbbZbiulaKR4OEx7xuhnoVfgLBgwfHF7VLktiSW6cmUOomR4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GDFzcU0RuFLvjn2Hvcm9o+K7MxK7KAAtDFSi4gav1vY=; b=AdZQ/twFuv92WMPgKd6R6iD6m8
 JdykfYg8weXQ/ccPTr9EGg3Xcv8zcmSUFTi0752Yz3/conjBiq26cDpZx79UD5PS9RdqjyuKQkcJR
 gNVKdOMiHkvxGKm5rPyM1xD9qwiv1q1a/graNlCIF5g3jDXw8SwKYpoPu22WQ7N8yzTI=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iNZDf-001Mjf-EY
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Oct 2019 09:15:48 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 186384BD7B90497BB337;
 Thu, 24 Oct 2019 17:15:39 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 24 Oct
 2019 17:15:35 +0800
To: Hridya Valsaraju <hridya@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, <linux-f2fs-devel@lists.sourceforge.net>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20191023214821.107615-1-hridya@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <edc52873-b40d-5047-dba0-d693548eb16d@huawei.com>
Date: Thu, 24 Oct 2019 17:15:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191023214821.107615-1-hridya@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iNZDf-001Mjf-EY
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
Cc: kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/10/24 5:48, Hridya Valsaraju wrote:
> This patch merges the sysfs node documentation present in
> Documentation/filesystems/f2fs.txt and
> Documentation/ABI/testing/sysfs-fs-f2fs
> and deletes the duplicate information from
> Documentation/filesystems/f2fs.txt. This is to prevent having to update
> both files when a new sysfs node is added for f2fs.
> The patch also makes minor formatting changes to
> Documentation/ABI/testing/sysfs-fs-f2fs.

Jaegeuk, any particular reason to add duplicated description on f2fs.txt previously?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
