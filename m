Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C23E5214F61
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  5 Jul 2020 22:35:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jsBMa-00030M-Ps; Sun, 05 Jul 2020 20:35:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <corbet@lwn.net>) id 1jsBMZ-00030E-V7
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jul 2020 20:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QUf/5hPL5MNJyjRYebrAhPwPUnEr4V6Tco5KAn4B3O4=; b=X0/tHYhDd2emJANgvdqwmMjR2k
 +Kb351ajTLHvDyHX+9ogqJvimzdSo4bDAejx4hvKlemJ1IZmDo7ncqW5lznv5bH372PaPW8/XBhaD
 UZ/WbLQOvZ2jic2xd7gNgF9XprSSw7quXH8Kr9HgXHfB0BM9Ap1R3VzFxC0/TGVfYRXo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QUf/5hPL5MNJyjRYebrAhPwPUnEr4V6Tco5KAn4B3O4=; b=bfM/PmZSDo7rVFqxmqJuoLXuc9
 xEVybifBj/sGR2aeGdp8ss2ZOF76Rpe0vWvB7TC4ictw4wkASTmATn2QLPyKcsFlK3A6gY8cG8OWo
 DrWo2usgnSkmmZC82gFyUNBZViSwv/TcbJl4zOXZXZHjgITABf68EK5/A42IoeV8fbUQ=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jsBMY-00ED6x-FT
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jul 2020 20:35:47 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id DE4F0739;
 Sun,  5 Jul 2020 20:35:38 +0000 (UTC)
Date: Sun, 5 Jul 2020 14:35:37 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Eric Sandeen <sandeen@redhat.com>
Message-ID: <20200705143537.68055b16@lwn.net>
In-Reply-To: <c8271324-9132-388c-5242-d7699f011892@redhat.com>
References: <c8271324-9132-388c-5242-d7699f011892@redhat.com>
Organization: LWN.net
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [45.79.88.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jsBMY-00ED6x-FT
Subject: Re: [f2fs-dev] [PATCH] doc: cgroup: add f2fs and xfs to supported
 list for writeback
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
Cc: linux-xfs <linux-xfs@vger.kernel.org>, linux-mm@kvack.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 29 Jun 2020 14:08:09 -0500
Eric Sandeen <sandeen@redhat.com> wrote:

> f2fs and xfs have both added support for cgroup writeback:
> 
> 578c647 f2fs: implement cgroup writeback support
> adfb5fb xfs: implement cgroup aware writeback
> 
> so add them to the supported list in the docs.
> 
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>
> ---
> 
> TBH I wonder about the wisdom of having this detail in
> the doc, as it apparently gets missed quite often ...

Good question, but as long as it's there it might as well be correct;
applied, thanks.

jon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
