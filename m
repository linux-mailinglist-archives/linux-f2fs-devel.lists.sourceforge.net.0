Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E074E5921
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Mar 2022 20:28:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nX6f4-0006Sj-T9; Wed, 23 Mar 2022 19:28:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <longman@redhat.com>) id 1nX6f3-0006SZ-Eg
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 19:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1BxydPwtCIAbFGiK7PPwmV0E1KM4yb30F0xyHFE5Tbk=; b=A3Ho32nfgrwu6StfbdV1XxCmdZ
 t4xXC9Y+HsQezEIBch1XkTEqQSGy2Q97extIinASMgtilu0XiLZRZFuZFMXn48CtP3DKKO1spUEWt
 bPh6GftUIc5SGFrufLEIU2iYsigo9WmBjm5TRn32lHNLSRmt51far7Ks96moVOuUmnkc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1BxydPwtCIAbFGiK7PPwmV0E1KM4yb30F0xyHFE5Tbk=; b=Q+D1gFr/0Bx7txe+KI9IZpcIcK
 cOdcbOWCNQh20fvjwfJ1Cx+tQDmkiOpo4NarQRcey0dwoiZDveh2ROTLSnHC8cZ+eKLHLONIWXd93
 UmFgJB4raClG2l9klg8a1B76wLrUi95Chp2GbLQf5C0R5Y3JA2logSe4z+NAMeU238kw=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nX6et-0005Md-W6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 19:28:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648063713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1BxydPwtCIAbFGiK7PPwmV0E1KM4yb30F0xyHFE5Tbk=;
 b=PnHI9heqHXgsLCsIb2zl7qmsM7qc70kJlJ2gS+1fuB7iYwlUTjxbhYIzAQKw0E2Hbp4BFU
 UVpWCAiGBQKizRyHzwyvVN4HHZai3PUA7ASZIA+EIcLzGE+kJOxYyVTo1hHHVb66KOL0Hj
 ud0+izHRjYcVM1bZCA9q+9l96AQeluA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-X2yUEWyfOoOHcOqFVi1J1A-1; Wed, 23 Mar 2022 15:28:27 -0400
X-MC-Unique: X2yUEWyfOoOHcOqFVi1J1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E39EC38008B5;
 Wed, 23 Mar 2022 19:28:26 +0000 (UTC)
Received: from [10.22.35.45] (unknown [10.22.35.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A25E52166B4C;
 Wed, 23 Mar 2022 19:28:26 +0000 (UTC)
Message-ID: <5acaaf61-5419-178d-c805-62f979697653@redhat.com>
Date: Wed, 23 Mar 2022 15:28:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Christoph Hellwig <hch@infradead.org>
References: <YjjihIZuvZpUjaSs@google.com>
 <CAHk-=wgsmvoJFKFWxQ2orEVUOWH1agk9iUNZ=-DFh5OXZL=Ldw@mail.gmail.com>
 <YjrNRpbo/i3tgbAA@infradead.org> <YjtPUec8jiqUXGuf@google.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <YjtPUec8jiqUXGuf@google.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/23/22 12:48, Jaegeuk Kim wrote: > On 03/23, Christoph
 Hellwig wrote: >> On Tue, Mar 22, 2022 at 10:22:50AM -0700, Linus Torvalds
 wrote: >>> On Mon, Mar 21, 2022 at 1:39 PM Jaegeuk Kim <jaegeuk@ke [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
X-Headers-End: 1nX6et-0005Md-W6
Subject: Re: [f2fs-dev] [GIT PULL] f2fs for 5.18
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/23/22 12:48, Jaegeuk Kim wrote:
> On 03/23, Christoph Hellwig wrote:
>> On Tue, Mar 22, 2022 at 10:22:50AM -0700, Linus Torvalds wrote:
>>> On Mon, Mar 21, 2022 at 1:39 PM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>>>> In this cycle, f2fs has some performance improvements for Android workloads such
>>>> as using read-unfair rwsems [...]
>>> I've pulled this, but that read-unfair rwsem code looks incredibly
>>> dodgy. Doing your own locking is always a bad sign, and it ahs
>>> traditionally come back to bite us pretty much every time. At least it
>>> uses real lock primitives, just in a really odd way.
>> FYI, Peter and I both pointed this out when the patches were posted
>> and NAKed the patch, but the feedback was ignored.
> Christoph, I proposed,
>
> "I've been waiting for a generic solution as suggested here. Until then, I'd like
> to keep this in f2fs *only* in order to ship the fix in products. Once there's
> a right fix, let me drop or revise this patch again."
>
> https://lore.kernel.org/linux-f2fs-devel/YhZzV11+BlgI1PBd@google.com/
>
I suspect f2fs may also need the 617f3ef95177 ("locking/rwsem: Remove 
reader optimistic spinning") to give higher priority to writer. Please 
let me know the test result when you are able to test v5.15 LTS to see 
if these commits are able to address the f2fs issue.

I have some ideas of making a reader-unfair rwsem, but that requires 
either the introduction of a set of new down_read() variants or keeping 
the unfair state in the rwsem itself. I would like to make sure that 
there is really a need for such a thing before working on it.

Cheers,
Longman




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
