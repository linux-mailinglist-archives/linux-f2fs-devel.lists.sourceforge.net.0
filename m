Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F895218E19
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jul 2020 19:18:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtDiJ-0004AB-Qv; Wed, 08 Jul 2020 17:18:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1jtDiI-0004A4-Oq
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 17:18:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h8Tar3PYJiYXBx8ugqdapOOuHbrWsgNFVfIxIZAvx6k=; b=A5EQIRgB9DoCSOnxig9dr9CBhW
 +CeXUTAgr21QBxfGDqmxBr0qTM5f0VNn3sY9PVqSY5yfCvyn8lXofeTqKRpzevr7nH9vkN7yLdK65
 iFKpkCGcVI6fWJEfajVs5EzOiscVwWybhyy842guqgZ6Isa0iwL4HddoHVANlnOYxgiA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h8Tar3PYJiYXBx8ugqdapOOuHbrWsgNFVfIxIZAvx6k=; b=Igw17mK++jIuTn69s3Rdua8edo
 JPXVQm/gYCZi2wXjhr8c+CcMj2F8VaiGoaL674DIieD1YwcG1cnni+R3RgUhk0oyPa72rwmv655ZT
 SIXMSrBravXKfR3kO1HsifADqJO6Hs2i8lydLLojdDIoJeySxWr7dFjx02c0AOZb2VlU=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtDiH-00HVzn-41
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 17:18:30 +0000
Received: from callcc.thunk.org (pool-96-230-252-158.bstnma.fios.verizon.net
 [96.230.252.158]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 068HIC0f023584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Jul 2020 13:18:13 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id B4682420304; Wed,  8 Jul 2020 13:18:12 -0400 (EDT)
Date: Wed, 8 Jul 2020 13:18:12 -0400
From: tytso@mit.edu
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200708171812.GF1627842@mit.edu>
References: <20200702015607.1215430-1-satyat@google.com>
 <20200702015607.1215430-5-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702015607.1215430-5-satyat@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [18.9.28.11 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtDiH-00HVzn-41
Subject: Re: [f2fs-dev] [PATCH v4 4/4] ext4: add inline encryption support
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 02, 2020 at 01:56:07AM +0000, Satya Tangirala wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Wire up ext4 to support inline encryption via the helper functions which
> fs/crypto/ now provides.  This includes:
> 
> - Adding a mount option 'inlinecrypt' which enables inline encryption
>   on encrypted files where it can be used.
> 
> - Setting the bio_crypt_ctx on bios that will be submitted to an
>   inline-encrypted file.
> 
>   Note: submit_bh_wbc() in fs/buffer.c also needed to be patched for
>   this part, since ext4 sometimes uses ll_rw_block() on file data.
> 
> - Not adding logically discontiguous data to bios that will be submitted
>   to an inline-encrypted file.
> 
> - Not doing filesystem-layer crypto on inline-encrypted files.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Co-developed-by: Satya Tangirala <satyat@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>

Reviewed-by: Theodore Ts'o <tytso@mit.edu>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
