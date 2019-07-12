Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 286CD6755E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jul 2019 21:28:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hm1D7-0006OH-44; Fri, 12 Jul 2019 19:28:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hm1Cy-0006Nv-7o
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jul 2019 19:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AG1vafrXQLPjaf35qXCkj4deKfVx1CBi9IWY1uzlGEM=; b=UDKx90ld+phxZelTANOzd3fyAl
 oHMKVQPDpt9fnS2ftZr5F02+mDPhBx3sohZlXdOH5zaE3TkCcKnsu7+rC0VJi0hZ/FkhXRWoNZ/DL
 4e8lYsaNNko3cJ6igHkd1GyQ2oYQhtThZqheU26CkFi7mBInbTk8IcV0bgGZ+l7cKj2c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AG1vafrXQLPjaf35qXCkj4deKfVx1CBi9IWY1uzlGEM=; b=NagNAzTK0YmjFGyW++/yckl9be
 fpiynDSFXLhU8n7GR7t+4VctnScaey+RARGiStjUnWoMCMvtCOWDFTTH+bc67qe8+vmfxznXofMOV
 HOiYORjEv+5f7hmUztl7U5S7bGEiNbPdLHzGqDXkT2dj2eUCs/b2UFoiSkTJ2tdNg92k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hm1Cw-00GrXU-Bt
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jul 2019 19:27:52 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6754B20989;
 Fri, 12 Jul 2019 19:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562959664;
 bh=lcWXCRidxlkH0JmHY4qLleFeg9EJ3bf23mFjlC/trOI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tG5wl9zVL4cC4F2Q0RoqpJrmGuBnXGgGFg3aMcHttglEUxaoLsUumr5rK0ZNpXCdA
 Y3Dn2SonlpNoHEiyJt+Rht2fbku24OgLGrSI0FSjroaRX+R/c3wqsL4jzdGj8mLPmN
 kdI/HCrGHZ/i+UnvLY4uEinW5BfhW8XDqPOWcrPU=
Date: Fri, 12 Jul 2019 12:27:42 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20190712192742.GB701@sol.localdomain>
Mail-Followup-To: Satya Tangirala <satyat@google.com>,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Parshuram Raju Thombare <pthombar@cadence.com>,
 Ladvine D Almeida <ladvine.dalmeida@synopsys.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20190710225609.192252-1-satyat@google.com>
 <20190710225609.192252-8-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190710225609.192252-8-satyat@google.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hm1Cw-00GrXU-Bt
Subject: Re: [f2fs-dev] [PATCH 7/8] fscrypt: wire up fscrypt to use
 blk-crypto
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
Cc: Ladvine D Almeida <ladvine.dalmeida@synopsys.com>,
 linux-scsi@vger.kernel.org, Parshuram Raju Thombare <pthombar@cadence.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Satya,

On Wed, Jul 10, 2019 at 03:56:08PM -0700, Satya Tangirala wrote:
> Introduce fscrypt_set_bio_crypt_ctx for filesystems to call to set up
> encryption contexts in bios, and fscrypt_evict_crypt_key to evict
> the encryption context associated with an inode.
> 
> Inline encryption is controlled by a policy flag in the fscrypt_info
> in the inode, and filesystems may check if an inode should use inline
> encryption by calling fscrypt_inode_is_inline_crypted. Files can be marked
> as inline encrypted from userspace by appropriately modifying the flags
> (OR-ing FS_POLICY_FLAGS_INLINE_ENCRYPTION to it) in the fscrypt_policy
> passed to fscrypt_ioctl_set_policy.
> 
> To test inline encryption with the fscrypt dummy context, add
> ctx.flags |= FS_POLICY_FLAGS_INLINE_ENCRYPTION
> when setting up the dummy context in fs/crypto/keyinfo.c.
> 
> Note that blk-crypto will fall back to software en/decryption in the
> absence of inline crypto hardware, so setting up the ctx.flags in the
> dummy context without inline crypto hardware serves as a test for
> the software fallback in blk-crypto.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>

Thanks for the new patches.  I implemented a ciphertext verification test for
this new encryption policy flag, using the framework for ciphertext verification
tests I added to xfstests a few months ago.  You can get it from here:
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/xfstests-dev.git/log/?h=inline-encryption
If you build a kvm-xfstests test appliance from that branch, the test can be run
with 'kvm-xfstests -c f2fs generic/700'.

