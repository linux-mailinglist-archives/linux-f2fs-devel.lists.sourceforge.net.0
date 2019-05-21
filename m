Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D65AF244F7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 May 2019 02:16:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSsSd-0002A3-Sa; Tue, 21 May 2019 00:16:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1hSsSc-00029p-Fx
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 May 2019 00:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4vTJHvBIMKFiwhht49E2K46TxAOFUOygU/QBDh4Aw4E=; b=ZuL41sXLiCjQU6d10H0AkheSBG
 2MeJQdc5RqfgmldCzJDzNorrEs4xaj7MM4+4/7jEKV8Kb4kIqiNiZpEAcDbzRs3TbktncMrrIxXAS
 FdoaC/gKsF7wQ2TpDMvV48ixqYLFHc9lsIVaFAlXCW3N5KkvK9eNxTFOqaExrW/wcH1c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4vTJHvBIMKFiwhht49E2K46TxAOFUOygU/QBDh4Aw4E=; b=AvlXApBA6Rk9jpsKw1lWWDQnw1
 LpYicaJ5NTTzKLVVJVf89mX6Ay63wFIgXkS0AuKeZzIjEs2Io8/PloXX7NqHXI1E1wbvWoj5Ddeur
 J8ae+Cbx+s+G2XHg2BWx9Zt4QvjuSpJi7ku8ThyhFhfjD3w5TEInR05+tE8NQcKGxR8I=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSsSa-00CsJ1-C7
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 May 2019 00:16:54 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-109.corp.google.com
 [104.133.0.109] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x4L0Gb9u032360
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 May 2019 20:16:37 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 99F31420027; Mon, 20 May 2019 20:16:36 -0400 (EDT)
Date: Mon, 20 May 2019 20:16:36 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190521001636.GA2369@mit.edu>
References: <20190520172552.217253-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520172552.217253-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hSsSa-00CsJ1-C7
Subject: Re: [f2fs-dev] [PATCH v6 00/16] fscrypt: key management improvements
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
Cc: linux-ext4@vger.kernel.org, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Satya Tangirala <satyat@google.com>, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, May 20, 2019 at 10:25:36AM -0700, Eric Biggers wrote:
> 
> This patchset makes major improvements to how keys are added, removed,
> and derived in fscrypt, aka ext4/f2fs/ubifs encryption.  It does this by
> adding new ioctls that add and remove encryption keys directly to/from
> the filesystem, and by adding a new encryption policy version ("v2")
> where the user-provided keys are only used as input to HKDF-SHA512 and
> are identified by their cryptographic hash.

Do you have userspace programs which use these new ioctl's?  What's
are testing strategy for these new ioctls?

Thanks,

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
