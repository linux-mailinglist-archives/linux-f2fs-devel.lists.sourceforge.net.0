Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B90681E92FD
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 May 2020 19:59:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jf5la-0006aR-If; Sat, 30 May 2020 17:59:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <viro@ftp.linux.org.uk>) id 1jf5lY-0006Zs-K6
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 May 2020 17:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I4Sl+k52E/CqXyjyic29wBCN4bpKoi5wMYDvduKAFNw=; b=QczUUmoC8g09fntmqPf8pimNg
 u+gsDamk65cCVYMurdPLTYPycqi8KYFrjS99Br2fL3fqXsg4b+u1xpyGi5OOXH6fCMRU21ow7sT7L
 A6OwvEB3XqiDf39faMWO70jMmY53sf+uJx8ML6pANgqHP37uSi8zXZs1Mx9RdkqYRXAeE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I4Sl+k52E/CqXyjyic29wBCN4bpKoi5wMYDvduKAFNw=; b=ClsWKUvE/xaJiIHrI3CMv3++x0
 2szJp6DMPN4f3cbSjoqX5IRZXN2wSl9XGuMWckVxvOSXYKah/UYeunmUhvVgCI11Q15rlBXf93Os6
 INMFkg/8lzlkDYKhrL9oH8MRgBoqDIkRq3JwB2/uy2R3+2KVzr8D/TI/mU2tZ49NslbI=;
Received: from zeniv.linux.org.uk ([195.92.253.2])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jf5lW-00199f-V8
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 May 2020 17:59:28 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1jf5lD-000X31-I7; Sat, 30 May 2020 17:59:07 +0000
Date: Sat, 30 May 2020 18:59:07 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200530175907.GP23230@ZenIV.linux.org.uk>
References: <20200530060216.221456-1-ebiggers@kernel.org>
 <20200530171814.GD19604@bombadil.infradead.org>
 <20200530173547.GA12299@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200530173547.GA12299@sol.localdomain>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.92.253.2 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jf5lW-00199f-V8
Subject: Re: [f2fs-dev] [PATCH] ext4: avoid utf8_strncasecmp() with unstable
 name
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
Cc: Daniel Rosenberg <drosen@google.com>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Matthew Wilcox <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, May 30, 2020 at 10:35:47AM -0700, Eric Biggers wrote:
> On Sat, May 30, 2020 at 10:18:14AM -0700, Matthew Wilcox wrote:
> > On Fri, May 29, 2020 at 11:02:16PM -0700, Eric Biggers wrote:
> > > +	if (len <= DNAME_INLINE_LEN - 1) {
> > > +		unsigned int i;
> > > +
> > > +		for (i = 0; i < len; i++)
> > > +			strbuf[i] = READ_ONCE(str[i]);
> > > +		strbuf[len] = 0;
> > 
> > This READ_ONCE is going to force the compiler to use byte accesses.
> > What's wrong with using a plain memcpy()?
> > 
> 
> It's undefined behavior when the source can be concurrently modified.
> 
> Compilers can assume that it's not, and remove the memcpy() (instead just using
> the source data directly) if they can prove that the destination array is never
> modified again before it goes out of scope.
> 
> Do you have any suggestions that don't involve undefined behavior?

Even memcpy(strbuf, (volatile void *)str, len)?  It's been a while since I've
looked at these parts of C99...


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