Or better: run 'kvm-xfstests -c ext4,f2fs -g encrypt' to run all fscrypt tests
on ext4 and f2fs, including that one.  I recommend adding that to the testing
you do, if you haven't already.  Note that this is separate from running
xfstests with the "fscrypt dummy context" as you mention in the commit message;
see the new documentation at
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/filesystems/fscrypt.rst#n653

I found a bug.  The test passes when CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y, but
fails when CONFIG_FS_ENCRYPTION_INLINE_CRYPT=n, rather than being skipped.  This
is because the kernel incorrectly ignores the policy flag in the latter case and
produces the wrong ciphertext, rather than rejecting it in
FS_IOC_SET_ENCRYPTION_POLICY.  So that needs to be fixed.

> diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
> index 335a362ee446..58a01889fac7 100644
> --- a/fs/crypto/crypto.c
> +++ b/fs/crypto/crypto.c
> @@ -302,6 +302,10 @@ int fscrypt_decrypt_page(const struct inode *inode, struct page *page,
>  	if (!(inode->i_sb->s_cop->flags & FS_CFLG_OWN_PAGES))
>  		BUG_ON(!PageLocked(page));
>  
> +	/* If we have HW encryption, then this page is already decrypted */
> +	if (fscrypt_inode_is_inline_crypted(inode))
> +		return 0;
> +
>  	return fscrypt_do_page_crypto(inode, FS_DECRYPT, lblk_num, page, page,
>  				      len, offs, GFP_NOFS);
>  }

As I mentioned on v2, the purpose of this function is to decrypt the page.  The
filesystem also has to allocate a decryption context and schedule a workqueue
item specifically to call this -- only for it to be a no-op in this new case
this patch adds.  I think the more logical approach would be for the filesystem
to not call this at all if the inode is using inline encryption instead.

> +#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
> +bool fscrypt_inode_is_inline_crypted(const struct inode *inode)
> +{
> +	struct fscrypt_info *ci;
> +
> +	if (!inode)
> +		return false;
> +	ci = inode->i_crypt_info;
> +
> +	return ci && flags_inline_crypted(ci->ci_flags, inode);
> +}
> +EXPORT_SYMBOL(fscrypt_inode_is_inline_crypted);

What does it mean for the inode to be NULL here?

This also returns false whenever the inode's encryption key hasn't been set up,
even though the inode may use an encryption policy with the inline encryption
optimized flag set.  Why?  Also, because ->i_crypt_info is set locklessly, if
it's being dereferenced conditionally it needs to be loaded with READ_ONCE().

So I'm confused about exactly what this is trying to do, and the lack of a
kerneldoc comment doesn't help :-(

But AFAICS, this is only called if the encryption key is available.
So I think the following would be better:

bool fscrypt_inode_is_inline_crypted(const struct inode *inode)
{
	return flags_inline_crypted(inode->i_crypt_info->ci_flags, inode);
}

... or if it's also expected to handle unencrypted inodes,

bool fscrypt_inode_is_inline_crypted(const struct inode *inode)
{
	return IS_ENCRYPTED(inode) &&
	       flags_inline_crypted(inode->i_crypt_info->ci_flags, inode);
}

The problem with trying to be "safe" and check for NULL ->i_crypt_info is that
the fallback behavior this patch implements is to silently do the encryption
incorrectly.  I don't think that's a good idea.  If someone is incorrectly
calling this on an inode that hasn't had its key loaded yet, I'd much rather be
notified of the bug immediately and fix it.

> +
> +bool fscrypt_needs_fs_layer_crypto(const struct inode *inode)
> +{
> +	return IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode) &&
> +	       !fscrypt_inode_is_inline_crypted(inode);
> +}
> +EXPORT_SYMBOL(fscrypt_needs_fs_layer_crypto);

Can you please add a kerneldoc comment for all new functions in fs/crypto/ that
are exported to filesystems?

> +	/*
> +	 * TODO: expose inline encryption via some toggleable knob
> +	 * instead of as a policy?
> +	 */
> +	if (!inode->i_sb->s_cop->inline_crypt_supp &&
> +	    (policy->flags & FS_POLICY_FLAGS_INLINE_CRYPT))
> +		return -EINVAL;
> +

This TODO doesn't make sense; the policy flag is fine.

I think the name of the flag is still confusing things.  It's not enabling
inline encryption per se (that's an implementation detail), but rather an
on-disk format that's better suited for inline encryption.

How about renaming the flag to FS_POLICY_FLAG_INLINECRYPT_OPTIMIZED, like I
suggested on v2?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
