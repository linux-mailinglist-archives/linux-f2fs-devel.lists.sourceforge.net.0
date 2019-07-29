Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EA1795D0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2019 21:46:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hsBbk-00076J-1E; Mon, 29 Jul 2019 19:46:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hsBbi-00076B-MK
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 19:46:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6jO1YozPRUBmhPuSmQA0oshSqy+ZodGK4wjHoFQjjWc=; b=krxTy0FFk7v5qnMvsCwsS1AR/+
 B7EE1En5Z8bXuTz3godGmi5VP3vxq6700og487KcfOXThPsIoeVqmBfFv0jFAkF4q1SzGrfXZD0p1
 nSs3OQv6mr4wzfdKrSoxoaLvGHXvkl1TceG5XclFZSwOUxcW86KSTVO++GWDi4hz/LoQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6jO1YozPRUBmhPuSmQA0oshSqy+ZodGK4wjHoFQjjWc=; b=WUgI94wL+WamaVR6dn/o79PqFZ
 /tO+OTRdHWuozT806wwYYGtdi2QjYRLMRyvrguPDsA+HH459IyM7wB0Gk0BHPdZlBdkLe30xnoJE6
 3gudr1B/562sJkq/niOcQdJAI7lMSH0FwpCVNj5pSUM5HikMnIG5KGZjtKalQ14OdZFE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hsBbg-0042NS-MX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 19:46:54 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C031C205F4;
 Mon, 29 Jul 2019 19:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564429607;
 bh=8Slb/dcgJuOY+mm6dVYYikaN4v+qkAQ5N+ZwtSce/eI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r/QgV/Aa24jZcj1+VmNkDQtk9eYteOJ3HaDEJxXWAnq67HBQqoCgM4v64bpEo3cnW
 d1fLgk4VdQ6kcWFSM/MvQYxGQ2fT7ccgYrDTaxOtNdJ8pNCRzoXEdrLqM1gGUs5W5i
 cYniPprJp6BlXGrbGMSEofsXk1WX4mUaAEFckltY=
Date: Mon, 29 Jul 2019 12:46:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20190729194644.GE169027@gmail.com>
Mail-Followup-To: "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-api@vger.kernel.org,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>,
 Satya Tangirala <satyat@google.com>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-7-ebiggers@kernel.org>
 <20190728185003.GF6088@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190728185003.GF6088@mit.edu>
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
X-Headers-End: 1hsBbg-0042NS-MX
Subject: Re: [f2fs-dev] [PATCH v7 06/16] fscrypt: add
 FS_IOC_ADD_ENCRYPTION_KEY ioctl
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

On Sun, Jul 28, 2019 at 02:50:03PM -0400, Theodore Y. Ts'o wrote:
> On Fri, Jul 26, 2019 at 03:41:31PM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Add a new fscrypt ioctl, FS_IOC_ADD_ENCRYPTION_KEY.  This ioctl adds an
> > encryption key to the filesystem's fscrypt keyring ->s_master_keys,
> > making any files encrypted with that key appear "unlocked".
> 
> Note: it think it's going to be useful to make the keyring id
> available someplace like /sys/fs/<fs>/<blkdev>/keyring, or preferably
> in the new fsinfo system call.  Yes, the system administrator can paw
> through /proc/keys and try to figure it out, but it will be nicer if
> there's a direct way to do that.
> 
> For that matter, we could just add a new ioctl which returns the file
> system's keyring id.  That way an application program won't have to
> try to figure out what a file's underlying sb->s_id happens to be.
> (Especially if things like overlayfs are involved.)

Keep in mind that the new ioctls (FS_IOC_ADD_ENCRYPTION_KEY,
FS_IOC_REMOVE_ENCRYPTION_KEY, FS_IOC_GET_ENCRYPTION_KEY_STATUS) don't take the
keyring ID as a parameter, since it's already known from the filesystem the
ioctl is executed on.  So there actually isn't much that can be done with the
keyring ID.  But sure, if it's needed later we can add an API to get it.

> 
> > diff --git a/include/uapi/linux/fscrypt.h b/include/uapi/linux/fscrypt.h
> > index 29a945d165def..93d6eabaa7de4 100644
> > --- a/include/uapi/linux/fscrypt.h
> > +++ b/include/uapi/linux/fscrypt.h
> > +
> > +struct fscrypt_key_specifier {
> > +#define FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR	1
> > +	__u32 type;
> > +	__u32 __reserved;
> 
> Can you move the definition of FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR
> outside of the structure definition, and then add a comment about what
> is a "descriptor" key spec?  (And then in a later patch, please add a
> comment about what is an "identifier" key type.)  There's an
> explanation in Documentation/filesystems/fscrypt.rst, I know, but a
> one or two line comment plus a pointer to
> Documentation/filesystems/fscrypt.rst in the header file would be
> really helpful.

I'll add a brief comment that explains the key specifier.

I've already added a pointer to Documentation/filesystems/fscrypt.rst at the top
of the header (this was one of the cleanups in v6 => v7):

/*
 * fscrypt user API
 *
 * These ioctls can be used on filesystems that support fscrypt.  See the
 * "User API" section of Documentation/filesystems/fscrypt.rst.
 */

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
