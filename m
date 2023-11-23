Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ACF7F57AF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Nov 2023 06:10:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r61yX-0008OR-Dw;
	Thu, 23 Nov 2023 05:10:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1r61yT-0008OL-MD
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Nov 2023 05:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iITGfQea8BxCiD9vKqR4Ix99Hb6hdNI5sOzOQogEaHk=; b=IlqN0XmiOLyA+mSMHNnB2703fa
 +tQ4fNdyMBCoBpJyhj1YrZVFSWOAdrTOOiQUoNnGgc6KvoujBuZKYnYTQOQSAAfZ+idjdGYqcPs4G
 TZH/5kJTRli70JzW46q7aVP0n8BeufgbKv0c0Wjab04YDq63v2thZ5w54ss4jicGft2E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iITGfQea8BxCiD9vKqR4Ix99Hb6hdNI5sOzOQogEaHk=; b=UsgT4mbxcbrJS3ZhnBcqUmQl1e
 4Wslz04/z+vn+voE3uGf7grHWKZiNsQyuBunPKfo7E6Gxntc/TDh0nenwOkoCqIE/Cn4c8aemWCed
 dmBHI9/OsOqMKBucmS12rYmt+x2Btf4CtX+7VKZauvALPnKumg+xoqdSkhT9sRogBkWE=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r61yQ-00DKDj-9O for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Nov 2023 05:10:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=iITGfQea8BxCiD9vKqR4Ix99Hb6hdNI5sOzOQogEaHk=; b=Ib38JnkE8qFEfCsu6aaCR/9lHx
 SMAuzxYNMe57P3S2yZ+Jw3sFPbIN2FDzhDJdjTipjmREeWsMJMU9bz/9gtgibiJOz/22oIQewboOf
 tG2X8/Hjx6DGB/GY+Z2gUUevGHcPgAZrRYpzFj9XC62UIchkqR/KHWqJl8ykOShhPoW3iPAxomT5j
 CGPvkfO5sRHRlLYG5LvHSi6OYIYamRv9t9bv/o+P8+wu+pRxlbE9kc7VpS2zAqgQoujiADDzQpxdF
 yTTiXRP3iC1vH3WjCFTtCwdHZb+peIKUQnpEYL2xZRTRzD6/RbZt9kzOoTN4K+Vl2iW+65S153WS+
 pArIhMlw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1r61yB-001vUi-2H; Thu, 23 Nov 2023 05:09:43 +0000
Date: Thu, 23 Nov 2023 05:09:43 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20231123050943.GM38156@ZenIV>
References: <20230816050803.15660-1-krisman@suse.de>
 <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
 <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
 <20231120-nihilismus-verehren-f2b932b799e0@brauner>
 <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
 <20231121022734.GC38156@ZenIV> <20231122211901.GJ38156@ZenIV>
 <CAHk-=wh5WYPN7BLSUjUr_VBsPTxHOcMHo1gOH2P4+5NuXAsCKA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wh5WYPN7BLSUjUr_VBsPTxHOcMHo1gOH2P4+5NuXAsCKA@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Nov 22, 2023 at 04:18:56PM -0800,
 Linus Torvalds wrote:
 > On Wed, 22 Nov 2023 at 13:19, Al Viro <viro@zeniv.linux.org.uk> wrote:
 > > > > The serious gap, AFAICS, is the interplay with open-by- [...] 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r61yQ-00DKDj-9O
Subject: Re: [f2fs-dev] [PATCH v6 0/9] Support negative dentries on
 case-insensitive ext4 and f2fs
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
Cc: Gabriel Krisman Bertazi <krisman@suse.de>,
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Nov 22, 2023 at 04:18:56PM -0800, Linus Torvalds wrote:
> On Wed, 22 Nov 2023 at 13:19, Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > The serious gap, AFAICS, is the interplay with open-by-fhandle.
> 
> So I'm obviously not a fan of igncase filesystems, but I don't think
> this series actually changes any of that.
> 
> > It's not unfixable, but we need to figure out what to do when
> > lookup runs into a disconnected directory alias.  d_splice_alias()
> > will move it in place, all right, but any state ->lookup() has
> > hung off the dentry that had been passed to it will be lost.
> 
> I guess this migth be about the new DCACHE_CASEFOLDED_NAME bit.
> 
> At least for now, that is only used by generic_ci_d_revalidate() for
> negative dentries, so it shouldn't matter for that d_splice_alias()
> that only does positive dentries. No?
> 
> Or is there something else you worry about?

Dentries created by d_obtain_alias() will never go anywhere near
generic_set_encrypted_ci_d_ops().  They do *not* get ->d_op set
that way.  When ext4_lookup() does a lookup in c-i directory it
does have ->d_op set on dentry it got from the caller.  Which is
promptly discarded when d_splice_alias() finds a preexisting
alias for it.

Positive dentries eventually become negative; not invalidating them
when that happens is a large part of the point of this series.
->d_revalidate() is taught to check if they are marked with that
bit, but... they won't have that ->d_revalidate() associated with
them, will they?  ->d_hash() and ->d_compare() come from the
parent, but ->d_revalidate() comes from dentry itself.

In other words, generic_ci_d_revalidate() won't see the lack of
that bit on dentry, etc. - it won't be called for that dentry
in the first place.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
