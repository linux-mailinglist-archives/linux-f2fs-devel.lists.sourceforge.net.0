Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F122C1BDF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Nov 2020 04:12:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1khOkz-0005Op-CL; Tue, 24 Nov 2020 03:12:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1khOky-0005Oh-Ey
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Nov 2020 03:12:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OcyH2/0ClC1O6nkYHZAgvDHCsFl19G4dmGGYuCwZaZg=; b=e305ouLybGrZOM3Tch2WoR4sMF
 B/JB8J5hTKHf2kehGZvKATSpoPZtuiaMUUqdKQo5iblkk0MtbKekMBxXy33YkP3OaiHuGesogWQEz
 E0LUcr2xY8vtY86874ISdJ4svzsmVcOma8i5H1+M6NztlpwPP8sQX3pwM50m1UXdZmAs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OcyH2/0ClC1O6nkYHZAgvDHCsFl19G4dmGGYuCwZaZg=; b=Jh9S3YPqqHueS2B7eylHozsMjS
 VCIIoH2JF/MoBzxi549JhiVxbcO93V/GFN9G9jToQ/+s5EXYFVCXsInDuDU5GRox7PgUcROqK2109
 6j/oc9b7gdiJfCzEceJZEkCpak6iwTN8Tvz3tWVwe2hB4XG4p3Wqt+VSINA83CbcBoEk=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1khOko-00CbN2-Kr
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Nov 2020 03:12:40 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cg8Fd4zNjzhdMV;
 Tue, 24 Nov 2020 11:12:05 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 24 Nov
 2020 11:12:14 +0800
To: David Laight <David.Laight@ACULAB.COM>, 'Sahitya Tummala'
 <stummala@codeaurora.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
References: <1606109312-1944-1-git-send-email-stummala@codeaurora.org>
 <7f5213fb9b334d1290f019ab8ed6ee71@AcuMS.aculab.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <a1b9a134-97a8-6fb7-2fdc-d4de91dff849@huawei.com>
Date: Tue, 24 Nov 2020 11:12:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <7f5213fb9b334d1290f019ab8ed6ee71@AcuMS.aculab.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1khOko-00CbN2-Kr
Subject: Re: [f2fs-dev] [PATCH] f2fs: change to use rwsem for cp_mutex
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/11/24 1:05, David Laight wrote:
> From: Sahitya Tummala
>> Sent: 23 November 2020 05:29
>>
>> Use rwsem to ensure serialization of the callers and to avoid
>> starvation of high priority tasks, when the system is under
>> heavy IO workload.
> 
> I can't see any read lock requests.
> 
> So why the change?

Hi David,

You can check the context of this patch in below link:

https://lore.kernel.org/linux-f2fs-devel/8e094021b958f9fe01df1183a2677882@codeaurora.org/T/#t

BTW, the root cause here is that mutex lock won't serialize callers, so there
could be potential starvation problem when this lock is always grabbed by high
priority tasks.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
