Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D57D936DF47
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Apr 2021 20:58:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lbpOO-0006yR-H6; Wed, 28 Apr 2021 18:58:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <krisman@collabora.com>) id 1lbpOM-0006yJ-9s
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Apr 2021 18:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=33nOoXEl0vpbgOjMOKxhjMHfi2Fg+BLDYHSGppFBFGY=; b=WZsEFNMTpPEwX1fkjHPoCSZwpp
 p7ZXmVJvOtw8Kaz0tC5lq9PuV5YQ2xNavyZ8KmFZH1ZsPN0rhEIHEr38dOAN9h/GlE1as7/dsAKn+
 8gqvNG136NNYh6t7UDeE82TfLnb+1ZKVhqCRYeCdZo7ZeXWjEFpdlnqHTe3c3OTYwMAM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=33nOoXEl0vpbgOjMOKxhjMHfi2Fg+BLDYHSGppFBFGY=; b=d5jP5C82W6+WTrnNKBdJUXvhux
 IxlWGhVWCXI3kep1KWDJX/cn29AhgyBUK8ep5Otr1fI+9qhadOFfcu6kqFZF8ykX4l7ihRkj/Wzu9
 QtrnVMuzqyHe4U0Io8c2+tHYJISbN0jIzATN3E0FzGlsLQXrk7AuWfLHz5qn/B57V+1c=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lbpOI-00019q-7T
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Apr 2021 18:58:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 1284E1F415D1
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: "Theodore Ts'o" <tytso@mit.edu>
Organization: Collabora
References: <20210423205136.1015456-1-shreeya.patel@collabora.com>
 <20210423205136.1015456-5-shreeya.patel@collabora.com>
 <20210427062907.GA1564326@infradead.org>
 <61d85255-d23e-7016-7fb5-7ab0a6b4b39f@collabora.com>
 <YIgkvjdrJPjeoJH7@mit.edu> <87bl9z937q.fsf@collabora.com>
 <YIlta1Saw7dEBpfs@mit.edu>
Date: Wed, 28 Apr 2021 14:58:20 -0400
In-Reply-To: <YIlta1Saw7dEBpfs@mit.edu> (Theodore Ts'o's message of "Wed, 28
 Apr 2021 10:12:59 -0400")
Message-ID: <87mtti6xtf.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1lbpOI-00019q-7T
Subject: Re: [f2fs-dev] [PATCH v8 4/4] fs: unicode: Add utf8 module and a
 unicode layer
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
Cc: ebiggers@kernel.org, kernel@collabora.com, drosen@google.com,
 ebiggers@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 adilger.kernel@dilger.ca, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 andre.almeida@collabora.com, linux-ext4@vger.kernel.org,
 Shreeya Patel <shreeya.patel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

"Theodore Ts'o" <tytso@mit.edu> writes:

> On Tue, Apr 27, 2021 at 11:06:33AM -0400, Gabriel Krisman Bertazi wrote:
>> > I think the better argument to make is just one of simplicity;
>> > separating the Unicode data table from the kernel adds complexity.  It
>> > also reduces flexibility, since for use cases where it's actually
>> > _preferable_ to have Unicode functionality permanently built-in the
>> > kernel, we now force the use of some kind of initial ramdisk to load a
>> > module before the root file system (which might require Unicode
>> > support) could even be mounted.
>> 
>> FWIW, embedding FW images to the kernel is also well supported.  Making
>> the data trie a firmware doesn't make a ramdisk more of a requirement
>> than the module solution, I think.
>
> I don't think we support building firmware directly into the kernel
> any more.  We used to, but IIRC, there was the feeling that 99.99% of
> the time, firmware modules were not GPL compliant, and so we ripped
> out that support.

Support is still there on 5.12. See
Documentation/driver-api/firmware/built-in-fw.rst.

Personally, I use this feature very often on my development workflow,
for similar reasons to what you said below. In my case, avoiding the
complexity of initramfs but still being able to use my crappy
FW-dependent NIC card to boot from NFS. :)

> compiled as a module, which is convenient for those use cases, such as
> for example a mobile handset --- where there is no need for modules
> since the hardware doesn't change, and so modules and an initrd is
> just unnecessary complexity --- and firmware, which would make an
> initial ramdisk mandatory if you wanted to use the casefold feature.
>
> Put another way, the only reason why putting the unicode tables in a
> module is to make life easier for desktop distros.  For mobile
> handsets, modules are an anti-feature, which is why there was no call
> for supporting this initially, given the initial use case for the
> casefold feature.

What about support for firmware generation from the kernel tree and
installation to /lib/firmware? With a module, I can just call
modules_install, and dealing with modules is hardcoded in the mind of
every kernel developer.  Dealing with firmwares inside the kernel tree
is not common, and I didn't find an equivalent Makefile rule to build
and deploy firmwares on a path that firmware_loader knows about.

I think of firmware as code/data for a device, while modules is for the
kernel domain, even if it is a gross oversimplification.  Are there
other examples of firmware built from the kernel tree that are meant
exclusively to be used by the kernel, without hardware involvement?

For mobile devices, it wouldn't really matter whether it is built-in or
a firmware, right?  On a controlled environment like Android, you know
what to expect of your filesystem, so you know beforehand if your kernel
needs the table loaded (apart from sd cards.  Do people use ext4 for
sdcards in Android or is it all exfat?).  In those scenarios, you gain
very little by not making it built-in.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
