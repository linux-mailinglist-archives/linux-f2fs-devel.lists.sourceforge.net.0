Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B46143D1943
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jul 2021 23:36:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6Jsr-0007ac-O9; Wed, 21 Jul 2021 21:36:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1m6Jsq-0007aP-9P
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Jul 2021 21:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YzKVuYNNpc/LT68PE9qj/xi9ist9Xkz/7bjx70kTcT8=; b=Fq/4i/6rhIdppsEFDHwwVf5ibm
 mS9RwfymgL6o+8u7j4tW8xQ8b7z7z3IwugGmhwNnJaNEj/AKpqddnUWYwA8rRrJq4p+eICxCkOuGo
 c5Ydtsua6Zzjmxhscik3asNciREwVW2gK0KkYJW7t5B1ajzpkwXPF65TgYkn1l6rke28=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YzKVuYNNpc/LT68PE9qj/xi9ist9Xkz/7bjx70kTcT8=; b=i1kHbxYChXEnHCQXNT4cakG7E4
 MvPYh5JnLA8qM/vMcXoyxAmnVVeQPyPp02Bdk4Hnc0+vOf6Mw9R3edtiMYsHr2DpjmED9SXFThVYY
 h5dh2YU7OHaZo8WWWxEj2QKpLatU7xZ+9a9mFqYEKVm7T0VzAl4sDQBfBgMovfAQql/k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6Jsh-0006UY-2v
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Jul 2021 21:36:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94D5B6124C;
 Wed, 21 Jul 2021 21:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626903344;
 bh=NSU/Wk43fEadjSCOVyueEa4XZr2Xp3CLiVyUfxIDmmU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NhxUps9b4AjEIN1swnEP77sK907y5GqVD+twrZhiGtb3BBvuwRicnwbJqfHm+a1jd
 8pAXldct9Om/D841qLJ38d8dQV8ZAusV7eMCx7HT7KlEWnx12s2yO9gZnv9qed7761
 N72UHjPqBfjK8fgAkIaYjc3q/6OWTkNs2eKtfxhPePIIaYLRb5pmad/CALHqLNIzLg
 4qReh6ZsfnVDb/PpYEzJ6e5gaOV0uB6PogiiM7DQ/Y2heSM3aQnu5R+aPKFNL63/J6
 cmup9TLM9QjrUZmF1KROnVYoyMriGvFR6Rcl9c2jRfvSfcT8bxH0B658xsZypcb/Ts
 IzTVVT5QvY95Q==
Date: Wed, 21 Jul 2021 14:35:43 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <YPiTLwB3d8BWSKje@gmail.com>
References: <20210721072048.3035928-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210721072048.3035928-1-daeho43@gmail.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6Jsh-0006UY-2v
Subject: Re: [f2fs-dev] [PATCH] f2fs: change fiemap way in printing
 compression chunk
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 21, 2021 at 12:20:48AM -0700, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> When we print out a discontinuous compression chunk, it shows like a
> continuous chunk now. To show it more correctly, I've changed the way of
> printing fiemap info like below. Plus, eliminated NEW_ADDR(-1) in fiemap
> info, since it is not in fiemap user api manual.
> 
> 0: 0000000000000000 0000000000000000 0000000000001000 1008 (M/E)
> 1: 0000000000001000 0000000f15c0f000 0000000000001000 1008 (M/E)
> 2: 0000000000002000 0000000000000000 0000000000002000 1808 (M/U/E)
> 3: 0000000000004000 0000000000000000 0000000000001000 1008 (M/E)
> 4: 0000000000005000 0000000f15c10000 0000000000001000 1008 (M/E)
> 5: 0000000000006000 0000000000000000 0000000000002000 1808 (M/U/E)
> 6: 0000000000008000 0000000000000000 0000000000001000 1008 (M/E)

Please label these columns.

Anyway, this doesn't appear to work quite in the way I had in mind.  With this
patch, what I'm seeing is:

$ head -c 16384 /dev/zero > file; xfs_io -c "fiemap -v" file
file:
 EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
   0: [0..7]:          0..7                 8 0x1008
   1: [8..15]:         2683128..2683135     8 0x1008
   2: [16..31]:        0..15               16 0x1809

So, working in 512-byte sectors, the logical sectors 0-31 are stored as one
compressed cluster in the 8 physical sectors 2683128-2683135.

The problem is, with this patch these physical sectors are reported at logical
sectors 8-15 instead of 0-7.  Obviously, this isn't particularly well-defined,
but I thought it was logical for the physical blocks to be associated with the
first logical blocks.  That is what the tests I've written (xfstest f2fs/002,
and the Android vts_kernel_encryption_test) assume.

Is there any particular reason why you wouldn't report instead:

   0: [0..7]:         2683128..2683135     8 0x1008
   1: [8..31]:        0..23                8 0x1809

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
