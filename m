Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB9CEB4F9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Oct 2019 17:46:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQDaP-0005mU-K1; Thu, 31 Oct 2019 16:46:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1iQDaO-0005mL-5Y
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 16:46:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YT5T/JSZpVvyS0Hu5F6NLKnZ4tWPvCj79EzTovY8TOU=; b=fwicKSRR9WBMko4dQFlX7coq3e
 U5hWGlV/IQ9AlN9+9VIUm2ChgEbVYNU5Ev4UXKZRyeqWCca4M/CB7WOFiESQIbT4kjLUz2lSoqKV1
 6zYx2sKkh4sZom5QTxOaUcXvnVX5uQgxRErTEq7/m8Q7+XH+ksQNjn9kcd7Axz2jP6lg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YT5T/JSZpVvyS0Hu5F6NLKnZ4tWPvCj79EzTovY8TOU=; b=Xkb1JgqQIA8/zKmDTHZYOjMeVc
 K3IFP1AKhxGVSzuP0wddB6fm9hMuC7EQW5SrL0XZkbl2t7lI9esngaKKVYq8gLLtm/hvTumSfjJ4R
 JXIipXiAd9yLSqthSLdnimME65n/QdXbnKYj6xZ5M4aH6YsZepbjmWv2FBrUdK6hkv/w=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iQDaJ-00B3N7-2C
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Oct 2019 16:46:12 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-98.corp.google.com
 [104.133.0.98] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x9VGjo7m016231
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Oct 2019 12:45:51 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 6335E420456; Thu, 31 Oct 2019 12:45:50 -0400 (EDT)
Date: Thu, 31 Oct 2019 12:45:50 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20191031164550.GF16197@mit.edu>
References: <20191030215138.224671-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030215138.224671-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 MAY_BE_FORGED          Relay IP's reverse DNS does not resolve to IP
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iQDaJ-00B3N7-2C
Subject: Re: [f2fs-dev] [PATCH v2] Revert "ext4 crypto: fix to check feature
 status before get policy"
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
Cc: Gwendal Grignou <gwendal@chromium.org>, apronin@chromium.org,
 Ryo Hashimoto <hashimoto@chromium.org>, sukhomlinov@google.com,
 Douglas Anderson <dianders@chromium.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 groeck@chromium.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 30, 2019 at 02:51:38PM -0700, Eric Biggers wrote:
> From: Douglas Anderson <dianders@chromium.org>
> 
> This reverts commit 0642ea2409f3 ("ext4 crypto: fix to check feature
> status before get policy").
> 
> The commit made a clear and documented ABI change that is not backward
> compatible.  There exists userspace code [1][2] that relied on the old
> behavior and is now broken.
> 
> While we could entertain the idea of updating the userspace code to
> handle the ABI change, it's my understanding that in general ABI
> changes that break userspace are frowned upon (to put it nicely).

The rule is that if someone complains, we have to revert.  Douglas's
email counts as a complaint, so we should revert.  That being said, if
ChromeOS (userspace) changes to using /sys/fs/ext4/features/encryption
to determine whether or not the kernel supports encryption, then we
can in the future change the error code to make things consistent with
f2fs.

This looks good, I'll pull it into ext4 git tree.

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
