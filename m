Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC2315A15A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Feb 2020 07:34:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j1lbr-0007yA-Ug; Wed, 12 Feb 2020 06:34:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j1lbq-0007y2-D8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Feb 2020 06:34:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fjO3CKjzgbhDec3VmE/h7cQTzvhn7qgldujhYbFENeU=; b=IQXwc/Z9S2OSaEo7OJNHSc4IcA
 ATIJyJVN4NtL6p7CxfuNOFV1EA/dIvwR1UniZevpkjdA2uyDAZmv0PgAbSgpzo05xS/PWue+IjMYR
 U8MrSrIxhkhIyeYJGcyiucbh6BLBwg5cwFVcCPSsxwx5V8EBeb7b3YAY1e4pIMJsY7Xo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fjO3CKjzgbhDec3VmE/h7cQTzvhn7qgldujhYbFENeU=; b=L4TJL+/XA8+icg1EZ0wAlsOCwO
 0/E4T/PP7pXkTFeREMRfpcPmpgPVrGNk45jKlpOvxLDxOOTizgMpGrot16If9XlNYHk900hXDlGWS
 MD7tsACfSvAVXnl+cLTdXePL2E0PRkZ1o9kn0uHzmA5J1du0tS7+54kG1rI0Gw5m0baQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j1lbk-009JA9-F4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Feb 2020 06:34:54 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 53335206DB;
 Wed, 12 Feb 2020 06:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581489282;
 bh=CzRudUeDo+wVwa7/TNw7sOyO0DwUDMqITe6/PlMG8AQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d4g4lNmp0zgUEvD5Jg1HZ/pSYEOYUwWzEbd72XucSsanE7PW6E7KaMoizocCC9c/t
 fLsIxOWqbCUmHAYQrB/RRoUcW3yXF6qgwvTwkbZNe8+cBgUnJcRi5dGGEeKdxlXsX9
 ZfevMBE0eHrc3SnIROac5ZH1k6H9MTGLrsW4OB+M=
Date: Tue, 11 Feb 2020 22:34:40 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20200212063440.GL870@sol.localdomain>
References: <20200208013552.241832-1-drosen@google.com>
 <20200208013552.241832-3-drosen@google.com>
 <20200208021216.GE23230@ZenIV.linux.org.uk>
 <CA+PiJmTYbEA-hgrKwtp0jZXqsfYrzgogOZ0Pt=gTCtqhBfnqFA@mail.gmail.com>
 <20200210234207.GJ23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210234207.GJ23230@ZenIV.linux.org.uk>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.org.uk]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j1lbk-009JA9-F4
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
 Daniel Rosenberg <drosen@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Feb 10, 2020 at 11:42:07PM +0000, Al Viro wrote:
> On Mon, Feb 10, 2020 at 03:11:13PM -0800, Daniel Rosenberg wrote:
> > On Fri, Feb 7, 2020 at 6:12 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> > >
> > > On Fri, Feb 07, 2020 at 05:35:46PM -0800, Daniel Rosenberg wrote:
> > >
> > >
> > > Again, is that safe in case when the contents of the string str points to
> > > keeps changing under you?
> > 
> > I'm not sure what you mean. I thought it was safe to use the str and
> > len passed into d_compare. Even if it gets changed under RCU
> > conditions I thought there was some code to ensure that the name/len
> > pair passed in is consistent, and any other inconsistencies would get
> > caught by d_seq later. Are there unsafe code paths that can follow?
> 
> If you ever fetch the same byte twice, you might see different values.
> You need a fairly careful use of READ_ONCE() or equivalents to make
> sure that you don't get screwed over by that.
> 
> Sure, ->d_seq mismatch will throw the result out, but you need to make
> sure you won't oops/step on uninitialized memory/etc. in process.
> 
> It's not impossible to get right, but it's not trivial and you need all
> code working with that much more careful than normal for string handling.

It looks like this is a real problem, not just a "theoretical" data race.
For example, see:

utf8ncursor():
        /* The first byte of s may not be an utf8 continuation. */
        if (len > 0 && (*s & 0xC0) == 0x80)
                return -1;

and then utf8byte():
                } else if ((*u8c->s & 0xC0) == 0x80) {
                        /* This is a continuation of the current character. */
                        if (!u8c->p)
                                u8c->len--;
                        return (unsigned char)*u8c->s++;

The first byte of the string is checked in two different functions, so it's very
likely to be loaded twice.  In between, it could change from a non-continuation
byte to a continuation byte.  That would cause the string length to be
decremented from 0 to UINT_MAX.  Then utf8_strncasecmp() would run beyond the
bounds of the string until something happened to mismatch.

That's just an example that I found right away; there are probably more.

IMO, this needs to be fixed before anyone can actually use the ext4 and f2fs
casefolding stuff.

I don't know the best solution.  One option is to fix fs/unicode/ to handle
concurrently modified strings.  Another could be to see what it would take to
serialize lookups and renames for casefolded directories...

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
