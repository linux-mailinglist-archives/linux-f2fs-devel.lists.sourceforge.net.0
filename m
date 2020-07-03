Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7AE2130CB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Jul 2020 03:02:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Kq/OqN6uJ7YeMbFcZ75ZmLSYf/65pylFJ2P80h25xk=; b=glBuZgM6IJbNJRQBTsUOgGI+pm
	wWji/xpmUg/ApXRlL/UWjs9SvrXpkqOxvIXR0lDfAbH61qU4EP7BC+BiqaXI3pFFGMmnlnzaXgw6B
	FIZhWIv6LPxgfBH0hPNm45IkJAQqu4/gOZM0FXwVoiArt4kxbgCKAM+AdwwhQdAUVe60=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jrA5W-000131-9R; Fri, 03 Jul 2020 01:01:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <drosen@google.com>) id 1jrA5U-00012t-Bo
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jul 2020 01:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+0u5TnXqElmJHIUbIwfyg0UnTaWODXR+GC+hM1QsUz4=; b=e3cqaFkzNUTFHUdg8ctBWwOr9u
 71me8AK11iwgPK+bmKUqVj9d4Nos7sNWVjsxLsKe5/PYNqB2tYSzWUoYMzqHLsi0go0lX4CYDjxor
 Ycf1ZEGp21kjgnNhzNLTAAOO+LMXkJnyW67T/Kl3YwFtY9Y+4cBtUtXQKqJJzdy1n5RA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+0u5TnXqElmJHIUbIwfyg0UnTaWODXR+GC+hM1QsUz4=; b=jOrNmDWWlLhpXbjM9nRqCmBOGB
 oM+wt3eDWkxXb/U6/QceaveMci4XM58LtvG6MyqCPe8Usd7LerKhrtCYNyh5fdYAhPrmPGuz3skVT
 6WjKx5dRX4sbuRch/+9IA1yrEwdhZ72en++EnTbR0/lSfI1+7vduhh8kRAsPUOe5vV+A=;
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jrA5S-006QXH-Vh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jul 2020 01:01:56 +0000
Received: by mail-ot1-f67.google.com with SMTP id n24so23316015otr.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 02 Jul 2020 18:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+0u5TnXqElmJHIUbIwfyg0UnTaWODXR+GC+hM1QsUz4=;
 b=oOqDzf9UhdHQiWfizW6yxKYuiXycU3fWLPwduq8AH7hV/7gSiEHYYCaf1R8F2ctgqG
 Ctt5zAILp2PI93b4Q9sIqk+bct1cHbzT8Yw9+IcOxwWKgWbCaachSWq9et+Yf8XtLZAo
 4PfjLQ2EBIkG8ZapbfVu6Be6/Vu8TcYpCdwMqVXiYNjxd4suP9wdDfoO3oqnw035dU8n
 /R6DDvFq0BMQXLdQ3Ov60bKRizaMZFmcKMO6VN+JDo/z+/DFAUQ/rBIJ0OdRJmHbICOW
 lVBzFxBYsXOkdcGMH5/fGPjcJF+UWV/JV1fhleZLJ4KwG6qXoSH5MyKRsJ+/bO2HGygC
 mIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+0u5TnXqElmJHIUbIwfyg0UnTaWODXR+GC+hM1QsUz4=;
 b=QQ+EdtHCoTJ89lUUDcdjm5IG5Wy4c+Xz8Y4bajVWTGozje5Au2LHzXofIecKfa4kBO
 ZuF77+b9wfX4CtIl9OeiGYudbXn9NdpsDH2SKZzfs8F1y5hrHUK6TudBM/AXa3QQKGDt
 He6StM9dKfNgOBq/12ggknFQO4N2EhuzIWE9AYLujzXV3zkvCajOaUCCDDzSu+KQjaAj
 ASYtlHqlGASuGzRSQgPh4llOBUowDPrlca5YrV0SembJTVJPen/3o8RBi3dH48GAVx97
 INGASbXGZQHTOPEjI5PY4eh3BdLE6CtDj7FZT0UohunP/9HZFLN84flxMkVmrDsrJmDw
 1AUg==
X-Gm-Message-State: AOAM530X9yJ6JqeNMtYuKF57c/TWYm/a1FGuBQ+Q0Q+1H0GabSp2Yiak
 Fw7DX5zR8SwvEmaGL4dRhEmibItGHI3mP4aaF2RCOg==
X-Google-Smtp-Source: ABdhPJxyzjPijsRL1V11XOG//slLi4ypOVvA8gCAeJn23Y/3chvpbEFZmi5lFQBGL/hRDveD1WrFac5iKC6RBaNTr+k=
X-Received: by 2002:a9d:6d98:: with SMTP id x24mr18707612otp.93.1593738109138; 
 Thu, 02 Jul 2020 18:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200624043341.33364-1-drosen@google.com>
 <20200624043341.33364-3-drosen@google.com>
 <20200624055707.GG844@sol.localdomain>
In-Reply-To: <20200624055707.GG844@sol.localdomain>
Date: Thu, 2 Jul 2020 18:01:37 -0700
Message-ID: <CA+PiJmTDXTKnccJdADX=ir+PtqsDD72xHGbzObpntkjkVmKHxQ@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.67 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1jrA5S-006QXH-Vh
Subject: Re: [f2fs-dev] [PATCH v9 2/4] fs: Add standard casefolding support
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: kernel-team@android.com, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 23, 2020 at 10:57 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> Note that the '!IS_ENCRYPTED(dir) || fscrypt_has_encryption_key(dir)' check can
> be racy, because a process can be looking up a no-key token in a directory while
> concurrently another process initializes the directory's ->i_crypt_info, causing
> fscrypt_has_encryption_key(dir) to suddenly start returning true.
>
> In my rework of filename handling in f2fs, I actually ended up removing all
> calls to needs_casefold(), thus avoiding this race.  f2fs now decides whether
> the name is going to need casefolding early on, in __f2fs_setup_filename(),
> where it knows in a race-free way whether the filename is a no-key token or not.
>
> Perhaps ext4 should work the same way?  It did look like there would be some
> extra complexity due to how the ext4 directory hashing works in comparison to
> f2fs's, but I haven't had a chance to properly investigate it.
>
> - Eric

Hm. I think I should be able to just check for DCACHE_ENCRYPTED_NAME
in the dentry here, right? I'm just trying to avoid casefolding the
no-key token, and that flag should indicate that.
I'll see if I can rework the ext4 patches to not need needs_casefold
as well, since then there'd be no need to export it.
-Daniel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
