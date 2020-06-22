Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF7E203DBB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jun 2020 19:22:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jnQ9I-0002h1-P5; Mon, 22 Jun 2020 17:22:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <corbet@lwn.net>) id 1jnQ9G-0002gt-PE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jun 2020 17:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bJHBspBZ6QaoOryujB8ktlOOZD5dtQKEx9sM1l5qWj4=; b=e3Sua6iTzlKzKX5XNHuBqB3+fV
 M3VTyhX8ViW8mIxYkBgC1eGXi/hgwH2V9IxuTT6CTL9/UA5dBnvYaQZqdoCZP9yJf07d4I6INGsOj
 vjhDRQ7l3QgUygxvDfOOAKQL9eb0OiuWeIVVvSiLyBkReTcnV9WXGYCFwMkw2PlmqLvU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bJHBspBZ6QaoOryujB8ktlOOZD5dtQKEx9sM1l5qWj4=; b=k03F653HH5a+IJrw6K85/duyKd
 T45ajEsnEdRhOx8qb0/EjAavKwaurdRt5BLfvSL4nlGOF2OV3W125OEwPHnYTusdPnOsWmnQw3BnU
 tBd86zArxHi1O4NIAd4WQFPFdglQ6QfWcFyEOI9QIcqfB3ysO3fyJtXMKKYHOAy0HxoQ=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jnQ9F-00C8W0-BF
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jun 2020 17:22:22 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 202052C8;
 Mon, 22 Jun 2020 17:22:10 +0000 (UTC)
Date: Mon, 22 Jun 2020 11:22:09 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200622112209.71990f9c@lwn.net>
In-Reply-To: <20200622171106.GA192855@gmail.com>
References: <20200622073907.7608a73a@lwn.net>
 <20200622171106.GA192855@gmail.com>
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
X-Headers-End: 1jnQ9F-00C8W0-BF
Subject: Re: [f2fs-dev] [PATCH] docs: f2fs: fix a broken table
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-doc@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 22 Jun 2020 10:11:06 -0700
Eric Biggers <ebiggers@kernel.org> wrote:

> Someone already sent out a fix for this:
> https://lkml.kernel.org/linux-doc/52f851cb5c9fd2ecae97deec7e168e66b8c295c3.1591137229.git.mchehab+huawei@kernel.org/
> 
> Is it intentional that you're sending out a different fix rather than applying
> that one?

It wasn't, actually, I'm just finding myself more than usually challenged
these days.

That said, removing the table entirely seems ... excessive.  It's not
terrible the way it is, or we could make it:

	test_dummy_encryption[=%s]

if we really want to.

jon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
