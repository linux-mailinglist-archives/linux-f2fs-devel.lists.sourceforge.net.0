Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D50B2B6BC4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 18:31:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kf4pO-00006C-V2; Tue, 17 Nov 2020 17:31:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1kf4pM-0008OY-V3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 17:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zdh5lewhBVzLnXIlezHPpsXCdaW9+Zml0vPmNW9oRo0=; b=FsyTRt/V5EnlCRCPZSVnFMHM2w
 up9DyYGNNVI2hnTw3g8RwagHXsxJwlIhDmY7J2Fb0Cy/C0Mz/qgCWrefNOPDdk05ucppTn+bFMDBq
 m3K81MQf+tLGxF5Rv8G9nvONcC/5e0loXaR2R54KjsGFrz1uDMRUfJGSfO7SPE3og0gw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zdh5lewhBVzLnXIlezHPpsXCdaW9+Zml0vPmNW9oRo0=; b=kFm43R55Qi7X4kHYDBuzHcLpbF
 YWc3R757Xj7Tn4+mK+BRPuFnovGDAUPZBgSFuUK3dh8rRojF6rPLikEV8TyCmrj9u9C9ZeUdW7ecz
 KkPbbaPzziZIf98IbazWukFQ3sNO20L4cVvbsDtJ9yWmqqGItTa6XSPx5I/dai4m7UBw=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kf4a6-00ArAN-Vl
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 17:15:54 +0000
Received: from callcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 0AHHFQSN025997
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 12:15:27 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 611CD420107; Tue, 17 Nov 2020 12:15:26 -0500 (EST)
Date: Tue, 17 Nov 2020 12:15:26 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20201117171526.GD445084@mit.edu>
References: <20201117140708.1068688-1-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117140708.1068688-1-satyat@google.com>
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [18.9.28.11 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1kf4a6-00ArAN-Vl
Subject: Re: [f2fs-dev] [PATCH v7 0/8] add support for direct I/O with
 fscrypt using blk-crypto
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
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

What is the expected use case for Direct I/O using fscrypt?  This
isn't a problem which is unique to fscrypt, but one of the really
unfortunate aspects of the DIO interface is the silent fallback to
buffered I/O.  We've lived with this because DIO goes back decades,
and the original use case was to keep enterprise databases happy, and
the rules around what is necessary for DIO to work was relatively well
understood.

But with fscrypt, there's going to be some additional requirements
(e.g., using inline crypto) required or else DIO silently fall back to
buffered I/O for encrypted files.  Depending on the intended use case
of DIO with fscrypt, this caveat might or might not be unfortunately
surprising for applications.

I wonder if we should have some kind of interface so we can more
explicitly allow applications to query exactly what the requirements
might be for a particular file vis-a-vis Direct I/O.  What are the
memory alignment requirements, what are the file offset alignment
requirements, what are the write size requirements, for a particular
file.

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
