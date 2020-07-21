Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C438D227432
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jul 2020 02:56:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxga0-00029X-Fu; Tue, 21 Jul 2020 00:56:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jxgZu-00028p-As
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 00:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yE556gemv84POTh/oVtGmMzg6BYmzayv7rFBXkPsdaQ=; b=CgrVWcf2B7HZqCr/yKnK3IDxrJ
 8AyyjQ5W09WKcvqLk5jrpMbmuG0VBe+A0u19xrRKSb/dUQrGljo2eWQMQ94qsu9Has+5sXvFqbasV
 z8wDjycmMGBi91L8a442ZFwjZxHuYW9B4DQdewNrQAK41IOeG+kuY+9bpQ4TIIexlveo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yE556gemv84POTh/oVtGmMzg6BYmzayv7rFBXkPsdaQ=; b=feQb2pbFEm2gSXaDz+dhInlE/E
 od7yCTQHge2Q099V8Da9Un9GdidydZes6AZCR3rKCd0IVaAC6wBQSHhwTXo/b2BfJBOV/7tSRKYtS
 28wlHppUB5pK93IREsuV7k4enhliuwjb1Y1xtrEJ/NBlN2l4rbaEgMn7RDmUJdHRLxus=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jxgZr-00BSJf-Bo
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 00:56:18 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BCA0C2080D;
 Tue, 21 Jul 2020 00:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595292963;
 bh=dljJpfGPFFNj0wv4WYv/v3SWoi1fAf+MTy7pRYnyY7Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ejU8ZkFJrLiVoGTmDI5vINlnpExbViy7d42Uic8QH7oIDcehBxc7Xjc7fPHoEdxnp
 zFQ8luDXtsqZ6dhgmGuNI1zE295r46BjEni3RQj/MX42KOpQE0ENNWACO4S8D3mPN8
 N093bypT+wf9P/NEFxk1k2jmPoWzo0dvJXrS3+7c=
Date: Mon, 20 Jul 2020 17:56:02 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200721005602.GE7464@sol.localdomain>
References: <20200720233739.824943-1-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720233739.824943-1-satyat@google.com>
X-Spam-Score: 1.6 (+)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.8 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxgZr-00BSJf-Bo
Subject: Re: [f2fs-dev] [PATCH v4 0/7] add support for direct I/O with
 fscrypt using blk-crypto
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
Cc: linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jul 20, 2020 at 11:37:32PM +0000, Satya Tangirala wrote:
> This patch series adds support for direct I/O with fscrypt using
> blk-crypto. It has been rebased on fscrypt/master.
> 
> Patch 1 adds two functions to fscrypt that need to be called to determine
> if direct I/O is supported for a request.
> 
> Patches 2 and 3 wire up direct-io and iomap respectively with the functions
> introduced in Patch 1 and set bio crypt contexts on bios when appropriate
> by calling into fscrypt.
> 
> Patches 4 and 5 allow ext4 and f2fs direct I/O to support fscrypt without
> falling back to buffered I/O.
> 
> Patches 6 and 7 update the fscrypt documentation for inline encryption
> support and direct I/O. The documentation now notes the required conditions
> for inline encryption and direct I/O on encrypted files.
> 
> This patch series was tested by running xfstests with test_dummy_encryption
> with and without the 'inlinecrypt' mount option, and there were no
> meaningful regressions. One regression was for generic/587 on ext4,
> but that test isn't compatible with test_dummy_encryption in the first
> place, and the test "incorrectly" passes without the 'inlinecrypt' mount
> option - a patch will be sent out to exclude that test when
> test_dummy_encryption is turned on with ext4 (like the other quota related
> tests that use user visible quota files). The other regression was for
> generic/252 on ext4, which does direct I/O with a buffer aligned to the
> block device's blocksize, but not necessarily aligned to the filesystem's
> block size, which direct I/O with fscrypt requires.
> 

This patch series looks good to me now.  Can the ext4, f2fs, and iomap
maintainers take a look?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
