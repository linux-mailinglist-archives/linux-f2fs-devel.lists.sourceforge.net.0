Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF162C40E5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Nov 2020 14:09:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1khuY7-0006Hg-QP; Wed, 25 Nov 2020 13:09:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1khuY6-0006HW-OZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Nov 2020 13:09:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wCJRRp0K1xVBYnPLLsaAQKWw98Ye4+26A8piSTi3UeA=; b=R2YcRVMASIjm/O6iJknWnk4a/b
 vtEyYFGiQd8DSoqgu7jM3qIKDvkDvxELQY0kkgL6lT8vg4XWSqJO+5UPGNgljqhPNKAS25VUkyI2o
 c+ylKJi/XNtJKu3+dIl/JuYjHXsjvH/YRJ3BLQd2WFz96aBEXW6GCuCbqeWVrrAbPOx4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wCJRRp0K1xVBYnPLLsaAQKWw98Ye4+26A8piSTi3UeA=; b=Jb3SElG8gOEsa1SgXnTu6MblgR
 xaC3XCFUpsbAXMeb7gdzliXOgfnIkn6sh/KtvQn7NCFlhcB/dugHJDWPhDkMyY18DviNbEz3ja6LY
 99gClZ8Cusfz3qmg/6/xMrD8p6GC5fqVfJeO7VYMWoQ2cL5wDEKi0kAaFAgxmpN7Riqk=;
Received: from m42-4.mailgun.net ([69.72.42.4])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1khuXy-00Eyuy-V6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Nov 2020 13:09:30 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606309763; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=wCJRRp0K1xVBYnPLLsaAQKWw98Ye4+26A8piSTi3UeA=;
 b=SUUqKcogbpeibmxxBbLBSs4wWu/ng9SqH9IDF36FhXkL/183VzO6cgTdAWivDpZezTxYoezn
 8biQAni42FLCU29o71qjBc1umQZq8dcpALFrDtOO1JxRYSHrxpH2R4MqOsMW6KaRTq2WhK1y
 V+v0TatS4HHbDAqafUVZ58WdYZw=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5fbe576aeb04c0016097e8fb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 25 Nov 2020 13:08:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A9C88C43464; Wed, 25 Nov 2020 13:08:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0CE36C433ED;
 Wed, 25 Nov 2020 13:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0CE36C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=stummala@codeaurora.org
Date: Wed, 25 Nov 2020 18:38:51 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20201125130851.GA22157@codeaurora.org>
References: <1606109312-1944-1-git-send-email-stummala@codeaurora.org>
 <7f5213fb9b334d1290f019ab8ed6ee71@AcuMS.aculab.com>
 <a1b9a134-97a8-6fb7-2fdc-d4de91dff849@huawei.com>
 <effbe4f5edaf4d45a64d12c65e0dc6b0@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <effbe4f5edaf4d45a64d12c65e0dc6b0@AcuMS.aculab.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [69.72.42.4 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [69.72.42.4 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1khuXy-00Eyuy-V6
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi David,

On Tue, Nov 24, 2020 at 09:12:12AM +0000, David Laight wrote:
> From: Chao Yu
> > Sent: 24 November 2020 03:12
> > 
> > On 2020/11/24 1:05, David Laight wrote:
> > > From: Sahitya Tummala
> > >> Sent: 23 November 2020 05:29
> > >>
> > >> Use rwsem to ensure serialization of the callers and to avoid
> > >> starvation of high priority tasks, when the system is under
> > >> heavy IO workload.
> > >
> > > I can't see any read lock requests.
> > >
> > > So why the change?
> > 
> > Hi David,
> > 
> > You can check the context of this patch in below link:
> > 
> > https://lore.kernel.org/linux-f2fs-devel/8e094021b958f9fe01df1183a2677882@codeaurora.org/T/#t
> > 
> > BTW, the root cause here is that mutex lock won't serialize callers, so there
> > could be potential starvation problem when this lock is always grabbed by high
> > priority tasks.
> 
> That doesn't seem right.
> 
> If I read the above correctly it was high priority tasks that were
> being 'starved' precisely because mutex lock serializes wakers.

Actually it can happen for any random task irrespective of the priority.
In my case, I was observing that the thread that went to sleep first is
not able to acquire the lock first and other new threads that came in
just around the mutex unlock time were acquiring the lock.

> 
> If you have a lock that is contended so much that it is held 100%
> of the time you need a different locking strategy.
> 
> IIRC mutex locks are 'ticket' locks so that only one thread is woken
> each time the mutex is released, and they are woken in the order
> they went to sleep.

AFAIK mutex locks doesn't *strictly* enforce FIFO order. The lock is released
before waking the first waiting task. The waiting task has to run to claim
the lock. So the lock is available for other tasks in this *short* window.

Thanks,

> 
> While this behaviour might not be the one you want, relying on
> rwsem (which might happen currently to work differently) doesn't
> seem the correct long term fix.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
