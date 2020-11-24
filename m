Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7A32C1B47
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Nov 2020 03:09:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1khNlL-0003pT-Tx; Tue, 24 Nov 2020 02:08:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsiangkao@redhat.com>) id 1khNlK-0003pF-Lk
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Nov 2020 02:08:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WP+31OsU+5g/aMu0W36G+ShW7+TjC+8Wfm0ANAD2BDg=; b=YapD0ICpY8DoN5dfiwOFHdcf46
 p90FfcxjE/fWtZbJDADIgq7gf+R7v7tuH3buZos3sJ/3ixlaumkN8NSeAWubB+iEKgLitp7RD8JuM
 fSXQrfW/FvAnxbINHO4qmF5bHx6coUS/8P6FNFquY+LqQXtbMDtaPdSNj52GO5t9ceKc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WP+31OsU+5g/aMu0W36G+ShW7+TjC+8Wfm0ANAD2BDg=; b=MPtioyDdRYjF8hG4+yKtD+rGA6
 XKnA24N2OwsW0FhYHxavvfQGLDPNsgunhCRBkca3sKC32LCOhBeVB+EV0f0Kltpk3kSj27GIMJeJd
 Hf8UzOqQMz/fGGqB4N3MCaP5RNabbwSwfkOL5u9YUv0zo/l6clIDBBLZI9gvp0LxkqBM=;
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1khNlC-001UhF-8l
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Nov 2020 02:08:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606183723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WP+31OsU+5g/aMu0W36G+ShW7+TjC+8Wfm0ANAD2BDg=;
 b=Omzawp4LBQTOXb60gMvuoqPxw/4QckbL9RH0+Rq+hns94CW9t6fz89GtjFtg7Y95W7g+8L
 3I8ZbTT/n9WLAIspF/GP0SJp595Uq06uk+gQDGNBbx6THYMbL4zamGj6Veq4nF/iFWviPL
 2DY4fXcsVsZ1XSRG+GMX9jOQ3wc24x0=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-x53TKN2qNfayMx51y5QUqw-1; Mon, 23 Nov 2020 21:08:40 -0500
X-MC-Unique: x53TKN2qNfayMx51y5QUqw-1
Received: by mail-pf1-f199.google.com with SMTP id u3so14294263pfm.22
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Nov 2020 18:08:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WP+31OsU+5g/aMu0W36G+ShW7+TjC+8Wfm0ANAD2BDg=;
 b=Ex5V50iCw2q7GhLSr/0WYep1tLnr3cVCXiNsF/5lc4tyfw+Cgv2/SZDf+gkrKIDALh
 s2OwwUcDmhC9AXd+TWM6dypUptqf4VZ4Hi8GiY2c6c6IsYXTB0xxA5Ar0r33SSxIrF55
 ncEd0wfdAxuXt7y+PItIsbZ8YTKOKfDfYdMWkwPP7tlR5QRu3Uz3mWCavmLRz2+1KPT2
 vnm6gc1Tfe71tU1yFcFmo/vzGloC8xTkQnHvxmBUhRB9TjB0EE48Dv+unuQJgq8DYcKa
 sObesfgYrd5q9e7J+i3/nfN6Kr3gXO/z+EI4wm3qKHkoQJUFXU16aeBsGvkpDZEV/9Xu
 707Q==
X-Gm-Message-State: AOAM531s4nnX8RG+PVyELOUtcjNeAdsDwzVcicxIhkZ1rqhSWeGjbsY6
 jn5oEYd1RuiPxaam4cBLVkngw8qEcRFNg72/0iehwwczAlrtBLqaHh6WyvEZLECTRWy9cz6HSxX
 VJKgFFktkjSU/yZomD67Dh/92w/QKwEK51zwg/g==
X-Received: by 2002:a17:902:6b08:b029:d6:c471:8b5b with SMTP id
 o8-20020a1709026b08b02900d6c4718b5bmr1986829plk.78.1606183718983; 
 Mon, 23 Nov 2020 18:08:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5+igtPET/Dt98T/kKfa/91YJzxneE9zETKp3qe+D1ZXJ/z5cODpK8Yh/f0wMZsyQSBVZxXw==
X-Received: by 2002:a17:902:6b08:b029:d6:c471:8b5b with SMTP id
 o8-20020a1709026b08b02900d6c4718b5bmr1986811plk.78.1606183718720; 
 Mon, 23 Nov 2020 18:08:38 -0800 (PST)
