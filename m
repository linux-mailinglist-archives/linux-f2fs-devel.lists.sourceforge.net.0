Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E965926070B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Sep 2020 00:52:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kFPzj-0003y0-OG; Mon, 07 Sep 2020 22:52:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kFPzi-0003xl-HU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Sep 2020 22:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QAIsipY32H5GDAwfHzyD1rHCeooSJ4U5R0t+AF6dvTw=; b=hgFyrkvjzPVtX4eY+at+pbXrVC
 gBOFQXhqZE66cuDnunz+J5buNsgMIj8rzYXt0tbbF4HzPBUep85c7R1OsuWk3c5I0Y9MYxveDunhY
 2VT4K4EX0kdHklzAONlQ2Z2YOQtZHNOqbcicKHXpaIR+EDxP4SozfHxyBW5zYWCRmii8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QAIsipY32H5GDAwfHzyD1rHCeooSJ4U5R0t+AF6dvTw=; b=LjLPXeHC/JtaiIxxQlR5BHV58Q
 k+b6xDOIwbbAVes6Nd/+4SrKPZNWjxTzwoSczKOVeCghdE+Sk4rAdDqQFjCPNzR7xuAYankwcTf+W
 vmvt9F9VRZjau5AkyXYtHo4lnrNl/6LHKOOPUiLuXsVeTeH91g0Z2oOBdHs/37tkXllw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kFPze-00GFnF-MO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Sep 2020 22:52:14 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0668121473;
 Mon,  7 Sep 2020 22:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599519113;
 bh=qow4/cZPIqfrydocDClnY9AoIUGhX2rllTat0rDAaeg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VMDxdMzHhBsVlSMiqfcgphgXB/aBL8oWR+gBy2nsz7elAn3eb9rn86M3fyvxGq3Hx
 r6jGw228WE0dnRO/KhzV+TJ7xT6kNwgWN5SF2Xs7ClBxQTRrwS600O4a9dbM3xh3mt
 t8En8ZEdJ06qQUfC7HHGwv5VzTEptet+nRRy0h4w=
Date: Mon, 7 Sep 2020 15:51:51 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20200907225151.GC68127@sol.localdomain>
References: <20200824203841.1707847-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824203841.1707847-1-ebiggers@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kFPze-00GFnF-MO
Subject: Re: [f2fs-dev] [PATCH] fscrypt: restrict IV_INO_LBLK_32 to ino_bits
 <= 32
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
Cc: Paul Crowley <paulcrowley@google.com>, linux-ext4@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 24, 2020 at 01:38:41PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> When an encryption policy has the IV_INO_LBLK_32 flag set, the IV
> generation method involves hashing the inode number.  This is different
> from fscrypt's other IV generation methods, where the inode number is
> either not used at all or is included directly in the IVs.
> 
> Therefore, in principle IV_INO_LBLK_32 can work with any length inode
> number.  However, currently fscrypt gets the inode number from
> inode::i_ino, which is 'unsigned long'.  So currently the implementation
> limit is actually 32 bits (like IV_INO_LBLK_64), since longer inode
> numbers will have been truncated by the VFS on 32-bit platforms.
> 
> Fix fscrypt_supported_v2_policy() to enforce the correct limit.
> 
> This doesn't actually matter currently, since only ext4 and f2fs support
> IV_INO_LBLK_32, and they both only support 32-bit inode numbers.  But we
> might as well fix it in case it matters in the future.
> 
> Ideally inode::i_ino would instead be made 64-bit, but for now it's not
> needed.  (Note, this limit does *not* prevent filesystems with 64-bit
> inode numbers from adding fscrypt support, since IV_INO_LBLK_* support
> is optional and is useful only on certain hardware.)
> 
> Fixes: e3b1078bedd3 ("fscrypt: add support for IV_INO_LBLK_32 policies")
> Reported-by: Jeff Layton <jlayton@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Applied to fscrypt.git#master for 5.10.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
