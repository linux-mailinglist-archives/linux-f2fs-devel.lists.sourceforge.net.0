Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 527212C1CCD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Nov 2020 05:38:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1khQ5b-0001JN-La; Tue, 24 Nov 2020 04:38:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1khQ5a-0001J9-F3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Nov 2020 04:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rx4OAu0r0wOEIPTUaL/toHZDV0s39zidE2jJpUJLhhE=; b=JAx5/dv4ujSlU37F7/9XJb4OvT
 qiHnvfx1v3jh5FNzC4sWwmJq2z+YsJTXQ0GSeSCYZL2HTvE0OiGj21tFERjTIcTfyDFITpmuIt9mK
 AmkfGGy36uMePunCdzJwsrIn4yQCESSxV4h44RCvEEq99XZRlCyZLpo1XfeRBrmIolsc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rx4OAu0r0wOEIPTUaL/toHZDV0s39zidE2jJpUJLhhE=; b=Znvb6+gUthZdOYSERgxuXk6NDU
 7SCdNYgtVQKm4cMc2oJVLECab69JHQw0CMf40jl+8HPoypUG0LiaJKL1jg00GuI5+QNElV8p6uEnA
 mztUrNPhoD1F80bY7UcpMZfKK4C7Ii9dipm44qWu7J/gPVgF6lcETqllVqX/3OTT6a3c=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1khQ5V-001lC1-0B
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Nov 2020 04:38:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id D57A11F4481C
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Eric Biggers <ebiggers@kernel.org>
Organization: Collabora
References: <20201119060904.463807-1-drosen@google.com>
 <20201119060904.463807-3-drosen@google.com>
 <20201122051218.GA2717478@xiangao.remote.csb>
 <X7w9AO0x8vG85JQU@sol.localdomain>
Date: Mon, 23 Nov 2020 23:37:45 -0500
In-Reply-To: <X7w9AO0x8vG85JQU@sol.localdomain> (Eric Biggers's message of
 "Mon, 23 Nov 2020 14:51:44 -0800")
Message-ID: <877dqbpdye.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googlesource.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1khQ5V-001lC1-0B
Subject: Re: [f2fs-dev] [PATCH v4 2/3] fscrypt: Have filesystems handle
 their d_ops
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Daniel Rosenberg <drosen@google.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 Gao Xiang <hsiangkao@redhat.com>, linux-ext4@vger.kernel.org,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:

> On Sun, Nov 22, 2020 at 01:12:18PM +0800, Gao Xiang wrote:
>> Hi all,
>> 
>> On Thu, Nov 19, 2020 at 06:09:03AM +0000, Daniel Rosenberg wrote:
>> > This shifts the responsibility of setting up dentry operations from
>> > fscrypt to the individual filesystems, allowing them to have their own
>> > operations while still setting fscrypt's d_revalidate as appropriate.
>> > 
>> > Most filesystems can just use generic_set_encrypted_ci_d_ops, unless
>> > they have their own specific dentry operations as well. That operation
>> > will set the minimal d_ops required under the circumstances.
>> > 
>> > Since the fscrypt d_ops are set later on, we must set all d_ops there,
>> > since we cannot adjust those later on. This should not result in any
>> > change in behavior.
>> > 
>> > Signed-off-by: Daniel Rosenberg <drosen@google.com>
>> > Acked-by: Eric Biggers <ebiggers@google.com>
>> > ---
>> 
>> ...
>> 
>> >  extern const struct file_operations ext4_dir_operations;
>> >  
>> > -#ifdef CONFIG_UNICODE
>> > -extern const struct dentry_operations ext4_dentry_ops;
>> > -#endif
>> > -
>> >  /* file.c */
>> >  extern const struct inode_operations ext4_file_inode_operations;
>> >  extern const struct file_operations ext4_file_operations;
>> > diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
>> > index 33509266f5a0..12a417ff5648 100644
>> > --- a/fs/ext4/namei.c
>> > +++ b/fs/ext4/namei.c
>> > @@ -1614,6 +1614,7 @@ static struct buffer_head *ext4_lookup_entry(struct inode *dir,
>> >  	struct buffer_head *bh;
>> >  
>> >  	err = ext4_fname_prepare_lookup(dir, dentry, &fname);
>> > +	generic_set_encrypted_ci_d_ops(dentry);
>> 
>> One thing might be worth noticing is that currently overlayfs might
>> not work properly when dentry->d_sb->s_encoding is set even only some
>> subdirs are CI-enabled but the others not, see generic_set_encrypted_ci_d_ops(),
>> ovl_mount_dir_noesc => ovl_dentry_weird()
>> 
>> For more details, see:
>> https://android-review.googlesource.com/c/device/linaro/hikey/+/1483316/2#message-2e1f6ab0010a3e35e7d8effea73f60341f84ee4d
>> 
>> Just found it by chance (and not sure if it's vital for now), and
>> a kind reminder about this.
>> 
>
> Yes, overlayfs doesn't work on ext4 or f2fs filesystems that have the casefold
> feature enabled, regardless of which directories are actually using casefolding.
> This is an existing limitation which was previously discussed, e.g. at
> https://lkml.kernel.org/linux-ext4/CAOQ4uxgPXBazE-g2v=T_vOvnr_f0ZHyKYZ4wvn7A3ePatZrhnQ@mail.gmail.com/T/#u
> and
> https://lkml.kernel.org/linux-ext4/20191203051049.44573-1-drosen@google.com/T/#u.
>
> Gabriel and Daniel, is one of you still looking into fixing this?

Eric,

overlayfs+CI has been on my todo list for over a year now, as I have a
customer who wants to mix them, but I haven't been able to get to it.
I'm sure I won't be able to get to it until mid next year, so if anyone
wants to tackle it, feel free to do it.


> IIUC, the current thinking is that when the casefolding flag is set on
> a directory, it's too late to assign dentry_operations at that point.

yes

> But what if all child dentries (which must be negative) are
> invalidated first,

I recall I tried this approach when I quickly looked over this last
year, but my limited vfs knowledge prevented me from getting something
working.  But it makes sense.

> and also the filesystem forbids setting the casefold flag on encrypted
> directories that are accessed via a no-key name (so that
> fscrypt_d_revalidate isn't needed -- i.e. the directory would only go
> from "no d_ops" to "generic_ci_dentry_ops", not from
> "generic_encrypted_dentry_ops" to "generic_encrypted_ci_dentry_ops")?




-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