Received: from xiangao.remote.csb ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id y3sm723148pjb.18.2020.11.23.18.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 18:08:38 -0800 (PST)
Date: Tue, 24 Nov 2020 10:08:24 +0800
From: Gao Xiang <hsiangkao@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20201124020824.GA3156301@xiangao.remote.csb>
References: <20201119060904.463807-1-drosen@google.com>
 <20201119060904.463807-3-drosen@google.com>
 <20201122051218.GA2717478@xiangao.remote.csb>
 <X7w9AO0x8vG85JQU@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <X7w9AO0x8vG85JQU@sol.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hsiangkao@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [63.128.21.124 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googlesource.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [63.128.21.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1khNlC-001UhF-8l
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
Cc: kernel-team@android.com, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Daniel Rosenberg <drosen@google.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 23, 2020 at 02:51:44PM -0800, Eric Biggers wrote:
> On Sun, Nov 22, 2020 at 01:12:18PM +0800, Gao Xiang wrote:
> > Hi all,
> > 
> > On Thu, Nov 19, 2020 at 06:09:03AM +0000, Daniel Rosenberg wrote:
> > > This shifts the responsibility of setting up dentry operations from
> > > fscrypt to the individual filesystems, allowing them to have their own
> > > operations while still setting fscrypt's d_revalidate as appropriate.
> > > 
> > > Most filesystems can just use generic_set_encrypted_ci_d_ops, unless
> > > they have their own specific dentry operations as well. That operation
> > > will set the minimal d_ops required under the circumstances.
> > > 
> > > Since the fscrypt d_ops are set later on, we must set all d_ops there,
> > > since we cannot adjust those later on. This should not result in any
> > > change in behavior.
> > > 
> > > Signed-off-by: Daniel Rosenberg <drosen@google.com>
> > > Acked-by: Eric Biggers <ebiggers@google.com>
> > > ---
> > 
> > ...
> > 
> > >  extern const struct file_operations ext4_dir_operations;
> > >  
> > > -#ifdef CONFIG_UNICODE
> > > -extern const struct dentry_operations ext4_dentry_ops;
> > > -#endif
> > > -
> > >  /* file.c */
> > >  extern const struct inode_operations ext4_file_inode_operations;
> > >  extern const struct file_operations ext4_file_operations;
> > > diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> > > index 33509266f5a0..12a417ff5648 100644
> > > --- a/fs/ext4/namei.c
> > > +++ b/fs/ext4/namei.c
> > > @@ -1614,6 +1614,7 @@ static struct buffer_head *ext4_lookup_entry(struct inode *dir,
> > >  	struct buffer_head *bh;
> > >  
> > >  	err = ext4_fname_prepare_lookup(dir, dentry, &fname);
> > > +	generic_set_encrypted_ci_d_ops(dentry);
> > 
> > One thing might be worth noticing is that currently overlayfs might
> > not work properly when dentry->d_sb->s_encoding is set even only some
> > subdirs are CI-enabled but the others not, see generic_set_encrypted_ci_d_ops(),
> > ovl_mount_dir_noesc => ovl_dentry_weird()
> > 
> > For more details, see:
> > https://android-review.googlesource.com/c/device/linaro/hikey/+/1483316/2#message-2e1f6ab0010a3e35e7d8effea73f60341f84ee4d
> > 
> > Just found it by chance (and not sure if it's vital for now), and
> > a kind reminder about this.
> > 
> 
> Yes, overlayfs doesn't work on ext4 or f2fs filesystems that have the casefold
> feature enabled, regardless of which directories are actually using casefolding.
> This is an existing limitation which was previously discussed, e.g. at
> https://lkml.kernel.org/linux-ext4/CAOQ4uxgPXBazE-g2v=T_vOvnr_f0ZHyKYZ4wvn7A3ePatZrhnQ@mail.gmail.com/T/#u
> and
> https://lkml.kernel.org/linux-ext4/20191203051049.44573-1-drosen@google.com/T/#u.
> 
> Gabriel and Daniel, is one of you still looking into fixing this?  IIUC, the
> current thinking is that when the casefolding flag is set on a directory, it's
> too late to assign dentry_operations at that point.  But what if all child
> dentries (which must be negative) are invalidated first, and also the filesystem
> forbids setting the casefold flag on encrypted directories that are accessed via
> a no-key name (so that fscrypt_d_revalidate isn't needed -- i.e. the directory
> would only go from "no d_ops" to "generic_ci_dentry_ops", not from
> "generic_encrypted_dentry_ops" to "generic_encrypted_ci_dentry_ops")?

From my limited knowledge about VFS, I think that is practical as well, since
we don't have sub-sub-dirs since all sub-dirs are negative dentries for empty dirs.
And if casefold ioctl is "dir inode locked", I think that would be fine (?)
I don't check the code though.

Thanks,
Gao Xiang

> 
> - Eric
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
