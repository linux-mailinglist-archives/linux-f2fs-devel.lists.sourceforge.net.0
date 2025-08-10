Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF3EB1FA99
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Aug 2025 16:50:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOU5CngtqYBrKDKc6flY0V47v+dZvQgS58ygOuuN3Bw=; b=OkMaU9KdYz2cH7E0stwYSATNje
	mb6ObusAN/kWlS23sCHKiKP48xzh7e4NOomjxUEy97ShA+jXizLbNG+cd9qS5WG9LFzCpKYAwSDiZ
	b50jcbrVfYRznZv1S1l7dGZNH4/wsU8UZGYLXBTRP9a10p8CCvGpXrfXkhkB0iOpvbvw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ul7NB-0002I4-TN;
	Sun, 10 Aug 2025 14:50:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+f8289c006d63a7a0c32a+8022+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ul7N8-0002Hw-CA for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 14:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rwHgnvFkI8ol1FQ+5zHPEHRy/dxGqbdVD4J/8Z3UBxw=; b=hEt434xqs5WLpEAiZ1P0M4qXD7
 Kx2ZhksTL0wMOkLFgv6OOFVXH+m4kXLuzG2UsijS9TTwQ8mMAyhCyCVAHzfuWQ1JabyTWVCRwjzMA
 +8PK9NnJEWb38mmxO1rCEEsWDK1yNspA1lWkDwyXt+uBKgtnTAQF2wSX/2lxegoyLgmk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rwHgnvFkI8ol1FQ+5zHPEHRy/dxGqbdVD4J/8Z3UBxw=; b=Ke9pzM7u8IsHIQm9lYE51kfCT/
 37hu+mJuzEGeMEaKB0GUVXhbmNYRcCtodSoIx8wiXYl0NmaufgycOXtSVLLz+ivmZWGsI6QFgwMrx
 i6ILLn4e55FIY+63WspTQpYn2tgwpT8SAY2OClY+K+wCGpJSeabcUbfISM7dZuK8WLnE=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ul7N7-0007td-F5 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 14:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rwHgnvFkI8ol1FQ+5zHPEHRy/dxGqbdVD4J/8Z3UBxw=; b=VdASxwIZcUfPXD0ej7kzZEmUB8
 MHVwuMklV0Y1mYhBir4v43o30PGEb+fMO5v7uxKj7DHmNf4HIMzzamFT39Ujw32EispbuToedYhTP
 Oyuam4G5cQi6rv3riZOxqEd2/ZUsRf3nv/P7xe6AbU71E4S3yXklCJt/maNyXE8EnaHlfytMLyCg8
 AbqvvpqR8VL6z0jRWU5u8yftfWqnvdzKQ5ptqKq5piZ+de9ZcuEfhKAQ6phIwIevXcmXH3ERjElYl
 RWeRQ3MOS0pnt/Ac+/EQM+qGKZG7FS0gUBrj7Al117ACleeoJG8PxlQfvkz/3t4jxpWlyq2BqjIxq
 C64/uLbA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1ul7Mv-00000005iNZ-2w7q;
 Sun, 10 Aug 2025 14:49:53 +0000
Date: Sun, 10 Aug 2025 07:49:53 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <aJixkUfWPo5t8Ron@infradead.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Aug 10, 2025 at 12:56:53AM -0700, Eric Biggers wrote:
 > This is a cleaned-up implementation of moving the i_crypt_info and >
 i_verity_info
 pointers out of 'struct inode' and into the fs-specif [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ul7N7-0007td-F5
Subject: Re: [f2fs-dev] [PATCH v5 00/13] Move fscrypt and fsverity info out
 of struct inode
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Aug 10, 2025 at 12:56:53AM -0700, Eric Biggers wrote:
> This is a cleaned-up implementation of moving the i_crypt_info and
> i_verity_info pointers out of 'struct inode' and into the fs-specific
> part of the inode, as proposed previously by Christian at
> https://lore.kernel.org/r/20250723-work-inode-fscrypt-v4-0-c8e11488a0e6@kernel.org/

I would really much prefer to move fscrypt to use a hash lookup instead
of bloating all inodes for a each file system supporting it, even if
very few files on very few file systems are using it.  With the fsverity
xfs series posted again this is becoming personal :)

You mentioned you were looking into it but didn't like the rhashtable
API.  My offer to help with that still stands.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
