Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC242A1D60
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 Nov 2020 11:38:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZAl9-0003b7-8L; Sun, 01 Nov 2020 10:38:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1kZAl5-0003ag-Su
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Nov 2020 10:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8qcvelDDm7aZL5mR/xf0wUz9oLI1owsdOuLqfMbd8u4=; b=J1i4NY2PxPeB/ihtivERXX73ao
 3Hom9GA77OtGKO2yuUYz8k5Fb+GSEY6pcUeC7m0djXC0R8ZwRgjeaef6y+N0HoVzw1acdtKyefcOX
 tmAzl6KJKX8nGh7y6U1TV1cTny+/15f3pFz9KT/abT/XtG19a93TUmNexwClma4pmH2I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8qcvelDDm7aZL5mR/xf0wUz9oLI1owsdOuLqfMbd8u4=; b=J9EAVwaAbOl8aDWWM+GckTtst/
 nVEK5eJeiez6oR8XGvTE9kfkzZITmGk4/j2SPBfmXQ5OnnYHq/SoJuI+ChrJGdH0/tHYVc3q/dTUK
 3DJvUsYIjmngojN6IVtS0Ipnys+BPxJb2aYWD10wRHB2cM2kMnZu2Zp0LyMmHkYmOfIE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZAkz-00FAYh-7C
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Nov 2020 10:38:47 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 61F502080A;
 Sun,  1 Nov 2020 10:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604227115;
 bh=kT4U+hpjwiXR7kNlPgarRqNhSt/kq7ZaLXhFmR2LbQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KwZghQSo6asyOSwAGcIuzY0UE8Ll7TcWerMF4HiY437wTMEeZMLuI4+ismHuP+O0B
 5sf5Bpkyc2MdV5C39/CcQGZpBrRfiKuj2XPnQFywZCi/nLoXJJFRlm0Dxn2xhbHTo9
 y1qhSdw37v3ZRWB6tH0DXiuEkOKdWX9SIyvhzzGE=
Date: Sun, 1 Nov 2020 11:39:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20201101103906.GA2689688@kroah.com>
References: <20201031220553.1085782-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201031220553.1085782-1-ebiggers@kernel.org>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kZAkz-00FAYh-7C
Subject: Re: [f2fs-dev] [PATCH 4.19 0/5] backport some more fscrypt fixes to
 4.19
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Oct 31, 2020 at 03:05:48PM -0700, Eric Biggers wrote:
> Backport some fscrypt fixes from upstream 5.2 to 4.19-stable.
> 
> This is needed to get 'kvm-xfstests -c ext4,f2fs,ubifs -g encrypt' to
> fully pass on 4.19-stable.  Before, generic/397 and generic/429 failed
> on UBIFS due to missing "fscrypt: fix race where ->lookup() marks
> plaintext dentry as ciphertext".
> 
> This also fixes some bugs that aren't yet covered by the xfstests.
> E.g., "fs, fscrypt: clear DCACHE_ENCRYPTED_NAME when unaliasing
> directory" fixes a bug that caused real-world problems on Chrome OS.
> 
> Some relatively straightforward adjustments were needed to the patches,
> mainly due to the refactoring of fscrypt.h that was done in 5.1.

All now queued up, thanks!

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
