Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D4E71EE6C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 18:14:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4kw5-0004hL-7G;
	Thu, 01 Jun 2023 16:14:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1q4kw4-0004h0-9y
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 16:14:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZJvHyX75bsYrg59/xv8goVF/SY5G71ydpRI3Pzi5140=; b=EfEt8s8DKlR4VXCvGEWv6QiRR4
 4RJTSxzrp0lckCY9S0wXBC1stH5uSB48+IJ4mOwl4V648wrwofVY+IvHN/Flcq7iqq9Sw5WiVS8+H
 hticqK1n6PR/4/AT8+dXwPZ8aGo5WsBfls67EGdsRf8onR53u3ujKi+a4b2H8SQLJmlY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZJvHyX75bsYrg59/xv8goVF/SY5G71ydpRI3Pzi5140=; b=LtT9P5OIpDhdLMh/uImYfT0Aes
 HTPL+rL//tQHDuyi3+iIyjJyXEbWxRg2h2Rxtt3bvm0gzTfPGUjOxgqmsNGvvlSx4FvUhp9S53rY0
 vMfsheNBBWsHoJChCTBYuwKz2GDWHo2XWsDLlJkpaBS1OODKtG+f0ZegdrU2JC2JZz7E=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q4kw4-008Vr2-FW for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 16:14:01 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 43B861FDAE;
 Thu,  1 Jun 2023 16:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1685636034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZJvHyX75bsYrg59/xv8goVF/SY5G71ydpRI3Pzi5140=;
 b=PZvMYCMQoEFcCHiewgIaHWYAfeoz0QO179rgcwOwjwsxBWYW33SHzYTryDM5y3yV1ixTph
 umdfykUSKmqOqbf1ixpa7QLeLHr1SrJccO501Zz+AU9Ac1foS50ckQU1ZLD49ZZgKhjsew
 yB7DLoxcS+1UXGNtc8gNF6pmG8vlddg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1685636034;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZJvHyX75bsYrg59/xv8goVF/SY5G71ydpRI3Pzi5140=;
 b=U0R/ic9qdjSntJ85EPgaZNvIrEfLVWmdkxYGujNcma/HAtVChmBiwR7uULYLxv9tabZz/v
 WaBEdlTyPuVETvBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 323DB13441;
 Thu,  1 Jun 2023 16:13:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rhIgDMLDeGRlBQAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 01 Jun 2023 16:13:54 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id B0704A0754; Thu,  1 Jun 2023 18:13:53 +0200 (CEST)
Date: Thu, 1 Jun 2023 18:13:53 +0200
From: Jan Kara <jack@suse.cz>
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20230601161353.4o6but7hb7i7qfki@quack3>
References: <20230601104525.27897-1-jack@suse.cz>
 <20230601105830.13168-4-jack@suse.cz>
 <20230601-gebracht-gesehen-c779a56b3bf3@brauner>
 <20230601152449.h4ur5zrfqjqygujd@quack3>
 <c5f209a6263b4f039c5eafcafddf90ca@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5f209a6263b4f039c5eafcafddf90ca@AcuMS.aculab.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 01-06-23 15:37:32, David Laight wrote: > ... > > >
 > + * Lock any non-NULL argument. The caller must make sure that if he is
 passing > > > > + * in two directories, one is not ancestor of the o [...]
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q4kw4-008Vr2-FW
Subject: Re: [f2fs-dev] [PATCH v2 4/6] fs: Establish locking order for
 unrelated directories
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
Cc: Christian Brauner <brauner@kernel.org>, 'Jan Kara' <jack@suse.cz>,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 Al Viro <viro@ZenIV.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Ted Tso <tytso@mit.edu>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu 01-06-23 15:37:32, David Laight wrote:
> ...
> > > > + * Lock any non-NULL argument. The caller must make sure that if he is passing
> > > > + * in two directories, one is not ancestor of the other
> 
> Not directly relevant to this change but is the 'not an ancestor'
> check actually robust?
> 
> I found a condition in which the kernel 'pwd' code (which follows
> the inode chain) failed to stop at the base of a chroot.
> 
> I suspect that the ancestor check would fail the same way.

Honestly, I'm not sure how this could be the case but I'm not a dcache
expert. d_ancestor() works on dentries and the whole dcache code pretty
much relies on the fact that there always is at most one dentry for any
directory. Also in case we call d_ancestor() from this code, we have the
whole filesystem locked from any other directory moves so the ancestor
relationship of two dirs cannot change (which is different from pwd code
AFAIK). So IMHO no failure is possible in our case.

								Honza

> 
> IIRC the problematic code used unshare() to 'escape' from
> a network natespace.
> If it was inside a chroot (that wasn't on a mount point) there
> ware two copies of the 'chroot /' inode and the match failed.
> 
> I might be able to find the test case.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
