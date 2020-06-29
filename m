Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A64DE20D199
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2020 20:44:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jpyle-0001BV-34; Mon, 29 Jun 2020 18:44:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jpylc-0001BO-QF
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jun 2020 18:44:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KRf18WtwAkPtCTu4dzJ2yOaf6h91Tgp+rrao1RWQhN0=; b=VpSQARkiHqqDKZUc9703cD9U2b
 Z0g65Wqh1zJ7N3g/ME7ysv7T3WtBFRgjNiXqYslKAqnrXln039K7suDWDghThwvzmTgY9rR+br6aP
 fqhZsFlqPZkACjRztKr8KIq/u7AA1thn7HNrf5boR0q+xwblnhiI4pY+cvpkiDCIcsP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KRf18WtwAkPtCTu4dzJ2yOaf6h91Tgp+rrao1RWQhN0=; b=K22Yj/ABFpXZjrENdj8PdXWZjx
 YR4lSnG4uqI4kkqLkfGOBc6CSm8JrpRUeJAjZW+sosJqWb+U5SCu6Bp1uzI7bBxXKVfr1fkX2cGea
 KDlXE9X+FbNUlYE6qfYn/WO31zVe64NsbA4is/efiUInvPSU/8iP0ISScFaHBM6ZGvAU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jpylb-005HIm-NS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jun 2020 18:44:32 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 26DD520775;
 Mon, 29 Jun 2020 18:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593456266;
 bh=+KOLxCmwsPTRAh+iG7nBvhdN9ELAStyx3yZ+DIpMSVc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dJDIKMRCSLEvE0WirVlwv526I2ZGk7neXM71bgloPC2OjkB1QPSUU673s2YYwBV40
 dFOqgJt44qETJs2ymoIBolyAitJBRF6/PPq0ha6wCyEDLoZNoYjKJlTun4mD7F76Pc
 q2uBGcwiSOVQdAcampa0BMCJJlVXHO+uWyoH+9AU=
Date: Mon, 29 Jun 2020 11:44:24 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>, Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>
Message-ID: <20200629184424.GG20492@sol.localdomain>
References: <20200629120405.701023-1-satyat@google.com>
 <20200629120405.701023-5-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629120405.701023-5-satyat@google.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jpylb-005HIm-NS
Subject: Re: [f2fs-dev] [PATCH v2 4/4] ext4: add inline encryption support
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
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 29, 2020 at 12:04:05PM +0000, Satya Tangirala via Linux-f2fs-devel wrote:
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

This patch looks good to me.  (I can't technically provide Reviewed-by because
I'm listed as the author.)

Ted and Andreas, can you take a look?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
