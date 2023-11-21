Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DA07F23FA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Nov 2023 03:28:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r5GUQ-00084j-SV;
	Tue, 21 Nov 2023 02:27:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1r5GUP-00084c-5U
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Nov 2023 02:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pAfw17aMAXO5jNA5wNi4EQEUNYP31ut+8Y9AyC6qrR4=; b=d58sABd0og04cjkoIPAytffXXy
 GPH26/FANqWnfX3cJCnaIhEsLCBe5OFjHPJo/yRqWgL9Lliez0uTHjkHfB20bveVQiZhmKwv/B4/X
 Y8l5dfh/oZgax1lCJI3I9i5eHo4643/5w5zfApZK65ALG76L8G6QWdDYMCo4nZ1FEDkY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pAfw17aMAXO5jNA5wNi4EQEUNYP31ut+8Y9AyC6qrR4=; b=Nww6FyDBmKn30C47qvgs+vwpkw
 N5yNbSkORTWTHOjnaMAbd51XtdSo7LB2MYi9h3BxjF1CLRcMgbv0c+dOw1o6naqmkVQgpbrSb16qq
 d4YAAkQn9Jc79cG6XTX5+fQxLVxzA2ki4uzrAQ/5ZuE4YSX0EaT8gf4HBmLfu+BtK/3w=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r5GUM-0004XV-IW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Nov 2023 02:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pAfw17aMAXO5jNA5wNi4EQEUNYP31ut+8Y9AyC6qrR4=; b=AETveS0/spmd3pq0pAjwyZKShu
 tTeHavtT/gA+L4dHwyYTyK6rUDhxbOCURftxNAGCXud042shrupW8lwe2qo9/h2ypa8tab3dD4rO9
 oX3P8AJRMLpJaOQcc5pNl8OJ/6L4Q1ffJ2sfK5A9wjhyVsO41T2Hss/TOD/hDbNIfjDygAEK7wSyu
 K9mp0GPMbw3EutV72rle1DncPk898z76DHRjLyuQ16eHbBw9/UKSNqv4eBiVBoy2eC/11xfu5BXqT
 JLQSAsphb6iW722vNGnMbBhmIPS8a17bXLScTxDEgsznFKy2Ckn6kt/e77jIUL30U9RqSqZOMEznS
 9oS6N6Vg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1r5GUA-000z3m-0x; Tue, 21 Nov 2023 02:27:34 +0000
Date: Tue, 21 Nov 2023 02:27:34 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20231121022734.GC38156@ZenIV>
References: <20230816050803.15660-1-krisman@suse.de>
 <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
 <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
 <20231120-nihilismus-verehren-f2b932b799e0@brauner>
 <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 20, 2023 at 10:07:51AM -0800,
 Linus Torvalds wrote:
 > Well, we all know - very much including Al - that Al isn't always the >
 most responsive person, and tends to have his own ratholes that he > dives
 deep into. 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r5GUM-0004XV-IW
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

On Mon, Nov 20, 2023 at 10:07:51AM -0800, Linus Torvalds wrote:

> Well, we all know - very much including Al - that Al isn't always the
> most responsive person, and tends to have his own ratholes that he
> dives deep into.

FWIW, the right now I'm getting out of one of those - rename() deadlocks
fun.  Will post that, assuming it survives local beating, then post
the dcache stuff and other branches (all rebased by now).

Other ratholes - d_name/d_parent audit is about halfway through -
we do have fun shite in quite a few ->d_revalidate() instances (UAF,
etc.); RCU pathwalk methods need to be re-audited; the fixes caught
in the last cycle are either in mainline by now, or rebased.

But that stuff is relatively easy to suspend for a few days.

> Of course, "do it in shared generic code" doesn't tend to really fix
> the braindamage, but at least it's now shared braindamage and not
> spread out all over. I'm looking at things like
> generic_ci_d_compare(), and it hurts to see the mindless "let's do
> lookups and compares one utf8 character at a time". What a disgrace.
> Somebody either *really* didn't care, or was a Unicode person who
> didn't understand the point of UTF-8.
> 
> Oh well. I guess people went "this is going to suck anyway, so let's
> make sure it *really* sucks".
> 

> The patches look fine to me. Al - do you even care about them?

I will review that series; my impression from the previous iterations
had been fairly unpleasant, TBH, but I hadn't rechecked since April
or so.

Re dcache conflicts - see #untested-pile-dcache; most the dcache-affecting
stuff should be there.  One intersting exception is the general helper
for safely picking parent/parent's inode/entry name for ->d_revalidate()
use;  we have the parent-related part boilerplated, but the name side
tends to be missing.  That's still being tweaked, looking for sane
calling conventions.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
