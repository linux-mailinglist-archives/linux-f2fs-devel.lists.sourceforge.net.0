Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DA17E52E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Aug 2019 00:04:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1htJBm-0003e7-5u; Thu, 01 Aug 2019 22:04:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1htJBj-0003dh-90
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Aug 2019 22:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LiduyzEAaxUBrjKjYVl+7c6hXngrcD3Q04EyD/cmIPw=; b=Lghnpkdry3Tk+W0wZcVZPPHufB
 RDQeCdq1AaikjPz6naGzlnooIaz65vyJp3LQIiXX0kTB8Q5GdcbVANupkG+4xY2Xxf1lHCthV8vzm
 RfXQ21iz+Ax1q1ImDUQyh9EXt9+r1UOkrZgryUjSO8uXOHWRqA3hS3ek2uE/ni6sfpU0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LiduyzEAaxUBrjKjYVl+7c6hXngrcD3Q04EyD/cmIPw=; b=kwmYygkvBsHuVgPVHKP+N/3a+3
 QHSQQeLMKg8ZqCqTcXK5hsljbBkedQlOWV10K9ph9zMYa0X6uKqZj+xJIuNQ1R5UQcBaycwL6dp4f
 IxHm3uDlorb+p2ho2q3gSM9JsxOlFDuXOwjRFiDyQjDLLQsewXySihAhO5e6cP4FlpE4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1htJBh-006IB0-SZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Aug 2019 22:04:43 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E97252080C;
 Thu,  1 Aug 2019 22:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564697076;
 bh=07USxmiW0wtvQgurj28XmaQedZTzoWvNahQ2mQLPE40=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VyQIbpB73/IBrBsSm9YeYQnFLmTIy28sYuRF8s6RYL7nqJKJ112SS0SRAy86NcU0Y
 NUoU7/xJWwMVS7ybkxaoN3+1sgnzVsFJAVHL2LeNghpDv4XI/jzN86P/Jh7cd3rr4s
 z0PmTWHZGt4c9txOtJfO/FZcPvn5tty+jGDMKHLc=
Date: Thu, 1 Aug 2019 15:04:34 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20190801220432.GC223822@gmail.com>
Mail-Followup-To: "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-api@vger.kernel.org,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>,
 Satya Tangirala <satyat@google.com>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-8-ebiggers@kernel.org>
 <20190728192417.GG6088@mit.edu> <20190729195827.GF169027@gmail.com>
 <20190731183802.GA687@sol.localdomain>
 <20190731233843.GA2769@mit.edu>
 <20190801011140.GB687@sol.localdomain>
 <20190801053108.GD2769@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190801053108.GD2769@mit.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 3.4 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.5 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1htJBh-006IB0-SZ
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

On Thu, Aug 01, 2019 at 01:31:08AM -0400, Theodore Y. Ts'o wrote:
> On Wed, Jul 31, 2019 at 06:11:40PM -0700, Eric Biggers wrote:
> > 
> > Well, it's either
> > 
> > 1a. Remove the user's handle.
> > 	OR 
> > 1b. Remove all users' handles.  (FSCRYPT_REMOVE_KEY_FLAG_ALL_USERS)
> > 
> > Then
> > 
> > 2. If no handles remain, try to evict all inodes that use the key.
> > 
> > By "purge all keys" do you mean step (2)?  Note that it doesn't require root by
> > itself; root is only required to remove other users' handles (1b).
> 
> No, I was talking about 1b.  I'd argue that 1a and 1b should be
> different ioctl.  1b requires root, and 1a doesn't.
> 
[...]
> > 
> > Do you mean use a positive return value, or do you mean add an output field to
> > the struct passed to the ioctl?
> 
> I meant adding an output field.  I see EBUSY and EUSERS as status bits
> which *some* use cases might find useful.

Ted, would you be happy with the following API?

Removing keys
-------------

Two ioctls are available for removing a key that was added by
FS_IOC_ADD_ENCRYPTION_KEY: FS_IOC_REMOVE_ENCRYPTION_KEY and
FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS.  They differ only in cases
where v2 policy keys are added or removed by non-root users.

These ioctls don't work on keys that were added via the legacy
process-subscribed keyrings mechanism.

Before using these ioctls, read the `Kernel memory compromise`_
section for a discussion of the security goals and limitations of
these ioctls.

