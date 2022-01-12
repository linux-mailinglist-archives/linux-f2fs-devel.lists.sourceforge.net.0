Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 053C248C6C6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Jan 2022 16:08:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n7fEb-0008Ob-M4; Wed, 12 Jan 2022 15:08:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <longman@redhat.com>) id 1n7fEa-0008OV-Ui
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Jan 2022 15:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wIsaeiGuSCkVHBbiFSlgQvB16Jlw+ZXtL+xJeRxkUSY=; b=GlttijEFGgRVfseCdE70D6fEut
 CauR1IxE1fR1gnq5fw0tjjHJ3ybNJ2cn2zzmAQb8eDBYsZ/aCjDcOuU0iLjxkdoebGUZYhDRw2D2z
 opdRQl+Q4hHsVDvZcNX2qYmvofX44lfKBwz35E0L3PoYCgoq5Yh+OkNCzduBwWEmFAgE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wIsaeiGuSCkVHBbiFSlgQvB16Jlw+ZXtL+xJeRxkUSY=; b=f8YhF41ttop8HYpS/xLLyEyC6a
 3iQS0omfRKLvUJQN/kmsJPpIDXgL1O0HdiJGZbFqRcWmyEUAEDx7TWG64XvFmDpLCREsn/ms8qQcz
 rBh9wNmuaScIuq57kTxveqN0XuKWRVEQ5Vv+M8a85XJknOTH/kvQEI25v+KU3vCMt9L0=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n7fEq-00DAbZ-Jl
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Jan 2022 15:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642000110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wIsaeiGuSCkVHBbiFSlgQvB16Jlw+ZXtL+xJeRxkUSY=;
 b=jSsIApVs2iJ+mQMrgPYi7B+PPn0Xki1xuZKX0Vq+3KIpDu5PljNd+0wmWXm4Pic9vIQAOu
 JVxAdj6Bp1U1A3DLg+rUkzWCRwuvL2ekakUjqgJamIkdZ3IBGwE0yB9B9y2u9ygbGxsYU+
 ue9cSAFCCP9zRlToKPPyvle66oWe5IM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-bpTCFuRDMDGM_PFejjfqQw-1; Wed, 12 Jan 2022 10:08:26 -0500
X-MC-Unique: bpTCFuRDMDGM_PFejjfqQw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 640B4801B0C;
 Wed, 12 Jan 2022 15:08:25 +0000 (UTC)
Received: from [10.22.10.195] (unknown [10.22.10.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03B4279A29;
 Wed, 12 Jan 2022 15:08:18 +0000 (UTC)
Message-ID: <fd02584d-03d7-f27b-c11c-6ed1f212f03c@redhat.com>
Date: Wed, 12 Jan 2022 10:08:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220108164617.3130175-1-jaegeuk@kernel.org>
 <YdvoxkAAquI17UbX@infradead.org>
 <a23a3226-95d9-9835-c1c7-2d13f4a1ee16@redhat.com>
 <CAEe=SxnWeK0pSfijPKJSTxBiMgD1Ev69fV3qSTCgWASk0b3vhA@mail.gmail.com>
 <9efbbcb7-29cd-a8ab-0632-01986edc862f@redhat.com>
 <CAEe=Sx=C8e7=A6ziy8dYC+FvkWvVYZ+o=XMCP_4vX0efsUPT4Q@mail.gmail.com>
 <86891228-9c91-09f1-0e2d-0a3392649d52@redhat.com>
 <Yd25SWaqEDSpR1vO@google.com>
 <4a2352a9-42b4-56cd-423a-825faffcd801@redhat.com>
 <Yd4f49lhnC7+vvAm@google.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <Yd4f49lhnC7+vvAm@google.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Spam-Score: -3.6 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/11/22 19:25, Jaegeuk Kim wrote: > On 01/11, Waiman Long
 wrote: >> >> v5.10 kernel still have reader optimistic spinning enabled in
 rwsem which >> may have worsen the writer wait time. Could you t [...] 
 Content analysis details:   (-3.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [170.10.133.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1n7fEq-00DAbZ-Jl
Subject: Re: [f2fs-dev] [PATCH] f2fs: move f2fs to use reader-unfair rwsems
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
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Tim Murray <timmurray@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/11/22 19:25, Jaegeuk Kim wrote:
> On 01/11, Waiman Long wrote:
>>
>> v5.10 kernel still have reader optimistic spinning enabled in rwsem which
>> may have worsen the writer wait time. Could you try with a more up-to-date
>> kernel or backport the relevant rwsem patches into your test kernel to see
>> how much it can help?
> We're using https://android.googlesource.com/kernel/common/+/refs/heads/android12-5.10.
> By any chance, may I ask which upstream patches we need to backport?
>
I am referring to the following commits:

617f3ef95177 locking/rwsem: Remove reader optimistic spinning
1a728dff855a locking/rwsem: Enable reader optimistic lock stealing
2f06f702925b locking/rwsem: Prevent potential lock starvation
c8fe8b056438 locking/rwsem: Pass the current atomic count to 
rwsem_down_read_slowpath()

To apply cleanly on top of 5.10.y, you will also need the followings:

c995e638ccbb locking/rwsem: Fold __down_{read,write}*()
285c61aedf6b locking/rwsem: Introduce rwsem_write_trylock()
3379116a0ca9 locking/rwsem: Better collate rwsem_read_trylock()

Reading the commit log of 2f06f702925b ("locking/rwsem: Prevent 
potential lock starvation"), I realize that writer lock starvation is 
possible in the f2fs case. That can explain why there was a worst case 
lock wait time of 9.7s.

I believe that you will see a big improvement by applying those upstream 
commits. In hindsight, I think I should have put a "Fixes" tag in that 
commit.

>>
>>>> Anyway, AFAICS, this patch keeps readers out of the rwsem wait queue and so
>>>> only writers can go into it. We can make an unfair rwsem to give preference
>>>> to writers in the wait queue and wake up readers only if there is no more
>>>> writers in the wait queue or even in the optimistic spinning queue. That
>>>> should achieve the same effect as this patch.
>>> Can we get a patch for the variant to test a bit? Meanwhile, I think we can
>>> merge this patch to add a wraper first and switches to it later?
>> Give me a week or so and I can make a RFC patch to support unfair rwsem for
>> you to try out. You do need to try it on the latest kernel, though.
> Thank you so much. My thought flow is applying this in f2fs for all the old
> kernels shipped in Android devices. Then, we can try to backport upstream
> rwsem patches and yours to switch finally. Let me know if you have any concern.

Assuming that Tr is the worst case reader lock hold time with a single 
writer, I believe the worst case writer lock wait time should be about 
2*Tr with the above commits applied. Introducing a unfair rwsem option 
will reduce that to just Tr. So try this out by applying the above 
upstream commits to see if they can meet your requirement as you may not 
really need an unfair rwsem option.

Cheers,
Longman



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
