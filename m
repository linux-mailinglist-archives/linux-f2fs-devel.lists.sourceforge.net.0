Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D9A2FF99C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jan 2021 01:56:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l2kk1-0008Qx-Fn; Fri, 22 Jan 2021 00:55:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1l2kk0-0008Qk-AN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jan 2021 00:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B/xfxbM1r7+H+ADA7G0A/6FrvNpe1RmIpDFD2XkJLv8=; b=E+L0BE1CJ+BRxiOyOQne9AwmpJ
 5r888Qo8DcE4vN2EEtZkNdsC46Sml0kzIv0/lorVxn4Ff31fMpreEgUrpoteZ2TLzM6RappWpbfwi
 I1xso59jHMJRxaf58ErPfZZVJPEU6bXd/mJ/kguFduezpeRMNIEM9SiY5GNhQrqbCJV4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B/xfxbM1r7+H+ADA7G0A/6FrvNpe1RmIpDFD2XkJLv8=; b=fkqQA9Rrvse+glzlCNCk0jOdFO
 W1XjC+vDK8yksvmvWlVL02XsrZpaWhJthlC/atsgDo++peWZsrfZVtadh1Zyhasy74hWPLFLv2/1I
 v+X3n3rvRMh+xZgvr8xjGrh/LI0vjyLhK03ImplIDMiL0MFO0L2z88/Clfwx6cAY1VMc=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l2kjs-00CAgw-EZ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jan 2021 00:55:56 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DMLPF0bx9zl8J2;
 Fri, 22 Jan 2021 08:54:09 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 22 Jan
 2021 08:55:31 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20210121134529.1201249-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <6e4996f8-fdf0-93dd-8253-9e8f5e6fca06@huawei.com>
Date: Fri, 22 Jan 2021 08:55:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210121134529.1201249-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1l2kjs-00CAgw-EZ
Subject: Re: [f2fs-dev] [PATCH v5 1/2] f2fs: introduce checkpoint=merge
 mount option
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
Cc: Sungjong Seo <sj1557.seo@samsung.com>, Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If there is no update in v5, it will be better to include my Reviewed-by
tag, please note that. :)

Thanks,

On 2021/1/21 21:45, Daeho Jeong wrote:
> From: Daeho Jeong<daehojeong@google.com>
> 
> We've added a new mount option "checkpoint=merge", which creates a
> kernel daemon and makes it to merge concurrent checkpoint requests as
> much as possible to eliminate redundant checkpoint issues. Plus, we
> can eliminate the sluggish issue caused by slow checkpoint operation
> when the checkpoint is done in a process context in a cgroup having
> low i/o budget and cpu shares. To make this do better, we set the
> default i/o priority of the kernel daemon to "3", to give one higher
> priority than other kernel threads. The below verification result
> explains this.
> The basic idea has come fromhttps://opensource.samsung.com.
> 
> [Verification]
> Android Pixel Device(ARM64, 7GB RAM, 256GB UFS)
> Create two I/O cgroups (fg w/ weight 100, bg w/ wight 20)
> Set "strict_guarantees" to "1" in BFQ tunables
> 
> In "fg" cgroup,
> - thread A => trigger 1000 checkpoint operations
>    "for i in `seq 1 1000`; do touch test_dir1/file; fsync test_dir1;
>     done"
> - thread B => gererating async. I/O
>    "fio --rw=write --numjobs=1 --bs=128k --runtime=3600 --time_based=1
>         --filename=test_img --name=test"
> 
> In "bg" cgroup,
> - thread C => trigger repeated checkpoint operations
>    "echo $$ > /dev/blkio/bg/tasks; while true; do touch test_dir2/file;
>     fsync test_dir2; done"
> 
> We've measured thread A's execution time.
> 
> [ w/o patch ]
> Elapsed Time: Avg. 68 seconds
> [ w/  patch ]
> Elapsed Time: Avg. 48 seconds
> 
> Signed-off-by: Daeho Jeong<daehojeong@google.com>
> Signed-off-by: Sungjong Seo<sj1557.seo@samsung.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