FS_IOC_REMOVE_ENCRYPTION_KEY
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The FS_IOC_REMOVE_ENCRYPTION_KEY ioctl removes a claim to an fscrypt
master encryption key from the filesystem, and possibly removes the
key itself.  It can be executed on any file or directory on the target
filesystem, but using the filesystem's root directory is recommended.
It takes in a pointer to a :c:type:`struct fscrypt_remove_key_arg`,
defined as follows::

    struct fscrypt_remove_key_arg {
            struct fscrypt_key_specifier key_spec;
    #define FSCRYPT_KEY_REMOVAL_STATUS_FLAG_OTHER_USERS     0x00000001
    #define FSCRYPT_KEY_REMOVAL_STATUS_FLAG_FILES_BUSY      0x00000002
            __u32 removal_status_flags;     /* output */
            __u32 __reserved[5];
    };

This structure must be zeroed, then initialized as follows:

- The key to remove is specified by ``key_spec``:

    - To remove a key used by v1 encryption policies, set
      ``key_spec.type`` to FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR and fill
      in ``key_spec.u.descriptor``.  To remove this type of key, the
      calling process must have the CAP_SYS_ADMIN capability in the
      initial user namespace.

    - To remove a key used by v2 encryption policies, set
      ``key_spec.type`` to FSCRYPT_KEY_SPEC_TYPE_IDENTIFIER and fill
      in ``key_spec.u.identifier``.  To remove this type of key, no
      privileges are needed.  However, users can only remove keys that
      they added themselves, subject to privileged override with
      FSCRYPT_REMOVE_KEY_FLAG_ALL_USERS.

For v2 policy keys, this ioctl is usable by non-root users.  However,
to make this possible, it actually just removes the current user's
claim to the key, undoing a single call to FS_IOC_ADD_ENCRYPTION_KEY.
Only after all claims are removed is the key really removed.

For example, if FS_IOC_ADD_ENCRYPTION_KEY was called with uid 1000,
then the key will be "claimed" by uid 1000, and
FS_IOC_REMOVE_ENCRYPTION_KEY will only succeed as uid 1000.  Or, if
both uids 1000 and 2000 added the key, then for each uid
FS_IOC_REMOVE_ENCRYPTION_KEY will only remove their own claim.  Only
once *both* are removed is the key really removed.  (Think of it like
unlinking a file that may have hard links.)

If FS_IOC_REMOVE_ENCRYPTION_KEY really removes the key, it will also
try to "lock" all files that had been unlocked with the key.  It won't
lock files that are still in-use.  If necessary, the ioctl can be
executed again later to retry locking any remaining files.

FS_IOC_REMOVE_ENCRYPTION_KEY returns 0 if either the key was removed
(but may still have files remaining to be locked), the user's claim to
the key was removed, or the key was already removed but had files
remaining to be the locked so the ioctl retried locking them.  In any
of these cases, ``removal_status_flags`` is filled in with the
following informational status flags:

- ``FSCRYPT_KEY_REMOVAL_STATUS_FLAG_OTHER_USERS``: set if only the
  user's claim to the key was removed, not the key itself
- ``FSCRYPT_KEY_REMOVAL_STATUS_FLAG_FILES_BUSY``: set if some file(s)
  are still in-use.  Not guaranteed to be set in the case where only
  the user's claim to the key was removed.

FS_IOC_REMOVE_ENCRYPTION_KEY can fail with the following errors:

- ``EACCES``: The FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR key specifier type
  was specified, but the caller does not have the CAP_SYS_ADMIN
  capability in the initial user namespace
- ``EINVAL``: invalid flags or key specifier type, or reserved bits
  were set
- ``ENOKEY``: the key object was not found at all, i.e. it was never
  added in the first place or was already fully removed including all
  files locked; or, the user does not have a claim to the key.
- ``ENOTTY``: this type of filesystem does not implement encryption
- ``EOPNOTSUPP``: the kernel was not configured with encryption
  support for this filesystem, or the filesystem superblock has not
  had encryption enabled on it

FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS is exactly the same as
FS_IOC_REMOVE_ENCRYPTION_KEY, except that for v2 policy keys, the
ALL_USERS version of the ioctl will remove all users' claims to the
key, not just the current user's.  I.e., the key itself will always be
removed, no matter how many users have added it.  This difference is
only meaningful if non-root users are adding and removing keys.

Because of this, FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS also requires
"root", namely the CAP_SYS_ADMIN capability in the initial user
namespace.  Otherwise it will fail with ``EACCES``.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
