Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F113857A6BC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Jul 2022 20:49:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oDsI4-0003oM-6Y; Tue, 19 Jul 2022 18:49:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1oDsHv-0003oE-9g
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Jul 2022 18:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UEVSYhMPj3Q0ryrLjLsZ2XiTSeFTFmYLNjf4M6A2STU=; b=MpS18Izy22/hlttc8ebpa1tKv1
 8LwXB4xVLaW42z/ez9PMw7bskPV5AgqN2GVrEIRiVqxmk9x9/lVexvA6eAlkof32FsTyLrfbSEOaA
 pRuv+n7QlsluxXEOKP61LR5ODd8x4vQoYTpVaFZSqNdQ2yDuwdY4GFrOBJxJfwS6UXgI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UEVSYhMPj3Q0ryrLjLsZ2XiTSeFTFmYLNjf4M6A2STU=; b=bWhF+8rvyMRHseS1JPswhqbgGh
 srUrDieZafhmGystfGj77uQiCpmQ0vcu83i3Z/LbW60fTWG2KOgdxfK6NFpoqdaTp708w6rWfyR1l
 wx6Mav7LPqnWsAp/s6jZqlH5x4Jgc54xT+CNNF7BGzHE73uVtsf9aVhCeMs3K9Gm0wBE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oDsHs-0008DL-3S
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Jul 2022 18:49:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AB06C617A1;
 Tue, 19 Jul 2022 18:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE970C341C6;
 Tue, 19 Jul 2022 18:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658256568;
 bh=/K91o+qKLCbtKDi3/tG73ZWIzxIa2IRxn4bwgg8SU6s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TsFKLx4sa6WI7xRr8hTRSHdiETDX2u3xEXj/tlEC+1Mu31zXJrvYI9xURGhNqpvv9
 Xw5+dYbEKmi3mHt6FnWaQjGenneQUuX/FaRUs10zZ81E+9Jerlw+s9wJ0+Ajm/ra14
 5aJMLLJs7mEPG03TE9mbq4q9RQy+Ua/jQ6IeRIqDpdZ3l37548dMP/JJKn4eapN21r
 gk900x3bkTn5tkq9RZghLYoJ3Xh1rP2qIWVmhtwpA77VS5HuTiLxV/xiGroLDuWidY
 CZxany2wmb4+hrU1m+Jc0SClz/Dv39lFIVoaPIPexo8HhhCRJEbmqteDXodOOeOxeE
 12Nwjs9wLN4RA==
Date: Tue, 19 Jul 2022 11:49:27 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <Ytb8typAESKplJAN@sol.localdomain>
References: <20220627065050.274716-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220627065050.274716-1-ebiggers@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Jun 26, 2022 at 11:50:48PM -0700, Eric Biggers wrote:
 > This series changes ext4 and f2fs to stop using PG_error to track >
 decryption
 and verity errors. This is a step towards freeing up > PG [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oDsHs-0008DL-3S
Subject: Re: [f2fs-dev] [PATCH 0/2] ext4,
 f2fs: stop using PG_error for fscrypt and fsverity
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Jun 26, 2022 at 11:50:48PM -0700, Eric Biggers wrote:
> This series changes ext4 and f2fs to stop using PG_error to track
> decryption and verity errors.  This is a step towards freeing up
> PG_error for other uses, as discussed at
> https://lore.kernel.org/linux-fsdevel/Yn10Iz1mJX1Mu1rv@casper.infradead.org
> 
> Note: due to the interdependencies with fs/crypto/ and fs/verity/, I
> couldn't split this up into separate patches for each filesystem.
> 
> Eric Biggers (2):
>   fscrypt: stop using PG_error to track error status
>   fsverity: stop using PG_error to track error status
> 
>  fs/crypto/bio.c         | 16 +++++++----
>  fs/ext4/readpage.c      | 16 +++++------
>  fs/f2fs/compress.c      | 61 ++++++++++++++++++++---------------------
>  fs/f2fs/data.c          | 60 +++++++++++++++++++++-------------------
>  fs/verity/verify.c      | 12 ++++----
>  include/linux/fscrypt.h |  5 ++--
>  6 files changed, 88 insertions(+), 82 deletions(-)
> 
> 
> base-commit: 0840a7914caa14315a3191178a9f72c742477860

Any thoughts on this patchset from anyone?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
