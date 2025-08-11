Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A170B20719
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Aug 2025 13:14:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJJUWGDHZpCu75769QAXFJOrUVBMqgCAcKVoqVsHLeg=; b=PMLpXtRvTbRiRw+jxWN++gMhZL
	EmFBqHlnmxOB8t3g9ewH6AGSZkUdmDns3k+6eTPNK8+hU5RKipkb1KtNgCAAlwMjDi9mn1y1TdSHe
	HERMZCl9UA6EOx/Y8D8ERZy7lEyjcE5CAG+fAKX5+QRdz+b5Qv1WDaxT2485H7gXLlKw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ulQTt-0001NP-Eq;
	Mon, 11 Aug 2025 11:14:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1ulQTq-0001NH-EU
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 11:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eCERekx2qJbgICEDcQPb6BFVY0/fxG8tnJnx/oSJL5Y=; b=XAEl+KRAvaDfsLAu/M9+pMtKWH
 tPjvIGZ2p1wOjqa6e+0gKYqOIp3egnK2QXcu82vF2p0rC1c1q3RMFOl/39RHqCTWj+PHX9xTZDIlX
 WUf7+dIt84nFA8TFsonIGx5jf0JgYSvMfknu+7OSPBn58j/wiIEz24hbqqimPrKFdXhc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eCERekx2qJbgICEDcQPb6BFVY0/fxG8tnJnx/oSJL5Y=; b=YJQ+d3Q2oElyBjIABXJyJB0ULl
 k235pXuVTdD2kDmBEfX6draHsDeqBBgxe5IuKigin/JX0egTlMZQx8ekgQzK9nqvmy3K1GHPB6qqg
 vmcxDW0wZGZDak2wkgI2+glgnoPbxqSxnRe+0nzSzwIzSLnS+Qr1MYTDvXyGNGq4q3G0=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ulQTp-0001GD-UV for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 11:14:18 +0000
Received: from trampoline.thunk.org
 (pool-173-48-111-121.bstnma.fios.verizon.net [173.48.111.121])
 (authenticated bits=0) (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 57BBDu6B029953
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Aug 2025 07:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1754910838; bh=eCERekx2qJbgICEDcQPb6BFVY0/fxG8tnJnx/oSJL5Y=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=gcppwGYuGui0YtwkeJc3OxTfMVHnLyj8Jh2ayVIvazlrORmfq8SYE2nQXClK46QIJ
 ZC4MvRWdgnmb+9xymUny2kGzBvOpXv44DovveuB6LHwx2tDKwSM+qvnWX1L+1WZtGM
 sHlkIBeFhaDnjkHqLKKEDm/cDTdrkPzXs+RbdbiXLTxcYkeqjx7BzzVWFMXxGhyhw4
 D63qXjT2VoccbtPx3dD4W0KJhjvZMLjyy/WZsSax9xtdH2TU8IEqZaf1pUFsRChFPS
 YaRJ6ZTPNZbn2JHO8qqNSq+z14T0v/9iIeuCk4jZZHW+d2bD47RhcYK55V1j+21s+y
 OrgeOillPmPnw==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
 id 63E212E00D6; Mon, 11 Aug 2025 07:13:56 -0400 (EDT)
Date: Mon, 11 Aug 2025 07:13:56 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20250811111356.GC984814@mit.edu>
References: <20250810075706.172910-1-ebiggers@kernel.org>
 <20250810075706.172910-10-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250810075706.172910-10-ebiggers@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Aug 10, 2025 at 12:57:02AM -0700, Eric Biggers wrote:
 > Move the fsverity_info pointer into the filesystem-specific part of the
 > inode by adding the field ext4_inode_info::i_verity_info and c [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ulQTp-0001GD-UV
Subject: Re: [f2fs-dev] [PATCH v5 09/13] ext4: move verity info pointer to
 fs-specific part of inode
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

On Sun, Aug 10, 2025 at 12:57:02AM -0700, Eric Biggers wrote:
> Move the fsverity_info pointer into the filesystem-specific part of the
> inode by adding the field ext4_inode_info::i_verity_info and configuring
> fsverity_operations::inode_info_offs accordingly.
> 
> This is a prerequisite for a later commit that removes
> inode::i_verity_info, saving memory and improving cache efficiency on
> filesystems that don't support fsverity.
> 
> Co-developed-by: Christian Brauner <brauner@kernel.org>
> Signed-off-by: Christian Brauner <brauner@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

Acked-by: Theodore Ts'o <tytso@mit.edu>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
