Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4FAF2589
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Nov 2019 03:49:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iSXrd-0000VX-S9; Thu, 07 Nov 2019 02:49:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1iSXrb-0000VG-Tc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Nov 2019 02:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lvOc3mHpCw0OMRDiJ3FGdQqEeZNVl81FbmsoO/XI/Zs=; b=H7+4UxY38vWwePcSOddrIQK9g3
 2a3VjKFAYrzK5x2P+Q7Zx/brIiRUl5Ih9AuQYdHRfAWr/0+dvKt3ZX7RXOCLHhnPnkxgDuU/Gvu97
 kqy28SagZ5l5WP3tkuuFburEaiWT7479nwMpNfeS6mBjehVwYh2nRDQmJz3wIs2ac8Uc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lvOc3mHpCw0OMRDiJ3FGdQqEeZNVl81FbmsoO/XI/Zs=; b=cnzjSlJ3DTSLKume9y40K5XsE4
 PAOO1ONwLwWEzvDC8nWaB5cbj/Oy7K68G8WkdXhx0ku8aJ6Hcz0TGWbqdrO33p7HD6TygsUSDhiuC
 XMsHY2CXQvRIR83WVq5Wj140hAVoPyox/kt4X0HZ64C4HBW53LLFroIq7P/YqfrcZ1P0=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iSXrZ-0031n6-Sl
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Nov 2019 02:49:35 +0000
Received: from callcc.thunk.org (ip-12-2-52-196.nyc.us.northamericancoax.com
 [196.52.2.12]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id xA72nLni011638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 6 Nov 2019 21:49:22 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 799C4420311; Wed,  6 Nov 2019 21:49:19 -0500 (EST)
Date: Wed, 6 Nov 2019 21:49:19 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Satya Tangirala <satyat@google.com>, Paul Crowley <paulcrowley@google.com>,
 Paul Lawrence <paullawrence@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20191107024919.GH26959@mit.edu>
References: <20191024215438.138489-1-ebiggers@kernel.org>
 <20191024215438.138489-2-ebiggers@kernel.org>
 <20191106033544.GG26959@mit.edu>
 <20191106040519.GA705@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106040519.GA705@sol.localdomain>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iSXrZ-0031n6-Sl
Subject: Re: [f2fs-dev] [PATCH v2 1/3] fscrypt: add support for
 IV_INO_LBLK_64 policies
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 05, 2019 at 08:05:19PM -0800, Eric Biggers wrote:
> If we really wanted to optimize fscrypt_get_encryption_info(), I think we
> probably shouldn't try to microoptimize fscrypt_supported_policy(), but rather
> take advantage of the fact that fscrypt_has_permitted_context() already ran.
> E.g., we could cache the xattr, or skip both the keyring lookup and
> fscrypt_supported_policy() by grabbing them from the parent directory.

Yes, good point.  Certainly, if the parent is encrypted, given that we
force files to have the same policy as the containing directory,
there's no point calling fscrypt_supported_policy.  And if we're using
a policy which isn't using per-inode keys, then we can certainly just
grab the key from the parent directory.

				- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
