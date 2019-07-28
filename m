Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA927810F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Jul 2019 21:24:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hromh-0005ii-5B; Sun, 28 Jul 2019 19:24:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1hromg-0005ib-3j
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jul 2019 19:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3naE2C9RU+SdepUS5XARwsYrAqKyvh8qBy4QFyHKDFg=; b=Twy+0xVIcHgcIOUPnVw1FdVepT
 iE0ctwh0uweGGoVT56C6vGh+6rmGv5vYzKX1OWxi41KZy/qHe3/jiQHsOMQZYfnnTiwzKvI5t5BOZ
 c1pgrZ5BpB1CoYNmu5Kor3KBM+SDsBS6o2lt/yhFvkCUuW3xE7pG4YSE5aeyfxPd8Vpw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3naE2C9RU+SdepUS5XARwsYrAqKyvh8qBy4QFyHKDFg=; b=L/MXzaxcrZkauyC+nOi6pQDziL
 QZgrkQ8WsN6AGDXxI24XfWqq5FFK99K/3yc9KbXS2BN72nXe8JQUgzsk64TxSLI+fJ+gYg3sASfjf
 Ak7EBuouZ3DLFJXpRTgrTult/P1rdBTnHfdemu7sAD4SfTxJrvTopG+2dvoV93UvyV+g=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hromc-002CZh-Is
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jul 2019 19:24:42 +0000
Received: from callcc.thunk.org (96-72-102-169-static.hfc.comcastbusiness.net
 [96.72.102.169] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x6SJONer007423
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jul 2019 15:24:24 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 5848D4202F5; Sun, 28 Jul 2019 15:24:17 -0400 (EDT)
Date: Sun, 28 Jul 2019 15:24:17 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190728192417.GG6088@mit.edu>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-8-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726224141.14044-8-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hromc-002CZh-Is
Subject: Re: [f2fs-dev] [PATCH v7 07/16] fscrypt: add
 FS_IOC_REMOVE_ENCRYPTION_KEY ioctl
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
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 26, 2019 at 03:41:32PM -0700, Eric Biggers wrote:
> +	fscrypt_warn(NULL,
> +		     "%s: %zu inodes still busy after removing key with description %*phN, including ino %lu (%s)",

nit: s/inodes/inode(s)/

> +
> +/*
> + * Try to remove an fscrypt master encryption key.  If other users have also
> + * added the key, we'll remove the current user's usage of the key, then return
> + * -EUSERS.  Otherwise we'll continue on and try to actually remove the key.

Nit: this should be moved to patch #11

Also, perror(EUSERS) will display "Too many users" which is going to
be confusing.  I understand why you chose this; we would like to
distinguish between there are still inodes using this key, and there
are other users using this key.

Do we really need to return EUSERS in this case?  It's actually not an
*error* that other users are using the key.  After all, the unlink(2)
system call doesn't return an advisory error when you delete a file
which has other hard links.  And an application which does care about
this detail can always call FS_IOC_ENCRYPTION_KEY_STATUS() and check
user_count.

Other than these nits, looks good.  Feel free to add:

Reviewed-by: Theodore Ts'o <tytso@mit.edu>

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
