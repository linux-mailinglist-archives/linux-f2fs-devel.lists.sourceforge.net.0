Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1900B8ABDE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2019 02:16:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hxKU0-0002lM-H9; Tue, 13 Aug 2019 00:16:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1hxKTz-0002lE-7N
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Aug 2019 00:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rx2yfZ31VYZZLw5g2VKuIHTfReK415heQDkgEnx5Zu4=; b=VTdGgD47C2cwjleUA7p4/oY88j
 WZCezh+unSzXzo85IMw/8vR34LaJubmw9C1yew8uHG60ZRFgXgKGSAfO35DkWx0QCPrSKa6lAmd9Z
 Gigcl7MR366blhSQ3yXlOvWkQ5CJLexDT8i4tWWTGL4oeEfQA80k5OYZyhT2CMyorqCM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rx2yfZ31VYZZLw5g2VKuIHTfReK415heQDkgEnx5Zu4=; b=XF3TMTfcWXMkbR0P2DTn85LJYQ
 YvpQK6OW+OnzSUZtXE38CUiBNXRwQwljHVKCHZqyOf8ilPAb69JWhPLhPh9+6kCVCLDgrA1VbnCho
 fGKFxcZzAGDww6iJncyrfmLALj+QH66DrFajLfP9ME/WuaKJWU8yNlE3qwbzSUCzIkk4=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hxKTx-001lSz-Ik
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Aug 2019 00:16:11 +0000
Received: from callcc.thunk.org (guestnat-104-133-9-109.corp.google.com
 [104.133.9.109] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x7D0FuIa017672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Aug 2019 20:15:57 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id BDC084218EF; Mon, 12 Aug 2019 20:15:55 -0400 (EDT)
Date: Mon, 12 Aug 2019 20:15:55 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190813001555.GJ28705@mit.edu>
References: <20190805162521.90882-1-ebiggers@kernel.org>
 <20190805162521.90882-16-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805162521.90882-16-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hxKTx-001lSz-Ik
Subject: Re: [f2fs-dev] [PATCH v8 15/20] fscrypt: add
 FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS ioctl
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
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 05, 2019 at 09:25:16AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add a root-only variant of the FS_IOC_REMOVE_ENCRYPTION_KEY ioctl which
> removes all users' claims of the key, not just the current user's claim.
> I.e., it always removes the key itself, no matter how many users have
> added it.
> 
> This is useful for forcing a directory to be locked, without having to
> figure out which user ID(s) the key was added under.  This is planned to
> be used by a command like 'sudo fscrypt lock DIR --all-users' in the
> fscrypt userspace tool (http://github.com/google/fscrypt).
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good, thanks.   Feel free to add:

Reviewed-by: Theodore Ts'o <tytso@mit.edu>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
