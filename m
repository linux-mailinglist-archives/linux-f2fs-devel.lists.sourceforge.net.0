Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D10008E0DA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Aug 2019 00:35:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hy1s4-0003Eu-FO; Wed, 14 Aug 2019 22:35:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hy1s2-0003EW-NF
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 22:35:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p4mYCSm7FPf8oAXPQgfyJ/2YskPYmI5SiigXfHhP8Ro=; b=A8mgU0bVI0y/WWnFjCmHvUIa7Q
 sM84SzSLcf+PGhr1m9vTIQIbsarW48TqzU8DwSqSohNDrb+LZ4d0wjr4LFmYs4pES1MnOIW5MmQvW
 rjGKby80V3aHdHnVJdjHiDQoXvtLFH3YV+fjiv0czlUQQNi7815RmDwcI0CmE2Q0aXi0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p4mYCSm7FPf8oAXPQgfyJ/2YskPYmI5SiigXfHhP8Ro=; b=aBS16OH3jIIhT8K1y7N0S79mrt
 akryNU8IPfKZ1Xgoy3IqSMX6bG6QS8ixTk8uv9R2D1aQk7cIOTekjoU/p0BUPhXxfzpUa2g9ha2aG
 T7+D07pt/znkBhY3oOFJ0EEEm5Y4loqwK7vJXJgtW7xGLBCJskX30vMElGhqQOfp6WM0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hy1s1-006Pjn-DA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 22:35:54 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 081B12064A;
 Wed, 14 Aug 2019 22:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565822145;
 bh=l8Slk/c9NCmIURt4vJ515GO1o+OGPytEBQ6mmXfsoCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HZrWel2TOGlxa/OLzSgK6FZYkC9k5fmPXmA7SczQPr/nZXF5fhlrN12mEtzuphrKx
 naClhxqMHYFXy1R/MsRWN561L+U0nJMj+RQmokWi+/oM+CwhuEESn4oiXIYXhBuZnf
 2ZHVbx8JH1SSewjdXfJj0RGtoca3cSvPVjunHj9Y=
Date: Wed, 14 Aug 2019 15:35:43 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20190814223542.GE101319@gmail.com>
Mail-Followup-To: "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 linux-api@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 Paul Crowley <paulcrowley@google.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190805162521.90882-1-ebiggers@kernel.org>
 <20190805162521.90882-11-ebiggers@kernel.org>
 <20190813000644.GH28705@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813000644.GH28705@mit.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 3.0 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.2 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hy1s1-006Pjn-DA
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

On Mon, Aug 12, 2019 at 08:06:44PM -0400, Theodore Y. Ts'o wrote:
> > +		/* Some inodes still reference this key; try to evict them. */
> > +		if (try_to_lock_encrypted_files(sb, mk) != 0)
> > +			status_flags |=
> > +				FSCRYPT_KEY_REMOVAL_STATUS_FLAG_FILES_BUSY;
> > +	}
> 
> try_to_lock_encrypted_files() can return other errors besides -EBUSY;
> in particular sync_filesystem() can return other errors, such as -EIO
> or -EFSCORUPTED.  In that case, I think we're better off returning the
> relevant status code back to the user.  We will have already wiped the
> master key, but this situation will only happen in exceptional
> conditions (e.g., user has ejected the sdcard, etc.), so it's not
> worth it to try to undo the master key wipe to try to restore things
> to the pre-ioctl execution state.
> 
> So I think we should capture the return code from
> try_to_lock_encrypted_files, and if it is EBUSY, we can set FILES_BUSY
> flag and return success.  Otherwise, we should return the error.
> 
> If you agree, please fix that up and then feel free to add:
> 
> Reviewed-by: Theodore Ts'o <tytso@mit.edu>
> 
> 						- Ted

Yes, that makes sense.  I've made the following change to this patch:

diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 9901593051424b..c3423f0edc7014 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -479,6 +479,7 @@ int fscrypt_ioctl_remove_key(struct file *filp, void __user *_uarg)
 	struct key *key;
 	struct fscrypt_master_key *mk;
 	u32 status_flags = 0;
+	int err;
 	bool dead;
 
 	if (copy_from_user(&arg, uarg, sizeof(arg)))
@@ -514,11 +515,15 @@ int fscrypt_ioctl_remove_key(struct file *filp, void __user *_uarg)
 		 * key object is free to be removed from the keyring.
 		 */
 		key_invalidate(key);
+		err = 0;
 	} else {
 		/* Some inodes still reference this key; try to evict them. */
-		if (try_to_lock_encrypted_files(sb, mk) != 0)
+		err = try_to_lock_encrypted_files(sb, mk);
+		if (err == -EBUSY) {
 			status_flags |=
 				FSCRYPT_KEY_REMOVAL_STATUS_FLAG_FILES_BUSY;
+			err = 0;
+		}
 	}
 	/*
 	 * We return 0 if we successfully did something: wiped the secret, or
@@ -527,7 +532,9 @@ int fscrypt_ioctl_remove_key(struct file *filp, void __user *_uarg)
 	 * including all files locked.
 	 */
 	key_put(key);
-	return put_user(status_flags, &uarg->removal_status_flags);
+	if (err == 0)
+		err = put_user(status_flags, &uarg->removal_status_flags);
+	return err;
 }
 EXPORT_SYMBOL_GPL(fscrypt_ioctl_remove_key);
 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
