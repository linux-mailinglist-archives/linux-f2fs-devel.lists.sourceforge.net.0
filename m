Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD001D040F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2020 02:55:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYfgi-0002oG-G7; Wed, 13 May 2020 00:55:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1jYfgh-0002o6-BT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 May 2020 00:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1TXqjayUvCrme096A8vo5dxTea3J4uSqpdNM3rup1aM=; b=YxtCRJjF8tLgrEolMUUXUqUPZC
 Y8HTXenReLQC6mxxu+Xf/44nbxcSfgVE+VrHLg80dFeZRFUfTwRaXPvdacCOagFmJmb3R9EDKjfVP
 p4YIOszfwesswJetTCSAdVv9Vg1h0KlYukieSORjS1DZe3QA8U0zYacbPOMtAutPYcyI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1TXqjayUvCrme096A8vo5dxTea3J4uSqpdNM3rup1aM=; b=fTXMj6EEJPX65yBWMJNPwsAHm/
 gSZTPbSJxR8gZOjqmR4r8KlnTIpkW/3zFDSyaG/W2u21wlfwXViSEbDvFGiRcG7vcw4OR8pBm6VyT
 AQKJ5nimB8fn2f2h8VFBaRE4ySxrW9aNRgreEm6dJTWNzwubftn7PXj8R29bDrtqW538=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYfgd-00C9n8-8w
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 May 2020 00:55:55 +0000
Received: from callcc.thunk.org (pool-100-0-195-244.bstnma.fios.verizon.net
 [100.0.195.244]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 04D0tcEU000849
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 20:55:39 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id C4B6E4202E4; Tue, 12 May 2020 20:55:38 -0400 (EDT)
Date: Tue, 12 May 2020 20:55:38 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200513005538.GF1596452@mit.edu>
References: <20200512233251.118314-1-ebiggers@kernel.org>
 <20200512233251.118314-3-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512233251.118314-3-ebiggers@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1jYfgd-00C9n8-8w
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, May 12, 2020 at 04:32:49PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Currently, the test_dummy_encryption mount option (which is used for
> encryption I/O testing with xfstests) uses v1 encryption policies, and
> it relies on userspace inserting a test key into the session keyring.
> 
> We need test_dummy_encryption to support v2 encryption policies too.
> Requiring userspace to add the test key doesn't work well with v2
> policies, since v2 policies only support the filesystem keyring (not the
> session keyring), and keys in the filesystem keyring are lost when the
> filesystem is unmounted.  Hooking all test code that unmounts and
> re-mounts the filesystem would be difficult.
> 
> Instead, let's make the filesystem automatically add the test key to its
> keyring when test_dummy_encryption is enabled.
> 
> That puts the responsibility for choosing the test key on the kernel.
> We could just hard-code a key.  But out of paranoia, let's first try
> using a per-boot random key, to prevent this code from being misused.
> A per-boot key will work as long as no one expects dummy-encrypted files
> to remain accessible after a reboot.  (gce-xfstests doesn't.)
> 
> Therefore, this patch adds a function fscrypt_add_test_dummy_key() which
> implements the above.  The next patch will use it.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Theodore Ts'o <tytso@mit.edu>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
