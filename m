Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA02939D2A5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Jun 2021 03:36:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lq4C6-0002my-Ao; Mon, 07 Jun 2021 01:36:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lq4C4-0002ml-Sl
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 01:36:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GXJUPXZqq3+uhZT+422qm96uPn8JjTBfRuZoD0eJkQg=; b=nTPVTIOJNVAE5eqXazIrHRtbua
 cTR3VF7gyxCfohjJ9JBrh7LvH8g1FAXi59f437zBz6a576fCxTnOaUeKbbza61SOis0/73CtVJl1I
 5q7tYvkm8M2PGpq63pLze8lv2F+t5ze19+ciUxxvVjaPjuMbsGBrKlqa+ePLxGk6VjAc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GXJUPXZqq3+uhZT+422qm96uPn8JjTBfRuZoD0eJkQg=; b=OufatQIqG8eF0DKldXiXbPLrnm
 7HKpqs+Y99KCL06+rSQp2TnR5EHFFyzXxzn02Kns55aVLxMzGNNotD4feeh3SSPatY4f1s5HOU839
 hzMHYL88yjTqd6gIc8o9hTcBdU0Lcsy/4zYNBRF4lp80lUFxcH/f62+CWO944pLv0eNs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lq4By-00BfGw-Dz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 01:36:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E95D61205;
 Sat,  5 Jun 2021 07:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622878097;
 bh=5g/aAviMny/1FbdkPtEqxlinD1zUu0BX5Eg+Gjxof9w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ecqtWV5+MliS+73h1GUVDr/6Is2BagPyHqHOLAWXmLeEsp+nor4Oi0a57xaWOWcRf
 7Hni68QjXNX+9wxpVa6eZcO3hIXX3fdRQKfSctMxfWq+j4FJ9ca0z1MgjUFgSr3JsZ
 NDBdYEwmgz9BhUYAxFFSJdpfG7blR0pt87qQbIqRmV7dw4tb4WoppJV7LCZ+xzA/k6
 vqUGV1OOmqn1570/9AAFVvw0H/iGCkOrcGqldrsAovanOxS9cDp33wMGneSDJA3nLt
 YXiAK/xIZxtdksDZYYPE2+GIrmYwQW+XY9Bje6oDYMUYvv0oQ3QbyUU3lOxzuJmXAa
 zILBDus1uZYhg==
Date: Sat, 5 Jun 2021 00:28:15 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <YLsnjxXpe+agF6nj@sol.localdomain>
References: <20210527235236.2376556-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210527235236.2376556-1-ebiggers@kernel.org>
X-Spam-Score: 2.2 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lq4By-00BfGw-Dz
Subject: Re: [f2fs-dev] [PATCH] fscrypt: don't ignore minor_hash when hash
 is 0
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
Cc: linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, May 27, 2021 at 04:52:36PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> When initializing a no-key name, fscrypt_fname_disk_to_usr() sets the
> minor_hash to 0 if the (major) hash is 0.
> 
> This doesn't make sense because 0 is a valid hash code, so we shouldn't
> ignore the filesystem-provided minor_hash in that case.  Fix this by
> removing the special case for 'hash == 0'.
> 
> This is an old bug that appears to have originated when the encryption
> code in ext4 and f2fs was moved into fs/crypto/.  The original ext4 and
> f2fs code passed the hash by pointer instead of by value.  So
> 'if (hash)' actually made sense then, as it was checking whether a
> pointer was NULL.  But now the hashes are passed by value, and
> filesystems just pass 0 for any hashes they don't have.  There is no
> need to handle this any differently from the hashes actually being 0.
> 
> It is difficult to reproduce this bug, as it only made a difference in
> the case where a filename's 32-bit major hash happened to be 0.
> However, it probably had the largest chance of causing problems on
> ubifs, since ubifs uses minor_hash to do lookups of no-key names, in
> addition to using it as a readdir cookie.  ext4 only uses minor_hash as
> a readdir cookie, and f2fs doesn't use minor_hash at all.
> 
> Fixes: 0b81d0779072 ("fs crypto: move per-file encryption from f2fs tree to fs/crypto")
> Cc: <stable@vger.kernel.org> # v4.6+
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/crypto/fname.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 

Applied to fscrypt.git#master for 5.14.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
