Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CCB2C1CB8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Nov 2020 05:31:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1khPzI-0006xx-8q; Tue, 24 Nov 2020 04:31:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1khPzF-0006xZ-8e
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Nov 2020 04:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VHn/LY3N41cBqb++YT7COFjZjSG3pyeFoNVSq3U3SLU=; b=VwRq3r6rSDbK2Hs3dxOHgb0/8b
 +eUwd7x2HLXkndLdFX8a82pI9QbVUpH3I/YarqxBaQ4aHGoD8JtsFD4j0IL8vtfr3/rtpXwvBUEx9
 HvhqVwBZNGLEl1DmzS5AfgxTWzjc07MJOFchFMGg4EPvuhGS9xKdhkwbzuD/Y4lPKq9s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VHn/LY3N41cBqb++YT7COFjZjSG3pyeFoNVSq3U3SLU=; b=aT7Fg7h6CmsYsU7IBIIR0RnSKg
 qh7VaTDGewLs2ifE/iYhIGhV7AOvMBcI83F2FHxO1Cm2ZEDgxhNsw9SS7WkqDYKFiQj6CIOpar5yI
 BMPutBeF3ETJ9TJM6SGbFDM1JBOAhdgrrHv16PsMicc6WRlynLfp2ALmNPCzCxW/6smg=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1khPzA-00Cjon-70
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Nov 2020 04:31:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 0F22D1F44A84
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Eric Biggers <ebiggers@kernel.org>
Organization: Collabora
References: <20201119060904.463807-1-drosen@google.com>
 <20201119060904.463807-3-drosen@google.com>
 <87y2iuj8y2.fsf@collabora.com> <X7w4C8GAy+P9KNU6@sol.localdomain>
Date: Mon, 23 Nov 2020 23:31:05 -0500
In-Reply-To: <X7w4C8GAy+P9KNU6@sol.localdomain> (Eric Biggers's message of
 "Mon, 23 Nov 2020 14:30:35 -0800")
Message-ID: <87blfnpe9i.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1khPzA-00Cjon-70
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

Eric Biggers <ebiggers@kernel.org> writes:

> On Sat, Nov 21, 2020 at 11:45:41PM -0500, Gabriel Krisman Bertazi wrote:
>> > diff --git a/fs/ext4/super.c b/fs/ext4/super.c
>> > index 6633b20224d5..0288bedf46e1 100644
>> > --- a/fs/ext4/super.c
>> > +++ b/fs/ext4/super.c
>> > @@ -4968,11 +4968,6 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
>> >  		goto failed_mount4;
>> >  	}
>> >  
>> > -#ifdef CONFIG_UNICODE
>> > -	if (sb->s_encoding)
>> > -		sb->s_d_op = &ext4_dentry_ops;
>> > -#endif
>> 
>> This change has the side-effect of removing the capability of the root
>> directory from being case-insensitive.  It is not a backward
>> incompatible change because there is no way to make the root directory
>> CI at the moment (it is never empty). But this restriction seems
>> artificial. Is there a real reason to prevent the root inode from being
>> case-insensitive?
>> 
>
> The problem is that the "lost+found" directory is special in that e2fsck needs
> to be able to find it.
>
> That's the reason why ext4 doesn't allow the root directory to be encrypted.
> (And encrypting the root directory isn't really useful anyway, since if the goal
> is to encrypt a whole filesystem with one key, dm-crypt is a better solution.)
>
> Casefolding is a bit less problematic than encryption.  But it still doesn't
> entirely work, as e.g. if you name the directory "LOST+FOUND" instead (the
> directory is casefolded after all...), then e2fsck can't find it.
>
> Unless there's a real use case for the root directory being casefolded and
> people are willing to fix e2fsck, I think we should just make ext4 return an
> error when setting the casefold flag on the root directory, like it does when
> trying to enable encryption on the root directory.

I don't have a use case where I need a root directory to be CI.  In
fact, when I first implemented CI, I did want to block the root directory
from being made CI, just to prevent people from doing "chattr +F /" and
complaining afterwards when /usr/lib breaks.

My concern with the curent patch was whether this side-effect was
considered, but I'm happy with either semantics.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
