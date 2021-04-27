Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE79736C800
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Apr 2021 16:51:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lbP3h-00071z-89; Tue, 27 Apr 2021 14:51:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1lbP3f-00071g-GE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Apr 2021 14:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UnT4CJY9ZLJ7zJ4fjzJr8R000OvDpcKdSoQ/bE4+OIE=; b=fDqnizps9kg6fMYAniUvRG4Lug
 at0N8vRelSrR2k7t6T2fmC8BcnGJFfWAwZ3W3dnD/nzU+60QnLWkPjmZO/+1cFOpolsuGE+U6GwYg
 hjiS7iHvi2FyXRe8dS0ysflPBa6HQbhGNzGHRv8XQf5UP7DyXH86Zm87mJghGtQ+gp70=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UnT4CJY9ZLJ7zJ4fjzJr8R000OvDpcKdSoQ/bE4+OIE=; b=Y//PmCdu0yeW34b5T90Y8GM26v
 su0Ep/tKzBWEszTRScbKWrkVeZXjkBDEoThnNk5Z3zua26D4UIhJU9Tx4OY3JdZ+IauTgMFRHLb7T
 poDEShxFuKZTvs7+esB/hrV4eXPGDuzeIhJV00uQcQ8ZEtoM9tIlao17Pu3YCV41v2MY=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lbP3a-0003wc-CM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Apr 2021 14:51:27 +0000
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 13REodsq024119
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 10:50:39 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 0737815C3C3D; Tue, 27 Apr 2021 10:50:39 -0400 (EDT)
Date: Tue, 27 Apr 2021 10:50:38 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Shreeya Patel <shreeya.patel@collabora.com>
Message-ID: <YIgkvjdrJPjeoJH7@mit.edu>
References: <20210423205136.1015456-1-shreeya.patel@collabora.com>
 <20210423205136.1015456-5-shreeya.patel@collabora.com>
 <20210427062907.GA1564326@infradead.org>
 <61d85255-d23e-7016-7fb5-7ab0a6b4b39f@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61d85255-d23e-7016-7fb5-7ab0a6b4b39f@collabora.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lbP3a-0003wc-CM
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
 andre.almeida@collabora.com, linux-ext4@vger.kernel.org, krisman@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 27, 2021 at 03:39:15PM +0530, Shreeya Patel wrote:
> > > Hence, make UTF-8 encoding loadable by converting it into a module and
> > > also add built-in UTF-8 support option for compiling it into the
> > > kernel whenever required by the filesystem.
> > The way this is implemement looks rather awkward.

I think that's a bit awkard is the trying to create an abstraction
separation between the unicode and utf8 layers, just in case, at some
point, we want fs/unicode to support more than just utf8.

I think we're better off being opinionated here, and say that the only
unicode encoding that will be supported by the kernel is UTF-8.
Period.  In which case, we don't need to try to insert this unneeded
abstraction layer.

If you really want to make make fs/unicode support more than one
encoding --- say, UTF-16LE, as used by NTFS --- at that point we can
think about what the abstractions should look like.  For example, it
doesn't _actually_ make sense for the data-trie structures to be part
of the utf-8 encoding.  The normalization tables are for Unicode, and
it wouldn't make sense for UTF-16 to have its own normalization
tables, bloating the kernel even more.

It *is* true that the normalization tables have been optimized for
utf-8, because that's what the whole world actually uses; utf-16le is
really a legacy use case.  So presumably, we would probably find a way
to code up the utf-16 functions in a way that used the utf-8 data
tables, even if it wasn't 100% optimal in terms of speed.

But it's probably not worth it at this point.

> > Given that the large memory usage is for a data table and not for code,
> > why not treat is as a firmware blob and load it using request_firmware?
> 
> utf8 module not just has the data table but also has some kernel code.
> The big part that we are trying to keep out of the kernel is a tree
> structure that gets traversed based on a key that is the file name.
> This is done when issuing a lookup in the filesystem, which has to be very
> fast. So maybe it would not be so good to use request_firmware for
> such a core feature.

Speed really isn't a great argument here; the request_firmware is
something that would only need to be done once, when a file system
which requires Unicode normalization and/or case-folding is mounted.

I think the better argument to make is just one of simplicity;
separating the Unicode data table from the kernel adds complexity.  It
also reduces flexibility, since for use cases where it's actually
_preferable_ to have Unicode functionality permanently built-in the
kernel, we now force the use of some kind of initial ramdisk to load a
module before the root file system (which might require Unicode
support) could even be mounted.

The argument *for* making the Unicode table be a loadable firmware is
that it might make it possible to upgrade to a newer version of
Unicode without needing to do a kernel recompile.  On average, Unicode
relases a new to support new character sets every year or so, or when
there Japanese Emperor requiring a new reign name :-).  Usually the
new character sets are for obscure ancient alphabets, and so it's
really not a big deal if the kernel doesn't support, say,
Chorasmian[1] or Dives Akuru[2].  Perhaps people would make a much
bigger deal about new Emoji characters, or new code points for the
Creative Commons symbols.  I'm personally not excited enough to claim
that it's worth the extra complexity, but some people might think so.  :-)

[1] used in Central Asia across Uzbekistan, Kazakhstan, and
Turkmenistan to write an extinct Eastern Iranian language.

[2] historically used in the Maldives until the 20th century.

Of course, using those new Emoji symbols in file names would reduce
portability of that file system if Strict Normalization was mandated.
Fortunately, ext4 and f2fs don't enable strict normalizaation by
default, which is also good, because it means if we don't have the
latest Unicode update in the kernel, it doesn't really matter that
much.... again, not worth the extra complexity/headache IMHO.

Cheers,

					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
