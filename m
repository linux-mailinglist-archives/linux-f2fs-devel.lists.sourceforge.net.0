Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 815C8158644
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Feb 2020 00:42:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j1Ih4-0000Rp-UT; Mon, 10 Feb 2020 23:42:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <viro@ftp.linux.org.uk>) id 1j1Ih3-0000RM-6S
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Feb 2020 23:42:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zh/RztX/8oDfh+jXW0R+NP4WqX/kaOpXeIwx7w4PrVQ=; b=Q/9IshEGE+HZ4dWooHjbOZ6SJ
 7C46o8hHRUSGysX4nCkLlTxzoveCgQW9GYGBdwFLLpBeLUJg9X1Qc+zXgJaHI48j7zdeIADIjruUQ
 gqogTC91ttdNnsEb9sljvKakgoIK51rDE0fdLySi86UQ/A/E9iPkgOTuz9kfpM4ehZHbM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zh/RztX/8oDfh+jXW0R+NP4WqX/kaOpXeIwx7w4PrVQ=; b=MAVZKqwDv/hnnDIl2EX8KXPFng
 I1Ua50NOLa5cA6eNp0fNun76nVAbHQzrl3bbYi181+i9gOCXPKbSjYY6nelgFEg1Mlm1vGTrPUs4P
 8a7L/s03QznnKwm6D2y4WLGgZXXDmtDbZJJ6GZTrbzzSd8xwTzD4GN+i8lyIpEXcHas4=;
Received: from zeniv.linux.org.uk ([195.92.253.2])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j1Ih1-0081KA-DM
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Feb 2020 23:42:21 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1j1Igp-00AcMq-LS; Mon, 10 Feb 2020 23:42:07 +0000
Date: Mon, 10 Feb 2020 23:42:07 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200210234207.GJ23230@ZenIV.linux.org.uk>
References: <20200208013552.241832-1-drosen@google.com>
 <20200208013552.241832-3-drosen@google.com>
 <20200208021216.GE23230@ZenIV.linux.org.uk>
 <CA+PiJmTYbEA-hgrKwtp0jZXqsfYrzgogOZ0Pt=gTCtqhBfnqFA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+PiJmTYbEA-hgrKwtp0jZXqsfYrzgogOZ0Pt=gTCtqhBfnqFA@mail.gmail.com>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.92.253.2 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1j1Ih1-0081KA-DM
Subject: Re: [f2fs-dev] [PATCH v7 2/8] fs: Add standard casefolding support
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
Cc: kernel-team@android.com, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Feb 10, 2020 at 03:11:13PM -0800, Daniel Rosenberg wrote:
> On Fri, Feb 7, 2020 at 6:12 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > On Fri, Feb 07, 2020 at 05:35:46PM -0800, Daniel Rosenberg wrote:
> >
> >
> > Again, is that safe in case when the contents of the string str points to
> > keeps changing under you?
> 
> I'm not sure what you mean. I thought it was safe to use the str and
> len passed into d_compare. Even if it gets changed under RCU
> conditions I thought there was some code to ensure that the name/len
> pair passed in is consistent, and any other inconsistencies would get
> caught by d_seq later. Are there unsafe code paths that can follow?

If you ever fetch the same byte twice, you might see different values.
You need a fairly careful use of READ_ONCE() or equivalents to make
sure that you don't get screwed over by that.

Sure, ->d_seq mismatch will throw the result out, but you need to make
sure you won't oops/step on uninitialized memory/etc. in process.

It's not impossible to get right, but it's not trivial and you need all
code working with that much more careful than normal for string handling.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
