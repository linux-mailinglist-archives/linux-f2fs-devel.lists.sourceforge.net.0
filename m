Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 373F42DDBE6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Dec 2020 00:34:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kq2nG-0002nM-2I; Thu, 17 Dec 2020 23:34:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1kq2nF-0002nG-9R
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 23:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CCbIyxfzTVO4C68hiOUoZg0n9pU5n5sQ+UWlUzoQuBw=; b=da706iiA8yWx2MBIjd481Z1g/K
 MZiGpQsyUbQrY+GxjCXv1jGCq5ZxUWQLMWB57UJ/6a8ojYucJt2YFRKolcgXh7HJXi7yyfT9w62YH
 rCPfnuA5J8i/gCB0WRKOplkjl9wQKksOnaHYLfuq4xrflsP42MR5TGztaU5v9V0uWIVI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CCbIyxfzTVO4C68hiOUoZg0n9pU5n5sQ+UWlUzoQuBw=; b=KjlEKCrGUJaat02ND6wy3LFTNl
 ZUq7zaZdLm8sBxo4vjbGY0jRs2/vtduocvP1zU87mQzKdv1AIJYrUGTCTgjbiX2ZN9bG1hsw0t9sH
 hUDinhmp0bO9TSzH4zQUre+zMO0h+sZ91QY7ZwMJP4gEm9ksIfmizuGK3PQ+YDsJ77uw=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kq2nA-000dMK-5e
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 23:34:45 +0000
Received: from callcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 0BHNYRol004556
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 18:34:28 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 98868420280; Thu, 17 Dec 2020 18:34:27 -0500 (EST)
Date: Thu, 17 Dec 2020 18:34:27 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Satya Tangirala <satyat@google.com>
Message-ID: <X9vrA/h8et4japdI@mit.edu>
References: <20201217150435.1505269-1-satyat@google.com>
 <X9uesUH1oetyyoA0@mit.edu> <X9vEwgHlURxvxqiM@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9vEwgHlURxvxqiM@google.com>
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [18.9.28.11 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.3 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1kq2nA-000dMK-5e
Subject: Re: [f2fs-dev] [PATCH v2 0/3] add support for metadata encryption
 to F2FS
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Dec 17, 2020 at 08:51:14PM +0000, Satya Tangirala wrote:
> On Thu, Dec 17, 2020 at 01:08:49PM -0500, Theodore Y. Ts'o wrote:
> > On Thu, Dec 17, 2020 at 03:04:32PM +0000, Satya Tangirala wrote:
> > > This patch series adds support for metadata encryption to F2FS using
> > > blk-crypto.
> > 
> > Is there a companion patch series needed so that f2fstools can
> > check/repair a file system with metadata encryption enabled?
> > 
> > 	       	    	   	- Ted
> Yes! It's at
> https://lore.kernel.org/linux-f2fs-devel/20201217151013.1513045-1-satyat@google.com/

Cool, I've been meaning to update f2fs-tools in Debian, and including
these patches will allow us to generate {kvm,gce,android}-xfstests
images with this support.  I'm hoping to get to it sometime betweeen
Christmas and New Year's.

I guess there will need to be some additional work needed to create
the f2fs image with a fixed keys for a particular file system in
xfstests-bld, and then mounting and checking said image with the
appropriatre keys as well.   Is that something you've put together?

Cheers,

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
