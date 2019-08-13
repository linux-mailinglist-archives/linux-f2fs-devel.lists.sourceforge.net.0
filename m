Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF24B8ABCA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2019 02:07:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hxKL8-0003sR-92; Tue, 13 Aug 2019 00:07:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1hxKL6-0003s5-Kn
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Aug 2019 00:07:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YyG9PnbwMJNsWE4vIx/rOaDxSORnVaf5xc346PO8+XU=; b=BDLFtCpD838Q2bXO8x6ud3aF33
 hUQ3XO29+5eEfgoovYVHWksjutMCQusRAljhAfWDoUpzqQ0cNs+iuiBDlhG4DhX1HEQn+3AfCl3aV
 a7y/k/+i8G4lARczXJ2ihksbyvsriW+cmDx07Xi7+L4qG2TD/8+XMVRBeeyeBkzO/g8Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YyG9PnbwMJNsWE4vIx/rOaDxSORnVaf5xc346PO8+XU=; b=Au4hOAlJP2jfbUiNfXAlzBjlx2
 nYP9/AJS9qZKeyNowlTrK+wdRbAKpu20E6Zuq5McOG1tXLnohIIGompBFIIxhpI9eq4XKKZqSX/Yo
 CZ0yjTF/O10as3d6EF8fPLR1eXXNp1bW2Dz5X5kAhS1ZjWW8rGWCHHKYt25Vq2DEpJXc=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hxKL4-001k5a-SH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Aug 2019 00:07:00 +0000
Received: from callcc.thunk.org (guestnat-104-133-9-109.corp.google.com
 [104.133.9.109] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x7D06i57014906
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Aug 2019 20:06:46 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 3F35E4218EF; Mon, 12 Aug 2019 20:06:44 -0400 (EDT)
Date: Mon, 12 Aug 2019 20:06:44 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190813000644.GH28705@mit.edu>
References: <20190805162521.90882-1-ebiggers@kernel.org>
 <20190805162521.90882-11-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805162521.90882-11-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hxKL4-001k5a-SH
Subject: Re: [f2fs-dev] [PATCH v8 10/20] fscrypt: add
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
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> +		/* Some inodes still reference this key; try to evict them. */
> +		if (try_to_lock_encrypted_files(sb, mk) != 0)
> +			status_flags |=
> +				FSCRYPT_KEY_REMOVAL_STATUS_FLAG_FILES_BUSY;
> +	}

try_to_lock_encrypted_files() can return other errors besides -EBUSY;
in particular sync_filesystem() can return other errors, such as -EIO
or -EFSCORUPTED.  In that case, I think we're better off returning the
relevant status code back to the user.  We will have already wiped the
master key, but this situation will only happen in exceptional
conditions (e.g., user has ejected the sdcard, etc.), so it's not
worth it to try to undo the master key wipe to try to restore things
to the pre-ioctl execution state.

So I think we should capture the return code from
try_to_lock_encrypted_files, and if it is EBUSY, we can set FILES_BUSY
flag and return success.  Otherwise, we should return the error.

If you agree, please fix that up and then feel free to add:

Reviewed-by: Theodore Ts'o <tytso@mit.edu>

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
