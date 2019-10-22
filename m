Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA9EDFD64
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2019 08:00:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iMnDS-00082L-AP; Tue, 22 Oct 2019 06:00:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iMnDQ-000826-OY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 06:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rPXtgV8Vk6dAg9a8yA5TeKe3kEdEnUALArUqljqGVOo=; b=lE3P2LekGYd4rsNt0me/w63vgO
 mhesopzMrp1ukpHazMn2wf2UqG1jEUrh6m1NTyOZW1HU+K6Qn7axeq08d8EL7nGexKXPxMXrWbQG3
 II6MbDwn9WsmHhp0bA75m2t9QzPlhyTYPsgAg4UpijdYPIQ5aZ/l6EoX9lXfgav+puLQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rPXtgV8Vk6dAg9a8yA5TeKe3kEdEnUALArUqljqGVOo=; b=Y3aad99pXiz1bVHvry1L6sRXu+
 FoFISyrU78Ala03S5kUm2IvsJIjX1y+q1ly2vzwWv+3wFhivAKJPWGE4R9VPJj/+BuNvizI+cY4j8
 EVFEPMU3oHtKjUX0fQCc6JRlXmKiAtVvfJJND0kmTpM+GCkpPXz+hJObzaFvTIVTQNAg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iMnDN-00GS4T-2h
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 06:00:20 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 578F92089E;
 Tue, 22 Oct 2019 06:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571724006;
 bh=IV+O29anGZ56O62huhHa4OXym9e0Xnv7gAZOs76+eK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q3YwoQVs7bPCIFItl4itSXlw7LYeUrnwtcXhnDi1R1G97a4bw3wQtQO50DPxp8JPZ
 Qe97F9ZDTVfkx0fPuafbZUD/ny2xzKwsOz5gLgjYbpAkOC15pCe8e5FI4Juuxj/XNf
 QZiILELJNEMdNqBqi3bjjKdN+Bzgif+iVsCmzOwg=
Date: Mon, 21 Oct 2019 23:00:04 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20191022060004.GA333751@sol.localdomain>
Mail-Followup-To: Dave Chinner <david@fromorbit.com>,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 Paul Crowley <paulcrowley@google.com>,
 Paul Lawrence <paullawrence@google.com>,
 "Theodore Y . Ts'o" <tytso@mit.edu>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20191021230355.23136-1-ebiggers@kernel.org>
 <20191021230355.23136-2-ebiggers@kernel.org>
 <20191022052712.GA2083@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022052712.GA2083@dread.disaster.area>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iMnDN-00GS4T-2h
Subject: Re: [f2fs-dev] [PATCH 1/3] fscrypt: add support for
 inline-encryption-optimized policies
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
Cc: linux-f2fs-devel@lists.sourceforge.net, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Satya Tangirala <satyat@google.com>, Paul Lawrence <paullawrence@google.com>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Oct 22, 2019 at 04:27:12PM +1100, Dave Chinner wrote:
> On Mon, Oct 21, 2019 at 04:03:53PM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Some inline encryption hardware has only a small number of keyslots,
> > which would make it inefficient to use the traditional fscrypt per-file
> > keys.  The existing DIRECT_KEY encryption policy flag doesn't solve this
> > because it assumes that file contents and names are encrypted by the
> > same algorithm and that IVs are at least 24 bytes.
> > 
> > Therefore, add a new encryption policy flag INLINE_CRYPT_OPTIMIZED which
> > causes the encryption to modified as follows:
> > 
> > - The key for file contents encryption is derived from the values
> >   (master_key, mode_num, filesystem_uuid).  The per-file nonce is not
> >   included, so many files may share the same contents encryption key.
> > 
> > - The IV for encrypting each block of file contents is built as
> >   (inode_number << 32) | file_logical_block_num.
> > 
> > Including the inode number in the IVs ensures that data in different
> > files is encrypted differently, despite per-file keys not being used.
> > Limiting the inode and block numbers to 32 bits and putting the block
> > number in the low bits is needed to be compatible with inline encryption
> > hardware which only supports specifying a 64-bit data unit number which
> > is auto-incremented; this is what the UFS and EMMC standards support.
> 
> These 32 bit size limits seem arbitrary and rules out implementing
> this on larger filesystems. Why not just hash the 64 bit inode, file
> offset and block numbers into a single 64 bit value? It is still
> unique enough for the stated use (i.e. unique IV for each file
> block) but it doesn't limit what filesystem configurations can
> actually make use of this functionality....
> 

That won't work because we need consecutive file blocks to have consecutive IVs
as often as possible.  The crypto support in the UFS and EMMC standards takes
only a single 64-bit "data unit number" (DUN) per request, which the hardware
uses as the first 64 bits of the IV and automatically increments for each data
unit (i.e. for each filesystem block, in this case).

If every block had some random DUN, we'd have to submit a separate bio for every
single block.  And they wouldn't be mergable, so each one would cause a separate
disk request.  That would be really terrible for performance.

Also, a 64 bit hash value isn't sufficiently safe against hash collisions.

An alternative which would work nicely on ext4 and xfs (if xfs supported
fscrypt) would be to pass the physical block number as the DUN.  However, that
wouldn't work at all on f2fs because f2fs moves data blocks around.  And since
most people who want to use this are using f2fs, f2fs support is essential.

Also keep in mind that the proposed format can still be used on a specific
filesystem instance with fewer than 2^32 inodes and blocks, even if that type of
filesystem can support more inodes and blocks in general.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
