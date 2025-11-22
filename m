Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A17C7D559
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Nov 2025 19:17:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfUS4yuRrQH3Ag3A61KcKNMvqpl2KNNHkLpchml47NU=; b=DyGAd7BIpfIN+sM/c2dbq0CBVe
	i3Bxb8pZ7hZmate3UrCLVJPqOPX53SroCPY5xjgXrLswhfaniZestKBKjVpJzx9xECDX4ciwsYfiP
	j6JxkRICG6kHFG7LtoFnJ4ppum1uYRZ92ircRFqMEzvPDCkikH/jsXilU/J37g/xAkNU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMsAv-0001Jv-75;
	Sat, 22 Nov 2025 18:17:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vMsAt-0001Jn-96
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Nov 2025 18:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rVOiQy0R3ITXCme9nsaOPvaHsROuC5V0UxNCWO0CAbc=; b=VtCMbyLhowEzn33mBhJOhK1ous
 FJedlXQwmyFGqeBI7S25/nLxOKwUN+G0vy+oCcdlSLGMqhC8JyakzcwU7uoi4jBxAX9lEDVKEuXS5
 xfJK5j4kEqF86IxTdtRngl5LkUAnIzgIzqAemz1xWs68JVjfPE5xv1Dsh28o4hNCcPII=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rVOiQy0R3ITXCme9nsaOPvaHsROuC5V0UxNCWO0CAbc=; b=UzzKxHO2sfZ4GTsAMQ1nGwAdNs
 7QktXd99kSnddkSWvLCsOD00kN5tTuDL1wGmfdOfrHrIpIadwBnsDjb2fGVpo3FB0VPe99CFAc7Vx
 Y/kS4mY+blzo+e9SyIK6qXZNcYnUlj0Jc33RUZ2bQB7s7MhwJ5aO9ewdOiCp1VAIE25w=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMsAs-0002C8-Sy for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Nov 2025 18:17:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 171C36013B;
 Sat, 22 Nov 2025 18:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B7EC4CEF5;
 Sat, 22 Nov 2025 18:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763835439;
 bh=we92XnUPL2GqTAE+Ck+cg8BMRawK5MC/LOnXeHskfuE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qWp7qBzgegMBBvpNUpmYHt1dSh1dwb7l1gVTIWRYlM8OTWUUWdH975ieJ/TI6cuVG
 OX7gdRw1zpMWaRAmRv0Pz5kTcOJ5IekC3ZeBx9szPIC3Dql/L0kmwVZ5VGp+oau6xF
 K+hU9omr4xma5Czu40WtwkdKJGRRqNJhRTmnradNl8hyDB2KWgpOd/2rjf7bk2qc+q
 WWaus1hdoFJCoreampp5V9lRtGeRWqONH5+HwEkBZ+Hp9kkUdcQG/mGDp0/fg6NZL7
 cbRX2Xcy/CEsx0PZZhycSzUq9SYMtwWCgvZRmqdsvJ9TD/UyPFWLyRIO1QANBTu2TY
 e1RjCaTvPOX5A==
Date: Sat, 22 Nov 2025 10:17:17 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20251122181717.GA1626@quark>
References: <20251118062159.2358085-1-hch@lst.de>
 <20251118062159.2358085-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251118062159.2358085-5-hch@lst.de>
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Nov 18, 2025 at 07:21:47AM +0100, Christoph Hellwig
 wrote: > diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
 > index 1773dd7ea7cf..aba830e0827d 100644 > --- a/fs/crypto/inline [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vMsAs-0002C8-Sy
Subject: Re: [f2fs-dev] [PATCH 04/11] fscrypt: pass a byte offset to
 fscrypt_mergeable_bio
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 18, 2025 at 07:21:47AM +0100, Christoph Hellwig wrote:
> diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
> index 1773dd7ea7cf..aba830e0827d 100644
> --- a/fs/crypto/inline_crypt.c
> +++ b/fs/crypto/inline_crypt.c
> @@ -361,7 +361,7 @@ EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx_bh);
>   * fscrypt_mergeable_bio() - test whether data can be added to a bio
>   * @bio: the bio being built up
>   * @inode: the inode for the next part of the I/O
> - * @next_lblk: the next file logical block number in the I/O
> + * @pos: the next file logical offset (in bytes) in the I/O

In comments, maybe call it a "file position" instead of "file logical
offset" to match the variable name?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
