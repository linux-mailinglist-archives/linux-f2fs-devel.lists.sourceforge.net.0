Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC8D139E30
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jan 2020 01:29:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1irA4y-0000XJ-T6; Tue, 14 Jan 2020 00:29:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1irA4u-0000Wf-P7
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jan 2020 00:29:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wdTcGZlD6LlYydyLZhl7WvL2IIddcpNW5q/QVOKKps4=; b=M9g50+lDwMAIDK5cnfaFRxenn4
 PMjMmUDSFLMWQUKBlZ8IYACW0EXjJLHj39CAmN+EHpaplq0bMKxhpAzy/FDY8V8vtkmhYD0SvDkK6
 NN5/UWbm6FMxbXaDMw0cVwJlPPF4ck0WTtDDC5K0+N1qtnDv2i1GMa4q3M3Ssi3qQjz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wdTcGZlD6LlYydyLZhl7WvL2IIddcpNW5q/QVOKKps4=; b=lSHQURhYgSwTq5npvYaYDxRWQj
 O50ORnjIJdsE+7/kX6/rdNlgKpEHFbkst9dweQNj3Q8UZm4Ktkh5a4TFKDvlBtaLnAOC++qN9m6UX
 scSA+g4J5szH72Y2P1vA6/gGKNnO8jCUeJ20YT7R5mRAk4f5SfqRhA5821KtXW06N3J0=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1irA4s-003zmv-Jg
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jan 2020 00:29:04 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-111.corp.google.com
 [104.133.0.111] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 00E0Snjm003493
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 19:28:50 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 49D9C4207DF; Mon, 13 Jan 2020 19:28:44 -0500 (EST)
Date: Mon, 13 Jan 2020 19:28:44 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200114002844.GA116395@mit.edu>
References: <20191231175545.20709-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191231175545.20709-1-ebiggers@kernel.org>
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.5 MAY_BE_FORGED          Relay IP's reverse DNS does not resolve to IP
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1irA4s-003zmv-Jg
Subject: Re: [f2fs-dev] [PATCH] fs-verity: use mempool for hash requests
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Dec 31, 2019 at 11:55:45AM -0600, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> When initializing an fs-verity hash algorithm, also initialize a mempool
> that contains a single preallocated hash request object.  Then replace
> the direct calls to ahash_request_alloc() and ahash_request_free() with
> allocating and freeing from this mempool.
> 
> This eliminates the possibility of the allocation failing, which is
> desirable for the I/O path.
> 
> This doesn't cause deadlocks because there's no case where multiple hash
> requests are needed at a time to make forward progress.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good; feel free to add:

Reviewed-by: Theodore Ts'o <tytso@mit.edu>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
