Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB3C1F6A82
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jun 2020 17:02:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jjOiY-0001L1-57; Thu, 11 Jun 2020 15:02:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1jjOiW-0001Ks-71
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jun 2020 15:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Atbx5KRkV9iAZ2YZme7cGFVu4Hgia5eKp3Ejnouy10s=; b=aTUOm3OEjMauSR87zXNGw0cNsT
 BNehggblBrfwblBdWkLCFAQdyGvp+1ZysrrDx2a5LS8JeMAmxn/2zuTIAZjRPnwUAn+7g5uam2RW9
 GEvRfXESDUxQvHRUkrekT4eJg64dJZn3i+8FlEp/4R+hwPVLi39ffAiIXlSEv8Oh3Itc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Atbx5KRkV9iAZ2YZme7cGFVu4Hgia5eKp3Ejnouy10s=; b=Hz3R+ToItzBUfQSdkXNyUqqs1O
 qPzKnAz46w5tC7tVVvjKPezKHhZeKzEqL704L6uD0z4erOc/mejnoI3PMZZNWwo1EJ/eaF/wwBg8w
 XutkpzIe5q6dEymsAGScJQ1+m5g0e9qtPfZhsMf7TUpdiUac2RZrHj9mT45EM6b62bUo=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jjOiU-00Gkca-58
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jun 2020 15:02:08 +0000
Received: from callcc.thunk.org (pool-100-0-195-244.bstnma.fios.verizon.net
 [100.0.195.244]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 05BF1oeZ025687
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jun 2020 11:01:51 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 8C5C84200DD; Thu, 11 Jun 2020 11:01:50 -0400 (EDT)
Date: Thu, 11 Jun 2020 11:01:50 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Andreas Dilger <adilger@dilger.ca>
Message-ID: <20200611150150.GO1347934@mit.edu>
References: <20200601200543.59417-1-ebiggers@kernel.org>
 <E876FECB-300E-471B-A790-D44F2F1A3F9A@dilger.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E876FECB-300E-471B-A790-D44F2F1A3F9A@dilger.ca>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [18.9.28.11 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.org.uk]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jjOiU-00Gkca-58
Subject: Re: [f2fs-dev] [PATCH v2] ext4: avoid utf8_strncasecmp() with
 unstable name
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
Cc: Daniel Rosenberg <drosen@google.com>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 01, 2020 at 02:49:51PM -0600, Andreas Dilger wrote:
> On Jun 1, 2020, at 2:05 PM, Eric Biggers <ebiggers@kernel.org> wrote:
> > 
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > If the dentry name passed to ->d_compare() fits in dentry::d_iname, then
> > it may be concurrently modified by a rename.  This can cause undefined
> > behavior (possibly out-of-bounds memory accesses or crashes) in
> > utf8_strncasecmp(), since fs/unicode/ isn't written to handle strings
> > that may be concurrently modified.
> > 
> > Fix this by first copying the filename to a stack buffer if needed.
> > This way we get a stable snapshot of the filename.
> > 
> > Fixes: b886ee3e778e ("ext4: Support case-insensitive file name lookups")
> > Cc: <stable@vger.kernel.org> # v5.2+
> > Cc: Al Viro <viro@zeniv.linux.org.uk>
> > Cc: Daniel Rosenberg <drosen@google.com>
> > Cc: Gabriel Krisman Bertazi <krisman@collabora.co.uk>
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> LGTM.
> 
> Reviewed-by: Andreas Dilger <adilger@dilger.ca>

Thanks, applied.

					- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
