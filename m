Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A733B4E453C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Mar 2022 18:37:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nWiRv-0008W0-AU; Tue, 22 Mar 2022 17:37:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <longman@redhat.com>) id 1nWiRu-0008Vt-2Y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Mar 2022 17:37:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7XRQWPJTa2nAm0XTHwZnMEHTKHif4VV7vwzt+VcrTSk=; b=WP6TwS0G+DlkqvyYB8cg9G07M2
 4BTkMcwHireZTY0paj1xj8dOcANB+pBHWDKJMxDoA1Gr0BTxu84BYs0/0AhLBSYAUV6k62OPyOeVu
 9Njt95of01kaUQlhw7+W1HUYAN7RyO+s7all31u0v65R193HaHCu9wJ/02K7otzYhFto=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7XRQWPJTa2nAm0XTHwZnMEHTKHif4VV7vwzt+VcrTSk=; b=CLPxzh/iHNcaDtlLkT0z6WAScz
 bcG7hzcZe9XpDercW9+dG/NMqnmenwZad5SnG4M6meJT3lzqyslQTKAkzMjE5YfKUWXO+zl7d9YfA
 1EVH2R49bnaQhV9Q0V1yPun0GlpXVZPjqLkgd5L5GtedmwJNUjZLeeLlkTeHkURczgF8=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nWiRr-008knF-Gn
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Mar 2022 17:37:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647970649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7XRQWPJTa2nAm0XTHwZnMEHTKHif4VV7vwzt+VcrTSk=;
 b=ewd55DkN9JhV78tpKu0aYsstzr7oRgQBbM7pqPPCnZ2uTClyHeKA2rAE1pLCeplB0IsxTa
 XRzAlg+m0YNm8m82MA+MLdOYxRiUUty6HxMcdmtaDcJjXoVa360bP14R8h23qHMrcMrSd9
 HXW6qcgQjg6ZNGvVBbSJA8qz43R6Wwk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-A0e0tYQ7NpOv-u0M9dblTQ-1; Tue, 22 Mar 2022 13:37:24 -0400
X-MC-Unique: A0e0tYQ7NpOv-u0M9dblTQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BA521029A87;
 Tue, 22 Mar 2022 17:37:24 +0000 (UTC)
Received: from [10.18.17.215] (dhcp-17-215.bos.redhat.com [10.18.17.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EE5D4029C6;
 Tue, 22 Mar 2022 17:37:24 +0000 (UTC)
Message-ID: <51cded74-3135-eed8-06d3-0b2165e3b379@redhat.com>
Date: Tue, 22 Mar 2022 13:37:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <YjjihIZuvZpUjaSs@google.com>
 <CAHk-=wgsmvoJFKFWxQ2orEVUOWH1agk9iUNZ=-DFh5OXZL=Ldw@mail.gmail.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <CAHk-=wgsmvoJFKFWxQ2orEVUOWH1agk9iUNZ=-DFh5OXZL=Ldw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Spam-Score: -1.0 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/22/22 13:22, Linus Torvalds wrote: > On Mon, Mar 21,
 2022 at 1:39 PM Jaegeuk Kim <jaegeuk@kernel.org> wrote: >> In this cycle,
 f2fs has some performance improvements for Android workloads such >> [...]
 Content analysis details:   (-1.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nWiRr-008knF-Gn
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/22/22 13:22, Linus Torvalds wrote:
> On Mon, Mar 21, 2022 at 1:39 PM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>> In this cycle, f2fs has some performance improvements for Android workloads such
>> as using read-unfair rwsems [...]
> I've pulled this, but that read-unfair rwsem code looks incredibly
> dodgy. Doing your own locking is always a bad sign, and it ahs
> traditionally come back to bite us pretty much every time. At least it
> uses real lock primitives, just in a really odd way.
>
> The whole notion of making an rwsem unfair to readers sounds really
> really odd.  I mean, the whole and only _point_ of an rwsem is to
> allow concurrent readers, and traditionally if it's unfair it's unfair
> to _writers_ because that tends to be better for throughput (but
> unfairness can cause horrible latency).
>
> So it smells like there's something bad going on in f2fs.
>
> That said, I'm adding Waiman to the cc here in case he would have
> ideas at least for a cleaner interface. Our rw_semaphores are
> explicitly trying to be fair, because unfairness (the other way) was
> such a big problem.
>
> I'm wondering it the optimistic read lock stealing is bothering f2fs?

I don't believe it is the optimistic read lock stealing code that is 
bothering f2fs.

AFAICS, the read-unfair rwsem code is created to resolve a potential 
lock starvation problem that they found on linux-5.10.y stable tree. I 
believe I have fixed that in the v5.11 kernel, see commit 2f06f702925 
("locking/rwsem: Prevent potential lock starvation"). However that 
commit is not in the stable tree. In fact, I have moved forward and 
taken out reader optimistic spinning but added just optimistic lock 
stealing instead. I believe the problem would have solved by including 
that patch series in their build. I haven't gotten any response as to 
whether they had tested this or not.

Apparently they prefer to upstream this stop-gap solution.

Cheers,
Longman



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
