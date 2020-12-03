Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DA72CD81D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 14:46:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkow5-00063v-0T; Thu, 03 Dec 2020 13:46:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1kkovq-00063W-5C
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 13:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ES4ERj1cnhFwDNi2dwh/q2Gl2T9Ed+f/+AV0TUXjD2c=; b=S2oY4wJ9nbiy7TDD9KrjtjGNBg
 +x0SAaGcr4W1DCZd/ddlq7bBcnpt9HOicOsZXHbKZKcpOu4h7xwZBMixtnQgTw/wfA20Ctt4n41E8
 +Y4E6/3VBOK53EiQPXjgVEdNres0gENH83VRHWxI25/WxLvRwZsQRvZ71AQm46kpUav8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ES4ERj1cnhFwDNi2dwh/q2Gl2T9Ed+f/+AV0TUXjD2c=; b=RgdX1pRxlLXjJL5owiYBnFYd6r
 VGYbzCrOeW7U4AxYz6MePYAJvISJzblgq+eCmW4PDb6Ex22YBd9V4XIVjLGsSbQ2IIGNIXb0ByWQ+
 Q2gQgGT7U+n4ucRX2ddPSYkS4T2AladbjQRi0CEBVtBT7HODEGAq5y7mlf2fdkXKqTE0=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkovm-00DTE3-W3
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 13:46:02 +0000
Received: from callcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 0B3DjdIr014834
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 3 Dec 2020 08:45:40 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 58FF3420136; Thu,  3 Dec 2020 08:45:39 -0500 (EST)
Date: Thu, 3 Dec 2020 08:45:39 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20201203134539.GB441757@mit.edu>
References: <20201117140708.1068688-1-satyat@google.com>
 <20201117140708.1068688-7-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117140708.1068688-7-satyat@google.com>
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [18.9.28.11 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1kkovm-00DTE3-W3
Subject: Re: [f2fs-dev] [PATCH v7 6/8] ext4: support direct I/O with fscrypt
 using blk-crypto
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-xfs@vger.kernel.org,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-kernel@vger.kernel.org,
 Eric Biggers <ebiggers@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-block@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 17, 2020 at 02:07:06PM +0000, Satya Tangirala wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Wire up ext4 with fscrypt direct I/O support. Direct I/O with fscrypt is
> only supported through blk-crypto (i.e. CONFIG_BLK_INLINE_ENCRYPTION must
> have been enabled, the 'inlinecrypt' mount option must have been specified,
> and either hardware inline encryption support must be present or
> CONFIG_BLK_INLINE_ENCYRPTION_FALLBACK must have been enabled). Further,
> direct I/O on encrypted files is only supported when the *length* of the
> I/O is aligned to the filesystem block size (which is *not* necessarily the
> same as the block device's block size).
> 
> fscrypt_limit_io_blocks() is called before setting up the iomap to ensure
> that the blocks of each bio that iomap will submit will have contiguous
> DUNs. Note that fscrypt_limit_io_blocks() is normally a no-op, as normally
> the DUNs simply increment along with the logical blocks. But it's needed
> to handle an edge case in one of the fscrypt IV generation methods.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Co-developed-by: Satya Tangirala <satyat@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>
> Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>

Acked-by: Theodore Ts'o <tytso@mit.edu>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
