Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A3F1D053E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2020 05:07:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYhjq-0007ox-68; Wed, 13 May 2020 03:07:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jYhjp-0007oq-3q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 May 2020 03:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PVdFjVNairqkes2ZWDUf2+D3kpmUfJlI0ZWDfJzOBJk=; b=BrXRW6kGTVmjCSRfeTH4iLDnf7
 nIsGx/Dqt45VtXufgV7jmJ+sWzpKha9mx1A9O5k/OQ3n0O+84gkPFTOF3eCXRfdEngPTummuSvco0
 afwvLYbatjypQYBIicAhZxSqGK6YMt81QniliWA5vYNuwcPhhzb+I78rmujkcDS6G9v0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PVdFjVNairqkes2ZWDUf2+D3kpmUfJlI0ZWDfJzOBJk=; b=KzoqI5I2SQflhWwQiEUG+HQgJM
 0gzAgrXe1WCyH3eVXMjz5qVPPh3JLs9IhKG+zgoDG1Jnua9AIZKSWmLxIt+M/7TIch76vtHYwhHuI
 oorgQwpRpaO7i2z3tNflh3aEqj/elgg4KXhWJMBxhO+/j0Pt6g+9I0TKLZ+DlbXR+1Ws=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYhjj-00CJsM-4i
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 May 2020 03:07:17 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A843D2176D;
 Wed, 13 May 2020 03:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589339225;
 bh=mf0A77JO/o1Mk6zUTHq9K+pvz3bYpz5zIclotccg+Fo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yoPvoPvrtTgr0s5g4gLXEiIOsQf1dxfj/oBrrGa+nwoA6dE2mGMBtdWeohFt+yKvn
 4KlSpBlNspt1Pg1OVOViCkzUUafX+woN5Q0mQkMWH2ysQ77USKFxfJNTgDaMtkx6hS
 UGIOguCPrp8uo1y+tI6zLJ6p8n4VHZjG9dmJvNI0=
Date: Tue, 12 May 2020 20:07:05 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20200513030705.GB108075@google.com>
References: <20200512233251.118314-1-ebiggers@kernel.org>
 <20200512233251.118314-3-ebiggers@kernel.org>
 <20200513005538.GF1596452@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513005538.GF1596452@mit.edu>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jYhjj-00CJsM-4i
Subject: Re: [f2fs-dev] [PATCH 2/4] fscrypt: add fscrypt_add_test_dummy_key()
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/12, Theodore Y. Ts'o wrote:
> On Tue, May 12, 2020 at 04:32:49PM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Currently, the test_dummy_encryption mount option (which is used for
> > encryption I/O testing with xfstests) uses v1 encryption policies, and
> > it relies on userspace inserting a test key into the session keyring.
> > 
> > We need test_dummy_encryption to support v2 encryption policies too.
> > Requiring userspace to add the test key doesn't work well with v2
> > policies, since v2 policies only support the filesystem keyring (not the
> > session keyring), and keys in the filesystem keyring are lost when the
> > filesystem is unmounted.  Hooking all test code that unmounts and
> > re-mounts the filesystem would be difficult.
> > 
> > Instead, let's make the filesystem automatically add the test key to its
> > keyring when test_dummy_encryption is enabled.
> > 
> > That puts the responsibility for choosing the test key on the kernel.
> > We could just hard-code a key.  But out of paranoia, let's first try
> > using a per-boot random key, to prevent this code from being misused.
> > A per-boot key will work as long as no one expects dummy-encrypted files
> > to remain accessible after a reboot.  (gce-xfstests doesn't.)
> > 
> > Therefore, this patch adds a function fscrypt_add_test_dummy_key() which
> > implements the above.  The next patch will use it.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Reviewed-by: Theodore Ts'o <tytso@mit.edu>

Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
