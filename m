Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A25C80F60
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 15:18:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzyeqG5Y3pHJZq3SVPQFK+YC8zMQWa7h1P/ZkwxZxEc=; b=kUtpMRq7qY7uT7fIfAPbqz7Xsd
	UGAMqS12zPU5WZARwr1J3wjDqexrMxHMBXx9lkn0MdTTgLEFR2r9+ls0frqKlGQXpQz3P4uH8RozL
	kseTxSO7Y8NaeIytZaflCq2a0k8aaTKzvbB2HkWg4yFj7O4CEpMHvk4n5IpYshA3FWVU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNXOI-0004Wo-DZ;
	Mon, 24 Nov 2025 14:18:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vNXOG-0004Wa-Gn
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 14:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b3f4UnZO+WkXzK87bQ+9CQkFbBQ2PX20TL6+zXEz0xk=; b=CBoRJsKX40tJLuZzVDe+dAPKXN
 RdikbLLSBzCKG2kopVnKkvEC1S6+0iYOZdL5QS37+6y53wcO6snVuEceoIDgsHdtS7WA7Y41Qrpyj
 Vjg8+opKyISynY9pmb1rrvqb5b4ODPEz6S2Ed87fImjQYiCvpNU+RBQV+O9Z82T4sUfc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b3f4UnZO+WkXzK87bQ+9CQkFbBQ2PX20TL6+zXEz0xk=; b=MhgdLcB4E95M6qJEOAK5pnHMLy
 +qZhFPOuLviIFZOObx6b46gVQFnoCSnKkjR0iko9dgqPuceYOq0tdF/eazUoGV0cOzpYfrqxHWYYW
 WqzIJXDnui1OQ1T6Z9LKQUVwOPaiVYYSxvHHIl1GwknX8pY7JhowWcnbzYVU17k+watw=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNXOG-0003h2-Kp for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 14:18:05 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id E7D8168C4E; Mon, 24 Nov 2025 15:17:51 +0100 (CET)
Date: Mon, 24 Nov 2025 15:17:50 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20251124141750.GD14417@lst.de>
References: <20251118062159.2358085-1-hch@lst.de>
 <20251118062159.2358085-11-hch@lst.de> <20251122182926.GC1626@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251122182926.GC1626@quark>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Nov 22, 2025 at 10:29:26AM -0800, Eric Biggers wrote:
 > The type of 'len' is still unsigned int, so this reduces the maximum >
 length accepted by fscrypt_zeroout_range() from UINT32_MAX blocks [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vNXOG-0003h2-Kp
Subject: Re: [f2fs-dev] [PATCH 10/11] fscrypt: pass a byte length to
 fscrypt_zeroout_range
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
Cc: Christian Brauner <brauner@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Nov 22, 2025 at 10:29:26AM -0800, Eric Biggers wrote:
> The type of 'len' is still unsigned int, so this reduces the maximum
> length accepted by fscrypt_zeroout_range() from UINT32_MAX blocks to
> UINT32_MAX bytes.  Is that really okay?

Linus has limited Linux's read/write I/O sizes to a signed integer,
even if size_t/ssize_t could be larger.  We have internal support
to do a few things larger, so there would be precedence to support a
64-bit value and I'd be happy siwtch over to that.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
