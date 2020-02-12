Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FAE15A175
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Feb 2020 07:57:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j1lxx-00087v-QC; Wed, 12 Feb 2020 06:57:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j1lxx-00087k-4s
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Feb 2020 06:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u4DmAKm4rZNkyHENtR850C9P9HJTn6T4/a1y7JduOTg=; b=b+0pL7j8qvSeYsRi1vYVp3xp5k
 uq3JZa1dskD7cVIGqU0UZs4V1s0vY5RREGyOpqPIohpFNKvJ4wB0o6KVEtU1wkO4L7Hfh6MDu60/3
 el4APYsnS9xH+qFPqlXK/GFRp9PI1eNH7SEzoOuvSCpHnmw8E2HZidgXDpNx3h8u3RXc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u4DmAKm4rZNkyHENtR850C9P9HJTn6T4/a1y7JduOTg=; b=VaaMhzfuPL6CP04AC87tidDWJn
 TnHtFsX1knE6CT4Dyzr6WM8IuzSJ6FQg72D2a2hqL8CO24Fw0IQLlbsA/eta3nd/Lchqxd/wfT5ho
 UVZilU/H1M0mK4fuKURuLnUsyFkTsUK5oeMUemDrwAcK77v/MLhoXbjOzfhgyQrT2w8Y=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j1lxv-009JvY-TC
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Feb 2020 06:57:45 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E34E22073C;
 Wed, 12 Feb 2020 06:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581490656;
 bh=19SiagyBycCgiJZF31FnbdIK3NQ4MFyvHwRPT//W9JE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h+dAaEROsZffCQMVY8G50cRWmHjM/wRDc/9JlSSWDsBr6/IAgHBKtnX222ZTx5Q2Q
 H77nJ9ax+MWcXCxYZ+7U/B4M3oavH5FuxwsoOg4BTYZI36prcxXHdxlvNgfXkOy/lv
 avaF1djrLaSPyjJTb1dEC5HGal0mzJPA5odqCW9M=
Date: Tue, 11 Feb 2020 22:57:34 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20200212065734.GA157327@sol.localdomain>
References: <20200208013552.241832-1-drosen@google.com>
 <20200208013552.241832-3-drosen@google.com>
 <20200208021216.GE23230@ZenIV.linux.org.uk>
 <CA+PiJmTYbEA-hgrKwtp0jZXqsfYrzgogOZ0Pt=gTCtqhBfnqFA@mail.gmail.com>
 <20200210234207.GJ23230@ZenIV.linux.org.uk>
 <20200212063440.GL870@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212063440.GL870@sol.localdomain>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.org.uk]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j1lxv-009JvY-TC
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

On Tue, Feb 11, 2020 at 10:34:40PM -0800, Eric Biggers wrote:
> On Mon, Feb 10, 2020 at 11:42:07PM +0000, Al Viro wrote:
> > On Mon, Feb 10, 2020 at 03:11:13PM -0800, Daniel Rosenberg wrote:
> > > On Fri, Feb 7, 2020 at 6:12 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> > > >
> > > > On Fri, Feb 07, 2020 at 05:35:46PM -0800, Daniel Rosenberg wrote:
> > > >
> > > >
> > > > Again, is that safe in case when the contents of the string str points to
> > > > keeps changing under you?
> > > 
> > > I'm not sure what you mean. I thought it was safe to use the str and
> > > len passed into d_compare. Even if it gets changed under RCU
> > > conditions I thought there was some code to ensure that the name/len
> > > pair passed in is consistent, and any other inconsistencies would get
> > > caught by d_seq later. Are there unsafe code paths that can follow?
> > 
> > If you ever fetch the same byte twice, you might see different values.
> > You need a fairly careful use of READ_ONCE() or equivalents to make
> > sure that you don't get screwed over by that.
> > 
> > Sure, ->d_seq mismatch will throw the result out, but you need to make
> > sure you won't oops/step on uninitialized memory/etc. in process.
> > 
> > It's not impossible to get right, but it's not trivial and you need all
> > code working with that much more careful than normal for string handling.
> 
> It looks like this is a real problem, not just a "theoretical" data race.
> For example, see:
> 
> utf8ncursor():
>         /* The first byte of s may not be an utf8 continuation. */
>         if (len > 0 && (*s & 0xC0) == 0x80)
>                 return -1;
> 
> and then utf8byte():
>                 } else if ((*u8c->s & 0xC0) == 0x80) {
>                         /* This is a continuation of the current character. */
>                         if (!u8c->p)
>                                 u8c->len--;
>                         return (unsigned char)*u8c->s++;
> 
> The first byte of the string is checked in two different functions, so it's very
> likely to be loaded twice.  In between, it could change from a non-continuation
> byte to a continuation byte.  That would cause the string length to be
> decremented from 0 to UINT_MAX.  Then utf8_strncasecmp() would run beyond the
> bounds of the string until something happened to mismatch.
> 
> That's just an example that I found right away; there are probably more.
> 
> IMO, this needs to be fixed before anyone can actually use the ext4 and f2fs
> casefolding stuff.
> 
> I don't know the best solution.  One option is to fix fs/unicode/ to handle
> concurrently modified strings.  Another could be to see what it would take to
> serialize lookups and renames for casefolded directories...
> 

Or (just throwing another idea out there) the dentry's name could be copied to a
temporary buffer in ->d_compare().  The simplest version would be:

	u8 _name[NAME_MAX];

	memcpy(_name, name, len);
	name = _name;

Though, 255 bytes is a bit large for a stack buffer (so for long names it may
need kmalloc with GFP_ATOMIC), and technically it would need a special version
of memcpy() to be guaranteed safe from compiler optimizations (though I expect
this would work in practice).

Alternatively, take_dentry_name_snapshot() kind of does this already, except
that it takes a dentry and not a (name, len) pair.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
