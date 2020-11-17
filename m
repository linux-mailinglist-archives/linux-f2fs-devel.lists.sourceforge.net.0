Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 204B12B6BCA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 18:34:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kf4sO-0000O5-IA; Tue, 17 Nov 2020 17:34:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1kf4rr-0000MU-Iv
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 17:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+z0hHykfMnIPDUROAnAXl6rNA391niQ2wSPF//DPRRY=; b=WW+mOc9GDe/ZClHD8TXMzBU0w6
 m9hQkH40ubJUpDRXpg+IXIo2ZcmnPW3wUCGP8fkyXZiP93udwHfH/cfYutbK2Lx/cMzxrHn8UJtyd
 QTA+PgtLMc2yROhXO/Jh1MkCyqhlxlCrzz9wqWH1vS6fzIgD5Iz6lCEeoTOVRJQa+h3A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+z0hHykfMnIPDUROAnAXl6rNA391niQ2wSPF//DPRRY=; b=ONL5MXId8xGVF4UE6rJmQcp2Ui
 joyAWKI8zry8UmS9OqeBmG0w1TAL5dWeYfYqFlCM1mXHy0S4evw1yud6ui2ZvUzYcgO9bL9wrGuTt
 PbGqSUN2NF/AmTLJL4tfujFUyDbHF45SRH53sst5sxg/KtEdNw5nNCgi6v32t1Sv9duc=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kf4rb-001Csi-3A
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 17:34:11 +0000
Received: from callcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 0AHHXWfn000355
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 12:33:32 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id DC283420107; Tue, 17 Nov 2020 12:33:31 -0500 (EST)
Date: Tue, 17 Nov 2020 12:33:31 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20201117173331.GE445084@mit.edu>
References: <20201117040315.28548-1-drosen@google.com>
 <20201117040315.28548-2-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117040315.28548-2-drosen@google.com>
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [18.9.28.11 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1kf4rb-001Csi-3A
Subject: Re: [f2fs-dev] [PATCH v2 1/3] libfs: Add generic function for
 setting dentry_ops
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
Cc: kernel-team@android.com, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 17, 2020 at 04:03:13AM +0000, Daniel Rosenberg wrote:
> This adds a function to set dentry operations at lookup time that will
> work for both encrypted filenames and casefolded filenames.
> 
> A filesystem that supports both features simultaneously can use this
> function during lookup preparations to set up its dentry operations once
> fscrypt no longer does that itself.
> 
> Currently the casefolding dentry operation are always set if the
> filesystem defines an encoding because the features is toggleable on
> empty directories. Since we don't know what set of functions we'll
> eventually need, and cannot change them later, we add just add them.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>

Reviewed-by: Theodore Ts'o <tytso@mit.edu>

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
