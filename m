Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AED18C130
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2020 21:19:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jF1dn-0005xv-HI; Thu, 19 Mar 2020 20:19:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1jF1dl-0005xn-NG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 20:19:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yAttXbz2QC3+hGq1ZpsIHrIaeGIniH5yD4ypv1GWGrU=; b=SS0jJ3gZJA4qnDcdMlaD7i+feC
 1e1W7d+ptniMmC67mJ4ePEbP2rC2hzINb3ykFqUEuE666jbk7i/9To9BHHbEba5F4Rsaj/1XfOl/h
 YOATwHh2IoniV3+IlPF6sT7G3kvdJXQB28dQn9sniWaNhHXrO9o/v/4JtXRviH+U5HZA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yAttXbz2QC3+hGq1ZpsIHrIaeGIniH5yD4ypv1GWGrU=; b=lDV8wZ7BWuujUVu7bpABJokWxf
 lvRL7EO07Jil6VnTHFhbC95fS+ovBpsRq90sG+8Z8PbCAb+EDZ3sXl35hwcGSPBcZj+eoa8rzArbT
 HrKE7Fr61pxZPW3ufoocJeog1nXXHQBQ6Mh7ibTFNUgXB2kc6UJg7n5bvKYOGv1/sap4=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jF1dh-00EVGH-Qs
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 20:19:41 +0000
Received: from callcc.thunk.org (pool-72-93-95-157.bstnma.fios.verizon.net
 [72.93.95.157]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 02JKJEjG024401
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 16:19:14 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 38C4F420EBA; Thu, 19 Mar 2020 16:19:14 -0400 (EDT)
Date: Thu, 19 Mar 2020 16:19:14 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200319201914.GD1067245@mit.edu>
References: <20200314205052.93294-1-ebiggers@kernel.org>
 <20200314205052.93294-2-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200314205052.93294-2-ebiggers@kernel.org>
X-Spam-Score: 2.5 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
X-Headers-End: 1jF1dh-00EVGH-Qs
Subject: Re: [f2fs-dev] [PATCH 1/4] fscrypt: add FS_IOC_GET_ENCRYPTION_NONCE
 ioctl
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
Cc: linux-api@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Mar 14, 2020 at 01:50:49PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add an ioctl FS_IOC_GET_ENCRYPTION_NONCE which retrieves the nonce from
> an encrypted file or directory.  The nonce is the 16-byte random value
> stored in the inode's encryption xattr.  It is normally used together
> with the master key to derive the inode's actual encryption key.
> 
> The nonces are needed by automated tests that verify the correctness of
> the ciphertext on-disk.  Except for the IV_INO_LBLK_64 case, there's no
> way to replicate a file's ciphertext without knowing that file's nonce.
> 
> The nonces aren't secret, and the existing ciphertext verification tests
> in xfstests retrieve them from disk using debugfs or dump.f2fs.  But in
> environments that lack these debugging tools, getting the nonces by
> manually parsing the filesystem structure would be very hard.
> 
> To make this important type of testing much easier, let's just add an
> ioctl that retrieves the nonce.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Theodore Ts'o <tytso@mit.edu>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
