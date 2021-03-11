Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5513377F1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Mar 2021 16:37:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lKNNP-0005Wp-Q5; Thu, 11 Mar 2021 15:37:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1lKNNP-0005Wg-8Y
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Mar 2021 15:37:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HS/BGitTAvlUzGrLL1sVuRllUskFBQ+EpoD0+gVpU78=; b=MHAhfzsFMDZ7KKC2+cB+ihkOqu
 H+etSshuR+RbN2I1+qHIVLSOlbUkyNJDOQmo/KAcqcUQDqRNSz0RprXqGClYA9daX9SrDJJYQHiwz
 txaowzarJsPqo3AFWUVEalLyW3SqPD31fFKlacxuQnTNvAJWFvlPTHajRKRFD2PogkZw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HS/BGitTAvlUzGrLL1sVuRllUskFBQ+EpoD0+gVpU78=; b=MYnOuF/NW0H5BY39O3J76S2LOw
 FCWYQGguJt5X6vHf+/Zw+wZwyd8hFNvbuhZJgtaahZoY+C+6htLkuORDJ65s/ImpHzoMVWfPM+IqZ
 EdOhd2eSmKA3QGHlinbTuJVPKmzo46Vebg1k4fRZCnVdJlS68wzFzNavfhGsA4jGEXU8=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lKNNK-00H4DN-Eh
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Mar 2021 15:37:27 +0000
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 12BFaNsx028530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 10:36:24 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id D0C9815C3AA0; Thu, 11 Mar 2021 10:36:23 -0500 (EST)
Date: Thu, 11 Mar 2021 10:36:23 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YEo4958DZYm/21b+@mit.edu>
References: <20210302200420.137977-1-ebiggers@kernel.org>
 <20210302200420.137977-2-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210302200420.137977-2-ebiggers@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: hihonor.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [18.9.28.11 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lKNNK-00H4DN-Eh
Subject: Re: [f2fs-dev] [PATCH 1/2] ext4: fix error handling in
 ext4_end_enable_verity()
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
Cc: stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Mar 02, 2021 at 12:04:19PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> ext4 didn't properly clean up if verity failed to be enabled on a file:
> 
> - It left verity metadata (pages past EOF) in the page cache, which
>   would be exposed to userspace if the file was later extended.
> 
> - It didn't truncate the verity metadata at all (either from cache or
>   from disk) if an error occurred while setting the verity bit.
> 
> Fix these bugs by adding a call to truncate_inode_pages() and ensuring
> that we truncate the verity metadata (both from cache and from disk) in
> all error paths.  Also rework the code to cleanly separate the success
> path from the error paths, which makes it much easier to understand.
> 
> Reported-by: Yunlei He <heyunlei@hihonor.com>
> Fixes: c93d8f885809 ("ext4: add basic fs-verity support")
> Cc: <stable@vger.kernel.org> # v5.4+
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Thanks, LGTM.

I've applied this to the ext4 with minor adjustment; I eliminated the
double blank line here:

> +	ext4_clear_inode_state(inode, EXT4_STATE_VERITY_IN_PROGRESS);
> +	return 0;
> +
> +
> +stop_and_cleanup:
> +	ext4_journal_stop(handle);
     ...

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
