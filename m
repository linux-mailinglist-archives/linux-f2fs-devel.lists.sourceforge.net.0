Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D8B204967
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jun 2020 07:58:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jnbwi-0006Qo-Ao; Tue, 23 Jun 2020 05:58:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mchehab+huawei@kernel.org>) id 1jnbwh-0006Qh-6x
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Jun 2020 05:58:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j2m5ohLbtZ1mvRbVasGQ9L6Y3yHQpT/yNKGksQno8wY=; b=cqihwAawWM3COcpcP5tMYPPLFt
 eGObkVoZC/JOTyCuQ6WL5CTYSjhSQ2uJNpVM0XwOkx+zbDTAEQamfMcGmYKgeIHKFs6JoFxFmJq4O
 aBV+2b9tZW0VqGgU4ItTsMTKj+AojrWzbxikytSGdWJKhQ8s1IqQunsRyQuWioOFuAk0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j2m5ohLbtZ1mvRbVasGQ9L6Y3yHQpT/yNKGksQno8wY=; b=O1DnUjOoyetrRi7TjK/28mgs7I
 5t+QEJMC1ERYRfLkZsOJjT9r7KynAt/p2EIRQ62yGQeTEqzV+LfgTrB5wqmCtTtgzIaCzHyh0jqwS
 6lvIktL2ohmgFXU3ReQBauOnmd2WtsspQ2/XJ+5MwYUZQFZcbCZtfdT6/5b2DqakX4N0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jnbwf-00EpZl-Ih
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Jun 2020 05:58:10 +0000
Received: from coco.lan (unknown [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC79420771;
 Tue, 23 Jun 2020 05:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592891879;
 bh=EfflRxj25NuPu89Qp7zFoEN+RP1nGLfWlSv3BKJ7o5Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rXGvdonrD5hEQkEz9LbQof80d8YnLVIDTJ4Orxg1gdqGCf/e4WAsC4OcCEstQOPhT
 K+QVNya8zcZF3jBBTjD6o5Ig7WPjAjnaRD6zS9ArNg6Wkl+LRyqu5VhT/7i56VtWtk
 bGHs40qB1sp1IPzsmH+YcwQbJs8P1Mkn/mnfQFEg=
Date: Tue, 23 Jun 2020 07:57:54 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Message-ID: <20200623075754.093c476d@coco.lan>
In-Reply-To: <20200622112209.71990f9c@lwn.net>
References: <20200622073907.7608a73a@lwn.net>
 <20200622171106.GA192855@gmail.com>
 <20200622112209.71990f9c@lwn.net>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jnbwf-00EpZl-Ih
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
 LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Em Mon, 22 Jun 2020 11:22:09 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Mon, 22 Jun 2020 10:11:06 -0700
> Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > Someone already sent out a fix for this:
> > https://lkml.kernel.org/linux-doc/52f851cb5c9fd2ecae97deec7e168e66b8c295c3.1591137229.git.mchehab+huawei@kernel.org/

No problem from my side.

> > 
> > Is it intentional that you're sending out a different fix rather than applying
> > that one?  
> 
> It wasn't, actually, I'm just finding myself more than usually challenged
> these days.
> 
> That said, removing the table entirely seems ... excessive.  It's not
> terrible the way it is, or we could make it:

Jon,

I actually tried a patch close to yours before the patch I actually sent
upstream.

On my previous version, I was doing:

======================== =======================================================
...
test_dummy_encryption
test_dummy_encryption=%s Enable dummy encryption, which provides a fake fscrypt
			 context. The fake fscrypt context is used by xfstests.
			 The argument may be either "v1" or "v2", in order to
			 select the corresponding fscrypt policy version.
...
======================== =======================================================

The problem with the above is that Sphinx understood the first line as one row,
and the second one as a different one. So, the HTML output would be like:

<table>
...
<tr><td>test_dummy_encryption</td></tr>
<tr><td>test_dummy_encryption=%s</td>
<td>Enable dummy encryption, which provides a fake fscrypt
    context. The fake fscrypt context is used by xfstests.
    The argument may be either "v1" or "v2", in order to
    select the corresponding fscrypt policy version.</td>
</tr>

(e. g. it would look like the first parameter lacks description)

Which is not the intended result. I was unable to identify a way 
to teach Sphinx that the second line was a continuation of the
first (A ReST equivalent to placing a \ at the end of a line).

Still, the html output with the above is not that bad, and it should be clear
for readers that the description of the second parameter is also valid for the
first.


Thanks,
Mauro


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
