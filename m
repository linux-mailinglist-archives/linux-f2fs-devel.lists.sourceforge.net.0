Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8DA2C1860
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Nov 2020 23:31:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1khKMS-0005OF-HL; Mon, 23 Nov 2020 22:31:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1khKMR-0005Ny-2t
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Nov 2020 22:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XXu49o5iZyspA2ifZyeWEGWGTBk61BoVOtCr1XTfB4U=; b=J0UHXvRJEhMMytLOV2ZUXJm8xb
 Ne0jQ9wVUdYNL/NSjVMMmi0zxwAIspBOL9HLvSiU42vUOlBpWNDBK+PWeUrW+mhFBa4JyA5mdXOeb
 VhA6QWhZ6TjoEPO4PH56UHJinFvjut4ybzWJFDdiTZLZ+AGtrYmQcjoWzeRvmBEoexKY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XXu49o5iZyspA2ifZyeWEGWGTBk61BoVOtCr1XTfB4U=; b=QCMUKZnOHAioFj7OKeArON/TpH
 l2YOgAcotSz4eSEvpdn0kR8QKq7t+HIJ27RA5rcqd9rr/0UwtWpirVwZKBmuN8DrKo3/Peen64bpw
 +DwwyyHH5iopqaP/lkg0tDY5efxh8+QQphUARP6029a5iM1ItOB7DioDTwosbKtpl4DA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1khKMI-00C5Hl-S6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Nov 2020 22:31:02 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75A21206D5;
 Mon, 23 Nov 2020 22:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606170638;
 bh=qMsLhguUfZGHthn8o/bIe+LRx3PrKd4xYprbL94g5Es=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DNfDxTnuJc/9ZOQO+U1ViZqPntmi9u+PapFohdzgovjh/jy/Yy4xVB33Rww+qBRm7
 az2CJzZnLZkYf7iatMCzDNGSHVMHyPoXq/qiSNoa3lsby8//RGmrveXMtq3Cqen2Q2
 SidiEvRqa7Jbzx0Zmg8juZV1Q8JiUJnD9dIkecsc=
Date: Mon, 23 Nov 2020 14:30:35 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <X7w4C8GAy+P9KNU6@sol.localdomain>
References: <20201119060904.463807-1-drosen@google.com>
 <20201119060904.463807-3-drosen@google.com>
 <87y2iuj8y2.fsf@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y2iuj8y2.fsf@collabora.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1khKMI-00C5Hl-S6
Subject: Re: [f2fs-dev] [PATCH v4 2/3] fscrypt: Have filesystems handle
 their d_ops
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Daniel Rosenberg <drosen@google.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Nov 21, 2020 at 11:45:41PM -0500, Gabriel Krisman Bertazi wrote:
> > diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> > index 6633b20224d5..0288bedf46e1 100644
> > --- a/fs/ext4/super.c
> > +++ b/fs/ext4/super.c
> > @@ -4968,11 +4968,6 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
> >  		goto failed_mount4;
> >  	}
> >  
> > -#ifdef CONFIG_UNICODE
> > -	if (sb->s_encoding)
> > -		sb->s_d_op = &ext4_dentry_ops;
> > -#endif
> 
> This change has the side-effect of removing the capability of the root
> directory from being case-insensitive.  It is not a backward
> incompatible change because there is no way to make the root directory
> CI at the moment (it is never empty). But this restriction seems
> artificial. Is there a real reason to prevent the root inode from being
> case-insensitive?
> 

The problem is that the "lost+found" directory is special in that e2fsck needs
to be able to find it.

That's the reason why ext4 doesn't allow the root directory to be encrypted.
(And encrypting the root directory isn't really useful anyway, since if the goal
is to encrypt a whole filesystem with one key, dm-crypt is a better solution.)

Casefolding is a bit less problematic than encryption.  But it still doesn't
entirely work, as e.g. if you name the directory "LOST+FOUND" instead (the
directory is casefolded after all...), then e2fsck can't find it.

Unless there's a real use case for the root directory being casefolded and
people are willing to fix e2fsck, I think we should just make ext4 return an
error when setting the casefold flag on the root directory, like it does when
trying to enable encryption on the root directory.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
