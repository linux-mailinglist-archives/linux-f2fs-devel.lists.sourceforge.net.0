Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C7B59C61C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Aug 2022 20:27:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oQC93-0000EG-D4;
	Mon, 22 Aug 2022 18:27:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oQC92-0000E6-Dc
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Aug 2022 18:27:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/e/0bkiMVZA4z+ASN+JFT5lrRY0Mu6JRXxwaT8HgUsI=; b=E/+HXTSSyqY/zMWQz6EW39tolG
 9XLhEqFuvt3ZUkIz6/NeoUHZuqLnZ1pSBD3W9TxhHSxXl+zX203lufpb9SdHYj6IlQ/YUAtJ3IrK8
 iCaolH6UBSVSwihdhpa7nqQp+AFHPav1fZ9+2eLt3n80+TCE/8FOPH+mIiX2IOnxVuHQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/e/0bkiMVZA4z+ASN+JFT5lrRY0Mu6JRXxwaT8HgUsI=; b=dnVQGLtfj9+tNqApo0OmuNZaS/
 FySb5VUuH0MK6NxwIU/shxRsAMCGgMQ/x5rRCy7p8eZLEhe3s91ImUbEBKtmf+7TIAxdNHbNAfvJR
 qC7vootHRDSwWzuaLFlZjLnqpjv9Fm6LGvAkluzd5t0+6MQ/8PDbw+T4aQ3Zls5BNT8k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oQC91-00DQ93-P6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Aug 2022 18:27:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 684C9612DA;
 Mon, 22 Aug 2022 18:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F3CBC433D6;
 Mon, 22 Aug 2022 18:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661192841;
 bh=Gh6irQCwtsKJ6eFKCfceqRMjx+rmz6M385gr7IrGoEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=huOKrEA5mAlbzWgfvLn+VqRshn8OpPAHYhDTxEDynERxlmvcaSI3WtGM1asCy+ca3
 z3TbWV2YoqflNyuA5fCnQGXkNhfvFB5CK0HLqSqQWbu0VfxJAoTnRzNJfs+tJaFELc
 PXlG3bqP/YWzlUMyq0UMO4r7l778/b7RwdYEqIxxNftqqCNf44mU9reP/VLBiQncfk
 tvCLkZHFQFrMQZqQuqsffn0Q/fYb8+fDBcfVCUFsGYUGQXZEb6RBy5BBI44dJ32SX7
 VAXKH4EI3h5wanmVvEV1wIRcnuL0HZes0VDiLp7TgaBcGF7/zDfWrl+poZ6EyUOvng
 85wGjO2B7Qi+w==
Date: Mon, 22 Aug 2022 11:27:19 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Message-ID: <YwPKh9fWUJLnSEF/@sol.localdomain>
References: <20220815235052.86545-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815235052.86545-1-ebiggers@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 15, 2022 at 04:50:50PM -0700, Eric Biggers wrote:
 > This series changes ext4 and f2fs to stop using PG_error to track >
 decryption
 and verity errors. This is a step towards freeing up > PG [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oQC91-00DQ93-P6
Subject: Re: [f2fs-dev] [PATCH v2 0/2] ext4,
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 15, 2022 at 04:50:50PM -0700, Eric Biggers wrote:
> This series changes ext4 and f2fs to stop using PG_error to track
> decryption and verity errors.  This is a step towards freeing up
> PG_error for other uses, as discussed at
> https://lore.kernel.org/linux-fsdevel/Yn10Iz1mJX1Mu1rv@casper.infradead.org
> 
> Note: due to the interdependencies with fs/crypto/ and fs/verity/,
> I couldn't split this up into separate patches for each filesystem.
> I'd appreciate Acks from the ext4 and f2fs maintainers so that I can
> take these patches.  Otherwise I'm not sure how to move them forward.
> 
> Changed v1 => v2:
>    - Rebased onto v6.0-rc1 and resolved conflicts in f2fs.
> 
> Eric Biggers (2):
>   fscrypt: stop using PG_error to track error status
>   fsverity: stop using PG_error to track error status
> 
>  fs/crypto/bio.c         | 16 +++++++----
>  fs/ext4/readpage.c      | 16 +++++------
>  fs/f2fs/compress.c      | 64 ++++++++++++++++++++---------------------
>  fs/f2fs/data.c          | 64 +++++++++++++++++++++++------------------
>  fs/verity/verify.c      | 12 ++++----
>  include/linux/fscrypt.h |  5 ++--
>  6 files changed, 93 insertions(+), 84 deletions(-)
> 
> 
> base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868

I'd appreciate review from the f2fs folks on this series, as that's where the
most complex changes are.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
